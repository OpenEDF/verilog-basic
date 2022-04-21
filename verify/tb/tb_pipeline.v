//--------------------------------------------
//design nane: tb_pipeline
//file name: tb_pipeline.v
//function: testbench for D filp-flop async reset
//coder: Macro
//--------------------------------------------
`timescale 1ns/1ps
module top_tb();

reg  clk;
reg  rst_n;
reg  [31:0] data;
wire [31:0] if_id;
wire [31:0] id_ex;
wire [31:0] ex_mem;
wire [31:0] qout;

// instance pipeline stage
pipeline_stage if_id_stage (
    .clk(clk),
    .rst_n(rst_n),
    .d(data),
    .q(if_id)
);
pipeline_stage id_ex_stage (
    .clk(clk),
    .rst_n(rst_n),
    .d(if_id),
    .q(id_ex)
);
pipeline_stage ex_mem_stage (
    .clk(clk),
    .rst_n(rst_n),
    .d(id_ex),
    .q(ex_mem)
);
pipeline_stage mem_wb_stage (
    .clk(clk),
    .rst_n(rst_n),
    .d(ex_mem),
    .q(qout)
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
    data = 32'h0;
    #200
    $display("[OK] 1-bit shift d-flop-fiop test end...\n");
    $finish;
end

integer index;
initial begin
    for (index = 0; index < 10; index = index + 1) begin
        #10 data <= data + 4;
    end
end
endmodule
//--------------------------------------------
