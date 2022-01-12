module test;

    bit a, b;
    bit clk;

    always #10 clk = ~clk;

    initial begin
        for (int i = 0; i < 10; i++) begin
            @(posedge clk);
            a <= $random;
            b <= $random;
            $display("[%0t] a = %0b b = %0b", $time, a, b);
        end

        #10 $finish;
    end

    //assert property (@(posedge clk) a & b);
    //assert property (@(posedge clk) a | b);
    assert property (@(posedge clk) !(!a ^ b));

endmodule
