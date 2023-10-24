`include "../src/half_adder.v"

module half_adder_tb;
    reg a, b;
    wire sum, carry;

    half_adder halv_Adder1(a, b, sum, carry);

    initial begin
        // $dumpfile("half_adder_sim.vcd");
        // $dumpvars(0, half_adder_tb);

        a = 0; b = 0;
        #1
        a = 0; b = 1;
        #1
        a = 1; b = 0;
        #1
        a = 1; b = 1;
    end
endmodule