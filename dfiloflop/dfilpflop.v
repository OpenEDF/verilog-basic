/* D Flip-Flop */
module Dfilpflop (
    input wire clk, 
    input wire clr_n,
    input wire D, 
    output reg Q
);

always @ (posedge clk or posedge clr_n) begin
    if (clr_n == 1)
        Q <= 0;
    else
        Q <= D;
end 
    
endmodule
