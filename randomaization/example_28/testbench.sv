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
// Brief: randomination
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module testebench;
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
bit [31:0] addr1;
bit [31:0] addr2;
bit [31:0] addr3;
bit [31:0] data;

//--------------------------------------------------------------------------
// Design: initial and create 
//--------------------------------------------------------------------------
initial begin
    addr1 = $urandom();
    addr2 = $urandom(89);
    addr3 = {$urandom(), $urandom()};
    data  = $urandom() * 6;

    $display("addr1 = %0d, addr2 = %0d, addr3 = %0d, data = %0d", addr1, addr2, addr3, data);

    addr1 = $urandom_range(30, 20);
    addr2 = $urandom_range(20);
    addr3 = $urandom_range(20, 30);
    $display("addr1 = %0d, addr2 = %0d, addr3 = %0d, data = %0d", addr1, addr2, addr3, data);
end

endmodule
//--------------------------------------------------------------------------
