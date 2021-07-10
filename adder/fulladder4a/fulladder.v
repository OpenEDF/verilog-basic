/* fulladder */
module fulladder (
    input wire a, b, ci,
    output reg so, co
);

always @(*) begin
    so = a ^ b ^ ci;
    co = (a & b) | (a ^ b) & ci;
end

endmodule
