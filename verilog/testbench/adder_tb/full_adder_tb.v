`include "../../src/adder/full_adder.v"

module full_adder_tb;
    reg a, b, carry_in;
    wire sum, carry_out;

    full_adder full_adder1(a, b, carry_in, sum, carry_out);

    initial begin
        // $dumpfile("full_adder_sim.vcd");
        // $dumpvars(0, full_adder_tb);

        a = 0; b = 0; carry_in = 0;
        #1
        a = 0; b = 0; carry_in = 1;
        #1
        a = 0; b = 1; carry_in = 0;
        #1
        a = 0; b = 1; carry_in = 1;
        #1
        a = 1; b = 0; carry_in = 0;
        #1
        a = 1; b = 0; carry_in = 1;
        #1
        a = 1; b = 1; carry_in = 0;
        #1
        a = 1; b = 1; carry_in = 1;
    end
endmodule