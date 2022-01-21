class env;
    driver          d0;
    monitor         m0;
    scoreboard      s0;
    mailbox         scb_mbx;
    virtual reg_if  vif;

    // instantiate all testbench components
    function new();
        d0      = new;
        m0      = new;
        s0      = new;
        scb_mbx = new();
        $display("T=%0t [Env] Env new...", $time);
    endfunction

    virtual task run();
        d0.vif = vif;
        m0.vif = vif;
        m0.scb_mbx = scb_mbx;
        s0.scb_mbx = scb_mbx;

        fork
            s0.run();
            d0.run();
            m0.run();
        join_any   
    endtask

endclass
