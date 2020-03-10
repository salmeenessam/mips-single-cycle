`timescale 1ns / 1ps

module uut;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] PCin;
	wire [31:0] PCout;
	wire [31:0] inst;
	wire reg_dst;
	wire alu_src;
	wire mem_to_reg;
	wire reg_write;
	wire mem_read;
	wire mem_write;
	wire branch;
	wire jump;
	wire [1:0] alu_op;
	wire [4:0] write_reg;
	wire [31:0] read_data1;
	wire [31:0] read_data2;
	wire [31:0] sign_imm;
	wire [31:0] src_b;
	wire [31:0] shift_signed;
	wire [3:0] alu_control_wire;
	wire [31:0] alu_result;
	wire zero_flag;
	wire [31:0] data_mem_out;
	wire [31:0] write_data_reg;
	wire [31:0] pc_plus_4;
	wire [31:0] pc_branch;
	wire [27:0] jump_address;
	wire pc_src;
	wire [31:0] mux_branch;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.reset(reset),
		.PCin(PCin), 
		.PCout(PCout), 
		.inst(inst), 
		.reg_dst(reg_dst), 
		.alu_src(alu_src), 
		.mem_to_reg(mem_to_reg), 
		.reg_write(reg_write), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.branch(branch), 
		.jump(jump), 
		.alu_op(alu_op), 
		.write_reg(write_reg), 
		.read_data1(read_data1), 
		.read_data2(read_data2), 
		.sign_imm(sign_imm), 
		.src_b(src_b), 
		.shift_signed(shift_signed), 
		.alu_control_wire(alu_control_wire), 
		.alu_result(alu_result), 
		.zero_flag(zero_flag), 
		.data_mem_out(data_mem_out), 
		.write_data_reg(write_data_reg), 
		.pc_plus_4(pc_plus_4), 
		.pc_branch(pc_branch), 
		.jump_address(jump_address), 
		.pc_src(pc_src), 
		.mux_branch(mux_branch)
	);
	
	initial begin
	clk = 0;
	repeat(20) #100 clk = ~clk;
	end
      
	initial begin
	reset = 1;
	#50;
	reset = 0;
	end
endmodule

