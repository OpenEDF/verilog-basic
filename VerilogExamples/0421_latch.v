module latch(input            clk, 
             input      [3:0] d, 
             output reg [3:0] q);

  always @(clk, d)
    if (clk) q <= d;
endmodule