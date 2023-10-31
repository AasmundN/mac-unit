`include "../../src/complete_circuits/mac_unit.v"

module mac_unit_tb;
    reg enable, reset, clk;
    reg [1:0] a;
    reg [1:0] b;
    reg [3:0] zero_input;

    wire [7:0] out;

    mac_unit mac0 (out, a, b, zero_input, enable, reset, clk);

    initial a = 0;
    initial b = 0;
    initial zero_input = 0;
    initial enable = 0;
    initial reset = 1;
    initial clk = 0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("mac_unit_sim.vcd");
        $dumpvars(0, mac_unit_tb);

        #10 reset = 0; enable = 1; a = 1; b = 1;
        #10
        #10 a = 2; b = 2;
        #10 a = 3; b = 3; enable = 0;
        #10 reset = 0; enable = 1;
        #10
        #10 reset = 1;
        #10

        $finish;
    end
endmodule