//
// Template for UVM-compliant physical-level transactor
//

`ifndef M_DRV__SV
`define M_DRV__SV

typedef class m_item;
typedef class m_drv;

class m_drv_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use "task" if callbacks cannot be blocking

   // Called before a transaction is executed
   virtual task pre_tx( m_drv xactor,
                        m_item tr);
                                   
     // ToDo: Add relevant code

   endtask: pre_tx


   // Called after a transaction has been executed
   virtual task post_tx( m_drv xactor,
                         m_item tr);
     // ToDo: Add relevant code

   endtask: post_tx

endclass: m_drv_callbacks


class m_drv extends uvm_driver # (m_item);

   
   typedef virtual m_intf v_if; 
   v_if drv_if;
   `uvm_register_cb(m_drv,m_drv_callbacks); 
   
   extern function new(string name = "m_drv",
                       uvm_component parent = null); 
 
      `uvm_component_utils_begin(m_drv)
      // ToDo: Add uvm driver member
      `uvm_component_utils_end
   // ToDo: Add required short hand override method


   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task send(m_item tr); 
   extern protected virtual task tx_driver();

endclass: m_drv


function m_drv::new(string name = "m_drv",
                   uvm_component parent = null);
   super.new(name, parent);

   
endfunction: new


function void m_drv::build_phase(uvm_phase phase);
   super.build_phase(phase);
   //ToDo : Implement this phase here

endfunction: build_phase

function void m_drv::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   uvm_config_db#(v_if)::get(this, "", "mst_if", drv_if);
endfunction: connect_phase

function void m_drv::end_of_elaboration_phase(uvm_phase phase);
   super.end_of_elaboration_phase(phase);
   if (drv_if == null)
       `uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
endfunction: end_of_elaboration_phase

function void m_drv::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   //ToDo: Implement this phase here
endfunction: start_of_simulation_phase

 
task m_drv::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   // ToDo: Reset output signals
endtask: reset_phase

task m_drv::configure_phase(uvm_phase phase);
   super.configure_phase(phase);
   //ToDo: Configure your component here
endtask:configure_phase


task m_drv::run_phase(uvm_phase phase);
   super.run_phase(phase);
   // phase.raise_objection(this,""); //Raise/drop objections in sequence file
   fork 
      tx_driver();
   join
   // phase.drop_objection(this);
endtask: run_phase


task m_drv::tx_driver();
 forever begin
      m_item tr;
      // ToDo: Set output signals to their idle state
      this.drv_if.master.async_en      <= 0;
      `uvm_info("ms_env_DRIVER", "Starting transaction...",UVM_LOW)
      seq_item_port.get_next_item(tr);
      case (tr.kind) 
         m_item::READ: begin
            // ToDo: Implement READ transaction

         end
         m_item::WRITE: begin
            // ToDo: Implement READ transaction

         end
      endcase
	  `uvm_do_callbacks(m_drv,m_drv_callbacks,
                    pre_tx(this, tr))
      send(tr); 
      seq_item_port.item_done();
      `uvm_info("ms_env_DRIVER", "Completed transaction...",UVM_LOW)
      `uvm_info("ms_env_DRIVER", tr.sprint(),UVM_HIGH)
      `uvm_do_callbacks(m_drv,m_drv_callbacks,
                    post_tx(this, tr))

   end
endtask : tx_driver

task m_drv::send(m_item tr);
   // ToDo: Drive signal on interface
  
endtask: send


`endif // M_DRV__SV


