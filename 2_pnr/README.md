# OpenROAD APR Command Reference

This document provides detailed explanations of all commands used in the APR flow.

## Initial Setup Commands

### read_liberty
```tcl
read_liberty ../NanGate45/lib/NangateOpenCellLibrary_typical.lib
```
- Reads library files containing cell timing and power information
- Essential for timing analysis and power calculations
- Contains cell delay, power, and pin information

### read_lef
```tcl
read_lef ../NanGate45/lef/NangateOpenCellLibrary.tech.lef
read_lef ../NanGate45/lef/NangateOpenCellLibrary.macro.lef
```
- Reads technology and cell layout information
- `.tech.lef`: Contains layer definitions, design rules
- `.macro.lef`: Contains physical cell layouts
- Required for physical implementation

### read_verilog
```tcl
read_verilog ../1_synthesis/synthesized_alu.v
```
- Reads the synthesized netlist
- Contains gate-level connectivity
- Defines the logical structure of the design

### link_design
```tcl
link_design alu
```
- Links the netlist with library cells
- Establishes hierarchy
- Checks for unconnected cells/pins

### read_sdc
```tcl
read_sdc ./constraints.sdc
```
- Reads timing constraints
- Defines clock characteristics
- Sets input/output delays
- Specifies timing exceptions

## Floorplan Commands

### initialize_floorplan
```tcl
initialize_floorplan \
    -site FreePDK45_38x28_10R_NP_162NW_34O \
    -die_area "0 0 50 50" \
    -core_area "10 10 40 40"
```
- `-site`: Specifies standard cell site name
- `-die_area`: Total chip dimensions (x1 y1 x2 y2)
- `-core_area`: Placeable area for cells (x1 y1 x2 y2)
- Alternative options include `-utilization` and `-aspect_ratio`

### tapcell
```tcl
tapcell \
    -endcap_master "TAPCELL_X1" \
    -distance 15 \
    -halo_width_x 1 \
    -halo_width_y 1 \
    -tapcell_master "TAPCELL_X1"
```
- `-endcap_master`: Cell used at row ends
- `-distance`: Maximum distance between tap cells
- `-halo_width_x/y`: Space around macro cells
- `-tapcell_master`: Cell used for well taps
- Prevents latch-up issues

## Power Planning Commands

### add_global_connection
```tcl
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {^VDD$} -power
```
- `-net`: Power/ground net name
- `-inst_pattern`: Instance name pattern (regex)
- `-pin_pattern`: Pin name pattern (regex)
- `-power/-ground`: Specifies net type

### define_pdn_grid
```tcl
define_pdn_grid -name {grid} -voltage_domains {CORE}
```
- `-name`: Grid name for reference
- `-voltage_domains`: Power domain assignment

### add_pdn_stripe
```tcl
add_pdn_stripe -grid {grid} \
    -layer {metal4} \
    -width {0.47} \
    -pitch {10.0} \
    -offset {2.8}
```
- `-grid`: Reference to PDN grid
- `-layer`: Metal layer for stripes
- `-width`: Stripe width
- `-pitch`: Distance between stripes
- `-offset`: Starting offset
- `-extend_to_core_ring`: Connect to core ring

### add_pdn_ring
```tcl
add_pdn_ring -grid {grid} \
    -layers {metal9 metal10} \
    -widths {0.8 0.8} \
    -spacings {1 1} \
    -core_offsets {1.0 1.0}
```
- `-layers`: Metal layers for ring
- `-widths`: Ring width per layer
- `-spacings`: Space between power/ground
- `-core_offsets`: Distance from core boundary

### pdngen
```tcl
pdngen
```
- Generates complete power network
- Creates all necessary vias
- Connects all PDN structures

## Pin Placement Commands

### set_io_pin_constraint
```tcl
set_io_pin_constraint -pin_names {clk} -region {top:*}
```
- `-pin_names`: List of pins
- `-region`: Placement region (top/bottom/left/right)
- `-group`: Group related pins
- `-order`: Maintain pin order in group

### place_pins
```tcl
place_pins -hor_layers metal3 -ver_layers metal4
```
- `-hor_layers`: Layers for horizontal edges
- `-ver_layers`: Layers for vertical edges
- Places pins according to constraints

## Placement Commands

### global_placement
```tcl
global_placement \
    -timing_driven \
    -routability_driven \
    -density 0.7 \
    -pad_left 2 \
    -timing_driven_net_weight_max 1.5
```
- `-timing_driven`: Optimize for timing
- `-routability_driven`: Consider routing congestion
- `-density`: Target placement density
- `-pad_left/right`: Spacing between cells
- `-timing_driven_net_weight_max`: Maximum timing weight

