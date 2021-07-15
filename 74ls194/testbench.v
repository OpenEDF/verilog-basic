`timescale 1ns/1ps
module testbench ();

/* signal and data */
reg clock;
reg rst;
reg [1:0] S;
reg [1:0] DS;
reg [3:0] D;
wire [3:0] Q;

reg74ls194 test_unit(
	.CR_n(rst),
	.CP(clock),
	.S0(S[0]),
	.S1(S[1]),
	.DSl(DS[0]),
	.DSr(DS[1]),
	.D0(D[0]),
	.D1(D[1]),
	.D2(D[2]),
	.D3(D[3]),
	.Q0(Q[0]),
	.Q1(Q[1]),
	.Q2(Q[2]),
	.Q3(Q[3])
);

/* clock generation */
initial begin
    rst = 1;
    clock = 0;
    forever #100 clock = ~clock;
end

/* generate data dump */
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);
	
	#100 S = 2'b10;
	#200 DS[0] = 1'b1;
	#200 DS[0] = 1'b0;
	#200 DS[0] = 1'b0;
	#200 DS[0] = 1'b1;
	#200 S = 2'b00;

	#200 rst = 0;
	#200 rst = 1;

	#200 S = 2'b01;
	#200 DS[1] = 1'b0;
	#200 DS[1] = 1'b1;
	#200 DS[1] = 1'b1;
	#200 DS[1] = 1'b0;
	#200 S = 2'b00;

	#200 S = 2'b00;
	#200 S = 2'b11;
	#1000 D = 4'b1100;
	#1000

    $finish;
end

initial begin
    $monitor("RST = %d  S = %2b  DSr = %d   DSl = %d   D = %4b   Q = %4b\n", rst, S, DS[0], DS[1], D, Q);
end

endmodule
