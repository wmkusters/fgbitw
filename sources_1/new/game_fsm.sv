`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2020 09:49:29 PM
// Design Name: 
// Module Name: game_fsm
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


module game_fsm(
                input logic clk_in, reset, move_avail, board_sel, rx_ready, comm_sel,
                input logic [7:0] move,
                input logic [1:0] board_in [8:0][8:0],
                output logic [1:0] board [8:0][8:0]
    );
    parameter RESET_IN = 8'b0000_0001;
    parameter SELF_OUT = 8'b0000_0010;
    parameter RX_OUT_WAIT = 8'b0000_0100;
    parameter RX_OUT = 8'b0000_1000;
    
    parameter [1:0] b = 2'b01;
    parameter [1:0] w = 2'b10;
    parameter [1:0] e = 2'b00;
    logic [1:0] BOARD0 [8:0][8:0] =       '{'{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e}};
    logic [1:0] BOARD1 [8:0][8:0] =       '{'{e, b, e, e, e, e, e, e, e},
                                            '{b, b, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, w, w},
                                            '{e, e, e, e, e, e, e, w, e}};
    
                                              
    logic [1:0] own_board [8:0][8:0];
    logic [7:0] input_state;
    
    always_comb begin
//        if (reset) input_state = RESET_IN;
//        else if (move_avail) input_state = MOVE_READY;
//        else input_state = CYC_BOARDS; 
          if (~comm_sel) input_state = SELF_OUT;
          else if (comm_sel & ~rx_ready) input_state = RX_OUT_WAIT;
          else if (comm_sel & rx_ready) input_state = RX_OUT; 
          if (board_sel) own_board = BOARD1;
          else own_board = BOARD0;
          
    end
    
    always_ff @(posedge clk_in) begin
        case (input_state)
            SELF_OUT    : begin
                              board <= own_board;
                          end
            RX_OUT_WAIT : begin
                              board <= board;
                          end
            RX_OUT      : begin
                              board <= board_in;
                          end
            default: board <= board;
        endcase
    end
endmodule
