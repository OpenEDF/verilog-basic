// rand and randc variable test
class packet;
    rand bit [3:0] data[$];
    constraint c_data { data.size() == 16; }
endclass

module tb;
    packet pkt;

initial begin
    pkt = new();
    pkt.randomize();

    // Tip : Use %p to display arrays 
    $display("queues = %p", pkt.data);
    end    

endmodule
