class ABC;
    randc bit [2:0] mode;
    rand bit [3:0] len;
    //constraint c_mode { mode == 2 -> len > 10; }
    constraint c_mode { if (mode == 2) len > 10; }
endclass

module test;
    initial begin
        ABC abc = new();
        for (int i = 0; i < 50; i++) begin
            abc.randomize();
            $display("mode = %0d len = %0d", abc.mode, abc.len);
        end
    end

endmodule
