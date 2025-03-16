module immgen(opcode,instruction,immext);
input[6:0]opcode;//opcode is 7 bit 
input[31:0]instruction;
output reg[31:0]immext;
always@(*)
begin
case(opcode)
7'b0000011:immext <= {{20{instruction[31]}},instruction[31:20]};//i-type instruction
7'b0100011:immext <= {{20{instruction[31]}},instruction[31:25],instruction[11:7]};//s-type instruction
7'b1100011:immext <= {{19{instruction[31]}},instruction[31],instruction[30:25],instruction[11:8],1'b0};//branch type
endcase
end
