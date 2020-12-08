`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 03:07:49 AM
// Design Name: 
// Module Name: seg_disp
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


module seg_disp(
    input logic game_over,
    input logic my_color,
    input logic my_turn,
    input logic [7:0] bcount,
    input logic [7:0] wcount,
    input logic [6:0] game_state,
    input logic pass_sw,
    output logic [5:0] seg_data_out [7:0]
    );
    
    parameter PASSED_WAITING    = 7'b0010000;
    parameter [5:0] BLANK   = 6'd10;
    parameter [5:0] A       = 6'd11;
    parameter [5:0] C       = 6'd13;
    parameter [5:0] D       = 6'd14;
    parameter [5:0] E       = 6'd15;
    parameter [5:0] G       = 6'd17;
    parameter [5:0] I       = 6'd19;
    parameter [5:0] J       = 6'd20;
    parameter [5:0] L       = 6'd22;
    parameter [5:0] N       = 6'd24;
    parameter [5:0] O       = 6'd25;
    parameter [5:0] P       = 6'd26;
    parameter [5:0] Q       = 6'd27;
    parameter [5:0] R       = 6'd28;
    parameter [5:0] S       = 6'd29;
    parameter [5:0] T       = 6'd30;
    parameter [5:0] U       = 6'd31;
    parameter [5:0] V       = 6'd32;
    parameter [5:0] X       = 6'd34;
    parameter [5:0] Y       = 6'd35;
    logic [5:0] LOSER [7:0]      = '{BLANK, BLANK, BLANK,     L,     O,     S,     E,     R};
    logic [5:0] WINNER [7:0]     = '{BLANK,     V,     I,     C,     T,     O,     R,     Y};
    logic [5:0] TIED [7:0]       = '{BLANK, BLANK,     T,     I,     E,     D, BLANK, BLANK};
    logic [5:0] PASS_Q   [7:0]   = '{    P,     A,     S,     S,     Q, BLANK, BLANK, BLANK};
    logic [5:0] END_GAME_Q [7:0] = '{    E,     N,     D,     Q, BLANK, BLANK, BLANK, BLANK};
    logic [5:0] PASSED [7:0]     = '{    P,     A,     S,     S,     E,     D, BLANK, BLANK};
    logic [5:0] bterr_data [7:0];
    assign bterr_data = '{black_ten, black_one, BLANK, BLANK, BLANK, BLANK, white_ten, white_one};
    logic [5:0] wterr_data [7:0];
    assign wterr_data = '{white_ten, white_one, BLANK, BLANK, BLANK, BLANK, black_ten, black_one};
    logic [5:0] terr_data [7:0];
    assign terr_data = my_color ? wterr_data : bterr_data;
    
    logic [3:0] white_ten, white_one, black_ten, black_one; 
    byte_to_dec converter_white(.byte_in(wcount),
                                .dec_out_ten(white_ten),
                                .dec_out_one(white_one));
    byte_to_dec converter_black(.byte_in(bcount),
                                .dec_out_ten(black_ten),
                                .dec_out_one(black_one));

    
    always_comb begin
        if (game_over) begin
            seg_data_out = (bcount[7:0] == wcount[7:0]) ? TIED : ~((wcount[7:0] > bcount[7:0]) ^ my_color) ? WINNER : LOSER;
        end else if (game_state == PASSED_WAITING) begin
            seg_data_out = (~my_turn) ? PASSED : (pass_sw ? END_GAME_Q : terr_data);
        end else begin
            seg_data_out = pass_sw ? PASS_Q : terr_data;
        end
        
    end
    
endmodule
