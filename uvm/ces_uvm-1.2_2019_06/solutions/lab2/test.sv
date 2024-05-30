program automatic test;
import uvm_pkg::*;

// Lab 2: Task 4, Step 2
//
// Delete all the include statements.
// Replace with import router_test_pkg::*;
//
// ToDo
import router_test_pkg::*;

initial begin
  $timeformat(-9, 1, "ns", 10);
  run_test();
end

endprogram

