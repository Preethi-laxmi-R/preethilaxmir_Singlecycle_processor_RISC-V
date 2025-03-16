
module and_logic(branch,zero,and_out);
input branch,zero;//single bit input
output and_out;
assign and_out = branch & zero;
endmodule
