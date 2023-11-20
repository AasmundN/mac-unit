`ifndef D_LATCH_V
`define D_LATCH_V

module d_latch (output q_bar, input d, input clk, input clk_bar);
    wire w0, w1;

    cmos switch1 (w0, d, clk, clk_bar);
    cmos switch2 (w0, w1, clk_bar, clk);

    not not0 (q_bar, w0);
    not not1 (w1, q_bar);
endmodule

`endif // D_LATCH_V