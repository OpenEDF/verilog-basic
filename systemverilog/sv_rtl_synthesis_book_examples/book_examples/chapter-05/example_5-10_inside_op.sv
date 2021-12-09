//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using the inside operator to decode whenever address is on
// a quadrant boundary of the address range.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Decoder that sets a flag whenever address is on a quadrant
// boundary of the address range.
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module boundary_detector
#(parameter N = 16)
(input  logic [N-1:0] address,      // address bus
 output logic         boundary_flag // set when address is at
);                                  // a quadrant boundary
  timeunit 1ns/1ns;

  always_comb begin
    boundary_flag = (address inside {(0),            // quad 1
                                     (((2**N)/4)*1), // quad 2
                                     (((2**N)/4)*2), // quad 3
                                     (((2**N)/4)*3)  // quad 4
                                    } );
  end
endmodule: boundary_detector
`end_keywords
