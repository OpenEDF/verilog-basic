`timescale 1ns/1ps
module testbench ();

reg clock;
reg rst;
reg SS;
reg IN;
wire OUT;

/* impletemetion  */
asyndfilpflop test_unit(
    .clk(clock),
    .clr(rst),
	.S(SS),
    .D(IN),
    .Q(OUT)
);

/* clock generation */
initial begin
    rst = 0;
    clock = 0;
    forever #100 clock = ~clock;
end

initial begin
	IN = 0;
	forever #200 IN = ~IN;
end

/* generate data dump */
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

	SS = 0;
    #5000 rst = 1'b0;
	#1000 SS  = 1'b1;
    #1000 rst = 1'b1;
	#1000 SS  = 1'b0;
    #2000 rst = 1'b0;
    $finish;
end

initial begin
    $monitor("IN = %d   OUT = %d   RST = %d  SS = %d\n", IN, OUT, rst, SS);
end

endmodule
