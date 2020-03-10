`timescale 1ns / 1ps
module CPU(
clk,
reset,
PCin,PCout,
inst,
reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump,
alu_op,
write_reg,
read_data1,read_data2,
sign_imm,
src_b,
shift_signed,
alu_control_wire,
alu_result,
zero_flag,
data_mem_out,
write_data_reg,
pc_plus_4,
pc_branch,
jump_address,
pc_src,
mux_branch
);

input clk,reset;

//PC
output wire [31:0] PCout,PCin;
PC pc_instance(
	.clk(clk),
	.reset(reset),
	.next_inst_in(PCin),
	.next_inst_out(PCout)
);

//inst mem
output wire [31:0] inst;
instruction_memory inst_mem_instance(
.input_address(PCout),
.instruction(inst)
);

//control unit
output wire reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump;
output wire [1:0] alu_op;
control_unit cont_unit_instance(
.opcode(inst[31:26]),
.reg_dst(reg_dst),
.alu_src(alu_src),
.mem_to_reg(mem_to_reg),
.reg_write(reg_write),
.mem_read(mem_read),
.mem_write(mem_write),
.branch(branch),
.jump(jump),
.alu_op(alu_op)
);

//reg dst mux
output wire [4:0] write_reg;
mux5 mux5_instance(
.a(inst[20:16]),
.b(inst[15:11]),
.s(reg_dst),
.out(write_reg)
);

//register file
output wire [31:0] read_data1,read_data2;
output wire [31:0] write_data_reg;
RF rf_instance(
.reg_write(reg_write),
.clk(clk),
.read_register1(inst[25:21]),
.read_register2(inst[20:16]),
.write_register(write_reg),
.write_data(write_data_reg),
.read_data1(read_data1),
.read_data2(read_data2)
);

//sign extend
output wire [31:0] sign_imm;
sign_ext sign_extn_instance(
.in_imm(inst[15:0]),
.out_imm(sign_imm)
);

//alusrc mux
output wire [31:0] src_b;
mux2 mux2_instance1(
.a(read_data2),
.b(sign_imm),
.s(alu_src),
.out(src_b)
);

//shift left 2
output wire [31:0] shift_signed;
shift_left32 shift_instance1(
.a(sign_imm),
.out(shift_signed)
);


//alu control unit
output wire [3:0] alu_control_wire;
alu_control alu_control_instance(
.func(inst[5:0]),
.alu_op(alu_op),
.alu_alu_output(alu_control_wire)
);


//alu 
output wire [31:0] alu_result;
output wire zero_flag;
alu alu_instance(
.in1(read_data1),
.in2(src_b),
.alucontrol(alu_control_wire),
.shamt(inst[10:6]),
.aluresult(alu_result),
.zero(zero_flag)
);

//data memory
output wire [31:0] data_mem_out;
data_memory data_mem_instance(
.clk(clk),
.mem_write(mem_write),
.address(alu_result),
.write_data(read_data2),
.read_data(data_mem_out)
);


//mem reg mux
mux2 mux2_instance2(
.a(alu_result),
.b(data_mem_out),
.s(mem_to_reg),
.out(write_data_reg)
);


//pc plus 4 adder
output wire [31:0] pc_plus_4;
adder adder_instance1(
.A(PCout),
.B(4),
.result(pc_plus_4)
);

//pc branch adder
output wire [31:0] pc_branch;
adder adder_instance2(
.A(shift_signed),
.B(pc_plus_4),
.result(pc_branch)
);


//shift left 2 26
//conecnnete
output wire [27:0] jump_address;
shift_left26 shift_left26_instance(
.a(inst[25:0]),
.out(jump_address)
);

//pc src and
output wire pc_src;
and_gate and_gate_instance(
.A(branch),
.B(zero_flag),
.out(pc_src)
);


//mux of branch
output wire [31:0] mux_branch;
mux2 mux2_instance3(
.a(pc_plus_4),
.b(pc_branch),
.s(pc_src),
.out(mux_branch)
);


//mux of jump
mux2 mux_instance4(
.a(mux_branch),
.b({pc_plus_4[31:28],jump_address}),
.s(jump),
.out(PCin)
);

endmodule
