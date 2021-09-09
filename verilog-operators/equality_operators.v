module equality_operators();

initial begin
    // Case Equality
    $display (" 4'bx001 ===  4'bx001 = %b", (4'bx001 ===  4'bx001));
    $display (" 4'bx0x1 ===  4'bx001 = %b", (4'bx0x1 ===  4'bx001));
    $display (" 4'bz0x1 ===  4'bz0x1 = %b", (4'bz0x1 ===  4'bz0x1));
    $display (" 4'bzxx1 ===  4'bzxx1 = %b", (4'bzxx1 ===  4'bzxx1));
    // Case Inequality
    $display (" 4'bx0x1 !==  4'bx001 = %b", (4'bx0x1 !==  4'bx001));
    $display (" 4'bz0x1 !==  4'bz001 = %b", (4'bz0x1 !==  4'bz001));  
    // Logical Equality
    $display (" 5       ==   10      = %b", (5       ==   10));
    $display (" 5       ==   5       = %b", (5       ==   5));
    // Logical Inequality
    $display (" 8       !=   5       = %b", (8       !=   5));
    $display (" 6       !=   6       = %b", (6       !=   6));
    $finish;
end

endmodule
