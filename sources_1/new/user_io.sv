`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 09:27:57 PM
// Design Name: 
// Module Name: user_io
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


module user_io(
	input logic clk_in,
	input logic reset,
	input logic my_turn,
	input logic make_move,
	input logic [7:0] move_in,
	input logic [1:0] board [8:0][8:0],
	output logic locked,
	output logic move_ready,
	output logic [7:0] move_out
    );
	parameter WAITING    = 4'b0001;
	parameter PULSE_MOVE = 4'b0010;
	parameter LOCKED     = 4'b0100;
	
	parameter e = 2'b00;

	logic [3:0] state, next_state;

	always_comb begin
		if (~my_turn) begin
			next_state = LOCKED; // debounce should cover time taken to get new turn
		end else if (make_move & (state == WAITING) & (board[move_in[7:4]][move_in[3:0]] == e)) begin 
			next_state = PULSE_MOVE;
		end else begin
	    	next_state = WAITING;
	    end
	    if (state == LOCKED) locked = 1;
	    else locked = 0;
	end

	always_ff @(posedge clk_in) begin
		if (reset) begin
			move_out <= 8'b0000_0000;
			state <= WAITING;
			move_ready <= 0;
		end else begin
			state <= next_state;
			move_out <= move_in;
			case (state)
				WAITING: begin
					move_ready <= 0;
				end
				PULSE_MOVE: begin
					move_ready <= 1;
				end
				LOCKED: begin
					move_ready <= 0;
				end 
				default: state <= WAITING;
			endcase
		end
	end
endmodule
