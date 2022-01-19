// Semphore 
module testbench;
    semaphore key;

    initial begin
        key = new(1);
        fork
            personA();
            personB();
            #25 personA();
        join_none
    end

    task getRoom(bit [1:0] id);
        $display("[%0t] Trying to get a room for id[%0d]...", $time, id);
        key.get(1);
        $display("[%0t] Room key retrieved for id[%0d]...", $time, id);
    endtask

    task putRoom(bit [1:0] id); 
        $display("[%0t] Leaving room id[%0d]...", $time, id);
        key.put(1);
        $display("[%0t] Room key put back id[%0d]...", $time, id);
    endtask

    task personA();
            getRoom(1);
        #20 putRoom(1);
    endtask

    task personB();
        #5  getRoom(2);
        #10 putRoom(2);
    endtask

endmodule

/*
[0] Trying to get a room for id[1]...
[0] Room key retrieved for id[1]...
[5] Trying to get a room for id[2]...
[20] Leaving room id[1]...
[20] Room key put back id[1]...
[20] Room key retrieved for id[2]...
[25] Trying to get a room for id[1]...
[30] Leaving room id[2]...
[30] Room key put back id[2]...
[30] Room key retrieved for id[1]...
[50] Leaving room id[1]...
[50] Room key put back id[1]...
           V C S   S i m u l a t i o n   R e p o r t
*/
