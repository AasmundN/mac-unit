`include "../../src/memory/8_bit_register.v"
`include "../../src/adder/8_bit_adder.v"

module eight_bit_register_tb;
    reg enable, reset, clk;
    reg [7:0] a, b; // Inputs to adder 

    wire adder_carry_out;
    wire [7:0] adder_out;
    wire [7:0] reg_out;

    adder_8_bit adder0 (a,b, adder_out, adder_carry_out);
    eight_bit_register reg8bit(reg_out, adder_out, enable, reset, clk);

    initial b = 1;
    initial a = 0;
    initial enable = 1;
    initial reset = 0;
    initial clk = 0;

    always #3 clk = ~clk;

    // The delay variables are used to randomize enable, reset, and signal a.
    reg [1:0] delay;
    reg [2:0] delay_en;
    reg [2:0] delay_reset;

    integer i;

    initial begin
        // $dumpfile("eight_bit_register_sim.vcd");
        // $dumpvars(0, eight_bit_register_tb);

        for(i = 0; i < 48; i = i + 1) begin
            delay = $random;
            delay_en = $random;
            delay_reset = $random;

            #(delay) a = i;
            #(delay_en) enable = ~enable;
            #(delay_reset) reset = ~reset;
        end

        #2 reset = 1;
        #10

        $finish;
    end
endmodule