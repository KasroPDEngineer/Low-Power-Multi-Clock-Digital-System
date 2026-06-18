create_clock -name REF_CLK -period 5 -waveform {0 2.5} [get_ports "REF_CLK"]
set_clock_transition -rise 0.1 [get_clocks "REF_CLK"]
set_clock_transition -fall 0.1 [get_clocks "REF_CLK"]
set_clock_uncertainty 0.01 [get_ports "REF_CLK"]
set_input_delay -max 1.0 [get_ports "UART_RX_IN"] -clock [get_clocks "REF_CLK"]
set_output_delay -max 1.0 [get_ports "UART_TX_O"] -clock [get_clocks "REF_CLK"]

create_clock [get_ports UART_CLK]  -name UART_RX_CLK  -period 100  -waveform {0 50}
set_clock_uncertainty -setup 0.2  [get_clocks UART_RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_RX_CLK]

create_generated_clock [get_pins U0_ClkDiv/o_div_clk]  -name UART_TX_CLK  -source [get_ports UART_CLK]  -master_clock UART_RX_CLK  -divide_by 8  -add
create_generated_clock [get_pins U0_CLK_GATE/GATED_CLK]  -name ALU_CLK  -source [get_ports REF_CLK]  -master_clock REF_CLK  -divide_by 1  -add
set_input_delay -clock UART_RX_CLK 2.0 [get_ports UART_RX_IN]
set_output_delay -clock UART_RX_CLK 2.0 [get_ports UART_TX_O]
set_clock_groups -asynchronous -name Functional_Clocks -group [list [get_clocks UART_RX_CLK] [get_clocks UART_TX_CLK]] -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]]





