Chronologic VCS simulator copyright 1991-2018
Contains Synopsys proprietary information.
Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Aug 15 00:11 2024
[0]: system reset...
*Verdi* Loading libsscore_vcs201809.so
FSDB Dumper for VCS, Release Verdi_O-2018.09-SP2, Linux x86_64/64bit, 02/21/2019
(C) 1996 - 2019 by Synopsys, Inc.
*Verdi* FSDB WARNING: The FSDB file already exists. Overwriting the FSDB file may crash the programs that are using this file.
*Verdi* : Create FSDB file 'testbench.fsdb'
*Verdi* : Begin traversing the scope (testbench), layer (0).
*Verdi* : End of traversing.
[0] test count = 4'b0000
[10.00ns]: system main run...
[15.00ns] test count = 4'b0001
[25.00ns] test count = 4'b0010
[35.00ns] test count = 4'b0011
[45.00ns] test count = 4'b0100
[55.00ns] test count = 4'b0101
[65.00ns] test count = 4'b0110
[75.00ns] test count = 4'b0111
[85.00ns] test count = 4'b1000
[95.00ns] test count = 4'b1001
[105.00ns] test count = 4'b1010
"/home/macro/tools/synopsys/vcs/O-2018.09-SP2/packages/sva/assert_always.v", 122: testbench.count_u.vaild_count.assert_always: started at 115ns failed at 115ns
	Offending 'test_expr'
SVA_CHECKER_ERROR : ASSERT_ALWAYS : ERROR: count not within 0 and 9. :  : severity 0 : time 115.00ns : testbench.count_u.vaild_count.sva_checker_error
[115.00ns] test count = 4'b1011
"/home/macro/tools/synopsys/vcs/O-2018.09-SP2/packages/sva/assert_always.v", 122: testbench.count_u.vaild_count.assert_always: started at 125ns failed at 125ns
	Offending 'test_expr'
SVA_CHECKER_ERROR : ASSERT_ALWAYS : ERROR: count not within 0 and 9. :  : severity 0 : time 125.00ns : testbench.count_u.vaild_count.sva_checker_error
[125.00ns] test count = 4'b1100
"/home/macro/tools/synopsys/vcs/O-2018.09-SP2/packages/sva/assert_always.v", 122: testbench.count_u.vaild_count.assert_always: started at 135ns failed at 135ns
	Offending 'test_expr'
SVA_CHECKER_ERROR : ASSERT_ALWAYS : ERROR: count not within 0 and 9. :  : severity 0 : time 135.00ns : testbench.count_u.vaild_count.sva_checker_error
[135.00ns] test count = 4'b1101
"/home/macro/tools/synopsys/vcs/O-2018.09-SP2/packages/sva/assert_always.v", 122: testbench.count_u.vaild_count.assert_always: started at 145ns failed at 145ns
	Offending 'test_expr'
SVA_CHECKER_ERROR : ASSERT_ALWAYS : ERROR: count not within 0 and 9. :  : severity 0 : time 145.00ns : testbench.count_u.vaild_count.sva_checker_error
[145.00ns] test count = 4'b1110
"/home/macro/tools/synopsys/vcs/O-2018.09-SP2/packages/sva/assert_always.v", 122: testbench.count_u.vaild_count.assert_always: started at 155ns failed at 155ns
	Offending 'test_expr'
SVA_CHECKER_ERROR : ASSERT_ALWAYS : ERROR: count not within 0 and 9. :  : severity 0 : time 155.00ns : testbench.count_u.vaild_count.sva_checker_error
[155.00ns] test count = 4'b1111
"/home/macro/tools/synopsys/vcs/O-2018.09-SP2/packages/sva/assert_always.v", 122: testbench.count_u.vaild_count.assert_always: started at 165ns failed at 165ns
	Offending 'test_expr'
SVA_CHECKER_ERROR : ASSERT_ALWAYS : ERROR: count not within 0 and 9. :  : severity 0 : time 165.00ns : testbench.count_u.vaild_count.sva_checker_error
[165.00ns] test count = 4'b0000
[170.00ns]: system exit...
$finish called from file "testbench.sv", line 74.
$finish at simulation time             170.00ns
           V C S   S i m u l a t i o n   R e p o r t 
Time: 170 ns
CPU Time:      0.340 seconds;       Data structure size:   0.0Mb
Thu Aug 15 00:11:09 2024
