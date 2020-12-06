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
                input logic clk_in, reset, move_avail, move_valid, rx_ready, my_color,
                input logic [7:0] move,
                output logic [1:0] board_bus [8:0][8:0],
                output logic turn,
                output logic ko
    );
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
    logic [1:0] next_board [8:0][8:0];
    logic board_ready;
    logic [8:0] state;
    
    board_updater prune_update(.clk_in(clk_in),
                               .rst_in(reset),
                               .start_flag(move_avail|rx_ready),
                               .board_bus(board_bus),
                               .turn(turn),
                               .move_in(move),
                               .next_board(next_board),
                               .board_ready(board_ready));
    
    always_ff @(posedge clk_in) begin
        if (reset) begin
            board_bus <= EMPTY_BOARD;
            turn <= 0;  //Black goes first
            ko <= 0;
        end else if (move_avail) begin
        end else if (move_valid) begin
        end else if (rx_ready) begin
        end
    end
    
endmodule
   