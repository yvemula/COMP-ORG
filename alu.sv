`timescale 1ns / 1ps
module alu(
    input [15:0] a, b,
    input [3:0] alu_control,
    output reg [15:0] result
);

    always @(*) begin
        case (alu_control)
            4'b0001: result = a + b; // Add
            4'b0010: result = a - b; // Subtract
            4'b0011: result = a & b; // Bitwise AND
            4'b0100: result = a | b; // Bitwise OR
            default: result = 16'b0;
        endcase
    end
endmodule
