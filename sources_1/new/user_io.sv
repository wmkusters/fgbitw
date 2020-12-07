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
    output logic [7:0] move_out,
    output logic [3:0] row, col
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
    parameter BOT_EDGE = 4'b1000;

    parameter e = 2'b00;

    logic [7:0] cursor, right_move, left_move, down_move, up_move;
    logic [3:0] dir, dir_mem;// row, col;
    logic [4:0] state, next_state;
    logic valid_move, cursor_done, up_valid, down_valid, left_valid, right_valid, btn_press;
    logic at_top_edge, at_bot_edge, at_right_edge, at_left_edge;
    always_comb begin
        // valid_move = ((board[move_out[7:4]][move_out[3:0]] == e) & (move_out[7:4] < 4'b1001) & (move_out[3:0] < 4'b1001));
        row = move_out[7:4];
        col = move_out[3:0];
        at_top_edge = (row == TOP_EDGE);
        at_bot_edge = (row == BOT_EDGE);
        at_right_edge = (col == RIGHT_EDGE);
        at_left_edge = (col == LEFT_EDGE);

        up_valid = at_top_edge ? 0 : (board[row-1][col] == e) ? 1 : 0;
        down_valid = at_bot_edge ? 0 : (board[row+1][col] == e) ? 1 : 0;
        right_valid = at_right_edge ? 0 : (board[row][col+1] == e) ? 1 : 0;
        left_valid = at_left_edge ? 0 : (board[row][col-1] == e) ? 1 : 0;

        btn_press = (up | down | left | right);
        
        right_move = {row, col + 1};
        up_move = {row - 1, col};
        down_move = {row + 1, col};
        left_move = {row, col - 1};

        if (up) dir = UP;
        else if (down) dir = DOWN;
        else if (left) dir = LEFT;
        else if (right) dir = RIGHT;
        else dir = 0;

        if (~my_turn) begin
            next_state = LOCKED; // debounce should cover time taken to get new turn
        end else if (make_move & (state == WAITING)) begin 
            next_state = PULSE_MOVE;
        end else if (btn_press & (state == WAITING)) begin
            next_state = MOVE_CURSOR;
        end else if (cursor_done & (state == MOVE_CURSOR)) begin
            next_state = WAITING;
        end else if (my_turn) begin
            next_state = WAITING;
        end else begin
            next_state = state;
        end

        if (state == MOVE_CURSOR) begin
            case (dir_mem)
                UP: cursor_done = (up_valid | at_top_edge);
                DOWN: cursor_done = (down_valid | at_bot_edge); 
                LEFT: cursor_done = (left_valid | at_left_edge);
                RIGHT: cursor_done = (right_valid | at_right_edge);
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
                    move_out <= cursor;
                end
                PULSE_MOVE: begin
                    move_ready <= 1;
                end
                MOVE_CURSOR: begin
                    case (dir_mem)
                        UP: begin
                            cursor <= up_valid ? up_move : cursor;
                            move_out <= at_top_edge ? cursor : up_move;
                        end
                        DOWN: begin
                            cursor <= down_valid ? down_move : cursor;
                            move_out <= at_bot_edge ? cursor : down_move;
                        end
                        LEFT: begin 
                            cursor <= left_valid ? left_move : cursor;
                            move_out <= at_left_edge ? cursor : left_move;
                        end
                        RIGHT: begin
                            cursor <= right_valid ? right_move : cursor;
                            move_out <= at_right_edge ? cursor : right_move;
                        end
                        default: cursor <= cursor;
                    endcase
                end
                LOCKED: begin
                    move_ready <= 0;
                    // move_out <= 8'b0000_0000;
                    // cursor <= 8'b0000_0000;
                end 
                default: state <= WAITING;
            endcase
        end
    end
endmodule
