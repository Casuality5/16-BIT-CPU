`include "TopModule.v"

module TopModuletb;

    // Testbench signals
    reg clk;
    reg reset;
    reg enable;
    reg load;
    reg [15:0] load_in;
    wire [15:0] final_output;

    // Internal wires to observe ALU activity
    wire [15:0] a, b;
    wire [2:0] operation;
    wire result_enabling;

    // Instantiate TopModule
    TopModule uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .load(load),
        .load_in(load_in),
        .final_output(final_output)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Table header
    initial begin
        $display("Time | Rst | En | Load | Load_in | A      | B      | Op | Final_Out");
        $display("---------------------------------------------------------------");
    end

    // Live signal tracking
    initial begin
        $monitor("%4t |  %b  | %b  |  %b   | %h    | %h | %h | %b  | %h",
            $time, reset, enable, load, load_in,
            uut.data_out1_to_a_of_alu,
            uut.data_out2_to_b_of_alu,
            uut.splitter_to_operation,
            final_output);
    end

    // Stimulus
    initial begin
        // Initial values
        reset = 1; enable = 0; load = 0; load_in = 16'h0000;
        #10 reset = 0;

        // Start counting
        enable = 1;
        #25;

        // Load value into counter
        load = 1; load_in = 16'h00A5;
        #10 load = 0;

        #50 $finish;
    end

endmodule