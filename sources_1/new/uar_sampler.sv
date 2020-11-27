`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2020 10:29:17 AM
// Design Name: 
// Module Name: uar_sampler                                                                      
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


module uar_sampler(
    input clk_in,
    input logic rst_in,
    input logic sig_in,
    output logic sig_out
    );
    
    parameter CLK_HZ = 100_000_000;
    parameter BAUD_RATE = 9600;
    parameter SAMP_PER_BIT = 16;
    
    reg [15:0] count;
    
    always_ff @(posedge clk_in) begin
        if (rst_in) begin
            count <= (CLK_HZ/(SAMP_PER_BIT*BAUD_RATE) - 1);
            sig_out <= sig_in;
        end else if (count == 0) begin
            count <= (CLK_HZ/(SAMP_PER_BIT*BAUD_RATE) - 1);
            sig_out <= sig_in;
        end else count <= count - 1;
    end

endmodule
