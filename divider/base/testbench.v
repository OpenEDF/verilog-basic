`timescale 1ns/1ps

/* divider  */
module testbench ();

reg [7:0] num;
reg [3:0] den;
wire [7:0] quo;
wire [3:0] rem;

divider84 uutest (
    .numerator(num),
    .denominator(den),
    .quotient(quo),
	.remainder(rem)
);

integer i = 0;
initial begin
	$dumpfile("test.vcd");
    $dumpvars(0, testbench);

    num = 8'bxxxxxxxx; den = 4'bxxxx;
    for (i = 0; i < 256; i++) begin	
    	#100 num = i; den = 4'b0110;
	end
	#100
    $finish;
end

/* monitor result  */
initial begin
    $monitor("NUM = %d   DEN = %d	 QUO = %d	REM = %d\n", num, den, quo, rem);
end

endmodule
