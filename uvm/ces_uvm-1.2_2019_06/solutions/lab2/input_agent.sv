class input_agent extends uvm_agent;
  `uvm_component_utils(input_agent)

  // The uvm_sequencer class as defined in the uvm_pkg can be used as is.
  // One need to just parameterize it to the transaction class one wants
  // to have the sequencer pass to the driver.
  //
  // whenever you are dealing with a parameterized class, it is always a
  // good idea to use the typedef mechanism to hide the parameter for
  // easier handling in the code.  That's what you see below.

  typedef uvm_sequencer#(packet) packet_sequencer;

  // The following are the sequencer and driver instances.

  packet_sequencer sqr;
  driver drv;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Construction of component should always be done through the factory
    // create mechanism.  The name arguement must match the instance name.
    // The parent handle must be set to reference this object.

    sqr = packet_sequencer::type_id::create("sqr", this);
    drv = driver::type_id::create("drv", this);
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // The connection between the driver and the sequencer must be done
    // in the connect phase.

    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction: connect_phase

endclass: input_agent
