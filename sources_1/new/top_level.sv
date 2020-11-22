`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2020 10:32:08 PM
// Design Name: 
// Module Name: top_level
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


module top_level(   input               clk_100mhz,
                    input [15:0]        sw,
                    input               btnc,
                    input               btnd,
                    output logic [15:0] led,
                    output logic [1:0]  ja
    );
    
    logic               clean;
    logic               old_clean;
    logic       [161:0] board_state;
    logic       [161:0] rx_board_state;
    logic               rx_ready;
    
    assign board_state = 162'h2_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA;
    assign led = sw;
    
    always_ff @(posedge clk_100mhz)begin
        old_clean <= clean;  //for rising edge detection
    end
    
    debouncer debounce(.clk_in(clk_100mhz), 
                       .rst_in(btnd),
                       .bouncey_in(btnc), 
                       .clean_out(clean));
    
    tx my_tx(.clk_in(clk_100mhz), 
                    .rst_in(btnd),
                    .trigger_in(clean&~old_clean),
                    .val_in(board_state),
                    .data_out(ja[0]));
                    
    rx my_rx(.clk_in(clk_100mhz), 
                    .rst_in(btnd),
                    .rx(ja[1]),
                    .data_out(rx_ready),
                    .data_out(ja[0]));
                    
endmodule//top_level
