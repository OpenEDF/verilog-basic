//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Loop statement snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// For-loop statement
//
module xor_loop; 
  logic [3:0] a_bus, b_bus, xor_bus;

always_comb begin 
  // XOR a_bus with the reverse order of b_bus
  for (int i=0; i<=3; i++)
    xor_bus[i] = a_bus[i] ^ b_bus[3-i]; 
end 


  initial begin 
    #(1*10);    // advance to unique time slot for this test number
    a_bus = 4'h3; b_bus = 4'h5;
    #1;
    $display("\n%m: a_bus=%b  b_bus=%b  xor_bus=%b (expect xor_bus=1001)\n", a_bus, b_bus, xor_bus);
  end

endmodule: xor_loop


//
// Snippet 2:
// Unrolled for-loop 
//
module xor_loop_unrolled; 
  logic [3:0] a_bus, b_bus, xor_bus;

always_comb begin 
  xor_bus[0] = a_bus[0] ^ b_bus[3-0]; 
  xor_bus[1] = a_bus[1] ^ b_bus[3-1]; 
  xor_bus[2] = a_bus[2] ^ b_bus[3-2]; 
  xor_bus[3] = a_bus[3] ^ b_bus[3-3]; 
end 

  initial begin
    #(2*10);    // advance to unique time slot for this test number
    a_bus = 4'h3; b_bus = 4'h5;
    #1;
    $display("\n%m: a_bus=%b  b_bus=%b  xor_bus=%b (expect xor_bus=1001)\n", a_bus, b_bus, xor_bus);
  end

endmodule: xor_loop_unrolled


//
// Snippet 3:
// Non-static for-loop (not synthesizable)
//
module nonstatic_find_lowest; 
  logic [31:0] data;
  logic [ 5:0] end_count, low_bit;

always_comb begin 
  // find lowest bit that is set in a 32-bit vector
  low_bit = '0;
  end_count = 32;
  for (int i=0; i<end_count; i++) begin 
    if (data[i]) begin
      low_bit = i;
      end_count = i;  // cause loop to terminate early
    end 
  end 
end 

  initial begin
    #(3*10);    // advance to unique time slot for this test number
    data=32'hFACE0000;
    #1;
    $display("\n%m: data=%b  low_bit=%0d (expect low_bit=17)\n", data, low_bit);
  end

endmodule: nonstatic_find_lowest


//
// Snippet 4:
// Static for-loop with do-nothing branch (synthesizable)
//
module static_find_lowest; 
  logic [31:0] data;
  logic [ 5:0] low_bit;
  logic        done;
  
always_comb begin 
  // find lowest bit that is set in a 32-bit vector
  low_bit = '0;
  done = '0;
  for (int i=0; i<=31; i++) begin 
    if (!done) begin 
      if (data[i]) begin 
        low_bit = i;
        done = '1;
      end
    end 
  end 
end 

  initial begin
    #(4*10);    // advance to unique time slot for this test number
    data=32'hFACE0000;
    #1;
    $display("\n%m: data=%b  low_bit=%0d (expect low_bit=17)\n", data, low_bit);
  end

endmodule: static_find_lowest


//
// Snippet 5:
// repeat-loop to raise in to the power of 3
//
module repeat_loop; 
  logic [3:0] data;
  logic [7:0] result;
  
// raise d to the power of 3 (d cubed)
always_comb begin 
  result = data;
  repeat (2) begin 
    result = result * data;
  end 
end 

  initial begin
    #(5*10);    // advance to unique time slot for this test number
    data=3;
    #1;
    $display("\n%m: data=%0d  result=%0d (expect result=27)\n", data, result);
  end

endmodule: repeat_loop


//
// Snippet 6:
// non-synthesizable while-loop to count number of bits set to one
//
module while_loop; 
  logic [15:0] data;
  logic [3:0] num_ones;
  
always_comb begin 
  logic [15:0] temp;  // local temporary variable
  num_ones = 0;
  temp = data;
  while (temp) begin // loop as long as a bit in temp is set
    if (temp[0]) num_ones++;
    temp >>= 1;
  end 
