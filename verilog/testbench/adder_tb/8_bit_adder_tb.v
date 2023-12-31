`include "../../src/adder/8_bit_adder.v"

module adder_8_bit_tb;
    // Note: This testbench has not been updated for the zero-input changes to the 8-bit adder.
    // See commit SHA-9103475 for changes.

    reg [7:0] a, b;
    wire [7:0] sum;
    wire carry_out;

    adder_8_bit adder_8_bit1(a, b, sum, carry_out);

    integer errors;

    initial begin
        // Create a dump file for viewing simulation results
        $dumpfile("adder_8_bit_sim.vcd");
        $dumpvars(0, adder_8_bit_tb);
        
        $display("Checking for errors...");
        errors = 0;

        // Check sum of all possible 8-bit additions
        for( a = 0; a < 255; a = a + 1) begin
            for( b = 0; b < 255; b = b + 1) begin
                #1 // Wait for 1 time unit
                if (sum != a + b) begin
                    $display("Error: %d + %d = %d", a, b, sum);
                    errors = errors + 1;
                end
            end
        end

        if(errors == 0) begin
            $display("No errors found.");
        end else begin
            $display("Found %d errors.", errors);
        end
    end
endmodule