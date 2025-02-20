onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_tb/clk
add wave -noupdate /alu_tb/rst_n
add wave -noupdate -radix hexadecimal /alu_tb/a
add wave -noupdate -radix hexadecimal /alu_tb/b
add wave -noupdate -radix binary /alu_tb/opcode
add wave -noupdate -radix hexadecimal /alu_tb/result
add wave -noupdate -color yellow -radix binary /alu_tb/zero_flag
add wave -noupdate -color red -radix binary /alu_tb/overflow_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {326 ps}
