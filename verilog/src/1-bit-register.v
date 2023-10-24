`include "d_flip_flop.v"
`include "2_to_1_mux.v"

module one_bit_register (output out, input in, input enable, input reset, input clk);
    wire w0, w1, w3;

    two_to_one_mux mux0 (w0, in, q, enable);

    not not0 (w1, reset);
    and and0 (w3, w0, w1);

    d_flip_flop dff0(q, w3, clk);
endmodule