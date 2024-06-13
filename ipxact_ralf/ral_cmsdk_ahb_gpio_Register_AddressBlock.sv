`ifndef RAL_CMSDK_AHB_GPIO_REGISTER_ADDRESSBLOCK
`define RAL_CMSDK_AHB_GPIO_REGISTER_ADDRESSBLOCK

import uvm_pkg::*;

class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATA extends uvm_reg;
	uvm_reg_field read_data;
	rand uvm_reg_field write_data;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATA");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.read_data = uvm_reg_field::type_id::create("read_data",,get_full_name());
      this.read_data.configure(this, 16, 0, "RO", 0, 16'h0, 1, 0, 0);
      this.write_data = uvm_reg_field::type_id::create("write_data",,get_full_name());
      this.write_data.configure(this, 16, 0, "WO", 0, 16'h0, 1, 0, 0);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATA)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATA


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATOUT extends uvm_reg;
	uvm_reg_field read_data;
	rand uvm_reg_field write_data;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATOUT");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.read_data = uvm_reg_field::type_id::create("read_data",,get_full_name());
      this.read_data.configure(this, 16, 0, "RO", 0, 16'h0, 1, 0, 0);
      this.write_data = uvm_reg_field::type_id::create("write_data",,get_full_name());
      this.write_data.configure(this, 16, 0, "WO", 0, 16'h0, 1, 0, 0);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATOUT)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATOUT


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENSET extends uvm_reg;
	rand uvm_reg_field output_enable;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENSET");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.output_enable = uvm_reg_field::type_id::create("output_enable",,get_full_name());
      this.output_enable.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENSET)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENSET


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENCLR extends uvm_reg;
	rand uvm_reg_field output_enable_clear;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENCLR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.output_enable_clear = uvm_reg_field::type_id::create("output_enable_clear",,get_full_name());
      this.output_enable_clear.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENCLR)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENCLR


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCSET extends uvm_reg;
	rand uvm_reg_field alternate_function_set;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCSET");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.alternate_function_set = uvm_reg_field::type_id::create("alternate_function_set",,get_full_name());
      this.alternate_function_set.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCSET)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCSET


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCCLR extends uvm_reg;
	rand uvm_reg_field alternate_function_clear;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCCLR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.alternate_function_clear = uvm_reg_field::type_id::create("alternate_function_clear",,get_full_name());
      this.alternate_function_clear.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCCLR)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCCLR


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENSET extends uvm_reg;
	rand uvm_reg_field interrupt_enable;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENSET");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.interrupt_enable = uvm_reg_field::type_id::create("interrupt_enable",,get_full_name());
      this.interrupt_enable.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENSET)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENSET


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENCLR extends uvm_reg;
	rand uvm_reg_field interrupt_enable_clear;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENCLR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.interrupt_enable_clear = uvm_reg_field::type_id::create("interrupt_enable_clear",,get_full_name());
      this.interrupt_enable_clear.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENCLR)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENCLR


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPESET extends uvm_reg;
	rand uvm_reg_field set_irq_type;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPESET");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.set_irq_type = uvm_reg_field::type_id::create("set_irq_type",,get_full_name());
      this.set_irq_type.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPESET)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPESET


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPECLR extends uvm_reg;
	rand uvm_reg_field clear_irq_type;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPECLR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.clear_irq_type = uvm_reg_field::type_id::create("clear_irq_type",,get_full_name());
      this.clear_irq_type.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPECLR)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPECLR


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLSET extends uvm_reg;
	rand uvm_reg_field set_irq_polarity_level;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLSET");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.set_irq_polarity_level = uvm_reg_field::type_id::create("set_irq_polarity_level",,get_full_name());
      this.set_irq_polarity_level.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLSET)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLSET


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLCLR extends uvm_reg;
	rand uvm_reg_field clear_irq_polarity_level;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLCLR");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.clear_irq_polarity_level = uvm_reg_field::type_id::create("clear_irq_polarity_level",,get_full_name());
      this.clear_irq_polarity_level.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLCLR)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLCLR


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTSTATUS extends uvm_reg;
	rand uvm_reg_field read_irq_status;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTSTATUS");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.read_irq_status = uvm_reg_field::type_id::create("read_irq_status",,get_full_name());
      this.read_irq_status.configure(this, 16, 0, "RW", 0, 16'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTSTATUS)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTSTATUS


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKLOWBYTE extends uvm_reg;
	uvm_reg_field Reserved_31_8;
	rand uvm_reg_field lower_enable_mask;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKLOWBYTE");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
      this.lower_enable_mask = uvm_reg_field::type_id::create("lower_enable_mask",,get_full_name());
      this.lower_enable_mask.configure(this, 8, 0, "RW", 0, 8'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKLOWBYTE)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKLOWBYTE


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKHIGHBYTE extends uvm_reg;
	rand uvm_reg_field higher_enable_mask;
	uvm_reg_field Reserved_7_0;
	uvm_reg_field Reserved_31_16;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKHIGHBYTE");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.higher_enable_mask = uvm_reg_field::type_id::create("higher_enable_mask",,get_full_name());
      this.higher_enable_mask.configure(this, 8, 8, "RW", 0, 8'h0, 1, 0, 1);
      this.Reserved_7_0 = uvm_reg_field::type_id::create("Reserved_7_0",,get_full_name());
      this.Reserved_7_0.configure(this, 8, 0, "RO", 0, 8'h0, 1, 0, 1);
      this.Reserved_31_16 = uvm_reg_field::type_id::create("Reserved_31_16",,get_full_name());
      this.Reserved_31_16.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKHIGHBYTE)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKHIGHBYTE


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID4 extends uvm_reg;
	uvm_reg_field block_count;
	uvm_reg_field jep106_c_code;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID4");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.block_count = uvm_reg_field::type_id::create("block_count",,get_full_name());
      this.block_count.configure(this, 4, 4, "RO", 0, 4'h0, 1, 0, 0);
      this.jep106_c_code = uvm_reg_field::type_id::create("jep106_c_code",,get_full_name());
      this.jep106_c_code.configure(this, 4, 0, "RO", 0, 4'h4, 1, 0, 0);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID4)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID4


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID5 extends uvm_reg;
	uvm_reg_field PID5;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID5");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PID5 = uvm_reg_field::type_id::create("PID5",,get_full_name());
      this.PID5.configure(this, 8, 0, "RO", 0, 8'h0, 1, 0, 1);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID5)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID5


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID6 extends uvm_reg;
	uvm_reg_field PID6;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID6");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PID6 = uvm_reg_field::type_id::create("PID6",,get_full_name());
      this.PID6.configure(this, 8, 0, "RO", 0, 8'h0, 1, 0, 1);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID6)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID6


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID7 extends uvm_reg;
	uvm_reg_field PID7;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID7");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PID7 = uvm_reg_field::type_id::create("PID7",,get_full_name());
      this.PID7.configure(this, 8, 0, "RO", 0, 8'h0, 1, 0, 1);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID7)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID7


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID0 extends uvm_reg;
	uvm_reg_field part_num;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID0");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.part_num = uvm_reg_field::type_id::create("part_num",,get_full_name());
      this.part_num.configure(this, 8, 0, "RO", 0, 8'h21, 1, 0, 1);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID0)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID0


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID1 extends uvm_reg;
	uvm_reg_field jep106_id_3_0;
	uvm_reg_field part_num;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID1");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.jep106_id_3_0 = uvm_reg_field::type_id::create("jep106_id_3_0",,get_full_name());
      this.jep106_id_3_0.configure(this, 4, 4, "RO", 0, 4'hb, 1, 0, 0);
      this.part_num = uvm_reg_field::type_id::create("part_num",,get_full_name());
      this.part_num.configure(this, 4, 0, "RO", 0, 4'h8, 1, 0, 0);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID1)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID1


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID2 extends uvm_reg;
	uvm_reg_field revision_num;
	uvm_reg_field jedec_used;
	uvm_reg_field jep106_id_6_4;
	uvm_reg_field Reserved_31__8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID2");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.revision_num = uvm_reg_field::type_id::create("revision_num",,get_full_name());
      this.revision_num.configure(this, 4, 4, "RO", 0, 4'h1, 1, 0, 0);
      this.jedec_used = uvm_reg_field::type_id::create("jedec_used",,get_full_name());
      this.jedec_used.configure(this, 1, 3, "RO", 0, 1'h1, 1, 0, 0);
      this.jep106_id_6_4 = uvm_reg_field::type_id::create("jep106_id_6_4",,get_full_name());
      this.jep106_id_6_4.configure(this, 3, 0, "RO", 0, 3'h3, 1, 0, 0);
      this.Reserved_31__8 = uvm_reg_field::type_id::create("Reserved_31__8",,get_full_name());
      this.Reserved_31__8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID2)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID2


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID3 extends uvm_reg;
	uvm_reg_field eco_rev_num;
	uvm_reg_field customer_mod_num;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID3");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.eco_rev_num = uvm_reg_field::type_id::create("eco_rev_num",,get_full_name());
      this.eco_rev_num.configure(this, 4, 4, "RO", 0, 4'h0, 1, 0, 0);
      this.customer_mod_num = uvm_reg_field::type_id::create("customer_mod_num",,get_full_name());
      this.customer_mod_num.configure(this, 4, 0, "RO", 0, 4'h0, 1, 0, 0);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID3)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID3


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID0 extends uvm_reg;
	uvm_reg_field CID0;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID0");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.CID0 = uvm_reg_field::type_id::create("CID0",,get_full_name());
      this.CID0.configure(this, 8, 0, "RO", 0, 8'hd, 1, 0, 1);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID0)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID0


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID1 extends uvm_reg;
	uvm_reg_field CID1;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID1");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.CID1 = uvm_reg_field::type_id::create("CID1",,get_full_name());
      this.CID1.configure(this, 8, 0, "RO", 0, 8'hf0, 1, 0, 1);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID1)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID1


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID2 extends uvm_reg;
	uvm_reg_field CID2;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID2");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.CID2 = uvm_reg_field::type_id::create("CID2",,get_full_name());
      this.CID2.configure(this, 8, 0, "RO", 0, 8'h5, 1, 0, 1);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID2)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID2


class ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID3 extends uvm_reg;
	uvm_reg_field CID3;
	uvm_reg_field Reserved_31_8;

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID3");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.CID3 = uvm_reg_field::type_id::create("CID3",,get_full_name());
      this.CID3.configure(this, 8, 0, "RO", 0, 8'hb1, 1, 0, 1);
      this.Reserved_31_8 = uvm_reg_field::type_id::create("Reserved_31_8",,get_full_name());
      this.Reserved_31_8.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID3)

endclass : ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID3


class ral_block_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock extends uvm_reg_block;
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATA DATA[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATOUT DATOUT[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENSET OUTENSET[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENCLR OUTENCLR[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCSET ALTFUNCSET[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCCLR ALTFUNCCLR[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENSET INTENSET[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENCLR INTENCLR[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPESET INTTYPESET[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPECLR INTTYPECLR[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLSET INTPOLSET[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLCLR INTPOLCLR[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTSTATUS INTSTATUS[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKLOWBYTE MASKLOWBYTE[256];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKHIGHBYTE MASKHIGHBYTE[256];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID4 PID4[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID5 PID5[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID6 PID6[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID7 PID7[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID0 PID0[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID1 PID1[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID2 PID2[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID3 PID3[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID0 CID0[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID1 CID1[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID2 CID2[1];
	rand ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID3 CID3[1];
	uvm_reg_field DATA_read_data[1];
	rand uvm_reg_field DATA_write_data[1];
	uvm_reg_field DATA_Reserved_31_16[1];
	uvm_reg_field DATOUT_read_data[1];
	rand uvm_reg_field DATOUT_write_data[1];
	uvm_reg_field DATOUT_Reserved_31_16[1];
	rand uvm_reg_field OUTENSET_output_enable[1];
	rand uvm_reg_field output_enable[1];
	uvm_reg_field OUTENSET_Reserved_31_16[1];
	rand uvm_reg_field OUTENCLR_output_enable_clear[1];
	rand uvm_reg_field output_enable_clear[1];
	uvm_reg_field OUTENCLR_Reserved_31_16[1];
	rand uvm_reg_field ALTFUNCSET_alternate_function_set[1];
	rand uvm_reg_field alternate_function_set[1];
	uvm_reg_field ALTFUNCSET_Reserved_31_16[1];
	rand uvm_reg_field ALTFUNCCLR_alternate_function_clear[1];
	rand uvm_reg_field alternate_function_clear[1];
	uvm_reg_field ALTFUNCCLR_Reserved_31_16[1];
	rand uvm_reg_field INTENSET_interrupt_enable[1];
	rand uvm_reg_field interrupt_enable[1];
	uvm_reg_field INTENSET_Reserved_31_16[1];
	rand uvm_reg_field INTENCLR_interrupt_enable_clear[1];
	rand uvm_reg_field interrupt_enable_clear[1];
	uvm_reg_field INTENCLR_Reserved_31_16[1];
	rand uvm_reg_field INTTYPESET_set_irq_type[1];
	rand uvm_reg_field set_irq_type[1];
	uvm_reg_field INTTYPESET_Reserved_31_16[1];
	rand uvm_reg_field INTTYPECLR_clear_irq_type[1];
	rand uvm_reg_field clear_irq_type[1];
	uvm_reg_field INTTYPECLR_Reserved_31_16[1];
	rand uvm_reg_field INTPOLSET_set_irq_polarity_level[1];
	rand uvm_reg_field set_irq_polarity_level[1];
	uvm_reg_field INTPOLSET_Reserved_31_16[1];
	rand uvm_reg_field INTPOLCLR_clear_irq_polarity_level[1];
	rand uvm_reg_field clear_irq_polarity_level[1];
	uvm_reg_field INTPOLCLR_Reserved_31_16[1];
	rand uvm_reg_field INTSTATUS_read_irq_status[1];
	rand uvm_reg_field read_irq_status[1];
	uvm_reg_field INTSTATUS_Reserved_31_16[1];
	uvm_reg_field MASKLOWBYTE_Reserved_31_8[256];
	rand uvm_reg_field MASKLOWBYTE_lower_enable_mask[256];
	rand uvm_reg_field lower_enable_mask[256];
	rand uvm_reg_field MASKHIGHBYTE_higher_enable_mask[256];
	rand uvm_reg_field higher_enable_mask[256];
	uvm_reg_field MASKHIGHBYTE_Reserved_7_0[256];
	uvm_reg_field Reserved_7_0[256];
	uvm_reg_field MASKHIGHBYTE_Reserved_31_16[256];
	uvm_reg_field PID4_block_count[1];
	uvm_reg_field block_count[1];
	uvm_reg_field PID4_jep106_c_code[1];
	uvm_reg_field jep106_c_code[1];
	uvm_reg_field PID4_Reserved_31_8[1];
	uvm_reg_field PID5_PID5[1];
	uvm_reg_field PID5_Reserved_31_8[1];
	uvm_reg_field PID6_PID6[1];
	uvm_reg_field PID6_Reserved_31_8[1];
	uvm_reg_field PID7_PID7[1];
	uvm_reg_field PID7_Reserved_31_8[1];
	uvm_reg_field PID0_part_num[1];
	uvm_reg_field PID0_Reserved_31_8[1];
	uvm_reg_field PID1_jep106_id_3_0[1];
	uvm_reg_field jep106_id_3_0[1];
	uvm_reg_field PID1_part_num[1];
	uvm_reg_field PID1_Reserved_31_8[1];
	uvm_reg_field PID2_revision_num[1];
	uvm_reg_field revision_num[1];
	uvm_reg_field PID2_jedec_used[1];
	uvm_reg_field jedec_used[1];
	uvm_reg_field PID2_jep106_id_6_4[1];
	uvm_reg_field jep106_id_6_4[1];
	uvm_reg_field PID2_Reserved_31__8[1];
	uvm_reg_field Reserved_31__8[1];
	uvm_reg_field PID3_eco_rev_num[1];
	uvm_reg_field eco_rev_num[1];
	uvm_reg_field PID3_customer_mod_num[1];
	uvm_reg_field customer_mod_num[1];
	uvm_reg_field PID3_Reserved_31_8[1];
	uvm_reg_field CID0_CID0[1];
	uvm_reg_field CID0_Reserved_31_8[1];
	uvm_reg_field CID1_CID1[1];
	uvm_reg_field CID1_Reserved_31_8[1];
	uvm_reg_field CID2_CID2[1];
	uvm_reg_field CID2_Reserved_31_8[1];
	uvm_reg_field CID3_CID3[1];
	uvm_reg_field CID3_Reserved_31_8[1];

	function new(string name = "AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock");
		super.new(name, build_coverage(UVM_NO_COVERAGE));
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
      foreach (this.DATA[i]) begin
         int J = i;
         this.DATA[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATA::type_id::create($psprintf("DATA[%0d]",J),,get_full_name());
         this.DATA[J].configure(this, null, "");
         this.DATA[J].build();
         this.default_map.add_reg(this.DATA[J], `UVM_REG_ADDR_WIDTH'h0+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.DATA_read_data[J] = this.DATA[J].read_data;
			this.DATA_write_data[J] = this.DATA[J].write_data;
			this.DATA_Reserved_31_16[J] = this.DATA[J].Reserved_31_16;
      end
      foreach (this.DATOUT[i]) begin
         int J = i;
         this.DATOUT[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_DATOUT::type_id::create($psprintf("DATOUT[%0d]",J),,get_full_name());
         this.DATOUT[J].configure(this, null, "");
         this.DATOUT[J].build();
         this.default_map.add_reg(this.DATOUT[J], `UVM_REG_ADDR_WIDTH'h4+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.DATOUT_read_data[J] = this.DATOUT[J].read_data;
			this.DATOUT_write_data[J] = this.DATOUT[J].write_data;
			this.DATOUT_Reserved_31_16[J] = this.DATOUT[J].Reserved_31_16;
      end
      foreach (this.OUTENSET[i]) begin
         int J = i;
         this.OUTENSET[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENSET::type_id::create($psprintf("OUTENSET[%0d]",J),,get_full_name());
         this.OUTENSET[J].configure(this, null, "");
         this.OUTENSET[J].build();
         this.default_map.add_reg(this.OUTENSET[J], `UVM_REG_ADDR_WIDTH'h10+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.OUTENSET_output_enable[J] = this.OUTENSET[J].output_enable;
			this.output_enable[J] = this.OUTENSET[J].output_enable;
			this.OUTENSET_Reserved_31_16[J] = this.OUTENSET[J].Reserved_31_16;
      end
      foreach (this.OUTENCLR[i]) begin
         int J = i;
         this.OUTENCLR[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_OUTENCLR::type_id::create($psprintf("OUTENCLR[%0d]",J),,get_full_name());
         this.OUTENCLR[J].configure(this, null, "");
         this.OUTENCLR[J].build();
         this.default_map.add_reg(this.OUTENCLR[J], `UVM_REG_ADDR_WIDTH'h14+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.OUTENCLR_output_enable_clear[J] = this.OUTENCLR[J].output_enable_clear;
			this.output_enable_clear[J] = this.OUTENCLR[J].output_enable_clear;
			this.OUTENCLR_Reserved_31_16[J] = this.OUTENCLR[J].Reserved_31_16;
      end
      foreach (this.ALTFUNCSET[i]) begin
         int J = i;
         this.ALTFUNCSET[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCSET::type_id::create($psprintf("ALTFUNCSET[%0d]",J),,get_full_name());
         this.ALTFUNCSET[J].configure(this, null, "");
         this.ALTFUNCSET[J].build();
         this.default_map.add_reg(this.ALTFUNCSET[J], `UVM_REG_ADDR_WIDTH'h18+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.ALTFUNCSET_alternate_function_set[J] = this.ALTFUNCSET[J].alternate_function_set;
			this.alternate_function_set[J] = this.ALTFUNCSET[J].alternate_function_set;
			this.ALTFUNCSET_Reserved_31_16[J] = this.ALTFUNCSET[J].Reserved_31_16;
      end
      foreach (this.ALTFUNCCLR[i]) begin
         int J = i;
         this.ALTFUNCCLR[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_ALTFUNCCLR::type_id::create($psprintf("ALTFUNCCLR[%0d]",J),,get_full_name());
         this.ALTFUNCCLR[J].configure(this, null, "");
         this.ALTFUNCCLR[J].build();
         this.default_map.add_reg(this.ALTFUNCCLR[J], `UVM_REG_ADDR_WIDTH'h1C+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.ALTFUNCCLR_alternate_function_clear[J] = this.ALTFUNCCLR[J].alternate_function_clear;
			this.alternate_function_clear[J] = this.ALTFUNCCLR[J].alternate_function_clear;
			this.ALTFUNCCLR_Reserved_31_16[J] = this.ALTFUNCCLR[J].Reserved_31_16;
      end
      foreach (this.INTENSET[i]) begin
         int J = i;
         this.INTENSET[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENSET::type_id::create($psprintf("INTENSET[%0d]",J),,get_full_name());
         this.INTENSET[J].configure(this, null, "");
         this.INTENSET[J].build();
         this.default_map.add_reg(this.INTENSET[J], `UVM_REG_ADDR_WIDTH'h20+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.INTENSET_interrupt_enable[J] = this.INTENSET[J].interrupt_enable;
			this.interrupt_enable[J] = this.INTENSET[J].interrupt_enable;
			this.INTENSET_Reserved_31_16[J] = this.INTENSET[J].Reserved_31_16;
      end
      foreach (this.INTENCLR[i]) begin
         int J = i;
         this.INTENCLR[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTENCLR::type_id::create($psprintf("INTENCLR[%0d]",J),,get_full_name());
         this.INTENCLR[J].configure(this, null, "");
         this.INTENCLR[J].build();
         this.default_map.add_reg(this.INTENCLR[J], `UVM_REG_ADDR_WIDTH'h24+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.INTENCLR_interrupt_enable_clear[J] = this.INTENCLR[J].interrupt_enable_clear;
			this.interrupt_enable_clear[J] = this.INTENCLR[J].interrupt_enable_clear;
			this.INTENCLR_Reserved_31_16[J] = this.INTENCLR[J].Reserved_31_16;
      end
      foreach (this.INTTYPESET[i]) begin
         int J = i;
         this.INTTYPESET[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPESET::type_id::create($psprintf("INTTYPESET[%0d]",J),,get_full_name());
         this.INTTYPESET[J].configure(this, null, "");
         this.INTTYPESET[J].build();
         this.default_map.add_reg(this.INTTYPESET[J], `UVM_REG_ADDR_WIDTH'h28+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.INTTYPESET_set_irq_type[J] = this.INTTYPESET[J].set_irq_type;
			this.set_irq_type[J] = this.INTTYPESET[J].set_irq_type;
			this.INTTYPESET_Reserved_31_16[J] = this.INTTYPESET[J].Reserved_31_16;
      end
      foreach (this.INTTYPECLR[i]) begin
         int J = i;
         this.INTTYPECLR[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTTYPECLR::type_id::create($psprintf("INTTYPECLR[%0d]",J),,get_full_name());
         this.INTTYPECLR[J].configure(this, null, "");
         this.INTTYPECLR[J].build();
         this.default_map.add_reg(this.INTTYPECLR[J], `UVM_REG_ADDR_WIDTH'h2C+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.INTTYPECLR_clear_irq_type[J] = this.INTTYPECLR[J].clear_irq_type;
			this.clear_irq_type[J] = this.INTTYPECLR[J].clear_irq_type;
			this.INTTYPECLR_Reserved_31_16[J] = this.INTTYPECLR[J].Reserved_31_16;
      end
      foreach (this.INTPOLSET[i]) begin
         int J = i;
         this.INTPOLSET[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLSET::type_id::create($psprintf("INTPOLSET[%0d]",J),,get_full_name());
         this.INTPOLSET[J].configure(this, null, "");
         this.INTPOLSET[J].build();
         this.default_map.add_reg(this.INTPOLSET[J], `UVM_REG_ADDR_WIDTH'h30+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.INTPOLSET_set_irq_polarity_level[J] = this.INTPOLSET[J].set_irq_polarity_level;
			this.set_irq_polarity_level[J] = this.INTPOLSET[J].set_irq_polarity_level;
			this.INTPOLSET_Reserved_31_16[J] = this.INTPOLSET[J].Reserved_31_16;
      end
      foreach (this.INTPOLCLR[i]) begin
         int J = i;
         this.INTPOLCLR[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTPOLCLR::type_id::create($psprintf("INTPOLCLR[%0d]",J),,get_full_name());
         this.INTPOLCLR[J].configure(this, null, "");
         this.INTPOLCLR[J].build();
         this.default_map.add_reg(this.INTPOLCLR[J], `UVM_REG_ADDR_WIDTH'h34+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.INTPOLCLR_clear_irq_polarity_level[J] = this.INTPOLCLR[J].clear_irq_polarity_level;
			this.clear_irq_polarity_level[J] = this.INTPOLCLR[J].clear_irq_polarity_level;
			this.INTPOLCLR_Reserved_31_16[J] = this.INTPOLCLR[J].Reserved_31_16;
      end
      foreach (this.INTSTATUS[i]) begin
         int J = i;
         this.INTSTATUS[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_INTSTATUS::type_id::create($psprintf("INTSTATUS[%0d]",J),,get_full_name());
         this.INTSTATUS[J].configure(this, null, "");
         this.INTSTATUS[J].build();
         this.default_map.add_reg(this.INTSTATUS[J], `UVM_REG_ADDR_WIDTH'h38+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.INTSTATUS_read_irq_status[J] = this.INTSTATUS[J].read_irq_status;
			this.read_irq_status[J] = this.INTSTATUS[J].read_irq_status;
			this.INTSTATUS_Reserved_31_16[J] = this.INTSTATUS[J].Reserved_31_16;
      end
      foreach (this.MASKLOWBYTE[i]) begin
         int J = i;
         this.MASKLOWBYTE[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKLOWBYTE::type_id::create($psprintf("MASKLOWBYTE[%0d]",J),,get_full_name());
         this.MASKLOWBYTE[J].configure(this, null, "");
         this.MASKLOWBYTE[J].build();
         this.default_map.add_reg(this.MASKLOWBYTE[J], `UVM_REG_ADDR_WIDTH'h400+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.MASKLOWBYTE_Reserved_31_8[J] = this.MASKLOWBYTE[J].Reserved_31_8;
			this.MASKLOWBYTE_lower_enable_mask[J] = this.MASKLOWBYTE[J].lower_enable_mask;
			this.lower_enable_mask[J] = this.MASKLOWBYTE[J].lower_enable_mask;
      end
      foreach (this.MASKHIGHBYTE[i]) begin
         int J = i;
         this.MASKHIGHBYTE[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_MASKHIGHBYTE::type_id::create($psprintf("MASKHIGHBYTE[%0d]",J),,get_full_name());
         this.MASKHIGHBYTE[J].configure(this, null, "");
         this.MASKHIGHBYTE[J].build();
         this.default_map.add_reg(this.MASKHIGHBYTE[J], `UVM_REG_ADDR_WIDTH'h800+J*`UVM_REG_ADDR_WIDTH'h1, "RW", 0);
			this.MASKHIGHBYTE_higher_enable_mask[J] = this.MASKHIGHBYTE[J].higher_enable_mask;
			this.higher_enable_mask[J] = this.MASKHIGHBYTE[J].higher_enable_mask;
			this.MASKHIGHBYTE_Reserved_7_0[J] = this.MASKHIGHBYTE[J].Reserved_7_0;
			this.Reserved_7_0[J] = this.MASKHIGHBYTE[J].Reserved_7_0;
			this.MASKHIGHBYTE_Reserved_31_16[J] = this.MASKHIGHBYTE[J].Reserved_31_16;
      end
      foreach (this.PID4[i]) begin
         int J = i;
         this.PID4[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID4::type_id::create($psprintf("PID4[%0d]",J),,get_full_name());
         this.PID4[J].configure(this, null, "");
         this.PID4[J].build();
         this.default_map.add_reg(this.PID4[J], `UVM_REG_ADDR_WIDTH'hFD0+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.PID4_block_count[J] = this.PID4[J].block_count;
			this.block_count[J] = this.PID4[J].block_count;
			this.PID4_jep106_c_code[J] = this.PID4[J].jep106_c_code;
			this.jep106_c_code[J] = this.PID4[J].jep106_c_code;
			this.PID4_Reserved_31_8[J] = this.PID4[J].Reserved_31_8;
      end
      foreach (this.PID5[i]) begin
         int J = i;
         this.PID5[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID5::type_id::create($psprintf("PID5[%0d]",J),,get_full_name());
         this.PID5[J].configure(this, null, "");
         this.PID5[J].build();
         this.default_map.add_reg(this.PID5[J], `UVM_REG_ADDR_WIDTH'hFD4+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.PID5_PID5[J] = this.PID5[J].PID5;
			this.PID5_Reserved_31_8[J] = this.PID5[J].Reserved_31_8;
      end
      foreach (this.PID6[i]) begin
         int J = i;
         this.PID6[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID6::type_id::create($psprintf("PID6[%0d]",J),,get_full_name());
         this.PID6[J].configure(this, null, "");
         this.PID6[J].build();
         this.default_map.add_reg(this.PID6[J], `UVM_REG_ADDR_WIDTH'hFD8+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.PID6_PID6[J] = this.PID6[J].PID6;
			this.PID6_Reserved_31_8[J] = this.PID6[J].Reserved_31_8;
      end
      foreach (this.PID7[i]) begin
         int J = i;
         this.PID7[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID7::type_id::create($psprintf("PID7[%0d]",J),,get_full_name());
         this.PID7[J].configure(this, null, "");
         this.PID7[J].build();
         this.default_map.add_reg(this.PID7[J], `UVM_REG_ADDR_WIDTH'hFDC+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.PID7_PID7[J] = this.PID7[J].PID7;
			this.PID7_Reserved_31_8[J] = this.PID7[J].Reserved_31_8;
      end
      foreach (this.PID0[i]) begin
         int J = i;
         this.PID0[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID0::type_id::create($psprintf("PID0[%0d]",J),,get_full_name());
         this.PID0[J].configure(this, null, "");
         this.PID0[J].build();
         this.default_map.add_reg(this.PID0[J], `UVM_REG_ADDR_WIDTH'hFE0+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.PID0_part_num[J] = this.PID0[J].part_num;
			this.PID0_Reserved_31_8[J] = this.PID0[J].Reserved_31_8;
      end
      foreach (this.PID1[i]) begin
         int J = i;
         this.PID1[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID1::type_id::create($psprintf("PID1[%0d]",J),,get_full_name());
         this.PID1[J].configure(this, null, "");
         this.PID1[J].build();
         this.default_map.add_reg(this.PID1[J], `UVM_REG_ADDR_WIDTH'hFE4+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.PID1_jep106_id_3_0[J] = this.PID1[J].jep106_id_3_0;
			this.jep106_id_3_0[J] = this.PID1[J].jep106_id_3_0;
			this.PID1_part_num[J] = this.PID1[J].part_num;
			this.PID1_Reserved_31_8[J] = this.PID1[J].Reserved_31_8;
      end
      foreach (this.PID2[i]) begin
         int J = i;
         this.PID2[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID2::type_id::create($psprintf("PID2[%0d]",J),,get_full_name());
         this.PID2[J].configure(this, null, "");
         this.PID2[J].build();
         this.default_map.add_reg(this.PID2[J], `UVM_REG_ADDR_WIDTH'hFE8+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.PID2_revision_num[J] = this.PID2[J].revision_num;
			this.revision_num[J] = this.PID2[J].revision_num;
			this.PID2_jedec_used[J] = this.PID2[J].jedec_used;
			this.jedec_used[J] = this.PID2[J].jedec_used;
			this.PID2_jep106_id_6_4[J] = this.PID2[J].jep106_id_6_4;
			this.jep106_id_6_4[J] = this.PID2[J].jep106_id_6_4;
			this.PID2_Reserved_31__8[J] = this.PID2[J].Reserved_31__8;
			this.Reserved_31__8[J] = this.PID2[J].Reserved_31__8;
      end
      foreach (this.PID3[i]) begin
         int J = i;
         this.PID3[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_PID3::type_id::create($psprintf("PID3[%0d]",J),,get_full_name());
         this.PID3[J].configure(this, null, "");
         this.PID3[J].build();
         this.default_map.add_reg(this.PID3[J], `UVM_REG_ADDR_WIDTH'hFEC+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.PID3_eco_rev_num[J] = this.PID3[J].eco_rev_num;
			this.eco_rev_num[J] = this.PID3[J].eco_rev_num;
			this.PID3_customer_mod_num[J] = this.PID3[J].customer_mod_num;
			this.customer_mod_num[J] = this.PID3[J].customer_mod_num;
			this.PID3_Reserved_31_8[J] = this.PID3[J].Reserved_31_8;
      end
      foreach (this.CID0[i]) begin
         int J = i;
         this.CID0[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID0::type_id::create($psprintf("CID0[%0d]",J),,get_full_name());
         this.CID0[J].configure(this, null, "");
         this.CID0[J].build();
         this.default_map.add_reg(this.CID0[J], `UVM_REG_ADDR_WIDTH'hFF0+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.CID0_CID0[J] = this.CID0[J].CID0;
			this.CID0_Reserved_31_8[J] = this.CID0[J].Reserved_31_8;
      end
      foreach (this.CID1[i]) begin
         int J = i;
         this.CID1[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID1::type_id::create($psprintf("CID1[%0d]",J),,get_full_name());
         this.CID1[J].configure(this, null, "");
         this.CID1[J].build();
         this.default_map.add_reg(this.CID1[J], `UVM_REG_ADDR_WIDTH'hFF4+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.CID1_CID1[J] = this.CID1[J].CID1;
			this.CID1_Reserved_31_8[J] = this.CID1[J].Reserved_31_8;
      end
      foreach (this.CID2[i]) begin
         int J = i;
         this.CID2[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID2::type_id::create($psprintf("CID2[%0d]",J),,get_full_name());
         this.CID2[J].configure(this, null, "");
         this.CID2[J].build();
         this.default_map.add_reg(this.CID2[J], `UVM_REG_ADDR_WIDTH'hFF8+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.CID2_CID2[J] = this.CID2[J].CID2;
			this.CID2_Reserved_31_8[J] = this.CID2[J].Reserved_31_8;
      end
      foreach (this.CID3[i]) begin
         int J = i;
         this.CID3[J] = ral_reg_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock_CID3::type_id::create($psprintf("CID3[%0d]",J),,get_full_name());
         this.CID3[J].configure(this, null, "");
         this.CID3[J].build();
         this.default_map.add_reg(this.CID3[J], `UVM_REG_ADDR_WIDTH'hFFC+J*`UVM_REG_ADDR_WIDTH'h1, "RO", 0);
			this.CID3_CID3[J] = this.CID3[J].CID3;
			this.CID3_Reserved_31_8[J] = this.CID3[J].Reserved_31_8;
      end
   endfunction : build

	`uvm_object_utils(ral_block_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock)

endclass : ral_block_AHBLiteTarget_SLAVE_MM_cmsdk_ahb_gpio_Register_AddressBlock



`endif
