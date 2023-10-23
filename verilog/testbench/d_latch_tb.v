`include "d_latch.v"

module d_latch_tb;
    reg d, clk;
    wire q_bar;

    initial clk = 1;
    initial d = 0;

    d_latch d_latch0 (q_bar,d, clk);

    always #5 clk = ~clk;

    initial begin
        $dumpfile("d_latch_sim.vcd");
        $dumpvars(0, d_latch_tb);

        d = 0;
        #2
        d = 1;
        #1
        d = 0;
        #1
        d = 1;
        #2
        d = 1;
        #1
        d = 0;
        #1
        d = 1;
        #1
        d = 1;
        #2
        d = 0;
        #1
        d = 0;
        $finish;
    end


endmodule