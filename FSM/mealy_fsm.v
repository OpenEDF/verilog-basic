//--------------------------------------------------------------------
// Mealy FSM
module mealy_fsm(
    // Inputs
    input clk,
    input rst_n,
    input [1:0] coin,

    // Outputs
    output [1:0] change,
    output sell
);

// machine state decode
localparam IDLE  = 4'b0001;
localparam GET05 = 4'b0010;
localparam GET10 = 4'b0100;
localparam GET15 = 4'b1000;

// nmachine veariable
reg [2:0] st_next;
reg [2:0] st_cur;

// state transfer
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        st_cur <= IDLE;
    else
        st_cur <= st_next;
end

// state switch
always @(*) begin
    case(st_cur)
        IDLE:
            case (coin)
                2'b01: st_next <= GET05;
                2'b10: st_next <= GET10;
                default: st_next <= IDLE;
            endcase
        GET05:
            case (coin)
                2'b01: st_next <= GET10;
                2'b10: st_next <= GET15;
                default: st_next <= GET05;
            endcase
        GET10:
            case (coin)
                2'b01: st_next <= GET15;
                2'b10: st_next <= IDLE;
                default: st_next <= GET10;
            endcase
        GET15:
            case (coin)
                2'b01: st_next <= IDLE;
                2'b10: st_next <= IDLE;
                default: st_next <= GET15;
            endcase
        default st_next <= IDLE;
    endcase
end

// output logic
reg [1:0] change_r;
reg sell_r;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
       change_r <= 2'b00;
       sell_r <= 2'b00;
    end else if ((st_cur == GET10 && coin == 2'b10) || (st_cur == GET15 && coin == 2'b01)) begin
       change_r <= 2'b00;
       sell_r <= 2'b01;
    end else if (st_cur == GET15 && coin == 2'b10) begin
       change_r <= 2'b01;
       sell_r <= 2'b01;
    end else begin
       change_r <= 2'b00;
       sell_r <= 2'b00;
    end
end        

assign sell = sell_r;
assign change = change_r;

endmodule 
//--------------------------------------------------------------------
