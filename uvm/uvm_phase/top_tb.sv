`timescale 1ns/1ps
`include "uvm_macros.svh"

import uvm_pkg::*;
`include "new_world.sv"

module top_tb;

initial begin
    new_world world;
   
    /* run uvm test */ 
    run_test("world");
end

endmodule
