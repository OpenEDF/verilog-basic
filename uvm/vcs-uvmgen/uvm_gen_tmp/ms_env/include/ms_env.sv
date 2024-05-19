//
// Template for UVM-compliant verification environment
//

`ifndef MS_ENV__SV
`define MS_ENV__SV




`include "mstr_slv_src.incl"

`include "ms_env_cfg.sv"


`include "ms_sbd.sv"

`include "ms_env_cov.sv"

`include "mon_2cov.sv"


`include "ral_multiplexed.sv"
//ToDo : Include other RAL BFM files, if more than two domains are used.

`include "ral_ms_env.sv"
// ToDo: Add additional required `include directives

`endif // MS_ENV__SV
