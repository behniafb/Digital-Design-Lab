`include "adder.v"
`include "mux.v"
`include "shift.v"
`include "sign_extend.v"
`include "pc.v"
`include "register_bank.v"
`include "memory.v"
`include "instruction_memory.v"
`include "ALU.v"
`include "ALU_control.v"
`include "Clock.v"
`include "control.v"


module cpu();

	wire clk;
	wire memRead;
	wire memWrite;
	wire ALUSrc;
	wire memToReg;
	wire regWrite;
	wire branch;
	wire ALUOp0;
	wire ALUOp1;
	wire [63 : 0] databus1;
	wire [63 : 0] databus2;
	wire [63 : 0] write_data;
	wire [63 : 0] read_data;
	wire [63 : 0] data_write_register;
	wire [63 : 0] mux_out;
	wire [63 : 0] pc_out;
	wire [63 : 0] read_address;
	wire [63 : 0] sign_out;
	wire [63 : 0] alu_out;
	wire [63 : 0] shift_out;
	wire [3 : 0] operation_code;
	wire [63: 0] pc_old = 64'b0;
	wire [31 : 0] instruction = 32'b0;
	
	integer write=1;
	integer reset=0;

	assign instruction = 32'b0;
	assign pc_old = 64'b1;

	clock clock1(.clk(clk));

	pc pc1(clk, reset ,write ,pc_old ,pc_out);

	adder adder1(clk, pc_old, 64'b100, pc_old);

	shift shift1(sign_out, shift_out);

	adder adder2(clk, shift_out, pc_out, pc_old);

	// Mux of PC
	mux multiplexer1(pc_old, shift_out, branch, pc_old);

	instrution_memory insMem1(clk, pc_out, instruction);

	control control1(instruction[6:0], ALUSrc, memToReg, regWrite, memRead, memWrite, branch, ALUOp1, ALUOp0);

	register_bank register_file1(clk, regWrite, instruction[19:15], instruction[24:20], instruction[11:7], data_write_register, databus1, databus2);

	sign_exntend immGen1(instruction, sign_out);

	// Mux of ALU
	mux multiplexer2(databus2, sign_out, ALUSrc, mux_out);

	ALUControl aluCon1(ALUOp1, ALUOp0, {instruction[31:25],instruction[14:12]}, operation_code);

	ALU ALU1(databus1, mux_out, operation_code, alu_out);

	memory memory1(clk, alu_out, databus2, memRead, memWrite, read_data);

	// Mux of Memory
	mux multiplexer3(read_data, alu_out, memToReg, data_write_register);

endmodule;