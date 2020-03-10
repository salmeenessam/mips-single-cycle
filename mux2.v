`timescale 1ns / 1ps
module mux2(
    input [31:0] a,
    input [31:0] b,
    input s,
    output reg [31:0] out
);

always @ (*)
begin
    if(s == 0)
        out <= a;
    else 
        out <= b;
end

endmodule
