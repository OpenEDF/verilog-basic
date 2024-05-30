// Lab 2: Task 6, Step 2 - Declare the class packet_sequence that extends
// from the uvm_sequence base class and parameterized with the packet class.
//
// This parameter is very useful in the sequence class.  With this parameter,
// you will have two handle of the parameter class to work with: req and rsp.
//
// The req handle is to be use to generate a request to be passed on to the
// driver for processing.  The rsp handle is optionally available for getting
// a response back from the driver.
//
// class packet_sequence extends uvm_sequence #(packet);
//
// ToDo



  // Register class into UVM factory.
  `uvm_object_utils(packet_sequence)

  function new(string name = "packet_sequence");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // In UVM-1.2, you can use the set_automatic_phase_objection() method to
    // automatically raise objection at the beginning of sequence execution and
    // drop it at the completion of the sequence execution.
    //
    // Since this method is only available post UVM-1.1, an additional compiler
    // directive is necessary.

    `ifndef UVM_VERSION_1_1
      set_automatic_phase_objection(1);
    `endif
  endfunction: new


  // Lab 2: Task 6, Step 3 - Declare the body() task.
  // - Embed a trace statement: `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  // - Then, generate 10 random packets
  //
  // ToDo







  // UVM-1.2 changes the way objection is raised and dropped by the sequence.
  // You can no longer directly access the starting_phase handle.  So, the code
  // you implemented in UVM-1.1 to raise and drop objection will fail compilation
  // when you move on to UVM-1.2.  You should be writing your sequence code today
  // to avoid this problem in moving on to UVM-1.2.  This can be done with the
  // compiler directive as shown below.

  `ifdef UVM_VERSION_1_1

  virtual task pre_start();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.raise_objection(this);
    end
  endtask: pre_start

  virtual task post_start();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.drop_objection(this);
    end
  endtask: post_start

  `endif 

endclass: packet_sequence
