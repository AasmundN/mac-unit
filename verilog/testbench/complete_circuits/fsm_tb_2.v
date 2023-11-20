`include "../../src/fsm/fsm.v"

module fsm_tb;
    reg RESET_IN, RUN_IN, CLK;

    wire RESET_OUT, RUN_OUT;

    initial RESET_IN = 1;
    initial RUN_IN = 0;
    initial CLK = 0;

    always #2 CLK = ~CLK;

    fsm FSM (RESET_IN, RUN_IN, RESET_OUT, RUN_OUT, CLK);

    integer i;

    initial begin
        $dumpfile("fsm_sim.vcd");
        $dumpvars(0, fsm_tb);

        // Uncomment the scenarios you want to test.

        // -- Test FSM cyles continuity -- //
        for(i = 0; i < 18; i = i + 1) begin
            #2 RUN_IN = 1; RESET_IN = 0;
        end
        // -------------------------------- //

        // -- Test FSM freeze and resume functionality -- //
        // #2 RUN_IN = 1; RESET_IN = 0;
        // #2
        // #2 
        // #2 RUN_IN = 0; RESET_IN = 0; // Freeze
        // #2
        // #2 RUN_IN = 1; RESET_IN = 0; // Resume
        // #2
        // #2
        // #2
        // #1
        // ---------------------------------------------- //

        // -- Test FSM reset cycle functionality -- //
        // #2 RUN_IN = 1; RESET_IN = 0;
        // #2
        // #2
        // #2
        // #2
        // #1 RESET_IN = 1; RUN_IN = 1;
        // #2
        // #1 RESET_IN = 0; RUN_IN = 1;
        // #2
        // -------------------------------------- - //

        $finish;
    end
endmodule