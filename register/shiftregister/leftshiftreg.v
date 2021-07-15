module leftshiftreg (
    input wire clk, 
    input wire clr,
    input wire Din, 
    output reg [3:0] Q
);

/* 4 bit left shift register */
always @(posedge clk or posedge clr) begin
    if (clr == 1)
        Q <= 0;
    else begin
        Q[3] <= Din;
        Q[2:0] <= Q[3:1];
    end
end

endmodule
