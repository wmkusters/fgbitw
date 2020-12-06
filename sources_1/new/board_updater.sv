`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:40:21 PM
// Design Name: 
// Module Name: board_updater
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


module board_updater(
    input logic clk_in,
    input logic rst_in,
    input logic start_flag,
    input logic [1:0] board_bus [8:0][8:0],
    input logic turn, //1 -> White's turn; 0 -> Black's turn
    input logic [7:0] move_in,
    output logic [1:0] next_board [8:0][8:0],
    output logic board_ready
    );
    parameter WAITING       = 6'b000001;
    parameter LOAD_BOARD    = 6'b000010;
    parameter LOAD_MOVE     = 6'b000100;
    parameter PRUNE_1       = 6'b001000;
    parameter PRUNE_2       = 6'b010000;
    parameter SET_READY     = 6'b100000;
    parameter [1:0] e = 2'b00;
    logic [1:0] EMPTY_BOARD [8:0][8:0] =    '{'{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e}};
    
    logic [1:0] pruned_board [8:0][8:0];
    logic [5:0] state;
    logic [1:0] prune_color;
    
    pruner aashnas_pruner(.prune_color(prune_color), .board_in(next_board), .pruned_board(pruned_board));
    
    always_ff @(posedge clk_in) begin
        if (rst_in) begin
            next_board <= EMPTY_BOARD;
            board_ready <= 0;
            state <= WAITING;
            prune_color <= {~turn, turn};
        end
        
        //Changing between states
        case(state)
            WAITING:
            begin
                state <= (start_flag) ? LOAD_BOARD : state;
                board_ready <= 0;
                prune_color <= {~turn, turn};
            end
            LOAD_BOARD:
            begin
                state <= LOAD_MOVE;
                next_board <= board_bus;
            end
            LOAD_MOVE:
            begin
                state <= PRUNE_1;
                next_board[move_in[7:4]][move_in[3:0]] <= {turn, ~turn};
            end
            PRUNE_1:
            begin
                state <= PRUNE_2;
                next_board <= pruned_board;
                prune_color <= {turn, ~turn};
            end
            PRUNE_2:
            begin
                state <= SET_READY;
                next_board <= pruned_board;
            end
            SET_READY:
            begin
                state <= WAITING;
                board_ready <= 1;
            end
        endcase
    end
    
endmodule
