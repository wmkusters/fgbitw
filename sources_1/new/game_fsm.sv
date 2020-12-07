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
                input logic clk_in, reset, move_avail, rx_ready, my_color,
                input logic [7:0] move,
                output logic [1:0] board_bus [8:0][8:0],
                output logic turn,
                output logic tx_ready,
                output logic invalid_move
    );
    parameter [1:0] e = 2'b00;
    parameter WAITING       = 3'b001;
    parameter UPDATE_BUS    = 3'b010;
    parameter SENDING_MOVE  = 3'b100;
    logic [1:0] EMPTY_BOARD [8:0][8:0] =    '{'{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e}};
    logic [1:0] ko_board [8:0][8:0];
    logic [2:0] state;
    logic [1:0] next_board [8:0][8:0];
    logic update_valid;
    
    board_updater prune_update(.clk_in(clk_in),
                               .rst_in(reset),
                               .start_flag(move_avail|rx_ready),
                               .board_bus(board_bus),
                               .ko_board(ko_board),
                               .turn(turn),
                               .move_in(move),
                               .next_board(next_board),
                               .board_valid(update_valid),
                               .board_invalid(invalid_move));
    
    always_ff @(posedge clk_in) begin
        if (reset) begin
            board_bus <= EMPTY_BOARD;
            turn <= 0;  //Black goes first
            tx_ready <= 0;
            ko_board <= EMPTY_BOARD;
            state <= WAITING;
        end else begin
            case(state)
                WAITING:
                begin
                    tx_ready <= 0;
                    state <= (update_valid ? UPDATE_BUS : state);
                end
                
                UPDATE_BUS:
                begin
                    ko_board <= board_bus;
                    board_bus <= next_board;
                    state <= SENDING_MOVE;
                end
                
                SENDING_MOVE:
                begin
                    tx_ready <= (turn == my_color);
                    turn <= ~turn;
                    state <= WAITING;
                end
                
                default: state <= WAITING;
            endcase
        end
    end
    
endmodule
   