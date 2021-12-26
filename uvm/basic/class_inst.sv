module sv_class_inst;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  class top;
    function new();
      `uvm_info("SV_TOP", "SV TOP creating", UVM_LOW)
    endfunction
  endclass

  initial begin
    top t; 
    `uvm_info("SV_TOP", "test started", UVM_LOW)
    t = new();
    `uvm_info("SV_TOP", "test finished", UVM_LOW)
  end

endmodule
