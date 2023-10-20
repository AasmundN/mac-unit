`include "C:\Users\Mori\Documents\Code\ICProsjekt\verilog\hdl\inverter.v"

module inverter_test;

reg a;
wire y;

inverter uut(a,y);

initial begin
    $dumpfile("inverter.vcd");
    $dumpvars(0,inverter_test);

    a = 0;
    #10
    a = 1;
    #10 
    a = 0;
    #10
    a = 1;
    #10
    $finish();
end


endmodule