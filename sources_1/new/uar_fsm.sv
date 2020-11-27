`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2020 12:44:23 PM
// Design Name: 
// Module Name: uar_fsm
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


module uar_fsm(
    input clk_in,
    input logic rst_in,
    input logic sig_in,
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
    
    parameter WAITING = 3'b001;
    parameter ARMED = 3'b010;
    parameter READING = 3'b100;
    
    reg [31:0] count;
    reg [8:0]  bd_count;
    
    logic [2:0] state;
    logic uart_strt;
    logic sig_last;
    
    always_comb begin
        uart_strt = sig_last && ~sig_in;
        ready = ~state[2];
    end
    
    always_ff @(posedge clk_in) begin
        //store last signal val
        sig_last <= sig_in;
        
        //Updating count
        if (rst_in) begin
            state <= WAITING;
            count <= 0;
            bd_count <= 0;
            data_out <= 162'h00;
        end else if (state == WAITING) begin
            if (~sig_in) count <= 0;
            else count <= count + 1;
        end else if (state == ARMED) begin
            count <= (SAMP_PER_BIT/2)*CLK_PER_SAMP - 1;
            bd_count <= 0;
        end else if (state == READING) begin
            if (count == (SAMP_PER_BIT)*CLK_PER_SAMP - 1) begin
                count <= 0;
                bd_count <= bd_count + 1;
                data_out = {sig_in, data_out[(PKT_LEN-1):1]};
            end else count <= count + 1;
        end
        
        //Changing between states
        case(state)
            WAITING:
                state <= (count == WAITING_COUNT) ? ARMED : state;
            ARMED:
                state <= (uart_strt) ? READING : state;
            READING:
                state <= (bd_count == PKT_LEN + 1) ? WAITING : state;
            default:
                state <= WAITING;
        endcase
    end

endmodule
