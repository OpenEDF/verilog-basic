`timescale 1ns/1ps
module testbench ();

reg clock;
reg rst;
reg inp;
wire[3:0] q;

rightshiftreg test_unit(
    .clk(clock),
    .clr(rst),
    .Din(inp),
    .Q(q)
);

/* clock generation */
initial begin
    rst = 0;
    clock = 0;
    forever #100 clock = ~clock;
end

integer i;
/* generate data dump */
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);
	
	#100	
	#200 inp = 1'b1;
	#200 inp = 1'b0;
	#200 inp = 1'b0;
	#200 inp = 1'b1;
	#200 rst = 1;
	#1000

    $finish;
end

initial begin
    $monitor("RST = %d  INP = %d  Q = %4b\n", rst, inp, q);
end

endmodule
