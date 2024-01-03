`timescale 1ns / 1ps
module instruction_decoder(
    input [15:0] instruction,
    output reg [3:0] opcode,
    output reg [3:0] reg1, reg2, reg3,
    output reg [7:0] immediate,
    output reg [11:0] jump_address
);

    always @(*) begin
        opcode = instruction[15:12];

        case (opcode)
            4'b0001: begin // R-type format (e.g., ADD, SUB)
                reg1 = instruction[11:8];
                reg2 = instruction[7:4];
                reg3 = instruction[3:0];
            end
            4'b0010, 4'b0011: begin // I-type format (e.g., LOAD, STORE)
                reg1 = instruction[11:8];
                reg2 = instruction[7:4];
                immediate = instruction[7:0];
            end
            4'b0100: begin // J-type format (e.g., JUMP)
                jump_address = instruction[11:0];
            end
            default: begin
                reg1 = 4'b0000;
                reg2 = 4'b0000;
                reg3 = 4'b0000;
                immediate = 8'b00000000;
                jump_address = 12'b000000000000;
            end
        endcase
    end
endmodule