/* Learning RISCV RV32I CPU Design */
/* Link from: https://yamin.cis.k.hosei.ac.jp/rivasm/riscv_rv32i_cpu.v */

module riscv_rv32i_cpu (
	clk, clrn, pc, inst, m_addr, d_f_mem, d_t_mem, write, io_rdn,
	io_wrn, rvram, wvram, read
);

/* input output port describe */
input 	clk, clrn;			// system clock and reset signal
input  [31:0] inst;			// instruction
input  [31:0] d_f_mem;		// load data
output [31:0] pc;			// program counter
output [31:0] m_addr;		// mem or i/o addr
output [31:0] d_t_mem;		// store data
output [3:0]  write;		// memory byte write enable
output 		  read;			// memory read
output [31:0] wvram;		// vram byte write enable
output		  rvram;		// vram read
output reg 	  io_wrn;		// i/o write
output reg 	  io_rdn;		// i/o read

/* control signals */
reg 		  wreg;			// write regfile
reg   [3:0]	  wmem;			// write memory byte enables
reg           rmen;			// write/read memory
reg   [31:0]  alu_out;		// alu output
reg   [31:0]  mem_out;		// mem output
reg   [31:0]  m_addr;		// mem address
reg   [31:0]  next_pc;		// next pc
reg   [31:0]  d_t_mem;
wire  [31:0]  pc_plus_4 = pc + 4;	// pc + 4

/* instruction format */
 /*
 *  -------------------------------------------------------------------------
 *  31  		25 24		20 19		15 14		12 11		7 6		  0
 *  -------------------------------------------------------------------------
 *  |    func7    |   rs2	  |    rs1    |   func3	  |    rd    | opcode | R
 *  -------------------------------------------------------------------------
 *  | imm[11:0]	              |    rs1	  |   func3   |    rd    | opcode | I
 *  -------------------------------------------------------------------------
 *  | imm[11:5]	  |   rs2     |    rs1    |   func3   |    rd    | opcode | S
 *  -------------------------------------------------------------------------
 *  | imm[31:12]                                      |    rd    | opcode | U
 *  -------------------------------------------------------------------------
 */
wire  [6:0] opcode = inst[6:0];
wire  [4:0] rd 	   = inst[11:7];
wire  [2:0] func3  = inst[14:12];
wire  [4:0] rs     = inst[19:15];  // = rs1
wire  [4:0] rt     = inst[24:20];  // = rs2
wire  [6:0] func7  = inst[31:25];
wire  [4:0] shamt  = inst[24:20];  // S-type rs2
wire  		sign   = inst[31];	   // UJ-TYPE imm
wire  [11:0] imm   = inst[31:20];

// branch offset         31:13			 12       11        10:5         4:1    0
wire [31:0] broffset  = {{19{sign}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0}; // beq, bne, blt, blut, bgeu
wire [31:0] simm      = {{20{sign}}, inst[31:20]};		//lw addi slti sltui xori ori andi jalr
wire [31:0] stimm     = {{20{sign}}, inst[31:25], inst[11:7]};   //sw
wire [32:0] uimm      = {{inst[31:12], 12'0}};
wire [31:0] jaloffset = {{11{sign}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};	//jal

// instruction decode
wire i_auipc = (opcode == 7'b0010111);
wire i_lui   = (opcode == 7'b0110111);
wire i_jal   = (opcode == 7'b1101111);
wire i_jalr  = (opcode == 7'b1100111) & (func3 == 3'b000);
wire i_beq   = (opcode == 7'b1100011) & (func3 == 3'b000);
wire i_bne   = (opcode == 7'b1100011) & (func3 == 3'b001);
wire i_blt   = (opcode == 7'b1100011) & (func3 == 3'b100);
wire i_bge   = (opcode == 7'b1100011) & (func3 == 3'b101);
wire i_blut  = (opcode == 7'b1100011) & (func3 == 3'b110);
wire i_bgeu  = (opcode == 7'b1100011) & (func3 == 3'b111);
wire i_lb    = (opcode == 7'b0000011) & (func3 == 3'b000);
wire i_lh    = (opcode == 7'b0000011) & (func3 == 3'b001);
wire i_lw    = (opcode == 7'b0000011) & (func3 == 3'b010);
wire i_lbu   = (opcode == 7'b0000011) & (func3 == 3'b100);
wire i_lhu   = (opcode == 7'b0000011) & (func3 == 3'b101);
wire i_sb    = (opcode == 7'b0100011) & (func3 == 3'b000);
wire i_sh    = (opcode == 7'b0100011) & (func3 == 3'b001);
wire i_sw    = (opcode == 7'b0100011) & (func3 == 3'b010);
wire i_addi  = (opcode == 7'b0010011) & (func3 == 3'b011);
wire i_slti  = (opcode == 7'b0010011) & (func3 == 3'b010);
wire i_sltiu = (opcode == 7'b0010011) & (func3 == 3'b100);
wire i_xori  = (opcode == 7'b0010011) & (func3 == 3'b110);
wire i_andi  = (opcode == 7'b0010011) & (func3 == 3'b111);
wire i_csrrw = (opcode == 7'b1110011) & (func3 == 3'b001);	// not an rv32i instruction
wire i_slli  = (opcode == 7'b0010011) & (func3 == 3'b001) & (fun7 == 7'b0000000);
wire i_srli  = (opcode == 7'b0010011) & (func3 == 3'b101) & (fun7 == 7'b0000000);
wire i_srai  = (opcode == 7'b0010011) & (func3 == 3'b101) & (fun7 == 7'b0100000);
wire i_add   = (opcode == 7'b0110011) & (func3 == 3'b101) & (fun7 == 7'b0000000);
wire i_sub   = (opcode == 7'b0110011) & (func3 == 3'b101) & (fun7 == 7'b0100000);
wire i_sll   = (opcode == 7'b0110011) & (func3 == 3'b001) & (fun7 == 7'b0000000);
wire i_slt   = (opcode == 7'b0110011) & (func3 == 3'b010) & (fun7 == 7'b0000000);
wire i_sltiu = (opcode == 7'b0110011) & (func3 == 3'b011) & (fun7 == 7'b0000000);
wire i_xor   = (opcode == 7'b0110011) & (func3 == 3'b100) & (fun7 == 7'b0000000);
wire i_srl   = (opcode == 7'b0110011) & (func3 == 3'b101) & (fun7 == 7'b0000000);
wire i_sra   = (opcode == 7'b0110011) & (func3 == 3'b101) & (fun7 == 7'b0100000);
wire i_or    = (opcode == 7'b0110011) & (func3 == 3'b110) & (fun7 == 7'b0000000);
wire i_and   = (opcode == 7'b0110011) & (func3 == 3'b111) & (fun7 == 7'b0000000);

// pc
reg [31:0] pc;
always @ (posedge clk or negedge clrn) begin
	if (!clrn) pc <= 0;
	else pc <= next_pc;	
end


