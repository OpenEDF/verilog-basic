module uvm_compile;

  // NOTE:: it is necessary to import uvm package and macros
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  initial begin
    `uvm_info("UVM", "Hello, welcome to RKV UVM training!", UVM_LOW)
    #1us;
    `uvm_info("UVM", "Bye, and more gifts waiting for you!", UVM_LOW)
  end


endmodule

/*
UVM_INFO uvm_compile.sv(8) @ 0: reporter [UVM] Hello, welcome to RKV UVM training!
UVM_INFO uvm_compile.sv(10) @ 1000000: reporter [UVM] Bye, and more gifts waiting for you!
*/
