/* impletement 3 bit counter */
module count3bit (
    input wire clk,
    input wire clr,
    output reg [2:0] Q
);

always @(posedge clk or posedge clr) begin
    if (clr == 1)
        Q <= 0;
    else
        Q <= Q + 1;
    end
    
endmodule
