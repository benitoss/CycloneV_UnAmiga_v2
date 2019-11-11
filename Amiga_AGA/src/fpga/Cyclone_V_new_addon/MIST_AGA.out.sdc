## Generated SDC file "MIST_AGA.out.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

## DATE    "Sun May 12 20:42:25 2019"

##
## DEVICE  "5CEFA2F23I7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_50} -period 20.000 -waveform { 0.000 5.000 } [get_ports {CLOCK_50}]
create_clock -name {SD_CLK} -period 20.000 -waveform { 0.000 5.000 } [get_ports {SD_CLK}]
create_clock -name {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]} -period 20.000 -waveform { 0.000 5.000 } [get_registers { ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0] }]
create_clock -name {amiga_clk:amiga_clk|clk7_cnt[1]} -period 20.000 -waveform { 0.000 5.000 } [get_registers { amiga_clk:amiga_clk|clk7_cnt[1] }]
create_clock -name {clk_div:divisor_reloj|clk_track} -period 100000.000 -waveform { 0.000 25000.000 } [get_registers {clk_div:divisor_reloj|clk_track}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL|refclkin}] -duty_cycle 50/1 -multiply_by 64 -divide_by 7 -master_clock {clk_50} [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL|vcoph[0]}] 
create_generated_clock -name {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 4 -master_clock {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL|vcoph[0]} [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 16 -master_clock {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL|vcoph[0]} [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll3~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll3~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 4 -phase 187056/875 -master_clock {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL|vcoph[0]} [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll3~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 9 -master_clock {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~FRACTIONAL_PLL|vcoph[0]} [get_pins {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -rise_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.270  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -fall_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.270  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -rise_to [get_clocks {clk_div:divisor_reloj|clk_track}]  0.320  
set_clock_uncertainty -rise_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -fall_to [get_clocks {clk_div:divisor_reloj|clk_track}]  0.320  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll1~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -rise_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.270  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -fall_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.270  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -rise_to [get_clocks {clk_div:divisor_reloj|clk_track}]  0.320  
set_clock_uncertainty -fall_from [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}] -fall_to [get_clocks {clk_div:divisor_reloj|clk_track}]  0.320  
set_clock_uncertainty -rise_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -rise_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -rise_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.270  
set_clock_uncertainty -rise_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -fall_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.270  
set_clock_uncertainty -fall_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll4~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.230  
set_clock_uncertainty -fall_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -rise_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.270  
set_clock_uncertainty -fall_from [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}] -fall_to [get_clocks {ctrl_top:ctrl_top|ctrl_regs:ctrl_regs|spi_cnt[0]}]  0.270  
set_clock_uncertainty -rise_from [get_clocks {clk_div:divisor_reloj|clk_track}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.290  
set_clock_uncertainty -rise_from [get_clocks {clk_div:divisor_reloj|clk_track}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.290  
set_clock_uncertainty -rise_from [get_clocks {clk_div:divisor_reloj|clk_track}] -rise_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.320  
set_clock_uncertainty -rise_from [get_clocks {clk_div:divisor_reloj|clk_track}] -fall_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.320  
set_clock_uncertainty -rise_from [get_clocks {clk_div:divisor_reloj|clk_track}] -rise_to [get_clocks {clk_div:divisor_reloj|clk_track}]  0.380  
set_clock_uncertainty -rise_from [get_clocks {clk_div:divisor_reloj|clk_track}] -fall_to [get_clocks {clk_div:divisor_reloj|clk_track}]  0.380  
set_clock_uncertainty -fall_from [get_clocks {clk_div:divisor_reloj|clk_track}] -rise_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.290  
set_clock_uncertainty -fall_from [get_clocks {clk_div:divisor_reloj|clk_track}] -fall_to [get_clocks {amiga_clk|amiga_clk_i|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk}]  0.290  
set_clock_uncertainty -fall_from [get_clocks {clk_div:divisor_reloj|clk_track}] -rise_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.320  
set_clock_uncertainty -fall_from [get_clocks {clk_div:divisor_reloj|clk_track}] -fall_to [get_clocks {amiga_clk:amiga_clk|clk7_cnt[1]}]  0.320  
set_clock_uncertainty -fall_from [get_clocks {clk_div:divisor_reloj|clk_track}] -rise_to [get_clocks {clk_div:divisor_reloj|clk_track}]  0.380  
set_clock_uncertainty -fall_from [get_clocks {clk_div:divisor_reloj|clk_track}] -fall_to [get_clocks {clk_div:divisor_reloj|clk_track}]  0.380  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_keepers {btn_n_i[*]}] 
set_false_path -from [get_keepers {PS2_*}] 
set_false_path -to [get_keepers {btn_n_i[*]}]
set_false_path -to [get_keepers {PS2_*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

