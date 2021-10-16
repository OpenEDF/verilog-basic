# -----------------------------------------------------------------------------
# LATTICE ICEUP405K
filename = key_leds

# set the board ICESUGAR and ICEPLUS
BOARD = ICESUGAR

# Set up the board
ifeq ($(BOARD), ICESUGAR)
	pcf_file = ../icesugar_io/io.pcf
	CMD = build flash clean
else
	pcf_file = ../ice40_ultraplus_io/io.pcf
	CMD = build prog clean
endif

# build bitstream to sram 
all: build $(CMD) clean

# build
build:
	yosys -p 'synth_ice40 -top $(filename) -json $(filename).json' $(filename).v
	nextpnr-ice40      \
   		--up5k         \
		--package sg48 \
		--json $(filename).json \
		--pcf $(pcf_file)       \
		--asc $(filename).asc
	icepack $(filename).asc $(filename).bin

prog:
	iceprog -S $(filename).bin

# icesugar only support program flash
flash:
	../tools/icesprog $(filename).bin	

prog_flash:
	iceprog $(filename).bin

# clean the temp file
clean:
	rm -rf $(filename).blif $(filename).asc $(filename).bin $(filename).json
# -----------------------------------------------------------------------------
