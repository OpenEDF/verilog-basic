module uvm_compile;
    
import uvm_pkg::*;
`include "uvm_macros.svh"


initial begin
    `uvm_info("UVM", "Hello, Welcome to UVM World", UVM_LOW)
    #1us;
    `uvm_info("UVM", "Bye, and more gifts waiting for you!", UVM_LOW)
end

endmodule


/*
UVM_INFO uvm_compile.sv(8) @ 0: reporter [UVM] Hello, Welcome to UVM World
UVM_INFO uvm_compile.sv(10) @ 1000000: reporter [UVM] Bye, and more gifts waiting for you!
*/
