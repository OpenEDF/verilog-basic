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
wire [31:0] broffset = {{19{sign}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0}; // beq, bne, blt, blut, bgeu
