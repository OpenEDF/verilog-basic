`timescale 1ns/1ps

module testbench ();

reg [7:0] INX;
reg EN;
wire [2:0] AX;
wire GS, EO;


encode_74ls148 test_unit (
    .I7(INX[7]), 
    .I6(INX[6]), 
    .I5(INX[5]), 
    .I4(INX[4]), 
    .I3(INX[3]), 
    .I2(INX[2]), 
    .I1(INX[1]), 
    .I0(INX[0]),
    .EI(EN),
    .A0(AX[0]),
    .A1(AX[1]),
    .A2(AX[2]),
    .GS(GS),
    .EO(EO)

);
    
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    /* signal */
    $display("-----------------------------------------------------------");
    $display("|             INTPUT                  |      OUTPUT       |");
    $display("-----------------------------------------------------------");
    $display("| EI    0   1   2   3   4   5   6   7 | A2  A1  A0  GS  EO|");
    $display("-----------------------------------------------------------");
    EN = 1'b1; INX = 8'bxxxxxxxx;
    #100 EN = 1'b1; INX = 8'bxxxxxxxx;
    #100 EN = 1'b0; INX = 8'b11111111;
    #100 EN = 1'b0; INX = 8'bxxxxxxx0;
    #100 EN = 1'b0; INX = 8'bxxxxxx0x;
    #100 EN = 1'b0; INX = 8'bxxxxx0xx;
    #100 EN = 1'b0; INX = 8'bxxxx0xxx;
    #100 EN = 1'b0; INX = 8'bxxx0xxxx;
    #100 EN = 1'b0; INX = 8'bxx0xxxxx;
    #100 EN = 1'b0; INX = 8'bx0xxxxxx;
    #100 EN = 1'b0; INX = 8'b0xxxxxxx;
    #100
    $display("-----------------------------------------------------------");
    $finish;
end

initial begin
    $monitor("| %d     %d   %d   %d   %d   %d   %d   %d   %d | %d   %d   %d   %d   %d |\n",
    EN, INX[0], INX[1], INX[2], INX[3], INX[4],INX[5], INX[6], INX[7], AX[2], 
    AX[1], AX[0], GS, EO);
end

endmodule
