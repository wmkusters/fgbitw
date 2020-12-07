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

module top_level(
    input clk_100mhz,
    input [15:0] sw,
    input btnc, btnu, btnd, //btnl, btnr,
    input logic [1:0] jb,
    output logic [1:0] led,
    output logic[3:0] vga_r,
    output logic[3:0] vga_b,
    output logic[3:0] vga_g,
    output logic vga_hs,
    output logic vga_vs,
    output logic [1:0] ja,
    output logic [1:0] led
    );
    
    //COMM PARAMS
    parameter CLK_HZ = 65_000_000;
    parameter BAUD_RATE = 9600;
    parameter SAMP_PER_BIT = 16;
    parameter PKT_LEN = 8;
    parameter WAIT_TIME = 1_000_000; //time in ns
    parameter CLK_PER_SAMP = 423; //CLK_HZ/BAUD_RATE/SAMP_PER_BIT
    parameter DIVISOR = 6771; //CLK_HZ/BAUD_RATE
    parameter WAITING_COUNT = 65_000; //WAIT_TIME*(CLK_HZ/1_000_000_000)

    assign ja[1] = 0;
    
    // create 65mhz system clock, happens to match 1024 x 768 XVGA timing
    clk_wiz clkdivider(.clk_in1(clk_100mhz), .clk_out1(clk_65mhz));
    
    //btnc button is user reset
    logic reset;
    debounce db1(.reset_in(btnc),
                 .clock_in(clk_65mhz),
                 .noisy_in(btnc),
                 .clean_out(reset));
    
    logic move_btn;
    debounce db2 (.reset_in(reset),
                  .clock_in(clk_65mhz),
                  .noisy_in(btnu),
                  .clean_out(move_btn));
    logic move_btn_pulse;
    pulser pulser1(.trigger_in(move_btn),
                   .clk_in(clk_65mhz),
                   .pulse_out(move_btn_pulse)); 

    logic rx_ready;
    logic tx_ready;
    logic turn; // 1 = white's turn || 0 = black's turn

    assign led[1] = turn;
    logic my_turn, my_color, move_avail;
    logic [7:0] move_in, move_io, move;
    logic [1:0] board [8:0][8:0];
    assign move_in = sw[7:0];
    assign my_color = sw[15];
    assign my_turn = (turn == my_color);
    user_io user_io1(.clk_in(clk_65mhz),
                     .reset(reset),
                     .my_turn(my_turn),
                     .make_move(move_btn_pulse),
                     .move_in(move_in),
                     .board(board),
                     .move_ready(move_avail),
                     .locked(led[0]),
                     .move_out(move_io));

    logic [PKT_LEN-1:0] rx_bus;
    assign move = my_turn ? move_io : rx_bus;   //muxing btwn I/O move and RX move
    game_fsm game_fsm1(.clk_in(clk_65mhz),
                       .reset(reset),
                       .move_avail(move_avail|rx_ready),
                       .my_color(my_color),
                       .move(move),
                       .board_bus(board),
                       .turn(turn),
                       .tx_ready(tx_ready),
                       .invalid_move(invalid_move));

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
                     .trigger_in(tx_ready),
                     .val_in(move_io),
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

module pulser(
        input logic trigger_in,
        input logic clk_in,
        output logic pulse_out
    );
    
    logic old_trigger;
    logic older_trigger;
    
    always_ff @(posedge clk_in)begin
        older_trigger <= old_trigger;
        old_trigger <= trigger_in;
    end
    
    always_comb
        if (old_trigger & !older_trigger) begin
            pulse_out = 1'b1;
        end else begin
            pulse_out = 1'b0;
        end
    
endmodule
