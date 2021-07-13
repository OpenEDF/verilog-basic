`timescale 1ns/1ps
module testbench ();

reg clock;
reg rst;
reg IN;
wire OUT;

Dfilpflop test_unit(
    .clk(clock),
    .clr_n(rst),
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

    #5000 rst = 1'b0;
    #500 rst = 1'b1;
    #5000 rst = 1'b0;
    $finish;
end

initial begin
    $monitor("IN = %d   OUT = %d   RST = %d \n", IN, OUT, rst);
end

endmodule
