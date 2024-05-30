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

class reset_tr extends uvm_sequence_item;
  typedef enum {ASSERT, DEASSERT} kind_e;
  rand kind_e kind;
  rand int unsigned cycles = 1;

  `uvm_object_utils_begin(reset_tr)
    `uvm_field_enum(kind_e, kind, UVM_ALL_ON)
    `uvm_field_int(cycles, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "reset_tr");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new
endclass
