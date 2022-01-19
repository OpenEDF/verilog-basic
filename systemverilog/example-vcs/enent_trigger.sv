module testbench;
    event event_a;

    // Thread 1
    initial begin
        #20 -> event_a;
        $display("[%0t] Thread 1: trigger event_a", $time);
    end

    // Thread 2
    initial begin
        $display("[%0t] Thread 2: waiting for trigger", $time);
        @(event_a);
        $display("[%0t] Thread 2: received event_a trigger", $time);
    end

    // Thread 3
    initial begin
        $display("[%0t] Thread 3: waiting for trigger", $time);
        wait(event_a.triggered);
        $display("[%0t] Thread 3: received event_a trigger", $time);
    end
endmodule
