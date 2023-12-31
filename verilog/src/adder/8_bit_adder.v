`include "../../src/adder/full_adder.v"

module adder_8_bit (
    input [3:0] a_low,
    input [3:0] a_high,
    input [7:0] b,
    output [7:0] sum,
    output carry_out
);

    wire w1, w2, w3, w4, w5, w6, w7;

    half_adder half_adder1(a_low[0], b[0], sum[0], w1);
    full_adder full_adder1(a_low[1], b[1], w1, sum[1], w2);
    full_adder full_adder2(a_low[2], b[2], w2, sum[2], w3);
    full_adder full_adder3(a_low[3], b[3], w3, sum[3], w4);
    full_adder full_adder4(a_high[0], b[4], w4, sum[4], w5);
    full_adder full_adder5(a_high[1], b[5], w5, sum[5], w6);
    full_adder full_adder6(a_high[2], b[6], w6, sum[6], w7);
    full_adder full_adder7(a_high[3], b[7], w7, sum[7], carry_out);
endmodule