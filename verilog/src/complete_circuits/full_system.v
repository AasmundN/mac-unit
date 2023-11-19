`include "../../src/fsm/fsm.v"
`include "../../src/complete_circuits/mac_unit.v"

// Full circuit of both the MAC unit and the FSM

module mac_unit_with_fsm (output [7:0] out, input [1:0] a, input [1:0] b, input [3:0] zero_input, input run, input reset, input clk);
    wire wire_run_out;
    wire wire_reset_out;
    wire [7:0] add_out;
    wire carry_out;

    fsm fms0 (reset, run, wire_reset_out, wire_run_out, clk);
    mac_unit mac0 (out, a, b, zero_input, wire_run_out, wire_reset_out, clk);    
endmodule