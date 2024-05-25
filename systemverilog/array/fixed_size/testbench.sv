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
program tb_top;

//--------------------------------------------------------------------------
// Design: declaration data type
//--------------------------------------------------------------------------
int array1[6];               //single dimension array
int array2[5:0];             //single dimension array
int array3[2:0][3:0];        //multi dimension array
int array4[4:0];

//--------------------------------------------------------------------------
// Design: inital
//--------------------------------------------------------------------------
initial begin
    // array initialization
    array1 = '{0, 1, 2, 3, 4, 5};
    array2 = '{0, 1, 2, 3, 4, 5};
    array3 = '{'{0, 1, 2, 3}, '{4, 5, 6, 7}, '{8, 9, 10, 11}};
    
    // displaying array elements
    $display("-------displaying array1-------");
    foreach(array1[i]) 
        $display("\t array1[%0d] = %0d",i,array1[i]);
    
    $display("-------displaying array2-------");
    for(int i=0 ;i<6; i++) 
        $display("\t array2[%0d] = %0d",i,array2[i]);
    
    $display("-------displaying array3-------");
    foreach(array3[i,j])
        $display("\t array3[%0d][%0d] = %0d",i,j,array3[i][j]);
   
    $display("-------displaying uninitialized array4-------");
    for(int i=0; i<5; i++)
        $display("\t array4[%0d] = %0d",i,array4[i]);
end

endprogram
//--------------------------------------------------------------------------
