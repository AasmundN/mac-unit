`include "../src/8_bit_adder.v"

module half_adder_testbench;
    reg a, b;
    wire sum, carry;

    half_adder halv_Adder1(a, b, sum, carry);

    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_testbench);

        a = 0; b = 0;
        #1
        a = 0; b = 1;
        #1
        a = 1; b = 0;
        #1
        a = 1; b = 1;
    end
endmodule