### detailed_placement
```tcl
detailed_placement
```
- Legalizes cell positions
- Removes overlaps
- Aligns to rows/sites

### repair_design
```tcl
repair_design \
    -max_wire_length 50 \
    -max_utilization 0.6 \
    -slew_margin 0.2 \
    -cap_margin 0.2
```
- `-max_wire_length`: Maximum allowed wire length
- `-max_utilization`: Density target
- `-slew_margin`: Transition time margin
- `-cap_margin`: Capacitance margin

## Clock Tree Synthesis Commands

### clock_tree_synthesis
```tcl
clock_tree_synthesis \
    -buf_list {CLKBUF_X1 CLKBUF_X2 CLKBUF_X3} \
    -root_buf CLKBUF_X3 \
    -tree_buf CLKBUF_X2 \
    -sink_clustering_size 4
```
- `-buf_list`: Available buffer cells
- `-root_buf`: Buffer at clock root
- `-tree_buf`: Buffers in tree
- `-sink_clustering_size`: Sinks per cluster
- `-balance_levels`: Balance tree depths

### repair_timing
```tcl
repair_timing -hold \
    -hold_margin 0.1 \
    -max_buffer_percent 30
```
- `-hold/-setup`: Violation type
- `-hold_margin`: Timing margin
- `-max_buffer_percent`: Buffer insertion limit
- `-allow_setup_violations`: Priority to hold fixes

## Routing Commands

### global_route
```tcl
global_route \
    -congestion_iterations 150 \
    -critical_nets_percentage 25
```
- `-congestion_iterations`: Congestion solver iterations
- `-critical_nets_percentage`: Priority nets
- Creates routing guides

### detailed_route
```tcl
detailed_route \
    -output_maze maze_route.log \
    -output_drc drc_violations.rpt \
    -min_access_points 3
```
- `-output_maze`: Routing algorithm log
- `-output_drc`: DRC violation report
- `-min_access_points`: Pin access points
- Creates actual metal connections

## Output Generation Commands

### write_def
```tcl
write_def ./final/alu_final.def
```
- Writes physical design data
- Contains cell placement and routing

### write_verilog
```tcl
write_verilog ./final/alu_final.v -sort
```
- Writes final netlist
- `-sort`: Sorts instances/nets
- `-remove_cells`: Excludes specified cells

### write_spef
```tcl
write_spef ./final/alu_final.spef
```
- Writes parasitic data
- Contains RC parasitics
- Used for timing analysis

### write_sdf
```tcl
write_sdf ./final/alu_final.sdf
```
- Writes timing delays
- Contains cell and net delays
- Used for simulation

## Analysis Commands

### check_placement
```tcl
check_placement -verbose
```
- Verifies legal placement
- Checks for overlaps
- Ensures row alignment

### check_power_grid
```tcl
check_power_grid -net VDD
```
- Verifies power network
- Checks connectivity
- Identifies floating pins

### analyze_power_grid
```tcl
analyze_power_grid -net VDD -enable_em
```
- Performs IR drop analysis
- Checks current density
- Identifies potential EM issues

### report_timing
```tcl
report_worst_slack -max
report_tns
report_wns
```
- Reports timing metrics
- Shows critical paths
- Identifies violations

# Repair and Utility Functions Reference

## Utility Functions (utility.tcl)

### load_design_data
```tcl
proc load_design_data {} {
    read_liberty ../NanGate45/lib/NangateOpenCellLibrary_typical.lib
    read_lef ../NanGate45/lef/NangateOpenCellLibrary.tech.lef
    read_lef ../NanGate45/lef/NangateOpenCellLibrary.macro.lef
    read_verilog ../1_synthesis/synthesized_alu.v
    link_design alu
    read_sdc ./constraints.sdc
}
```
Purpose:
- Centralizes design data loading
- Loads all necessary technology files
- Sets up initial design state
- Links design with technology libraries

### checkpoint_stage
```tcl
proc checkpoint_stage {stage_name} {
    set stage_dir "stages/${stage_name}"
    file mkdir $stage_dir
    write_db "${stage_dir}/${stage_name}.odb"
    generate_timing_reports $stage_name
}
```
Purpose:
- Creates checkpoint at major design stages
- Saves design database
- Generates timing reports
- Creates organized directory structure
Options:
- `stage_name`: Name of the design stage (e.g., "floorplan", "cts")

