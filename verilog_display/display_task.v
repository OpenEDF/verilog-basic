// # 1. Verilog File Header:
//--------------------------------------------------------------------------
//                         RISC-V Core
//                            V1.0.1
//                         openedf.com
//                     Copyright 2020-2021
//
//                     makermuyi@gmail.com
//
//                       License: BSD
//--------------------------------------------------------------------------
//
// Copyright (c) 2020-2021, openedf.com
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//   - Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//   - Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer
//     in the documentation and/or other materials provided with the
//     distribution.
//   - Neither the name of the author nor the names of its contributors
//     may be used to endorse or promote products derived from this
//     software without specific prior written permission.
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
// Note:
// Bref:
// Inputs:
// Outputs:
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module display_task;
//--------------------------------------------------------------------------
// Params
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Design: test $diplay $store 
//--------------------------------------------------------------------------
initial begin
    reg [7:0] a;
    reg [7:0] b;

    a = 8'h12;
    b = 8'h34;

    #10;
    b <= a + 8'h1;
    $display("[%0t display]: a = 8'h%0h b= 8'h%0h", $time, a, b);
    $storbe("[%0t storbe]: a = 8'h%0h b= 8'h%0h", $time, a, b);

    #1;
    $display("[%0t display]: a = 8'h%0h b= 8'h%0h", $time, a, b);
    $storbe("[%0t storbe]: a = 8'h%0h b= 8'h%0h", $time, a, b);
end

endmodule
//--------------------------------------------------------------------------
