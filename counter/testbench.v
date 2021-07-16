/* 3bit counter */
`timescale 1ns/1ps
module testbench ();

reg clock;
reg rst;
wire [2:0] OUT;

count3bit test_unit(
    .clk(clock),
    .clr(rst),
    .Q(OUT)
);

/* clock generation */
initial begin
    clock = 0;
    forever #100 clock = ~clock;
end

initial begin
	rst = 1'b1;
	forever #5000 rst = ~rst;
end

/* generate data dump */
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

	/* auto loader  */
    #50000

    $finish;
end

initial begin
    $monitor("RST = %d   OUT = %d\n", rst, OUT);
end

endmodule
