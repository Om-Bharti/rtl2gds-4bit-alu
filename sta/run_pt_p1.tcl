set report_default_significant_digits 6 
set link_path "../ref/lib/stdcell_rvt/saed32rvt_ss0p7vn40c.db" 

set DESIGN_NAME "alu_4bit_seq"
set REPORTS_DIR "./reports"
file mkdir $REPORTS_DIR

read_verilog "../ICCII/outputs/${DESIGN_NAME}.routed.v"
link_design
current_design $DESIGN_NAME

read_sdc "../ICCII/outputs/${DESIGN_NAME}_final.sdc" 

read_parasitics "../ICCII/outputs/${DESIGN_NAME}_func::nom.spef.p1_125.spef"

update_timing -full

report_timing
report_design

report_timing -path full -delay max -max_paths 10 \
    > $REPORTS_DIR/timing_setup.rpt

report_timing -path full -delay min -max_paths 10 \
    > $REPORTS_DIR/timing_hold.rpt
