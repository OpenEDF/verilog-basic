/* task invoke test */
`include "task_only.v"

module task_call;
reg [7:0] n, m, u;

task_only other_add();

/* module call task in other file */
initial begin
    n = 10;
    m = 20;
    u = 0;
    other_add.add_print(n, m, u);
    $display("The u = %d", u);
end

endmodule
/*
The a =  10
The b =  20
The c =   x
The a + b =  30
The u =  30
The a =  10
The b =  20
The c =   x
The a + b =  30
The u =  30
*/
