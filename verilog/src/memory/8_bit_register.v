`include "../../src/memory/1_bit_register.v"

module eight_bit_register (output [7:0] out, input [7:0] in, input enable, input reset, input clk);
    one_bit_register reg0 (out[0], in[0], enable, reset, clk);
    one_bit_register reg1 (out[1], in[1], enable, reset, clk);
    one_bit_register reg2 (out[2], in[2], enable, reset, clk);
    one_bit_register reg3 (out[3], in[3], enable, reset, clk);
    one_bit_register reg4 (out[4], in[4], enable, reset, clk);
    one_bit_register reg5 (out[5], in[5], enable, reset, clk);
    one_bit_register reg6 (out[6], in[6], enable, reset, clk);
    one_bit_register reg7 (out[7], in[7], enable, reset, clk);
endmodule