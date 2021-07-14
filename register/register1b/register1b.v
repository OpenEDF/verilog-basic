/* 1bit register */
module register1b (
    input wire load, 
    input wire clk,
    input wire clr,
    input wire inp,
    output reg Q
);

wire D;
assign D = (Q & ~load) | (inp & load);

/* D fiop flop */
always @(posedge clk or posedge clr) begin
    if (clr == 1)
        Q <= 0;
    else
        Q <= D;
end

endmodule
