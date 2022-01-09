// rand and randc variable test
class packet;
    randc bit [3:0] data;
    constraint c_data { data < 8'h5; };
endclass

module tb;

initial begin
    packet pkt = new();
    for (int i = 0; i < 50; i++) begin
        pkt.randomize();
        $display("itr = %0d data = 0x%0h", i, pkt.data);
    end    
end

endmodule
