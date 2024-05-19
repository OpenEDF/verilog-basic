//
// Template for UVM-compliant Monitor to Coverage Connector Callbacks
//

`ifndef M_MON_2COV_CONNECT
`define M_MON_2COV_CONNECT
class m_mon_2cov_connect extends uvm_component;
   ms_env_cov cov;
   uvm_analysis_export # (m_item) an_exp;
   `uvm_component_utils(m_mon_2cov_connect)
   function new(string name="", uvm_component parent=null);
   	super.new(name, parent);
   endfunction: new

   virtual function void write(m_item tr);
      cov.tr = tr;
      -> cov.cov_event;
   endfunction:write 
endclass: m_mon_2cov_connect

`endif // M_MON_2COV_CONNECT
