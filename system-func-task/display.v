// $display

module disp();

initial begin
    $display("\\\t\\\n\"\123");
    $display("This is a test: %d, %h, %b", 10, 4'ha, 1'b1);
end

endmodule
