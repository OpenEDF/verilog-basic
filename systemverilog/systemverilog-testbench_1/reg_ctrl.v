module reg_ctrl # (
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 16,
    parameter DEPTH      = 256,
    parameter RESET_VAL  = 16'h1234
) (
    input                       clk,
    input                       rstn,   // low reset
    input [ADDR_WIDTH-1:0]      addr,
    input                       sel,
    input                       wr,
    input [DATA_WIDTH-1:0]      wdata,
    output reg [DATA_WIDTH-1:0] rdata, 
    output reg                  ready
);

    reg [DATA_WIDTH-1:0] ctrl[DEPTH-1:0];

    reg  ready_dly;
    wire ready_pe;
    
    integer index;   // generate and endgenerate keywords are not required.
    always @ (posedge clk) begin
        if (!rstn) begin
            for (index = 0; index < DEPTH; index = index + 1) begin
                ctrl[index] = RESET_VAL;
            end
        end else begin
            if (sel & ready & wr) begin
                ctrl[addr] <= wdata;
            end

            if (sel & ready & !wr) begin
                rdata <= ctrl[addr];
            end else begin
                rdata <= 0;
            end
        end
    end
    
    always @(posedge clk) begin
        if (!rstn) begin
            ready <= 1;
        end else begin
            if (sel & ready_pe) begin
                ready <= 1;
            end

            if (sel & ready & !wr) begin
                ready <= 0;
            end
        end
    end
    // Driver internal signal accordingly
    always @ (posedge clk) begin
        if (!rstn) ready_dly <= 1;
        else ready_dly <= ready;
    end

    assign ready_pe = ~ready & ready_dly;
endmodule
