//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Jump statement snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Continue statement
//
module lut_update; 
  logic        update, clock;
  logic [15:0] new_data;

bit [15:0] LUT [0:255];  // look-up table (2-state storage)

always_ff @(posedge clock)
  if (update) begin  
    for (int i = 0; i <= 255; i++) begin 
      if (LUT[i] == 0) continue;  // skip empty elements
      update_function(LUT[i], new_data);
    end 
  end 

  initial begin 
    #(1*10);    // advance to unique time slot for this test number
    LUT[1] = 1; 
    LUT[55] = 55; 
    LUT[240] = 240; 
    update = '1;
    clock = '0;
    $display("\n%m: LUT[i]= ");
    #1;
    clock = '1;
    #1;
    clock = '0;
    $display(" (expect 1  55  240)\n");
  end
  
  function void update_function([15:0] lut_data, new_data);
    $write("%0d  ", lut_data);
  endfunction

endmodule: lut_update

//
// Snippet 2:
// partial code showing the usage of a disable statement 
//
module disable_statement; 
  logic parity_error;

always_comb // this line is not in the code snippet in the book 
begin : block_name
  repeat (64) begin 
    // do something useful
    if (parity_error) disable block_name ; // exit loop early
  end 
end: block_name

  initial begin
    #(2*10);    // advance to unique time slot for this test number
    #1;
    $display("\n%m: (Only checking to see that this code compiles...) \n");
  end

endmodule: disable_statement


//
// Snippet 3:
// Incomplete case statement without a no-op branch for unused case item
//
module nop_statement_1; 
  logic [3:0] data, new_data;
  logic [1:0] mode;
  logic       clock;

always_ff @(posedge clock)
  case (mode)
    2'b00: data <= new_data ; // load new data into register
    2'b01: data <= data << 1; // shift data left
    2'b10: data <= data >> 1; // shift data right
  endcase 


  initial begin
    #(3*10);    // advance to unique time slot for this test number
    new_data=4'hA;
    clock = '0;
    mode = 2'b00;
    #1;
    clock = '1;
    $strobe("\n%m: data=%b  (expect data=1010)", data);
    #1;
    clock = '0;
    mode = 2'b01;
    #1;
    clock = '1;
    $strobe("%m: data=%b  (expect data=0100)", data);
    #1;
    clock = '0;
    mode = 2'b10;
    #1;
    clock = '1;
    $strobe("%m: data=%b  (expect data=0010)\n", data);
  end

endmodule: nop_statement_1


//
// Snippet 4:
// Complete case statement using a no-op branch for unused case item
//
module nop_statement_2; 
  logic [3:0] data, new_data;
  logic [1:0] mode;
  logic       clock;

always_ff @(posedge clock)
  case (mode)
    2'b00: data <= new_data ; // load new data into register
    2'b01: data <= data << 1; // shift data left
    2'b10: data <= data >> 1; // shift data right
    2'b11: ;                  // do nothing
  endcase 


  initial begin
    #(4*10);    // advance to unique time slot for this test number
    new_data=4'hA;
    clock = '0;
    mode = 2'b00;
    #1;
    clock = '1;
    $strobe("\n%m: data=%b  (expect data=1010)", data);
    #1;
    clock = '0;
    mode = 2'b01;
    #1;
    clock = '1;
    $strobe("%m: data=%b  (expect data=0100)", data);
    #1;
    clock = '0;
    mode = 2'b10;
    #1;
    clock = '1;
    $strobe("%m: data=%b  (expect data=0010)\n", data);
  end

endmodule: nop_statement_2


`end_keywords


