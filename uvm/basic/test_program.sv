/* UVM test */
program automatic test_program;
    import uvm_pkg::*;
    class new_world_test extends uvm_test;
        `uvm_component_utils(new_world_test);
        function new (string name, uvm_component parent);
            super.new(name, parent);
        endfunction

        virtual task run_phase(uvm_phase phase);
            `uvm_info("DEMO", "New World!", UVM_LOW);
        endtask

    endclass: new_world_test

    initial begin
        run_test("new_world_test");
    end
endprogram
