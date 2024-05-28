# Makefile for SystemVerilog Testbench Lab1
LAB_DIR = lab1
RTL= ../../rtl/router.v
SVTB = ./router_test_top.sv ./router_io.sv ./test.sv
seed = 1
run_opts =
comp_opts =

default: test 

test: compile run

run:
	./simv -l simv.log +ntb_random_seed=$(seed) $(run_opts)

compile:
	vcs -l vcs.log -sverilog -kdb -debug_access+all $(SVTB) $(RTL) +vcs+vcdpluson -lca -full64 $(comp_opts)

verdi:
	verdi -ssf novas.fsdb -undockWin -nologo &

dve:
	dve -vpd vcdplus.vpd &

verdi_debug:
	./simv -l simv.log -gui=verdi +ntb_random_seed=$(seed) $(run_opts)

debug:
	./simv -l simv.log -gui=dve +ntb_random_seed=$(seed) $(run_opts)

solution: clean
	cp -f ../../solutions/$(LAB_DIR)/*.sv .

clean:
	rm -rf simv* csrc* *.tmp *.vpd *.key *.log *hdrs.h *.fsdb verdiLog elabcomLog novas.* *.dat

original: nuke
	cp -f ../../solutions/$(LAB_DIR)/router_io.sv.orig router_io.sv
	cp -f ../../solutions/$(LAB_DIR)/router_test_top.sv.orig router_test_top.sv
	cp -f ../../solutions/$(LAB_DIR)/test.sv.orig test.sv

nuke: clean
	rm -rf *.v* *.sv include .*.lock .*.old DVE* *.tcl *.h *.rc *.ses *.ses.* *.dat

help:
	@echo ==========================================================================
	@echo  " 								       "
	@echo  " USAGE: make target <seed=xxx>                                         "
	@echo  " 								       "
	@echo  " ------------------------- Test TARGETS ------------------------------ "
	@echo  " test       => Compile TB and DUT files, runs the simulation.          "
	@echo  " compile    => Compile the TB and DUT. Generates dve and verdi output  "
	@echo  " run        => Run the simulation.                                     "
	@echo  " dve        => Run dve in post-processing mode.          "
	@echo  "                                                                       "
	@echo  " verdi      => Run verdi in post-processing mode.          "
	@echo  " verdi_gui  => Run simulation interactively with verdi                  "
	@echo  "               All verdi targets must have Verdi installed.          "
	@echo  "                                                                       "
	@echo  " debug      => Runs simulation interactively with dve.                  "
	@echo  " clean      => Remove all intermediate simv and log files.             "
	@echo  "                                                                       "
	@echo  " -------------------- ADMINISTRATIVE TARGETS ------------------------- "
	@echo  " help       => Displays this message.                                  "
	@echo  " solution   => Copies all files from solutions directory.               "
	@echo  " original   => Erase all files except Makefile. Put directory back to original state. "
	@echo  " nuke       => Erase all files except Makefile. "
	@echo  "								       "
	@echo ==========================================================================

