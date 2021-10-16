/* RGB LED control via 4'bit KEY */
/* KEY[1] --> R */
/* KEY[2] --> G */
/* KEY[3] --> B */

module key_leds (
   input [2:0] SW,
   output LED_R,
   output LED_G, 
   output LED_B
);

assign LED_R = SW[0];
assign LED_G = SW[1];
assign LED_B = SW[2];

endmodule // top
