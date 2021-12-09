//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// SystemVerilog RTL model of a partitioned processor with netlist,
// using explicit named port connections.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"  // use SystemVerilog-2012 keywords
module processor
(input  logic [31:0] data_in,      // operation data
 input  logic [11:0] instruction,  // operation instruction
 input  logic        clk,          // clock for all registers
 input  logic        rstN,         // asynchronous reset
 output logic [31:0] data_out,     // operation result
 output logic        data_rdy      // operation complete flag
);
  timeunit 1ns; timeprecision 100ps;

  //
  // Declare internal nets used for connecting modules
  // (interconnecting 1-bit nets will be implicitly inferred,
  // and do not need to be declared).
  //
  logic [31:0] i_data, a_data, b_data, result;
  logic [ 3:0] opcode;
  
  //
  // instantiate and connect the controller module
  // 
  controller  cntlr (.instruction(instruction),
                     .zero(zero),
                     .branching(branching),
                     .error(error),
                     .clk(clk),
                     .rstN(rstN),
                     .opcode(opcode),
                     .branch(branch),
                     .done(done),
                     .setN(setN),
                     .data_sel(data_sel),
                     .load_b(load_b),
                     .load_s(load_s),
                     .load_d(load_d)
                    );
  //
  // instantiate and connect the 32-bit MUX module
  // 
  mux32       mux   (.a(data_in),
                     .b(i_data),
                     .sel(data_sel),
                     .y(a_data)
                    );
  //
  // instantiate and connect the ALU module
  // 
  alu         alu   (.opcode(opcode),
                     .a(a_data),
                     .b(b_data),
                     .result(result),
                     .xbit(xbit),
                     .zbit(zbit)
                    );
  //
  // instantiate and connect the status register module
  // 
  status_reg  s_reg (.load(load_s),
                     .clk(clk),
                     .rstN(rstN),
                     .result(result),
                     .xbit(xbit),
                     .zbit(zbit),
                     .branch(branch),
                     .done(done),
                     .r_reg(i_data),
                     .x_reg(error),
                     .b_reg(branching),
                     .d_reg(data_rdy)
                    );
  //
  // instantiate and connect the 32-bit B register module
  // 
  reg32       b_reg (.load(load_b),
                     .d(a_data),
                     .clk(clk),
                     .setN(/* not used */),
                     .rstN(rstN),
                     .q(b_data),
                     .qb(/* not used */)
                    );
  //
  // instantiate and connect the 32-bit data register module
  // 
  reg32       d_reg (.load(load_d),
                     .d(i_data),
                     .clk(clk),
                     .setN(setN),
                     .rstN(rstN),
                     .q(data_out),
                     .qb(/* not used */)
                    );
endmodule: processor
`end_keywords

`begin_keywords "1800-2012"  // use SystemVerilog-2012 keywords
module controller
(input  logic [11:0] instruction,
 input  logic        zero,
 input  logic        branching,
 input  logic        error,
 input  logic        clk,
 input  logic        rstN,
 output logic [ 3:0] opcode,
 output logic        branch,
 output logic        done,
 output logic        setN,
 output logic        data_sel,
 output logic        load_b,
 output logic        load_s,
 output logic        load_d
);
  timeunit 1ns; timeprecision 100ps;
  /////////////////////////////////////////////
  // model functionality not yet implemented //
  /////////////////////////////////////////////
endmodule: controller

module mux32
(input  logic [31:0] a,
 input  logic [31:0] b,
 input  logic        sel,
 output logic [31:0] y
);
  timeunit 1ns; timeprecision 100ps;
  /////////////////////////////////////////////
  // model functionality not yet implemented //
  /////////////////////////////////////////////
endmodule: mux32

module alu
(input  logic [ 3:0] opcode,
 input  logic [31:0] a,
 input  logic [31:0] b,
 output logic [31:0] result,
 output logic        xbit,
 output logic        zbit
);
  timeunit 1ns; timeprecision 100ps;
  /////////////////////////////////////////////
  // model functionality not yet implemented //
  /////////////////////////////////////////////
endmodule: alu

module status_reg
(input  logic        load,
 input  logic        clk,
 input  logic        rstN,
 input  logic [31:0] result,
 input  logic        xbit,
 input  logic        zbit,
 input  logic        branch,
 input  logic        done,
 output logic [31:0] r_reg,
 output logic        x_reg,
 output logic        b_reg,
 output logic        d_reg
);
  timeunit 1ns; timeprecision 100ps;
  /////////////////////////////////////////////
  // model functionality not yet implemented //
  /////////////////////////////////////////////
endmodule: status_reg

module reg32
(input  logic        load,
 input  logic [31:0] d,
 input  logic        clk,
 input  logic        setN,
 input  logic        rstN,
 output logic [31:0] q,
 output logic [31:0] qb
);
  timeunit 1ns; timeprecision 100ps;
  /////////////////////////////////////////////
  // model functionality not yet implemented //
  /////////////////////////////////////////////
endmodule: reg32
`end_keywords
