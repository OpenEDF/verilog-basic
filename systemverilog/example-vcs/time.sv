timeunit 1ns;        // external time unit and precision
timeprecision 1ns;

module my_chip /* ( ... ); */
  ( output wire [31:0] result,
    input  wire [31:0] data,
    input  wire        clock, resetN);

  timeprecision 1ps;  // local precision (priority over external)

  FSM FSM (result, data_request, data, clock, resetN);

  always @(posedge data_request) begin
    #2.5 send_packet;  // uses external units and local precision
    #3.75ns check_crc; // specific units take precedence
    end

  task send_packet();  /* stub for testing */
    begin
      //...
      $display("  send_packet task called");
    end
  endtask

  task check_crc();  /* stub for testing */
    begin
      //...
      $display("  check_crc task called");
    end
  endtask

endmodule

`timescale 1ps/1ps  // directive takes precedence over externals
module FSM /* ( ... ) */
  ( output int   data_out, output bit data_request,
    input [31:0] data_in,  input clock, resetN);

  timeunit 1ns;  // local units take priority over directive

  enum {LOAD, WAITE} State, Next;

  always @(State) begin
    #1.2 case (State) // uses local units & timescale precision
      WAITE: #20ps Next = LOAD;  // specific units take precedence
      LOAD:  #75ps Next = WAITE;
    endcase
  end

  always @(posedge clock, negedge resetN) begin
    if (!resetN) State <= WAITE;
    else State <= Next;
  end

  always @(State) begin
    case (State)
      WAITE: begin data_request = 1; data_out = 0; end
      LOAD:  begin data_request = 0; data_out = data_in << 2; end
    endcase
  end
endmodule

`timescale 1ns/1ps  // directive takes precedence over externals
module test;
  bit clock;
  bit resetN = 1;  // active low reset
  int data_in;
  wire [31:0] data_out;

  my_chip dut (data_out, data_in, clock, resetN);

  always #5 clock = ~clock;

  initial begin
    $timeformat(-9, 3, "ns", 10);
    $display("\nExpect send_packet and check_crc tasks to be called twice...");
    data_in = 10;
    resetN <= 0;
    @(negedge clock) resetN = 1;
    repeat(3) @(negedge clock) ;
    $display("At %t: data_in=%0d  data_out=%0d (expect 10, 40)\n",
             $realtime, data_in, data_out);
    $finish;
  end

endmodule
  
