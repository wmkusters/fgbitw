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
    parameter WAITING       = 9'b0_00000001;
    parameter LOAD_BOARD    = 9'b0_0000_0010;
    parameter LOAD_MOVE     = 9'b0_0000_0100;
    parameter PULSE_PRUNE_1 = 9'b0_0000_1000;
    parameter PRUNE_1       = 9'b0_0001_0000;
    parameter PRUNE_COLORSWAP = 9'b0_0010_0000;
    parameter PULSE_PRUNE_2 = 9'b0_0100_0000;
    parameter PRUNE_2       = 9'b0_1000_0000;
    parameter SET_READY     = 9'b1_0000_0000;
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
    logic [8:0] state;
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
            board_ready <= 0;
            state <= WAITING;
            prune_color <= {~turn, turn};
            prune_pulse <= 0;
        end
        
        //Changing between states
        case(state)
            WAITING:
            begin
                state <= (start_flag) ? LOAD_BOARD : state;
                board_ready <= 0;
            end
            LOAD_BOARD:
            begin
                state <= LOAD_MOVE;
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
                state <= PULSE_PRUNE_2;
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
                state <= (pruned) ? SET_READY : state;
                prune_pulse <= 0;
            end
            SET_READY:
            begin
                next_board <= pruned_board;
                state <= WAITING;
                board_ready <= 1;
            end
        endcase
    end
    
endmodule
