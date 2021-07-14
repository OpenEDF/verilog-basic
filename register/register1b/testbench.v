`timescale 1ns/1ps
module testbench ();

reg clock;
reg rst;
reg load;
reg inp;
wire q;

register1b test_unit(
	.load(load),
    .clk(clock),
    .clr(rst),
    .inp(inp),
    .Q(q)
);

/* clock generation */
initial begin
    rst = 0;
    clock = 0;
    forever #100 clock = ~clock;
end

initial begin
	inp = 0;
	forever #200 inp = ~inp;
end

/* generate data dump */
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);
    
	#500 load = 1'b1;
    #100 rst = 1'b1;
	#100 rst = 1'b0;
    #500 load = 1;
	#500 load = 0;
	#500
    $finish;
end

initial begin
    $monitor("LOAD = %d    INP = %d   RST = %d    Q = %d\n", load, inp, rst, q);
end

endmodule
