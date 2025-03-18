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
reg         sys_clk;
reg         rst_n;
reg         hclk;
reg         pclk;
reg         pclk_en;
integer     test_count;

//--------------------------------------------------------------------------
// Design: create the clock
//--------------------------------------------------------------------------
initial begin
    sys_clk = 1'b0;
    forever #5 sys_clk = ~sys_clk;
end

//--------------------------------------------------------------------------
// Design: initial
//--------------------------------------------------------------------------
initial begin
    rst_n = 1'b0;
    test_count = 0;
    #15
    rst_n = 1'b1;

    $timeformat(-9, 2, "ns");
    while (test_count < 10000) begin
        fork
            begin
            /* check hclk */
                @(posedge sys_clk);
                if (hclk == 1'b1) begin
                    $display("[%0t][PASS] HCLK OK", $time);
                end else begin
                    $display("[%0t][FAILED] HCLK ERROR", $time);
                end
            end

            begin
            /* check pclk */
                @(posedge sys_clk);
                @(posedge sys_clk);
                if (pclk == 1'b1) begin
                    $display("[%0t][PASS] PCLK OK", $time);
                end else begin
                    $display("[%0t][FAILED] PCLK ERROR", $time);
                end

            end

            begin
            /* check pclk_en */
                @(posedge sys_clk);
                if (pclk_en == 1'b1) begin
                    $display("[%0t][PASS] PCLK ENABLE OK", $time);
                end else begin
                    $display("[%0t][FAILED] PCLK ENABLE ERROR", $time);
                end
                @(posedge sys_clk);
                @(posedge sys_clk);
                @(posedge sys_clk);
            end
        join

        test_count++;
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
// Design: instance clock division
//--------------------------------------------------------------------------
clock_div #(
    /*autoinstparam*/
        .DIVISION               (2                              )
    )
clock_div_u0 (
    /*autoinst*/
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // inputs
        .sys_clk                (sys_clk                        ), //input
        .rst_n                  (rst_n                          ), //input
        // outputs
        .hclk                   (hclk                           ), //output
        .pclk                   (pclk                           ), //output
        .pclk_en                (pclk_en                        )  //output
);

endmodule
//--------------------------------------------------------------------------
