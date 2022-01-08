//
// Template for UVM-compliant sequencer class
//


`ifndef SEQ2__SV
`define SEQ2__SV


typedef class tra1;
class seq2 extends uvm_sequencer # (tra1);

   `uvm_component_utils(seq2)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:seq2

`endif // SEQ2__SV
