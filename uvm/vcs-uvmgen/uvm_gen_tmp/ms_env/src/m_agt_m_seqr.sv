//
// Template for UVM-compliant sequencer class
//


`ifndef M_SEQR__SV
`define M_SEQR__SV


typedef class m_item;
class m_seqr extends uvm_sequencer # (m_item);

   `uvm_component_utils(m_seqr)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:m_seqr

`endif // M_SEQR__SV
