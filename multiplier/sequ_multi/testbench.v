//--------------------------------------------------------------------------
//                         RISC-V Core
//                            V1.0.0
//                         openedf.com
//                     Copyright 2023-2024
//
//                     makermuyi@gmail.com
//
//                       License: BSD
//--------------------------------------------------------------------------
//
// Copyright (c) 2020-2021, openedf.com
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
// SUCH DAMAGE.

//--------------------------------------------------------------------------
// Designer: macro
// Brief: testbench for sequential multiplier
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module testbench();
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
reg         clk;
reg         rst_n;
reg  [31:0] multiplier;
reg  [31:0] multiplicand;
reg         start;
wire [31:0] product_l;
wire [31:0] product_h;
wire        ready;

reg [31:0] test_count;
reg [63:0] test_product;

//--------------------------------------------------------------------------
// Design: create the clock
//--------------------------------------------------------------------------
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

//--------------------------------------------------------------------------
// Design: initial
//--------------------------------------------------------------------------
initial begin
    rst_n = 1'b0;
    start = 1'b0;
    test_count = 32'h0000_0000;
    test_product = 64'h0000_0000_0000_0000;
    #10
    rst_n = 1'b1;

    #10
    while (test_count < 32'd4) begin
        @(posedge clk)
            start = 1'b1;
            multiplier   = $random();
            multiplicand = $random();
            test_product = multiplier * multiplicand;
        @(posedge clk)
            start = 1'b0;

        /* wait the ready */
        wait (ready) begin
            if ((product_h == test_product[63:32]) && (product_l == test_product[31:0])) begin
                $display("[PASS] 0x%h * 0x%h = 0x%h 0x%h ", multiplier, multiplicand, product_h, product_l);
            end else begin
                $display("[FAIL] 0x%h * 0x%h = 0x%h 0x%h, result= 0x%h",
                    multiplier, multiplicand, product_h, product_l, test_product);
            end
        end
        test_count = test_count + 1;
    end
    #20
    $finish();
end

//--------------------------------------------------------------------------
// Design: dump .fsdb file
//--------------------------------------------------------------------------
initial begin
    $fsdbDumpfile("testbench.fsdb");
    $fsdbDumpvars(0, testbench);
end

//--------------------------------------------------------------------------
// Design: instance sequ multi
//--------------------------------------------------------------------------
sequ_multi sequ_multi_u0 (
   .clk             (clk),
   .rst_n           (rst_n),
   .multiplier      (multiplier),
   .multiplicand    (multiplicand),
   .start           (start),

   .product_l       (product_l),
   .product_h       (product_h),
   .ready           (ready)
);

endmodule
//--------------------------------------------------------------------------
