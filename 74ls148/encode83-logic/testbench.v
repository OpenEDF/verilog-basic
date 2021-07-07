`timescale 1ns/1ps

module testbench ();

reg [7:0] IN;
wire [2:0] OUT;
wire A0;

encode83a test_unit(
    .x(IN),
    .y(OUT),
    .vaild(A0)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    IN = 8'bxxxxxxxx;  
    #100 IN = 8'b00000000;
    #100 IN = 8'b00000001;
    #100 IN = 8'b00000010;
    #100 IN = 8'b00000100;
    #100 IN = 8'b00001000; 
    #100 IN = 8'b00010000;
    #100 IN = 8'b00100000;
    #100 IN = 8'b01000000;
    #100 IN = 8'b10000000;
    #200
    $finish;
end

initial begin
    $monitor("IN = %8b    OUT = %3b   A0 = %d \n", IN, OUT, A0);
end

endmodule
