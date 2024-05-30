// Reset structure is done in the same way as all other UVM component structure.
// A reset agent contains a reset sequencer, driver and monitor.
//
// The reset sequencer executes a reset sequence (this file), and passes the reset
// transaction (reset_tr) to the reset driver.  The reset driver then assert/de-assert
// the reset signal as specified in the reset transaction.
//
// Within the reset transaction class, there is a control command field called kind.
// If the kind field is ASSERT, then the driver will assert the reset signal for
// the number of clock cycles are specified in the cycles field.  Similar action
// takes place for the DEASSERT command.
//
// For example, if the reset signal need to be asserted for 1 cycles then de-asserted
// for 15 clock cycles, the potential code might look like:
//
// reset_tr tr = reset_tr::type_id::create("tr");
// tr.randomize() with {kind == ASSERT; cycles == 1;};
// tr.randomize() with {kind == DEASSERT; cycles == 15;;

class reset_sequence extends uvm_sequence #(reset_tr);
  `uvm_object_utils(reset_sequence)

  function new(string name = "reset_sequence");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    `ifndef UVM_VERSION_1_1
     set_automatic_phase_objection(1);
    `endif
  endfunction: new

  virtual task body();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // Lab 3 - Task 8, Step 2
    //
    // Enter the code to de-assert assert reset for 2 cycles.  Then assert reset for 1 cycle.
    // Followed by de-assert of reset for 15 cycles.
    //
    // For UVM-1.1 & UVM-1.2
    //
    // `ifndef UVM_VERSION
    //   `uvm_do_with(req, {kind == DEASSERT; cycles == 2;});
    //   `uvm_do_with(req, {kind == ASSERT; cycles == 1;});
    //   `uvm_do_with(req, {kind == DEASSERT; cycles == 15;});
    //
    // For IEEE UVM
    //
    // `else
    //   `uvm_do(req,,, {kind == DEASSERT; cycles == 2;});
    //   `uvm_do(req,,, {kind == ASSERT; cycles == 1;});
    //   `uvm_do(req,,, {kind == DEASSERT; cycles == 15;});
    // `endif
    //
    // ToDo



  endtask: body

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

endclass: reset_sequence
