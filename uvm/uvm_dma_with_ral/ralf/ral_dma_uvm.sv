`ifndef RAL_DMA_UVM
`define RAL_DMA_UVM

class ral_reg_dma_memory_map_dma_address_block_INTR extends uvm_reg;
	rand uvm_reg_field STATUS;
	rand uvm_reg_field MASK;

	function new(string name = "dma_memory_map_dma_address_block_INTR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.STATUS = uvm_reg_field::type_id::create("STATUS",,get_full_name());
      this.STATUS.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.MASK = uvm_reg_field::type_id::create("MASK",,get_full_name());
      this.MASK.configure(this, 16, 16, "RW", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_dma_memory_map_dma_address_block_INTR)

endclass : ral_reg_dma_memory_map_dma_address_block_INTR


class ral_reg_dma_memory_map_dma_address_block_CTRL extends uvm_reg;
	rand uvm_reg_field START_DMA;
	rand uvm_reg_field W_COUNT;
	rand uvm_reg_field IO_MEM;
	rand uvm_reg_field RESVD;

	function new(string name = "dma_memory_map_dma_address_block_CTRL");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.START_DMA = uvm_reg_field::type_id::create("START_DMA",,get_full_name());
      this.START_DMA.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.W_COUNT = uvm_reg_field::type_id::create("W_COUNT",,get_full_name());
      this.W_COUNT.configure(this, 8, 1, "RW", 0, 8'h0, 1, 0, 0);
      this.IO_MEM = uvm_reg_field::type_id::create("IO_MEM",,get_full_name());
      this.IO_MEM.configure(this, 1, 9, "RW", 0, 1'h0, 1, 0, 0);
      this.RESVD = uvm_reg_field::type_id::create("RESVD",,get_full_name());
      this.RESVD.configure(this, 22, 10, "RW", 0, 22'h0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_dma_memory_map_dma_address_block_CTRL)

endclass : ral_reg_dma_memory_map_dma_address_block_CTRL


class ral_reg_dma_memory_map_dma_address_block_IO_ADDR extends uvm_reg;
	rand uvm_reg_field ADDRESS;

	function new(string name = "dma_memory_map_dma_address_block_IO_ADDR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.ADDRESS = uvm_reg_field::type_id::create("ADDRESS",,get_full_name());
      this.ADDRESS.configure(this, 32, 0, "RW", 0, 32'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_dma_memory_map_dma_address_block_IO_ADDR)

endclass : ral_reg_dma_memory_map_dma_address_block_IO_ADDR


class ral_reg_dma_memory_map_dma_address_block_MEM_ADDR extends uvm_reg;
	uvm_reg_field ADDRESS;

	function new(string name = "dma_memory_map_dma_address_block_MEM_ADDR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.ADDRESS = uvm_reg_field::type_id::create("ADDRESS",,get_full_name());
      this.ADDRESS.configure(this, 32, 0, "RO", 0, 32'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_dma_memory_map_dma_address_block_MEM_ADDR)

endclass : ral_reg_dma_memory_map_dma_address_block_MEM_ADDR


class ral_block_dma_memory_map_dma_address_block extends uvm_reg_block;
	rand ral_reg_dma_memory_map_dma_address_block_INTR INTR;
	rand ral_reg_dma_memory_map_dma_address_block_CTRL CTRL;
	rand ral_reg_dma_memory_map_dma_address_block_IO_ADDR IO_ADDR;
	rand ral_reg_dma_memory_map_dma_address_block_MEM_ADDR MEM_ADDR;
	rand uvm_reg_field INTR_STATUS;
	rand uvm_reg_field STATUS;
	rand uvm_reg_field INTR_MASK;
	rand uvm_reg_field MASK;
	rand uvm_reg_field CTRL_START_DMA;
	rand uvm_reg_field START_DMA;
	rand uvm_reg_field CTRL_W_COUNT;
	rand uvm_reg_field W_COUNT;
	rand uvm_reg_field CTRL_IO_MEM;
	rand uvm_reg_field IO_MEM;
	rand uvm_reg_field CTRL_RESVD;
	rand uvm_reg_field RESVD;
	rand uvm_reg_field IO_ADDR_ADDRESS;
	uvm_reg_field MEM_ADDR_ADDRESS;

	function new(string name = "dma_memory_map_dma_address_block");
		super.new(name, build_coverage(UVM_NO_COVERAGE));
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.INTR = ral_reg_dma_memory_map_dma_address_block_INTR::type_id::create("INTR",,get_full_name());
      this.INTR.configure(this, null, "");
      this.INTR.build();
	  uvm_resource_db#(bit)::set({"REG::", INTR.get_full_name()}, "NO_REG_BIT_BASH_TEST", 1, this);
      this.default_map.add_reg(this.INTR, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.INTR_STATUS = this.INTR.STATUS;
		this.STATUS = this.INTR.STATUS;
		this.INTR_MASK = this.INTR.MASK;
		this.MASK = this.INTR.MASK;
      this.CTRL = ral_reg_dma_memory_map_dma_address_block_CTRL::type_id::create("CTRL",,get_full_name());
      this.CTRL.configure(this, null, "");
      this.CTRL.build();
	  uvm_resource_db#(bit)::set({"REG::", CTRL.get_full_name()}, "NO_REG_BIT_BASH_TEST", 1, this);
      this.default_map.add_reg(this.CTRL, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
		this.CTRL_START_DMA = this.CTRL.START_DMA;
		this.START_DMA = this.CTRL.START_DMA;
		this.CTRL_W_COUNT = this.CTRL.W_COUNT;
		this.W_COUNT = this.CTRL.W_COUNT;
		this.CTRL_IO_MEM = this.CTRL.IO_MEM;
		this.IO_MEM = this.CTRL.IO_MEM;
		this.CTRL_RESVD = this.CTRL.RESVD;
		this.RESVD = this.CTRL.RESVD;
      this.IO_ADDR = ral_reg_dma_memory_map_dma_address_block_IO_ADDR::type_id::create("IO_ADDR",,get_full_name());
      this.IO_ADDR.configure(this, null, "");
      this.IO_ADDR.build();
      this.default_map.add_reg(this.IO_ADDR, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
		this.IO_ADDR_ADDRESS = this.IO_ADDR.ADDRESS;
      this.MEM_ADDR = ral_reg_dma_memory_map_dma_address_block_MEM_ADDR::type_id::create("MEM_ADDR",,get_full_name());
      this.MEM_ADDR.configure(this, null, "");
      this.MEM_ADDR.build();
      this.default_map.add_reg(this.MEM_ADDR, `UVM_REG_ADDR_WIDTH'hC, "RO", 0);
		this.MEM_ADDR_ADDRESS = this.MEM_ADDR.ADDRESS;
   endfunction : build

	`uvm_object_utils(ral_block_dma_memory_map_dma_address_block)

endclass : ral_block_dma_memory_map_dma_address_block


class ral_sys_dma_uvm extends uvm_reg_block;

   rand ral_block_dma_memory_map_dma_address_block dma_memory_map_dma_address_block;

	function new(string name = "dma_uvm");
		super.new(name);
	endfunction: new

	function void build();
      this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.dma_memory_map_dma_address_block = ral_block_dma_memory_map_dma_address_block::type_id::create("dma_memory_map_dma_address_block",,get_full_name());
      this.dma_memory_map_dma_address_block.configure(this, "");
      this.dma_memory_map_dma_address_block.build();
      this.default_map.add_submap(this.dma_memory_map_dma_address_block.default_map, `UVM_REG_ADDR_WIDTH'h0);
	endfunction : build

	`uvm_object_utils(ral_sys_dma_uvm)
endclass : ral_sys_dma_uvm



`endif
