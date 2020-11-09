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
                input logic clk_in, reset, move_avail,
                input logic [7:0] move,
                output logic [1:0] board [8:0][8:0]
    );
    parameter RESET_IN = 8'b0;
    parameter MOVE_READY = 8'b0000_0001;
    
    parameter [1:0] b = 2'b01;
    parameter [1:0] w = 2'b10;
    parameter [1:0] e = 2'b00;
    parameter [1:0] EMPTY_BOARD [8:0][8:0] ='{'{e, e, e, e, e, e, e, e, e},
                                              '{e, e, e, e, e, e, e, e, e},
                                              '{e, e, e, e, e, e, e, e, e},
                                              '{e, e, e, e, e, e, e, e, e},
                                              '{e, e, e, e, e, e, e, e, e},
                                              '{e, e, e, e, e, e, e, e, e},
                                              '{e, e, e, e, e, e, e, e, e},
                                              '{e, e, e, e, e, e, e, e, e},
                                              '{e, e, e, e, e, e, e, e, e}};
                                              
//    parameter BOARD1 = {9{3'b0}, 9{3'b0}, };
    
    logic [1:0] next_board [8:0][8:0];
    logic [7:0] input_state;
    
    always_comb begin
        if (reset) input_state = RESET_IN;
        else if (move_avail) input_state = MOVE_READY;
    end
    
    always_ff @(posedge clk_in) begin
        case (input_state)
            RESET_IN  : begin
                            board <= EMPTY_BOARD;
                        end
            MOVE_READY: begin
                            board <= next_board;
                        end
        endcase
    end
endmodule
