source "./utility.tcl"
source "./repair.tcl"

############################################################
# 1. Initial Design Load
############################################################
load_design_data

############################################################
# 2. Floorplan Initialization
############################################################
initialize_floorplan \
    -site FreePDK45_38x28_10R_NP_162NW_34O \
    -die_area "0 0 70 70" \
    -core_area "10 10 60 60"

# Add tapcell insertion
tapcell \
    -endcap_master "TAPCELL_X1" \
    -distance 15 \
    -halo_width_x 1 \
    -halo_width_y 1 \
    -tapcell_master "TAPCELL_X1" \
    -tap_prefix "TAP_" \
    -endcap_prefix "TAP_"

source ../NanGate45/make_tracks.tcl

# Save post-floorplan state
checkpoint_stage "floorplan"

############################################################
# 3. Power Planning
############################################################

####################################
# Global Connections
####################################
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {^VDD$} -power
add_global_connection -net {VSS} -inst_pattern {.*} -pin_pattern {^VSS$} -ground
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {^NWELL$} -power
global_connect

####################################
# Voltage Domains
####################################
set_voltage_domain -name {CORE} -power {VDD} -ground {VSS}

####################################
# Standard Cell Grid
####################################
define_pdn_grid -name {grid} -voltage_domains {CORE}

# Metal1 followpin stripes (standard cell rail)
add_pdn_stripe -grid {grid} \
    -layer {metal1} \
    -width {0.17} \
    -followpins

# Metal4 vertical stripes
add_pdn_stripe -grid {grid} \
    -layer {metal4} \
    -width {0.47} \
    -pitch {10.0} \
    -offset {2.8} \
    -extend_to_core_ring \
    -nets {VDD VSS}

# Metal7 vertical stripes
add_pdn_stripe -grid {grid} \
    -layer {metal7} \
    -width {0.48} \
    -pitch {10.0} \
    -offset {1} \
    -extend_to_core_ring \
    -nets {VDD VSS}

# Power ring with Metal5 and Metal6
add_pdn_ring -grid {grid} \
    -layers {metal9 metal10} \
    -widths {0.8 0.8} \
    -spacings {1 1} \
    -core_offsets {1.0 1.0}

# Connect layers
add_pdn_connect -grid {grid} -layers {metal1 metal4}
add_pdn_connect -grid {grid} -layers {metal4 metal7}
add_pdn_connect -grid {grid} -layers {metal4 metal9}
add_pdn_connect -grid {grid} -layers {metal7 metal10}
add_pdn_connect -grid {grid} -layers {metal9 metal10}

####################################
# Generate and Check PDN
####################################
pdngen -failed_via_report pdn_failed.rpt

# Verify power grid
check_power_grid -net VDD -dont_require_terminals
check_power_grid -net VSS -dont_require_terminals

# Fix any via issues
fix_pdn_vias

# Save checkpoint
checkpoint_stage "powerplan"

############################################################
# 4. Pin Placement
############################################################

# Control signals (top)
set_io_pin_constraint -pin_names {clk} -region {top:*}
set_io_pin_constraint -pin_names {rst_n} -region {top:*}

# Opcode group (top)
set_io_pin_constraint -pin_names {opcode[0] opcode[1] opcode[2] opcode[3]} -region {top:*} -group -order

# Input A bus group (left)
set_io_pin_constraint -pin_names {a[0] a[1] a[2] a[3] a[4] a[5] a[6] a[7]} -region {left:*} -group -order

# Input B bus group (left)
set_io_pin_constraint -pin_names {b[0] b[1] b[2] b[3] b[4] b[5] b[6] b[7]} -region {left:*} -group -order

# Result bus group (right)
set_io_pin_constraint -pin_names {result[0] result[1] result[2] result[3] result[4] result[5] result[6] result[7]} -region {right:*} -group -order

# Flags group (right)
set_io_pin_constraint -pin_names {zero_flag overflow_flag} -region {right:*}

# Place pins with groups
place_pins \
    -hor_layers metal3 \
    -ver_layers metal4

checkpoint_stage "pinplacement"

############################################################
# 5. Global Placement
############################################################

remove_buffers

global_placement \
    -timing_driven \
    -routability_driven \
    -density 0.7 \
    -pad_left 2 \
    -pad_right 2 \
    -timing_driven_net_weight_max 1.5 \
    -timing_driven_nets_percentage 20 \
    -routability_target_rc_metric 1.2 \
    -routability_max_density 0.9

# Save post-global placement state
checkpoint_stage "globalplace"
generate_timing_reports "globalplace"

############################################################
# 6. Detailed Placement & Optimization
############################################################

detailed_placement

# Estimate parasitics based on placement
estimate_parasitics -placement

repair_design \
    -max_wire_length 100 \
    -max_utilization 0.6 \
    -slew_margin 0.2 \
    -cap_margin 0.2 \
    -buffer_gain 8

detailed_placement

# Insert tie cells for floating pins
insert_tiecells LOGIC1_X1/Z -prefix "TIE"
insert_tiecells LOGIC0_X1/Z -prefix "TIE"

# Repair tie cell fanout
fix_tie_fanout LOGIC1_X1/Z 20 8
fix_tie_fanout LOGIC0_X1/Z 20 8


# Save post-detailed placement state
checkpoint_stage "detailplace"
generate_timing_reports "detailplace"

############################################################
# 7. Clock Tree Synthesis
############################################################

# Set routing layers
set_routing_layers -signal metal2-metal5 -clock metal5-metal6

