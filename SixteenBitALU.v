module SixteenBitALU(
    input [15:0] a,b,
    input [2:0] operation,
    input operand,
    output reg [15:0] result

);

    always @(*) begin
        case (operation)
        3'b000: result= a + b;
        3'b001: result= a - b;
        3'b010: result= a & b;
        3'b011: result= a | b;
        3'b100: result= a ^ b;
        3'b101: if (operand)
                result= ~a;
                else
                result= ~b;
        3'b110: if (operand)
                result= a<<1;
                else
                result= b<<1;
        3'b111: if (operand)
                result= a>>1;
                else
                result= b>>1;
            endcase
        end


endmodule
