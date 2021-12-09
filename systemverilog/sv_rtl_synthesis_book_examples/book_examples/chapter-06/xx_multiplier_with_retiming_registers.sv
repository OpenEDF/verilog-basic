
// Following Verilog template shows the multiplication operation placed outside the always block and the pipeline stages represented as single registers.
module mult(clk, a, b, mult);
input clk;
input [17:0] a;
input [17:0] b;
output [35:0] mult;
reg [35:0] mult;
reg [17:0] a_in, b_in;
wire [35:0] mult_res;
reg [35:0] pipe_1, pipe_2, pipe_3;
assign mult_res = a_in * b_in;
always @(posedge clk)
begin
a_in <= a;
b_in <= b;
pipe_1 <= mult_res;
pipe_2 <= pipe_1;
pipe_3 <= pipe_2;
mult <= pipe_3;
end
endmodule

//Following Verilog template shows the multiplication operation placed inside the always block and the pipeline stages are represented as single registers.
module mult(clk, a, b, mult);
input clk;
input [17:0] a;
input [17:0] b;
output [35:0] mult;
reg [35:0] mult;
reg [17:0] a_in, b_in;
reg [35:0] mult_res;
reg [35:0] pipe_2, pipe_3;
always @(posedge clk)
begin
a_in <= a;
b_in <= b;
mult_res <= a_in * b_in;
pipe_2 <= mult_res;
pipe_3 <= pipe_2;
mult <= pipe_3;
end
endmodule

//Following Verilog template shows the multiplication operation placed outside the always block and the pipeline stages represented as shift registers.
module mult3(clk, a, b, mult);
input clk;
input [17:0] a;
input [17:0] b;
output [35:0] mult;
reg [35:0] mult;
reg [17:0] a_in, b_in;
wire [35:0] mult_res;
reg [35:0] pipe_regs [3:0];
assign mult_res = a_in * b_in;
always @(posedge clk)
begin
a_in <= a;
b_in <= b;
{pipe_regs[3],pipe_regs[2],pipe_regs[1],pipe_regs[0]} <=
{mult, pipe_regs[3],pipe_regs[2],pipe_regs[1]};
end
endmodule

//Following templates to implement Multiplier Adder with 2 Register Levels on Multiplier Inputs.
module mvl_multaddsub1(clk, a, b, c, res);
input clk;
input [07:0] a;
input [07:0] b;
input [07:0] c;
output [15:0] res;
reg [07:0] a_reg1, a_reg2, b_reg1, b_reg2;
wire [15:0] multaddsub;
always @(posedge clk)
begin
a_reg1 <= a;
a_reg2 <= a_reg1;
b_reg1 <= b;
b_reg2 <= b_reg1;
end
assign multaddsub = a_reg2 * b_reg2 + c;
assign res = multaddsub;
endmodule