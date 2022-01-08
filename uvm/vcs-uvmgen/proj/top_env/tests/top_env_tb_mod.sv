//
// Template for UVM-compliant Program block

`ifndef TOP_ENV_TB_MOD__SV
`define TOP_ENV_TB_MOD__SV

`include "mstr_slv_intfs.incl"
module top_env_tb_mod;

import uvm_pkg::*;

`include "top_env_env.sv"
`include "top_env_test.sv"  //ToDo: Change this name to the testcase file-name

// ToDo: Include all other test list here
   typedef virtual inte1 v_if1;
   typedef virtual inte2 v_if2;
   initial begin
      uvm_config_db #(v_if1)::set(null,"","mst_if",top_env_top.mst_if); 
      uvm_config_db #(v_if2)::set(null,"","slv_if",top_env_top.slv_if);
      run_test();
   end

endmodule: top_env_tb_mod

`endif // TOP_ENV_TB_MOD__SV

