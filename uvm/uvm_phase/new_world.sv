/* UVM test */
class new_world extends uvm_test;
    string tid = get_type_name();
    `uvm_component_utils(new_world);

    /* new function */
    function new (string name = "new_world", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    /* run phase task */
    virtual task run_phase(uvm_phase phase);
        `uvm_info(tid, "run phase is executed !!!", UVM_LOW);
    endtask

    /* build phase function */
    virtual function void build_phase(uvm_phase phase);
        `uvm_info(tid, "build phase is executed !!!", UVM_LOW);
    endfunction
endclass: new_world
