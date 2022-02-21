build:
	vcs -R -full64 +v2k -fsdb -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed +define+FSDB -sverilog counter.v tb_counter.v -l run.log

# clean the compiler-time file
.PHONY: clean
clean:
	rm -rf csrc *simv *.daidir *.log *.key *.vpd DVEfiles *.fsdb \
	verdiLog novas.* *.vdb urgReport vdCovLog
