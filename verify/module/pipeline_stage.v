//--------------------------------------------
//design nane: pipeline stage
//file name: pipeline_stage.v
//function: basic model for pipeline stage
//coder: Macro
//--------------------------------------------
module pipeline_stage (
    input wire clk,
    input wire rst_n,
    input wire [31:0]d,
    output reg [31:0]q
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        q <= 32'b0;
    end else begin
        q <= d;
    end
end

endmodule
//--------------------------------------------
