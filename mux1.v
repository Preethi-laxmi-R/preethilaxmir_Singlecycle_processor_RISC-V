//alu mux
module mux1(sel1,a1,b1,mux1_out);
input sel1;
input[31:0]a1,b1;
output[31:0]mux1_out;
assign mux1_out = (sel1==1'b0)?a1:b1;
endmodule
