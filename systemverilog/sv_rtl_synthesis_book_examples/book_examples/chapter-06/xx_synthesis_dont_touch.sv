
//The only way to ensure that the synthesizer uses a particular cell, 'special' for
//example, from a specific library is to write structural Verilog and instantiate the cell,
//'special' , in the Verilog. We call this hand instantiation . We must then decide
//whether to allow logic optimization to replace or change 'special' . If we insist on
//using logic cell 'special' and do not want it changed, we flag the cell with a
//synthesizer command. Most logic synthesizers currently use a pseudocomment statement
//or set an attribute to do this.
//For example, we might include the following statement to tell the Compass
//synthesizer—“Do not change cell instance my_inv_8x .” This is not a standard
//construct, and it is not portable from tool to tool either.

//Compass dontTouch my_inv_8x or // synopsys dont_touch
INVD8 my_inv_8x(.I(a), .ZN(b) );