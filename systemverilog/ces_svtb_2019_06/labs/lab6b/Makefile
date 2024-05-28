# Makefile for SystemVerilog Testbench lab6b
LAB_DIR = lab6b
PKG = ./router_test_pkg.sv
TSCALE = -timescale="1ns/100ps"
RTL= ../../rtl/router.v
BADRTL= ../../rtl/bad/router.v
SVTB = ./router_test_top.sv ./router_io.sv ./test.sv
seed = 1
dve_tcl = top_io.tcl
verdi_cmd_file = top_io.cmd
run_opts =
comp_opts =

default: test 

test: compile run

bad: RTL=$(BADRTL)
bad: compile run

run:
	./simv -l simv.log +ntb_random_seed=$(seed) $(run_opts)

compile:
	vcs -l vcs.log -sverilog -kdb -debug_access+all $(TSCALE) $(PKG) $(SVTB) $(RTL) +vcs+vcdpluson -lca $(comp_opts)

verdi:
	verdi -play ${verdi_cmd_file} &

dve:
	dve -vpd vcdplus.vpd -session $(dve_tcl)&

verdi_debug:
	./simv -l simv.log -gui=verdi +ntb_random_seed=$(seed)  $(run_opts)

debug:
	./simv -l simv.log -gui=dve +ntb_random_seed=$(seed) $(run_opts)

original: nuke copy

copy:
	cp ../../solutions/lab5/*.sv .
	cp ../../solutions/$(LAB_DIR)/Environment.sv .
	cp ../../solutions/$(LAB_DIR)/router_test_pkg.sv.orig router_test_pkg.sv
	cp ../../solutions/lab6a/Scoreboard.sv Scoreboard.sv
	cp ../../solutions/$(LAB_DIR)/test.sv.orig test.sv
	cp ../../solutions/$(LAB_DIR)/top_io.* .
	cp ../../solutions/lab5/router_test.h .

mycopy:
	cp ../lab5/*.sv .
	cp ../../solutions/$(LAB_DIR)/Environment.sv .
	cp ../../solutions/$(LAB_DIR)/router_test_pkg.sv.orig router_test_pkg.sv
	cp ../../solutions/lab6a/Scoreboard.sv Scoreboard.sv
	cp ../../solutions/$(LAB_DIR)/test.sv.orig test.sv
	cp ../../solutions/$(LAB_DIR)/top_io.* .
	cp ../lab5/router_test.h .

solution: clean
	cp ../../solutions/$(LAB_DIR)/*.sv .
	cp ../../solutions/$(LAB_DIR)/router_test.h .
	cp ../../solutions/$(LAB_DIR)/top_io.* .

clean:
	rm -rf simv* csrc* *.tmp *.vpd *.key *.log *hdrs.h *.fsdb verdiLog novas.* *.dat

nuke: clean
	rm -rf *.v* *.sv include .*.lock .*.old DVE* *.tcl *.h *.rc *.ses *.ses.* *.dat *.cmd

help:
	@echo ==========================================================================
	@echo  " 								       "
	@echo  " USAGE: make target <seed=xxx>                                         "
	@echo  " 								       "
	@echo  " ------------------------- Test TARGETS ------------------------------ "
	@echo  " test       => Compile TB and DUT files, runs the simulation.          "
	@echo  " compile    => Compile the TB and DUT. Generates dve and verdi output  "
	@echo  " bad        => Compile TB and BAD DUT files, Run the simulation.      "
	@echo  " run        => Run the simulation.                                     "
	@echo  " dve        => Run dve in post-processing mode.          "
	@echo  "                                                                       "
	@echo  " verdi      => Run verdi in post-processing mode.          "
	@echo  " verdi_gui  => Run simulation interactively with verdi.                "
	@echo  "               All verdi targets must have Verdi installed.            "
	@echo  "                                                                       "
	@echo  " debug      => Runs simulation interactively with dve.                 "
	@echo  " clean      => Remove all intermediate simv and log files.             "
	@echo  "                                                                       "
	@echo  " -------------------- ADMINISTRATIVE TARGETS ------------------------- "
	@echo  " help       => Displays this message.                                  "
	@echo  " solution   => Copies all files from solutions directory.              "
	@echo  " nuke       => Erase all files except Makefile."
	@echo  " original   => Erase all files except Makefile. Restore files to original"
	@echo  " copy       => Copy files before starting this lab first time."
	@echo  " mycopy     => Copy files from last lab before starting this lab"
	@echo  "								       "
	@echo ==========================================================================

