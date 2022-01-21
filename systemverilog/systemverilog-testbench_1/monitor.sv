class monitor;
    virtual reg_if vif;
    mailbox scb_mbx;

    function new();
        $display("T=%0t [Monitor] Monitor new...", $time);
    endfunction

    task run(); 
        $display ("T=%0t [Monitor] starting ...", $time);

        forever begin
            @(posedge vif.clk);
            if (vif.sel) begin
                reg_item item = new;
                item.addr = vif.addr;
                item.wr   = vif.wr;
                item.wdata = vif.wdata;

                if (!vif.wr) begin
                    @(posedge vif.clk);
                    item.rdata = vif.rdata;
                end
                item.print("Monitor");
                scb_mbx.put(item);
            end
        end
    endtask
endclass