end 

  initial begin
    #(6*10);    // advance to unique time slot for this test number
    data=16'hFACE;
    #1;
    $display("\n%m: data=%b  num_ones=%0d (expect num_ones=11)\n", data, num_ones);
  end

endmodule: while_loop


//
// Snippet 7:
// Using a foreach-loop to iterate through a look-up-table
//
module foreach_loop; 
  logic update, clock;

// a 1-dimensional unpacked array of 4096 8-bit variables
logic [7:0] mem [0:4095];

// a 2-dimensional unpacked array of 32-bit variables
logic [31:0] look_up_table [8][256];


bit [7:0] LUT [0:7][0:255]; // look-up table (2-state)

always @(posedge clock)
  if (update) begin  
    foreach ( LUT [i,j] ) begin 
      update_function(LUT[i][j]);
    end 
  end 

  function void update_function(inout bit[7:0] d);  // not shown in code snippet
    d += 1;
  endfunction

  initial begin
    #(7*10);    // advance to unique time slot for this test number
    LUT[0][1] = 1;
    LUT[0][2] = 2;
    update='1;
    clock = '0;
    #1;
    clock = '1;
    #1;
    clock = '0;
    $display("\n%m: LUT[0][0]=%0d  LUT[0][1]=%0d  LUT[0][2]=%0d  (expect 1  2  3 )\n", LUT[0][0], LUT[0][1], LUT[0][2]);
  end

endmodule: foreach_loop


//
// Snippet 8:
// Using nested for-loops to iterate through a look-up-table
//
module nested_for_loop; 
  logic update, clock;

bit [7:0] LUT [0:7][0:255]; // look-up table (2-state)

always @(posedge clock)
  if (update) begin  
    for (int i=0; i<=7; i++) begin 
      for (int j=0; j<=255; j++) begin 
        update_function(LUT[i][j]);
      end 
    end 
  end 

  function automatic void update_function(inout bit[7:0] d);  // not shown in code snippet
    d += 1;
  endfunction

  initial begin
    #(8*10);    // advance to unique time slot for this test number
    LUT[0][1] = 1;
    LUT[0][2] = 2;
    update='1;
    clock = '0;
    #1;
    clock = '1;
    #1;
    clock = '0;
    $display("\n%m: LUT[0][0]=%0d  LUT[0][1]=%0d  LUT[0][2]=%0d  (expect 1  2  3 )\n", LUT[0][0], LUT[0][1], LUT[0][2]);
  end

endmodule: nested_for_loop


//
// Snippet 9:
// Using nested for-loops with iterator functions to iterate through a look-up-table
//
module loop_iterators; 
  logic update, clock;

  bit [7:0] LUT [0:7][0:255]; // look-up table (2-state)

always @(posedge clock)
  if (update) begin  
    for (int i=$left(LUT,1);
             i<=$right(LUT,1);
             i=i-$increment(LUT,1)) begin 
      for (int j=$left(LUT,2); 
               j<=$right(LUT,2); 
               j=j-$increment(LUT,2)) begin
        update_function(LUT[i][j]);
      end 
    end 
  end 
  
  function automatic void update_function(inout bit[7:0] d);  // not shown in code snippet
    d += 1;
  endfunction

  initial begin
    #(9*10);    // advance to unique time slot for this test number
    LUT[0][1] = 1;
    LUT[0][2] = 2;
    update='1;
    clock = '0;
    #1;
    clock = '1;
    #1;
    clock = '0;
    $display("\n%m: LUT[0][0]=%0d  LUT[0][1]=%0d  LUT[0][2]=%0d  (expect 1  2  3 )\n", LUT[0][0], LUT[0][1], LUT[0][2]);
$display("DEBUG: $left(LUT,1)=%0d   $right(LUT,1)=%0d   $increment(LUT,1)=%0d", $left(LUT,1), $right(LUT,1), $increment(LUT,1) ); 
$display("DEBUG: $low(LUT,1)=%0d   $high(LUT,1)=%0d \n", $low(LUT,1), $high(LUT,1) ); 
  end
endmodule: loop_iterators


`end_keywords


