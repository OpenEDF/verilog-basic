`timescale 1ns / 1ps

module flowled_tb();

parameter T =20;

/* define register */
reg sys_clk;
reg sys_rst_n;

/* define led */
wire [7:0] led;

initial begin
    $display("Simluation Start!\n");
end      

/* initalization signal */
initial begin
    sys_clk          = 1'b0;
    sys_rst_n        = 1'b0;
    #(T+1) sys_rst_n = 1'b1;
end

/* generater clock */
always #(T/2) sys_clk = ~sys_clk;

flowled u0_flow_led (
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .led_out(led)
);

/* dump dvp file */
//initial begin
  //  $cvdpluson;
//end

//initial #10000 $stop;

initial begin
    #2000
    $display("Simluation End!\n");
    $finish;
end

endmodule
