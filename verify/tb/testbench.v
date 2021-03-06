// test bench
`timescale 1ns/1ps
module top_tb();

reg clk;
reg rst_n;
reg [31:0] data;
reg [5:0]  comp;
reg [2:0]  inst;

verify u0(
    .clk(clk),
    .rst_n(rst_n),
    .wire_test(data),
    .comp(comp),
    .inst(inst)
);

initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;
end

initial begin
    $display("[OK] Start test...");
    rst_n = 1'b0;
    #2
    rst_n = 1'b1;
    data = 32'h0000_0000;
end

integer index = 0;
initial begin
    for (index = 0; index <= 10; index = index + 1) begin
        #10 data = data + 1;
    end
    $finish;
end

initial begin
    integer fd;
    fd = $fopen("./note.txt", "r");
    if (fd) $display("File was opend successfully: %0d", fd);
    else $display("File was NOT opened successfully: %0d", fd);
    $fclose(fd);

    fd = $fopen("./test.txt", "w");
    for (integer i = 0; i < 5; i = i + 1) begin
        $fdisplay(fd,"The test number is %0d.", i);
        $fwrite(fd, "The test number is from $fwrite %0d\n", i);
    end
    $fclose(fd);
end

initial begin
    $monitor("[%0t] data = %32b  comp = %6b inst = %3b", $time, data, comp, inst);
end

endmodule
