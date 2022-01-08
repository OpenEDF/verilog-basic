//
// Template for UVM-compliant verification environment
//

`ifndef TOP_ENV__SV
`define TOP_ENV__SV




`include "mstr_slv_src.incl"

`include "top_env_cfg.sv"


`include "scb.sv"

`include "top_env_cov.sv"

`include "mon_2cov.sv"


// ToDo: Add additional required `include directives

`endif // TOP_ENV__SV
