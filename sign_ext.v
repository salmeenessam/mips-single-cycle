`timescale 1ns / 1ps
module sign_ext(
    input [15:0] in_imm,
    output reg[31:0] out_imm
    );


always @ (*)
begin
out_imm <= {{16{in_imm[15]}},in_imm[15:0]};
end

endmodule
