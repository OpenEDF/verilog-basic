//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// 4-bit Johnson counter correctly modeled with nonblocking assignments.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module jcounter
(output logic  [0:3] cnt,
 input  logic  clock, resetN
);
  timeunit 1ns/1ns;

  always_ff @(posedge clock)
    if (!resetN) begin    // reset the counter
      cnt <= '0;
    end 
    else begin            // shift the count
      cnt[0] <= ~cnt[3];
      cnt[1] <=  cnt[0];
      cnt[2] <=  cnt[1];
      cnt[3] <=  cnt[2];
    end 

endmodule: jcounter
`end_keywords
