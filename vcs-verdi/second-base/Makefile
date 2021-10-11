### ------------------------------------------------------------------------------------------
## 
## Brief: makefile file for vcs and verdi 
## Author: Macro
## Email: makermuyi@gmail.com
## Run: 
##
### ------------------------------------------------------------------------------------------
export OUTPUT = flowled
MODULE_FLIES = module.list
TB_FILES = tb.list
COM_LOG_FILE = complier_log
SIM_LOG_FILE = simlution_log

WAREFORM = $(OUTPUT).fsdb
LOAD_WARE = -ssf $(WAREFORM)

# Compile command
VCS_FLAG = -f $(MODULE_FLIES)			\
		   -f $(TB_FILES)				\
		   -full64 						\
		   +v2k							\
		   -override_timescale=1ns/10ps	\
		   -debug_pp 					\
		   -fsdb 						\
		   -cpp g++-4.8 				\
		   -cc  gcc-4.8 			    \
		   -LDFLAGS 				    \
		   -Wl,--no-as-needed 		    \
		   -rdynamic 				    \
		   -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab \
		   $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a        \
		   -Mupdate 	 			    \
		   -o $(OUTPUT)					\
		   -l $(COM_LOG_FILE).log

# Simulation command

# All run
all: com sim debug

# com
com:
	vcs $(VCS_FLAG)

# VCS -R FLAG will start simv sutomatic
sim:
	./$(OUTPUT) 						  	  \
		-ucli -i ./script/dum_fsdb_vcs.tcl 	  \
		+fsdb+autoflush					      \
		-l $(SIM_LOG_FILE).log
cov:

debug:
	verdi -f $(MODULE_FLIES) -f $(TB_FILES)	  \
		-top flow_led_tb 					  \
		$(LOAD_WARE)						  \
		-nologo
				
.PHONY: clean
clean:
	rm -rf csrc *simv *.daidir *.log *.key $(OUTPUT) *.vpd DVEfiles *.fsdb \
		verdiLog novas.*

# display the help information
help:
	@echo
	@echo ======================= Help ====================== 
	@echo "command:     descript:"
	@echo "make clean : clean the team file."
	@echo "make help  : print the all command."
	@echo ======================= Help ====================== 
