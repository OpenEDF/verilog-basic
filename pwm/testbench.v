/* 3bit counter */
`timescale 1ns/1ps
module testbench ();

parameter N = 8;
reg clock;
reg rst;
reg [N-1:0] duty;
reg [N-1:0] period;
wire pwm;

pwmN test_unit(
    .clk(clock),
    .clr(rst),
    .duty(duty),
	.period(period),
	.pwm(pwm)
);

/* clock generation */
initial begin
    clock = 0;
    forever #100 clock = ~clock;
end

integer i = 0;
/* generate data dump */
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

	rst = 1'b0;		/* action */
	period = 255;

	for (i = 0; i < 255; i++)
		#51200 duty = i;
    $finish;
end

initial begin
    $monitor("RST = %d   PWM = %d / %d\n", rst, duty, period);
end

endmodule
