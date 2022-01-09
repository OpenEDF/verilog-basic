// rand and randc variable test
class packet;
    randc bit [31:0] data;
    extern constraint c_data;
endclass

constraint packet::c_data { data[1:0] == 2'b0; data < 32'h40004FFF; data > 32'h40004000; };

module tb;

initial begin
    packet pkt = new();
    for (int i = 0; i < 50; i++) begin
        pkt.randomize();
        $display("itr = %0d data = 0x%8h", i, pkt.data);
    end    
end

endmodule
