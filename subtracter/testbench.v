`timescale 1ns/1ps
module testbench ();

parameter width = 8;

reg [width - 1:0] sub1;
reg [width - 1:0] sub2;
wire [width - 1:0] diff;

subtracterN uut (
    .a(sub1),
    .b(sub2),
    .y(diff)
);

integer i = 0;
initial begin
	$dumpfile("test.vcd");
    $dumpvars(0, testbench);

    sub1 = 8'bxxxxxxxx; sub2 = 8'bxxxxxxxx;
    for (i = 0; i < 100; i++) begin	
    	#100 sub1 = i + 2; sub2 = i; 
	end
    $finish;
end

initial begin
    $monitor("SUB1 = %d   SUB2 = %d   DIFF = %d\n", sub1, sub2, diff);
end

endmodule
