class iMonitor extends uvm_monitor;
  // Just like in the driver, the monitors will need a port designater variable
  // and access to DUT virtual interface.  They are exactly the same as driver.
  // There are no additional learning points in creating and configuring these
  // fields, so they are done for you.
  virtual router_io vif;
  int               port_id = -1;
  uvm_analysis_port #(packet) analysis_port;

  `uvm_component_utils_begin(iMonitor)
    `uvm_field_int(port_id, UVM_ALL_ON | UVM_DEC)
  `uvm_component_utils_end

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

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
      `uvm_fatal("CFGERR", "Interface for iMonitor not set");
    end
  endfunction: end_of_elaboration_phase

  virtual task run_phase(uvm_phase phase);
    packet tr;
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    forever begin
      tr = packet::type_id::create("tr", this);
      tr.sa = this.port_id;
      get_packet(tr);
      `uvm_info("Got_Input_Packet", {"\n", tr.sprint()}, UVM_MEDIUM);
      analysis_port.write(tr);
    end
  endtask: run_phase

  //
  // In the interest of lab time, the device driver code is done for you.
  //

  virtual task get_packet(packet tr);
    logic [7:0] datum;
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    wait (vif.iMonClk.frame_n[port_id] !==0);
    @(vif.iMonClk iff (vif.iMonClk.frame_n[port_id] === 0));

    for (int i=0; i<4; i++) begin
      if (!vif.iMonClk.frame_n[port_id]) begin
        tr.da[i] = vif.iMonClk.din[port_id];
      end else begin
        `uvm_fatal("Header_Error", $sformatf("@ Header cycle %0d, Frame not zero", i));
      end
      @(vif.iMonClk);
    end

    for (int i=0; i<5; i++) begin
      if (!vif.iMonClk.frame_n[port_id]) begin
        if (vif.iMonClk.valid_n[port_id] && vif.iMonClk.din[port_id]) begin
          @(vif.iMonClk);
          continue;
        end else begin
          `uvm_fatal("Header_Error", $sformatf("@%0d Valid or Din zero", i));
        end
      end else begin
        `uvm_fatal("Header_Error", "Frame not zero");
      end
    end

    forever begin
      for(int i=0; i<8; i=i) begin
        if (!vif.iMonClk.valid_n[port_id]) begin
          if (vif.iMonClk.busy_n[port_id]) begin
            datum[i++] = vif.iMonClk.din[port_id];
            if (i == 8) begin
              tr.payload.push_back(datum);
            end
          end else begin
            `uvm_fatal("Payload_Error", "Busy & Valid conflict");
          end
        end
        if (vif.iMonClk.frame_n[port_id]) begin
          if (i == 8) begin
            return;
          end else begin
            `uvm_fatal("Payload_Error", "Not byte aligned");
          end
        end
        @(vif.iMonClk);
      end
    end
  endtask: get_packet

endclass: iMonitor
