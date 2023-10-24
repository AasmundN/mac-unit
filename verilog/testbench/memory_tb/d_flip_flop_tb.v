`include "../../src/memory/d_flip_flop.v"

module d_flip_flop_tb;
    reg d, clk;
    wire q;

    initial clk = 0;
    initial d = 1;

    d_flip_flop d_flip_flop (q, d, clk);

    always #3 clk = ~clk;

    initial begin
        // $dumpfile("d_flip_flop_sim.vcd");
        // $dumpvars(0, d_flip_flop_tb);

        #4
        d = 0;
        #1
        d = 1;
        #2
        d = 0;
        #1
        d = 1;
        #1
        d = 0;
        #3
        d = 1;
        #2
        d = 0;
        #1
        d = 1;
        #2
        d = 1;
        #1
        d = 0;
        #1
        d = 1;
        #2
        d = 0;
        #1
        d = 1;
        #2
        d = 0;
        #1
        d = 1;
        #2
        d = 1;
        #1
        d = 0;
        #1
        d = 1;
        #2
        d = 0;
        #1
        d = 1;
        #2
        d = 0;
        #1
        d = 1;
        #2
        d = 1;
        #1
        d = 0;
        #1
        d = 1;
        #2
        d = 0;
        #1
        d = 1;
        #2
        d = 0;
        #1
        d = 1;
        #2
        d = 1;
        #1
        d = 0;
        #1
        d = 1;
        #2
        d = 0;
        #1
        d = 1;
        $finish;
    end
endmodule