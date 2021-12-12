module parity_check (input wire [63:0] data );
  assign parity = ^data; // parity is an
endmodule                // implicit local net

reg parity;  // $unit declaration is not used
             // by module parity_check

module test;
  reg [63:0] data;
  parity_check dut (data);
  initial
    begin
      parity = 'x; // set $unit parity
      data = 32;    // should change parity
      #1 $display("$unit parity = %b (expect x)", parity);
         $display("dut.parity = %b (expect 1)\n", dut.parity);
    end
endmodule
