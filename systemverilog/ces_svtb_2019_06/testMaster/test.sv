program automatic test();
  int a;
  string message;

  initial begin
    $vcdpluson;
    message = "SUCCESS!";
    $display(message);
    a = 0;
    $display(a);
  end
endprogram
module dut;
  int a, b=0;
  initial begin
    a = b;
  end
endmodule
module dut_dut;
  dut d1;
  test t1;
endmodule
