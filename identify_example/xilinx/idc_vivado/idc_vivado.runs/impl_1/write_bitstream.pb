
n
Command: %s
1870*	planAhead29
%open_checkpoint led_stream_routed.dcp2default:defaultZ12-2866h px� 
^

Starting %s Task
103*constraints2#
open_checkpoint2default:defaultZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.12 ; elapsed = 00:00:00.16 . Memory (MB): peak = 1438.672 ; gain = 0.000 ; free physical = 1460 ; free virtual = 41872default:defaulth px� 
W
Loading part %s157*device2$
xc7k325tfbg676-22default:defaultZ21-403h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:00.012default:default2
1784.5472default:default2
0.0002default:default2
10172default:default2
37792default:defaultZ17-722h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
152default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2019.22default:defaultZ1-479h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
L
*Restoring timing data from binary archive.264*timingZ38-478h px� 
F
$Binary timing data restore complete.265*timingZ38-479h px� 
L
*Restoring constraints from binary archive.481*projectZ1-856h px� 
�
�The checkpoint was created with non-default parameter values which do not match the current Vivado settings.  Mismatching parameters are:1090*constraintsZ18-5170h px� 
G
  %s
*constraints2&
general.maxThreads2default:defaulth px� 
E
#Binary constraint restore complete.478*projectZ1-853h px� 
?
Reading XDEF placement.
206*designutilsZ20-206h px� 
D
Reading placer database...
1602*designutilsZ20-1892h px� 
=
Reading XDEF routing.
207*designutilsZ20-207h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2$
Read XDEF File: 2default:default2
00:00:00.222default:default2
00:00:00.312default:default2
2410.9382default:default2
19.8122default:default2
4322default:default2
32042default:defaultZ17-722h px� 
�
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2
0.2900002default:default2
1.9090652default:defaultZ20-1924h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common20
Finished XDEF File Restore: 2default:default2
00:00:00.222default:default2
00:00:00.312default:default2
2410.9382default:default2
19.8122default:default2
4322default:default2
32042default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2410.9382default:default2
0.0002default:default2
4322default:default2
32042default:defaultZ17-722h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
'Checkpoint was created with %s build %s378*project2+
Vivado v2019.2 (64-bit)2default:default2
27088762default:defaultZ1-604h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
open_checkpoint: 2default:default2
00:00:282default:default2
00:00:362default:default2
2410.9382default:default2
972.2662default:default2
4322default:default2
32042default:defaultZ17-722h px� 
j
Command: %s
53*	vivadotcl29
%write_bitstream -force led_stream.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7k325t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7k325t2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
�
"Loaded Vivado IP repository '%s'.
1332*coregen2<
(/home/macro/xilinx/Vivado/2019.2/data/ip2default:defaultZ19-2313h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[10]Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[10]2default:default2default:default2�
 "�
6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[4]6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[4]2default:default2default:default2�
 "�
9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[4]	9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[11]Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[11]2default:default2default:default2�
 "�
6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[5]6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[5]2default:default2default:default2�
 "�
9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[5]	9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[12]Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[12]2default:default2default:default2�
 "�
6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[6]6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[6]2default:default2default:default2�
 "�
9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[6]	9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[6]Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[6]2default:default2default:default2�
 "�
6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[0]6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[0]2default:default2default:default2�
 "�
9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[0]	9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[7]Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[7]2default:default2default:default2�
 "�
6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[1]6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[1]2default:default2default:default2�
 "�
9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[1]	9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[8]Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[8]2default:default2default:default2�
 "�
6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[2]6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[2]2default:default2default:default2�
 "�
9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[2]	9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[9]Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRARDADDR[9]2default:default2default:default2�
 "�
6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[3]6ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b9_v_mzCDYXs[3]2default:default2default:default2�
 "�
9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[3]	9ident_coreinst/IICE_INST/b3_SoW/genblk9.b9_v_mzCDYXs_Z[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[10]Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[10]2default:default2default:default2�
 "�
:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[4]:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[4]2default:default2default:default2�
 "�
5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[4]	5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[11]Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[11]2default:default2default:default2�
 "�
:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[5]:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[5]2default:default2default:default2�
 "�
5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[5]	5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[12]Hident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[12]2default:default2default:default2�
 "�
:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[6]:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[6]2default:default2default:default2�
 "�
5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[6]	5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[6]Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[6]2default:default2default:default2�
 "�
:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[0]:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[0]2default:default2default:default2�
 "�
5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[0]	5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[7]Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[7]2default:default2default:default2�
 "�
:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[1]:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[1]2default:default2default:default2�
 "�
5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[1]	5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[8]Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[8]2default:default2default:default2�
 "�
:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[2]:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[2]2default:default2default:default2�
 "�
5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[2]	5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�	
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0	8ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_02default:default2default:default2�
 "�
Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[9]Gident_coreinst/IICE_INST/b3_SoW/b3_SoW/b3_SoW_b3_SoW_0_0/ADDRBWRADDR[9]2default:default2default:default2�
 "�
:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[3]:ident_coreinst/IICE_INST/b3_SoW/b3_SoW/b12_2_St6KCa_jHv[3]2default:default2default:default2�
 "�
5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[3]	5ident_coreinst/IICE_INST/b3_SoW/b12_2_St6KCa_jHv_Z[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 14 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
42default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
f
%Bitstream compression saved %s bits.
26*	bitstream2
829690242default:defaultZ40-26h px� 
a
Writing bitstream %s...
11*	bitstream2$
./led_stream.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
s
QWebTalk data collection is enabled (User setting is ON. Install Setting is ON.).
118*projectZ1-118h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
232default:default2
142default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
write_bitstream: 2default:default2
00:00:242default:default2
00:00:282default:default2
2941.3122default:default2
530.3752default:default2
5272default:default2
31682default:defaultZ17-722h px� 


End Record