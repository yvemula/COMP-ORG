`timescale 1ns / 1ps

module test_ram;
    reg [14:0] address;
    reg [15:0] data;
    reg write_enable, clk;
    wire [15:0] data_out;

    ram uut(
        .address(address),
        .data(data),
        .write_enable(write_enable),
        .clk(clk),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
      	$dumpfile("dump.vcd");
        $dumpvars;
        clk = 0; write_enable = 0; address = 0; data = 0;

        // Test writing and reading from RAM
        address = 15'h1A3B; data = 16'hAAAA; write_enable = 1;
        #10 write_enable = 0;
        #10 address = 15'h1A3B;

        // Additional test cases can be added here

        #20 $finish;
    end

    initial begin
        $monitor("Time = %d, Address = %h, Data = %h, Data Out = %h, Write Enable = %b", 
                 $time, address, data, data_out, write_enable);
    end
endmodule
