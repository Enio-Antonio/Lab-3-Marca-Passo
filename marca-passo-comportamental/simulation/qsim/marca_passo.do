onerror {quit -f}
vlib work
vlog -work work marca_passo.vo
vlog -work work marca_passo.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.marca_passo_vlg_vec_tst
vcd file -direction marca_passo.msim.vcd
vcd add -internal marca_passo_vlg_vec_tst/*
vcd add -internal marca_passo_vlg_vec_tst/i1/*
add wave /*
run -all
