`include "../../src/adder/8_bit_adder.v"
`include "../../src/memory/8_bit_register.v"
`include "../../src/multiplier/two_bit_multiplier.v"

module mac_unit (output [7:0] out, input [1:0] a, input [1:0] b, input enable, input reset, input clk);

    wire [7:0] mult_out;
    wire [7:0] add_out;
    wire carry_out;

    two_bit_multiplier mult0 (a,b, mult_out[3:0]);
    adder_8_bit adder0 (mult_out, out, add_out, carry_out);
    eight_bit_register reg0 (out, add_out, enable, reset, clk);

endmodule