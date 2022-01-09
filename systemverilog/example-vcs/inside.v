// rand and randc variable test
class packet;
    rand bit [3:0] data;
    // constraint c_data {data > 32; data < 256; } same as {data inside { [ 32:256 ]}}
    // constraint c_data { data inside { [ 4:10] }; }
    // constraint c_data { data inside {5, 6, 7, 8 }; }
    // constraint c_data { !(data inside {5, 6, 7, 8 }); }
    // constraint c_data { data dist { 0:=20, [6:10]:=50, 15:=40, 12:=10 }; }
    // constraint c_data { data dist { 0:/20, [6:10]:/50, 15:/40, 12:/10 }; }
    constraint c_data { data > 3; data < 12; }
    constraint b_data { data >= 10;}
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
