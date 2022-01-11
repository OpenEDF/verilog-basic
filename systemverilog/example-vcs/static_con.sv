class ABC;
    rand bit [3:0] a;
    constraint c1 { a > 5; }
    static constraint c2 { a < 12; }
endclass

module test;
    initial begin
        ABC abc1 = new();
        ABC abc2 = new();

        //abc1.c2.constraint_mode(0);
        abc1.c1.constraint_mode(0);

        for (int i = 0; i < 10; i++) begin
            abc1.randomize();
            abc2.randomize();
            $display("abc1 = %0d abc2 = %0d", abc1.a, abc2.a);
        end
    end

endmodule
