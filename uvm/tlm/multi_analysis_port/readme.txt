Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Oct 23 07:15 2023
UVM_INFO @ 0: reporter [RNTST] Running test basic_test...
UVM_INFO component_a.sv(64) @ 0: uvm_test_top.env.comp_a [component_a] transaction randomized
UVM_INFO component_a.sv(65) @ 0: uvm_test_top.env.comp_a [component_a] printing trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @411
  addr   integral     4     'hf
  wr_rd  integral     1     'h0
  wdata  integral     8     'he9
---------------------------------

UVM_INFO component_a.sv(67) @ 0: uvm_test_top.env.comp_a [component_a] before calling port write method
UVM_INFO component_b.sv(65) @ 0: uvm_test_top.env.comp_b [component_b] inside wirte port a
UVM_INFO component_b.sv(66) @ 0: uvm_test_top.env.comp_b [component_b] recived trans on analysis imp port port
UVM_INFO component_b.sv(67) @ 0: uvm_test_top.env.comp_b [component_b] printing the trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @411
  addr   integral     4     'hf
  wr_rd  integral     1     'h0
  wdata  integral     8     'he9
---------------------------------

UVM_INFO component_b.sv(74) @ 0: uvm_test_top.env.comp_b [component_b] inside wirte port b
UVM_INFO component_b.sv(75) @ 0: uvm_test_top.env.comp_b [component_b] recived trans on analysis imp port port
UVM_INFO component_b.sv(76) @ 0: uvm_test_top.env.comp_b [component_b] printing the trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @411
  addr   integral     4     'hf
  wr_rd  integral     1     'h0
  wdata  integral     8     'he9
---------------------------------

UVM_INFO component_a.sv(69) @ 0: uvm_test_top.env.comp_a [component_a] after calling port write method
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_objection.svh(1270) @ 0: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_report_server.svh(847) @ 0: reporter [UVM/REPORT/SERVER]
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :   12
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RNTST]     1
[TEST_DONE]     1
[component_a]     4
[component_b]     6

$finish called from file "/home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_root.svh", line 517.
$finish at simulation time                    0
           V C S   S i m u l a t i o n   R e p o r t
Time: 0 ps
CPU Time:      1.400 seconds;       Data structure size:   0.2Mb
Mon Oct 23 07:15:17 2023

