`timescale 1ns / 1ps
module adder(
	input [31:0] A,B,
  output reg [31:0] result
);

	always @ (*) begin
		result <= A+B;
	end
endmodule