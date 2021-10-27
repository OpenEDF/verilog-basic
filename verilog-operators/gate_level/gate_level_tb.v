// Gate level testbench
`timescale 1ns/10ps

`include "gate_level.v"

module gate_level_tb;

reg a; 
reg b;
wire out;

gate_level u0 (
    .a(a),
    .b(b),
    .out(out)
);

initial begin
   a = 1'b0;
   b = 1'b0;
   #10 $display("%b xor %b = %b", a, b, out);
end        

endmodule
