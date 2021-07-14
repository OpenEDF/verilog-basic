/* 1bit register */
module register1a (
    input wire load, 
    input wire clk,
    input wire clr,
    input wire inp,
    output reg Q
);

/* D fiop flop */
always @(posedge clk or posedge clr) begin
    if (clr == 1)
        Q <= 0;
    else if (load == 1)
        Q <= inp;
end

endmodule
