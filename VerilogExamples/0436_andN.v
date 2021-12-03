module andN
  #(parameter width = 8)
   (input  [width-1:0] a,
    output             y);

  genvar i;
  wire [width-1:1] x;

  generate
    for (i=1; i<width; i=i+1) begin: forloop
      if (i == 1)
        assign x[1] = a[0] & a[1];
      else
        assign x[i] = a[i] & x[i-1];
	end
  endgenerate
  assign y = x[width-1];
endmodule
	  
