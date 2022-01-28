//register file, 32 registers of 32bits

//allows to have unused signals
/* verilator lint_off UNUSED */

//format of sw
//imm[11:5] rs2 rs1 "010" imm[4:0] 0100011

//lw
//imm[11:0] rs1[19:15] "010"[14:12] rd[11:7] 0000011[6:0]

//add
//0000000 rs2 rs1 "000" rd 0110011

module simple_cpu(
clk, reset, read_req, read_addr, read_data, read_data_valid, write_req, write_addr, write_data, memory_mask, error_instruction, debug
);

input wire clk;
input wire reset;
output reg read_req;
output reg [31:0] read_addr;
input wire [31:0] read_data;
input wire read_data_valid;
output reg write_req;
output reg [31:0] write_addr;
output reg [31:0] write_data;
output reg [3:0] memory_mask;
output reg error_instruction;
output reg [31:0] debug;

reg read_1_en;
reg read_2_en;
reg [4:0] read_reg_1;
reg [4:0] read_reg_2;
reg [4:0] write_reg;
reg [31:0] reg_write_data;
reg write_en;
wire [31:0] data_out_1;
wire [31:0] data_out_2;

reg [31:0] pc;
reg misaligned_load;

register_file register_file_inst(
.clk(clk), .reset(reset), .rd_1_en(read_1_en), .rd_2_en(read_2_en), .read_reg_1(read_reg_1), .read_reg_2(read_reg_2), .write_reg(write_reg), .write_data(reg_write_data), .write_en(write_en), .data_out_1(data_out_1), .data_out_2(data_out_2)
);

reg [7:0] state; //main state machine of the cpu
reg [7:0] future_state; //used when we have a buffer state
reg [31:0] instruction_sav;
reg [31:0] jump_add_reg;

//states
parameter IDLE = 0, IF_MEM = IDLE+1, ID = IF_MEM+1, ID_BUF = ID+1,
          EX_LD = ID_BUF+1, MEM_LD = EX_LD+1, WB_LD = MEM_LD+1,
          EX_R = WB_LD+1, MEM_R=EX_R+1, WB_R = MEM_R+1,
          EX_S=WB_R+1, MEM_S=EX_S+1, WB_S = MEM_S+1,
          EX_IR=WB_S+1, MEM_IR=EX_IR+1, WB_IR=MEM_IR+1,
          EX_J=WB_IR+1, MEM_J=EX_J+1, WB_J=MEM_J+1,
          EX_UPC=WB_J+1, MEM_UPC=EX_UPC+1, WB_UPC=MEM_UPC+1,
          EX_LUI=WB_UPC+1, MEM_LUI=EX_LUI+1, WB_LUI=MEM_LUI+1,
          EX_JALR=WB_LUI+1, MEM_JALR=EX_JALR+1, WB_JALR=MEM_JALR+1,
          EX_BR=WB_JALR+1, MEM_BR=EX_BR+1, WB_BR=MEM_BR+1,
          EX_SYS=WB_BR+1, MEM_SYS=EX_SYS+1, WB_SYS=MEM_SYS+1;
//states: IF(MEM), REG, ALU, REG/MEM


reg [31:0] alu_in1;
reg [31:0] alu_in2;
reg [3:0] alu_control;
wire [31:0] alu_out;
wire alu_zero;
wire alu_neg;

//some csr regisers, only to pass compliance tests:
parameter mscratch = 0, mtvec = mscratch+1, mepc = mtvec+1, mcause = mepc+1, mtval = mcause+1;
reg [31:0] CSRegs [0:mtval];


alu alu_inst(
.in1(alu_in1), .in2(alu_in2), .control(alu_control), .out(alu_out), .zero(alu_zero), .neg(alu_neg)
);

initial begin
   read_req = 1'b0;
   read_addr = 32'b0;
   write_req = 1'b0;
   write_addr = 32'b0;
   write_data = 32'b0;

   read_1_en = 1'b0;
   read_2_en = 1'b0;
   read_reg_1 = 5'b0;
   read_reg_2 = 5'b0;
   write_reg = 5'b0;
   write_data = 32'b0;
   write_en = 1'b0;

   pc = 32'b0;
   memory_mask = 4'b0;

   error_instruction = 1'b0;
   debug = 32'b1;

   state = IF_MEM;
