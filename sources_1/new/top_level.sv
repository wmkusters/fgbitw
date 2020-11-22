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


module top_level(
    input clk_100mhz,
    input [15:0] sw,
    input btnc, btnu, btnl, btnr, btnd,
    output logic[3:0] vga_r,
    output logic[3:0] vga_b,
    output logic[3:0] vga_g,
    output logic vga_hs,
    output logic vga_vs
    );
    
    // create 65mhz system clock, happens to match 1024 x 768 XVGA timing
    clk_wiz clkdivider(.clk_in1(clk_100mhz), .clk_out1(clk_65mhz));
    
    // btnc button is user reset
    logic reset;
    debounce db1(.reset_in(reset),.clock_in(clk_65mhz),.noisy_in(btnc),.clean_out(reset));
    
    logic move_avail;
    logic [7:0] move;
    logic [1:0] board [8:0][8:0];
    
    game_fsm game(.clk_in(clk_65mhz),
                  .reset(reset),
                  .board_sel(sw[0]),
                  .move_avail(move_avail),
                  .move(move),
                  .board(board));
    
    display display1(.clk(clk_65mhz),
                     .reset(reset),
                     .sw(sw),
                     .board(board),
                     .vga_r(vga_r),
                     .vga_b(vga_b),
                     .vga_g(vga_g),
                     .vga_hs(vga_hs),
                     .vga_vs(vga_vs));
                        
endmodule

///////////////////////////////////////////////////////////////////////////////
//
// Pushbutton Debounce Module (video version - 24 bits)  
//
///////////////////////////////////////////////////////////////////////////////

module debounce (input reset_in, clock_in, noisy_in,
                 output logic clean_out);

   logic [19:0] count;
   logic new_input;

   always_ff @(posedge clock_in)
     if (reset_in) begin 
        new_input <= noisy_in; 
        clean_out <= noisy_in; 
        count <= 0; end
     else if (noisy_in != new_input) begin new_input<=noisy_in; count <= 0; end
     else if (count == 1000000) clean_out <= new_input;
     else count <= count+1;


endmodule
