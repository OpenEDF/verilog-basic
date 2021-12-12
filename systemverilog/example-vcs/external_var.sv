parameter VERSION = "1.2a";   // external constant

reg resetN = 1;               // external variable (active low)

typedef struct packed {       // external user-defined type
  reg [31:0] address;
  reg [31:0] data;
  reg [ 7:0] opcode;
} instruction_word_t;


function automatic int log2 (input int n);  // external function
  if (n <=1) return(1);
  log2 = 0;
  while (n > 1) begin
    n = n/2;
    log2++;
  end
  return(log2);
endfunction

// external declaration is used to define port types
module register (output instruction_word_t q,
                 input  instruction_word_t d,
                 input  wire               clock );

  always @(posedge clock, negedge resetN)
    if (!resetN) q <= 0;  // use external reset
    else q <= d;
endmodule

module top;  // definition of top-level module
  instruction_word_t out, in;
  bit   clock;

  register i1 (out, in, clock);

  always #5 clock = ~clock;

  initial begin
    $display("Version is %s (expect 1.2a)\n", VERSION);  // use external parameter
    $display("log2 of 4096 is %0d (expect 12)\n", log2(4096));  // call external function

    in.address = 32'hFFFF1000;
    in.data = 32'h00000032;
    in.opcode = 8'h11;

    #1 resetN = 0;
    @(posedge clock) resetN <= 1;
    repeat (2) @(negedge clock) ;
    $display("in.data=%0d  out.data=%0d (expect 50, 50)\n", in.data, out.data);
    @(negedge clock) $finish;
  end
endmodule
