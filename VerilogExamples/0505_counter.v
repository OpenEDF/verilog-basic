module counter #(parameter N = 8)
                (input              clk,
                 input              reset,
                 output reg [N-1:0] q);

  always @(posedge clk or posedge reset)
    if (reset) q <= 0;
    else q <= q + 1;
endmodule