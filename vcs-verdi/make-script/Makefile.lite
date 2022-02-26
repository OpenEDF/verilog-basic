### ------------------------------------------------------------------------------------------
## 
## Brief: makefile file for vcs and verdi lite 
## Author: Macro
## Email: makermuyi@gmail.com
## Run: make FILE=xxx.v 
##
### ------------------------------------------------------------------------------------------
FILE ?= display.v

# Compile command and flags
VCS_FLAGS = -full64                      \
			-sverilog                    \
            +lint=all                    \
            +warn=noVPI-CT-NS            \
            +v2k                         \
            -override_timescale=1ns/10ps \
            -debug_access+all            \
            -debug_acc+dmptf             \
            -debug_region+cell+encrypt   \
            -cpp g++-4.8                 \
            -cc  gcc-4.8 			     \
            -LDFLAGS -Wl,--no-as-needed  \
			-R                           \
			-Mupdate                     \
			$(FILE)

### ------------------------------------------------------------------------------------------
# All run
all: com

# compiler verilog module file
com:
	vcs $(VCS_FLAGS)

# clean the compiler-time file
.PHONY: com clean help
clean:
	rm -rf csrc *.daidir *.key simv

### ------------------------------------------------------------------------------------------
# display the help information
help:
	@echo
	@echo --------------------------------- Help  ---------------------------------
	@echo "command     : descript"
	@echo "make clean  : clean the temp file."
	@echo "make all    : execute the compile simluation and open verdi debug."
	@echo "make com    : only execute compile the verilog module."
	@echo "make sim    : only execute simulation the model."
	@echo "make help   : print the all command and use method."
	@echo --------------------------------- Help  ---------------------------------
### ------------------------------------------------------------------------------------------
