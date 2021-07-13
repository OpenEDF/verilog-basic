/* Asynchronous reset filp-flop */
module asyndfilpflop (
    input wire clk,
    input wire clr,
    input wire S,
    input wire D,
    output reg Q
);

always @ (posedge clk or posedge clr or posedge S) begin
    if (S == 1)
        Q <= 1;
    else if (clr == 1)
        Q <= 0;
    else 
        Q <= D;
end

endmodule
