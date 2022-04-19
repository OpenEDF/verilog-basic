// vsc and verilog verify
module verify(
    input clk,
    input rst_n,
    input wire  [31:0] wire_test,
    output reg  [5:0]  comp,
    output reg  [2:0]  inst
);

/*
  Net type cannot be used on the left side of this assignment.
  The offending expression is : comp_wire
  Source info: comp_wire <= {{2 {wire_test[31]}}, wire_test[1:0]};
*/
wire [3:0] comp_wire;
assign comp_wire[3:0] = {wire_test[31:30], wire_test[1:0]};

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        comp <= 6'b000000;
    end else begin
        case (comp_wire)
            4'b0001: comp <= 6'b111101;
            4'b0010: comp <= 6'b111110;
            default: comp <= 6'b000000;
        endcase
    end
end

always @(comp) begin
    case (comp)
        6'b111101: inst <= 3'b010;
        6'b111110: inst <= 3'b001;
        default:   inst <= 3'b111;
    endcase
end

/*
wire test_lrs;
always @(*) begin
    if (!rst_n)
        test_lrs = 4'b0000;
    else
        test_lrs = 4'b1111;
end
*/

wire [3:0] test_lrs;
reg [3:0] test_lrs_reg;
assign test_lrs = test_lrs_reg;

always @(*) begin
    if (!rst_n)
        test_lrs_reg = 4'b0000;
    else
        test_lrs_reg = 4'b1111;
end

// regiister is not same the memory

//reg [7:0] rega;
//reg memea[0:7];
//

endmodule

/*
// module parameter and modify parameter
module name
#(
    parameter WIDTH = 8,
    parameter DELAYS = 5)

   // modify the parameter is illegal at the run time, expect compilation time,
   // or used defparam and module instance statement.


(
    input clk,
    input wire [31:0] data,
    inout wire [31:0] addr
);

endmodule

name #(WIDTH = 32, DELAY = 3) u2 (
    .clk()
);

defparam u2.WIDTH = 64;
*/

