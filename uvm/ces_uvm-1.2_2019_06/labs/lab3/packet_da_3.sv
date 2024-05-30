class packet_da_3 extends packet;
  `uvm_object_utils(packet_da_3)

  // Lab 2: Task 9, Step 2 - constrain the destination address (da) to 3
  //
  // ToDo
  constraint da_3 {
    da == 3;
  }

  function new(string name = "packet_da_3");
    super.new(name);
   `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new
endclass: packet_da_3

