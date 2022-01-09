// rand and randc variable test
class packet;
    rand bit [3:0] data[];
    constraint c_data { data.size() > 5; data.size() < 20; }
    constraint c_val { foreach (data[i]) data[i] == i; }

    function void display();
        foreach (data[i])
            $display("data[%0d] = 0x%0h", i, data[i]);
    endfunction
endclass

module tb;
    packet pkt;
initial begin
    pkt = new();
    pkt.randomize();
    pkt.display();
    end    

endmodule
