Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Aug  3 10:58 2024
UVM_INFO top_tb.sv(50) @ 0: reporter [TEST] item config test!
UVM_INFO @ 0: reporter [RNTST] Running test base_test...
UVM_INFO base_test.sv(61) @ 0: uvm_test_top [build phase] base test BUILD-FLOW: Starting...
UVM_INFO base_test.sv(68) @ 0: uvm_test_top [build phase] =========== system configuration ===========
-----------------------------------------------
Name     Type                  Size  Value     
-----------------------------------------------
cfg      cust_seq_item_config  -     @352      
  addr   integral              4     'ha       
  wr_en  integral              1     'h1       
  rd_en  integral              1     'h0       
  wdata  integral              8     'h10      
  data1  integral              32    'h11223344
  data2  integral              32    'h55667788
  sum    integral              32    'h11223346
-----------------------------------------------

UVM_INFO base_test.sv(74) @ 0: uvm_test_top [build phase] base test BUILD-FLOW: Finishing...
UVM_INFO test_basic_env.sv(63) @ 0: uvm_test_top.env [build phase] base test BUILD-FLOW: Starting...
UVM_INFO test_basic_env.sv(67) @ 0: uvm_test_top.env [build phase] =========== system item cfg configuration ===========
-----------------------------------------------
Name     Type                  Size  Value     
-----------------------------------------------
cfg      cust_seq_item_config  -     @352      
  addr   integral              4     'ha       
  wr_en  integral              1     'h1       
  rd_en  integral              1     'h0       
  wdata  integral              8     'h10      
  data1  integral              32    'h11223344
  data2  integral              32    'h55667788
  sum    integral              32    'h11223346
-----------------------------------------------

UVM_INFO test_basic_env.sv(73) @ 0: uvm_test_top.env [build phase] =========== system cfg configuration ===========
-----------------------------------------------
Name     Type                  Size  Value     
-----------------------------------------------
cfg      cust_seq_item_config  -     @352      
  addr   integral              4     'ha       
  wr_en  integral              1     'h1       
  rd_en  integral              1     'h0       
  wdata  integral              8     'h10      
  data1  integral              32    'h11223344
  data2  integral              32    'h55667788
  sum    integral              32    'h11223346
-----------------------------------------------

UVM_INFO test_basic_env.sv(78) @ 0: uvm_test_top.env [build phase] array[0]: 0x11223344
UVM_INFO test_basic_env.sv(79) @ 0: uvm_test_top.env [build phase] array[1]: 0x55667788
UVM_INFO test_basic_env.sv(80) @ 0: uvm_test_top.env [build phase] base test BUILD-FLOW: Finishing...
UVM_INFO /home/macro/tools/synopsys/uvm_lib/uvm-1.2/src/base/uvm_report_server.svh(847) @ 0: reporter [UVM/REPORT/SERVER] 
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :   11
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RNTST]     1
[TEST]     1
[build phase]     9

$finish called from file "/home/macro/tools/synopsys/uvm_lib/uvm-1.2/src/base/uvm_root.svh", line 517.
$finish at simulation time                    0
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ps
CPU Time:      0.350 seconds;       Data structure size:   0.2Mb
Sat Aug  3 10:58:33 2024
