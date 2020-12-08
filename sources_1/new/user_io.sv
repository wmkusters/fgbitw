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
    output logic [7:0] leds,
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
    parameter BOT_EDGE = 4'b1000;

    parameter e = 2'b00;

    logic [7:0] cursor;
    logic [3:0] dir, dir_mem, row, col;
    logic [4:0] state, next_state;
    logic valid_move, cursor_done, up_valid, down_valid, left_valid, right_valid, btn_press;
    logic at_top_edge, at_bot_edge, at_right_edge, at_left_edge;
    always_comb begin
        row = move_out[7:4];
        col = move_out[3:0];
        at_top_edge = (row == TOP_EDGE);
        at_bot_edge = (row == BOT_EDGE);
        at_right_edge = (col == RIGHT_EDGE);
        at_left_edge = (col == LEFT_EDGE);

        up_valid = at_top_edge ? 0      : (board[row-1][col] == e) ? 1 : 0;
        down_valid = at_bot_edge ? 0    : (board[row+1][col] == e) ? 1 : 0;
        right_valid = at_right_edge ? 0 : (board[row][col+1] == e) ? 1 : 0;
        left_valid = at_left_edge ? 0   : (board[row][col-1] == e) ? 1 : 0;

        leds[7] = up_valid;
        leds[6] = down_valid;
        leds[5] = left_valid;
        leds[4] = right_valid;
        leds[3] = at_top_edge;
        leds[2] = at_bot_edge;
        leds[1] = at_left_edge;
        leds[0] = at_right_edge;
        // seg_data = {cursor, move_out};

        btn_press = (up | down | left | right);
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
        end else if (my_turn & (state == LOCKED)) begin
            next_state = WAITING;
        end else if (state == PULSE_MOVE) begin
            next_state = LOCKED;
        end else begin
            next_state = state;
        end

        if (state == MOVE_CURSOR) begin
            case (dir_mem)
                UP: cursor_done    = (up_valid | at_top_edge);
                DOWN: cursor_done  = (down_valid | at_bot_edge); 
                LEFT: cursor_done  = (left_valid | at_left_edge);
                RIGHT: cursor_done = (right_valid | at_right_edge);
            endcase
        end else cursor_done = 0;
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
                    dir_mem <= dir;
                    move_ready <= pass_sw ? 8'b1111_1111 : move_ready <= 0;
                end
                PULSE_MOVE: begin
                    move_ready <= 1;
                end
                MOVE_CURSOR: begin
                    case (dir_mem)
                        UP: begin
                            cursor[7:4] <= up_valid ? move_out[7:4] - 1 : cursor;
                            move_out[7:4] <= at_top_edge ? cursor : move_out[7:4] - 1;
                        end
                        DOWN: begin
                            cursor[7:4] <= down_valid ? move_out[7:4] + 1 : cursor;
                            move_out[7:4] <= at_bot_edge ? cursor : move_out[7:4] + 1;
                        end
                        LEFT: begin 
                            cursor[3:0] <= left_valid ? move_out[3:0] - 1 : cursor;
                            move_out[3:0] <= at_left_edge ? cursor : move_out[3:0] - 1;
                        end
                        RIGHT: begin
                            cursor[3:0] <= right_valid ? move_out[3:0] + 1: cursor;
                            move_out[3:0] <= at_right_edge ? cursor : move_out[3:0] + 1;
                        end
                        default: cursor <= cursor;
                    endcase
                end
                LOCKED: begin
                    move_ready <= 0;
                end 
                default: state <= WAITING;
            endcase
        end
    end
endmodule
