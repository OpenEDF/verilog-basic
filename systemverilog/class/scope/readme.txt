rm -rf csrc simv* *.key *.log
vcs -full64  -sverilog -f src.lst +v2k -R -Mupdate -l sv.log
                         Chronologic VCS (TM)
       Version O-2018.09-SP2_Full64 -- Sun May 26 10:34:32 2024
               Copyright (c) 1991-2018 by Synopsys Inc.
                         ALL RIGHTS RESERVED

This program is proprietary and confidential information of Synopsys Inc.
and may be used and disclosed only as authorized in a license agreement
controlling such use and disclosure.

Parsing design file 'packet.sv'
Parsing design file 'testbench.sv'
Top Level Modules:
       tb_top
No TimeScale specified
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module tb_top
make[1]: Entering directory '/home/macro/work/github/verilog-basic/systemverilog/class/scope/csrc'
rm -f _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod -x ../simv; fi
g++  -o ../simv    -Wl,-rpath-link=./ -Wl,-rpath='$ORIGIN'/simv.daidir/ -Wl,-rpath=./simv.daidir/ -Wl,-rpath='$ORIGIN'/simv.daidir//scsim.db.dir  -rdynamic  -Wl,-rpath=/home/macro/tools/synopsys/vcs/O-2018.09-SP2/linux64/lib -L/home/macro/tools/synopsys/vcs/O-2018.09-SP2/linux64/lib   objs/amcQw_d.o   _54787_archive_1.so  SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o          -lzerosoft_rt_stubs -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /home/macro/tools/synopsys/vcs/O-2018.09-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive -lvcsucli -Wl,-no-whole-archive          /home/macro/tools/synopsys/vcs/O-2018.09-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
make[1]: Leaving directory '/home/macro/work/github/verilog-basic/systemverilog/class/scope/csrc'
Chronologic VCS simulator copyright 1991-2018
Contains Synopsys proprietary information.
Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  May 26 10:34 2024
--------------------------------------
	 packets created: address: 20, data: 30
--------------------------------------
--------------------------------------
	 packets created: address: 20, data: 100
--------------------------------------
$finish at simulation time                    0
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0
CPU Time:      1.030 seconds;       Data structure size:   0.0Mb
Sun May 26 10:34:36 2024
CPU time: .766 seconds to compile + .873 seconds to elab + .805 seconds to link + 1.112 seconds in simulation
