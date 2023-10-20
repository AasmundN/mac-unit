// Code example:

module and_gate (
  input wire A, // Input A
  input wire B, // Input B
  output wire Y // Output Y
);

  assign Y = A & B; // AND operation

endmodule

module testbench;

  // Define signals for testbench
  reg A, B;   // Input signals
  wire Y;     // Output signal

  // Instantiate the AND gate module
  and_gate uut (
    .A(A),
    .B(B),
    .Y(Y)
  );

  // Stimulus generation
  initial begin
    A = 0; B = 0;
    #10; // Wait for 10 time units
    A = 0; B = 1;
    #10;
    A = 1; B = 0;
    #10;
    A = 1; B = 1;
    #10;
    $finish; // End simulation
  end

  // Display the output
  initial begin
    $display("A = %b, B = %b, Y = %b", A, B, Y);
  end

endmodule
