//
// Template for UVM-compliant Monitor to Coverage Connector Callbacks
//

`ifndef MON1_2COV_CONNECT
`define MON1_2COV_CONNECT
class mon1_2cov_connect extends uvm_component;
   top_env_cov cov;
   uvm_analysis_export # (tra1) an_exp;
   `uvm_component_utils(mon1_2cov_connect)
   function new(string name="", uvm_component parent=null);
   	super.new(name, parent);
   endfunction: new

   virtual function void write(tra1 tr);
      cov.tr = tr;
      -> cov.cov_event;
   endfunction:write 
endclass: mon1_2cov_connect

`endif // MON1_2COV_CONNECT
