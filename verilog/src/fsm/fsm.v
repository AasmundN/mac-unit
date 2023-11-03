`include "../../src/memory/1_bit_register.v"

module fsm(
    input RESET_IN,
    input RUN_IN,
    output RESET_OUT,
    output RUN_OUT,
    input CLK);
    
    assign RESET_OUT = RESET_IN;

    wire w1, w2, w3, S0, S1;

    one_bit_register S0_REG (S0, w3, RUN_IN, RESET_IN, CLK);
    one_bit_register S1_REG (S1, w2, RUN_IN, RESET_IN, CLK);

    nand (w1, S0, S1);
    and (RUN_OUT, w1, RUN_IN);

    xor (w2, S0, S1);
    not (w3, S0);
endmodule
