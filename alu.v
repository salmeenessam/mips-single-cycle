`timescale 1ns / 1ps
module alu (in1,in2,shamt,alucontrol,aluresult,zero);
input      [31:0]   in1,in2;
input      [3:0] alucontrol;
input      [4:0] shamt;
output reg [31:0] aluresult;
output zero;

assign zero = (aluresult == 0);


always@(in1,in2,alucontrol,shamt)
case(alucontrol)
4'b0000: aluresult <= in1&in2;
4'b0001: aluresult <= in1|in2;
4'b0010: aluresult <= in1+in2;
4'b0110: aluresult <= in1-in2;
4'b1110: aluresult <= in2<<shamt;
4'b0111: if (in1 < in2) 
              aluresult <= 1; 
         else aluresult <= 0;
default: aluresult <=0;
endcase
endmodule
