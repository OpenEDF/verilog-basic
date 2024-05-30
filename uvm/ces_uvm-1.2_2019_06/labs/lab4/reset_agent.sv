typedef class reset_driver;
typedef class reset_monitor;

class reset_agent extends uvm_agent;
  typedef uvm_sequencer#(reset_tr) reset_sequencer;

  virtual reset_io vif;          // DUT virtual interface
  reset_sequencer  sqr;
  reset_driver     drv;
  reset_monitor    mon;
  
  `uvm_component_utils(reset_agent)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    `uvm_info("RSTCFG", $sformatf("Reset agent %s setting for is_active is: %p", this.get_name(), is_active), UVM_MEDIUM);

    uvm_config_db#(virtual reset_io)::get(this, "", "vif", vif);
    uvm_config_db#(virtual reset_io)::set(this, "*", "vif", vif);

    if (is_active == UVM_ACTIVE) begin
      sqr = reset_sequencer::type_id::create("sqr", this);
      drv = reset_driver::type_id::create("drv", this);
    end
    mon = reset_monitor::type_id::create("mon", this);
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (is_active == UVM_ACTIVE) begin
      drv.seq_item_port.connect(sqr.seq_item_export);
    end
  endfunction: connect_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for reset agent not set");
    end
  endfunction: end_of_elaboration_phase

endclass

/*
class reset_tr extends uvm_sequence_item;
  typedef enum {ASSERT, DEASSERT} kind_e;
  rand kind_e kind;
  rand int unsigned cycles = 1;
endclass
*/

class reset_driver extends uvm_driver #(reset_tr);
  virtual reset_io vif;          // DUT virtual interface
  `uvm_component_utils(reset_driver)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    uvm_config_db#(virtual reset_io)::get(this, "", "vif", vif);
  endfunction: build_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for reset driver not set");
    end
  endfunction: end_of_elaboration_phase

  virtual task run_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    forever begin
      seq_item_port.get_next_item(req);
      drive(req);
      seq_item_port.item_done();
    end
  endtask: run_phase

  virtual task drive(reset_tr tr);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (tr.kind == reset_tr::ASSERT) begin
      vif.reset_n = 1'b0;
      repeat(tr.cycles) @(vif.mst);
    end else begin
      vif.reset_n <= '1;
      repeat(tr.cycles) @(vif.mst);
    end
  endtask: drive
endclass

class reset_monitor extends uvm_monitor;
  virtual reset_io vif;          // DUT virtual interface
  uvm_analysis_port #(reset_tr) analysis_port;
  uvm_event reset_event = uvm_event_pool::get_global("reset");
  `uvm_component_utils(reset_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    uvm_config_db#(virtual reset_io)::get(this, "", "vif", vif);
    analysis_port = new("analysis_port", this);
  endfunction: build_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for reset monitor not set");
    end
  endfunction: end_of_elaboration_phase

  virtual task run_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    forever begin
      reset_tr tr = reset_tr::type_id::create("tr", this);
      detect(tr);
      analysis_port.write(tr);
    end
  endtask: run_phase

  virtual task detect(reset_tr tr);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    @(vif.reset_n);
    assert(!$isunknown(vif.reset_n));
    if (vif.reset_n == 1'b0) begin
      tr.kind = reset_tr::ASSERT;
      reset_event.trigger();
    end else begin
      tr.kind = reset_tr::DEASSERT;
      reset_event.reset(.wakeup(1));
    end
  endtask: detect
endclass
