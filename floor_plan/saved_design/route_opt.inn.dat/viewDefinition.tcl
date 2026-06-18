if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells.lib]
create_library_set -name slow\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow_vdd1v0_basicCells.lib]
create_op_cond -name worst -library_file ${::IMEX::libVar}/mmmc/slow_vdd1v0_basicCells.lib -P 10 -V 10 -T 10
create_op_cond -name best -library_file ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells.lib -P 10 -V 10 -T 10
create_rc_corner -name typical\
   -cap_table ${::IMEX::libVar}/mmmc/cln28hpl_1p10m+alrdl_5x2yu2yz_typical.capTbl\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/typical/gpdk045.tch
create_delay_corner -name rc_typ\
   -rc_corner typical\
   -early_library_set fast\
   -late_library_set slow
create_constraint_mode -name sdc_test\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/sdc_test/sdc_test.sdc]
create_analysis_view -name test_setup -constraint_mode sdc_test -delay_corner rc_typ -latency_file ${::IMEX::dataVar}/mmmc/views/test_setup/latency.sdc
create_analysis_view -name test_hold -constraint_mode sdc_test -delay_corner rc_typ -latency_file ${::IMEX::dataVar}/mmmc/views/test_hold/latency.sdc
set_analysis_view -setup [list test_setup] -hold [list test_hold]
catch {set_interactive_constraint_mode [list sdc_test] } 
