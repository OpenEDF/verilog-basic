/* Fork and Join parllar exception statement */
module fork_join;

initial begin
    #100 $display("[%t] This is a test 5.", $time);
    fork
        #10 $display("[%t] This is a test 1.", $time);
        #10 $display("[%t] This is a test 2.", $time);
        #20 $display("[%t] This is a test 6.", $time);
        #10 $display("[%t] This is a test 3.", $time);
    join
    #10 $display("[%t] This is a test 4.", $time);
end
endmodule
/*
[                 100] This is a test 5.
[                 110] This is a test 3.
[                 110] This is a test 2.
[                 110] This is a test 1.
[                 120] This is a test 6.
[                 130] This is a test 4.
*/
