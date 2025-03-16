module pcplus4(frompc, nextpc);
input [31:0]frompc;
output [31:0]nextpc;
assign nextpc = 4+frompc;
endmodule
