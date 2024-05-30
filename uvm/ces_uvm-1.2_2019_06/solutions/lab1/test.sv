program automatic test;
import uvm_pkg::*;
`include "packet.sv"
`include "driver.sv"
`include "input_agent.sv"
`include "router_env.sv"
`include "test_collection.sv"

initial begin
  $timeformat(-9, 1, "ns", 10);
  run_test();
end
endprogram
