module gates(input  [3:0] a, b,
             output [3:0] y1, y2, 
                          y3, y4, y5);

   /* Five different two-input logic 
      gates acting on 4 bit busses */
   assign y1 = a & b;    // AND
   assign y2 = a | b;    // OR
   assign y3 = a ^ b;    // XOR
   assign y4 = ~(a & b); // NAND
   assign y5 = ~(a | b); // NOR
endmodule