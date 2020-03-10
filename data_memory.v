`timescale 1ns / 1ps
module data_memory(
    input clk,
    input mem_write,
    input [5:0] address,
    input [31:0] write_data,
    output reg [31:0] read_data
    );

reg [31:0] address_space [0:63];
integer i;

initial begin
for(i = 0; i < 64;i = i + 1)
begin
	address_space[i] = 0;
end
end

always @ (*)
begin
	if(mem_write == 1)
	begin
		address_space[address] <= write_data;
	end
	read_data <= address_space[address];
end

endmodule
