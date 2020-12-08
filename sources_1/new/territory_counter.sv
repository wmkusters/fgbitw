`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 06:34:18 PM
// Design Name: 
// Module Name: territory_counter
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


module territory_counter(
    input logic clk_in,
    input logic rst_in,
    input logic [1:0] board_state [8:0][8:0],
    input logic update_pulse,
    output logic [7:0] bcount_out,
    output logic [7:0] wcount_out,
    output logic terr_ready
    );
    
    parameter b = 2'b01;
    parameter w = 2'b10;
    parameter WAITING           = 5'b00001;
    parameter PULSE_MY_PRUNERS  = 5'b00010;
    parameter PRUNING           = 5'b00100;
    parameter LOAD_COUNT        = 5'b01000;
    parameter PULSE_READY       = 5'b10000;
    
    logic [4:0] state;
    logic pruner_pulse;
    logic [1:0] btprune_board [8:0][8:0];
    logic [1:0] wtprune_board [8:0][8:0];
    logic [1:0] btprune_board_pruned [8:0][8:0];
    logic [1:0] wtprune_board_pruned [8:0][8:0];
    logic [1:0] btprune_board_pdiff [8:0][8:0];
    logic [1:0] wtprune_board_pdiff [8:0][8:0];
    logic [1:0] board_onlyblack [8:0][8:0];
    logic [1:0] board_onlywhite [8:0][8:0];
    
    integer i;
    integer j;
    
    always_comb begin
        for (i = 0; i < 9; i = i + 1) begin
            for (j = 0; j < 9; j = j + 1) begin
                btprune_board[i][j] = {~(board_state[i][j][0] ^ board_state[i][j][1]), board_state[i][j][0]};
                wtprune_board[i][j] = {board_state[i][j][1], ~(board_state[i][j][0] ^ board_state[i][j][1])};
                btprune_board_pdiff[i][j] = btprune_board_pruned[i][j] ^ btprune_board[i][j];
                wtprune_board_pdiff[i][j] = wtprune_board_pruned[i][j] ^ wtprune_board[i][j];
                board_onlyblack[i][j] = {1'b0, board_state[i][j][0]};
                board_onlywhite[i][j] = {board_state[i][j][1], 1'b0};
            end
        end
    end
    
    logic btpruner_done;
    logic wtpruner_done;
    
    pruner black_tpruner(.clk_in(clk_in), 
                         .reset_in(rst_in), 
                         .start_flag(pruner_pulse), 
                         .prune_color(w), 
                         .board_in(btprune_board), 
                         .pruned_board(btprune_board_pruned), 
                         .done_pulse(btpruner_done));
                          
    pruner white_tpruner(.clk_in(clk_in), 
                         .reset_in(rst_in), 
                         .start_flag(pruner_pulse), 
                         .prune_color(b), 
                         .board_in(wtprune_board), 
                         .pruned_board(wtprune_board_pruned), 
                         .done_pulse(wtpruner_done));
    
    logic [7:0] barea_count;
    logic [7:0] warea_count;
    logic [7:0] btile_count;
    logic [7:0] wtile_count;
    
    tallier bterr_count(.board(btprune_board_pdiff),
                        .sum(barea_count));
                        
    tallier wterr_count(.board(wtprune_board_pdiff),
                        .sum(warea_count));
                        
    tallier bpiece_count(.board(board_onlyblack),
                        .sum(btile_count));
                        
    tallier wpiece_count(.board(board_onlywhite),
                        .sum(wtile_count));
    
    always_ff @(posedge clk_in) begin
        if (rst_in) begin
            bcount_out [7:0] <= 0;
            wcount_out [7:0] <= 0;
            terr_ready <= 0;
            pruner_pulse <= 0;
            state <= WAITING;
        end else begin
            case(state)
                WAITING:
                begin
                    state <= update_pulse ? PULSE_MY_PRUNERS : state;
                    terr_ready <= 0;
                end
                PULSE_MY_PRUNERS:
                begin
                    state <= PRUNING;
                    pruner_pulse <= 1;
                end
                PRUNING:
                begin
                    state <= (btpruner_done | wtpruner_done) ? LOAD_COUNT : state;
                    pruner_pulse <= 0;
                end
                LOAD_COUNT:
                begin
                    state <= PULSE_READY;
                    bcount_out <= btile_count + barea_count;
                    wcount_out <= wtile_count + warea_count;
                end
                PULSE_READY:
                begin
                    state <= WAITING;
                    terr_ready <= 1;
                end
                
            endcase
        end
    end
    
endmodule
