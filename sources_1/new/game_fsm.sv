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
    logic wire_44_45, wire_44_54, wire_45_55, wire_34_44, wire_35_45, wire_43_44, wire_45_46;  
    logic hot;
    assign hot = 1;
    wire_calc calc_44_45(.tile1(own_board[4][4]),
                         .tile2(own_board[4][5]),
                         .neighbor1(wire_34_44),
                         .neighbor2(wire_35_45),
                         .neighbor3(wire_43_44),
                         .neighbor4(wire_45_46),
                         .neighbor5(wire_44_54),
                         .neighbor6(wire_45_55)
    );                     
    prune_tile tile55(.self(own_board[5][5]),
                      .up(own_board[4][5]),
                      .up_prune(prune45),
                      .down(own_board[6][5]),
                      .down_prune(prune65),
                      .left(own_board[5][4]),
                      .left_prune(prune54),
                      .right(own_board[5][6]),
                      .right_prune(prune56)
                      .prune(prune55));

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
        if (pulsed) begin
          prune55_reg <= 1;
          prune54_reg <= 1;
        end else begin
          prune55_reg <= prune55;
        end 
    end
endmodule

module wire_calc(input tile1, tile2,
                 input neighbor1, neighbor2, neighbor3, neighbor4, neighbor5, neighbor6,
                 output wire_out
  );
  always_comb begin
    if ((tile1 ^ tile2) == 2'b11) begin
      wire_out = 0;
    end else if ((tile1 == e) | (tile2 == e)) begin
      wire_out = 1;
    end else begin
      wire_out = (neighbor1 | neighbor2 | neighbor3 | neighbor4 | neighbor5 | neighbor6);
    end
endmodule

// module prune_tile(
//                   input [1:0] self, up, down, left, right,
//                   input up_prune, left_prune, right_prune, down_prune,
//                   output prune
//        );
//   always_comb begin 
//     if ((self == e) ||
//         (up   == e) ||
//         (down == e) ||
//         (left == e) ||
//         (right == e)) begin
//       prune = 0;
//     end else if (((up == self) & (~up_prune)) ||
//                  ((down == self) & (~down_prune)) ||
//                  ((left == self) & (~left_prune)) ||
//                  ((right == self) & (~right_prune))) begin
//       prune = ~(up_prune || down_prune || left_prune || right_prune); 
//     end else begin
//       prune = 1;
//     end 
//   end
// endmodule
  