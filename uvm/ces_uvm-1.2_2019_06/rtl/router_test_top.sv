module router_test_top;
  parameter simulation_cycle = 100 ;
  bit  SystemClock;

  reset_io  reset_if(SystemClock);
  router_io router_if(SystemClock);
  host_io   host_if(SystemClock);
  router    dut(.clk(SystemClock), .reset_n(reset_if.reset_n), .io(router_if), .host(host_if));

  initial begin
    $fsdbDumpvars;
    forever #(simulation_cycle/2) SystemClock = ~SystemClock ;
  end
endmodule  
