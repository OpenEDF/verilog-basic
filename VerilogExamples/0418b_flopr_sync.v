
module flopr(input            clk,
             input            reset, 
             input      [3:0] d, 
             output reg [3:0] q);

  // synchronous reset
  always @(posedge clk)
     if (reset) q <= 4'b0;
     else       q <= d;
endmodule

