module tb;
    reg clk;

    always #10 clk = ~clk;
    reg_if _if (clk);

    reg_ctrl u0 (
        .clk(clk),
        .addr(_if.addr),
        .rstn(_if.rstn),
        .sel(_if.sel),
        .wr(_if.wr),
        .wdata(_if.wdata),
        .rdata(_if.rdata),
        .ready(_if.ready)
    );

    initial begin
        test t0;

        clk          <= 0;
        _if.rstn     <= 0;
        _if.sel      <= 0;
        #20 _if.rstn <= 1;
        $display("T=%0t [OK] initilal done.", $time);

        t0 = new;
        t0.e0.vif = _if;
        t0.run();
        #200 $finish;
    end

    initial begin
        $dumpvars;
        $dumpfile("dump.vcd");
    end
endmodule
