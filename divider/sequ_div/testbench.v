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
reg  [31:0] divider;
reg  [31:0] dividend;
reg         start;
wire [31:0] quotient;
wire [31:0] remainder;
wire        ready;
wire        illegal_divider_zero;

reg  [31:0]  test_count;
reg  [31:0] test_quotient;
reg  [31:0] test_remainder;

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
    test_count = 8'd0;
    #10
    rst_n = 1'b1;

    /* while test */
    while (test_count < 32'd1000) begin
        @(posedge  clk)
            start = 1'b1;
            dividend = $random();
            divider = $random();
            test_quotient  = dividend / divider;
            test_remainder = dividend % divider;
        @(posedge clk)
            start = 1'b0;

        /* wait the reday */
        wait (ready) begin
            #10
            if ((test_quotient == quotient) && (test_remainder == remainder)) begin
                $display("[pass] 0x%h / 0x%h = 0x%h...0x%h illegal: %b ", dividend,
                        divider, quotient, remainder, illegal_divider_zero);
            end else begin
                $display("[fail] 0x%h / 0x%h = 0x%h...0x%h illegal: %b ", dividend,
                        divider, quotient, remainder, illegal_divider_zero);
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
// Design: instance sequ div
//--------------------------------------------------------------------------
sequ_div sequ_div_u0 (
   .clk             (clk),
   .rst_n           (rst_n),
   .divider         (divider),
   .dividend        (dividend),
   .start           (start),

   .quotient        (quotient),
   .remainder       (remainder),
   .ready           (ready),
   .illegal_divider_zero (illegal_divider_zero)
);

endmodule
//--------------------------------------------------------------------------
