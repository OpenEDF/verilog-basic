typedef class host_driver;
typedef class host_monitor;


class host_agent extends uvm_agent;
  typedef uvm_sequencer #(host_data) host_sequencer;

  uvm_analysis_port #(host_data) analysis_port;
  virtual host_io vif;
  host_sequencer  sqr;
  host_driver     drv;
  host_monitor    mon;

  `uvm_component_utils(host_agent)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    uvm_config_db#(virtual host_io)::get(this, "", "vif", vif);
    uvm_config_db#(virtual host_io)::set(this, "*", "vif", vif);

    if (is_active == UVM_ACTIVE) begin
      sqr = host_sequencer::type_id::create("sqr", this);
      drv  = host_driver::type_id::create("drv", this);
    end
    mon = host_monitor::type_id::create("mon", this);
    analysis_port = new("analysis_port", this);
  endfunction: build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (is_active == UVM_ACTIVE) begin
      drv.seq_item_port.connect(sqr.seq_item_export);
    end
    mon.analysis_port.connect(this.analysis_port);
  endfunction: connect_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for host agent not set");
    end
  endfunction: end_of_elaboration_phase
endclass: host_agent


class host_driver extends uvm_driver #(host_data);
  `uvm_component_utils(host_driver)

  virtual host_io vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    uvm_config_db#(virtual host_io)::get(this, "", "vif", vif);
  endfunction: build_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for host driver not set");
    end
  endfunction: end_of_elaboration_phase

  virtual task run_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    forever begin
      seq_item_port.get_next_item(req);
      `uvm_info("RUN", { "Before process\n", req.sprint() }, UVM_FULL);
      data_rw(req);
      rsp = host_data::type_id::create("rsp", this);
      rsp.set_id_info(req);
      `uvm_info("RUN", { "After process\n", req.sprint() }, UVM_FULL);
      seq_item_port.item_done();
    end
  endtask: run_phase

  virtual task data_rw(host_data req);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (req.addr inside {['h4000:'h4fff]}) begin // emulating RAM access
      case(req.kind)
        UVM_READ, UVM_BURST_READ: begin
            vif.rd_n    <= '0;
            vif.address <= req.addr;
            @(vif.mst);
            req.data = vif.mst.data;
            vif.rd_n    <= '1;
            vif.address <= 'z;
          end
        UVM_WRITE, UVM_BURST_WRITE: begin
            vif.wr_n    <= '0;
            vif.data    <= req.data;
            vif.address <= req.addr;
            @(vif.mst);
            vif.wr_n    <= '1;
            vif.data    <= 'z;
            vif.address <= 'z;
          end
        default: begin `uvm_fatal("REGERR", $sformatf("%p is not a valid Register Command", req.kind)); end
      endcase
    end else begin // emulating register access
      case(req.kind)
        UVM_READ, UVM_BURST_READ: begin
            vif.rd_n    <= '0;
            vif.address <= req.addr;
            @(vif.mst);
            req.data = vif.mst.data;
            vif.rd_n    <= '1;
            vif.address <= 'z;
          end
        UVM_WRITE, UVM_BURST_WRITE: begin
            vif.wr_n    <= '0;
            vif.data    <= req.data;
            vif.address <= req.addr;
            @(vif.mst);
            vif.wr_n    <= '1;
            vif.data    <= 'z;
            vif.address <= 'z;
          end
        default: begin `uvm_fatal("REGERR", $sformatf("%p is not a valid Register Command", req.kind)); end
      endcase
    end
  endtask: data_rw
endclass: host_driver


class host_monitor extends uvm_monitor;
  uvm_analysis_port #(host_data) analysis_port;
  virtual host_io vif;
  host_data tr;

  `uvm_component_utils(host_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    uvm_config_db#(virtual host_io)::get(this, "", "vif", vif);
    analysis_port = new("analysis_port", this);
  endfunction: build_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for host monitor not set");
    end
  endfunction: end_of_elaboration_phase

  virtual task run_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    forever begin
      tr = host_data::type_id::create("tr", this);
      data_detect(tr);
      `uvm_info("HOST_MON", {"\n", tr.sprint()}, UVM_HIGH);
      analysis_port.write(tr);
    end
  endtask: run_phase

  virtual task data_detect(host_data tr);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    fork
      begin
        fork
          wr_detect();
          rd_detect();
        join_any
        disable fork;
      end
    join
  endtask: data_detect

  virtual task wr_detect();
    @(vif.mon);
    wait(vif.mon.wr_n == 0);
    tr.addr = vif.mon.address;
    tr.data = vif.mon.data;
    tr.kind = UVM_WRITE;
    `uvm_info("GOT_WRITE", {"\n", tr.sprint()}, UVM_FULL);
  endtask: wr_detect

  virtual task rd_detect();
    @(vif.mon);
    wait(vif.mon.rd_n == 0);
    tr.addr = vif.mon.address;
    tr.data = vif.mon.data;
    tr.kind = UVM_READ;
    `uvm_info("GOT_READ", {"\n", tr.sprint()}, UVM_FULL);
  endtask: rd_detect
endclass: host_monitor
