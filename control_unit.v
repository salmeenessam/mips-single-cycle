`timescale 1ns / 1ps
module control_unit(
    input [5:0] opcode,
    output reg reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump,
    output reg [1:0] alu_op
);



always @(opcode) begin
    case (opcode)
        6'b000000:{reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump, alu_op}<=10'b100100_0_0_10; //r
        6'b100011:{reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump, alu_op}<=10'b011110_0_0_00; //lw
        6'b101011:{reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump, alu_op}<=10'bx1x001_0_0_00; //sw
        6'b000100:{reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump, alu_op}<=10'bx0x000_1_0_01; //beq
        6'b000010:{reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump, alu_op}<=10'b000000_0_1_00; //jump
		  6'b001000:{reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump, alu_op}<=10'b010100_0_0_00; //addi
        default:{reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump, alu_op}<=9'bxxx_xxx_x_xx;
    endcase
end
endmodule