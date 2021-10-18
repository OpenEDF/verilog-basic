module led_bar (
    input clk,
    output wire[7:0] led_array
);

// temp
reg [7:0] reg_leds;

always @(posedge clk) begin
    reg_leds <= 8'b10100101;
end
// output
assign led_array = reg_leds;

endmodule
