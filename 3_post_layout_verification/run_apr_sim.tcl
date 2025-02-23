# ModelSim simulation script for synthesized files

# Delete previous compilation results
quit -sim
#vdel -all -lib work

# Create new library
vlib work

# Compile your Verilog files
vlog ../2_pnr/final/alu_final.v
vlog ../0_pre_synthesis/alu_tb.sv

# Compile synthesized Verilog files from ASAP7 directory
vlog ../NanGate45/verilog/cells.v

# Start simulation (replace alu_synth_tb with your actual testbench name)
vsim work.alu_tb

# Add waves with specific formatting
add wave -noupdate -divider "Control Signals"
add wave -noupdate -format Logic -radix binary /alu_tb/clk
add wave -noupdate -format Logic -radix binary /alu_tb/rst_n

add wave -noupdate -divider "Test Case"
add wave -noupdate -format Literal -radix ascii /alu_tb/test_case_label

add wave -noupdate -divider "Input Signals"
add wave -noupdate -format Literal -radix hexadecimal /alu_tb/a
add wave -noupdate -format Literal -radix hexadecimal /alu_tb/b
add wave -noupdate -format Literal -radix binary /alu_tb/opcode

add wave -noupdate -divider "Output Signals"
add wave -noupdate -format Literal -radix hexadecimal /alu_tb/result
add wave -noupdate -format Logic -color Yellow -radix binary /alu_tb/zero_flag
add wave -noupdate -format Logic -color Red -radix binary /alu_tb/overflow_flag

# Configure wave window
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns

# Run simulation
run -all

# Zoom full wave
wave zoom full

# Update wave window
wave update

# Save waveform configuration
write format wave -window .main_pane.wave.interior.cs.body.pw.wf wave_synth.do