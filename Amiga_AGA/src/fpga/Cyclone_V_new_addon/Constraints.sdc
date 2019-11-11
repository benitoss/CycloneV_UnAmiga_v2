## Generated SDC file "hello_led.out.sdc"

## Copyright (C) 1991-2011 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 11.1 Build 216 11/23/2011 Service Pack 1 SJ Web Edition"

## DATE    "Fri Jul 06 23:05:47 2012"

##
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_50} -period 20.000 -waveform { 0 5 } [get_ports {CLOCK_50}]

create_clock -name {SD_CLK} -period 20.000 -waveform { 0 5 } [get_ports {SD_CLK}]

#create_clock -name {CLOCKS} -period 2240.000 -waveform { 0 5 } [get_ports {CLOCKS}]

create_clock -name {CLOCKS[2]} -period 1143.000 -waveform { 0.000 571.500 }  [get_registers {CLOCKS[2]}]

create_clock -name {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}   -period 20.000 -waveform { 0 5 } [get_registers { ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0] }]
create_clock -name {amiga_clk:amiga_clk|clk7_cnt[1]}   						-period 20.000 -waveform { 0 5 } [get_registers { amiga_clk:amiga_clk|clk7_cnt[1] }]


#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks 
create_generated_clock -name sd1clk_pin -source [get_pins {amiga_clk:amiga_clk|amiga_clk_altera:amiga_clk_i|altpll:altpll_component|amiga_clk_altera_altpll:auto_generated|pll1|clk[2]}] [get_ports {SDRAM_CLK}]
create_generated_clock -name sysclock   -source [get_pins {amiga_clk:amiga_clk|amiga_clk_altera:amiga_clk_i|altpll:altpll_component|amiga_clk_altera_altpll:auto_generated|pll1|clk[0]}]


#**************************************************************
# Set Clock Latency
#**************************************************************


#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty;

#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -clock sd1clk_pin -max 5.8 [get_ports SDRAM_DQ[*]]
set_input_delay -clock sd1clk_pin -min 3.2 [get_ports SDRAM_DQ[*]]

set_input_delay -clock sysclock -min 0.5 [get_ports SD_MISO]
set_input_delay -clock sysclock -max 1.0 [get_ports SD_MISO]

#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -clock sysclock -max 1.5 [get_ports SDRAM_*]
set_output_delay -clock sysclock -min -0.8 [get_ports SDRAM_*]
set_output_delay -clock sd1clk_pin -max 0.5 [get_ports SDRAM_CLK]
set_output_delay -clock sd1clk_pin -min 0.5 [get_ports SDRAM_CLK]

set_output_delay -clock sysclock -min 0.5 [get_ports VGA_*]
set_output_delay -clock sysclock -max 1.0 [get_ports VGA_*]

set_output_delay -clock sysclock -min 0.5 [get_ports SD_*]
set_output_delay -clock sysclock -max 1.0 [get_ports SD_*]

#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************


set_false_path -from {btn_n_i[*]}
set_false_path -from {PS2_*}
set_false_path -from {stm_tx_i}

set_false_path -to {btn_n_i[*]}
set_false_path -to {PS2_*}
set_false_path -to {stm_rx_o}

#**************************************************************
# Set Multicycle Path
#**************************************************************

#set_multicycle_path -from [get_clocks {mypll|altpll_component|pll|clk[1]}] -to [get_clocks {sd1clk_pin}] -setup -end 2
#set_multicycle_path -from [get_clocks {mypll|altpll_component|pll|clk[1]}] -to [get_clocks {sd1clk_pin}] -setup -end 2
set_multicycle_path -from [get_clocks {sd1clk_pin}] -to [get_clocks {amiga_clk:amiga_clk|amiga_clk_altera:amiga_clk_i|altpll:altpll_component|amiga_clk_altera_altpll:auto_generated|pll1|clk[1]}] -setup -end 2
																							
#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************
