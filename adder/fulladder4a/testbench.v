`timescale 1ns/1ps
module testbench ();

reg [3:0] add1;
reg [3:0] add2;
reg ci;
wire [3:0] so;
wire c0;

fulladder4a uut (
    .a(add1),
    .b(add2),
    .ci(ci),
    .so(so),
    .co(co)
);

initial begin
	$dumpfile("test.vcd");
    $dumpvars(0, testbench);

    ci = 1'bx; add1 = 4'bxxxx; add2 = 4'bxxxx; 
    #100 ci = 1'b0; add1 = 4'b0001; add2 = 4'b0001;
    #100 ci = 1'b1; add1 = 4'b0011; add2 = 4'b0001;
    #100 ci = 1'b1; add1 = 4'b0111; add2 = 4'b0111;
    #100 ci = 1'b0; add1 = 4'b1001; add2 = 4'b0001;
    #100 ci = 1'b1; add1 = 4'b1101; add2 = 4'b0010;
    #100 ci = 1'b1; add1 = 4'b1001; add2 = 4'b0110;
    #100
    $finish;
end

initial begin
    $monitor("CI = %1b   ADD1 = %4b   ADD2 = %4b    SUM = %4b   CO = %1b\n", ci, add1, add2, so, co);
end

endmodule
