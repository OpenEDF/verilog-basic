/* timescale test */

`timescale 1ns/10ps
module time_test;

initial begin
    $printtimescale;
    #100
    $display("The time is: %d ns", $time);
    #1
    $display("The time is: %d ns", $time);
    $display("The real time is %d ns", $realtime);
    $stop;
    $finish;
end

endmodule

//Time scale of (time_test) is 1ns / 10ps
//The time is:                  100 ns
//The time is:                  101 ns
//The real time is 101 ns

