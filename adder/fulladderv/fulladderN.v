/* verilog impletement adder */
module fulladderN #(
    parameter N = 8
) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    output reg [N-1:0] y
);

always @(*) begin
    y = a + b;
end
    
endmodule
