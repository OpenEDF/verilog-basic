// test bench
`timescale 1ns/1ps
module top_tb();

reg       clk;
reg [7:0] data_in;
reg       rd_en;
reg       rst_n;
reg       wr_en;

wire [7:0] data_out;
wire       empty;
wire       full;

initial begin
    clk   = 0;
    rst_n = 0;
    rd_en = 0;
    wr_en = 0;
    data_in = 0;

    #20
    rst_n = 1;
    #20

    wr_en = 1;
    #400 
    wr_en = 0;
    rd_en = 1;
    #1000
    $finish;
end

integer count;
initial begin
    for (count = 0; count < 40; count = count + 1) begin
        #20 data_in <= data_in + 1;
    end
end

initial begin
    forever #10 clk = ~clk; 
end

sync_fifo u0_sync_fifo (
    .clk(clk),
    .data_in(data_in),
    .data_out(data_out),
    .empty(empty),
    .full(full),
    .rd_en(rd_en),
    .rst_n(rst_n),
    .wr_en(wr_en)
);

initial begin
    $monitor("rst_n = %d rd_en = %d  data_out = %d wr_en = %d data_in = %d empty = %d full = %d",
            rst_n, rd_en, data_out, wr_en, data_in, empty, full);
end

endmodule
