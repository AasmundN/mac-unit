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

module adder_8_bit (a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7, sum0, sum1, sum3, sum4, sum5, sum6, sum7);
    input a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7;
    output sum0, sum1, sum3, sum4, sum5, sum6, sum7;

    wire w1, w2, w3, w4, w5, w6, w7;

    half_adder half_adder1(a0, b0, sum0, w1);
    full_adder full_adder1(a1, b1, w1, sum1, w2);
    full_adder full_adder2(a2, b2, w2, sum2, w3);
    full_adder full_adder3(a3, b3, w3, sum3, w4);
    full_adder full_adder4(a4, b4, w4, sum4, w5);
    full_adder full_adder5(a5, b5, w5, sum5, w6);
    full_adder full_adder6(a6, b6, w6, sum6, w7);
endmodule