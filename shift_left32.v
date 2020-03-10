module shift_left32(
    input [31:0] a,
    output [31:0] out
);

assign out = {a[29:0], 2'b00}; 

endmodule
