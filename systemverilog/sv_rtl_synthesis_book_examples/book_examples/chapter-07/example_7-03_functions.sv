//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using functions to represent combinational logic.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Using a function to represent an algorithmic multiplier.
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
package definitions_pkg;
  timeunit 1ns/1ns;

  function [15:0] multiply_f([7:0] a, b);
    logic  [15:0] temp;
    if (a[0]) temp = b;
    else      temp = 0;
    for (int i=1; i<7; i++) begin
      if (a[i]) temp = temp + b << i ;
    end
    return temp;
  endfunction

endpackage: definitions_pkg
`end_keywords

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
import definitions_pkg::*;
module algorithmic_multiplier
//import definitions_pkg::*;
(input  logic [ 7:0]     a, b,
 output logic [15:0] result
);
  timeunit 1ns/1ns;

  assign result = multiply_f(a, b);

endmodule: algorithmic_multiplier
`end_keywords
