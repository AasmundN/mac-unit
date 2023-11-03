`include "../../src/fsm/fsm.v"

module fsm_tb;
    reg RESET_IN, RUN_IN, CLK;

    wire RESET_OUT, RUN_OUT;

    initial RESET_IN = 1;
    initial RUN_IN = 1;
    initial CLK = 0;

    always #2 CLK = ~CLK;

    fsm FSM (RESET_IN, RUN_IN, RESET_OUT, RUN_OUT, CLK);

    initial begin
        $dumpfile("fsm_sim.vcd");
        $dumpvars(0, fsm_tb);

        #4
        RESET_IN = 0;

        #11
        RESET_IN = 1;

        #21
        RESET_IN = 0;

        #13
        RUN_IN = 0;

        #12;
        RUN_IN = 1;

        #7
        RUN_IN = 0;

        #11;
        RUN_IN = 1;

        #6 0

        $finish;
    end
endmodule