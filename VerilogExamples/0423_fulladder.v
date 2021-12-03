// blocking assignments

module fulladder(input      a, b, cin, 
                 output reg s, cout);

  reg p, g;

  always @(*) 
    begin
      p = a ^ b;  // blocking
      g = a & b;  // blocking

      s = p ^ cin;
      cout = g | (p & cin);
    end
endmodule

