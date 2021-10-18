module fixedsize_array;
  //declaration of array’s
  int array[2];               //single dimension array

initial begin
    //array initialization
    array[0] = 258;
    array[1] = 369;
 
    //displaying array elements
    $display("-------displaying array-------");
    foreach(array[i]) $display("\t array1[%0d] = %0d",i,array[i]);
end

endmodule
