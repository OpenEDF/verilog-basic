/* define test */
module test;
int data = 5;
`define print(x) $display(`"variable x = %d`", x)
`define FILE_NAME(x) ("2021_12``x")

initial begin
    #1
    $display("");
    `print(data);
    $display("%s", `FILE_NAME(_macro));
    $display("\"\"");
    $display("\`\`");
    $display("\\\\");
    $display("define content test.\n");
    $finish;
end

endmodule
