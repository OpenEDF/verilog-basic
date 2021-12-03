/*
module mux2
  #(parameter width = 8)
   (input  [width-1:0] d0, d1, 
    input              s,
    output [width-1:0] y);

   assign y = s ? d1 : d0; 
endmodule

module mux4_8(
   #(parameter numbits = 12)
    (input  [numbits-1:0] d0, d1, d2, d3,
     input  [1:0]         s,
     output [numbits-1:0] y);

  wire [numbits-1:0] low, hi;

  mux2 #(numbits) lowmux(d0, d1, s[0], low);
  mux2 #(numbits) himux(d2, d3, s[1], hi);
  mux2 #(numbits) outmux(low, hi, s[1], y);
endmodule

module mux4_12(input  [11:0] d0, d1, d2, d3,
               input  [1:0]  s,
               output [11:0] y);

  wire [11:0] low, hi;

  mux2 #(12) lowmux(d0, d1, s[0], low);
  mux2 #(12) himux(d2, d3, s[1], hi);
  mux2 #(12) outmux(low, hi, s[1], y);
endmodule
*/