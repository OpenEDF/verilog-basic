/* N bit register */
module registerNbit #(parameter N = 8) (
    input wire load, 
    input wire clk,
    input wire clr,
    input wire [N - 1:0] inp,
    output reg [N - 1:0] Q
);

/* D fiop flop */
always @(posedge clk or posedge clr) begin
    if (clr == 1)
        Q <= 0;
    else if (load == 1)
        Q <= inp;
end

endmodule
