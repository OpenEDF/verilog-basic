/* 4 bit register */
module register4bit (
    input wire load, 
    input wire clk,
    input wire clr,
    input wire [3:0] inp,
    output reg [3:0] Q
);

/* D fiop flop */
always @(posedge clk or posedge clr) begin
    if (clr == 1)
        Q <= 0;
    else if (load == 1)
        Q <= inp;
end

endmodule
