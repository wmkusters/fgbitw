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
                input logic clk_in, reset, move_avail, my_color,
                input logic [7:0] move,
                output logic [1:0] board_bus [8:0][8:0],
                output logic turn,
                output logic tx_ready,
                output logic invalid_move,
                output logic game_over
    );
    parameter [1:0] e = 2'b00;
    parameter WAITING           = 6'b000001;
    parameter UPDATE_BUS        = 6'b000010;
    parameter SENDING_MOVE      = 6'b000100;
    parameter PASS              = 6'b001000;
    parameter PASSED_WAITING    = 6'b010000;
    parameter GAME_OVER         = 6'b100000;
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
    logic [4:0] state;
    logic [1:0] next_board [8:0][8:0];
    logic update_valid;
    logic passed;
    
    assign game_over = (state == GAME_OVER);
    
    board_updater prune_update(.clk_in(clk_in),
                               .rst_in(reset),
                               .start_flag(move_avail),
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
            passed <= 0;
        end else begin
            case(state)
                WAITING:
                begin
                    tx_ready <= 0;
                    state <= (move_avail & (move == 8'b1111_1111)) ? PASS: update_valid ? UPDATE_BUS : state;
                    passed <= 0;
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
                    state <= (move == 8'b1111_1111) ? PASSED_WAITING : WAITING;
                end
                
                PASS:
                begin
                    passed <= 1;
                    turn <= ~turn;
                    tx_ready <= (turn == my_color);
                    state <= PASSED_WAITING;
                end
                
                PASSED_WAITING:
                begin
                    tx_ready <= 0;
                    state <= (move_avail & (move == 8'b1111_1111)) ? GAME_OVER: update_valid ? UPDATE_BUS : state;
                    passed <= 1;
                end
                
                GAME_OVER:
                begin
                    state <= GAME_OVER;
                end
                
                default: state <= WAITING;
            endcase
        end
    end
    
endmodule
   