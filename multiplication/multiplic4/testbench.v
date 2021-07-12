`timescale 1ns/1ps

/* multiplic100 binary multiplication decimal number  */
module testbench ();

reg [3:0] mula;
reg [3:0] mulb;
wire [7:0] accu;

multiplic4 uutest (
    .a(mula),
    .b(mulb),
    .p(accu)
);

integer i = 0;
initial begin
	$dumpfile("test.vcd");
    $dumpvars(0, testbench);

    mula = 4'bxxxx; mulb = 4'bxxxx;
    for (i = 0; i < 16; i++) begin	
    	#100 mula = i; mulb = i;
	end
	#100
    $finish;
end

/* monitor result  */
initial begin
    $monitor("MULA = %d   MULB = %d	   ACCU = %d\n", mula, mulb,  accu);
end

endmodule
