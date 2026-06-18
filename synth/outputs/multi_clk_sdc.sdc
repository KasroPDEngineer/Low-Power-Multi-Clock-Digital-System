# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Fri Jun 12 03:05:01 +06 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design SYS_TOP

create_clock -name "REF_CLK" -period 5.0 -waveform {0.0 2.5} [get_ports REF_CLK]
create_clock -name "UART_RX_CLK" -period 100.0 -waveform {0.0 50.0} [get_ports UART_CLK]
create_generated_clock -name "UART_TX_CLK" -add -divide_by 8     -source [get_ports UART_CLK]  -master_clock [get_clocks UART_RX_CLK] [get_pins U0_ClkDiv/o_div_clk] 
create_generated_clock -name "ALU_CLK" -add -divide_by 1     -source [get_ports REF_CLK]  -master_clock [get_clocks REF_CLK] [get_pins U0_CLK_GATE/GATED_CLK] 
set_clock_transition 0.1 [get_clocks REF_CLK]
set_clock_groups -name "Functional_Clocks" -asynchronous -group [list \
  [get_clocks UART_RX_CLK]  \
  [get_clocks UART_TX_CLK] ] -group [list \
  [get_clocks REF_CLK]  \
  [get_clocks ALU_CLK] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks UART_RX_CLK] -add_delay 2.0 [get_ports UART_RX_IN]
set_output_delay -clock [get_clocks UART_RX_CLK] -add_delay 2.0 [get_ports UART_TX_O]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.2 [get_clocks UART_RX_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks UART_RX_CLK]
set_clock_uncertainty -setup 0.01 [get_ports REF_CLK]
set_clock_uncertainty -hold 0.01 [get_ports REF_CLK]
