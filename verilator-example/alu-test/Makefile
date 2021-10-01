# verilator makefile

VERILOG_SOURCES=alu.v

VXX=verilator
# Input files for Verilator
VERILATOR_INPUT = $(VERILOG_SOURCES) main.cpp alu.cpp

# Generate C++ in executable form
VERILATOR_FLAGS += -cc --exe
# Generate makefile dependencies (not shown as complicates the Makefile)
#VERILATOR_FLAGS += -MMD
# Optimize
#VERILATOR_FLAGS += -Os -x-assign 0
# Warn abount lint issues; may not want this on less solid designs
VERILATOR_FLAGS += -Wall
# Make waveforms
#VERILATOR_FLAGS += --trace
# Check SystemVerilog assertions
#VERILATOR_FLAGS += --assert
# Generate coverage analysis
#VERILATOR_FLAGS += --coverage
# Run Verilator in debug mode
#VERILATOR_FLAGS += --debug
# Add this trace to get a backtrace in gdb
#VERILATOR_FLAGS += --gdbbt

TEMP_FLODER=obj_dir
TARGET=Valu

all:$(VERILOG_SOURCES)
	@echo
	@echo "-- Verilator tracing example"

	@echo
	@echo "-- LINT --- ----------------"
	$(VXX) --lint-only $(VERILOG_SOURCES)
	
	@echo
	@echo "-- VERILATE ----------------"
	$(VXX) $(VERILATOR_FLAGS) $(VERILATOR_INPUT)
	
	@echo
	@echo "-- BUILD -------------------"
	make -j -C $(TEMP_FLODER) -f $(TARGET).mk $(TARGET)

	@echo
	@echo "-- RUN ---------------------"	
	$(TEMP_FLODER)/$(TARGET)
	
	@echo
	@echo "-- DONE --------------------"
	@echo "To see waveforms, open vlt_dump.vcd in a waveform viewer"
	@echo

check:$(VERILOG_SOURCES)
	@echo
	@echo "-- LINT --- ----------------"
	$(VXX) --lint-only $(VERILOG_SOURCES)

build:
	@echo
	@echo "-- BUILD -------------------"
	make -j -C $(TEMP_FLODER) -f $(TARGET).mk $(TARGET)

run:
	@echo
	@echo "-- RUN ---------------------"	
	$(TEMP_FLODER)/$(TARGET)

.PHONY:clean
clean:
	@echo
	@echo "-- CLEAN -------------------"	
	rm -rf obj_dir
