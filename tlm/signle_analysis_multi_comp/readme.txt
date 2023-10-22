UVM_INFO @ 0: reporter [RNTST] Running test basic_test...
UVM_INFO component_a.sv(67) @ 10000: uvm_test_top.env.comp_a [component_a] transaction randomized
UVM_INFO component_a.sv(68) @ 10000: uvm_test_top.env.comp_a [component_a] printing trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @420
  addr   integral     4     'hf
  wr_rd  integral     1     'h0
  wdata  integral     8     'he9
---------------------------------

UVM_INFO component_a.sv(70) @ 10000: uvm_test_top.env.comp_a [component_a] before calling port write method
UVM_INFO component_b.sv(61) @ 10000: uvm_test_top.env.comp_b [component_b] recived trans on analysis imp port port
UVM_INFO component_b.sv(62) @ 10000: uvm_test_top.env.comp_b [component_b] printing the trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @420
  addr   integral     4     'hf
  wr_rd  integral     1     'h0
  wdata  integral     8     'he9
---------------------------------

UVM_INFO component_c.sv(61) @ 10000: uvm_test_top.env.comp_c [component_c] recived trans on analysis imp port port
UVM_INFO component_c.sv(62) @ 10000: uvm_test_top.env.comp_c [component_c] printing the trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @420
  addr   integral     4     'hf
  wr_rd  integral     1     'h0
  wdata  integral     8     'he9
---------------------------------

UVM_INFO component_a.sv(72) @ 10000: uvm_test_top.env.comp_a [component_a] after calling port write method
UVM_INFO component_a.sv(67) @ 20000: uvm_test_top.env.comp_a [component_a] transaction randomized
UVM_INFO component_a.sv(68) @ 20000: uvm_test_top.env.comp_a [component_a] printing trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @420
  addr   integral     4     'hd
  wr_rd  integral     1     'h1
  wdata  integral     8     'hdc
---------------------------------

UVM_INFO component_a.sv(70) @ 20000: uvm_test_top.env.comp_a [component_a] before calling port write method
UVM_INFO component_b.sv(61) @ 20000: uvm_test_top.env.comp_b [component_b] recived trans on analysis imp port port
UVM_INFO component_b.sv(62) @ 20000: uvm_test_top.env.comp_b [component_b] printing the trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @420
  addr   integral     4     'hd
  wr_rd  integral     1     'h1
  wdata  integral     8     'hdc
---------------------------------

UVM_INFO component_c.sv(61) @ 20000: uvm_test_top.env.comp_c [component_c] recived trans on analysis imp port port
UVM_INFO component_c.sv(62) @ 20000: uvm_test_top.env.comp_c [component_c] printing the trans,
 ---------------------------------
Name     Type         Size  Value
---------------------------------
trans    transaction  -     @420
  addr   integral     4     'hd
  wr_rd  integral     1     'h1
  wdata  integral     8     'hdc
---------------------------------

UVM_INFO component_a.sv(72) @ 20000: uvm_test_top.env.comp_a [component_a] after calling port write method
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_objection.svh(1270) @ 20000: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_report_server.svh(847) @ 20000: reporter [UVM/REPORT/SERVER]
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :   18
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RNTST]     1
[TEST_DONE]     1
[component_a]     8
[component_b]     4
[component_c]     4

$finish called from file "/home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_root.svh", line 517.
$finish at simulation time                20000
           V C S   S i m u l a t i o n   R e p o r t
Time: 20000 ps
CPU Time:      0.620 seconds;       Data structure size:   0.2Mb
Mon Oct 23 07:29:34 2023

