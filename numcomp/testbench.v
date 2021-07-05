`timescale 1ns/1ps

module testbench ();
    
reg [3:0]A, B;
wire G, E, L;

comp4bit test_unit(
    .x(A),
    .y(B),
    .gt(G),
    .eq(E),
    .lt(L)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    /* enable MUX outbut */
    A = 4'bxxxx; B = 4'bxxxx;
    #10 A = 4'b0011; B = 4'b0001;
    #10 A = 4'b0111; B = 4'b0111;
    #10 A = 4'b0011; B = 4'b1111;
	#20
    $finish;
end

initial begin
    $monitor("A = %4b  B = %4b  G = %d  E = %d  L = %d\n", A, B, G, E, L);
end
    
endmodule

