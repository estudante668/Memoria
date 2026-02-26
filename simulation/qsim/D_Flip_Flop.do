onerror {exit -code 1}
vlib work
vlog -work work D_Flip_Flop.vo
vlog -work work Waveform9.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.D_Flip_Flop_vlg_vec_tst
vcd file -direction D_Flip_Flop.msim.vcd
vcd add -internal D_Flip_Flop_vlg_vec_tst/*
vcd add -internal D_Flip_Flop_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
