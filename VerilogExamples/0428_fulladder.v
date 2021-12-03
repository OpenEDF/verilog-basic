// nonblocking assignments (not recommended)
module fulladder(input      a, b, cin, 
                 output reg s, cout);

  reg p, g;

  always @(*) 
    begin
      p <= a ^ b; 		// nonblocking
      g <= a & b; 		// nonblocking

      s <= p ^ cin;		// nonblocking
      cout <= g | (p & cin);	// nonblocking
    end
endmodule
