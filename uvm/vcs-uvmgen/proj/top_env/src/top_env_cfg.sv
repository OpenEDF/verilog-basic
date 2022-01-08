//
// Template for UVM-compliant configuration class
//

`ifndef TOP_ENV_CFG__SV
`define TOP_ENV_CFG__SV

class top_env_cfg extends uvm_object; 

   // Define test configuration parameters (e.g. how long to run)
   rand int num_trans;
   rand int num_scen;
   // ToDo: Add other environment configuration varaibles

   constraint cst_num_trans_default {
      num_trans inside {[1:7]};
   }
   constraint cst_num_scen_default {
      num_scen inside {[1:2]};
   }
   // ToDo: Add constraint blocks to prevent error injection

   `uvm_object_utils_begin(top_env_cfg)
      `uvm_field_int(num_trans,UVM_ALL_ON) 
      `uvm_field_int(num_scen,UVM_ALL_ON)
      // ToDo: add properties using macros here

   `uvm_object_utils_end

   extern function new(string name = "");
  
endclass: top_env_cfg

function top_env_cfg::new(string name = "");
   super.new(name);
endfunction: new


`endif // TOP_ENV_CFG__SV
