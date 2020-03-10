`timescale 1ns / 1ps
module instruction_memory(
    input [31:0] input_address,
    output reg [31:0] instruction
    );

reg [31:0] addressSpace [0:63];

initial begin
addressSpace[0]=32'b00100001010010010000000000000101; //addi t1,t2,0x05
addressSpace[1]=32'b10101101001010010000000000000000; //sw   t1,0x0(t1)
addressSpace[2]=32'b10001101001010110000000000000000; //lw   t3,0x0(t1)
addressSpace[3]=32'b00000001001010010101100000100000; //add  t3,t1,t1
addressSpace[4]=32'b00100001001011000000000000000000; //addi t4,t1,0x05
addressSpace[5]=32'b00001000000000000000000000000000; //j    0x0000
end

always @ (input_address)
begin
instruction <= addressSpace[input_address/4];
end

endmodule
