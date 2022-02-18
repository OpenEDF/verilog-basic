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
parameter max_write_count = 5'b01111;

// fifo memory
reg [7:0] fifo [0:MAX_COUNT - 1];

// read 
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0)
        data_out <= 0;
    else if (rd_en && empty == 0)
        data_out <= fifo[rd_addr];
    else
        data_out <= data_out;
end
    
// write
always @(posedge clk) begin
    if (wr_en == 1 && full == 0)
        fifo[wr_addr] <= data_in;
    else
        fifo[wr_addr] <= fifo[wr_addr];
end

// update read address
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0)
        rd_addr <= 4'b0000;
    else if (empty == 0 && rd_en == 1)
        rd_addr <= rd_addr + 1;
    else
        rd_addr <= rd_addr;
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

// update flag
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0)
        count <= 0;
    else begin
        case({wr_en, rd_en})
            2'b00 : count <= count;
            2'b01 : if (count != 5'b00000) count <= count - 1;
            2'b10 : if (count != max_write_count) count <= count + 1;
            2'b11 : count <= count;
        endcase
    end
end

// empty flag
always @(count) begin
    if (count == 5'b00000)
        empty = 1;
    else
        empty = 0;
end

// full flag
always @(count) begin
    if (count == MAX_COUNT)
        full = 1;
    else
        full = 0;
end

endmodule
