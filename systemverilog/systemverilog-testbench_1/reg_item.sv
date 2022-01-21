class reg_item;
    rand bit [7:0] addr;
    rand bit [15:0] wdata;
         bit [15:0] rdata;
    rand bit        wr;

    function void print(string tag="");
        $display("T=%0t [%s] addr = 0x%0h wr = 0x%d wdata = 0x%0h rdata = 0x%0h",
                 $time, tag, addr, wr, wdata, rdata);
    endfunction

endclass
