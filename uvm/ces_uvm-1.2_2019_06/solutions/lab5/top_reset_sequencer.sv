//
// The following top reset sequencer has been created for your in order to save
// lab time.
//
// An upper layer sequencer typically contains a collection of resources needed by
// the individual sequences being managed by an upper layer sequence.
//
// In this particular case, there are two sequencer types that need to be made 
// accessible in the top reset sequence: reset_sequencer and packet_sequencer.
//
// Because there are multiple router input port agents, the packet_sequencer
// handbles are stored in a queue.
//

 
class top_reset_sequencer extends uvm_sequencer;
  `uvm_component_utils(top_reset_sequencer)

  typedef uvm_sequencer#(reset_tr) reset_sequencer;
  typedef uvm_sequencer#(packet)   packet_sequencer;

  reset_sequencer  r_sqr;
  packet_sequencer pkt_sqr[$];

  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new
endclass: top_reset_sequencer

