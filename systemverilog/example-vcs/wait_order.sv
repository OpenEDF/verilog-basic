// wait orde
module testbench;
    event a, b, c;

    initial begin
        #10 -> a;
        #10 -> b;
        #10 -> c;

      //  #10 -> c;
      //  #10 -> b;

    end
    
    initial begin
        wait_order(a, b, c)
            $display("Event were executed in the correct order");
        else
            $display("Event were NOT executed in the correct order!");
    end
endmodule

/*
Event were executed in the correct order
           V C S   S i m u l a t i o n   R e p o r t
*/
