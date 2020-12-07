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
    output logic ca, cb, cc, cd, ce, cf, cg, dp,  // segments a-g, dp
    output logic[7:0] an    // Display location 0-7
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
    logic game_over;
    game_fsm game_fsm1(.clk_in(clk_65mhz),
                       .reset(reset),
                       .move_avail(move_avail|rx_ready),
                       .my_color(my_color),
                       .move(move),
                       .board_bus(board),
                       .turn(turn),
                       .tx_ready(tx_ready),
                       .invalid_move(invalid_move),
                       .game_over(game_over));

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
                     
     
    //hex display
    parameter [5:0] BLANK   = 5'd0;
    parameter [5:0] E       = 5'd5;
    parameter [5:0] L       = 5'd12;
    parameter [5:0] O       = 5'd15;
    parameter [5:0] R       = 5'd18;
    parameter [5:0] S       = 5'd19;
    logic [5:0] LOSER [7:0]     = '{BLANK, BLANK,     L,     O,     S,     E,     R, BLANK};
    logic [5:0] EMPTY_HEX [7:0] = '{BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK};
    
    logic [5:0] seg_data [7:0];      //  instantiate 7-segment display; display (8) 4-bit hex
    assign seg_data = (game_over) ? LOSER : EMPTY_HEX;
    logic [6:0] segments;
    assign {cg, cf, ce, cd, cc, cb, ca} = segments[6:0];
    display_alphahex display(.clk_in(clk_65mhz),.data_in(seg_data), .seg_out(segments), .strobe_out(an));
    assign  dp = 1'b1;  // turn off the period

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

//////////////////////////////////////////////////////////////////////////////////
// Engineer:   g.p.hom
// 
// Create Date:    18:18:59 04/21/2013 
// Module Name:    display_8hex 
// Description:  Display 8 hex numbers on 7 segment display
//
//////////////////////////////////////////////////////////////////////////////////

module display_8hex(
    input clk_in,                 // system clock
    input [31:0] data_in,         // 8 hex numbers, msb first
    output logic [6:0] seg_out,     // seven segment display output
    output logic [7:0] strobe_out   // digit strobe
    );

    localparam bits = 13;
     
    logic [bits:0] counter = 0;  // clear on power up
     
    logic [6:0] segments[15:0]; // 16 7 bit memorys
    assign segments[0]  = 7'b100_0000;  // inverted logic
    assign segments[1]  = 7'b111_1001;  // gfedcba
    assign segments[2]  = 7'b010_0100;
    assign segments[3]  = 7'b011_0000;
    assign segments[4]  = 7'b001_1001;
    assign segments[5]  = 7'b001_0010;
    assign segments[6]  = 7'b000_0010;
    assign segments[7]  = 7'b111_1000;
    assign segments[8]  = 7'b000_0000;
    assign segments[9]  = 7'b001_1000;
    assign segments[10] = 7'b000_1000;
    assign segments[11] = 7'b000_0011;
    assign segments[12] = 7'b010_0111;
    assign segments[13] = 7'b010_0001;
    assign segments[14] = 7'b000_0110;
    assign segments[15] = 7'b000_1110;
     
    always_ff @(posedge clk_in) begin
      // Here I am using a counter and select 3 bits which provides
      // a reasonable refresh rate starting the left most digit
      // and moving left.
      counter <= counter + 1;
      case (counter[bits:bits-2])
          3'b000: begin  // use the MSB 4 bits
                  seg_out <= segments[data_in[31:28]];
                  strobe_out <= 8'b0111_1111 ;
                 end

          3'b001: begin
                  seg_out <= segments[data_in[27:24]];
                  strobe_out <= 8'b1011_1111 ;
                 end

          3'b010: begin
                   seg_out <= segments[data_in[23:20]];
                   strobe_out <= 8'b1101_1111 ;
                  end
          3'b011: begin
                  seg_out <= segments[data_in[19:16]];
                  strobe_out <= 8'b1110_1111;        
                 end
          3'b100: begin
                  seg_out <= segments[data_in[15:12]];
                  strobe_out <= 8'b1111_0111;
                 end

          3'b101: begin
                  seg_out <= segments[data_in[11:8]];
                  strobe_out <= 8'b1111_1011;
                 end

          3'b110: begin
                   seg_out <= segments[data_in[7:4]];
                   strobe_out <= 8'b1111_1101;
                  end
          3'b111: begin
                  seg_out <= segments[data_in[3:0]];
                  strobe_out <= 8'b1111_1110;
                 end

       endcase
      end

