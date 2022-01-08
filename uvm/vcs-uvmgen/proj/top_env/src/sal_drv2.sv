//
// Template for UVM-compliant physical-level transactor
//

`ifndef DRV2__SV
`define DRV2__SV

typedef class tra1;
typedef class drv2;

class drv2_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use "task" if callbacks cannot be blocking

   // Called before a transaction is executed
   virtual task pre_tx( drv2 xactor,
                        tra1 tr);
                                   
     // ToDo: Add relevant code

   endtask: pre_tx


   // Called after a transaction has been executed
   virtual task post_tx( drv2 xactor,
                         tra1 tr);
     // ToDo: Add relevant code

   endtask: post_tx

endclass: drv2_callbacks


class drv2 extends uvm_driver # (tra1);

   
   typedef virtual inte2 v_if; 
   v_if drv_if;
   `uvm_register_cb(drv2,drv2_callbacks); 
   
   extern function new(string name = "drv2",
                       uvm_component parent = null); 
 
      `uvm_component_utils_begin(drv2)
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
   extern protected virtual task send(tra1 tr); 
   extern protected virtual task tx_driver();

endclass: drv2


function drv2::new(string name = "drv2",
                   uvm_component parent = null);
   super.new(name, parent);

   
endfunction: new


function void drv2::build_phase(uvm_phase phase);
   super.build_phase(phase);
   //ToDo : Implement this phase here

endfunction: build_phase

function void drv2::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   uvm_config_db#(v_if)::get(this, "", "slv_if", drv_if);
endfunction: connect_phase

function void drv2::end_of_elaboration_phase(uvm_phase phase);
   super.end_of_elaboration_phase(phase);
   if (drv_if == null)
       `uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
endfunction: end_of_elaboration_phase

function void drv2::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   //ToDo: Implement this phase here
endfunction: start_of_simulation_phase

 
task drv2::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   // ToDo: Reset output signals
endtask: reset_phase

task drv2::configure_phase(uvm_phase phase);
   super.configure_phase(phase);
   //ToDo: Configure your component here
endtask:configure_phase


task drv2::run_phase(uvm_phase phase);
   super.run_phase(phase);
   // phase.raise_objection(this,""); //Raise/drop objections in sequence file
   fork 
      tx_driver();
   join
   // phase.drop_objection(this);
endtask: run_phase


task drv2::tx_driver();
 forever begin
      tra1 tr;
      // ToDo: Set output signals to their idle state
      this.drv_if.master.async_en      <= 0;
      `uvm_info("top_env_DRIVER", "Starting transaction...",UVM_LOW)
      seq_item_port.get_next_item(tr);
      case (tr.kind) 
         tra1::READ: begin
            // ToDo: Implement READ transaction

         end
         tra1::WRITE: begin
            // ToDo: Implement READ transaction

         end
      endcase
	  `uvm_do_callbacks(drv2,drv2_callbacks,
                    pre_tx(this, tr))
      send(tr); 
      seq_item_port.item_done();
      `uvm_info("top_env_DRIVER", "Completed transaction...",UVM_LOW)
      `uvm_info("top_env_DRIVER", tr.sprint(),UVM_HIGH)
      `uvm_do_callbacks(drv2,drv2_callbacks,
                    post_tx(this, tr))

   end
endtask : tx_driver

task drv2::send(tra1 tr);
   // ToDo: Drive signal on interface
  
endtask: send


`endif // DRV2__SV


