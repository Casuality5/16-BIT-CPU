module rom(
    input [15:0] addr,
    output reg [26:0] data
);

always @(*) begin
    case (addr)
        16'h0000: data = 27'b000_0_00_00_00_0000000000001010_1; // Load 0x000A into Reg0
        16'h0001: data = 27'b000_0_01_00_01_0000000000000101_1; // Load 0x0005 into Reg1
        16'h0002: data = 27'b001_0_01_00_10_0000000000000000_1; // Load dummy into Reg2
        16'h0003: data = 27'b010_0_01_00_00_0000000000000000_1; // Add Reg0 + Reg1 → ALU
        16'h0004: data = 27'b011_0_01_00_00_0000000000000000_1; // Subtract Reg0 - Reg1 → ALU
        16'h0005: data = 27'b100_1_01_00_00_0000000000000000_1; // Multiply with operand bit set
        16'h0006: data = 27'b101_0_01_00_00_0000000000000000_1; // NAND operation
        16'h0007: data = 27'b110_0_01_00_00_0000000000000000_1; // XOR operation
        16'h0008: data = 27'b111_0_01_00_00_0000000000000000_1;

        // Add more cases as needed
        default:  data = 27'b0;

    endcase
end

endmodule
