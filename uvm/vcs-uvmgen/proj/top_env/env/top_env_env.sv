//
// Template for UVM-compliant verification environment
//

`ifndef TOP_ENV_ENV__SV
`define TOP_ENV_ENV__SV
`include "top_env.sv"
//ToDo: Include required files here
//Including all the required component files here
class top_env_env extends uvm_env;
   scb sb;
   mas master_agent;
   sal slave_agent;
   top_env_cov cov;
   
   mon1_2cov_connect mon2cov;


    `uvm_component_utils(top_env_env)

   extern function new(string name="top_env_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern function void start_of_simulation_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);
   extern virtual task shutdown_phase(uvm_phase phase);

endclass: top_env_env

function top_env_env::new(string name= "top_env_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void top_env_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   master_agent = mas::type_id::create("master_agent",this); 
   slave_agent = sal::type_id::create("slave_agent",this);
 
   //ToDo: Register other components,callbacks and TLM ports if added by user  

   cov = top_env_cov::type_id::create("cov",this); //Instantiating the coverage class

   mon2cov  = mon1_2cov_connect::type_id::create("mon2cov", this);
   mon2cov.cov = cov;
   sb = scb::type_id::create("sb",this);
   // ToDo: To enable backdoor access specify the HDL path
   // ToDo: Register any required callbacks
endfunction: build_phase

function void top_env_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   //Connecting the monitor's analysis ports with scb's expected analysis exports.
   master_agent.mast_mon.mon_analysis_port.connect(sb.before_export);
   slave_agent.slv_mon.mon_analysis_port.connect(sb.after_export);
   //Other monitor element will be connected to the after export of the scoreboard
   master_agent.mast_mon.mon_analysis_port.connect(cov.cov_export);
endfunction: connect_phase

function void top_env_env::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   `ifdef UVM_VERSION_1_0
   uvm_top.print_topology();  
   factory.print();          
   `endif
   
   `ifdef UVM_VERSION_1_1
	uvm_root::get().print_topology(); 
    uvm_factory::get().print();      
   `endif

   `ifdef UVM_POST_VERSION_1_1
	uvm_root::get().print_topology(); 
    uvm_factory::get().print();      
   `endif

   //ToDo : Implement this phase here 
endfunction: start_of_simulation_phase


task top_env_env::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   //ToDo: Reset DUT
endtask:reset_phase

task top_env_env::configure_phase (uvm_phase phase);
   super.configure_phase(phase);
   //ToDo: Configure components here
endtask:configure_phase

task top_env_env::run_phase(uvm_phase phase);
   super.run_phase(phase);
   //ToDo: Run your simulation here
endtask:run_phase

function void top_env_env::report_phase(uvm_phase phase);
   super.report_phase(phase);
   //ToDo: Implement this phase here
endfunction:report_phase

task top_env_env::shutdown_phase(uvm_phase phase);
   super.shutdown_phase(phase);
   //ToDo: Implement this phase here
endtask:shutdown_phase
`endif // TOP_ENV_ENV__SV

