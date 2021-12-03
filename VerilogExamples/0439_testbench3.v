module testbench3();
  reg         clk, reset;
  reg         a, b, c, yexpected;
  wire        y;
  reg  [31:0] vectornum, errors;
  reg  [3:0]  testvectors[10000:0];

  // instantiate device under test
  example dut(a, b, c, y);

  // generate clock
  always 
    begin
      clk = 1; #5; clk = 0; #5;
    end

  // at start of test, load vectors
  // and pulse reset
  initial
    begin
      $readmemb("example.txt", testvectors);
      vectornum = 0; errors = 0;
      reset = 1; #27; reset = 0;
    end

  // apply test vectors on rising edge of clk
  always @(posedge clk)
    begin
      #1; {a, b, c, yexpected} = testvectors[vectornum];
    end

  // check results on falling edge of clk
  always @(negedge clk)
    if (~reset) begin // skip cycles during reset
      if (y !== yexpected) begin  // check result
        $display("Error: inputs = %b", 
	         {a, b, c});
	$display("  outputs = %b (%b expected)",
	         y, yexpected);
	errors = errors + 1;
      end
      vectornum = vectornum + 1;
      if (testvectors[vectornum] === 4'bx) begin 
        $display("%d tests completed with %d errors", 
	         vectornum, errors);
        $finish;
      end
    end
endmodule

module example(input  a, b, c,
            	 output y);

   assign y = 	~a & ~b & ~c |
			 a & ~b & ~c |
			 a & ~b &  c;
endmodule
