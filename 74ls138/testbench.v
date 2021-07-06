`timescale 1ns/1ps

module testbench ();

reg [2:0] IN;
reg [2:0] EN;
wire [7:0] OUT;

decode_74ls138 test_unit(
    .A0(IN[0]),
    .A1(IN[1]),
    .A2(IN[2]),
    .G1(EN[0]),
    .G2(EN[1]), 
    .G3(EN[2]),
    .Y0(OUT[0]),
    .Y1(OUT[1]),
    .Y2(OUT[2]), 
    .Y3(OUT[3]), 
    .Y4(OUT[4]), 
    .Y5(OUT[5]), 
    .Y6(OUT[6]), 
    .Y7(OUT[7])
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    /* enable MUX outbut */
    IN = 3'bxxx;  EN = 3'bxxx;  
    #100 EN = 3'bx1x; IN = 3'b000; 
    #100 EN = 3'bxx0; IN = 3'b000; 
    #100 EN = 3'b001; IN = 3'b000; 
    #100 EN = 3'b001; IN = 3'b001;
    #100 EN = 3'b001; IN = 3'b010;
    #100 EN = 3'b001; IN = 3'b011;
    #100 EN = 3'b001; IN = 3'b100; 
    #100 EN = 3'b001; IN = 3'b101;
    #100 EN = 3'b001; IN = 3'b110;
    #100 EN = 3'b001; IN = 3'b111;
    #200
    $finish;
end

initial begin
    $monitor("G1 = %d  G2 = %d  G3 = %d  IN[A]= %d  IN[B]= %d  IN[C]= %d  Y[0] = %d  Y[1] = %d  Y[2] = %d  Y[3] = %d  Y[4] = %d  Y[5] = %d  Y[6] = %d  Y[7] = %d \n",
		   	EN[0], EN[1], EN[2], IN[0], IN[1], IN[2], OUT[0], OUT[1], OUT[2], OUT[3], OUT[4], OUT[5], OUT[6], OUT[7]);
end

endmodule
