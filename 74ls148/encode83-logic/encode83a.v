module encode83a (
    input wire[7:0] x, 
    output wire[2:0] y,
    output wire vaild
);

assign y[2] = x[7] | x[6] | x[5] | x[4];  
assign y[1] = x[7] | x[6] | x[3] | x[2];  
assign y[0] = x[7] | x[5] | x[3] | x[1];  

//assign vaild = x[0] & ~y[2] & ~y[1] & ~y[0];
 assign vaild = |x;	/* check the output vaild  */    
endmodule
