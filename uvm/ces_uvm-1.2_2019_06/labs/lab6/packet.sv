class packet extends uvm_sequence_item;
  rand bit [3:0] sa, da;
  rand bit[7:0] payload[$];

  `uvm_object_utils_begin(packet)
    `uvm_field_int(sa, UVM_ALL_ON | UVM_NOCOMPARE)
    `uvm_field_int(da, UVM_ALL_ON)
    `uvm_field_queue_int(payload, UVM_ALL_ON)
  `uvm_object_utils_end

  constraint valid {
    payload.size inside {[1:10]};
  }

  function new(string name = "packet");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

endclass: packet

