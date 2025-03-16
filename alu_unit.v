module alu_unit(
    input [31:0] a, b,
    input [3:0] control_in,
    output reg [31:0] alu_result,
    output reg zero
);
always @(*) begin
    case (control_in)
        4'b0000: alu_result = a & b;
        4'b0001: alu_result = a | b;
        4'b0010: alu_result = a + b;
        4'b0110: alu_result = a - b;
        default: alu_result = 32'b0; // Default case
    endcase
    zero = (alu_result == 0) ? 1'b1 : 1'b0;
end
endmodule
