/*  Verilog Task Test */

module task_test;

// 1. task test method 1
task cal_print;
input [7:0] a, b;
output [7:0] c, d;

begin
    c = a + b;
    d = b - a;
    $display("The a + b = %d", c);
    $display("The a - b = %d", d);
end

endtask

// 2. task test method 2
task print_task (input [7:0] a, b, output [7:0] c, d);

begin 
    c = a + b;
    d = a - b;
    $display("The a + b = %d", c);
    $display("The a - b = %d", d);
end

endtask


// test task
reg [7:0] n, m, v, u;
initial begin
    n = 8'b00000011;
    m = 8'b00001100;
    $display("The n: %d", n);
    $display("The m: %d", m);
    v = 0;
    u = 0;
    $display("The v: %d", v);
    $display("The u: %d", u);
    $display("-------------------------------------------------------------");
    cal_print(n, m, v, u);
    $display("The v: %d", v);
    $display("The u: %d", u);
    $display("-------------------------------------------------------------");
end

initial begin
    n = 8'b00000011;
    m = 8'b00001100;
    $display("The n: %d", n);
    $display("The m: %d", m);
    v = 0;
    u = 0;
    $display("The v: %d", v);
    $display("The u: %d", u);
    $display("-------------------------------------------------------------");
    print_task(n, m, v, u);
    $display("The v: %d", v);
    $display("The u: %d", u);
    $display("-------------------------------------------------------------");
end

endmodule

/* Result output
The n:   3
The m:  12
The v:   0
The u:   0
-------------------------------------------------------------
The a + b =  15
The a - b =   9
The v:  15
The u:   9
-------------------------------------------------------------
The n:   3
The m:  12
The v:   0
The u:   0
-------------------------------------------------------------
The a + b =  15
The a - b = 247
The v:  15
The u: 247
-------------------------------------------------------------
*/
