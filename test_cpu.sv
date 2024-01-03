`timescale 1ns / 1ps

module test_cpu;
    reg clk, reset;
    wire [14:0] pc;
    cpu uut(.clk(clk), .reset(reset), .pc(pc));

    always #10 clk = ~clk;

    initial begin
      	$dumpfile("dump.vcd");
        $dumpvars;
        clk = 0; reset = 1;
        #20 reset = 0; // Release reset

        // Pre-load RAM with test instructions
        RAM[0] = {4'b0001, 12'b<address>}; // Load
        RAM[1] = {4'b0010, 4'b<reg1>, 4'b<reg2>, 4'b<reg3>}; // Add
        RAM[2] = {4'b0100, 12'b<jump address>}; // Jump

        #200; // Allow time for execution

        #30 $finish;
    end

    initial begin
        $monitor("Time = %d, PC = %h", $time, pc);
    end
endmodule
