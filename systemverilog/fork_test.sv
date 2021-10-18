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
    $display("[%t] Waiting for EventA to triggered", $time);
    wait (eventA.Triggered);
    $display("[%t] Event A has triggered", $time);
endtask

endmodule
