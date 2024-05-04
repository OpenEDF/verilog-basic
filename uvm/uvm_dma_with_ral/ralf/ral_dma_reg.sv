`ifndef RAL_DMA_REG
`define RAL_DMA_REG

class ral_reg_dma_reg_INTR extends uvm_reg;
	rand uvm_reg_field STATUS;
	rand uvm_reg_field MASK;

	function new(string name = "dma_reg_INTR");
		super.new(name, 32,UVM_NO_COVERAGE);
	endfunction: new
   virtual function void build();
      this.STATUS = uvm_reg_field::type_id::create("STATUS",,get_full_name());
      this.STATUS.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.MASK = uvm_reg_field::type_id::create("MASK",,get_full_name());
      this.MASK.configure(this, 16, 16, "RW", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_dma_reg_INTR)

endclass : ral_reg_dma_reg_INTR


class ral_reg_dma_reg_CTRL extends uvm_reg;
	rand uvm_reg_field START_DMA;
	rand uvm_reg_field W_COUNT;
	rand uvm_reg_field IO_MEM;
	rand uvm_reg_field RESVD;

	function new(string name = "dma_reg_CTRL");
		super.new(name, 32,UVM_NO_COVERAGE);
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

	`uvm_object_utils(ral_reg_dma_reg_CTRL)

endclass : ral_reg_dma_reg_CTRL


class ral_reg_dma_reg_IO_ADDR extends uvm_reg;
	rand uvm_reg_field ADDRESS;

	function new(string name = "dma_reg_IO_ADDR");
		super.new(name, 32,UVM_NO_COVERAGE);
	endfunction: new
   virtual function void build();
      this.ADDRESS = uvm_reg_field::type_id::create("ADDRESS",,get_full_name());
      this.ADDRESS.configure(this, 32, 0, "RW", 0, 32'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_dma_reg_IO_ADDR)

endclass : ral_reg_dma_reg_IO_ADDR


class ral_reg_dma_reg_MEM_ADDR extends uvm_reg;
	uvm_reg_field ADDRESS;

	function new(string name = "dma_reg_MEM_ADDR");
		super.new(name, 32,UVM_NO_COVERAGE);
	endfunction: new
   virtual function void build();
      this.ADDRESS = uvm_reg_field::type_id::create("ADDRESS",,get_full_name());
      this.ADDRESS.configure(this, 32, 0, "RO", 0, 32'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_dma_reg_MEM_ADDR)

endclass : ral_reg_dma_reg_MEM_ADDR


class ral_block_dma_reg extends uvm_reg_block;
	rand ral_reg_dma_reg_INTR INTR;
	rand ral_reg_dma_reg_CTRL CTRL;
	rand ral_reg_dma_reg_IO_ADDR IO_ADDR;
	rand ral_reg_dma_reg_MEM_ADDR MEM_ADDR;
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
	rand uvm_reg_field MEM_ADDR_ADDRESS;

	function new(string name = "dma_reg");
		super.new(name, UVM_NO_COVERAGE);
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.INTR = ral_reg_dma_reg_INTR::type_id::create("INTR",,get_full_name());
      this.INTR.configure(this, null, "");
      this.INTR.build();
      this.default_map.add_reg(this.INTR, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.INTR_STATUS = this.INTR.STATUS;
		this.STATUS = this.INTR.STATUS;
		this.INTR_MASK = this.INTR.MASK;
		this.MASK = this.INTR.MASK;
      this.CTRL = ral_reg_dma_reg_CTRL::type_id::create("CTRL",,get_full_name());
      this.CTRL.configure(this, null, "");
      this.CTRL.build();
      this.default_map.add_reg(this.CTRL, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
		this.CTRL_START_DMA = this.CTRL.START_DMA;
		this.START_DMA = this.CTRL.START_DMA;
		this.CTRL_W_COUNT = this.CTRL.W_COUNT;
		this.W_COUNT = this.CTRL.W_COUNT;
		this.CTRL_IO_MEM = this.CTRL.IO_MEM;
		this.IO_MEM = this.CTRL.IO_MEM;
		this.CTRL_RESVD = this.CTRL.RESVD;
		this.RESVD = this.CTRL.RESVD;
      this.IO_ADDR = ral_reg_dma_reg_IO_ADDR::type_id::create("IO_ADDR",,get_full_name());
      this.IO_ADDR.configure(this, null, "");
      this.IO_ADDR.build();
      this.default_map.add_reg(this.IO_ADDR, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
		this.IO_ADDR_ADDRESS = this.IO_ADDR.ADDRESS;
      this.MEM_ADDR = ral_reg_dma_reg_MEM_ADDR::type_id::create("MEM_ADDR",,get_full_name());
      this.MEM_ADDR.configure(this, null, "");
      this.MEM_ADDR.build();
      this.default_map.add_reg(this.MEM_ADDR, `UVM_REG_ADDR_WIDTH'hC, "RO", 0);
		this.MEM_ADDR_ADDRESS = this.MEM_ADDR.ADDRESS;
       lock_model();
   endfunction : build

	`uvm_object_utils(ral_block_dma_reg)

endclass : ral_block_dma_reg



`endif
