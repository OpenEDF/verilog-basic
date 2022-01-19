// wait orde
module testbench;
    event a, b, c;

    initial bengin
        #10 -> a;
        #10 -> b;
        #10 -> c;
    end
    
    initial begin
        wait_orde(a, b, c)
            $display("Event were executed in the correct order");
        else
            $display("Event were NOT executed in the correct order!");
    end
endmodule
