//
// Template for UVM-compliant generic slave agent component
//

`ifndef S_AGT__SV
`define S_AGT__SV


class s_agt extends uvm_agent;
   // ToDo: add sub environment properties here
   protected uvm_active_passive_enum is_active = UVM_ACTIVE;
   s_drv slv_drv;
   s_mon slv_mon;
   s_quer slv_seqr;
   typedef virtual s_intf vif;
   vif slv_agt_if;

   `uvm_component_utils_begin(s_agt)
    //ToDo: add field utils macros here if required
   `uvm_component_utils_end

      // ToDo: Add required short hand override method

   function new(string name = "slv_agt", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      slv_mon = s_mon::type_id::create("mon", this);
      if (is_active == UVM_ACTIVE) begin
         slv_drv = s_drv::type_id::create("drv", this);
         slv_seqr = s_quer::type_id::create("slv_seqr",this);
      end
      if (!uvm_config_db#(vif)::get(this, "", "slv_if", slv_agt_if)) begin
         `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this agent instance")
      end
      uvm_config_db# (vif)::set(this,"slv_drv","slv_if",slv_drv.drv_if);
      uvm_config_db# (vif)::set(this,"mast_mon","slv_if",slv_mon.mon_if);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (is_active == UVM_ACTIVE) begin
		  
	   	  slv_drv.seq_item_port.connect(slv_seqr.seq_item_export);
      end
   endfunction

   virtual function void start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);

      //ToDo :: Implement here

   endfunction

   virtual task run_phase(uvm_phase phase);
      super.run_phase(phase);
     // phase.raise_objection(this,"slv_agt_main"); //Raise/drop objections in sequence file

      //ToDo :: Implement here

      // phase.drop_objection(this);
   endtask

   virtual function void report_phase(uvm_phase phase);
      super.report_phase(phase);

      //ToDo :: Implement here

   endfunction

endclass: s_agt

`endif // S_AGT__SV
