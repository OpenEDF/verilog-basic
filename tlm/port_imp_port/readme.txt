UVM_INFO @ 0: reporter [RNTST] Running test basic_test...
UVM_INFO component_a_a.sv(64) @ 0: uvm_test_top.env.comp_a.sub_comp_a_a [component_a_a] transaction randomized
---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @420
  addr   integral     4     'h0
  wr_rd  integral     1     'h1
  wdata  integral     8     'haa
---------------------------------
UVM_INFO component_a_a.sv(67) @ 0: uvm_test_top.env.comp_a.sub_comp_a_a [component_a_a] before calling port sub put method
UVM_INFO component_b.sv(61) @ 0: uvm_test_top.env.comp_b [component_b] Recived trans on blocking imp port
UVM_INFO component_b.sv(62) @ 0: uvm_test_top.env.comp_b [component_b] printing the trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @420
  addr   integral     4     'h0
  wr_rd  integral     1     'h1
  wdata  integral     8     'haa
---------------------------------

UVM_INFO component_a_a.sv(69) @ 0: uvm_test_top.env.comp_a.sub_comp_a_a [component_a_a] after calling port sub put method
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_objection.svh(1270) @ 0: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_report_server.svh(847) @ 0: reporter [UVM/REPORT/SERVER]
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :    7
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RNTST]     1
[TEST_DONE]     1
[component_a_a]     3
[component_b]     2

$finish called from file "/home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_root.svh", line 517.
$finish at simulation time                    0
           V C S   S i m u l a t i o n   R e p o r t
Time: 0 ps
CPU Time:      0.590 seconds;       Data structure size:   0.2Mb
Sun Oct 22 09:54:47 2023

