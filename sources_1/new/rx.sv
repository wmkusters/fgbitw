`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2020 07:35:59 PM
// Design Name: 
// Module Name: rx
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

module rx(
    input clk_in,
    input logic rst_in,
    input logic rx,
    output logic [161:0] data_out,
    output logic ready
    );
    
    logic rx_samp;
    
    uar_sampler sample(.clk_in(clk_in), .rst_in(rst_in), .sig_in(rx), .sig_out(rx_samp));
    uar_fsm rx_fsm(.clk_in(clk_in), .rst_in(rst_in), .sig_in(rx_samp), .data_out(data_out), .ready(ready));
    
endmodule
