/* 3bit counter */
`timescale 1ns/1ps
module testbench ();

reg clock;
reg rst;
reg din;
wire dout;

seqdetea test_unit(
    .clk(clock),
    .clr(rst),
    .din(din),
	.dout(dout)
);

/* clock generation */
initial begin
    clock = 0;
    forever #100 clock = ~clock;
end

integer i = 0;
/* generate data dump */
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

	rst = 1'b0;		/* action */
	#500 din = 1;
	#500 din = 1;
	#500 din = 0;
	#500 din = 1;
	#500
    $finish;
end

initial begin
    $monitor("DIN = %d   DOUT = %d\n", din, dout);
end

endmodule
