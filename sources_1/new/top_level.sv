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


//module top_level(   input               clk_100mhz,
//                    input [15:0]        sw,
//                    input               btnc,
//                    input               btnd,
//                    output logic [15:0] led,
//                    output logic [1:0]  ja
//    );

//    logic               clean;
//    logic               old_clean;
//    logic       [161:0] board_state;
//    logic       [161:0] rx_board_state;
//    logic               rx_ready;


module top_level(
    input clk_100mhz,
    input [15:0] sw,
    input btnc, btnu, //btnl, btnr, btnd,
    input logic [1:0] jb,
    output logic[3:0] vga_r,
    output logic[3:0] vga_b,
    output logic[3:0] vga_g,
    output logic vga_hs,
    output logic vga_vs,
    output logic [1:0] ja
    );
    
    //COMM PARAMS
    parameter CLK_HZ = 65_000_000;
    parameter BAUD_RATE = 9600;
    parameter SAMP_PER_BIT = 16;
    parameter PKT_LEN = 162;
    parameter WAIT_TIME = 2_000_000; //time in ns
    parameter CLK_PER_SAMP = 423; //CLK_HZ/BAUD_RATE/SAMP_PER_BIT
    parameter DIVISOR = 6771; //CLK_HZ/BAUD_RATE
    parameter WAITING_COUNT = 130_000; //WAIT_TIME*(CLK_HZ/1_000_000_000)

    assign ja[1] = 0;
    
    // create 65mhz system clock, happens to match 1024 x 768 XVGA timing
    clk_wiz clkdivider(.clk_in1(clk_100mhz), .clk_out1(clk_65mhz));
    
    // btnc button is user reset
    logic reset;
    debounce db1(.reset_in(btnc),.clock_in(clk_65mhz),.noisy_in(btnc),.clean_out(reset));
    
    logic tx_btn;
    debounce db2 (.reset_in(reset), .clock_in(clk_65mhz), .noisy_in(btnu), .clean_out(tx_btn));
    
    logic rx_ready;
    logic [PKT_LEN-1:0] rx_bus;
    logic [PKT_LEN-1:0] tx_bus;
    logic move_avail;
    logic [7:0] move;
    logic [1:0] rx_board [8:0][8:0];
    logic [1:0] board [8:0][8:0];
    
    bus_arr_converter bac(.arr(board),
                          .bus(rx_bus),
                          .out_arr(rx_board),
                          .out_bus(tx_bus));
                          
    game_fsm game(.clk_in(clk_65mhz),
                  .reset(reset),
                  .board_sel(sw[0]),
                  .comm_sel(sw[1]),
                  .emp_sel(sw[2]),
                  .rx_ready(rx_ready),
                  .move_avail(move_avail),
                  .move(move),
                  .board_in(rx_board),
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
                        
    tx #(.CLK_HZ(CLK_HZ),
         .BAUD_RATE(BAUD_RATE),
         .DIVISOR(DIVISOR),
         .PKT_LEN(PKT_LEN))
         
              my_tx(.clk_in(clk_65mhz),
                    .rst_in(reset),
                    .trigger_in(tx_btn),
                    .val_in(tx_bus),
                    .data_out(ja[0]));

    rx #(.CLK_HZ(CLK_HZ),
          .BAUD_RATE(BAUD_RATE),
          .SAMP_PER_BIT(SAMP_PER_BIT),
          .PKT_LEN(PKT_LEN),
          .WAIT_TIME(WAIT_TIME),
          .CLK_PER_SAMP(CLK_PER_SAMP),
          .WAITING_COUNT(WAITING_COUNT))
          
              my_rx(.clk_in(clk_65mhz),
                    .rst_in(reset),
                    .rx(jb[0]),
                    .ready(rx_ready),
                    .data_out(rx_bus));  
                                        
endmodule

///////////////////////////////////////////////////////////////////////////////
//
// Pushbutton Debounce Module (video version - 24 bits)  
//
///////////////////////////////////////////////////////////////////////////////

module debounce (input reset_in, clock_in, noisy_in,
                 output logic clean_out);
   parameter DB_COUNT = 1000000;

   logic [19:0] count;
   logic new_input;

   always_ff @(posedge clock_in)
     if (reset_in) begin 
        new_input <= noisy_in; 
        clean_out <= noisy_in; 
        count <= 0; end
     else if (noisy_in != new_input) begin new_input<=noisy_in; count <= 0; end
     else if (count == DB_COUNT) clean_out <= new_input;
     else count <= count+1;


endmodule
