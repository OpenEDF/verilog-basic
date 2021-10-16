/* Task file will be call to other file */
// !!! error: task declarations must be contained within a module.
module task_only;

task add_print (input [7:0] a, b, output [7:0] c);
begin
    $display("The a = %d", a);
    $display("The b = %d", b);
    $display("The c = %d", c);
    c = a + b;
    $display("The a + b = %d", c);
end
endtask

endmodule
