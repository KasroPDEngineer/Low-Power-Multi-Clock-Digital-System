set DESIGN SYS_TOP

set_db init_lib_search_path {/home/user_74/projects/new_fp/pdk_files/lib}

set_db init_hdl_search_path {/home/user_74/projects/new_fp/rtl}

read_libs slow_vdd1v0_basicCells.lib

read_hdl ALU.v
read_hdl ASYNC_FIFO_BIT_SYNC.v
read_hdl ASYNC_FIFO_READ.v
read_hdl ASYNC_FIFO_TOP.v
read_hdl ASYNC_FIFO_WRITE.v
read_hdl FIFO_MEMORY.v
read_hdl CLK_DIV.v
read_hdl CLK_GATE.v
read_hdl DATA_SYNC.v
read_hdl CLK_DIV_MUX.v
read_hdl pulse_Gen.v
read_hdl Register_File.v
read_hdl RST_SYNC.v
read_hdl Sys_Ctrl.v
read_hdl System_Top.v
read_hdl Deserializer.v
read_hdl Edge_Bit_Counter.v
read_hdl Parity_Chk.v
read_hdl RX_FSM.v
read_hdl Sampling.v
read_hdl Start_Chk.v
read_hdl Stop_Chk.v
read_hdl UART_RX_TOP.v
read_hdl UART_TOP.v
read_hdl FSM_TX.v
read_hdl Parity_Calc.v
read_hdl Serializer.v
read_hdl UART_TX_TOP.v


elaborate $DESIGN

read_sdc {/home/user_74/projects/new_fp/synth/constraints_top.sdc} 


set_db syn_generic_effort high
set_db syn_map_effort high
set_db syn_opt_effort high

syn_generic
syn_map
syn_opt

report_timing > reports/report_timing.rpt
report_power  > reports/report_power.rpt
report_area   > reports/report_area.rpt
report_qor    > reports/report_qor.rpt

write_hdl > outputs/multi_clk_netlist.v
write_sdc > outputs/multi_clk_sdc.sdc

#foreach f [glob -nocomplain *.log *.cmd *.txt] {
 #       file rename -force $f logs_genus/}

