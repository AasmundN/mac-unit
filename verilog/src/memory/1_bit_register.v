`include "../../src/memory/d_flip_flop.v"
`include "../../src/multiplexer/2_to_1_mux.v"

`ifndef ONE_BIT_REGISTER_V
`define ONE_BIT_REGISTER_V

module one_bit_register (output out, input in, input enable, input reset, input clk);
    wire w0, w1, w3;

    two_to_one_mux mux0 (w0, in, out, enable);

    not not0 (w1, reset);
    and and0 (w3, w0, w1);

    d_flip_flop d_flip_flop0(out, w3, clk);
endmodule

`endif // ONE_BIT_REGISTER_V