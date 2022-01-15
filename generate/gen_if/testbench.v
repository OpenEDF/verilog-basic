module testbench;

    reg a, b, sel;
    wire out;

    integer i;

    // generate if
    generate_if #(.USE_CASE(0)) u0 (.a(a), .b(b), .sel(sel), .out(out));

    initial begin
        a <= 0;
        b <= 0;
        sel <= 0;

        for (i = 0; i < 5; i = i + 1) begin
            #10
            a   <= $random;
            b   <= $random;
            sel <= $random;
            $display("i = %0d a = 0x%0h b = 0x%0h sel = %0h out = 0x%0h", i, a, b, sel, out);
        end
    $finish;
    end

endmodule

/* cmd :read !make 
rm -rf csrc simv* *.key *.vcd
vcs -full64 +v2k -cpp g++-4.8 -cc gcc-4.8      \
-LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ps \
generate_if.v mux_assign.v mux_case.v  testbench.v
*** Using c compiler gcc-4.8 instead of cc ...
                         Chronologic VCS (TM)
       Version O-2018.09-SP2_Full64 -- Sat Jan 15 12:07:38 2022
               Copyright (c) 1991-2018 by Synopsys Inc.
                         ALL RIGHTS RESERVED

This program is proprietary and confidential information of Synopsys Inc.
and may be used and disclosed only as authorized in a license agreement
controlling such use and disclosure.

Parsing design file 'generate_if.v'
Parsing design file 'mux_assign.v'
Parsing design file 'mux_case.v'
Parsing design file 'testbench.v'
Top Level Modules:
       testbench
TimeScale is 1 ns / 1 ps
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module testbench
make[1]: Entering directory '/home/macro/github/verilog-basic/generate/gen_if/csrc'
rm -f _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod -x ../simv; fi
g++-4.8  -o ../simv    -Wl,-rpath-link=./ -Wl,-rpath='$ORIGIN'/simv.daidir/ -Wl,-rpath=./simv.daidir/ -Wl,-rpath='$ORIGIN'/simv.daidir//scsim.db.dir  -Wl,--no-as-needed -rdynamic  -Wl,-rpath=/home/macro/synopsys/vcs_2018/vcs/O-2018.09-SP2/linux64/lib -L/home/macro/synopsys/vcs_2018/vcs/O-2018.09-SP2/linux64/lib   objs/amcQw_d.o   _77924_archive_1.so  SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o          -lnuma -lzerosoft_rt_stubs -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /home/macro/synopsys/vcs_2018/vcs/O-2018.09-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive -lvcsucli -Wl,-no-whole-archive          /home/macro/synopsys/vcs_2018/vcs/O-2018.09-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
make[1]: Leaving directory '/home/macro/github/verilog-basic/generate/gen_if/csrc'
CPU time: .211 seconds to compile + .230 seconds to elab + .178 seconds to link
./simv
Chronologic VCS simulator copyright 1991-2018
Contains Synopsys proprietary information.
Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Jan 15 12:07 2022
mux_assign is instantiated
i = 0 a = 0x0 b = 0x0 sel = 0 out = 0x0
i = 1 a = 0x0 b = 0x1 sel = 1 out = 0x0
i = 2 a = 0x1 b = 0x1 sel = 1 out = 0x1
i = 3 a = 0x1 b = 0x0 sel = 1 out = 0x1
i = 4 a = 0x1 b = 0x0 sel = 1 out = 0x1
$finish called from file "testbench.v", line 23.
$finish at simulation time                50000
           V C S   S i m u l a t i o n   R e p o r t 
Time: 50000 ps
CPU Time:      0.300 seconds;       Data structure size:   0.0Mb
Sat Jan 15 12:07:44 2022
*/
