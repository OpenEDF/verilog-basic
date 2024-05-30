# Makefile for SystemVerilog Lab6
RTL= ./router.v
SVTB = ./router.test_top.sv ./router.if.sv ./router.tb.sv

vcs: clean sv_cmp sim

sim:
	./simv | tee log
	ntbCovReport -cov_report ./
	ntbCovReport -cov_text_report ./

sv_cmp:
	vcs -sverilog -debug_all -ntb_opts svp $(RTL) $(SVTB)

clean:
	rm -rf simv* csrc* *.tmp *.vpd *.db *.key *.fcov *.html *.log *.dump log *.tcl *.old *.txt *debugger_rc *.h

nuke: clean
	rm -rf *.v* include *.sv .*.lock .*.old DVE*
