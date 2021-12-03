module sevenseg(input      [3:0] data, 
                output reg [6:0] segments);

  always @(*)
    case (data)
      //                     abc_defg     
      0: segments = 	  7'b111_1110;
      1: segments = 	  7'b011_0000;
      2: segments = 	  7'b110_1101;
      3: segments = 	  7'b111_1001;
      4: segments = 	  7'b011_0011;
      5: segments = 	  7'b101_1011;
      6: segments = 	  7'b101_1111;
      7: segments = 	  7'b111_0000;
      8: segments = 	  7'b111_1111;
      9: segments = 	  7'b111_1011;
      default: segments = 7'b000_0000;
    endcase
endmodule