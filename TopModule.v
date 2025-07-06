`include "Sixteenbitcounter.v"
`include "rom.v"
`include "Registerfile.v"
`include "SixteenBitALU.v"



module TopModule(
    input clk,
    input reset,
    input enable,
    input load,
    input [15:0] load_in,
    output [15:0] final_output
);

    wire [15:0] counter_to_rom_address_wire;

    wire [26:0] rom_data_to_register_file_wire;

    wire [1:0] splitter_to_read_address2;

    wire [1:0] splitter_to_read_address1;

    wire [1:0] splitter_to_write_address;

    wire [15:0] splitter_to_data_in;

    wire  splitter_to_enabling;

    wire [2:0] splitter_to_operation;

    wire splitter_to_operand;

    wire [15:0]data_out1_to_a_of_alu;

    wire [15:0]data_out2_to_b_of_alu;

    assign splitter_to_operation=rom_data_to_register_file_wire[26:24];

    assign splitter_to_operand=rom_data_to_register_file_wire[23];

    assign splitter_to_read_address2=rom_data_to_register_file_wire[22:21];

    assign splitter_to_read_address1=rom_data_to_register_file_wire[20:19];

    assign splitter_to_write_address=rom_data_to_register_file_wire[18:17];

    assign splitter_to_data_in=rom_data_to_register_file_wire[16:1];

    assign splitter_to_enabling=rom_data_to_register_file_wire[0];




    Sixteenbitcounter counter_inst(
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .load(load),
        .load_in(load_in),
        .count_out(counter_to_rom_address_wire)
    );



    rom rom_inst(
        .addr(counter_to_rom_address_wire),
        .data(rom_data_to_register_file_wire)
    );

    Registerfile regfile_inst(
        .clk(clk),
        .enabling(splitter_to_enabling),
        .write_address(splitter_to_write_address),
        .read_address1(splitter_to_read_address1),
        .read_address2(splitter_to_read_address2),
        .data_in(splitter_to_data_in),
        .data_out1(data_out1_to_a_of_alu),
        .data_out2(data_out2_to_b_of_alu)
    );



    SixteenBitALU alu_inst(
        .a(data_out1_to_a_of_alu),
        .b(data_out2_to_b_of_alu),
        .operand(splitter_to_operand),
        .operation(splitter_to_operation),
        .result(final_output)
    );
endmodule







