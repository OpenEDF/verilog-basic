`timescale 1ns/1ps
module testbench ();

parameter width = 8;

reg [width - 1:0] add1;
reg [width - 1:0] add2;
wire [width - 1:0] sum;

fulladderN uut (
    .a(add1),
    .b(add2),
    .y(sum)
);

integer i = 0;
initial begin
	$dumpfile("test.vcd");
    $dumpvars(0, testbench);

    add1 = 8'bxxxxxxxx; add2 = 8'bxxxxxxxx;
    for (i = 0; i < 100; i++) begin	
    	#100 add1 = i; add2 = i; 
	end
    $finish;
end

initial begin
    $monitor("ADDA = %d   ADDB = %d   SUM = %d\n", add1, add2, sum);
end

endmodule
