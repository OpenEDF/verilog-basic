class ABC;
    rand bit[3:0] array [5];
    constraint c_array { foreach (array[i]) {
                            array[i] == i; 
                            } }
endclass

module test;
    initial begin
        ABC abc = new();
        abc.randomize();
        $display("Array = %p", abc.array);
    end

endmodule

// Array = '{'h0, 'h1, 'h2, 'h3, 'h4}

