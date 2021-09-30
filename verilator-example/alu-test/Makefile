# verilator makefile

VERILOG_SOURCES=alu.v
CPP_SOURCES=main.cpp alu.cpp
VXX=verilator
VXX_FLAG=-Wall --cc
TEMP_FLODER=obj_dir
TARGET=Valu

all:$(VERILOG_SOURCES)
	$(VXX) --lint-only $(VERILOG_SOURCES)
	$(VXX) $(VXX_FLAG) $(VERILOG_SOURCES) --exe $(CPP_SOURCES)
	make -j -C $(TEMP_FLODER) -f $(TARGET).mk $(TARGET)
	$(TEMP_FLODER)/$(TARGET)

check:$(VERILOG_SOURCES)
	$(VXX) --lint-only $(VERILOG_SOURCES)

build:
	make -j -C $(TEMP_FLODER) -f $(TARGET).mk $(TARGET)

run:
	$(TEMP_FLODER)/$(TARGET)

.PHONY:clean
clean:
	rm -rf obj_dir
