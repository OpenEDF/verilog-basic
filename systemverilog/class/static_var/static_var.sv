//--------------------------------------------------------------------------
//                      systemverilog calss
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
// Brief: systemverilog class test
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
class static_var;
//--------------------------------------------------------------------------
// Design:class properties 
//--------------------------------------------------------------------------
byte packet_id;
  
//static property to keep track of number of pkt's created
static byte no_of_pkts_created;

//--------------------------------------------------------------------------
// Design: constructor
//--------------------------------------------------------------------------
function new();
    //incrementing pkt count on creating an object
    no_of_pkts_created++;
    packet_id = no_of_pkts_created;
endfunction

//--------------------------------------------------------------------------
// Design: disply class prperties
//--------------------------------------------------------------------------
function void display();
    $display("--------------------------------------");
    $display("\t packet_id  = %0d",packet_id);
    $display("--------------------------------------");
endfunction 

endclass: static_var
//--------------------------------------------------------------------------

