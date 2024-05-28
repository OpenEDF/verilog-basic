# Makefile for SystemVerilog Lab6
RTL= ./router.v
SVTB = ./router.test_top.sv ./router.if.sv ./router.tb.sv

vcs: clean sv_cmp sim

sim:
	./simv -l simv.log

sv_cmp:
	vcs -l vcs.log -sverilog -debug_all -ntb_opts svp $(RTL) $(SVTB)

clean:
	rm -rf simv* csrc* *.tmp *.vpd *.db *.key *.fcov *.html *.log *.dump log *.tcl *.old *.txt *debugger_rc *.h

nuke: clean
	rm -rf *.v* include *.sv .*.lock .*.old DVE*
