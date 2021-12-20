/* what is class in systemverilog and how to use? */
/* define class */
class myPacket;
    bit [2:0] header;
    bit       encode;
    bit [2:0] mode;
    bit [7:0] data;
    bit       stop;

    static integer static_data = 19;
    integer test_data = 20;
    const integer const_data = 20;

    function new (bit [2:0] header = 3'h1, bit [2:0] mode = 5);
        $display("The new is auto run.");
        this.header = header;
        this.encode = 0;
        this.mode   = mode;
        this.stop   = 1;
        //header = header;   // ok run
        //encode = 0;
        //mode   = mode;
        //stop   = 1;
    endfunction

    task clean();
        $display("Clean class.");
        header = 0;
        mode   = 0;
        mode   = 0;
        stop   = 0;
    endtask

    function display ();
        $display("Header = 0x%0h, Encode = %0b, Mode = 0x%0h, Stop = %0b",
                this.header, this.encode, this.mode, this.stop);
    endfunction

    virtual function integer test_virtual(bit [7:0] a, bit [7:0] b);
        $display("The null function.");
        $display("The b - a = %d", (b - a));
    endfunction
endclass


// new custom_packet
class custom_packet #(bit[7:0] def_data) extends myPacket;
    bit [31:0] new_custom_data = 32'hFFFFFFFF;
    static bit [7:0] data = def_data;
    function new ();
        new_custom_data = 32'hAAAAAAAA;
        $display("The subclass test data = 0x%X.", new_custom_data);
    endfunction

    function modify_new(bit [31:0] addr);
        new_custom_data = addr + super.test_data;  // ok run
        new_custom_data = addr + super.static_data;  // ok run
        $display("The new address is 0x%X.\n", new_custom_data);
    endfunction

    function integer test_virtual(bit [7:0] a, bit [7:0] b);
        $display("The virtual function run. ");
        return (a + b);
        // test_virtual = a + b;
    endfunction 
endclass

/* object class instance */

module tb_top;
    custom_packet #(8'hFF) cust = new;
    myPacket pkt0, pkt1;
    myPacket pkt2 = cust;

    initial begin
        $display("The static data test: %d\n", pkt0.static_data);
        //$display("The static data test: %d\n", pkt1.test_data); // Error-[NOA] Null object access
        pkt0 = new (3'h2, 2'h3);
        pkt0.display();
        pkt0.clean();
        pkt0.display();

        pkt1 = new();
        $display("The global data test: %d\n", pkt1.const_data);
        //pkt1.const_data = 1;  //Error-[IUCV] Invalid use of 'const'
        //pkt1 = new;    //ok run
        pkt1.display();

        // custom packet
        cust.modify_new(32'h10001000);
        $display("The virtual function test = %d", cust.test_virtual(8'h1, 8'h2));
        pkt2.test_virtual(8'h1, 8'h2);
        $display("The parameters test is %x", cust.data);
    end

endmodule
/* declare and create */

/* init */
