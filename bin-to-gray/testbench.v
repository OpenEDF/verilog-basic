//-------------------------------------------------------------------
`timescale 1ns/1ps
module testbench;

// signal
reg clk;
reg rst_n;
reg en;
wire [7:0] gray_out;

// instantiate
bin_gray test_uut (
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .gray_out(gray_out)
);

// generate vcd file
initial begin
    $dumpfile("test.vcd");
    $dumpvars(2, testbench);
end

// generate clock signal
initial begin
    clk = 1'b0;
    forever #20 clk = ~clk; 
end

// simulation
initial begin
    #1;
    en = 1'b0;
    rst_n = 1'b0;
    #50;
    rst_n = 1'b1;
    #50;
    en = 1'b1;
    #1000;
    en = 1'b0;
    $finish;
end

// monitor
initial begin
    $monitor("reset = %d enable = %d grayout = %b\n", rst_n, en, gray_out);
end
    
endmodule
//-------------------------------------------------------------------
