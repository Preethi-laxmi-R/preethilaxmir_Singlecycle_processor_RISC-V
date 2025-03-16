module instruction_memory(
    input [31:0] read_address,
    output reg [31:0] instruction_out
);
    reg [31:0] imemory[63:0];
integer k;
    // ? Properly initialize memory at compile time (Avoid `always` block)
    initial begin
        
        for (k = 0; k < 64; k = k + 1)
            imemory[k] = 32'b0;  // Initialize memory

        // Load some test instructions
        imemory[0] = 32'b0000000_11001_10000_000_01101_0110011; // ADD x13, x16, x25
        imemory[1] = 32'b0100000_00011_01000_000_00101_0110011; // SUB x5, x8, x3
        imemory[2] = 32'b0000000_00011_00010_111_00001_0110011; // AND x1, x2, x3
    end

    // ? ROM-like behavior: Read address directly (No clock required)
    always @(*) begin
        instruction_out = imemory[read_address[7:2]]; // Word-aligned read
    end

endmodule
