module top(clk,reset);
input clk,reset;
wire[31:0]pc_top,instruction_top,rd1_top,rd2_top,immext_top,mux1_top,sum_out_top,nextpc_top,pcin_top,s_top,memdata_top,writeback_top;
wire regwrite_top,alusrc_top,branch_top,zero_top,sel2_top,memtoreg_top,memwrite_top,memread_top;
wire [1:0]aluop_top;
wire [3:0]control_top;
//program couter
program_counter pc(.clk(clk), .reset(reset), .pc_in(pcin_top), .pc_out(pc_top));
//pc adder
pcplus4 pc_adder(.frompc(pc_top), .nextpc(nextpc_top));
//instruction memory
instruction_memory inst_memory(.clk(clk), .reset(reset), .read_address(pc_top), .instruction_out(instruction_top));
//register file
reg_file reg_file(.clk(clk), .reset(reset), .regwrite(regwrite_top), .rs1(instruction_top[19:15]), .rs2(instruction_top[24:20]), .rd(instruction_top[11:7]), .write_data(writeback_top), .read_data1(rd1_top), .read_data2(rd2_top));
//immedeiate generator
 immgen immgen(.opcode(instruction_top[6:0]), .instruction(instruction_top), .immext(immext_top));
//control unit
control_unit control_unit(.instruction(instruction_top[6:0]), .branch(branch_top), .memread(memread_top), .memtoreg(memtoreg_top), .aluop(aluop_top), .memwrite(memwrite_top), .alusource(alusrc_top), .regwrite(regwrite_top));
//alu control
alu_control alu_control(.aluop(aluop_top), .fun7(instruction_top[30]), .fun3(instruction_top[14:12]), .control_out(control_top));
//alu unit
 alu_unit alu_unit(.a(rd1_top),.b(mux1_top),.control_in(control_top),.alu_result(s_top),.zero(zero_top));
//alu mux
mux1 alu_mux(.sel1(alusrc_top),.a1(rd2_top),.b1(immext_top),.mux1_out(mux1_top));
//adder
adder adder(.in_1(pc_top),.in_2(immext_top),.sum_out(sum_out_top));
//and logic
and_logic andlogic(.branch(branch_top),.zero(zero_top),.and_out(sel2_top));   
//mux
mux2 adder_mux(.sel2(sel2_top),.a2(nextpc_top),.b2(sum_out_top),.mux2_out(pcin_top));
//data memory
data_memory data_memory(.clk(clk),.reset(reset),.memwrite(memwrite_top),.memread(memread_top),.read_address(s_top),.write_data(rd2_top),.memdata_out(memdata_top));
//mux3
mux3 memory_mux(.sel3(memtoreg_top),.a3(s_top),.b3(memdata_top),.mux3_out(writeback_top));
endmodule
