/* model 5 counter */
module mod5cnt(
    input wire clk,
    input wire clr,
    output reg [2:0] Q
);

always @(posedge clr or posedge clk) begin
    if (clr == 1)
        Q <= 0;
    else if ( Q == 4)
        Q <= 0;
    else 
        Q <= Q + 1;
end
    
endmodule
