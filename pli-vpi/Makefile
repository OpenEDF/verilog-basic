### ------------------------------------------------------------------------------------------
## 
## Brief: makefile file for vcs and verilog pli 
## Author: Macro
## Email: makermuyi@gmail.com
## Run: 
##
### ------------------------------------------------------------------------------------------

# Compile command and flags
VCS_FLAGS = -R -P hello.tab hello_pli.v hello.c \
            -full64                      \
            +v2k                         \
            -override_timescale=1ns/10ps \
            -debug_access                \
            -debug_acc+dmptf             \
            -debug_region+cell+encrypt   \
            -cpp g++-4.8                 \
            -cc  gcc-4.8 			     \
            -LDFLAGS -Wl,--no-as-needed  \
			+vpi

### ------------------------------------------------------------------------------------------
# All run
all: com

# compiler verilog module file
com:
	vcs $(VCS_FLAGS)

# VCS -R FLAG will start simv sutomatic
sim:
	./simv

# clean the compiler-time file
.PHONY: clean
clean:
	rm -rf csrc *simv *.daidir *.log *.key

### ------------------------------------------------------------------------------------------
