
//Following is the Verilog code for a 4-bit signed up counter with an asynchronous reset and a modulo maximum.

module counter (clk, clr, q);
  parameter MAX_SQRT = 4, MAX = (MAX_SQRT*MAX_SQRT);
  input clk, clr;
  output [MAX_SQRT-1:0] q;
  reg [MAX_SQRT-1:0] cnt;
  always @ (posedge clk or posedge clr)
    begin
      if (clr)
        cnt <= 0;
      else
        cnt <= (cnt + 1) % MAX;
    end
  assign q = cnt;
endmodule

