Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Oct 21 10:44 2023
UVM_INFO @ 0: reporter [RNTST] Running test basic_test...
UVM_INFO component_a.sv(64) @ 0: uvm_test_top.env.comp_a [component_a] transaction randomized
---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @401
  addr   integral     4     'hf
  wr_rd  integral     1     'h0
  wdata  integral     8     'he9
---------------------------------
UVM_INFO component_a.sv(67) @ 0: uvm_test_top.env.comp_a [component_a] before calling port put method
UVM_INFO component_b.sv(61) @ 0: uvm_test_top.env.comp_b [component_b] Recived trans on imp port
UVM_INFO component_b.sv(62) @ 0: uvm_test_top.env.comp_b [component_b] Before injecting delay
UVM_INFO component_b.sv(64) @ 100000: uvm_test_top.env.comp_b [component_b] After injecting delay
UVM_INFO component_b.sv(65) @ 100000: uvm_test_top.env.comp_b [component_b] printing the trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @401
  addr   integral     4     'hf
  wr_rd  integral     1     'h0
  wdata  integral     8     'he9
---------------------------------

UVM_INFO component_a.sv(69) @ 100000: uvm_test_top.env.comp_a [component_a] after calling port put method
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_objection.svh(1270) @ 100000: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_report_server.svh(847) @ 100000: reporter [UVM/REPORT/SERVER]
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :    9
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RNTST]     1
[TEST_DONE]     1
[component_a]     3
[component_b]     4

$finish called from file "/home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_root.svh", line 517.
$finish at simulation time               100000
           V C S   S i m u l a t i o n   R e p o r t
Time: 100000 ps
CPU Time:      0.630 seconds;       Data structure size:   0.2Mb

