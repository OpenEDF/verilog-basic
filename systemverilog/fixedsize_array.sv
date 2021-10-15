module fixedsize_array;
  //declaration of array’s
  int array1[6];               //single dimension array
  int array2[5:0];             //single dimension array
  int array3[2:0][3:0];        //multi dimension array
  int array4[4:0];
 
initial begin
    //array initialization
    array1 = '{0,1,2,3,4,5};
    array2 = '{0,1,2,3,4,5};
    array3 = '{'{0,1,2,3},'{4,5,6,7},'{8,9,10,11}};
 
    //displaying array elements
    $display("-------displaying array1-------");
    foreach(array1[i]) $display("\t array1[%0d] = %0d",i,array1[i]);
 
    $display("-------displaying array2-------");
    for(int i=0;i<6;i++) $display("\t array2[%0d] = %0d",i,array2[i]);
 
    $display("-------displaying array3-------");
    foreach(array3[i,j]) $display("\t array3[%0d][%0d] = %0d",i,j,array3[i][j]);
 
    $display("-------displaying uninitialized array4-------");
    for(int i=0;i<5;i++) $display("\t array4[%0d] = %0d",i,array4[i]);
end

endmodule
