/*  verilog adder */
`timescale 1ns/10ps

module adder (
    input clk,
    input n_rst,
    input wire [31:0] in,
    output reg [31:0] out
);

always @(posedge clk or negedge n_rst) begin
    if (!n_rst)
        out <= 32'hFFFFFFFF;
    else
        out <= in + 1;
end

endmodule
