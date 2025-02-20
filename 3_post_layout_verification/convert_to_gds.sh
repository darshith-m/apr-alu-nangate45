klayout -zz     \
    -rd design_name=alu     \
    -rd in_def=../2_pnr/final/alu_final.def     \
    -rd in_files="../NanGate45/gds/NangateOpenCellLibrary.gds"     \
    -rd out_file=alu.gds     \
    -rd tech_file=/home/darshith/.klayout/tech/NanGate45/FreePDK45.lyt     \
    -rm def2stream.py > klayout.txt