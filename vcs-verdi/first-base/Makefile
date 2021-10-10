### ------------------------------------------------------------------------------------------
## 
## Brief: makefile file for vcs and verdi 
## Author: Macro
## Email: makermuyi@gmail.com
## Run: 
##
### ------------------------------------------------------------------------------------------
OUTPUT = flowled
MODULE_FLIES = module.list
TB_FILES = tb.list
COM_LOG_FILE = complier_log
SIM_LOG_FILE = simlution_log

VPD_OPTION = -debug_pp
VPD_OPTION += +vcs+vcdpluson
TIMEING_OPTION = +notimingcheck

# vpd file name
#TODO: VPD_FILE = +vpdfile+$(OUTPUT).vpd

# Compile command
VCS_FLAG = -f $(MODULE_FLIES)			\
		   -f $(TB_FILES)				\
		   -full64 						\
		   +v2k							\
		   -override_timescale=1ns/10ps	\
		   -fsdb 						\
		   -cpp g++-4.8 				\
		   -cc  gcc-4.8 			    \
		   -LDFLAGS 				    \
		   -Wl,--no-as-needed 		    \
		   +define+FSDB 			    \
		   $(VPD_OPTION)  			    \
		   $(TIMEING_OPTION)		    \
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
	./$(OUTPUT) -l $(SIM_LOG_FILE).log

cov:

debug:
	dve -vpd vcdplus.vpd & 
	
.PHONY: clean
clean:
	rm -rf csrc *simv *.daidir *.log *.key $(OUTPUT) *.vpd DVEfiles	

# display the help information
help:
	@echo
	@echo ======================= Help ====================== 
	@echo "command:     descript:"
	@echo "make clean : clean the team file."
	@echo "make help  : print the all command."
	@echo ======================= Help ====================== 
