program automatic test;
import uvm_pkg::*;
import router_test_pkg::*;

initial begin
  uvm_resource_db#(virtual router_io)::set("router_vif", "", router_test_top.router_if);
  uvm_resource_db#(virtual reset_io)::set("reset_vif", "", router_test_top.reset_if);

  $timeformat(-9, 1, "ns", 10);
  run_test();
end

endprogram

