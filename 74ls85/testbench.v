`timescale 1ns/1ps

module testbench ();
    
reg [3:0]A, B;
reg IG, IL, IE;
wire G, E, L;

compare_74ls85 test_uniti (
    .A3(A[3]),
    .A2(A[2]),
    .A1(A[1]),
    .A0(A[0]),
    .B3(B[3]),
    .B2(B[2]),
    .B1(B[1]),
    .B0(B[0]),
	.IAGB(IG),
    .IALB(IL),
    .IAEB(IE),
	.FAGB(G),
	.FALB(L),
	.FAEB(E)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    /* enable MUX outbut */
    A = 4'bxxxx; B = 4'bxxxx; IG = 1'bx; IL = 1'bx; IE = 1'bx;
    #10 A = 4'b0011; B = 4'b0001; IG = 1'b1; IL = 1'b0; IE = 1'b0;
    #10 A = 4'b0011; B = 4'b0111; IG = 1'b0; IL = 1'b1; IE = 1'b0;
    #10 A = 4'b0011; B = 4'b0011; IG = 1'b1; IL = 1'b0; IE = 1'b0;
    #10 A = 4'b0011; B = 4'b0011; IG = 1'b0; IL = 1'b1; IE = 1'b0;
    #10 A = 4'b0011; B = 4'b0011; IG = 1'b0; IL = 1'b0; IE = 1'b1;
    #10 A = 4'b0011; B = 4'b0011; IG = 1'b1; IL = 1'b1; IE = 1'b0;
    #10 A = 4'b0111; B = 4'b0011; IG = 1'b1; IL = 1'b1; IE = 1'b0;
    #10 A = 4'b0011; B = 4'b1111; IG = 1'b0; IL = 1'b1; IE = 1'b1;
	#20
    $finish;
end

initial begin
    $monitor("A = %d  B = %d  IG = %d  IL = %d  IE = %d  FG = %d  FL = %d  FE = %d\n", A, B, IG, IL, IE, G, L, E);
end
    
endmodule

