// rand and randc variable test
class packet;
    rand bit [7:0] data;
    constraint c_data { data < 8'h64; };
endclass

module tb;

initial begin
    packet pkt = new();
    for (int i = 0; i < 255; i++) begin
        pkt.randomize();
        $display("itr = %0d data = 0x%0h", i, pkt.data);
    end    
end

endmodule
