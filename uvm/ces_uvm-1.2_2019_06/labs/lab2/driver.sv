// The driver class is derived from the uvm_driver class and must be parameterized
// with the transaction class that the driver is expected to operate on.
//
// Once parameterized (in this case to the packet class), you will have three
// built-in handles associated with this transcation class available for use.
//
// The first handle is seq_item_port.  This is the built-in TLM port parameterized
// to carry the transaction (packet in this case) generated in the sequence to be
// passed onto to the driver through the sequencer.  In the driver class, you will
// be using this handle to retrieve the request transaction for processing.
//
// The next two handles are req and rsp (handles of the parameter class: packet).
// The req handle is intended to be used when picking up the request object from
// the sequence.  The rsp handle is intended to be used for sending a response back
// to the sequence.

class driver extends uvm_driver #(packet);

  // Register component class into UVM factory.
  `uvm_component_utils(driver)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  // The job of the physical layer components is to emulate the behavior of of the external
  // interface to the DUT.  Typically, this means emulating the Verilog always code.
  //
  // The run_phase is intended for this emulation in the physical layer.  In the run_phase,
  // you should implement an infinite loop as shown below.  Just like in Verilog always code,
  // the first statement in the forever loop must be a wait statement.  In this case, the
  // call to get_next_item().  This call is making a request to the sequencer for a transaction
  // to be generated in the sequence and passed onto to the driver through the TLM port.
  // If the sequence is not ready to provide the transaction, get_next_item() will block
  // until the sequence is ready to make the request.

  virtual task run_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    forever begin
      seq_item_port.get_next_item(req);

      // Once the request item is retrieved, it is the job of the driver to execute the
      // interface protocol and drive the transaction into the DUT.

      send(req);

      // When the driver finishes processing the request item, the driver must call the
      // item_done() method of the TLM port to indicate to the sequence that the driver has
      // completed processing of the request item.  If item_done() not called, subsequent calls
      // of get_next_item() will result in errors and the get_next_item() will return the
      // same object handle repeatedly, typically resulting in an infinite loop!

      seq_item_port.item_done();
    end
  endtask: run_phase

  virtual task send(packet pkt);

    // For this lab, there will be no processing of the request item.  For now, the only thing
    // done in this device driver is to use the sprint() method of the request item to display
    // the content of the object on the terminal screen.  In a future lab, protocol execution
    // will be implemented.
    //
    // For your own testbench, this is the most critical code that you will write.  The code
    // that goes into this method must implement the protocal defined in your project spec
    // correctly.

    `uvm_info("DRV_RUN", {"\n", req.sprint()}, UVM_MEDIUM);
  endtask: send

endclass: driver

