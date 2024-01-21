`timescale 1ns/10ps

module dc_env #(
    parameter CNT_MAX = 24'd2
)(
    input wire sys_clk,             /* system clock 50MHz */
    input wire sys_rst_n,           /* system global reset */
    output reg [7:0] led_out        /* 8 bit led flow */
);

/* temp counter */
reg [23:0] counter;

/* counter increment */
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        counter <= 24'b0;
    else if (counter < CNT_MAX)
        counter <= counter + 1'b1;
    else
        counter <= 24'b0;
end

/* led flow */
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        led_out <= 8'b0000_0001;
    else if (counter == CNT_MAX)
        led_out <= {led_out[6:0], led_out[7]};
    else
        led_out <= led_out;
end

endmodule
