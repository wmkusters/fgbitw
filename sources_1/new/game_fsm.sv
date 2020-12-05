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
                input logic clk_in, reset, move_avail, board_sel, rx_ready, comm_sel, emp_sel,
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
    logic [1:0] BOARD0 [8:0][8:0] =       '{'{w, b, e, e, e, e, e, e, e},
                                            '{b, b, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, w, w},
                                            '{e, e, e, e, e, e, e, w, w}};
    logic [1:0] BOARD1 [8:0][8:0] =       '{'{e, b, e, e, e, e, e, e, e},
                                            '{b, b, e, e, e, e, e, w, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, b, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, w, w},
                                            '{e, e, e, e, e, e, e, w, e}};  
                                              
    logic [1:0] own_board [8:0][8:0];
    logic [7:0] input_state;
    logic prune55, prune54, prune56, prune65, prune45;
    prune_tile tile55(.self(own_board[5][5]),
                      .up(own_board[4][5]),
                      .up_prune(prune45),
                      .down(own_board[6][5]),
                      .down_prune(prune65),
                      .left(own_board[5][4]),
                      .left_prune(prune54),
                      .right(own_board[5][6]),
                      .right_prune(prune56))

    always_comb begin
//        if (reset) input_state = RESET_IN;
//        else if (move_avail) input_state = MOVE_READY;
//        else input_state = CYC_BOARDS; 
          if (~comm_sel) input_state = SELF_OUT;
          else if (comm_sel & ~rx_ready) input_state = RX_OUT_WAIT;
          else if (comm_sel & rx_ready) input_state = RX_OUT; 
          if (board_sel) own_board = BOARD0;
          else own_board = BOARD1;
          
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

module prune_tile(
                  input [1:0] self, up, down, left, right,
                  input up_prune, left_prune, right_prune, down_prune,
                  output prune
       );
  always_comb begin 
    if ((self == e) ||
        (up   == e) ||
        (down == e) ||
        (left == e) ||
        (right == e)) begin
      prune = 0;
    end else if (((up == self) & (up_prune)) ||
                 ((down == self) & (down_prune)) ||
                 ((left == self) & (left_prune)) ||
                 ((right == self) & (right_prune))) begin
      prune = (up_prune || down_prune || left_prune || right_prune); 
    end else begin
      prune = 0;
    end 
  end
endmodule
  