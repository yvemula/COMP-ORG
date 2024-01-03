`timescale 1ns / 1ps

module ram(
    input [14:0] address,  // 32Ki words require 15-bit address
    input [15:0] data,
    input write_enable,
    input clk,
    output reg [15:0] data_out
);

    reg [15:0] memory [0:32767]; // 32Ki words of 16 bits each

    always @(posedge clk) begin
        if (write_enable)
            memory[address] <= data;
        else
            data_out <= memory[address];
    end
endmodule
