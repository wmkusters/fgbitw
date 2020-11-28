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
    
    parameter CLK_HZ = 65_000_000;
    parameter BAUD_RATE = 9600;
    parameter SAMP_PER_BIT = 16;
    parameter PKT_LEN = 208;
    parameter WAIT_TIME = 2_000_000; //time in ns
    parameter CLK_PER_SAMP = 423; //CLK_HZ/BAUD_RATE/SAMP_PER_BIT
    parameter WAITING_COUNT = 130_000; //WAIT_TIME*(CLK_HZ/1_000_000_000)
    
    parameter WAITING = 3'b001;
    parameter ARMED = 3'b010;
    parameter READING = 3'b100;
    
    reg [31:0] count;
    reg [8:0]  bd_count;
    
    logic [2:0] state;
    logic uart_strt;
    logic sig_last;
    logic [PKT_LEN-1:0] data_bus;
    
    always_comb begin
        uart_strt = sig_last && ~sig_in;
        ready = ~state[2];
        data_out = {data_bus[201:200], data_bus[197:190], data_bus[187:180], data_bus[177:170],
        data_bus[167:160], data_bus[157:150], data_bus[147:140], data_bus[137:130], data_bus[127:120],
        data_bus[117:110], data_bus[107:100], data_bus[97:90], data_bus[87:80], data_bus[77:70], data_bus[67:60],
        data_bus[57:50], data_bus[47:40], data_bus[37:30], data_bus[27:20], data_bus[17:10], data_bus[7:0]};
    end
    
    always_ff @(posedge clk_in) begin
        //store last signal val
        sig_last <= sig_in;
        
        //Updating count
        if (rst_in) begin
            state <= WAITING;
            count <= 0;
            bd_count <= 0;
            data_bus <= 208'h00;
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
                data_bus <= {sig_in, data_bus[(PKT_LEN-1):1]};
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
