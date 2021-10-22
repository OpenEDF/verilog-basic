/* systemverilog fork join test */
module fork_test;

// Declare an event handle called "eventA"
event eventA;

initial begin
    fork
        waitForTrigger(eventA);
        #5 ->eventA;
    join
end

// Taigger the event 
task waitForTrigger (event eventx);
   #2 $display("[%0t] Waiting for EventA to triggered", $time);
    wait (eventx.triggered);
   #2 $display("[%0t] Event A has triggered", $time);
endtask

endmodule

/*
[2] Waiting for EventA to triggered
[7] Event A has triggered
*/
