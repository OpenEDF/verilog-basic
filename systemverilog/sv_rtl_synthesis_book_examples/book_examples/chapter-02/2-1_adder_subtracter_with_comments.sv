//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// RTL model of a 32-bit adder/subtracter
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

/*
 * RTL model of a 32-bit adder/subtracter
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
 * mode inputs. These blocks must use the same clock, so that
 * no clock synchronizers are needed within this model.
 *
 * Revision History:
 * 1.0: 25 Jun 2016: Initial development
 * 1.1:  7 Jul 2016: Changed mode to match revised design spec.
 *
 */
`begin_keywords "1800-2012"
module rtl_adder_subtracter
(input  logic        clk,   // clock input
 input  logic        rstN,  // active low reset input
 input  logic        mode,  // add/subtract control input
 input  logic [31:0] a, b,  // 32-bit inputs
 output logic [31:0] sum    // 32-bit output
);
  timeunit 1ns/1ns;

  // registered adder/subtracter with asynch reset
  always_ff @(posedge clk or negedge rstN) begin
    if (!rstN) sum <=0;
    else case (mode) 
      1'b0: sum <= a + b;  // unsigned integer add, no overflow
      1'b1: sum <= a - b;  // unsigned integer subtract, no
    endcase                // underflow
  end
endmodule: rtl_adder_subtracter
`end_keywords
