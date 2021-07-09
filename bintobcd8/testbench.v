`timescale 1ns/1ps
module testbench ();

reg [7:0] in;
wire [9:0] out;

binbcd8 uut (
    .b(in),
    .p(out)
);

integer i;

initial begin
	$dumpfile("test.vcd");
    $dumpvars(0, testbench);

    in = 8'bxxxxxxxx;
    for (i = 0; i <= 256; i = i + 1)
        #100 in = i;
    $finish;
end

initial begin
    $monitor("IN = %d  OUT = %d\n", in, out);
end

endmodule
