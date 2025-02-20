#!/usr/bin/tclsh

proc load_design_data {} {

    # Read Liberty Files
    read_liberty ../NanGate45/lib/NangateOpenCellLibrary_typical.lib

    # Read Tech & Cell LEFs
    read_lef ../NanGate45/lef/NangateOpenCellLibrary.tech.lef
    read_lef ../NanGate45/lef/NangateOpenCellLibrary.macro.lef
    read_lef ../NanGate45/lef/NangateOpenCellLibrary.macro.mod.lef
    read_lef ../NanGate45/lef/NangateOpenCellLibrary.macro.rect.lef
    
    
    # Read Design
    read_verilog ../1_synthesis/synthesized_alu.v
    link_design alu
    
    # Read SDC
    read_sdc ./constraints.sdc
    
    source ../NanGate45/make_tracks.tcl
    source ../NanGate45/setRC.tcl
}

# File 1: Checkpoint and Timing Analysis procedures

proc checkpoint_stage {stage_name} {
    # Create stage directory if it doesn't exist
    set stage_dir "stages/${stage_name}"
    file mkdir $stage_dir
    
    # Save database
    write_db "${stage_dir}/${stage_name}.odb"
    
    # Generate timing reports
    generate_timing_reports $stage_name
}

proc restore_stage {stage_name} {
    set db_file "stages/${stage_name}/${stage_name}.odb"
    if {[file exists $db_file]} {
        read_db $db_file
        puts "Loaded stage: $stage_name"
        read_lef ../ASAP7/lef/asap7_tech_1x_201209.lef
            read_liberty ../ASAP7/lib/asap7sc7p5t_AO_RVT_FF_ccs_211120.lib
            read_liberty ../ASAP7/lib/asap7sc7p5t_INVBUF_RVT_FF_ccs_220122.lib
            read_liberty ../ASAP7/lib/asap7sc7p5t_OA_RVT_FF_ccs_211120.lib
            read_liberty ../ASAP7/lib/asap7sc7p5t_SEQ_RVT_FF_ccs_220123.lib
            read_liberty ../ASAP7/lib/asap7sc7p5t_SIMPLE_RVT_FF_ccs_211120.lib
            read_sdc ./constraints.sdc
            source ../ASAP7/make_tracks.tcl
            source ../ASAP7/setRC.tcl
        
    } else {
        puts "Error: Could not find database for stage $stage_name"
    }

}

# Keep generate_timing_reports as is since it's not a command name
proc generate_timing_reports {stage_name} {
    set report_dir "stages/${stage_name}/reports"
    file mkdir $report_dir
    
    # Setup and hold slacks
    report_worst_slack -max > "${report_dir}/worst_setup_slack.rpt"
    report_worst_slack -min > "${report_dir}/worst_hold_slack.rpt"
    
    # Total and worst negative slack
    report_tns > "${report_dir}/total_negative_slack.rpt"
    report_wns > "${report_dir}/worst_negative_slack.rpt"
    
    # Detailed timing paths
    report_checks -path_delay max -slack_max 0 -group_count 50 > "${report_dir}/max_timing_paths.rpt"
    report_checks -path_delay min -slack_min 0 -group_count 50 > "${report_dir}/min_timing_paths.rpt"
    
    # Design rule violations
    report_check_types -max_slew -max_capacitance -max_fanout -violators > "${report_dir}/design_rule_violations.rpt"
}

proc check_stage_timing {stage_name} {
    set report_dir "stages/${stage_name}/reports"
    
    # Read and display critical metrics
    if {[file exists $report_dir]} {
        puts "\nTiming Analysis for stage: $stage_name"
        puts "----------------------------------------"
        
        # Display worst setup slack
        if {[file exists "${report_dir}/worst_setup_slack.rpt"]} {
            puts "Setup Slack: [exec grep -v "#" "${report_dir}/worst_setup_slack.rpt"]"
        }
        
        # Display worst hold slack
        if {[file exists "${report_dir}/worst_hold_slack.rpt"]} {
            puts "Hold Slack: [exec grep -v "#" "${report_dir}/worst_hold_slack.rpt"]"
        }
        
        # Display TNS
        if {[file exists "${report_dir}/total_negative_slack.rpt"]} {
            puts "TNS: [exec grep -v "#" "${report_dir}/total_negative_slack.rpt"]"
        }
        
        # Display WNS
        if {[file exists "${report_dir}/worst_negative_slack.rpt"]} {
            puts "WNS: [exec grep -v "#" "${report_dir}/worst_negative_slack.rpt"]"
        }
        
        # Check for violations
        if {[file exists "${report_dir}/design_rule_violations.rpt"]} {
            set violations [exec grep "VIOLATED" "${report_dir}/design_rule_violations.rpt" | wc -l]
            puts "Number of design rule violations: $violations"
        }
    } else {
        puts "Error: No reports found for stage $stage_name"
    }
}
