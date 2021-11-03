//---------------------------------------------------------------
// Module Name: decoder_tb
// The testbenc of decoder
// Author: WangFw
// Created on 2021-11-3
//---------------------------------------------------------------

`timescale 1ns/1ns

module decoder_tb();

reg [1:0] sel;
wire hsel_1;
wire hsel_2;
wire hsel_3;
wire hsel_4;

// generate the data dump
initial begin
  $dumpfile("test.vcd");
  $dumpvars(0, decoder_tb);
  $display("AHB Decoder test.");
  // action
  sel = 2'b00;
  #20 sel = 2'b01;
  #20 sel = 2'b10;
  #20 sel = 2'b11;
  #20
  $finish;
end


decoder dut(
  .sel(sel),
  .hsel_1(hsel_1),
  .hsel_2(hsel_2),
  .hsel_3(hsel_3),
  .hsel_4(hsel_4)
);

// monitor signal
initial begin
    $monitor("sel = %b hsel_1 = %b hsel_2 = %b hsel_3 = %b hsel_4 = %b", sel, hsel_1, hsel_2, hsel_3, hsel_4);
end

endmodule

