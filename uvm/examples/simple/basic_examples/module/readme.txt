Chronologic VCS simulator copyright 1991-2018
Contains Synopsys proprietary information.
Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Jun  2 10:24 2024
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

-------------------------------
Name      Type      Size  Value
-------------------------------
mu        myunit    -     @335 
  l1      lower     -     @352 
    data  integral  32    'h30 
    str   string    0     ""   
  l2      lower     -     @361 
    data  integral  32    'h40 
    str   string    0     ""   
  a       array     5     -    
    [0]   integral  32    'h0  
    [1]   integral  32    'h1  
    [2]   integral  32    'h4  
    [3]   integral  32    'h9  
    [4]   integral  32    'h10 
-------------------------------
UVM_INFO @ 0: reporter [RNTST] Running test ...
10: mu.l1 HI
10: mu.l2 HI
10: mu HI
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_objection.svh(1276) @ 10: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO /home/macro/tools/synopsys/vcs/O-2018.09-SP2/etc/uvm-1.2/base/uvm_report_server.svh(894) @ 10: reporter [UVM/REPORT/SERVER] 
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :    3
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[RNTST]     1
[TEST_DONE]     1
[UVM/RELNOTES]     1

-------------------------------
Name      Type      Size  Value
-------------------------------
mu        myunit    -     @335 
  l1      lower     -     @352 
    data  integral  32    'h37 
    str   string    2     hi   
  l2      lower     -     @361 
    data  integral  32    'h65 
    str   string    2     hi   
  a       array     5     -    
    [0]   integral  32    'h0  
    [1]   integral  32    'h1  
    [2]   integral  32    'h4  
    [3]   integral  32    'h9  
    [4]   integral  32    'h10 
-------------------------------
           V C S   S i m u l a t i o n   R e p o r t 
Time: 10 ns
CPU Time:      0.350 seconds;       Data structure size:   0.2Mb
Sun Jun  2 10:24:37 2024