end

//assign pc_in = pc_out+4;
//assign read_addr = pc_out[11:0];

always @(posedge clk)
begin : main
   //local variables
   reg[31:0] offset;
   reg[31:0] src;
   reg[31:0] csr_idx;

   if(reset == 1) begin
      read_req <= 1'b0;
      read_addr <= 32'b0;
      write_req <= 1'b0;
      write_addr <= 32'b0;
      write_data <= 32'b0;

      read_1_en <= 1'b0;
      read_2_en <= 1'b0;
      read_reg_1 <= 5'b0;
      read_reg_2 <= 5'b0;
      write_reg <= 5'b0;
      write_data <= 32'b0;
      write_en <= 1'b0;

      pc <= 32'b0;
      memory_mask <= 4'b0;

      error_instruction <= 1'b0;
      debug <= 32'b1;

      state <= IF_MEM;
   end else begin

      //default
      read_1_en <= 1'b0;
      read_2_en <= 1'b0;
      read_req <= 1'b0;
      write_req <= 1'b0;
      write_en <= 1'b0;
      read_addr <= pc[31:0];
      memory_mask <= 4'b1111;
      misaligned_load <= 1'b0;

      case (state)
      IF_MEM: begin
         //verify that instruction fetch is aligned
         if(pc[1:0] == 2'b00) begin
            pc <= pc+4;
            read_req <= 1'b1;
            state <= ID;
         end else begin //jump to mtvec
            pc <= CSRegs[mtvec];
            CSRegs[mepc] <= pc;
            CSRegs[mtval] <= pc;
            state <= IF_MEM;
         end
      end
      ID: begin
         //main decoder
         if( read_data_valid == 1'b1) begin
            instruction_sav <= read_data;
            state <= ID_BUF;
            if ( read_data[6:0] == 7'b0000011) begin //load opcode
               read_1_en <= 1'b1;
               read_reg_1 <= read_data[19:15];
               future_state <= EX_LD;
            end else if ( read_data[6:0] == 7'b0110011 ) begin // R type op (add and so)
               read_1_en <= 1'b1;
               read_2_en <= 1'b1;
               read_reg_1 <= read_data[19:15];
               read_reg_2 <= read_data[24:20];
               future_state <= EX_R;
            end else if ( read_data[6:0] == 7'b0100011 ) begin //S type op (store)
               read_1_en <= 1'b1;
               read_reg_1 <= read_data[19:15];
               future_state <= EX_S;
            end else if ( read_data[6:0] == 7'b0010011 ) begin //math op immediate
               read_1_en <= 1'b1;
               read_reg_1 <= read_data[19:15];
               future_state <= EX_IR;
            end else if ( read_data[6:0] == 7'b1101111 ) begin // JAL
               future_state <= EX_J;
            end else if ( read_data[6:0] == 7'b0010111 ) begin //auipc
               future_state <= EX_UPC;
            end else if ( read_data[6:0] == 7'b0110111 ) begin //lui
               read_1_en <= 1'b1;
               read_reg_1 <= read_data[11:7];
               future_state <= EX_LUI;
            end else if ( read_data[6:0] == 7'b1100111 ) begin //jalr
               read_1_en <= 1'b1;
               read_reg_1 <= read_data[19:15];
               future_state <= EX_JALR;
            end else if ( read_data[6:0] == 7'b1100011 ) begin //branch
               read_1_en <= 1'b1;
               read_2_en <= 1'b1;
               read_reg_1 <= read_data[19:15];
               read_reg_2 <= read_data[24:20];
               future_state <= EX_BR;
            end else if ( read_data[6:0] == 7'b1110011 ) begin // system
               read_1_en <= 1'b1;
               read_reg_1 <= read_data[19:15];
               future_state <= EX_SYS;
            end else begin //not recognized
               error_instruction <= 1'b1;
               future_state <= IF_MEM;
            end
         end else begin
            read_req <= 1'b1;
            read_addr <= pc[31:0]-4; //pc has been incremented, but still need old instr
         end
      end
      ID_BUF: begin //register file has 1clock delay, wait for the data read last state ....
         state <= future_state;
         if(future_state == EX_S) begin
            read_1_en <= 1'b1;
            read_reg_1 <= instruction_sav[24:20]; //load the reg for next cycle
         end
      end
      EX_LD: begin
         //add the output of register with immediate
         alu_in1 <= data_out_1;
         alu_in2 <= {{20{instruction_sav[31]}}, instruction_sav[31:20]};
         alu_control <= 4'b0; //add
         state <= MEM_LD;
      end
      MEM_LD: begin
         read_addr <= alu_out[31:0];
         if(instruction_sav[14:12] == 3'b000 || instruction_sav[14:12] == 3'b100) begin //LB || LBU
            memory_mask <= 4'b0001;
            read_req <= 1'b1;
         end else if (instruction_sav[14:12] == 3'b001 || instruction_sav[14:12] == 3'b101) begin //LH || LHU
            memory_mask <= 4'b0011;
            if (alu_out[0] == 1'b0) begin //check alignment
               read_req <= 1'b1;
            end else begin
               misaligned_load <= 1'b1;
               pc <= CSRegs[mtvec];
               CSRegs[mepc] <= pc-4;
               CSRegs[mtval] <= alu_out;
               CSRegs[mcause] <= 32'd4; //4 =  load misaligned
            end
         end else if (instruction_sav[14:12] == 3'b010) begin //LW
            memory_mask <= 4'b1111;
            if (alu_out[1:0] == 2'b0) begin //check alignment
               read_req <= 1'b1;
            end else begin
               misaligned_load <= 1'b1;
               pc <= CSRegs[mtvec];
               CSRegs[mepc] <= pc-4;
               CSRegs[mtval] <= alu_out;
               CSRegs[mcause] <= 32'd4; //4 =  load misaligned
            end
         end
         state <= WB_LD;
      end
      WB_LD: begin
         if( read_data_valid == 1'b1) begin
            if(instruction_sav[14:12] == 3'b000) begin //LB
               reg_write_data <= { {24{read_data[7]}}, read_data[7:0] };
            end else if (instruction_sav[14:12] == 3'b001) begin //LH
               reg_write_data <= { {16{read_data[15]}}, read_data[15:0] };
            end else if (instruction_sav[14:12] == 3'b010) begin //LW
               reg_write_data <= read_data[31:0];
            end else if (instruction_sav[14:12] == 3'b100) begin //LBU
               reg_write_data <= {24'b0, read_data[7:0]};
            end else if (instruction_sav[14:12] == 3'b101) begin //LHU
               reg_write_data <= {16'b0, read_data[15:0]};
            end
            // debug <= read_data[31:0];
            write_reg <= instruction_sav[11:7];
            write_en <= 1'b1;
            state <= IF_MEM;
         end else if ( misaligned_load == 1'b1 ) begin //if misaligned, bypass this
            state <= IF_MEM;
         end else begin
            read_req <= 1'b1;
            read_addr <= read_addr;
         end
      end
      EX_R: begin
         alu_in1 <= data_out_1;
         alu_in2 <= data_out_2;
         alu_control <= {instruction_sav[30], instruction_sav[14:12]};
         state <= MEM_R;
      end
      MEM_R: begin //nothing to save to memory for R instructions
         state <= WB_R;
      end
      WB_R: begin
         reg_write_data <= alu_out;
         write_reg <= instruction_sav[11:7];
         write_en <= 1'b1;
         state <= IF_MEM;
      end
      EX_S: begin
         //add the output of register with immediate
         alu_in1 <= data_out_1;
         // debug <= data_out_1;
         alu_in2 <= { {20{instruction_sav[31]}}, instruction_sav[31:25], instruction_sav[11:7]}; //need to sign extend the constant
         alu_control <= 4'b0; //add
         //read_reg_2 <= 5'h0;
         state <= MEM_S;
      end
      MEM_S: begin
         if(instruction_sav[14:12] == 3'b000) begin //SB
            memory_mask <= 4'b0001;
            write_req <= 1'b1;
         end else if (instruction_sav[14:12] == 3'b001) begin //SH
            memory_mask <= 4'b0011;
            if (alu_out[0] == 1'b0) begin //check alignment
               write_req <= 1'b1;
            end else begin
               pc <= CSRegs[mtvec];
               CSRegs[mepc] <= pc-4;
               CSRegs[mtval] <= alu_out;
               CSRegs[mcause] <= 32'd6; //6 =  store misaligned
            end
         end else if (instruction_sav[14:12] == 3'b010) begin //SW
            memory_mask <= 4'b1111;
            if (alu_out[1:0] == 2'b00) begin //check alignment
               write_req <= 1'b1;
            end else begin
               pc <= CSRegs[mtvec];
               CSRegs[mepc] <= pc-4;
               CSRegs[mtval] <= alu_out;
               CSRegs[mcause] <= 32'd6; //6 =  store misaligned
            end
         end
         write_addr <= alu_out[31:0];
         write_data <= data_out_1;
         // debug <= data_out_1;
         state <= WB_S;
      end
      WB_S : begin
         state <= IF_MEM;
      end
      EX_IR: begin
         alu_control <= {1'b0, instruction_sav[14:12]};
         alu_in1 <= data_out_1;
         if(instruction_sav[14:12] == 3'b000 || instruction_sav[14:12] == 3'b100 || instruction_sav[14:12] == 3'b110|| instruction_sav[14:12] == 3'b111
         || instruction_sav[14:12] == 3'b010 || instruction_sav[14:12] == 3'b011) begin //add, sign extend
            alu_in2 <= { {20{instruction_sav[31]}}, instruction_sav[31:20]};
         end else if(instruction_sav[14:12] == 3'b001 || instruction_sav[14:12] == 3'b101) begin //slli srli or srai
            alu_in2 <= {27'b0, instruction_sav[24:20]};
            alu_control <= {instruction_sav[30], instruction_sav[14:12]};
         end else begin
            alu_in2 <= {20'b0, instruction_sav[31:20]};
         end
         state <= MEM_IR;
      end
      MEM_IR: begin
         state <= WB_IR;
      end
      WB_IR: begin
         reg_write_data <= alu_out;
         //  debug <= alu_out;
         write_reg <= instruction_sav[11:7];
         write_en <= 1'b1;
         state <= IF_MEM;
      end
      EX_J: begin
         jump_add_reg <= pc + {{11{instruction_sav[31]}}, instruction_sav[31], instruction_sav[19:12], instruction_sav[20], instruction_sav[30:21], 1'b0};
         state <= MEM_J;
      end
      MEM_J: begin
         //pc <= 32'hcafe;
         state <= WB_J;
      end
      WB_J: begin //jal write the pc+4 to the memory (so pc in this case)
         reg_write_data <= pc; //keep previous address
         pc <= jump_add_reg-4;
         write_reg <= instruction_sav[11:7];
         write_en <= 1'b1;
         state <= IF_MEM;
      end
      EX_UPC: begin
         alu_in1 <= (pc-4);
         alu_in2 <= {instruction_sav[31:12], 12'b0};
         //alu_in2 <= 32'h4000;
         alu_control <= 4'b0; //add
         state <= MEM_UPC;
      end
      MEM_UPC: begin
         state <= WB_UPC;
      end
      WB_UPC: begin
         reg_write_data <= alu_out;
         //reg_write_data <= 32'h0200;
         write_reg <= instruction_sav[11:7];
         write_en <= 1'b1;
         state <= IF_MEM;
      end
      EX_LUI: begin
         state <= MEM_LUI;
      end
      MEM_LUI: begin
         state <= WB_LUI;
      end
      WB_LUI: begin
         reg_write_data <= {instruction_sav[31:12], 12'b0}; //lui fills lowest 12b with 0
         // debug <= {instruction_sav[31:12], 12'b0}; //lui fills lowest 12b with 0
         write_reg <= instruction_sav[11:7];
         write_en <= 1'b1;
         state <= IF_MEM;
      end
      EX_JALR : begin
         alu_in1 <= data_out_1;
         alu_in2 <= {{20{instruction_sav[31]}}, instruction_sav[31:20]};
         alu_control <= 4'b0; //add

         state <= MEM_JALR;
      end
      MEM_JALR : begin
         state <= WB_JALR;
      end
      WB_JALR : begin
         reg_write_data <= pc;
         //we want to jump to this address, no need to do a -4
         pc <= {alu_out[31:1], 1'b0};
         write_reg <= instruction_sav[11:7];
         write_en <= 1'b1;
         state <= IF_MEM;
      end
      EX_BR : begin
         alu_in1 <= data_out_1;
         alu_in2 <= data_out_2;
         if(instruction_sav[14:12] == 3'b000 || instruction_sav[14:12] == 3'b001) begin //beq, bne
            alu_control <= 4'b1000; //sub (signed)
         end else if(instruction_sav[14:12] == 3'b110 || instruction_sav[14:12] == 3'b111) begin // bltu bgeu (unsigned)
            alu_control <= 4'b0011; //sltu
         end else begin
            alu_control <= 4'b0010; //slt
         end
         state <= MEM_BR;
      end
      MEM_BR: begin
         state <= WB_BR;
      end
      WB_BR: begin
         offset = { {19{instruction_sav[31]}}, instruction_sav[31], instruction_sav[7], instruction_sav[30:25], instruction_sav[11:8], 1'b0};
         if(instruction_sav[14:12] == 3'b000 && alu_zero == 1'b1) begin //BEQ
            pc <= pc-4+offset;
         end else if (instruction_sav[14:12] == 3'b001 && alu_zero == 1'b0) begin //BNE
            pc <= pc-4+offset;
         end else if (instruction_sav[14:12] == 3'b101 && alu_out == 32'b0 ) begin //BGE
            pc <= pc-4+offset;
         end else if (instruction_sav[14:12] == 3'b111 && alu_out == 32'b0 ) begin //BGEU
            pc <= pc-4+offset;
         end else if (instruction_sav[14:12] == 3'b100 && alu_out == 32'b1 ) begin //BLT
            pc <= pc-4+offset;
         end else if (instruction_sav[14:12] == 3'b110 && alu_out == 32'b1 ) begin //BLTU
            pc <= pc-4+offset;
         end
         state <= IF_MEM;
      end
      EX_SYS: begin
         state <= MEM_SYS;
      end
      MEM_SYS: begin
         state <= WB_SYS;
      end
      WB_SYS: begin

         if(instruction_sav[14] == 1'b0) begin
            src = data_out_1;
         end else begin
            src = {27'b0, instruction_sav[19:15]};
         end

         //juste have a few CSR registers, to pass compliance tests
         if(instruction_sav[31:20] == 12'h340) begin //mscratch
            csr_idx = mscratch;
         end else if (instruction_sav[31:20] == 12'h305) begin //mtvec
            csr_idx = mtvec;
         end else if (instruction_sav[31:20] == 12'h341) begin //mepc
            csr_idx = mepc;
         end else if (instruction_sav[31:20] == 12'h342) begin //mcause
            csr_idx = mcause;
         end else if (instruction_sav[31:20] == 12'h343) begin //mtval
            csr_idx = mtval;
         end

         if(instruction_sav[14:12] == 3'b000) begin //env call or trap return
            if(instruction_sav[31:20] == 12'b000000000000) begin //ecall
               pc <= CSRegs[mtvec];
               CSRegs[mepc] <= pc-4;
               CSRegs[mcause] <= 32'd11; //11 =  Environment call from M-mode
            end else if(instruction_sav[31:20] == 12'b000000000001) begin //ebreak
               pc <= CSRegs[mtvec];
               CSRegs[mepc] <= pc-4;
               CSRegs[mcause] <= 32'd3; //3 =  Breakpoint
            end else if(instruction_sav[31:20] == 12'b001100000010) begin //mretpro
               pc <= CSRegs[mepc];
            end
         end else if(instruction_sav[13:12] == 2'b01) begin //CSRRW
            CSRegs[csr_idx] <= src;
            reg_write_data <= CSRegs[csr_idx];
            write_reg <= instruction_sav[11:7];
            write_en <= 1'b1;
         end else if(instruction_sav[13:12] == 2'b10) begin //CSRRS
            CSRegs[csr_idx] <= (CSRegs[csr_idx] | src);
            reg_write_data <= CSRegs[csr_idx];
            write_reg <= instruction_sav[11:7];
            write_en <= 1'b1;
         end else if(instruction_sav[13:12] == 2'b11) begin //CSRRC
            CSRegs[csr_idx] <= (CSRegs[csr_idx] & ~src);
            reg_write_data <= CSRegs[csr_idx];
            write_reg <= instruction_sav[11:7];
            write_en <= 1'b1;
         end

         state <= IF_MEM;
      end
      default: begin
      end
      endcase
   end
end

endmodule