endmodule

//////////////////////////////////////////////////////////////////////////////////
//  Display letters on a hex
//////////////////////////////////////////////////////////////////////////////////

module display_alphahex(
    input clk_in,                           // system clock
    input logic [5:0] data_in [7:0],        // 8 letters, msl first
    output logic [6:0] seg_out,             // seven segment display output
    output logic [7:0] strobe_out           // digit strobe
    );

    localparam bits = 13;
     
    logic [bits:0] counter = 0;  // clear on power up
     
    logic [6:0] segments[15:0]; // 16 7 bit memorys
    assign segments[0]  = 7'b111_1111;  // inverted logic; gfedcba
    assign segments[1]  = 7'b111_1001;
    assign segments[2]  = 7'b010_0100;
    assign segments[3]  = 7'b011_0000;
    assign segments[4]  = 7'b001_1001;
    assign segments[5]  = 7'b000_0110;  // E
    assign segments[6]  = 7'b000_0010;
    assign segments[7]  = 7'b111_1000;
    assign segments[8]  = 7'b000_0000;
    assign segments[9]  = 7'b001_1000;
    assign segments[10] = 7'b000_1000;
    assign segments[11] = 7'b000_0011;
    assign segments[12] = 7'b100_0111;  // L
    assign segments[13] = 7'b010_0001;
    assign segments[14] = 7'b000_0110;
    assign segments[15] = 7'b100_0000;  // O
    assign segments[16] = 7'b000_1000;
    assign segments[17] = 7'b000_0011;
    assign segments[18] = 7'b100_1110;  // R
    assign segments[19] = 7'b001_0010;  // S
    assign segments[20] = 7'b000_0110;
    assign segments[21] = 7'b000_1110;
    assign segments[22] = 7'b010_0111;
    assign segments[23] = 7'b010_0001;
    assign segments[24] = 7'b000_0110;
    assign segments[25] = 7'b000_1110;
    assign segments[26] = 7'b000_1000;
     
    always_ff @(posedge clk_in) begin
      // Here I am using a counter and select 3 bits which provides
      // a reasonable refresh rate starting the left most digit
      // and moving left.
      counter <= counter + 1;
      case (counter[bits:bits-2])
          3'b000: begin  // use the MSB 4 bits
                  seg_out <= segments[data_in[7]];
                  strobe_out <= 8'b0111_1111 ;
                 end

          3'b001: begin
                  seg_out <= segments[data_in[6]];
                  strobe_out <= 8'b1011_1111 ;
                 end

          3'b010: begin
                   seg_out <= segments[data_in[5]];
                   strobe_out <= 8'b1101_1111 ;
                  end
          3'b011: begin
                  seg_out <= segments[data_in[4]];
                  strobe_out <= 8'b1110_1111;        
                 end
          3'b100: begin
                  seg_out <= segments[data_in[3]];
                  strobe_out <= 8'b1111_0111;
                 end

          3'b101: begin
                  seg_out <= segments[data_in[2]];
                  strobe_out <= 8'b1111_1011;
                 end

          3'b110: begin
                   seg_out <= segments[data_in[1]];
                   strobe_out <= 8'b1111_1101;
                  end
          3'b111: begin
                  seg_out <= segments[data_in[0]];
                  strobe_out <= 8'b1111_1110;
                 end

       endcase
      end

endmodule
