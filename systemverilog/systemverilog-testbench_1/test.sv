class test;
    env e0;
    mailbox drv_mbx;

    function new();
        drv_mbx = new();
        e0 = new();
        $display("T=%0t [Test] Test new...", $time);
    endfunction

    virtual task run();
        e0.d0.drv_mbx = drv_mbx;

        fork
            e0.run();
        join_none

        apply_stim();
    endtask

    virtual task apply_stim();
        reg_item item;
        $display("T=%0t [Test] Starting stimulus ...", $time);
        item = new;
        item.randomize() with { addr == 8'haa; wr == 1; };
        drv_mbx.put(item);

        item = new;
        item.randomize() with { addr == 8'haa; wr == 0; };
        drv_mbx.put(item);
    endtask

endclass
