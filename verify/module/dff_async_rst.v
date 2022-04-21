//--------------------------------------------
//design nane: dff_async_rst
//file name: dff_async_rst.v
//function: D filp-flop async reset
//coder: Macro
//--------------------------------------------
module dff_async_rst (
    input wire clk,
    input wire rst_n,
    input wire d,
    output reg q
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        q <= 1'b0;
    end else begin
        q <= d;
    end
end

endmodule
//--------------------------------------------
