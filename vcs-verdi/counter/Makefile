build:
	vcs -R -full64 +v2k -fsdb  -LDFLAGS -Wl,--no-as-needed +define+FSDB -sverilog counter.v tb_counter.v -l run.log

# clean the compiler-time file
.PHONY: clean
clean:
	rm -rf csrc *simv *.daidir *.log *.key *.vpd DVEfiles *.fsdb \
	verdiLog novas.* *.vdb urgReport vdCovLog
