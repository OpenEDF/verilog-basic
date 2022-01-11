// inline constraints
class Item;
    rand bit [7:0] id;
    constraint c_id { id < 25; }
endclass

module test;
    initial begin
        Item itm = new();
        itm.randomize() with { id == 10; };
        for (int i = 0; i < 10; i++) begin
            $display("Item Id = %0d", itm.id);
        end 
    end

endmodule
