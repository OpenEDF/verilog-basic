#/bin/sh
#--------------------------------------------------------------------------
# Brief:  IP-XACT generate the RALF file and SV UVM RAL model
# Author: Macro
# Date:   2024/06/13

#--------------------------------------------------------------------------
XML_XRC_FILE = ./ipxact/cmsdk_ahb_gpio_configurable

ralf:
	ralgen -full64 -ipxact2ralf $(XML_XRC_FILE).xml

uvm_ralf:
	ralgen -full64 -ipxact -uvm -t cmsdk_ahb_gpio_Register_AddressBlock ${XML_XRC_FILE}.xml 

# clean
.PHONY: clean ralf uvm_ralf
clean:
	rm -rf *.log

#--------------------------------------------------------------------------
