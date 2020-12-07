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
    input logic [1:0] ko_board [8:0][8:0],
    input logic turn, //1 -> White's turn; 0 -> Black's turn
    input logic [7:0] move_in,
    output logic [1:0] next_board [8:0][8:0],
    output logic board_valid, board_invalid
    );
    parameter WAITING         = 10'b00_0000_0001;
    parameter LOAD_BOARD      = 10'b00_0000_0010;
    parameter LOAD_MOVE       = 10'b00_0000_0100;
    parameter PULSE_PRUNE_1   = 10'b00_0000_1000;
    parameter PRUNE_1         = 10'b00_0001_0000;
    parameter PRUNE_COLORSWAP = 10'b00_0010_0000;
    parameter PULSE_PRUNE_2   = 10'b00_0100_0000;
    parameter PRUNE_2         = 10'b00_1000_0000;
    parameter VALID_BOARD     = 10'b01_0000_0000;
    parameter INVALID_BOARD   = 10'b10_0000_0000;
    parameter [1:0] e = 2'b00;
    logic [1:0] EMPTY_BOARD [8:0][8:0] =  '{'{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e},
                                            '{e, e, e, e, e, e, e, e, e}};
    
    logic [1:0] pruned_board [8:0][8:0];
    logic [10:0] state;
    logic [1:0] prune_color;
    logic pruned;
    logic prune_pulse;

    pruner aashnas_pruner(.clk_in(clk_in), 
                          .reset_in(rst_in), 
                          .start_flag(prune_pulse), 
                          .prune_color(prune_color), 
                          .board_in(next_board), 
                          .pruned_board(pruned_board), 
                          .done_pulse(pruned));

    
    always_ff @(posedge clk_in) begin
        if (rst_in) begin
            next_board <= EMPTY_BOARD;
            board_valid <= 0;
            board_invalid <= 0;
            state <= WAITING;
            prune_color <= {~turn, turn};
            prune_pulse <= 0;
        end
        
        //Changing between states
        case(state)
            WAITING:
            begin
                state <= (start_flag) ? LOAD_BOARD : state;
                board_invalid <= 0;
                board_valid <= 0;
            end
            LOAD_BOARD:
            begin
                state <= (move_in == 8'b1111_1111) ? VALID_BOARD : LOAD_MOVE;
                next_board <= board_bus;
            end
            LOAD_MOVE:
            begin
                state <= PULSE_PRUNE_1;
                next_board[move_in[7:4]][move_in[3:0]] <= {turn, ~turn};
                prune_color <= {~turn, turn};
            end
            PULSE_PRUNE_1:
            begin
                state <= PRUNE_1;
                prune_pulse <= 1;
            end
            PRUNE_1:
            begin
                state <= (pruned) ? PRUNE_COLORSWAP : state;
                prune_pulse <= 0;       
            end
            PRUNE_COLORSWAP:
            begin
                state <= (pruned_board == ko_board) ? INVALID_BOARD : PULSE_PRUNE_2;
                next_board <= pruned_board;
                prune_color <= {turn, ~turn};
            end
            PULSE_PRUNE_2:
            begin
                state <= PRUNE_2; 
                prune_pulse <= 1;
            end
            PRUNE_2:
            begin
                state <= (pruned) ? ((pruned_board == next_board) ? VALID_BOARD : INVALID_BOARD) : state;
                prune_pulse <= 0;
            end
            VALID_BOARD:
            begin
                state <= WAITING;
                board_valid <= 1;
            end
            INVALID_BOARD:
            begin
                state <= WAITING;
                board_invalid <= 1;
            end
        endcase
    end
    
endmodule
