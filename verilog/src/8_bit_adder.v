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