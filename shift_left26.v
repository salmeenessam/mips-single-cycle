module shift_left26(
    input [25:0] a,
    output [27:0] out
);

assign out = {a, 2'b00}; 

endmodule
