//
// Template for UVM-compliant sequencer class
//


`ifndef SEQ1__SV
`define SEQ1__SV


typedef class tra1;
class seq1 extends uvm_sequencer # (tra1);

   `uvm_component_utils(seq1)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:seq1

`endif // SEQ1__SV
