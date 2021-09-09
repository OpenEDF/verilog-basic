/* Arithmetic Operators */

module arithmetic_operators();

initial begin
    $display("5  + 10 = %d", 5 + 10);
    $display("5  - 10 = %d", 5 - 10);
    $display("10 - 5  = %d", 10 - 5);
    $display("5  * 10 = %d", 5 * 10);
    $display("10 / 5  = %d", 10 / 5);
    $display("10 / -2 = %d", 10 / -2);
    $display("10 %s 3 = %d", "%", 10 % 3);
    $display("+5      = %d", +5);
    $display("-5      = %d", -5);

    $finish;
end

endmodule
