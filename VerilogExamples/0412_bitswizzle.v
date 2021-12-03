module swizzle(input  [3:0]  c, d,
               output [8:0] y);

  assign y = {c[2:1], {3{d[0]}}, c[0], 3'b101};
endmodule