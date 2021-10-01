module counter (
   input clk,
   input reset_l,
   output wire [31:0] count
);

reg [31:0] reg_count;

always @ (posedge clk) begin
    if (!reset_l) begin
        /*AUTORESET*/
        // Beginning of autoreset for uninitialized flops
        reg_count <= 32'h0;
        // End of automatics
    end
    else begin
        reg_count <= reg_count + 1;
    end
end

assign count = reg_count;
endmodule
