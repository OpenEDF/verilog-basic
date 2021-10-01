/* simple verilog impletment of an alu module */
/* used verilator simlution */

module alu(
    input wire [31:0] in1,
    input wire [31:0] in2,
    input wire [3:0]  control,
    output wire [31:0] out,
    output wire zero,
    output wire neg
);

// register varialble
reg [31:0] acc;
reg reg_zero;
reg reg_neg;

always @(/*AUTOSENSE*/control or in1 or in2) begin
    if (control == 4'b0000) begin         
        acc = in1 + in2;
    end else if (control == 4'b0001) begin
        acc = in1 - in2;
    end else begin
        acc = 32'h0;
        reg_neg = 1'h0;
        reg_zero = 1'h0;
    end
    reg_neg = (acc[31] == 1'b1);
    reg_zero = (acc == 32'h0); 
end

// output register to wire
assign out  = acc;
assign zero = reg_zero;
assign neg  = reg_neg; 
endmodule

/* ------------------------------------------- */
