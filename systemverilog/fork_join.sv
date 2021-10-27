/* systemverilog fork join test */
`timescale 1ns/1ns

module fork_join;

initial begin
    $display("[%0t ns]: starte fork..join example", $time);
    #10 $display("[%0t ns]: sequential after #10", $time);

    fork
        $display("[%0t ns]: parallel start", $time);
        #50 $display("[%0t ns]: parallel after #50", $time);
        #10 $display("[%0t ns]: parallel after #10", $time);

        begin
            #30 $display("[%0t ns]: sequential after #30", $time);
            #10 $display("[%0t ns]: sequential after #10", $time);
        end
    join

    $display("[%0t ns]: after join", $time);
    #80 $display("[%0t ns]: finish after #80", $time);
end        

endmodule

/*
[0 ns]: starte fork..join example
[10 ns]: sequential after #10
[10 ns]: parallel start
[20 ns]: parallel after #10
[40 ns]: sequential after #30
[50 ns]: sequential after #10
[60 ns]: parallel after #50
[60 ns]: after join
[140 ns]: finish after #80

*/
