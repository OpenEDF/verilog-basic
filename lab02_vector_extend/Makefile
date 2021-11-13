RTL=vector.v  # or extend.v

all: compile simulate

compile:
	vcs \
	-sverilog \
	-debug_all \
	-l com.log \
	$(RTL)

simulate:
	./simv -l sim.log 

clean:
	@rm -rf csrc DVEfiles simv simv.daidir ucli.key VCS*
	@rm -rf *.log *.vpd *.ddc *.svf *.SDF *Synth *Netlist*
	@rm -rf alib-52
