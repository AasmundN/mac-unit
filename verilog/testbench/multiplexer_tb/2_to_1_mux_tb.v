`include "../src/2_to_1_mux.v"

module two_to_one_mux_tb;
    reg a, b, select;
    wire q;

    two_to_one_mux mux (q, a, b, select);

    initial begin
        $dumpfile("two_to_one_mux_sim.vcd");
        $dumpvars(0, two_to_one_mux_tb);

        a = 0; b = 0; select = 0;
        #1
        a = 0; b = 0; select = 1;
        #1
        a = 0; b = 1; select = 0;
        #1
        a = 0; b = 1; select = 1;
        #1
        a = 1; b = 0; select = 0;
        #1
        a = 1; b = 0; select = 1;
        #1
        a = 1; b = 1; select = 0;
        #1
        a = 1; b = 1; select = 1;
    end
endmodule