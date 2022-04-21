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
reg  u0_data;
wire u3_qout;

wire u0_u1;
wire u1_u2;
wire u2_u3;

// parallel output
wire [3:0] parallel_output;
assign parallel_output = {u3_qout, u2_u3, u1_u2, u0_u1};

// instance the dff async rst
dff_async_rst u0(
    .clk(clk),
    .rst_n(rst_n),
    .d(u0_data),
    .q(u0_u1)
);
dff_async_rst u1(
    .clk(clk),
    .rst_n(rst_n),
    .d(u0_u1),
    .q(u1_u2)
);
dff_async_rst u2(
    .clk(clk),
    .rst_n(rst_n),
    .d(u1_u2),
    .q(u2_u3)
);
dff_async_rst u3(
    .clk(clk),
    .rst_n(rst_n),
    .d(u2_u3),
    .q(u3_qout)
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
    u0_data  = 1'b1;
    #12
    u0_data  = 1'b0;
    #200
    $display("[OK] 1-bit shift d-flop-fiop test end...\n");
    $finish;
end

endmodule
//--------------------------------------------
