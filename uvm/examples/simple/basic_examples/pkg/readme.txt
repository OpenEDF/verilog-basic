Chronologic VCS simulator copyright 1991-2018
Contains Synopsys proprietary information.
Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Jun  2 10:31 2024
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_root.svh(402) @ 0: reporter [UVM/RELNOTES] 
----------------------------------------------------------------
UVM-1.2.Synopsys
(C) 2007-2014 Mentor Graphics Corporation
(C) 2007-2014 Cadence Design Systems, Inc.
(C) 2006-2014 Synopsys, Inc.
(C) 2011-2013 Cypress Semiconductor Corp.
(C) 2013-2014 NVIDIA Corporation
----------------------------------------------------------------

  ***********       IMPORTANT RELEASE NOTES         ************

  You are using a version of the UVM library that has been compiled
  with `UVM_NO_DEPRECATED undefined.
  See http://www.eda.org/svdb/view.php?id=3313 for more details.

  You are using a version of the UVM library that has been compiled
  with `UVM_OBJECT_DO_NOT_NEED_CONSTRUCTOR undefined.
  See http://www.eda.org/svdb/view.php?id=3770 for more details.

      (Specify +UVM_NO_RELNOTES to turn off this notice)

UVM_WARNING /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(1421) @ 0: reporter [UVM/RSRC/NOREGEX] a resource with meta characters in the field name has been created "da*"
UVM_INFO @ 0: mu [CFGPRT] visible resources:
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(1326) @ 0: reporter [UVM/RESOURCE/PRINT] <none>
UVM_INFO @ 0: mu.l1 [CFGPRT] visible resources:
 str [/^mu\..*$/] : (string) "hi"   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR]  reads: 0 @ 0  writes: 1 @ 0

 str [/^mu\.l1$/] : (string) "hi"   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR] mu reads: 0 @ 0  writes: 1 @ 0

 obj [/^mu\..*$/] : (class uvm_pkg::uvm_object) '{use_uvm_seeding:'h1, m_leaf_name:"", m_inst_id:372, m_inst_count:395, __m_uvm_status_container:{ ref to class uvm_status_container}, uvm_global_copy_map:'{}}   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR]  reads: 0 @ 0  writes: 1 @ 0

 data [/^mu\.l1$/] : (logic signed[4095:0]) 55   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR]  reads: 0 @ 0  writes: 1 @ 0

 data [/^mu\..*$/] : (logic signed[4095:0]) 101   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR]  reads: 0 @ 0  writes: 1 @ 0

 da* [/^mu\..*$/] : (logic signed[4095:0]) 256   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR] mu reads: 0 @ 0  writes: 1 @ 0

UVM_INFO @ 0: mu.l2 [CFGPRT] visible resources:
 str [/^mu\..*$/] : (string) "hi"   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR]  reads: 0 @ 0  writes: 1 @ 0

 obj [/^mu\..*$/] : (class uvm_pkg::uvm_object) '{use_uvm_seeding:'h1, m_leaf_name:"", m_inst_id:372, m_inst_count:408, __m_uvm_status_container:{ ref to class uvm_status_container}, uvm_global_copy_map:'{}}   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR]  reads: 0 @ 0  writes: 1 @ 0

 data [/^mu\..*$/] : (logic signed[4095:0]) 101   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR]  reads: 0 @ 0  writes: 1 @ 0

 da* [/^mu\..*$/] : (logic signed[4095:0]) 256   
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_resource.svh(564) @ 0: reporter [UVM/RESOURCE/ACCESSOR] mu reads: 0 @ 0  writes: 1 @ 0

mu: (myunit@335) {
  l1: (lower@344) {
    data: 'h30 
    str: "" 
  }
  l2: (lower@353) {
    data: 'h40 
    str: "" 
  }
  a: {
    [0]: 'h0 
    [1]: 'h1 
    [2]: 'h4 
    [3]: 'h9 
    [4]: 'h10 
  }
}
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_factory.svh(1645) @ 0: reporter [UVM/FACTORY/PRINT] 
#### Factory Configuration (*)

  No instance or type overrides are registered with this factory

All types registered with the factory: 55 total
  Type Name
  ---------
  lower
  myobject
  myunit
  snps_uvm_reg_bank_group
  snps_uvm_reg_map
(*) Types with no associated type name will be printed as <unknown>

####


UVM_INFO @ 0: reporter [RNTST] Running test ...
0: test.\lower::run_phase : start run
0: test.\lower::run_phase : start run
10: mu.l1 HI
10: mu.l2 HI
10: mu HI
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_objection.svh(1276) @ 10: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_report_server.svh(894) @ 10: reporter [UVM/REPORT/SERVER] 
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :   18
UVM_WARNING :    1
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[CFGPRT]     3
[RNTST]     1
[TEST_DONE]     1
[UVM/FACTORY/PRINT]     1
[UVM/RELNOTES]     1
[UVM/RESOURCE/ACCESSOR]    10
[UVM/RESOURCE/PRINT]     1
[UVM/RSRC/NOREGEX]     1

$finish called from file "/home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_root.svh", line 527.
$finish at simulation time                   10
           V C S   S i m u l a t i o n   R e p o r t 
Time: 10 ns
CPU Time:      0.350 seconds;       Data structure size:   0.2Mb
Sun Jun  2 10:31:43 2024
