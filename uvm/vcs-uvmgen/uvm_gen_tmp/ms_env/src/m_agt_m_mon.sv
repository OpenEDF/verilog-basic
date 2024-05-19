//
// Template for UVM-compliant physical-level monitor
//

`ifndef M_MON__SV
`define M_MON__SV


typedef class m_item;
typedef class m_mon;

class m_mon_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use a task if callbacks can be blocking


   // Called at start of observed transaction
   virtual function void pre_trans(m_mon xactor,
                                   m_item tr);
   endfunction: pre_trans


   // Called before acknowledging a transaction
   virtual function pre_ack(m_mon xactor,
                            m_item tr);
   endfunction: pre_ack
   

   // Called at end of observed transaction
   virtual function void post_trans(m_mon xactor,
                                    m_item tr);
   endfunction: post_trans

   
   // Callback method post_cb_trans can be used for coverage
   virtual task post_cb_trans(m_mon xactor,
                              m_item tr);
   endtask: post_cb_trans

endclass: m_mon_callbacks

   

class m_mon extends uvm_monitor;

   uvm_analysis_port #(m_item) mon_analysis_port;  //TLM analysis port
   typedef virtual m_intf v_if;
   v_if mon_if;
   // ToDo: Add another class property if required
   extern function new(string name = "m_mon",uvm_component parent);
   `uvm_register_cb(m_mon,m_mon_callbacks);
   `uvm_component_utils_begin(m_mon)
      // ToDo: Add uvm monitor member if any class property added later through field macros

   `uvm_component_utils_end
      // ToDo: Add required short hand override method


   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task tx_monitor();

endclass: m_mon


function m_mon::new(string name = "m_mon",uvm_component parent);
   super.new(name, parent);
   mon_analysis_port = new ("mon_analysis_port",this);
endfunction: new

function void m_mon::build_phase(uvm_phase phase);
   super.build_phase(phase);
   //ToDo : Implement this phase here

endfunction: build_phase

function void m_mon::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   uvm_config_db#(v_if)::get(this, "", "mon_if", mon_if);
endfunction: connect_phase

function void m_mon::end_of_elaboration_phase(uvm_phase phase);
   super.end_of_elaboration_phase(phase); 
   //ToDo: Implement this phase here

endfunction: end_of_elaboration_phase


function void m_mon::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   //ToDo: Implement this phase here

endfunction: start_of_simulation_phase


task m_mon::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   // ToDo: Implement reset here

endtask: reset_phase


task m_mon::configure_phase(uvm_phase phase);
   super.configure_phase(phase);
   //ToDo: Configure your component here
endtask:configure_phase


task m_mon::run_phase(uvm_phase phase);
   super.run_phase(phase);
  // phase.raise_objection(this,""); //Raise/drop objections in sequence file
   fork
      tx_monitor();
   join
  // phase.drop_objection(this);

endtask: run_phase


task m_mon::tx_monitor();
   forever begin
      m_item tr;
      // ToDo: Wait for start of transaction

      `uvm_do_callbacks(m_mon,m_mon_callbacks,
                    pre_trans(this, tr))
      `uvm_info("ms_env_MONITOR", "Starting transaction...",UVM_LOW)
      // ToDo: Observe first half of transaction

      // ToDo: User need to add monitoring logic and remove $finish
      `uvm_info("ms_env_MONITOR"," User need to add monitoring logic ",UVM_LOW)
	  $finish;
      `uvm_do_callbacks(m_mon,m_mon_callbacks,
                    pre_ack(this, tr))
      // ToDo: React to observed transaction with ACK/NAK
      `uvm_info("ms_env_MONITOR", "Completed transaction...",UVM_HIGH)
      `uvm_info("ms_env_MONITOR", tr.sprint(),UVM_HIGH)
      `uvm_do_callbacks(m_mon,m_mon_callbacks,
                    post_trans(this, tr))
      mon_analysis_port.write(tr);
   end
endtask: tx_monitor

`endif // M_MON__SV
