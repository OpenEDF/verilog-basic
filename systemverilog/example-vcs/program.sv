/* program test */
//module test;
/*
program automatic test;

initial begin
    $display("-------The systemverilog testbench test.--------\n");
end

endprogram
*/
//endmodule

program inc (input [4:0] x);
    initial begin
        $display("The test program invoke, Enter: %d.\n", x);
    end
endprogram        

module test;

int a = 10;

initial begin 
    $display("This is a test.\n");
end

inc u0(a);

endmodule

