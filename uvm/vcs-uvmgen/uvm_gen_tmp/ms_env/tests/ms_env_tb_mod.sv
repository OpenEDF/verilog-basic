//
// Template for UVM-compliant Program block

`ifndef MS_ENV_TB_MOD__SV
`define MS_ENV_TB_MOD__SV

`include "mstr_slv_intfs.incl"
module ms_env_tb_mod;

import uvm_pkg::*;

`include "ms_env_ral_env.sv"
`include "ms_env_test.sv"  //ToDo: Change this name to the testcase file-name

// ToDo: Include all other test list here
   typedef virtual m_intf v_if1;
   typedef virtual s_intf v_if2;
   initial begin
      uvm_config_db #(v_if1)::set(null,"","mst_if",ms_env_top.mst_if); 
      uvm_config_db #(v_if2)::set(null,"","slv_if",ms_env_top.slv_if);
      run_test();
   end

endmodule: ms_env_tb_mod

`endif // MS_ENV_TB_MOD__SV

