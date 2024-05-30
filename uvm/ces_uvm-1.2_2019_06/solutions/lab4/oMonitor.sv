class oMonitor extends uvm_monitor;
  int port_id = -1;
  virtual router_io vif;
  uvm_analysis_port #(packet) analysis_port;

  `uvm_component_utils_begin(oMonitor)
    `uvm_field_int(port_id, UVM_DEFAULT | UVM_DEC)
  `uvm_component_utils_end

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(int)::get(this, "", "port_id", port_id);
    uvm_config_db#(virtual router_io)::get(this, "", "vif", vif);
    analysis_port = new("analysis_port", this);
  endfunction: build_phase

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    if (!(port_id inside {-1, [0:15]})) begin
      `uvm_fatal("CFGERR", $sformatf("port_id must be {-1, [0:15]}, not %0d!", port_id));
    end
    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for oMonitor not set");
    end
  endfunction: end_of_elaboration_phase

  virtual task run_phase(uvm_phase phase);
    packet tr;
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    forever begin
      tr = packet::type_id::create("tr", this);
      tr.da = this.port_id;
      this.get_packet(tr);
      `uvm_info("Got_Output_Packet", {"\n", tr.sprint()}, UVM_MEDIUM);
      analysis_port.write(tr);
    end
  endtask: run_phase

  virtual task get_packet(packet tr);
    logic [7:0] datum;
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    wait (vif.oMonClk.frameo_n[port_id] !==0);
    @(vif.oMonClk iff (vif.oMonClk.frameo_n[port_id] === 0));

    forever begin
      for(int i=0; i<8; i=i) begin
        if (!vif.oMonClk.valido_n[port_id]) begin
          datum[i++] = vif.oMonClk.dout[port_id];
          if (i == 8) begin
            tr.payload.push_back(datum);
          end
          if (vif.oMonClk.frameo_n[port_id]) begin
            if (i == 8) begin
              return;
            end else begin
              `uvm_fatal("Payload_Error", "Not byte aligned");
            end
          end
        end
        @(vif.oMonClk);
      end
    end
  endtask: get_packet

endclass: oMonitor
