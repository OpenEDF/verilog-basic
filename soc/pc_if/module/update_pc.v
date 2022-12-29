/* pipeline line fetch pc */

module update_pc(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        br_en,
    input  wire [31:0] br_addr,
    
    output reg  [31:0] pc,
    output wire [31:0] pc_orig
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pc <= 32'h0000_0000;
    end else begin
        if (br_en) begin
            pc <= br_addr;
        end else begin
            pc <= pc + 32'h4;
        end
    end
end

assign pc_orig = pc;

endmodule
