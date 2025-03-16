module control_unit(
    input [6:0] instruction,
    output reg branch, memread, memtoreg, memwrite, alusource, regwrite,
    output reg [1:0] aluop
);
always @(*) begin
    case (instruction)
        7'b0110011: {alusource, memtoreg, regwrite, memread, memwrite, branch, aluop} = 8'b00100010; // R-type
        7'b0000011: {alusource, memtoreg, regwrite, memread, memwrite, branch, aluop} = 8'b11110000; // Load (LW)
        7'b0100011: {alusource, memtoreg, regwrite, memread, memwrite, branch, aluop} = 8'b10001000; // Store (SW)
        7'b1100011: {alusource, memtoreg, regwrite, memread, memwrite, branch, aluop} = 8'b00000101; // Branch (BEQ)
        default:    {alusource, memtoreg, regwrite, memread, memwrite, branch, aluop} = 8'b00000000; // Default
    endcase
end
endmodule
