//The following Verilog code models a priority encoder with three-state output:

module Pri_Encoder32 (InBus, Clk, OE, OutBus);
input [31:0]InBus; input OE, Clk; output [4:0]OutBus;
reg j; reg [4:0]OutBus;
always @( posedge Clk)
begin
if (OE == 0) OutBus = 5'bz ;
else
begin OutBus = 0;
for (j = 31; j >= 0; j = j - 1)
begin if (InBus[j] == 1) OutBus = j; end
end
end
endmodule

//In lines 9 – 11 the binary-encoded output is set to the position of the lowest-indexed '1'
//in the input bus. The logic synthesizer must be able to unroll the loop in a for statement.
//Normally the synthesizer will check for fixed (or static) bounds on the loop limits, as in
//line 9 above.