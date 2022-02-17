/* 8bit Serial-In, Parallel-Out shift */
/* 
*		V QA SER OE/ RCLK SRCLK SRCLR/ QH'
*		---------------------------------
*		|								|
*		|O		   74HC595				|
*		|								|
*		---------------------------------
* 		QB  QC  QD  QE  QF  QG  QH 	 GND
* 
*
* GND AND V IS POWER PIN (5V)
* OE/: 			 Output Enable. Low Action QA-QH Enable or Disable.
* QA ... QH QH': parallel Output Pin.
* RCLK: 		 Input Storage register clock, positive-edge triggered.
* SER:  		 Input Serial Data Input.
* SRCLK:		 Input Shift register clock. P-e-t.
* SRCLR/:		 Input Shift register Clear. Low Action.
*
* Function Table
* SER	SRCLK	SRCLK/	RCLK	OE/	
* X		X		X		X		H		QA - QH QH' output disbale
* X 	X 		X		X		L		QA - QH QH' output enable
* X 	X		L		X		X		Shift register is cleared
* L		^		H		X		X		input data is low
* H		^		H		X		X		input data is high
* X		X		X		^		X		Shift register data is store SR
*
* */

/* Verilog impletment code */
/* Reference: https://github.com/jjcarrier/FPGA_2_ShiftReg  */

module sipo74hc595 (
	input SRCLK,
	input SER,		
	input RCLK,
	input SRCLR_n,
	input OE_n,
	output [7:0] QA_H,
    output QH_ser
);

// data output register
reg [7:0] shift_reg_dout;
reg [7:0] store_reg_dout;

// shift register
always @(posedge SRCLK or negedge SRCLR_n) begin
    if (!SRCLR_n) begin
		shift_reg_dout <= 8'b0000_0000;
    end else begin
        shift_reg_dout <= {shift_reg_dout[6:0], SER}; // left shift
    end
end

// store register
always @(posedge RCLK or negedge OE_n) begin
    if (!OE_n) begin
		store_reg_dout <= 8'bxxxx_xxxx;
    end else begin
        store_reg_dout <= shift_reg_dout;
    end
end

// data output
assign QA_H = store_reg_dout;
assign QH_ser = shift_reg_dout[7];

endmodule

/* -- -- -- END -- -- -- */
