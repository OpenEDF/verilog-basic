//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using the shift operator to perform a variable shift
// operation by cascading fixed-bit shifters.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Multiply by a power of two operation up to 2^7 by cascading
// a 4-bit left-shifter, a 2-bit left-shifter, and a 1-bit
// left-shifter. Each shifter is enabled by a bit of a 3-bit
// input that controls the number of times to shift.
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module algorithmic_8bit_barrel_shifter
(input  logic [7:0] data_in,   // N-bit input
 input  logic [2:0] base2exp,  // ceiling log2 of N
 output logic [7:0] data_out   // N-bit output
);
  timeunit 1ns/1ns;

  logic [7:0] stage1; // result of a 4 bit shift, if enabled
  logic [7:0] stage2; // result of a 2 bit shift, if enabled

  always_comb begin
    stage1   = base2exp[2]? (data_in << 4) : data_in;
    stage2   = base2exp[1]? (stage1  << 2) : stage1;
    data_out = base2exp[0]? (stage2  << 1) : stage2;
  end

endmodule: algorithmic_8bit_barrel_shifter
`end_keywords
