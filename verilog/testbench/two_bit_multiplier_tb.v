`include "../src/two_bit_multiplier.v"

module two_bit_multiplier_tb;
    reg [1:0] a, b;
    wire [3:0] out;

    two_bit_multiplier two_bit_multiplier1(a, b, out);

    integer errors;

    initial begin
        $dumpfile("two_bit_multiplier_sim.vcd");
        $dumpvars(0, two_bit_multiplier_tb);

        $display("Checking for errors...");
        errors = 0;

        // Check all possible 2-bit multiplications 
        for( a = 0; a < 3; a = a + 1) begin
            for( b = 0; b < 3; b = b + 1) begin
                #10; // Wait for 1 time unit
                if (out != a * b) begin
                    $display("Error: %d + %d = %d", a, b, out);
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