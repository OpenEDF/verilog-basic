// mailbox
module testbench;

mailbox mbx = new(2);   // 2 items

    // Block 1
    initial begin
        for (int i = 0; i < 5; i = i + 1) begin
            #1 mbx.put(i);
            #display("[%0t] Thread 0: Put item #%0d, size = %0d, size = %0d", $time, i, mbx.num());
        end
    end

    // Block 2
    initial begin
        forever begin
            int idx;
            #2 mbx.get(idx);
            $display("[%0t] Thread 1: Got item #%0d, size = %0d", $time, idx, mbx.num());
        end
     end

endmodule
