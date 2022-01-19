class driver;
    virtual reg_if vif;
    event drv_done;
    mailbox drv_mbx;

    task run();
        $display ("T=%0t [Driver] starting ...", $time);
        @(posedge vif.clk);
        
        forever begin
            reg_item item;
            $display("T=%0t [Driver] waiting for item ...", $time);
            drv_mbx.get(item);
            item.print("Driver");
            vif.sel  <= 1;
            vif.addr <= item.addr;
            vif.wr   <= item.wdata;
            @(posedge vif.clk);
            while (!vif.ready) begin
                $display("T=%0t [Driver] wait until ready is high", $time);
                @(posedge vif.clk);
            end 
        end
        vif.sel <= 0; ->drv_done;
    end
    endtask
endclass
