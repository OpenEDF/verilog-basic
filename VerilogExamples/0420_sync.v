module sync(input      clk, 
            input      d, 
            output reg q);

  reg n1;

  // This is a correct implementation 
  // using nonblocking assignment

  always @(posedge clk)
    begin
      n1 <= d; // nonblocking
      q <= n1; // nonblocking
    end
endmodule