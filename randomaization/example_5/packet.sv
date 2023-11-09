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
// Brief: randomination object
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// class
//--------------------------------------------------------------------------
class packet;

//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
rand  bit [7:0] addr;
randc bit       wr_rd;
randc bit       wr_rd_tmp;

//--------------------------------------------------------------------------
// Design: per randomization function
//--------------------------------------------------------------------------
function void pre_randomize();
    if (wr_rd_tmp == 1) 
        addr.rand_mode(0);
    else 
        addr.rand_mode(1);
endfunction

//--------------------------------------------------------------------------
// Design: post randomination function 
//--------------------------------------------------------------------------
function void post_randomize();
    wr_rd_tmp = wr_rd;
    $display("time: %0t addr = %0d \t wr_rd = %0d", $time, addr, wr_rd);
endfunction
endclass
//--------------------------------------------------------------------------
