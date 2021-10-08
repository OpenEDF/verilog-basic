### ------------------------------------------------------------------------------------------
## 
## Brief: makefile file for vcs and verdi 
## Author: Macro
## Email: makermuyi@gmail.com
## Run: 
##
### ------------------------------------------------------------------------------------------
OUTPUT = 
ALL_FLAG += 
ALL_DEFINE +=
CM = -cm line+cond+fsm+branch+tgl
CM_NAME = -cm_name $(OUTPUT)
CN_DIR = -cm_dir ./$(OUTPUT).vdb

# vpd file name
VPD_NAME = +vpdfile+$(OUTPUT).vpd

# Compile command
VCS =   vcs +v2k -override_timescale=1ns/100ps            \
        -full64                                           \
        -fsdb                                             \
        -debug_all                                        \
        -sverilog                                         \
        +nospecify                                        \
        +vcs+flush+all                                    \
        $(CM)                                             \
        $(CM_NAME)                                        \
        $(CM_DIR)                                         \
        $(ALL_DEFINE)                                     \
        $(VPD_NAME)                                       \
        -o $(OUTPUT)                                      \
        -l compile.log

# Simulation command
SIM = ./$(OUTPUT)                                         \
      +ntb_ramdom_seend_automatic                         \
      $(CM) $(CM_NAME) $(CM_DIR)                          \
      $(VPD_NAME)                                         \
      $(ALL_DEFINE)                                       \
      -l $(OUTPUT).log


# All run
all:
	com sim

# com
com:
	$(VCS) -f flist.f

sim:
	$(SIM)

cov:
	dve -covdir *vdb &

debug:
	dev -vpd $(OUTPUT).vpd &

.PHONY: clean
clean:
	rm -rf *.log  *.vpd  *.vdb  simv* *.key                   \
           +race.out* novas* verdi* *fsdb apb2apb_async

# display the help information
help:
	@echo
	@echo ======================= Help ====================== 
	@echo "command:     descript:"
	@echo "make clean : clean the team file."
	@echo "make help  : print the all command."
	@echo ======================= Help ====================== 
