`timescale 1ns / 1ps
module PC(
	input [31:0] next_inst_in,
	input clk,
	input reset,
	output reg [31:0] next_inst_out
);

always @ (posedge clk or posedge reset) 
	begin
		if(reset == 1)
			next_inst_out <= 0;
		else
			next_inst_out <= next_inst_in;
	end
endmodule