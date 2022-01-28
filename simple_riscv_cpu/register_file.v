//register file, 32 registers of 32bits

//allows to have unused signals
/* verilator lint_off UNUSED */

module register_file(
clk, reset, rd_1_en, rd_2_en, read_reg_1, read_reg_2, write_reg, write_data, write_en, data_out_1, data_out_2
);

input wire clk;
input wire reset;
input wire rd_1_en;
input wire rd_2_en;
input wire [4:0] read_reg_1;
input wire [4:0] read_reg_2;
input wire [4:0] write_reg;
input wire [31:0] write_data;
input wire write_en;
output reg [31:0] data_out_1;
output reg [31:0] data_out_2;

//32 registers of 32bits
reg [31:0] registers_1 [0:31];
reg [31:0] registers_2 [0:31];
integer i;

initial begin
   for(i = 0; i <= 31; i=i+1) begin
      registers_1[i] = 32'h0;
      registers_2[i] = 32'h0;
   end
end


always @(posedge clk)
begin

   //TODO: reset signal handling (without breaking ice40 bram logic)

   if(write_en == 1 && write_reg != 0) begin
      registers_1[write_reg] <= write_data;
      registers_2[write_reg] <= write_data;
   end

   //ice40 bram can't be written and read at the same time, and
   //output of bram should be clocked
   if (rd_1_en == 1) begin
      data_out_1 <= registers_1[read_reg_1];
   end

   if (rd_2_en == 1) begin
      data_out_2 <= registers_2[read_reg_2];
   end
end

endmodule
