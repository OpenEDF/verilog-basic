module test;

  const bit [23:0] C1 = 7; // 24-bit constant
  const int C2 = 15;       // 32-bit constant
  const real C3 = 3.14;    // real constant
//  const C4 = 5;            // ERROR, no data type

  task automatic C;
    const int N = 5;  // N is a constant
    // ...
    $display("In task C, N = %0d (expect 5)\n", N);
  endtask

  initial begin
    C2 = 20;
    #1 $display("\nC1=%0d, C2=%0d, C3=%1.2f (expect 7, 15, 3.14)",
                C1, C2, C3);
    C; // call task
    #1 $finish;
  end

endmodule
