`timescale 1ns/1ps
module testbench ();

reg add1, add2, ci;
wire so, co;

fulladder_l uut (
    .a(add1),
    .b(add2),
    .ci(ci),
    .so(so),
    .co(co)
);

initial begin
	$dumpfile("test.vcd");
    $dumpvars(0, testbench);

    ci = 1'bx; add1 = 1'bx; add2 = 1'bx; 
    #100 ci = 1'b0; add1 = 1'b1; add2 = 1'b1;
    #100 ci = 1'b1; add1 = 1'b1; add2 = 1'b0;
    #100 ci = 1'b1; add1 = 1'b0; add2 = 1'b1;
    #100 ci = 1'b0; add1 = 1'b0; add2 = 1'b0;
    #100 ci = 1'b1; add1 = 1'b0; add2 = 1'b0;
    #100 ci = 1'b1; add1 = 1'b1; add2 = 1'b1;
    #100
    $finish;
end

initial begin
    $monitor("CI = %1b  ADD1 = %1b    ADD2 = %1b	SUM = %1b	CO = %1b\n", ci, add1, add2, so, co);
end

endmodule
