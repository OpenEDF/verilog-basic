// vsc and verilog define macro test
module defines_test();

integer id;

initial begin
    $display("[OK] define conditional compilation.");
end

// 1. conditional compilation
initial begin
    `ifdef COND_COMP
        $display("[OK] COND_COMP define macro.");
    `endif
end

// 2. defines the specified text macro to the specified value
initial begin
        if ($test$plusargs("TEXT_MACRO")) begin
            $value$plusargs("TEXT_MACRO=%d", id);
            $display("[OK] TEXT_MACRO define macro: %0d.", id);
        end
end

// 3. +define+macro=value
initial begin
    `ifdef TEXT
        $display("[OK] The define macro text is: %s", `TEXT);
        $display("[OK] The define macro text is: %0d", `NUM);
    `endif
end

endmodule

// vcs simluator result
/*
[OK] define conditional compilation.
[OK] COND_COMP define macro.
[OK] TEXT_MACRO define macro: 10.
[OK] The define macro text is: Hello World
[OK] The define macro text is: 20
*/
