//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using functions to represent combinational logic.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Using a function to represent an algorithmic multiplier.
// Russian Peasant Multiplication Algorithm: 
// 1. If b is zero then exit and output result
// 2. If b is odd then add a to the result
// 3. Double a and half b
// 4. Go back to Step 1
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
package definitions_pkg;
  timeunit 1ns; timeprecision 1ns;

  // Russian Peasant Multiplication Algorithm 
  function automatic [7:0] multiply_f([7:0] a, b);
    multiply_f = 0;
    for (int i=0; i<=3; i++) begin 
      if (b == 0) continue; // all done, finish looping
      else begin 
         if (b & 1) multiply_f += a;
         a <<= 1;  // multiply by 2
         b >>= 1;  // divide by 2
      end 
    end 
  endfunction 
endpackage: definitions_pkg
//`end_keywords 

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module algorithmic_multiplier
import definitions_pkg::*;
(input  logic [3:0] a, b,
 output logic [7:0] result
);
  timeunit 1ns; timeprecision 1ns;

  assign result = multiply_f(a, b);

endmodule: algorithmic_multiplier
//`end_keywords 

