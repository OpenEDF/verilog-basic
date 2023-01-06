// test bench
`timescale 1ns/1ps
module top_tb();

reg clk;
reg rst_n;
reg br_en = 1'b0;
reg [31:0] br_addr = 32'h0000_0000;
wire [31:0] pc;
wire [31:0] pc_orig;
reg cs = 1'b1;
reg we = 1'b0;
wire [31:0] data_o;
reg  [31:0] data_in = 32'h0000_0000;
wire [31:0] pc_orig_id;
wire [31:0] inst_id;

/* instant pc */
update_pc inst_update_pc (
    .clk(clk),
    .rst_n(rst_n),
    .br_en(br_en),
    .br_addr(br_addr),
    .pc(pc),
    .pc_orig(pc_orig)
);

/* instant ram */
mem_ram inst_mem_ram (
    .clk(clk),
    .addr_in(pc),
    .data_in(data_in),
    .cs(cs),
    .we(we),
    .data_o(data_o)
);

/* instant if_id */
if_id inst_if_id (
    .clk(clk),
    .rst_n(rst_n),
    .pc_orig(pc_orig),
    .inst(data_o),
    .pc_orig_id(pc_orig_id),
    .inst_id(inst_id)
);

/* dispaly mem */
initial begin
    integer index;
    $display("Loading the code to memory....");
    $readmemh("tb/code_sim.hex", inst_mem_ram.mem);
    for (index = 0; index < 64; index = index + 4) begin
        $display("memory[0x%08h]: 0x%08h, 0x%08h, 0x%08h, 0x%08h", index,
                inst_mem_ram.mem[index],
                inst_mem_ram.mem[index + 1],
                inst_mem_ram.mem[index + 2],
                inst_mem_ram.mem[index + 3]);
    end
    $display("Load the code to memory Done....");
    #100
    $finish();
end

/* clk and reset */
initial begin
    rst_n = 1'b0;
    #10
    rst_n = 1'b1;
    clk = 1'b1;
    forever begin
        #5 clk = ~clk;
    end
end

endmodule
