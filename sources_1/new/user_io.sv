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
    input logic pass_sw,
    input logic up, down, left, right, make_move,
    input logic [1:0] board [8:0][8:0],
    output logic locked,
    output logic move_ready,
    output logic [7:0] move_out
    );
    parameter WAITING      = 5'b0_0001;
    parameter MOVE_CURSOR  = 5'b0_0010;
    parameter PULSE_MOVE   = 5'b0_0100;
    parameter LOCKED       = 5'b0_1000;
    parameter RESET_CURSOR = 5'b1_0000;

    parameter UP = 4'b1000;
    parameter DOWN = 4'b0100;
    parameter LEFT = 4'b0010;
    parameter RIGHT = 4'b0001;
   
    parameter RIGHT_EDGE = 4'b1000;
    parameter LEFT_EDGE = 4'b0000;
    parameter TOP_EDGE = 4'b0000;
    parameter BOT_EDGE = 4'b0000;

    parameter e = 2'b00;

    logic [7:0] cursor;
    logic [3:0] state, next_state, dir, dir_mem;
    logic valid_move, cursor_done, up_valid, down_valid, left_valid, right_valid, btn_press;
    always_comb begin
        // valid_move = ((board[move_out[7:4]][move_out[3:0]] == e) & (move_out[7:4] < 4'b1001) & (move_out[3:0] < 4'b1001));
        up_valid = ((move_out[7:4] + 1 < 9) & (board[move_out[7:4] + 1][move_out[3:0]] == e));
        down_valid = ((move_out[7:4] - 1 > 0) & (board[move_out[7:4] - 1][move_out[3:0]] == e));
        right_valid = ((move_out[3:0] - 1 > 0) & (board[move_out[7:4]][move_out[3:0]-1] == e));
        left_valid = ((move_out[3:0] + 1 < 8) & (board[move_out[7:4]][move_out[3:0]+1] == e));
        btn_press = (up | down | left | right);
        
        right_move = move_out[3:0] + 1;
        up_move = move_out[7:4] - 1;
        down_move = move_out[7:4] + 1;
        left_move = move_out[3:0] - 1;

        if (up) dir = UP;
        else if (down) dir = DOWN;
        else if (left) dir = LEFT;
        else if (right) dir = RIGHT;
        else dir = 0;

        if (~my_turn) begin
            next_state = LOCKED; // debounce should cover time taken to get new turn
        end else if (make_move & (state == WAITING)) begin 
        // end else if (make_move & (state == WAITING) & valid_move) begin 
            next_state = PULSE_MOVE;
        end else if (btn_press & (state == WAITING)) begin
            next_state = MOVE_CURSOR;
        end else if (cursor_done & (state == MOVE_CURSOR)) begin
            next_state = WAITING;
        end else next_state = state;

        if (state == MOVE_CURSOR) begin
            case (dir_mem)
                UP: cursor_done = (up_valid | (move_out[7:4] + 1 == 9));
                DOWN: cursor_done = (down_valid | (move_out[7:4] - 1 == 0)); 
                LEFT: cursor_done = (left_valid | (move_out[3:0] - 1 == 0));
                RIGHT: cursor_done = (right_valid | (move_out[3:0] + 1 == 9));
            endcase
        end else cursor_done = 0;

        if (state == LOCKED) locked = 1;
        else locked = 0;
    end

    always_ff @(posedge clk_in) begin
        if (reset) begin
            move_out <= 8'b0000_0000;
            cursor <= 8'b0000_0000;
            state <= WAITING;
            move_ready <= 0;
        end else begin
            state <= next_state;
            case (state)
                WAITING: begin
                    move_ready <= 0;
                    // cursor_done <= 0;
                    dir_mem <= dir;
                end
                PULSE_MOVE: begin
                    move_ready <= 1;
                end
                MOVE_CURSOR: begin
                    case (dir_mem)
                        UP: begin
                            // cursor_done <= up_valid ? 1 : 0;
                            cursor[7:4] <= up_valid ? (up_move) : cursor[7:4];
                            if (up_move == TOP_EDGE  1) begin
                                // cursor_done <= 1;
                                move_out <= cursor;
                            end else move_out[7:4] <= up_move;
                        end
                        DOWN: begin
                            // cursor_done <= down_valid ? 1 : 0;  
                            cursor[7:4] <= down_valid ? (down_move) : cursor[7:4];
                            if (down_move == BOT_EDGE + 1) begin
                                // cursor_done <= 1;
                                move_out <= cursor;
                            end else move_out[7:4] <= down_move;
                        end
                        LEFT: begin 
                            // cursor_done <= left_valid ? 1 : 0;                            
                            cursor[3:0] <= left_valid ? (move_out[3:0] - 1) : cursor[3:0];
                            if (move_out[3:0] + 1 == 9) begin
                                // cursor_done <= 1;
                                move_out <= cursor;
                            end else move_out[3:0] <= move_out[3:0] - 1;
                        end
                        RIGHT: begin
                            cursor[3:0] <= right_valid ? (right_move) : cursor[3:0];
                            if (right_move == RIGHT_EDGE + 1) begin
                                move_out <= cursor;
                            end else move_out[3:0] <= right_move;
                        end
                        default: cursor <= cursor;
                    endcase
                end
                LOCKED: begin
                    move_ready <= 0;
                    // cursor_done <= 0;
                end 
                default: state <= WAITING;
            endcase
        end
    end
endmodule
