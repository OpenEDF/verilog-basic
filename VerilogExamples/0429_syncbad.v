module syncbad(input      clk, 
              input      d, 
              output reg q);

  reg n1;

  // This is a bad implementation 
  // using blocking assignment

  always @(posedge clk)
    begin
      n1 = d; // blocking
      q = n1; // blocking
    end
endmodule