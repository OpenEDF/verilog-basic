/* PWM */
module pwmN #(parameter N = 8)
(
    input wire clk,
    input wire clr,
    input wire [N-1:0] duty,
    input wire [N-1:0] period,
    output reg pwm
);

reg [N-1:0] count;

initial begin
	count = 8'b0000_0000;
end

always @(posedge clk or posedge clr) begin
    if (clr == 1)
        count <= 0;
    else if (count == (period - 1))
        count <= 0;
    else 
        count <= count + 1;
end

always @(*) begin
    if (count < duty)
        pwm <= 1;
    else 
        pwm <= 0;
end

endmodule
