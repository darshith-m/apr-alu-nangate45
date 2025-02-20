proc fix_antennas {diode_cell args} {
    global_route -start_incremental
    repair_antennas $diode_cell -iterations 2 -ratio_margin 1.0
    global_route -end_incremental
}

proc optimize_clock_inverters {} {
    global_route -start_incremental
    repair_clock_inverters
    detailed_placement
    global_route -end_incremental
}

proc optimize_clock_nets {{max_wire_length 100}} {
    global_route -start_incremental
    repair_clock_nets -max_wire_length $max_wire_length
    detailed_placement
    global_route -end_incremental
}

proc optimize_design {{max_wire_length 100} {util 0.9} {slew_margin 0.1} {cap_margin 0.1}} {
    global_route -start_incremental
    remove_buffers
    repair_design \
        -max_wire_length $max_wire_length \
        -max_utilization $util \
        -slew_margin $slew_margin \
        -cap_margin $cap_margin \
        -buffer_gain 4
    global_route -end_incremental
    
    global_route -start_incremental
    detailed_placement
    check_placement -verbose  
    global_route -end_incremental
}

proc fix_pdn_vias {} {
    repair_pdn_vias -all
}

proc fix_tie_fanout {lib_port {max_fanout 50} {separation 5}} {
    repair_tie_fanout $lib_port \
        -separation $separation \
        -max_fanout $max_fanout
}

proc optimize_timing {} {
    # Initial timing state check
    set setup_wns [report_worst_slack -max]
    set hold_wns [report_worst_slack -min]
    
    set setup_paths [find_timing_paths -slack_max 0 -path_delay max -group_count 10000]
    set hold_paths [find_timing_paths -slack_max 0 -path_delay min -group_count 10000]
    
    set setup_violations [llength $setup_paths]
    set hold_violations [llength $hold_paths]
    
    puts "\nInitial timing state:"
    puts "  Setup worst slack: $setup_wns"
    puts "  Hold worst slack: $hold_wns"
    puts "  Setup violations: $setup_violations"
    puts "  Hold violations: $hold_violations"
    
    # Check if we actually have violations
    if {$setup_violations == 0 && $hold_violations == 0} {
        puts "No timing violations found. No repair needed."
        return
    }
    
    set max_iterations 10
    set iteration 1
    set has_violations 1
    
    while {$has_violations && $iteration <= $max_iterations} {
        puts "\nStarting timing repair iteration $iteration"
        
        # Phase 1: Setup timing repair with its own global route increment
        if {$setup_violations > 0} {
            puts "Phase 1: Fixing $setup_violations setup violations..."
            
            global_route -start_incremental
            
            repair_timing -setup \
                -setup_margin 0.1 \
                -slack_margin 0.05 \
                -allow_setup_violations \
                -max_buffer_percent 10
            
            global_route -end_incremental
        }
        
        # Phase 2: Hold timing repair with its own global route increment
        if {$hold_violations > 0} {
            puts "Phase 2: Fixing $hold_violations hold violations..."
            
            global_route -start_incremental
            
            repair_timing -hold \
                -hold_margin 0.1 \
                -slack_margin 0.05 \
                -max_buffer_percent 10
            
            global_route -end_incremental
        }
        
        # # Phase 3: Placement legalization with its own global route increment
        puts "Phase 3: Performing detailed placement..."
        global_route -start_incremental
        
        detailed_placement -max_displacement 50
        check_placement -verbose
        
        global_route -end_incremental
        
        # Get updated timing state
        set setup_wns [report_worst_slack -max]
        set hold_wns [report_worst_slack -min]
        set setup_paths [find_timing_paths -slack_max 0 -path_delay max -group_count 10000]
        set hold_paths [find_timing_paths -slack_max 0 -path_delay min -group_count 10000]
        set setup_violations [llength $setup_paths]
        set hold_violations [llength $hold_paths]
        
        puts "After repair iteration $iteration:"
        puts "  Setup worst slack: $setup_wns"
        puts "  Hold worst slack: $hold_wns"
        puts "  Setup violations: $setup_violations"
        puts "  Hold violations: $hold_violations"
        
        # Update violation status
        set has_violations [expr {$setup_violations > 0 || $hold_violations > 0}]
        
        if {!$has_violations} {
            puts "\nSuccessfully fixed all timing violations in $iteration iterations"
            
            # # Phase 4: Final detailed route
            puts "Phase 4: Performing final detailed route..."
            detailed_route
            
            return
        }
        
        incr iteration
    }
    
    if {$has_violations} {
        puts "\nWarning: Could not fix all timing violations after $max_iterations iterations"
        puts "Remaining setup violations: $setup_violations"
        puts "Remaining hold violations: $hold_violations"
        
        # # Still perform final detailed route even with remaining violations
        puts "Performing final detailed route..."
        detailed_route
    }
}
# Example usage:
# optimize_clock_inverters
# optimize_clock_nets 100
# optimize_design 100 0.9 0.1 0.1
# fix_pdn_vias
# fix_tie_fanout TIE_ZERO 50 5
# optimize_timing 0.1 0.05