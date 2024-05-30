`ifndef RAL_HOST_REGMODEL
`define RAL_HOST_REGMODEL

import uvm_pkg::*;

class ral_reg_HOST_ID extends uvm_reg;
	uvm_reg_field REV_ID;
	uvm_reg_field CHIP_ID;

	function new(string name = "HOST_ID");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.REV_ID = uvm_reg_field::type_id::create("REV_ID",,get_full_name());
      this.REV_ID.configure(this, 8, 0, "RO", 0, 8'h03, 1, 0, 1);
      this.CHIP_ID = uvm_reg_field::type_id::create("CHIP_ID",,get_full_name());
      this.CHIP_ID.configure(this, 8, 8, "RO", 0, 8'h5A, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_HOST_ID)

endclass : ral_reg_HOST_ID


class ral_reg_LOCK extends uvm_reg;
	rand uvm_reg_field LOCK;

	function new(string name = "LOCK");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.LOCK = uvm_reg_field::type_id::create("LOCK",,get_full_name());
      this.LOCK.configure(this, 16, 0, "W1C", 0, 16'hffff, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_LOCK)

endclass : ral_reg_LOCK


class ral_reg_R_ARRAY extends uvm_reg;
	rand uvm_reg_field H_REG;

	function new(string name = "R_ARRAY");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.H_REG = uvm_reg_field::type_id::create("H_REG",,get_full_name());
      this.H_REG.configure(this, 16, 0, "RW", 0, 16'h0000, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_R_ARRAY)

endclass : ral_reg_R_ARRAY


class ral_mem_RAM extends uvm_mem;
   function new(string name = "RAM");
      super.new(name, `UVM_REG_ADDR_WIDTH'h1000, 16, "RW", build_coverage(UVM_NO_COVERAGE));
   endfunction
   virtual function void build();
   endfunction: build

   `uvm_object_utils(ral_mem_RAM)

endclass : ral_mem_RAM


class ral_block_host_regmodel extends uvm_reg_block;
	rand ral_reg_HOST_ID HOST_ID;
	rand ral_reg_LOCK LOCK;
	rand ral_reg_R_ARRAY R_ARRAY[256];
	rand ral_mem_RAM RAM;
	uvm_reg_field HOST_ID_REV_ID;
	uvm_reg_field REV_ID;
	uvm_reg_field HOST_ID_CHIP_ID;
	uvm_reg_field CHIP_ID;
	rand uvm_reg_field LOCK_LOCK;
	rand uvm_reg_field R_ARRAY_H_REG[256];
	rand uvm_reg_field H_REG[256];

	function new(string name = "host_regmodel");
		super.new(name, build_coverage(UVM_NO_COVERAGE));
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 2, UVM_LITTLE_ENDIAN, 0);
      this.HOST_ID = ral_reg_HOST_ID::type_id::create("HOST_ID",,get_full_name());
      this.HOST_ID.configure(this, null, "");
      this.HOST_ID.build();
         this.HOST_ID.add_hdl_path('{

            '{"host_id", -1, -1}
         });
      this.default_map.add_reg(this.HOST_ID, `UVM_REG_ADDR_WIDTH'h0, "RO", 0);
		this.HOST_ID_REV_ID = this.HOST_ID.REV_ID;
		this.REV_ID = this.HOST_ID.REV_ID;
		this.HOST_ID_CHIP_ID = this.HOST_ID.CHIP_ID;
		this.CHIP_ID = this.HOST_ID.CHIP_ID;
      this.LOCK = ral_reg_LOCK::type_id::create("LOCK",,get_full_name());
      this.LOCK.configure(this, null, "");
      this.LOCK.build();
         this.LOCK.add_hdl_path('{

            '{"lock", -1, -1}
         });
      this.default_map.add_reg(this.LOCK, `UVM_REG_ADDR_WIDTH'h100, "RW", 0);
		this.LOCK_LOCK = this.LOCK.LOCK;
      foreach (this.R_ARRAY[i]) begin
         int J = i;
         this.R_ARRAY[J] = ral_reg_R_ARRAY::type_id::create($psprintf("R_ARRAY[%0d]",J),,get_full_name());
         this.R_ARRAY[J].configure(this, null, "");
         this.R_ARRAY[J].build();
         this.R_ARRAY[J].add_hdl_path('{

            '{$psprintf("host_reg[%0d]", J), -1, -1}
         });
         this.default_map.add_reg(this.R_ARRAY[J], `UVM_REG_ADDR_WIDTH'h1000+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.R_ARRAY_H_REG[J] = this.R_ARRAY[J].H_REG;
			this.H_REG[J] = this.R_ARRAY[J].H_REG;
      end
      this.RAM = ral_mem_RAM::type_id::create("RAM",,get_full_name());
      this.RAM.configure(this, "ram");
      this.RAM.build();
      this.default_map.add_mem(this.RAM, `UVM_REG_ADDR_WIDTH'h4000, "RW", 0);
   endfunction : build

	`uvm_object_utils(ral_block_host_regmodel)

endclass : ral_block_host_regmodel



`endif
