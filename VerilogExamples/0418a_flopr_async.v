
module flopr(input            clk,
             input            reset, 
             input      [3:0] d, 
             output reg [3:0] q);
   
  // asynchronous reset
  always @(posedge clk, posedge reset)
    if (reset) q <= 4'b0;
    else       q <= d;
endmodule
