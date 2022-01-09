// rand and randc variable test
class packet;
    rand bit [3:0] data[7];
endclass

module tb;
    packet pkt;
initial begin
    pkt = new();
    pkt.randomize();
    $display("queue = %p", pkt.data);
    end    

endmodule
