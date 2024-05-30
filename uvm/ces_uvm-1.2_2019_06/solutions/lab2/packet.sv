// All transaction classes must be extended from the uvm_sequence_item base class.

class packet extends uvm_sequence_item;

  // This class contain 4-bit sa (source address) and da (destination address) fields.
  // The payload field is a queue of 8-bit variable.

  rand bit [3:0] sa, da;
  rand bit[7:0] payload[$];


  // Lab 2: Task 5, Step 2 - Register the class into the UVM factory and enable the fields
  // for processing by the compare, copy, print, pack and record methods.
  //
  // For the source address field, enable everything except compare.  In the lab DUT, the
  // source address is not passed on to the output.  Therefore, it cannot be compared and
  // must be excluded from the compare() method.
  //
  //  `uvm_object_utils_begin(packet)
  //    `uvm_field_int(sa, UVM_ALL_ON | UVM_NOCOMPARE)
  //    `uvm_field_int(da, UVM_ALL_ON)
  //    `uvm_field_queue_int(payload, UVM_ALL_ON)
  //  `uvm_object_utils_end
  //
  // ToDo
  `uvm_object_utils_begin(packet)
    `uvm_field_int(sa, UVM_ALL_ON | UVM_NOCOMPARE)
    `uvm_field_int(da, UVM_ALL_ON)
    `uvm_field_queue_int(payload, UVM_ALL_ON)
  `uvm_object_utils_end


  // To make viewing the success of the labs a little easier, the payload size is
  // restricted to 1 to 10 bytes.

  constraint valid {
    payload.size inside {[1:10]};
  }


  // Lab 2: Task 5, Step 3 - Define the constructor method for the class.
  //
  // Since this is not a component class, there can only be one argument in the
  // constructor signature.  This string argument must be defaulted to the class name.
  //
  // It is also a good idea to embed a trace statement.
  //
  // function new(string name = "packet");
  //   super.new(name);
  //   `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  // endfunction: new
  //
  // ToDo
  function new(string name = "packet");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

endclass: packet

