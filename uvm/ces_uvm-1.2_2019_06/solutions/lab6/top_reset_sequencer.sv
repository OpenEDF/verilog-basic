class top_reset_sequencer extends uvm_sequencer;
  `uvm_component_utils(top_reset_sequencer)

  typedef uvm_sequencer#(reset_tr) reset_sequencer;
  typedef uvm_sequencer#(packet)   packet_sequencer;

  // Lab 6 - To simplify your typing.  A typedef is used to name the host
  // sequencer class as host_sequencer.
  typedef uvm_sequencer#(host_data) host_sequencer;

  reset_sequencer  r_sqr;
  packet_sequencer pkt_sqr[$];

  // Lab 6 - Task 4, Step 2
  //
  // Declare a host_sequencer handle called h_sqr
  //
  // host_sequencer h_sqr;
  //
  // ToDo
  host_sequencer h_sqr;

  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new
endclass: top_reset_sequencer

