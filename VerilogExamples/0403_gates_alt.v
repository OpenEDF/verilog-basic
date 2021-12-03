module gates(input      [3:0] a, b, 
             output reg [3:0] y1, y2, y3, y4, y5);

  always @(*)
    begin
      y1 = a & b;    // AND
      y2 = a | b;    // OR
      y3 = a ^ b;    // XOR
      y4 = ~(a & b); // NAND
      y5 = ~(a | b); // NOR
    end
endmodule