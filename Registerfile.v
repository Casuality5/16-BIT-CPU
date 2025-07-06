module Registerfile(
    input  enabling,
    input [1:0] write_address,
    input clk,
    input [1:0] read_address1,
    input [1:0] read_address2,
    input [15:0] data_in,
    output reg [15:0] data_out1,
    output reg [15:0] data_out2
);

 reg [15:0] reg0, reg1, reg2, reg3;

 always @(posedge clk) begin
    if (enabling) begin
        case (write_address) 
        2'b00: reg0<=data_in;
        2'b01: reg1<=data_in;
        2'b10: reg2<=data_in;
        2'b11: reg3<=data_in;
        endcase
    end
 end


always @(*) begin
    case(read_address1)
    2'b00: data_out1<=reg0;
    2'b01: data_out1<=reg1;
    2'b10: data_out1<=reg2;
    2'b11: data_out1<=reg3;
    endcase

    case (read_address2)
        2'b00: data_out2<=reg0;
        2'b01: data_out2<=reg1;
        2'b10: data_out2<=reg2;
        2'b11: data_out2<=reg3;
    endcase
end
endmodule 
