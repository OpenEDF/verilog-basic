`timescale 1ns/10ps

module counter (
    input clk,
    input rst,
    output reg [5:0] count
);

always @(posedge clk or negedge rst) begin
    if (!rst)
        count <= 0;
    else
        count <= count + 1;
end

endmodule
