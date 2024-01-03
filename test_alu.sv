`timescale 1ns / 1ps

module test_alu;
    reg [15:0] a, b;
    reg [3:0] alu_control;
    wire [15:0] result;

    alu uut(.a(a), .b(b), .alu_control(alu_control), .result(result));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        // Test Addition
        a = 16'd10; b = 16'd5; alu_control = 4'b0001; // Add
        #10; // Wait for 10 time units

        // Test Subtraction
        a = 16'd10; b = 16'd5; alu_control = 4'b0010; // Subtract
        #10;

        // Test Bitwise AND
        a = 16'b1010; b = 16'b1100; alu_control = 4'b0011; // AND
        #10;

        // Test Bitwise OR
        a = 16'b1010; b = 16'b1100; alu_control = 4'b0100; // OR
        #10;

        #10 $finish; // End simulation after testing
    end

    initial begin
        $monitor("Time = %d, Operation = %b, A = %d, B = %d, Result = %d", $time, alu_control, a, b, result);
    end
endmodule