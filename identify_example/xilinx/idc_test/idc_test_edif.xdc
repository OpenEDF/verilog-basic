
#1001 : create_clock -name ident_coreinst.comm_block_INST.tck n:ident_coreinst.comm_block_INST.tck -period 40 -waveform {0 20.0}
# line 2 in /home/macro/github/verilog-basic/identify_example/xilinx/idc_test/instr_sources/syn_dics.fdc

create_clock -name {ident_coreinst.comm_block_INST.tck} [get_pins {ident_coreinst/comm_block_INST/jtagi/clkbuf/O}] -period {40.000} -waveform {0.000 20.000}

#1002 : create_clock -name ident_coreinst.comm_block_INST.dr2_tck n:ident_coreinst.comm_block_INST.dr2_tck -period 40 -waveform {0 20.0}
# line 3 in /home/macro/github/verilog-basic/identify_example/xilinx/idc_test/instr_sources/syn_dics.fdc

create_clock -name {ident_coreinst.comm_block_INST.dr2_tck} [get_pins {ident_coreinst/comm_block_INST/jtagi/clkbuf2/O}] -period {40.000} -waveform {0.000 20.000}

#1003 : create_clock -name ident_coreinst.comm_block_INST.ch_update n:ident_coreinst.comm_block_INST.ch_update -period 40 -waveform {0 20.0}
# line 4 in /home/macro/github/verilog-basic/identify_example/xilinx/idc_test/instr_sources/syn_dics.fdc

create_clock -name {ident_coreinst.comm_block_INST.ch_update} [get_pins {ident_coreinst/comm_block_INST/jtagi/jtag_prim1/UPDATE}] -period {40.000} -waveform {0.000 20.000}

#1004 : create_clock -name ident_coreinst.comm_block_INST.hcr_update n:ident_coreinst.comm_block_INST.hcr_update -period 40 -waveform {0 20.0}
# line 5 in /home/macro/github/verilog-basic/identify_example/xilinx/idc_test/instr_sources/syn_dics.fdc

create_clock -name {ident_coreinst.comm_block_INST.hcr_update} [get_pins {ident_coreinst/comm_block_INST/jtagi/jtag_prim2/UPDATE}] -period {40.000} -waveform {0.000 20.000}

#1008 : automatically generated

create_clock -name {led_stream|clk} [get_ports {clk}] -period {1000.000}


#1005 : set_clock_groups -derive -asynchronous -name identify_jtag_group1 -group {c:ident_coreinst.comm_block_INST.tck c:ident_coreinst.comm_block_INST.dr2_tck c:ident_coreinst.comm_block_INST.ch_update c:ident_coreinst.comm_block_INST.hcr_update}
# line 6 in /home/macro/github/verilog-basic/identify_example/xilinx/idc_test/instr_sources/syn_dics.fdc

set_clock_groups -asynchronous -name {identify_jtag_group1} -group [get_clocks {ident_coreinst.comm_block_INST.ch_update ident_coreinst.comm_block_INST.dr2_tck ident_coreinst.comm_block_INST.hcr_update ident_coreinst.comm_block_INST.tck}]

#1006 : set_false_path -from c:ident_coreinst.comm_block_INST.ch_update:r
# line 7 in /home/macro/github/verilog-basic/identify_example/xilinx/idc_test/instr_sources/syn_dics.fdc

set_false_path -rise_from [get_clocks {ident_coreinst.comm_block_INST.ch_update}]


#1007 : set_false_path -from c:ident_coreinst.comm_block_INST.hcr_update:r
# line 8 in /home/macro/github/verilog-basic/identify_example/xilinx/idc_test/instr_sources/syn_dics.fdc

set_false_path -rise_from [get_clocks {ident_coreinst.comm_block_INST.hcr_update}]


#1009 : automatically generated

set_clock_groups -name {Inferred_clkgroup_0} -asynchronous -group [get_clocks {led_stream|clk}]

set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iclksync_status/dst_req}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iclksync_status/dst_req_d}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iclksync_current_state/dst_req_d}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iclksync_current_state/dst_req}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[14]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[15]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[16]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[17]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[18]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[19]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[20]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[21]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[22]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/cmd_r0[0]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/cmd_r0[1]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/cmd_r0[2]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/cmd_r0[3]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/cmd_r0[4]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[22]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[0]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[1]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[2]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[3]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[5]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[6]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[7]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[8]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[9]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[10]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[11]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[12]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r1[13]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[7]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[8]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[9]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[10]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[11]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[12]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[13]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[14]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[15]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[16]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[17]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[18]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[19]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[20]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[21]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[0]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[1]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[2]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[3]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[5]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/iicestat_reg_r0[6]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/b3_nfs[0]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/b3_nfs[1]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/b3_nfs[2]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/b3_nfs[3]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/b3_nfs[4]}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/runstart_d}]
set_property ASYNC_REG TRUE [get_cells {ident_coreinst/IICE_INST/b5_nUTGT/b8_vABZ3qsY}]


#Constraints which are not forward annotated in XDC and intentionally commented out (unused and unsupported constraints)

#User specified region constraints
