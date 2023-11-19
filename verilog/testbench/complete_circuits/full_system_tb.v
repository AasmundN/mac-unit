`include "../../src/complete_circuits/full_system.v"

module full_system_tb;
    reg enable, reset, clk;
    reg [1:0] a;
    reg [1:0] b;
    reg [3:0] zero_input;

    wire [7:0] out;

    mac_unit_with_fsm mac_and_fsm (out, a, b, zero_input, enable, reset, clk);

    initial a = 0;
    initial b = 0;
    initial zero_input = 0;
    initial enable = 0;
    initial reset = 1;
    initial clk = 0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("full_system_sim.vcd");
        $dumpvars(0, full_system_tb);

        #10 reset = 0; enable = 0; a = 1; b = 1;
        #10
        #10 a = 2; b = 2; enable = 1;
        #10 
        #10
        #10
        #10
        #10 enable = 0;
        #10 reset = 1;
        #10

        $finish;
    end
endmodule