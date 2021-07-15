module rightshiftreg (
    input wire clk, 
    input wire clr,
    input wire Din, 
    output reg [3:0] Q
);

/* 4 bit right shift register */
always @(posedge clk or posedge clr) begin
    if (clr == 1)
        Q <= 0;
    else begin
        Q[0] <= Din;
        Q[3:1] <= Q[2:0];
    end
end
    
endmodule
