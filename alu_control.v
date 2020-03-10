`timescale 1ns / 1ps
module alu_control (alu_op,func,alu_alu_output);
input[1:0] alu_op;
input[5:0] func;
output reg[3:0] alu_alu_output;


always @(alu_op or func)
begin
if (alu_op==2'b00)
 alu_alu_output<=4'b0010;
else if (alu_op==2'b01)
alu_alu_output<=4'b0110;
else if (alu_op==2'b11)
 alu_alu_output<=4'b0001;
else if(alu_op==2'b10&& func==6'b100000)
 alu_alu_output<=4'b0010;
else if (alu_op==2'b10&& func==6'b100010)
 alu_alu_output<=4'b0110;
else if (alu_op==2'b10&& func==6'b100100)
 alu_alu_output<=4'b0000;
else if (alu_op==2'b10&& func==6'b100101)
 alu_alu_output<=4'b0001;
else if (alu_op==2'b10&& func==6'b101010)
 alu_alu_output<=4'b0111;
else if (alu_op==2'b10&& func==6'b000000)
 alu_alu_output<=4'b1110;
else  alu_alu_output<=4'bxxxx;
end 
endmodule
