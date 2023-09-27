/* UVM test */
class new_world extends uvm_test;
    string tid = get_type_name();
    `uvm_component_utils(new_world);

    /* new function */
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    /* run phase task */
    virtual task run_phase(uvm_phase phase);
        `uvm_info(tid, "run phase is executed !!!", UVM_LOW);
    endtask
endclass: new_world
