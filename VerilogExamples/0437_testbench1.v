`timescale 1ns/1ps

module testbench1();
  reg  a, b, c;
  wire y;

  // instantiate device under test
  example dut(a, b, c, y);

  // apply inputs one at a time

  initial begin
    a = 0; b = 0; c = 0; #10;
    c = 1; #10;
    b = 1; c = 0; #10;
    c = 1; #10;
    a = 1; b = 0; c = 0; #10;
    c = 1; #10;
    b = 1; c = 0; #10;
    c = 1; #10;
  end
endmodule

module example(input  a, b, c,
            	 output y);

   assign y = 	~a & ~b & ~c |
			 a & ~b & ~c |
			 a & ~b &  c;
endmodule
