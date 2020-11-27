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
    parameter CLK_HZ = 100_000_000;
    parameter BAUD_RATE = 9600;
    parameter SAMP_PER_BIT = 16;
    parameter PKT_LEN = 8;
    parameter WAIT_TIME = 2_000_000; //time in ns
    parameter CLK_PER_SAMP = (CLK_HZ/BAUD_RATE/SAMP_PER_BIT);
    parameter WAITING_COUNT = WAIT_TIME*(CLK_HZ/1_000_000_000);
    
    
    logic rx_samp;
    
    uar_sampler #(.CLK_HZ(CLK_HZ),
                  .BAUD_RATE(BAUD_RATE),
                  .SAMP_PER_BIT(SAMP_PER_BIT))
                  
        sample(.clk_in(clk_in), 
               .rst_in(rst_in), 
               .sig_in(rx), 
               .sig_out(rx_samp));
        
    uar_fsm #(.CLK_HZ(CLK_HZ),
              .BAUD_RATE(BAUD_RATE),
              .SAMP_PER_BIT(SAMP_PER_BIT),
              .PKT_LEN(PKT_LEN),
              .WAIT_TIME(WAIT_TIME),
              .CLK_PER_SAMP(CLK_PER_SAMP),
              .WAITING_COUNT(WAITING_COUNT))
              
        rx_fsm(.clk_in(clk_in), 
               .rst_in(rst_in), 
               .sig_in(rx_samp), 
               .data_out(data_out), 
               .ready(ready));
    
endmodule
