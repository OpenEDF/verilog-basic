// systemverilog randcase
module test;
    initial begin
        for (int i = 0; i < 10; i++)
            randcase
                1 : $display("Wt 1");
                5 : $display("Wt 5");
                3 : $display("Wt 3");
            endcase
    end
endmodule
