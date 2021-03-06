// Event meger
module testbench;
    event event_a, event_b;

    initial begin
        fork 
            begin
                wait(event_a.triggered);
                $display("[%0t] Thread 1: Wait for event_a is over", $time);
            end
            
            begin
                wait(event_b.triggered);
                $display("[%0t] Thread 2: Wait for event_b is over", $time);
            end
            
            #20 ->event_a;
            #30 ->event_b;

            begin
               #10 event_b = event_a;
            end
         join
    end
endmodule

/*
[20] Thread 1: Wait for event_a is over
           V C S   S i m u l a t i o n   R e p o r t

*/
