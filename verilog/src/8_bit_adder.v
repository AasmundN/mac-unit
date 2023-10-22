module half_adder(a, b, sum, carry);
    input a,b;
    output sum, carry;

    xor x1(sum, a, b);
    and and1(carry, a, b);
endmodule

module full_adder(a, b, carry_in, sum, carry_out);
    input a, b, carry_in;
    output sum, carry_out;

    wire w1, w2, w3;

    half_adder half_adder1(a, b, w1, w2);
    half_adder half_adder2(w1, carry_in, sum, w3);
    or or1(carry_out, w2, w3);
endmodule

module adder_8_bit (
    input [7:0] a,
    input [7:0] b,
    output [7:0] sum
);

    wire w1, w2, w3, w4, w5, w6, w7;

    half_adder half_adder1(a[0], b[0], sum[0], w1);
    full_adder full_adder1(a[1], b[1], w1, sum[1], w2);
    full_adder full_adder2(a[2], b[2], w2, sum[2], w3);
    full_adder full_adder3(a[3], b[3], w3, sum[3], w4);
    full_adder full_adder4(a[4], b[4], w4, sum[4], w5);
    full_adder full_adder5(a[5], b[5], w5, sum[5], w6);
    full_adder full_adder6(a[6], b[6], w6, sum[6], w7);
endmodule