module two_to_one_mux (output q, input a, input b, input select);
    wire select_bar;

    not not0(select_bar, select);

    cmos switch0 (q, a, select, select_bar);
    cmos switch1 (q, b, select_bar, select);
endmodule