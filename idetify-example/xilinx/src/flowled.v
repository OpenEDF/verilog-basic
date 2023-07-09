/*
*
* @file: flowled.v
* @brief: led stream
*
* */
module led_stream(
    output reg [7:0] led,  // LED4 to LED1, 1 on, 0 off
    input  wire      clk,  // FPGA PL clock, 50 MHz
    input  wire      rst_n // FPGA reset pin
);

reg [31:0] cnt;
reg [2:0]  led_on_number;

parameter CLOCK_FREQ  =50000000;          //clock input 50000000
parameter COUNTER_MAX_CNT=CLOCK_FREQ/2-1; //change time 0.5s

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            cnt <= 32'h0;
            led_on_number <= 3'd0;
        end
        else begin
            cnt <= cnt + 1'b1;
            if(cnt == COUNTER_MAX_CNT) begin//count to 0.5s
                cnt <= 32'h0;
                led_on_number <= led_on_number + 1'b1;
            end
        end
    end
    always @(led_on_number) begin
        case(led_on_number)
            0: led <= 8'b00000001;
            1: led <= 8'b00000010;
            2: led <= 8'b00000100;
            3: led <= 8'b00001000;
            4: led <= 8'b00010000;
            5: led <= 8'b00100000;
            6: led <= 8'b01000000;
            7: led <= 8'b10000000;
            default:;
        endcase
    end

endmodule
