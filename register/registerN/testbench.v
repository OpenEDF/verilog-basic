`timescale 1ns/1ps
module testbench ();

reg clock;
reg rst;
reg load;
reg [7:0]inp;
wire[7:0] q;

registerNbit test_unit(
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

integer i;
/* generate data dump */
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);
    
	#100 load = 1'b1;
	for (i = 0; i < 256; i++) begin 
		#200 inp = i;
	end
	#500 load = 1'b0;
	#500 rst = 1'b1;
	#500
    $finish;
end

initial begin
    $monitor("LOAD = %d    INP = %d   RST = %d    Q = %d\n", load, inp, rst, q);
end

endmodule
