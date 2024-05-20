module dmac_arb(
    input clk,
    input rst,
    input req_0,
    input req_1,
    input req_2,
    input req_3,
    input ch_0_en,
    input ch_1_en,
    input ch_2_en,
    input ch_3_en,
    input target_0,
    input target_1,
    input target_2,
    input target_3,
    output reg en_0,
    output reg en_1,
    output reg en_2,
    output reg en_3,
    output reg ack_0,
    output reg ack_1,
    output reg ack_2,
    output reg ack_3,
    input      req_done,
    input      ch_0_t0_done,
    input      ch_1_t0_done,
    input      ch_2_t0_done,
    input      ch_3_t0_done,

    input      fifo_0_empty,
    input      fifo_1_empty,
    input      fifo_2_empty,
    input      fifo_3_empty,

    input      fifo_0_full,
    input      fifo_1_full,
    input      fifo_2_full,
    input      fifo_3_full

 );

parameter IDLE =9'b000000001;
parameter ST_0 =9'b000000010;
parameter W_0  =9'b000000100;
parameter ST_1 =9'b000001000;
parameter W_1  =9'b000010000;
parameter ST_2 =9'b000100000;
parameter W_2  =9'b001000000;
parameter ST_3 =9'b010000000;
parameter W_3  =9'b100000000;


reg [8:0]cs;
reg [8:0]ns;

always @(posedge clk or negedge rst)
    if (!rst)
        cs<=IDLE;
    else 
        cs<=ns;

always @(*)
    case (cs)
        IDLE:begin
            if (req_0 && (~ack_0))
                ns=ST_0;
                //  ns= W_0;
            else if (req_1 && (~ack_1))
                ns=ST_1;
            else if (req_2 && (~ack_2))
                ns=ST_2;
            else if (req_3 && (~ack_3))
                ns=ST_3;
            else if (ch_0_en && (~ch_0_t0_done) && (~target_0))
                ns=ST_0;
                //  ns= W_0;
            else if (ch_1_en && (~ch_1_t0_done) && (~target_1))
                ns=ST_1;
            else if (ch_2_en && (~ch_2_t0_done) && (~target_2))
                ns=ST_2;
            else if (ch_3_en && (~ch_3_t0_done) && (~target_3))
                ns=ST_3;
            else if (ch_0_en && (~fifo_0_empty) && (target_0))
                ns=ST_0;
                // ns= W_0;
            else if (ch_1_en && (~fifo_1_empty) && (target_1))
                ns=ST_1;
            else if (ch_2_en && (~fifo_2_empty) && (target_2))
                ns=ST_2;
            else if (ch_3_en && (~fifo_3_empty) && (target_3))
                ns=ST_3;
            else 
                ns=IDLE;
            end

        ST_0:ns=W_0;

        W_0 :begin
            if (~req_done)//once ch is started, we have to wait finish ,then we can start other chs
                ns=W_0;
            else if (req_1)
                ns=ST_1;
            else if (req_2)
                ns=ST_2;
            else if (req_3)
                ns=ST_3;
            else if (ch_1_en && (~ch_1_t0_done) && (~target_1))
                ns=ST_1;
            else if (ch_2_en && (~ch_2_t0_done) && (~target_2))
                ns=ST_2;
            else if (ch_3_en && (~ch_3_t0_done) && (~target_3))
                ns=ST_3;
            else if (ch_1_en && (~fifo_1_empty) && (target_1))
                ns=ST_1;
            else if (ch_2_en && (~fifo_2_empty) && (target_2))
                ns=ST_2;
            else if (ch_3_en && (~fifo_3_empty) && (target_3))
                ns=ST_3;
            else if (req_done)
                ns=IDLE;
            else 
                ns=W_0;
            end
        ST_1:
            ns=W_1;

        W_1 :begin
            if (~req_done)
                ns=W_1;
            else if (req_2)
                ns=ST_2;
            else if (req_3)
                ns=ST_3;
            else if (ch_2_en && (~ch_2_t0_done) && (~target_2))
                ns=ST_2;
            else if (ch_3_en && (~ch_3_t0_done) && (~target_3))
                ns=ST_3;
            else if (ch_2_en && (~fifo_2_empty) && (target_2))
                ns=ST_2;
            else if (ch_3_en && (~fifo_3_empty) && (target_3))
                ns=ST_3;
            else if (req_done)
                ns=IDLE;
            else 
                ns=W_1;
            end

        ST_2: 
            ns=W_2;

        W_2 :begin
            if (~req_done)
                ns=W_2;
            else if (req_3)
                ns=ST_3;
            else if (ch_3_en && (~ch_3_t0_done) && (~target_3))
                ns=ST_3;
            else if (ch_3_en && (~fifo_3_empty) && (target_3))
                ns=ST_3;
            else if (req_done)
                ns=IDLE;
            else 
                ns=W_2;
            end

        ST_3:
            ns=W_3;

        W_3 :begin
            if (~req_done)
                ns=W_3;
            else
                ns=IDLE;
            end

        default: 
            ns=IDLE;
    endcase 

always @(posedge clk or negedge rst)
    if (!rst)
        en_0<=0;
    else if (ns==W_0)
        en_0<=1;
    else 
        en_0<=0;

always @(posedge clk or negedge rst)
    if (!rst)
        en_1<=0;
    else if (ns==W_1)
        en_1<=1;
    else 
        en_1<=0;

always @(posedge clk or negedge rst)
    if (!rst)
        en_2<=0;
    else if (ns==W_2)
        en_2<=1;
    else 
        en_2<=0;

always @(posedge clk or negedge rst)
    if (!rst)
        en_3<=0;
    else if (ns==W_3)
        en_3<=1;
    else 
        en_3<=0;

always @(posedge clk or negedge rst)
    if (!rst)
        ack_0<=0;
    else if (cs==W_0  && req_done && req_0)
        ack_0<=1;
    else 
        ack_0<=0;

always @(posedge clk or negedge rst)
    if (!rst)
        ack_1<=0;
    else if (cs==W_1  && req_done && req_0)
        ack_1<=1;
    else 
        ack_1<=0;

always @(posedge clk or negedge rst)
    if (!rst)
        ack_2<=0;
    else if (cs==W_2  && req_done && req_0)
        ack_2<=1;
    else 
        ack_2<=0;
 
always @(posedge clk or negedge rst)
    if (!rst)
        ack_3<=0;
    else if (cs==W_3  && req_done && req_0)
        ack_3<=1;
    else 
        ack_3<=0;

endmodule
