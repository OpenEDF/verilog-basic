/* FIFO */
module sync_fifo (
    input            clk,
    input            rst_n,
    input            wr_en,
    input            rd_en,
    input      [7:0] data_in,
    output reg [7:0] data_out,
    output reg       empty,
    output reg       full
);

reg [3:0] wr_addr;
reg [3:0] rd_addr;
reg [4:0] count;

parameter MAX_COUNT = 16;
parameter max1_count = 5'b01111;

// fifo memory
reg [7:0] fifo [0:MAX_COUNT - 1];

// read 
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0)
        data_out <= 0;
    else if (rd_en && empty == 0)
        data_out <= fifo[rd_addr];
end
    
// update read address
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0)
        rd_addr <= 4'b0000;
    else if (empty == 0 && rd_en == 1)
        rd_addr <= rd_addr + 1;
end

// update write address
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0)
        wr_addr <= 4'b0000;
    else if (full == 0 && wr_en == 1)
        wr_addr <= wr_addr + 1;
    else
        wr_addr <= 4'b0000;
end

endmodule
