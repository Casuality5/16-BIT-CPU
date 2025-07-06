module Sixteenbitcounter(
    input clk,
    input reset,
    input enable,
    input load,
    input [15:0] load_in,
    output reg [15:0] count_out
);

    always @(posedge clk or posedge reset) begin
          if (reset)
        count_out<=16'b0;
        else if (load)
        count_out<=load_in;
        else if (enable) begin
            if (!load)
            count_out<=count_out+1;
            else
            count_out<=count_out-1;
        end
    end
    endmodule
