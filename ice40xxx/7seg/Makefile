filename = top
pcf_file = ../common/io.pcf

build:
	yosys -p 'synth_ice40 -top $(filename) -json $(filename).json' $(filename).v
	nextpnr-ice40 --up5k --package sg48 --json $(filename).json --pcf $(pcf_file) --asc $(filename).asc
	icepack $(filename).asc $(filename).bin

prog: #for sram
	iceprog -S $(filename).bin

prog_flash:
	iceprog $(filename).bin

clean:
	rm -rf $(filename).json $(filename).asc $(filename).bin
