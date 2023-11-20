`include "../../src/complete_circuits/full_system.v"

module full_system_tb;
    reg run, reset, clk;
    reg [1:0] a;
    reg [1:0] b;
    reg [3:0] zero_input;

    wire [7:0] out;

    mac_unit_with_fsm mac_and_fsm (out, a, b, zero_input, run, reset, clk);

    initial a = 0;
    initial b = 0;
    initial zero_input = 0;
    initial run = 0;
    initial reset = 1;
    initial clk = 0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("full_system_sim.vcd");
        $dumpvars(0, full_system_tb);

        #10 reset = 0; run = 0; a = 1; b = 1; // Initiate values
        #10 // Do nothing

        // -- Run 1 MAC cycle -- //
        #10 a = 2; b = 2; run = 1; 
        #10 
        #10
        #10
        // ---------------------- //
        #10 run = 0; // Test holding of value
        #10
        #10 reset = 1; // Test reseting of values

        // -- Run 2 MAC cycle -- //
        #10 a = 2; b = 2; run = 1; reset = 0;
        #10 a = 3; b = 4;
        #10 a = 1; b = 1;
        #10 a = 1; b = 1;
        // ---------------------- //
        // -- Run 3 MAC cycle -- //
        #10
        #10
        #10 run = 0; // freeze
        #10 
        // ---------------------- //

        #10 reset = 1;
        #10 reset = 0;

        $finish;
    end
endmodule