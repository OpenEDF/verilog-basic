Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Nov  8 07:51 2023
UVM_INFO @ 0: reporter [RNTST] Running test basic_test...
--------------------------------------
Name          Type         Size  Value
--------------------------------------
uvm_test_top  basic_test   -     @339
  comp_a      component_a  -     @352
  comp_b      component_b  -     @361
--------------------------------------
UVM_INFO component_a.sv(67) @ 0: uvm_test_top.comp_a [component_a] before triggering the event
UVM_INFO component_b.sv(61) @ 0: uvm_test_top.comp_b [component_b] waiting for the event trigger
UVM_INFO event_callback_0.sv(58) @ 10: reporter [event_callback_0] [callback-0] inside event pre_trigger callback
UVM_INFO event_callback_1.sv(58) @ 10: reporter [event_callback_1] [callback-1] inside event pre_trigger callback
UVM_INFO event_callback_0.sv(65) @ 10: reporter [event_callback_0] [callback-0] inside event post_trigger callback
UVM_INFO event_callback_1.sv(65) @ 10: reporter [event_callback_1] [callback-1] inside event post_trigger callback
UVM_INFO component_a.sv(70) @ 10: uvm_test_top.comp_a [component_a] after triggering the event
UVM_FATAL /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_phase.svh(1489) @ 9200000000000: reporter [PH_TIMEOUT] Default timeout of 9200000000000 hit, indicating a probable testbench issue
UVM_INFO /home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_report_server.svh(847) @ 9200000000000: reporter [UVM/REPORT/SERVER]
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :    8
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    1
** Report counts by id
[PH_TIMEOUT]     1
[RNTST]     1
[component_a]     2
[component_b]     1
[event_callback_0]     2
[event_callback_1]     2

$finish called from file "/home/macro/synopsys/uvm_lib/uvm-1.2/src/base/uvm_root.svh", line 135.
$finish at simulation time        9200000000000
           V C S   S i m u l a t i o n   R e p o r t
Time: 9200000000000 ns
CPU Time:      0.260 seconds;       Data structure size:   0.2Mb
Wed Nov  8 07:51:22 2023

