`timescale 1ns / 1ps
module mux5(
    input [4:0] a,
    input [4:0] b,
    input s,
    output reg [4:0] out
);

always @ (*)
begin
    if(s == 0)
        out <= a;
    else 
        out <= b;
end

endmodule
