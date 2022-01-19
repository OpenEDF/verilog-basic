// mailbox
module testbench;

mailbox mbx = new(2);   // 2 items

    // Block 1
    initial begin
        for (int i = 0; i < 5; i = i + 1) begin
            #1 mbx.put(i);
            $display("[%0t] Thread 0: Put item #%0d, size = %0d", $time, i,  mbx.num());
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

/*
[1] Thread 0: Put item #0, size = 1
[2] Thread 1: Got item #0, size = 0
[2] Thread 0: Put item #1, size = 1
[3] Thread 0: Put item #2, size = 2
[4] Thread 1: Got item #1, size = 1
[4] Thread 0: Put item #3, size = 2
[6] Thread 1: Got item #2, size = 2
[6] Thread 0: Put item #4, size = 2
[8] Thread 1: Got item #3, size = 1
[10] Thread 1: Got item #4, size = 0
           V C S   S i m u l a t i o n   R e p o r t
*/