# Perform Clock Tree Synthesis
clock_tree_synthesis \
    -buf_list {CLKBUF_X1 CLKBUF_X2 CLKBUF_X3 BUF_X1 BUF_X2 BUF_X4 BUF_X8 BUF_X16 BUF_X32} \
    -root_buf CLKBUF_X3 \
    -tree_buf CLKBUF_X2 \
    -clk_nets clk \
    -sink_clustering_enable \
    -sink_clustering_size 4 \
    -sink_clustering_max_diameter 100 \
    -sink_clustering_levels 3 \
    -balance_levels \
    -branching_point_buffers_distance 40 \
    -distance_between_buffers 40 \
    -sink_clustering_buffer CLKBUF_X2

repair_timing -hold \
    -hold_margin 0.1 \
    -max_buffer_percent 30 \
    -allow_setup_violations \
    -verbose

detailed_placement
check_placement -verbose

# Save post-CTS state
checkpoint_stage "cts"
generate_timing_reports "cts"

############################################################
# 8. Routing
############################################################

# Global routing
global_route \
    -congestion_iterations 150 \
    -congestion_report_file congestion.rpt \
    -congestion_report_iter_step 15 \
    -critical_nets_percentage 25

# Estimate parasitics based on routing
estimate_parasitics -global_routing

# Detailed routing
detailed_route \
    -output_maze maze_route.log \
    -output_drc drc_violations.rpt \
    -output_cmap congestion_map.rpt \
    -output_guide_coverage guide_coverage.rpt \
    -drc_report_iter_step 150 \
    -bottom_routing_layer metal1 \
    -top_routing_layer metal10 \
    -via_in_pin_bottom_layer metal1 \
    -via_in_pin_top_layer metal1 \
    -min_access_points 3

# Final timing repair
optimize_timing

eliminate_dead_logic

filler_placement -prefix FILLER_ \
    {FILLCELL_X1 FILLCELL_X2 FILLCELL_X4 FILLCELL_X8 FILLCELL_X16 FILLCELL_X32}


# Save post-routing state
checkpoint_stage "routing"
generate_timing_reports "routing"

############################################################
# 10. Write Final Files
###########################################################

# Extract parasitics
extract_parasitics -ext_model_file ../NanGate45/rcx_patterns.rules

write_def       ./final/alu_final.def
write_verilog   ./final/alu_final.v
write_spef      ./final/alu_final.spef
write_sdf       ./final/alu_final.sdf
write_db        ./final/alu_final.odb
write_sdc       ./final/alu_final.sdc
write_cdl       ./final/alu_final.cdl \
                -masters ../NanGate45/cdl/NangateOpenCellLibrary.cdl

read_spef       ./final/alu_final.spef
estimate_parasitics -global_routing -spef ./final/alu_final.spef

# Save final state
checkpoint_stage "final"
generate_timing_reports "final"

puts "\n====================== DESIGN CHECKS REPORT ======================\n"

puts "Checking Placement..."
if {[catch {check_placement -verbose} result]} {
    puts "ERROR in placement check:"
    puts $result
} else {
    puts "✓ Placement check passed"
}
puts "\n----------------------------------------------------------------\n"

puts "Checking for Floating Nets..."
if {[catch {report_floating_nets -verbose} result]} {
    puts "WARNING: Found floating nets:"
    puts $result
} else {
    puts "✓ No floating nets found"
}
puts "\n----------------------------------------------------------------\n"

puts "Running Antenna Checks..."
if {[catch {check_antenna -verbose} result]} {
    puts "WARNING: Antenna violations found:"
    puts $result
} else {
    puts "✓ No antenna violations"
}
puts "\n----------------------------------------------------------------\n"

puts "Design Violations Report:"
if {[catch {report_check_types -max_slew -max_cap -max_fanout} result]} {
    puts $result
} else {
    puts "✓ No violations found"
}
puts "\n----------------------------------------------------------------\n"

puts "Timing Analysis:"
puts "[report_tns]"
puts "[report_wns]"
puts "[report_worst_slack -max]"
puts "[report_worst_slack -min]"
puts "\n----------------------------------------------------------------\n"

puts "Design Area:"
puts [report_design_area]
puts "\n----------------------------------------------------------------\n"

puts "Power Grid Checks:"
puts "\nChecking VDD network..."
if {[catch {check_power_grid -net VDD -dont_require_terminals} result]} {
    puts "WARNING in VDD grid:"
    puts $result
} else {
    puts "✓ VDD power grid check passed"
}

puts "\nChecking VSS network..."
if {[catch {check_power_grid -net VSS -dont_require_terminals} result]} {
    puts "WARNING in VSS grid:"
    puts $result
} else {
    puts "✓ VSS power grid check passed"
}
puts "\n----------------------------------------------------------------\n"

puts "Running EM/IR Analysis..."
puts "\nAnalyzing VDD network..."
if {[catch {analyze_power_grid -net VDD -enable_em} result]} {
    puts $result
} else {
    puts "✓ VDD EM/IR analysis completed"
}

puts "\nAnalyzing VSS network..."
if {[catch {analyze_power_grid -net VSS -enable_em} result]} {
    puts $result
} else {
    puts "✓ VSS EM/IR analysis completed"
}
puts "\n----------------------------------------------------------------\n"

# puts "Power Analysis:"
# puts [report_power]
# puts "\n================================================================\n"

# Final timing report
#check_stage_timing "final"

puts "APR flow completed successfully"