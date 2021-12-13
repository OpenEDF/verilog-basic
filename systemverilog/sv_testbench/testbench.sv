/* Thsi is a systemverilog testbecn file */

bit clock = 0;
bit reset = 1;   

// bus
interface main_bus (input logic clock, reset);
    logic [31:0] in_t;
    logic [31:0] out_t;
endinterface

module testbench;

timeunit 1ns;
timeprecision 10ps;

main_bus bus (
    .clock(clock),
    .reset(reset)
);

// clock
always #5 clock = ~clock;
    
// instance
adder u0 (
   .clk(bus.clock),
   .n_rst(bus.reset),
   .in(bus.in_t),
   .out(bus.out_t)
);

initial begin
    $display("This is test for systemverilog to test verilog.\n");
    #10
    #10 bus.in_t = 32'h11223344;
    #10 bus.in_t = 32'h40001000;
    #20
    $finish;
end

// monitor
initial begin
    $monitor("input = 0x%x, output = 0x%x", bus.in_t, bus.out_t);
end

endmodule
