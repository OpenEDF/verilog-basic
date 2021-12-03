module fulladder(input  a, b, cin, 
                 output s, cout);

  wire p, g;

  assign p = a ^ b;
  assign g = a & b;
  
  assign s = p ^ cin;
  assign cout = g | (p & cin);
endmodule