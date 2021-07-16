/* impletement N bit counter */
module countNbit #(
    parameter N = 8
)(
    input wire clk,
    input wire clr,
    output reg [N - 1:0] Q
);

always @(posedge clk or posedge clr) begin
    if (clr == 1)
        Q <= 0;
    else
        Q <= Q + 1;
    end
    
endmodule
