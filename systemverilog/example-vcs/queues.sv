/* queues */
module quesus;

// declare queues
byte q1[$];
string names[$] = { "Macro" };
integer Q[$] = {1, 8, 99, 456};
bit q2[$: 255];
string tmp;

initial begin
    q1.insert(0, 10);
    $display("The q1[0] = 0x%x size = %0d.\n", q1[0], q1.size);
    names.push_front("Bob");
    names.push_back("Lids");
    $display("The names[0] = %s names[1] = %s names[2] = %s.\n", names[0], names[1], names[2]);
    tmp = names.pop_back();
    $display("The tmp = %s.\n", tmp);
    $display("The names[0] = %s names[1] = %s names[2] = %s.\n", names[0], names[1], names[2]);
    tmp = names.pop_front;
    $display("The tmp = %s.\n", tmp);
    $display("The names[0] = %s names[1] = %s names[2] = %s.\n", names[0], names[1], names[2]);

    // loop print
    Q.delete(3);
    for (int index; index < Q.size; index++)
        $display("%0d", Q[index]);
    //q2.insert(256, 10);
end

endmodule
