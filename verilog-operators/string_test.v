module string_test;

reg [8*14 :1] stringvar;

initial begin
    stringvar = "Hello World";
    $display ("%s = is store as %h", stringvar, stringvar);
end

endmodule

/* result:  */
// Hello World = is store as 00000048656c6c6f20576f726c64
