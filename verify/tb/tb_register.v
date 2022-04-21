//--------------------------------------------
//design nane: tb_dff_async_rst
//file name: tb_dff_async_rst.v
//function: testbench for D filp-flop async reset
//coder: Macro
//--------------------------------------------
`timescale 1ns/1ps
module top_tb();
reg clk;
reg rst_n;
reg  [3:0]data;
wire [3:0]qout;

// instance the dff async rst
dff_async_rst u0(
    .clk(clk),
    .rst_n(rst_n),
    .d(data[0]),
    .q(qout[0])
);
dff_async_rst u1(
    .clk(clk),
    .rst_n(rst_n),
    .d(data[1]),
    .q(qout[1])
);
dff_async_rst u2(
    .clk(clk),
    .rst_n(rst_n),
    .d(data[2]),
    .q(qout[2])
);
dff_async_rst u3(
    .clk(clk),
    .rst_n(rst_n),
    .d(data[3]),
    .q(qout[3])
);

// create clock
initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;
end

// shift d-flip-flop
initial begin
    $display("[OK] 1-bit shift d-flop-fiop test start...\n");
    rst_n = 1'b0;
    #3 
    rst_n = 1'b1; 
    data = 4'h0;
    #200
    $display("[OK] 1-bit shift d-flop-fiop test end...\n");
    $finish;
end

integer index;
initial begin
    for (index = 0; index < 10; index = index + 1) begin
        #10 data <= data + 2;
    end
end
endmodule
//--------------------------------------------
