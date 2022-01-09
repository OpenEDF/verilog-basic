package test_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class top extends uvm_test;
    `uvm_component_utils(top)
    function new(string name = "top", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("UVM_TOP", "UVM TOP Creating", UVM_LOW)
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info("UVM_TOP", "test is running", UVM_LOW)
        phase.drop_objection(this);
    endtask

endclass : top

endpackage


module uvm_test_inst;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import test_pkg::*;


initial begin
    `uvm_info("UVM_TOP", "test started", UVM_LOW)
    run_test("top");
end

endmodule
