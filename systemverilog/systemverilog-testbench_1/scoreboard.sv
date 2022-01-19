class scoreboard;
    mailbox scb_mbx;
    reg_item refq[156];

    task run();
        forever begin
            reg_item item;
            scb_mbx.get(item);
            item.print("Scoreboard");

            if (item.wr) begin
                if (refq[item.addr] == null)
                    refq[item.addr] = new;
                    refq[item.addr] = item;
                    $display("T=%0t [Scoreboard] Store addr=0x%0h wr=0x%0h data=0x%0h",
                            $time, item.addr, item.wr, item.wdata);
            end
            if (item.wr) begin
                if (refq[item.addr] == null)
                    if (item.rdata != 'h1234)
                        $display("T=%0t [Scoreboard] ERROR! First time read, addr=0x%0h exp=1234 act=0x%0h",
                                $tiem, item.addr, item.rdata);
                    else
                        $display("T=%0t [Scoreboard] PASS! First time read, addr=0x%0h exp=1234 act=0x%0h",
                                $tiem, item.addr, item.rdata);
                else
                    if (item.rdata != refq[item.addr].wdata)
                        $display("T=%0t [Scoreboard] ERROR! addr=0x%0h exp=0x%0h act=0x%0h",
                                $time, item.addr, refq[item.addr].wdata, item.rdata);
                    else
                        $display("T=%0t [Scoreboard] ERROR! addr=0x%0h exp=0x%0h act=0x%0h",
                                $time, item.addr, refq[item.addr].wdata, item.rdata);
            end
        end
    endtask;
endclass
