`ifndef ROUTER_IO__SV
`define ROUTER_IO__SV

interface router_io(input bit clk);

   logic [15:0] frame_n ;
   logic [15:0] valid_n ;
   logic [15:0] din ;
   logic [15:0] dout ;
   logic [15:0] busy_n ;
   logic [15:0] valido_n ;
   logic [15:0] frameo_n ;

   clocking drvClk @(posedge clk);
      output  frame_n;
      output  valid_n;
      output  din;
      input   busy_n;
   endclocking: drvClk

   clocking iMonClk @(posedge clk);
      input  frame_n;
      input  valid_n;
      input  din;
      input  busy_n;
   endclocking: iMonClk

   clocking oMonClk @(posedge clk);
      input  dout;
      input  valido_n;
      input  frameo_n;
   endclocking: oMonClk

   modport dut(input clk, frame_n, valid_n, din, output dout, busy_n, valido_n, frameo_n);

endinterface: router_io

`endif
