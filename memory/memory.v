/* memory define and read write by verilog */
/* Reference: https://github.com/jjcarrier/FPGA_2_ShiftReg  */
module memory (
    input         clk,
    input         rstn,
    input  [1:0]  addr,
    input         wr,
    input         sel,
    input  [15:0] wdata,
    output [15:0] rdata
);

reg [15:0] register[3:0];
integer i;

always @(posedge clk) begin
    if (!rstn) begin
        for (i = 0; i < 4; i = i + 1) begin:a
            assign register[i] = 0;
        end
    end else begin
        if (sel & wr)
            register[addr] <= wdata;
        else
            register[addr] <= register[addr];
    end
end

assign rdata = (sel & ~wr) ? register[addr] : 0;

endmodule
