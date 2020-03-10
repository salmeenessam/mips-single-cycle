`timescale 1ns / 1ps
module RF(
	 input reg_write,
	 input clk,
    input [4:0] read_register1,
    input [4:0] read_register2,
    input [4:0] write_register,
    input [31:0] write_data,
    output reg[31:0] read_data1,
    output reg[31:0] read_data2
    );

reg [31:0] register_space [0:31];
integer i;

initial begin
for(i = 0; i < 32;i = i+1)
begin
	register_space[i] <= 32'b0;
end
end


always @ (*)
begin
	if(reg_write == 1)
	begin
		register_space[write_register] <= write_data;
	end
	read_data1 <= register_space[read_register1];
	read_data2 <= register_space[read_register2];
end


endmodule
