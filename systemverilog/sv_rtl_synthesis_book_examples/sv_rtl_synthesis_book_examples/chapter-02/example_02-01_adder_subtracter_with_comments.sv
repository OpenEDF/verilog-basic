//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// RTL model of a 32-bit adder/subtractor
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

/*
 * RTL model of a 32-bit adder/subtractor
 *
 * Developed for Project X.
 *
 * Creator: Stuart Sutherland.
 *
 * Specification:
 * Performs unsigned 32-bit arithmetic, with no overflow or
 * underflow. A mode control selects whether the operation is
 * an add or a subtract.
 * - Add when mode is low
 * - Subtract when mode is high
 * The output is registered.
 * The register has an active low, asynchronous reset.
 *
 * NOTE: This model must be synthesized in conjunction with
 * blocks that provide registered values for the a, b, and
 * mode inputs. These blocks must use the same clk, so that
 * no clk synchronizers are needed within this model.
 *
 * Revision History:
 * 1.0: 25 Jun 2016: Initial development
 * 1.1:  7 Jul 2016: Changed mode to match revised design spec.
 *
 */
//`begin_keywords "1800-2012"
module rtl_adder_subtractor
(input  logic        clk,   // clk input
 input  logic        rstN,  // active low reset input
 input  logic        mode,  // add/subtract control input
 input  logic [31:0] a, b,  // 32-bit inputs
 output logic [31:0] sum    // 32-bit output
);
  timeunit 1ns; timeprecision 1ns;

  // registered adder/subtractor with async reset
  always_ff @(posedge clk or negedge rstN) // async reset 
    if (!rstN) sum <=0;                    // active low reset
    else case (mode) 
      1'b0: sum <= a + b;  // unsigned integer add, no overflow
      1'b1: sum <= a - b;  // unsigned integer subtract, no
    endcase                // underflow

endmodule: rtl_adder_subtractor
//`end_keywords
