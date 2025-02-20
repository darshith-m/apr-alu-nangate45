# Clock Definition
create_clock -name clk -period 300 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]

# Input/Output Delays
# Using 0 delay like in the OpenROAD script
set_input_delay -clock clk 0 [all_inputs]
set_output_delay -clock clk 0 [all_outputs]

# Drive for NanGate45
set_driving_cell -lib_cell INV_X1 [all_inputs]

# Load (using capacitance in picofarads)
set_load 10 [all_outputs]

# False path for async reset
set_false_path -from [get_ports rst_n]

# Set maximum fanout
set_max_fanout 8 [current_design]