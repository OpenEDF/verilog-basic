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

module shiftreg74hc595 (
	input SRCLK,
	input SER,		
	input RCLK,
	input SRCLR_n,
	input reg OE_n,
	output reg QA, QB, QC, QD, QE, QF, QH, QH1
);

/* temp  register */
reg [7:0] temp_reg;
temp_reg = {QH1, QH, QF, QE, QD, QC, QB, QA};

always @(posedge SRCLK or posedge RCLK or OE_n) begin 
	if (OE_n == 1)
		temp_reg = 8'hxxxx_xxxx;
	else begin
		if (SER == 1) 
		
	end
end

endmodule

/* -- -- -- END -- -- -- */
