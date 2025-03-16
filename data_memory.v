module data_memory(clk,reset,memwrite,memread,read_address,write_data,memdata_out);
input clk,reset,memwrite,memread;
input[31:0]read_address,write_data;
output[31:0]memdata_out;
reg[31:0]d_memory[63:0];
integer k;
always@(posedge clk or posedge reset)
begin
if(reset)
begin
for(k=0;k<64;k=k+1)
d_memory[k]<=32'b00;
end 
else if(memwrite)begin
d_memory[read_address]<=write_data;end
end 
assign memdata_out = (memread)?d_memory[read_address]:32'b00;
   
endmodule
