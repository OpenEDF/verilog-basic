// uvm reg
class reg_ctl extends uvm_reg;

    rand uvm_reg_field En;
    rand uvm_reg_field Mode;
    rand uvm_reg_field Halt;
    rand uvm_reg_field Auto;
    rand uvm_reg_field Speed;
   
    function new (string name = "reg_ctl");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        this.En    = uvm_reg_field::type_id::create("En");
        this.Mode  = uvm_reg_field::type_id::create("Mode");
        this.Halt  = uvm_reg_field::type_id::create("Halt");
        this.Auto  = uvm_reg_field::type_id::create("Auto");
        this.Speed = uvm_reg_field::type_id::create("Speed");
        
        this.En.co!nfigure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
        this.Mode.configure(this, 3, 1, "RW", 0, 1'h2, 1, 1, 1);
        this.Halt.configure(this, 1, 4, "RW", 0, 1'h1, 1, 1, 1);
        this.Auto.configure(this, 1, 5, "RW", 0, 1'h0, 1, 1, 1);
        this.Speed.configure(this, 5, 11, "RW", 0, 1'h5, 1, 1, 1);
    endfunction

endclass
