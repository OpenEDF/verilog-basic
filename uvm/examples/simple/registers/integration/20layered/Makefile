## 
## -------------------------------------------------------------
##    Copyright 2010-2011 Synopsys, Inc.
##    All Rights Reserved Worldwide
## 
##    Licensed under the Apache License, Version 2.0 (the
##    "License"); you may not use this file except in
##    compliance with the License.  You may obtain a copy of
##    the License at
## 
##        http://www.apache.org/licenses/LICENSE-2.0
## 
##    Unless required by applicable law or agreed to in
##    writing, software distributed under the License is
##    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
##    CONDITIONS OF ANY KIND, either express or implied.  See
##    the License for the specific language governing
##    permissions and limitations under the License.
## -------------------------------------------------------------
## 

##
## By default, execute in implicit monitoring mode.
## Use 'make EXPLICIT=1' to execute in explicit monitoring mode
##


include ../../../../Makefile.vcs

ifdef EXPLICIT_MON
OPTS	+= +define+EXPLICIT_MON
endif


all: comp run

comp:
	$(VCS) $(OPTS) +incdir+../common \
		+incdir+../../../../integrated/apb \
		../common/test.sv


run: comp uvm_reg_mem_built_in_seq


uvm_%_seq: comp
	$(SIMV) +UVM_SEQUENCE=$@
	$(CHECK)

