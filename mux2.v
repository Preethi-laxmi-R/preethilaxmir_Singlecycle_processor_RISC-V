//adder_mux
module mux2(sel2,a2,b2,mux2_out);
input sel2;
input[31:0]a2,b2;
output[31:0]mux2_out;
assign mux2_out = (sel2==1'b0)?a2:b2;
endmodule
