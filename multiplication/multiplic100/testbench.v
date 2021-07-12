`timescale 1ns/1ps

/* multiplic100 binary multiplication decimal number  */
module testbench ();

reg [7:0] mul;
wire [15:0] accu;

multiplic100 uutest (
    .x(mul),
    .p(accu)
);

integer i = 0;
initial begin
	$dumpfile("test.vcd");
    $dumpvars(0, testbench);

    mul = 8'bxxxxxxxx;
    for (i = 0; i < 256; i++) begin	
    	#100 mul = i;
	end
	#100
    $finish;
end

/* monitor result  */
initial begin
    $monitor("MUL = %d   ACCU = %d\n", mul, accu);
end

endmodule
