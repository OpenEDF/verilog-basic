module multiplier # (parameter N = 8)
		 (input [N-1:0] a, b,
                     output [2*N-1:0] y);
  assign y = a * b;
endmodule