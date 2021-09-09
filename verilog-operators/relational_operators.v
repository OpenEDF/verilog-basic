module relational_operators();

initial begin
    $display (" 5     <=  10 = %b", (5     <= 10));
    $display (" 5     >=  10 = %b", (5     >= 10));
    $display (" 4'bx  <=  10 = %b", (4'bx  <= 10));
    $display (" 4'bz  <=  10 = %b", (4'bz  <= 10));  
    $finish;
end

endmodule
