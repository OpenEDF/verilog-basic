//
// Template for UVM-compliant Coverage Class
//

`ifndef MS_ENV_COV__SV
`define MS_ENV_COV__SV

class ms_env_cov extends uvm_component;
   event cov_event;
   m_item tr;
   uvm_analysis_imp #(m_item, ms_env_cov) cov_export;
   `uvm_component_utils(ms_env_cov)
 
   covergroup cg_trans @(cov_event);
      coverpoint tr.kind;
      // ToDo: Add required coverpoints, coverbins
   endgroup: cg_trans


   function new(string name, uvm_component parent);
      super.new(name,parent);
      cg_trans = new;
      cov_export = new("Coverage Analysis",this);
   endfunction: new

   virtual function write(m_item tr);
      this.tr = tr;
      -> cov_event;
   endfunction: write

endclass: ms_env_cov

`endif // MS_ENV_COV__SV

