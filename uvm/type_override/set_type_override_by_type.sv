// set_type_override_by_type
 `include "uvm_macros.svh"
 import uvm_pkg::*;
//--------------------uvm_component------------------------------
class A extends uvm_agent;
  `uvm_component_utils(A)
 
  function new (string name="A", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_full_name, $sformatf("A new"), UVM_LOW);
  endfunction : new
 
  virtual function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from Original class 'A'"), UVM_LOW);
  endfunction : hello
endclass : A

class A_ovr extends A;
  `uvm_component_utils(A_ovr)
 
  function new (string name="A_ovr", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_full_name, $sformatf("A_ovr new"), UVM_LOW);
  endfunction : new
 
  function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from override class 'A_ovr'"), UVM_LOW);
  endfunction : hello
endclass : A_ovr 

//--------------------uvm_object------------------------------
class B extends uvm_object;
  `uvm_object_utils(B)
 
  function new (string name="B");
    super.new(name);
    `uvm_info(get_full_name, $sformatf("B new"), UVM_LOW);
  endfunction : new
 
  virtual function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from Original class 'B'"), UVM_LOW);
  endfunction : hello 
endclass : B

class B_ovr extends B;
  `uvm_object_utils(B_ovr)
 
  function new (string name="B_ovr");
    super.new(name);
    `uvm_info(get_full_name, $sformatf("B_ovr new"), UVM_LOW);
  endfunction : new
 
  function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from override class 'B_ovr'"), UVM_LOW);
  endfunction : hello
endclass : B_ovr

class B_override extends B_ovr;
  `uvm_object_utils(B_override)
 
  function new (string name="B_override");
    super.new(name);
    `uvm_info(get_full_name, $sformatf("B_override new"), UVM_LOW);
  endfunction : new
 
  function void hello();
    `uvm_info(get_full_name, $sformatf("HELLO from override class 'B_override'"), UVM_LOW);
  endfunction : hello
endclass : B_override

//--------------------env class--------------------
class environment extends uvm_env;
  `uvm_component_utils(environment)
  A a1;
  B b1, b2;

  function new(string name="environment", uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // arguments of create method:
    // 1. string name = ""
    // 2. uvm_component parent = null
    // 3. string contxt = ""
    // The contxt argument, if supplied, supercedes the parent's context.
    a1 = A::type_id::create("a1", this);
    b1 = B::type_id::create("b1", , "path1");
    b2 = B::type_id::create("b2", , "path2");
 
    a1.hello(); // This will print from overridden class A_ovr 
    b1.hello(); // This will print from overridden class B_override
    b2.hello(); // This will print from overridden class B_override
  endfunction : build_phase
endclass : environment

//-------------------test class--------------------------
class test extends uvm_test;
  `uvm_component_utils(test)
  environment env;
 
  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env", this);
    `uvm_info(get_full_name, $sformatf("TEST set_inst_override_by_name"), UVM_LOW);

    set_type_override_by_type(A::get_type(), A_ovr::get_type()); // Working
    set_type_override_by_type(B::get_type(), B_override::get_type()); // Working
    
    uvm_factory::get().print(); // This will print info about overridden classes.
  endfunction : build_phase
endclass : test

module top_tb();
  initial begin
    run_test("test");
  end
endmodule: top_tb
