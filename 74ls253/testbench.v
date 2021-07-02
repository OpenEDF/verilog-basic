`timescale 1ns/1ps

module testbench ();
    
reg A, B;
reg [1:0] EN_n;
reg [1:0] D0, D1, D2, D3;
wire [1:0] Y;

top_74ls253 test_unit(
    .A(A),
    .B(B),
    .EN_n(EN_n),
    .D1_0(D0[0]),
    .D1_1(D1[0]),
    .D1_2(D2[0]),
    .D1_3(D3[0]),
    .D2_0(D0[1]),
    .D2_1(D1[1]),
    .D2_2(D2[1]),
    .D2_3(D3[1]),
    .Y1(Y[0]),
    .Y2(Y[1])
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    /* enable MUX outbut */
        EN_n = 2'b11; B = 1'bx; A = 1'bx; D0 = 2'bxx; D1 = 2'bxx; D2 = 2'bxx; D3 = 2'bxx;
    #10 EN_n = 2'b10; B = 0; A = 0; D0 = 2'bx0; D1 = 2'bxx; D2 = 2'bxx; D3 = 2'bxx;
    #10 EN_n = 2'b10; B = 0; A = 0; D0 = 2'bx1; D1 = 2'bxx; D2 = 2'bxx; D3 = 2'bxx;
    #10 EN_n = 2'b10; B = 0; A = 1; D0 = 2'bxx; D1 = 2'bx0; D2 = 2'bxx; D3 = 2'bxx;
    #10 EN_n = 2'b10; B = 0; A = 1; D0 = 2'bxx; D1 = 2'bx1; D2 = 2'bxx; D3 = 2'bxx;
    #10 EN_n = 2'b10; B = 1; A = 0; D0 = 2'bxx; D1 = 2'bxx; D2 = 2'bx0; D3 = 2'bxx;
    #10 EN_n = 2'b10; B = 1; A = 0; D0 = 2'bxx; D1 = 2'bxx; D2 = 2'bx1; D3 = 2'bxx;
    #10 EN_n = 2'b10; B = 1; A = 1; D0 = 2'bxx; D1 = 2'bxx; D2 = 2'bxx; D3 = 2'bx0;
    #10 EN_n = 2'b10; B = 1; A = 1; D0 = 2'bxx; D1 = 2'bxx; D2 = 2'bxx; D3 = 2'bx1;
    $finish;
end

initial begin
    $monitor("EN_n = %2b  B = %d  A = %d  D0 = %d  D1 = %2b  D2 = %2b  D3 = %2b  Y1 = %d \n", EN_n, B, A, D0, D1, D2, D3, Y[0]);
end
    
endmodule

