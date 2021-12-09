module latch (g, d, clr, q);
input g, d, clr;
output q;
reg q;
always @(g or d or clr)
begin
if (clr)
q <= 1’b0;
else if (g)
q <= d;
end
Verilog FAQ
Synthesis FAQ
Digital FAQ
Timing FAQ
ASIC FAQ
Cmos FAQ
Misc FAQ
Home
Go to top
Verilog examples useful for FPGA & ASIC Synthesis http://www.asic.co.in/Index_files/verilogexamples.htm
4 of 21 9/28/2016 4:34 PM
endmodule