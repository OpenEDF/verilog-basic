`timescale 1ns/1ps
module testbench ();

reg [3:0] in;
wire [4:0] out;

binbcd4 test_uut (
    .b(in),
    .p(out)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);
    
    /* signal */
    in = 4'bxxxx;
    #100 in = 4'b0000;
    #100 in = 4'b0001;
    #100 in = 4'b0010;
    #100 in = 4'b0011;
    #100 in = 4'b0100;
    #100 in = 4'b0101;
    #100 in = 4'b0110;
    #100 in = 4'b0111;
    #100 in = 4'b1000;
    #100 in = 4'b1001;
    #100 in = 4'b1010;
    #100 in = 4'b1011;
    #100 in = 4'b1100;
    #100 in = 4'b1101;
    #100 in = 4'b1101;
    #100 in = 4'b1111;
    #100
    $finish;
end

initial begin
    $monitor("IN = %d  OUT = %d\n", in, out);
end
    
endmodule
