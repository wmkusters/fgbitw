`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:01:40 PM
// Design Name: 
// Module Name: pruner
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


module pruner(input logic [1:0] prune_color,
			  input logic [1:0] board_in [8:0][8:0],
			  output logic [1:0] pruned_board [8:0][8:0]
    );
	parameter w = 2'b10;
	parameter b = 2'b01;	
	else assign prune_color = b;

	logic [1:0] pruned_board [8:0] [8:0];
	logic or_wires [8:0][8:0];


	always_comb begin
	end

	always_comb begin
		pruned_board[0][0] = (prune_color == board_in[0][0]) ? (or_wires[0][0] ? board_in[0][0] : e) : (board_in[0][0]);
		pruned_board[0][1] = (prune_color == board_in[0][1]) ? (or_wires[0][1] ? board_in[0][1] : e) : (board_in[0][1]);
		pruned_board[0][2] = (prune_color == board_in[0][2]) ? (or_wires[0][2] ? board_in[0][2] : e) : (board_in[0][2]);
		pruned_board[0][3] = (prune_color == board_in[0][3]) ? (or_wires[0][3] ? board_in[0][3] : e) : (board_in[0][3]);
		pruned_board[0][4] = (prune_color == board_in[0][4]) ? (or_wires[0][4] ? board_in[0][4] : e) : (board_in[0][4]);
		pruned_board[0][5] = (prune_color == board_in[0][5]) ? (or_wires[0][5] ? board_in[0][5] : e) : (board_in[0][5]);
		pruned_board[0][6] = (prune_color == board_in[0][6]) ? (or_wires[0][6] ? board_in[0][6] : e) : (board_in[0][6]);
		pruned_board[0][7] = (prune_color == board_in[0][7]) ? (or_wires[0][7] ? board_in[0][7] : e) : (board_in[0][7]);
		pruned_board[0][8] = (prune_color == board_in[0][8]) ? (or_wires[0][8] ? board_in[0][8] : e) : (board_in[0][8]);
		pruned_board[1][0] = (prune_color == board_in[1][0]) ? (or_wires[1][0] ? board_in[1][0] : e) : (board_in[1][0]);
		pruned_board[1][1] = (prune_color == board_in[1][1]) ? (or_wires[1][1] ? board_in[1][1] : e) : (board_in[1][1]);
		pruned_board[1][2] = (prune_color == board_in[1][2]) ? (or_wires[1][2] ? board_in[1][2] : e) : (board_in[1][2]);
		pruned_board[1][3] = (prune_color == board_in[1][3]) ? (or_wires[1][3] ? board_in[1][3] : e) : (board_in[1][3]);
		pruned_board[1][4] = (prune_color == board_in[1][4]) ? (or_wires[1][4] ? board_in[1][4] : e) : (board_in[1][4]);
		pruned_board[1][5] = (prune_color == board_in[1][5]) ? (or_wires[1][5] ? board_in[1][5] : e) : (board_in[1][5]);
		pruned_board[1][6] = (prune_color == board_in[1][6]) ? (or_wires[1][6] ? board_in[1][6] : e) : (board_in[1][6]);
		pruned_board[1][7] = (prune_color == board_in[1][7]) ? (or_wires[1][7] ? board_in[1][7] : e) : (board_in[1][7]);
		pruned_board[1][8] = (prune_color == board_in[1][8]) ? (or_wires[1][8] ? board_in[1][8] : e) : (board_in[1][8]);
		pruned_board[2][0] = (prune_color == board_in[2][0]) ? (or_wires[2][0] ? board_in[2][0] : e) : (board_in[2][0]);
		pruned_board[2][1] = (prune_color == board_in[2][1]) ? (or_wires[2][1] ? board_in[2][1] : e) : (board_in[2][1]);
		pruned_board[2][2] = (prune_color == board_in[2][2]) ? (or_wires[2][2] ? board_in[2][2] : e) : (board_in[2][2]);
		pruned_board[2][3] = (prune_color == board_in[2][3]) ? (or_wires[2][3] ? board_in[2][3] : e) : (board_in[2][3]);
		pruned_board[2][4] = (prune_color == board_in[2][4]) ? (or_wires[2][4] ? board_in[2][4] : e) : (board_in[2][4]);
		pruned_board[2][5] = (prune_color == board_in[2][5]) ? (or_wires[2][5] ? board_in[2][5] : e) : (board_in[2][5]);
		pruned_board[2][6] = (prune_color == board_in[2][6]) ? (or_wires[2][6] ? board_in[2][6] : e) : (board_in[2][6]);
		pruned_board[2][7] = (prune_color == board_in[2][7]) ? (or_wires[2][7] ? board_in[2][7] : e) : (board_in[2][7]);
		pruned_board[2][8] = (prune_color == board_in[2][8]) ? (or_wires[2][8] ? board_in[2][8] : e) : (board_in[2][8]);
		pruned_board[3][0] = (prune_color == board_in[3][0]) ? (or_wires[3][0] ? board_in[3][0] : e) : (board_in[3][0]);
		pruned_board[3][1] = (prune_color == board_in[3][1]) ? (or_wires[3][1] ? board_in[3][1] : e) : (board_in[3][1]);
		pruned_board[3][2] = (prune_color == board_in[3][2]) ? (or_wires[3][2] ? board_in[3][2] : e) : (board_in[3][2]);
		pruned_board[3][3] = (prune_color == board_in[3][3]) ? (or_wires[3][3] ? board_in[3][3] : e) : (board_in[3][3]);
		pruned_board[3][4] = (prune_color == board_in[3][4]) ? (or_wires[3][4] ? board_in[3][4] : e) : (board_in[3][4]);
		pruned_board[3][5] = (prune_color == board_in[3][5]) ? (or_wires[3][5] ? board_in[3][5] : e) : (board_in[3][5]);
		pruned_board[3][6] = (prune_color == board_in[3][6]) ? (or_wires[3][6] ? board_in[3][6] : e) : (board_in[3][6]);
		pruned_board[3][7] = (prune_color == board_in[3][7]) ? (or_wires[3][7] ? board_in[3][7] : e) : (board_in[3][7]);
		pruned_board[3][8] = (prune_color == board_in[3][8]) ? (or_wires[3][8] ? board_in[3][8] : e) : (board_in[3][8]);
		pruned_board[4][0] = (prune_color == board_in[4][0]) ? (or_wires[4][0] ? board_in[4][0] : e) : (board_in[4][0]);
		pruned_board[4][1] = (prune_color == board_in[4][1]) ? (or_wires[4][1] ? board_in[4][1] : e) : (board_in[4][1]);
		pruned_board[4][2] = (prune_color == board_in[4][2]) ? (or_wires[4][2] ? board_in[4][2] : e) : (board_in[4][2]);
		pruned_board[4][3] = (prune_color == board_in[4][3]) ? (or_wires[4][3] ? board_in[4][3] : e) : (board_in[4][3]);
		pruned_board[4][4] = (prune_color == board_in[4][4]) ? (or_wires[4][4] ? board_in[4][4] : e) : (board_in[4][4]);
		pruned_board[4][5] = (prune_color == board_in[4][5]) ? (or_wires[4][5] ? board_in[4][5] : e) : (board_in[4][5]);
		pruned_board[4][6] = (prune_color == board_in[4][6]) ? (or_wires[4][6] ? board_in[4][6] : e) : (board_in[4][6]);
		pruned_board[4][7] = (prune_color == board_in[4][7]) ? (or_wires[4][7] ? board_in[4][7] : e) : (board_in[4][7]);
		pruned_board[4][8] = (prune_color == board_in[4][8]) ? (or_wires[4][8] ? board_in[4][8] : e) : (board_in[4][8]);
		pruned_board[5][0] = (prune_color == board_in[5][0]) ? (or_wires[5][0] ? board_in[5][0] : e) : (board_in[5][0]);
		pruned_board[5][1] = (prune_color == board_in[5][1]) ? (or_wires[5][1] ? board_in[5][1] : e) : (board_in[5][1]);
		pruned_board[5][2] = (prune_color == board_in[5][2]) ? (or_wires[5][2] ? board_in[5][2] : e) : (board_in[5][2]);
		pruned_board[5][3] = (prune_color == board_in[5][3]) ? (or_wires[5][3] ? board_in[5][3] : e) : (board_in[5][3]);
		pruned_board[5][4] = (prune_color == board_in[5][4]) ? (or_wires[5][4] ? board_in[5][4] : e) : (board_in[5][4]);
		pruned_board[5][5] = (prune_color == board_in[5][5]) ? (or_wires[5][5] ? board_in[5][5] : e) : (board_in[5][5]);
		pruned_board[5][6] = (prune_color == board_in[5][6]) ? (or_wires[5][6] ? board_in[5][6] : e) : (board_in[5][6]);
		pruned_board[5][7] = (prune_color == board_in[5][7]) ? (or_wires[5][7] ? board_in[5][7] : e) : (board_in[5][7]);
		pruned_board[5][8] = (prune_color == board_in[5][8]) ? (or_wires[5][8] ? board_in[5][8] : e) : (board_in[5][8]);
		pruned_board[6][0] = (prune_color == board_in[6][0]) ? (or_wires[6][0] ? board_in[6][0] : e) : (board_in[6][0]);
		pruned_board[6][1] = (prune_color == board_in[6][1]) ? (or_wires[6][1] ? board_in[6][1] : e) : (board_in[6][1]);
		pruned_board[6][2] = (prune_color == board_in[6][2]) ? (or_wires[6][2] ? board_in[6][2] : e) : (board_in[6][2]);
		pruned_board[6][3] = (prune_color == board_in[6][3]) ? (or_wires[6][3] ? board_in[6][3] : e) : (board_in[6][3]);
		pruned_board[6][4] = (prune_color == board_in[6][4]) ? (or_wires[6][4] ? board_in[6][4] : e) : (board_in[6][4]);
		pruned_board[6][5] = (prune_color == board_in[6][5]) ? (or_wires[6][5] ? board_in[6][5] : e) : (board_in[6][5]);
		pruned_board[6][6] = (prune_color == board_in[6][6]) ? (or_wires[6][6] ? board_in[6][6] : e) : (board_in[6][6]);
		pruned_board[6][7] = (prune_color == board_in[6][7]) ? (or_wires[6][7] ? board_in[6][7] : e) : (board_in[6][7]);
		pruned_board[6][8] = (prune_color == board_in[6][8]) ? (or_wires[6][8] ? board_in[6][8] : e) : (board_in[6][8]);
		pruned_board[7][0] = (prune_color == board_in[7][0]) ? (or_wires[7][0] ? board_in[7][0] : e) : (board_in[7][0]);
		pruned_board[7][1] = (prune_color == board_in[7][1]) ? (or_wires[7][1] ? board_in[7][1] : e) : (board_in[7][1]);
		pruned_board[7][2] = (prune_color == board_in[7][2]) ? (or_wires[7][2] ? board_in[7][2] : e) : (board_in[7][2]);
		pruned_board[7][3] = (prune_color == board_in[7][3]) ? (or_wires[7][3] ? board_in[7][3] : e) : (board_in[7][3]);
		pruned_board[7][4] = (prune_color == board_in[7][4]) ? (or_wires[7][4] ? board_in[7][4] : e) : (board_in[7][4]);
		pruned_board[7][5] = (prune_color == board_in[7][5]) ? (or_wires[7][5] ? board_in[7][5] : e) : (board_in[7][5]);
		pruned_board[7][6] = (prune_color == board_in[7][6]) ? (or_wires[7][6] ? board_in[7][6] : e) : (board_in[7][6]);
		pruned_board[7][7] = (prune_color == board_in[7][7]) ? (or_wires[7][7] ? board_in[7][7] : e) : (board_in[7][7]);
		pruned_board[7][8] = (prune_color == board_in[7][8]) ? (or_wires[7][8] ? board_in[7][8] : e) : (board_in[7][8]);
		pruned_board[8][0] = (prune_color == board_in[8][0]) ? (or_wires[8][0] ? board_in[8][0] : e) : (board_in[8][0]);
		pruned_board[8][1] = (prune_color == board_in[8][1]) ? (or_wires[8][1] ? board_in[8][1] : e) : (board_in[8][1]);
		pruned_board[8][2] = (prune_color == board_in[8][2]) ? (or_wires[8][2] ? board_in[8][2] : e) : (board_in[8][2]);
		pruned_board[8][3] = (prune_color == board_in[8][3]) ? (or_wires[8][3] ? board_in[8][3] : e) : (board_in[8][3]);
		pruned_board[8][4] = (prune_color == board_in[8][4]) ? (or_wires[8][4] ? board_in[8][4] : e) : (board_in[8][4]);
		pruned_board[8][5] = (prune_color == board_in[8][5]) ? (or_wires[8][5] ? board_in[8][5] : e) : (board_in[8][5]);
		pruned_board[8][6] = (prune_color == board_in[8][6]) ? (or_wires[8][6] ? board_in[8][6] : e) : (board_in[8][6]);
		pruned_board[8][7] = (prune_color == board_in[8][7]) ? (or_wires[8][7] ? board_in[8][7] : e) : (board_in[8][7]);
		pruned_board[8][8] = (prune_color == board_in[8][8]) ? (or_wires[8][8] ? board_in[8][8] : e) : (board_in[8][8]);	
	end	
endmodule
