set log file multi_clk_lec.log -replace

read library /home/user_74/projects/new_fp/pdk_files/lib/slow_vdd1v0_basiccells.v -verilog -both

read design -verilog -golden \
/home/user_74/projects/new_fp/rtl/ALU.v \
/home/user_74/projects/new_fp/rtl/ASYNC_FIFO_BIT_SYNC.v \
/home/user_74/projects/new_fp/rtl/ASYNC_FIFO_READ.v \
/home/user_74/projects/new_fp/rtl/ASYNC_FIFO_TOP.v \
/home/user_74/projects/new_fp/rtl/ASYNC_FIFO_WRITE.v \
/home/user_74/projects/new_fp/rtl/CLK_DIV_MUX.v \
/home/user_74/projects/new_fp/rtl/CLK_DIV.v \
/home/user_74/projects/new_fp/rtl/CLK_GATE.v \
/home/user_74/projects/new_fp/rtl/DATA_SYNC.v \
/home/user_74/projects/new_fp/rtl/Deserializer.v \
/home/user_74/projects/new_fp/rtl/Edge_Bit_Counter.v \
/home/user_74/projects/new_fp/rtl/FIFO_MEMORY.v \
/home/user_74/projects/new_fp/rtl/FSM_TX.v \
/home/user_74/projects/new_fp/rtl/Parity_Calc.v \
/home/user_74/projects/new_fp/rtl/Parity_Chk.v \
/home/user_74/projects/new_fp/rtl/pulse_Gen.v \
/home/user_74/projects/new_fp/rtl/Register_File.v \
/home/user_74/projects/new_fp/rtl/RST_SYNC.v \
/home/user_74/projects/new_fp/rtl/RX_FSM.v \
/home/user_74/projects/new_fp/rtl/Sampling.v \
/home/user_74/projects/new_fp/rtl/Serializer.v \
/home/user_74/projects/new_fp/rtl/Start_Chk.v \
/home/user_74/projects/new_fp/rtl/Stop_Chk.v \
/home/user_74/projects/new_fp/rtl/Sys_Ctrl.v \
/home/user_74/projects/new_fp/rtl/System_Top.v \
/home/user_74/projects/new_fp/rtl/UART_RX_TOP.v \
/home/user_74/projects/new_fp/rtl/UART_TOP.v \
/home/user_74/projects/new_fp/rtl/UART_TX_TOP.v \

read design /home/user_74/projects/new_fp/synth/outputs/multi_clk_netlist.v -verilog -revised

set root module SYS_TOP -both
set flatten model -seq_constant
set undriven signal 0

set system mode lec
set compare effort high
set mapping method -name guide -phase
map key points
add compared points -all
compare

