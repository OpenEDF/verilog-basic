Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Nov  1 08:19 2023
UVM_INFO @ 0: reporter [RNTST] Running test basic_test...
--------------------------------------
Name          Type         Size  Value
--------------------------------------
uvm_test_top  basic_test   -     @339
  comp_a      component_a  -     @352
  comp_b      component_b  -     @361
--------------------------------------
UVM_INFO component_a.sv(61) @ 0: uvm_test_top.comp_a [component_a] before triggering the event
UVM_INFO component_b.sv(61) @ 0: uvm_test_top.comp_b [component_b] waiting for the event trigger
UVM_INFO component_a.sv(64) @ 10: uvm_test_top.comp_a [component_a] after triggering the event
UVM_INFO component_b.sv(64) @ 10: uvm_test_top.comp_b [component_b] event got trigger
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_objection.svh(1270) @ 10: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_report_server.svh(847) @ 10: reporter [UVM/REPORT/SERVER]
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :    6
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RNTST]     1
[TEST_DONE]     1
[component_a]     2
[component_b]     2

$finish called from file "/home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_root.svh", line 517.
$finish at simulation time                   10
           V C S   S i m u l a t i o n   R e p o r t
Time: 10 ns
CPU Time:      0.300 seconds;       Data structure size:   0.2Mb
Wed Nov  1 08:19:37 2023

