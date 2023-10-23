`include "../src/d_latch.v"

module d_flip_flop (output q, input d, input clk);
    wire w1, w2, w3, clk_bar;

    // create inverted clk
    not (clk_bar, clk);

    // input not gate
    not (w1, d);

    d_latch master(w2, w1, clk_bar, clk);
    d_latch slave(w3, w2, clk, clk_bar);

    // output not gate
    not (q, w3);
endmodule