### restore_stage
```tcl
proc restore_stage {stage_name} {
    set db_file "stages/${stage_name}/${stage_name}.odb"
    if {[file exists $db_file]} {
        read_db $db_file
        # Reloads necessary tech files
    }
}
```
Purpose:
- Restores design to previous checkpoint
- Reloads technology files
- Useful for design exploration
Options:
- `stage_name`: Name of the stage to restore

### generate_timing_reports
```tcl
proc generate_timing_reports {stage_name} {
    set report_dir "stages/${stage_name}/reports"
    # Generates various timing reports
}
```
Purpose:
- Creates comprehensive timing reports
- Analyzes setup/hold violations
- Reports design rule violations
- Saves reports in organized structure
Generated Reports:
- Worst setup/hold slack
- Total negative slack
- Worst negative slack
- Detailed timing paths
- Design rule violations

### check_stage_timing
```tcl
proc check_stage_timing {stage_name} {
    # Analyzes and displays timing metrics
}
```
Purpose:
- Displays critical timing metrics
- Shows number of violations
- Provides quick timing overview
Metrics Displayed:
- Setup/Hold slack
- TNS (Total Negative Slack)
- WNS (Worst Negative Slack)
- Number of violations

## Repair Functions (repair.tcl)

### fix_antennas
```tcl
proc fix_antennas {diode_cell args} {
    global_route -start_incremental
    repair_antennas $diode_cell -iterations 2 -ratio_margin 1.0
    global_route -end_incremental
}
```
Purpose:
- Fixes antenna rule violations
- Inserts diode cells
- Updates routing after fixes
Options:
- `diode_cell`: Cell to use for antenna fixes
- `-iterations`: Number of repair attempts
- `-ratio_margin`: Margin for antenna ratio

### optimize_clock_inverters
```tcl
proc optimize_clock_inverters {} {
    global_route -start_incremental
    repair_clock_inverters
    detailed_placement
    global_route -end_incremental
}
```
Purpose:
- Optimizes clock tree inverters
- Improves clock tree quality
- Maintains legal placement
Steps:
1. Starts incremental routing
2. Repairs clock inverters
3. Legalizes placement
4. Completes routing

### optimize_clock_nets
```tcl
proc optimize_clock_nets {{max_wire_length 100}} {
    global_route -start_incremental
    repair_clock_nets -max_wire_length $max_wire_length
    detailed_placement
    global_route -end_incremental
}
```
Purpose:
- Optimizes clock network routing
- Limits wire lengths
- Improves clock tree quality
Options:
- `max_wire_length`: Maximum allowed wire length

### optimize_design
```tcl
proc optimize_design {{max_wire_length 100} {util 0.9} {slew_margin 0.1} {cap_margin 0.1}} {
    global_route -start_incremental
    remove_buffers
    repair_design
    detailed_placement
    global_route -end_incremental
}
```
Purpose:
- Comprehensive design optimization
- Removes/replaces buffers
- Fixes timing violations
- Maintains legal placement
Options:
- `max_wire_length`: Maximum wire length
- `util`: Target utilization
- `slew_margin`: Transition time margin
- `cap_margin`: Capacitance margin

### fix_pdn_vias
```tcl
proc fix_pdn_vias {} {
    repair_pdn_vias -all
}
```
Purpose:
- Repairs power delivery network vias
- Ensures proper power connectivity
- Fixes via spacing violations

### fix_tie_fanout
```tcl
proc fix_tie_fanout {lib_port {max_fanout 50} {separation 5}} {
    repair_tie_fanout $lib_port \
        -separation $separation \
        -max_fanout $max_fanout
}
```
Purpose:
- Repairs tie-high/tie-low cell fanout
- Maintains maximum fanout limits
- Controls cell separation
Options:
- `lib_port`: Library cell port (e.g., "LOGIC1_X1/Z")
- `max_fanout`: Maximum allowed fanout
- `separation`: Minimum distance between cells

### optimize_timing
```tcl
proc optimize_timing {} {
    # Complex timing optimization procedure
}
```
Purpose:
- Comprehensive timing optimization
- Fixes setup/hold violations
- Iterative improvement process
Features:
- Initial timing analysis
- Setup time optimization
- Hold time optimization
- Placement legalization
- Detailed routing
Steps:
1. Analyzes initial timing state
2. Fixes setup violations
3. Fixes hold violations
4. Legalizes placement
5. Performs detailed routing
6. Iterates until timing met or max iterations reached

Maximum Iterations: 10
Success Criteria:
- No setup violations
- No hold violations
- Legal placement
- DRC clean routing

### Error Handling
All repair functions include:
- Error checking
- Status reporting
- Violation counting
- Progress updates