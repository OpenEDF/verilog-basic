/* systemverilog fork join test */
`timescale 1ns/1ns

module fork_join_any_disable;

initial begin
    $display("[%0t ns]: starte fork..join any example", $time);
    #10 $display("[%0t ns]: sequential after #10", $time);

    fork: any_test
        $display("[%0t ns]: parallel start", $time);
        #50 $display("[%0t ns]: parallel after #50", $time);
        #10 $display("[%0t ns]: parallel after #10", $time);
        begin
            #30 $display("[%0t ns]: sequential after #30", $time);
            #10 $display("[%0t ns]: sequential after #10", $time);
        end
    join_any
    disable any_test;

    $display("[%0t ns]: after join", $time);
    #80 $display("[%0t ns]: finish after #80", $time);
end        

endmodule

/*
[0 ns]: starte fork..join any example
[10 ns]: sequential after #10
[10 ns]: parallel start
[10 ns]: after join
[90 ns]: finish after #80
*/
