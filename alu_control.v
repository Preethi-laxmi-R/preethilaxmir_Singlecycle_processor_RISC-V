module alu_control(aluop,fun7,fun3,control_out);
input fun7; //fun7 is 1 bit, take only 30th bit
input[2:0]fun3;
input[1:0]aluop;
output reg[3:0]control_out;
always@(*)
begin
case({aluop, fun7, fun3})
6'b00_0_000: control_out<= 4'b0010;
6'b01_0_000: control_out<= 4'b0110;
6'b10_0_000: control_out<= 4'b0010;
6'b10_1_000: control_out<= 4'b0110;
6'b10_0_111: control_out<= 4'b0000;
6'b10_0_110: control_out<= 4'b0001;
endcase
end
endmodule
