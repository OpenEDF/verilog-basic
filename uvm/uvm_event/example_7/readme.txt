Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Nov  1 23:53 2023
UVM_INFO @ 0: reporter [RNTST] Running test basic_test...
--------------------------------------
Name          Type         Size  Value
--------------------------------------
uvm_test_top  basic_test   -     @339
  comp_a      component_a  -     @352
  comp_b      component_b  -     @361
--------------------------------------
UVM_INFO component_b.sv(62) @ 0: uvm_test_top.comp_b [component_b] waiting for the event trigger
UVM_INFO component_a.sv(64) @ 10: uvm_test_top.comp_a [component_a] randomized trans
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @395
  addr   integral     4     'h9
  wr_en  integral     1     'h1
  rd_en  integral     1     'h0
  wdata  integral     8     'h48
---------------------------------

UVM_INFO component_a.sv(67) @ 10: uvm_test_top.comp_a [component_a] before triggering the event
UVM_INFO component_a.sv(70) @ 20: uvm_test_top.comp_a [component_a] after triggering the event
UVM_INFO component_b.sv(65) @ 20: uvm_test_top.comp_b [component_b] event got trigger
UVM_INFO component_b.sv(68) @ 20: uvm_test_top.comp_b [component_b] trans received,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @395
  addr   integral     4     'h9
  wr_en  integral     1     'h1
  rd_en  integral     1     'h0
  wdata  integral     8     'h48
---------------------------------

UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_objection.svh(1270) @ 20: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_report_server.svh(847) @ 20: reporter [UVM/REPORT/SERVER]
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :    8
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RNTST]     1
[TEST_DONE]     1
[component_a]     3
[component_b]     3

$finish called from file "/home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_root.svh", line 517.
$finish at simulation time                   20
           V C S   S i m u l a t i o n   R e p o r t
Time: 20 ns
CPU Time:      0.360 seconds;       Data structure size:   0.2Mb
Wed Nov  1 23:53:23 2023

