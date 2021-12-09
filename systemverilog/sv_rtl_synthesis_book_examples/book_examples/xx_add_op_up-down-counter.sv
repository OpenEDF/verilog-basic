Verilog examples useful for FPGA & ASIC Synthesis http://www.asic.co.in/Index_files/verilogexamples.htm

Following is the Verilog code for a 4-bit unsigned up/down counter with an asynchronous clear.

module counter (clk, clr, up_down, q);
  input clk, clr, up_down;
  output [3:0] q;
  reg [3:0] tmp;
  always @(posedge clk or posedge clr)
    begin
      if (clr)
        tmp <= 4’b0000;
      else if (up_down)
        tmp <= tmp + 1’b1;
      else
        tmp <= tmp - 1’b1;
    end
  assign q = tmp;
endmodule

