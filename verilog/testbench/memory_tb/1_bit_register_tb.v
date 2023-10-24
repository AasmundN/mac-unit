`include "../src/1_bit_register.v"

module one_bit_register_tb;
    reg in, enable, reset, clk;
    wire out;

    // delay0 and delay1 are used to randomize the enable and in signals
    reg [2:0] delay0;
    reg [2:0] delay1;

    initial clk = 0;
    initial in = 1;
    initial enable = 0;
    initial reset = 1;

    one_bit_register reg0 (out, in, enable, reset, clk);

    always #3 clk = ~clk;

    integer i;

    initial begin
        $dumpfile("one_bit_register_sim.vcd");
        $dumpvars(0, one_bit_register_tb);

        #10 in = 1;
        #2 reset = 0;

        for (i = 0; i < 10; i = i + 1) begin
            delay0 = $random;
            delay1 = $random;
            #(delay0) enable = ~enable;
            #(delay1) in = i;
        end

        #2
        in = 1; enable = 1;
        #2
        reset = 1;
        #10
        $finish;
    end
endmodule