module two_bit_multiplier(input [1:0] a, input [1:0] b, output [3:0] out) ;
    wire w0, w1, w2, w3;

    // Stage 1
    and and0(w0, a[0], b[1]);
    and and1(out[0], a[0], b[0]);
    and and2(w1, a[1], b[0]);
    and and3(w2, a[1], b[1]);

    // Stage 2
    xor xor0(out[1], w0, w1);
    and and4(w3, w0, w1);

    // Stage 3
    xor xor1(out[2], w2, w3);
    and and5(out[3], w2, w3);
endmodule