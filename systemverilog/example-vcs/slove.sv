class ABC;
    rand bit a;
    rand bit [3:0] b;
    constraint c_mode { a -> b == 3'h4; solve a before b; }
endclass

module test;
    initial begin
        ABC abc = new();
        for (int i = 0; i < 50; i++) begin
            abc.randomize();
            $display("mode = %0d len = %0d", abc.a, abc.b);
        end
    end

endmodule
