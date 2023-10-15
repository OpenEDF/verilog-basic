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
// Brief: testbenchi systemverilog assertions
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
bit clk;
bit rst_n;

//--------------------------------------------------------------------------
// Interface
//--------------------------------------------------------------------------
test_intf intf(clk, rst_n);
fun_cover test_cover = new(intf.cover_intf);

//--------------------------------------------------------------------------
// Design: instance function coverage module
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Design: create the clock
//--------------------------------------------------------------------------
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

//--------------------------------------------------------------------------
// Design: driver all coverage test
//--------------------------------------------------------------------------
// start driver
initial begin
    /* basic coverage driver */
    basic_driver();

    /* coverage test cov5 feature 1 */
    feat1_driver();

    /* coverage test cov5 feature 2 */
    feat2_driver();

    /* coverage test cov5 feature 3 */
    feat3_driver();

    /* coverage test cov5 feature 4 */
    feat4_driver();

    /* coverage test cov5 feature 5 */
    feat5_driver();

    /* coverage test cov5 feature 6 */
    feat6_driver();

    /* coverage test cov5 feature 7 */
    feat7_driver();

    /* coverage test cov5 feature 8 */
    feat8_driver();

    /* coverage test cov5 feature 9 */
    feat9_driver();
    /* end info */
    #10
    rst_n = 1'b0;
    test_cover.cov1.stop();

    #20
    $display("Coverage cov1 = %0.2f %%", test_cover.cov1.get_coverage());
    $display("Coverage cov2 = %0.2f %%", test_cover.cov2.get_coverage());
    $display("Coverage cov3 = %0.2f %%", test_cover.cov3.get_coverage());
    $display("Coverage cov4 = %0.2f %%", test_cover.cov4.get_coverage());
    $display("Coverage cov5 = %0.2f %%", test_cover.cov5.get_coverage());
    $display("Coverage cov6 = %0.2f %%", test_cover.cov6.get_coverage());
    $display("Coverage cov7 = %0.2f %%", test_cover.cov7.get_coverage());
    $display("Coverage cov8 = %0.2f %%", test_cover.cov8.get_coverage());
    $display("Coverage cov9 = %0.2f %%", test_cover.cov9.get_coverage());
    $display("Coverage cov10 = %0.2f %%", test_cover.cov10.get_coverage());
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
// Design: instance design module
//--------------------------------------------------------------------------
cover_dut cover_dut_u (
    // inputs
    .clk         (clk),
    .rst_n       (rst_n),
    .a_in        (intf.a_in),
    .b_in        (intf.b_in),

    // outputs
    .c_ou        (intf.c_ou),
    .d_ou        (intf.d_ou)
);

//--------------------------------------------------------------------------
// Design: initial for coverage sample
//--------------------------------------------------------------------------
//TODO: macro, coverage is 0.00%
initial begin
    test_cover.cov2.sample();
end

//--------------------------------------------------------------------------
// Design: driver task and initial
//--------------------------------------------------------------------------
task basic_driver();
begin
    rst_n = 1'b0;
    test_cover.cov1.stop();
    #10
    rst_n = 1'b1;
    test_cover.cov1.start();

    repeat(200) begin
        @(posedge clk)
        intf.a_in = $random;
        intf.b_in = $random;
    end
end
endtask

//--------------------------------------------------------------------------
// Design: bins feature 1 driver
//--------------------------------------------------------------------------
task feat1_driver();
begin
    logic [4:0] values[$] = '{1, 3, 5, 6};
    foreach(values[index]) begin
        @(posedge clk)
        intf.b_in = values[index];
    end
end
endtask

//--------------------------------------------------------------------------
// Design: bins feature 2 driver
//--------------------------------------------------------------------------
task feat2_driver();
begin
    logic [4:0] values[$] = '{20, 21, 1, 0, 5};
    foreach(values[index]) begin
        @(posedge clk)
        intf.b_in = values[index];
    end
end
endtask

//--------------------------------------------------------------------------
// Design: bins feature 3 driver
//--------------------------------------------------------------------------
task feat3_driver();
begin
    logic [4:0] values[$] = '{3, 22, 1, 3, 31, 5, 16, 22, 9, 16, 31, 0};
    foreach(values[index]) begin
        @(posedge clk)
        intf.b_in = values[index];
    end
end
endtask

//--------------------------------------------------------------------------
// Design: bins feature 4 driver
//--------------------------------------------------------------------------
task feat4_driver();
begin
    logic [4:0] values[$] = '{16, 16, 16, 16};
    foreach(values[index]) begin
        @(posedge clk)
        intf.b_in = values[index];
    end
end
endtask

//--------------------------------------------------------------------------
// Design: bins feature 5 driver
//--------------------------------------------------------------------------
task feat5_driver();
begin
    logic [4:0] values[$] = '{1, 1, 1, 1, 3};
    foreach(values[index]) begin
        @(posedge clk)
        intf.b_in = values[index];
    end
end
endtask

//--------------------------------------------------------------------------
// Design: bins feature 6 driver
//--------------------------------------------------------------------------
task feat6_driver();
begin
    logic [4:0] values[$] = '{2, 3, 4, 6, 5, 6, 7, 6, 31};
    foreach(values[index]) begin
        @(posedge clk)
        intf.b_in = values[index];
    end
end
endtask

//--------------------------------------------------------------------------
// Design: bins feature 7 driver
//--------------------------------------------------------------------------
task feat7_driver();
begin
    logic [4:0] values[$] = '{2, 3, 4, 15, 5, 15, 7, 15, 3, 4, 7, 31};
    foreach(values[index]) begin
        @(posedge clk)
        intf.b_in = values[index];
    end
end
endtask

//--------------------------------------------------------------------------
// Design: bins feature 8 driver
//--------------------------------------------------------------------------
task feat8_driver();
begin
    logic [4:0] values[$] = '{1, 2, 3, 4, 5};
    foreach(values[index]) begin
        @(posedge clk)
        intf.b_in = values[index];
    end
end
endtask

//--------------------------------------------------------------------------
// Design: bins feature 9 driver
//--------------------------------------------------------------------------
task feat9_driver();
begin
    logic [4:0] values[$] = '{1, 3, 5, 6};
    foreach(values[index]) begin
        @(posedge clk)
        intf.a_in = values[index];
    end
end
endtask
endmodule
//--------------------------------------------------------------------------
