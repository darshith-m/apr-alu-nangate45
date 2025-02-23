###############################################################################
# Created by write_sdc
# Sat Feb 22 17:13:12 2025
###############################################################################
current_design alu
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 300.0000 [get_ports {clk}]
set_clock_uncertainty 0.1000 clk
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {a[0]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {a[1]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {a[2]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {a[3]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {a[4]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {a[5]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {a[6]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {a[7]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {b[0]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {b[1]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {b[2]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {b[3]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {b[4]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {b[5]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {b[6]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {b[7]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {opcode[0]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {opcode[1]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {opcode[2]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {opcode[3]}]
set_input_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst_n}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {overflow_flag}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[0]}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[1]}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[2]}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[3]}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[4]}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[5]}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[6]}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {result[7]}]
set_output_delay 0.0000 -clock [get_clocks {clk}] -add_delay [get_ports {zero_flag}]
set_false_path\
    -from [get_ports {rst_n}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 10.0000 [get_ports {overflow_flag}]
set_load -pin_load 10.0000 [get_ports {zero_flag}]
set_load -pin_load 10.0000 [get_ports {result[7]}]
set_load -pin_load 10.0000 [get_ports {result[6]}]
set_load -pin_load 10.0000 [get_ports {result[5]}]
set_load -pin_load 10.0000 [get_ports {result[4]}]
set_load -pin_load 10.0000 [get_ports {result[3]}]
set_load -pin_load 10.0000 [get_ports {result[2]}]
set_load -pin_load 10.0000 [get_ports {result[1]}]
set_load -pin_load 10.0000 [get_ports {result[0]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst_n}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {a[7]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {a[6]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {a[5]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {a[4]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {a[3]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {a[2]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {a[1]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {a[0]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {b[7]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {b[6]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {b[5]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {b[4]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {b[3]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {b[2]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {b[1]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {b[0]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {opcode[3]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {opcode[2]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {opcode[1]}]
set_driving_cell -lib_cell INV_X1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {opcode[0]}]
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 8.0000 [current_design]
