class router_env extends uvm_env;

  // Environment class should instantiate all required agents.
  input_agent i_agt;

  `uvm_component_utils(router_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    // All components should be constructed using the factory create() method
    i_agt = input_agent::type_id::create("i_agt", this);

  endfunction: build_phase

endclass: router_env
