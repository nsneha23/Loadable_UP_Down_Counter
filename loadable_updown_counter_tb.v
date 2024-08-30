`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 19:39:36
// Design Name: 
// Module Name: loadable_updown_counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



// Testbench for Loadable Up/Down Counter
module tb_loadable_updown_counter;
    // Testbench signals
    reg clk;
    reg reset;
    reg load;
    reg up_down;
    reg [3:0] load_value;
    wire [3:0] count;

    // Instantiate the counter
    loadable_updown_counter uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .up_down(up_down),
        .load_value(load_value),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        load = 0;
        up_down = 1; // Counting up
        load_value = 4;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Load value into the counter
        load = 1;
        load_value = 4;
        #10;
        load = 0;
        #10;

        // Count up
        #50;

        // Change to count down
        up_down = 0;
        #50;

        // Load another value
        load = 1;
        load_value = 10;
        #10;
        load = 0;
        #30;

        // End simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("At time %t, count = %d", $time, count);
    end
endmodule