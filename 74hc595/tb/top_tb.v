`timescale 1ns / 1ps

module top_tb();

parameter T = 10;

// signal
reg srclk;
wire ser;
wire rclk;
wire srclr_n;
wire oe_n;
wire [7:0] d_out;
wire ser_out; 

// instance
sipo74hc595 u0 (
    .SRCLK(srclk),
    .SER(ser),
    .RCLK(rclk),
    .SRCLR_n(srclr_n),
    .OE_n(oe_n),
    .QA_H(d_out),
    .QH_ser(ser_out)
);

// clock
initial begin
    srclk = 0;
    forever #T srclk = ~srclk; 
end

initial begin
    #20000
    $display("Simluation End!\n");
    $finish;
end

endmodule
