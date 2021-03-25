onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_reloj/clk
add wave -noupdate /test_reloj/nRst
add wave -noupdate /test_reloj/tic_025s
add wave -noupdate /test_reloj/tic_1s
add wave -noupdate /test_reloj/ena_cmd
add wave -noupdate -radix hexadecimal /test_reloj/cmd_tecla
add wave -noupdate /test_reloj/pulso_largo
add wave -noupdate -radix hexadecimal /test_reloj/segundos
add wave -noupdate -radix hexadecimal /test_reloj/minutos
add wave -noupdate -radix hexadecimal /test_reloj/horas
add wave -noupdate /test_reloj/AM_PM
add wave -noupdate /test_reloj/modo
add wave -noupdate /test_reloj/info
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/clk
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/nRst
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/tic_025s
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/tic_1s
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/ena_cmd
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/cmd_tecla
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/pulso_largo
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/modo
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/inc_campo
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/load
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/dato_campo
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/cambiar_modo
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/ena_reloj
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/info
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/estado
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/comando
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/cnt
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/time_out
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/dato_ant
add wave -noupdate -expand -group CONTROL /test_reloj/dut/U_0/campo_valido
add wave -noupdate -group SEG /test_reloj/dut/U_1/U0/clk
add wave -noupdate -group SEG /test_reloj/dut/U_1/U0/nRst
add wave -noupdate -group SEG /test_reloj/dut/U_1/U0/tic_1s
add wave -noupdate -group SEG /test_reloj/dut/U_1/U0/nrst_ena
add wave -noupdate -group SEG /test_reloj/dut/U_1/U0/fdc
add wave -noupdate -group SEG /test_reloj/dut/U_1/U0/seg
add wave -noupdate -group SEG /test_reloj/dut/U_1/U0/ena_decenas_segundos
add wave -noupdate -group MIN /test_reloj/dut/U_1/U1/clk
add wave -noupdate -group MIN /test_reloj/dut/U_1/U1/nRst
add wave -noupdate -group MIN /test_reloj/dut/U_1/U1/ena
add wave -noupdate -group MIN /test_reloj/dut/U_1/U1/inc_campo
add wave -noupdate -group MIN /test_reloj/dut/U_1/U1/load
add wave -noupdate -group MIN /test_reloj/dut/U_1/U1/dato_in
add wave -noupdate -group MIN /test_reloj/dut/U_1/U1/fdc
add wave -noupdate -group MIN /test_reloj/dut/U_1/U1/minutos
add wave -noupdate -group MIN /test_reloj/dut/U_1/U1/ena_decenas_minutos
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/clk
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/nRst
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/ena
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/inc_campo
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/load
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/dato_in
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/cambiar_modo
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/modo
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/horas
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/AM_PM
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/ena_decenas_horas
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/fdc_AM_PM
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/aux_horas_12_L
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/aux_horas_12_H
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/horas_12
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/aux_horas_24_L
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/aux_horas_24_H
add wave -noupdate -group HOR /test_reloj/dut/U_1/U2/horas_24
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2792 ps}
