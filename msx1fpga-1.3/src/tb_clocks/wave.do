onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb/u_target/clk1_cnt_q
add wave -noupdate -radix unsigned /tb/u_target/clk2_cnt_q
add wave -noupdate /tb/clock_s
add wave -noupdate /tb/por_s
add wave -noupdate /tb/clock_vdp_s
add wave -noupdate /tb/clock_5m_en_s
add wave -noupdate /tb/clock_psg_en_s
add wave -noupdate /tb/turbo_on_s
add wave -noupdate /tb/clock_cpu_s
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix unsigned /tb/u_target/pos_cnt3_q
add wave -noupdate -radix unsigned /tb/u_target/neg_cnt3_q
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/u_target/clock_3m_s
add wave -noupdate /tb/u_target/clock_7m_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {160 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 235
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1876 ns}
