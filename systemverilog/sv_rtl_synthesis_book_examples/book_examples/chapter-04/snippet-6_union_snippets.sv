//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Union snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Unpacked union
//
module union_test_1; 
	logic clk, init;

  union {
    int  s;
    int unsigned u;
  } data;

  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display("In %m:");
    data.s = -5;
    $display("data.s is %d", data.s);
    data.u = -5;
    $display("data.u is %d", data.u);
  end
endmodule: union_test_1


//
// Snippet 2:
// Typed, packed union
//
module union_test_2; 
	logic clk, init;

  typedef union packed {   // typed union 
    int  s;
    int unsigned u;
  } data_t;
  
  data_t a, b;    // two variables of type data_t

  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display("In %m:");
    a.s = -5;
    $display("a.s is %d", a.s);
    b.u = -5;
    $display("b.u is %d", b.u);
  end
endmodule: union_test_2


//
// Snippet 3:
// Packed union
//
module union_test_3; 
	logic clk, rstN, load_data, data_ready;
	logic [7:0] data_in;
	logic [2:0] i;

  typedef struct packed {
    logic [15:0] source_address;
    logic [15:0] destination_address;
    logic [23:0] data;
    logic [ 7:0] opcode;
  } data_packet_t;
  
  union packed {
    data_packet_t    packet;  // packed structure
    logic [7:0][7:0] bytes;   // packed array
  } dreg;

  always_ff @(posedge clk, negedge rstN)
    if (!rstN) begin 
      dreg.packet <= 0;  // reset using packet type
      i <= 0;
    end 
    else if (load_data) begin 
      dreg.bytes[i] <= data_in;  // store using bytes type
      i++;
    end 
    else if (data_ready) begin
      case (dreg.packet.opcode)  // read as packet type
        8'b00: ;
        //... 
      endcase
    end

  initial begin
  	#(3*10);    // advance to unique time slot for this test number
  	rstN = 1;
  	clk <= 0;
  	$strobe();
  	$strobe("%m: Before reset:");
  	$strobe("   dreg.bytes[0] = %h", dreg.bytes[0]);
  	$strobe("   dreg.packet = %h", dreg.packet);
 
   	#1 rstN = 0;
   	#1 rstN = 1;
  	$strobe();
  	$strobe("%m: After reset:");
  	$strobe("   dreg.bytes[0] = %h", dreg.bytes[0]);
  	$strobe("   dreg.packet = %h", dreg.packet);
 
    #1;
  	data_in = 8'hFF;
  	load_data = 1;
  	data_ready = 0;
   	#1 clk = 1;
   	#1 clk = 0;

  	load_data = 0;
  	data_ready = 1;
   	#1 clk = 1;
   	#1 clk = 0;
  	$strobe();
  	$strobe("%m: After loading one byte:");
  	$strobe("   dreg.bytes[0] = %h", dreg.bytes[0]);
  	$strobe("   dreg.packet = %h", dreg.packet);
  end
endmodule: union_test_3


`end_keywords
