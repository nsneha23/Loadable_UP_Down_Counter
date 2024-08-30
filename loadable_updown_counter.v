//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 19:38:18
// Design Name: 
// Module Name: loadable_updown_counter
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

// Loadable Up/Down Counter
module loadable_updown_counter (
    input wire clk,        // Clock signal
    input wire reset,      // Synchronous reset
    input wire load,       // Load enable
    input wire up_down,    // Up/Down control: 1 for up, 0 for down
    input wire [3:0] load_value, // Value to load into the counter
    output reg [3:0] count // Counter output
);

    // Internal variables
    reg [3:0] max_count = 12; // Maximum count value
    reg [3:0] min_count = 2;  // Minimum count value

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset the counter to minimum value
            count <= min_count;
        end
        else if (load) begin
            // Load the specified value into the counter
            if (load_value >= min_count && load_value <= max_count) begin
                count <= load_value;
            end
        end
        else begin
            // Count up or down based on up_down signal
            if (up_down) begin
                // Count up
                if (count < max_count) begin
                    count <= count + 1;
                end
                else begin
                    count <= min_count;
                end
            end
            else begin
                // Count down
                if (count > min_count) begin
                    count <= count - 1;
                end
                else begin
                    count <= max_count;
                end
            end
        end
    end
endmodule