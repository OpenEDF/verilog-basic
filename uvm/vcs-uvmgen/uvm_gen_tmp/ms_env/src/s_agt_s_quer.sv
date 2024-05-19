//
// Template for UVM-compliant sequencer class
//


`ifndef S_QUER__SV
`define S_QUER__SV


typedef class s_item;
class s_quer extends uvm_sequencer # (s_item);

   `uvm_component_utils(s_quer)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:s_quer

`endif // S_QUER__SV
