`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2020 06:19:55 PM
// Design Name: 
// Module Name: display
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


module display(
    input clk, reset,
    input [15:0] sw,
    input logic [1:0] board [8:0][8:0],
    output logic[3:0] vga_r,
    output logic[3:0] vga_b,
    output logic[3:0] vga_g,
    output logic vga_hs,
    output logic vga_vs
    );
   
    logic [10:0] hcount;    // pixel on current line
    logic [9:0] vcount;     // line number
    logic hsync, vsync;
    logic [11:0] pixel;
    logic [11:0] rgb;  
    
    xvga xvga1(.vclock_in(clk),.hcount_out(hcount),.vcount_out(vcount),
               .hsync_out(hsync),.vsync_out(vsync),.blank_out(blank));
                                            
    logic phsync,pvsync,pblank;
    go_game gg(.vclock_in(clk),.reset_in(reset),
                .hcount_in(hcount),.vcount_in(vcount), .board(board),
                .hsync_in(hsync),.vsync_in(vsync),.blank_in(blank),
                .phsync_out(phsync),.pvsync_out(pvsync),.pblank_out(pblank),.pixel_out(pixel));

    logic border = (hcount==0 | hcount==1023 | vcount==0 | vcount==767 |
                   hcount == 512 | vcount == 384);

    logic b,hs,vs;
    always_ff @(posedge clk) begin
         // default: go!
         hs <= phsync;
         vs <= pvsync;
         b <= pblank;
         rgb <= pixel;
    end

//    assign rgb = sw[0] ? {12{border}} : pixel ; //{{4{hcount[7]}}, {4{hcount[6]}}, {4{hcount[5]}}};

    // the following lines are required for the Nexys4 VGA circuit - do not change
    assign vga_r = ~b ? rgb[11:8]: 0;
    assign vga_g = ~b ? rgb[7:4] : 0;
    assign vga_b = ~b ? rgb[3:0] : 0;

    assign vga_hs = ~hs;
    assign vga_vs = ~vs;

endmodule    
    
    
module go_game(
   input vclock_in,        // 65MHz clock
   input reset_in,         // 1 to initialize module
   input logic [1:0] board [0:8][0:8],
   input [10:0] hcount_in, // horizontal index of current pixel (0..1023)
   input [9:0]  vcount_in, // vertical index of current pixel (0..767)
   input hsync_in,         // XVGA horizontal sync signal (active low)
   input vsync_in,         // XVGA vedefrtical sync signal (active low)
   input blank_in,         // XVGA blanking (1 means output black pixel)
        
   output logic phsync_out,       // pong game's horizontal sync
   output logic pvsync_out,       // pong game's vertical sync
   output logic pblank_out,       // pong game's blanking
   output logic [11:0] pixel_out  // pong game's pixel  // r=11:8, g=7:4, b=3:0
   );
   parameter DISPLAY_WIDTH  = 1024;      // display width
   parameter DISPLAY_HEIGHT = 768;       // number of lines
   
   parameter SPACER = 50;
   parameter BOARD_BOTTOM = DISPLAY_HEIGHT - SPACER;
   parameter BOARD_LENGTH = BOARD_BOTTOM-SPACER;
   parameter BOARD_LEFT = DISPLAY_WIDTH/2 - BOARD_LENGTH/2;
   parameter BOARD_RIGHT = DISPLAY_WIDTH/2 + BOARD_LENGTH/2;
   parameter BOARD_INTERVAL = BOARD_LENGTH/8;
   parameter TILE_WIDTH = BOARD_INTERVAL/2-8;
   
   parameter hline0 = BOARD_BOTTOM;
   parameter hline1 = BOARD_BOTTOM - BOARD_INTERVAL;
   parameter hline2 = BOARD_BOTTOM - 2*BOARD_INTERVAL;
   parameter hline3 = BOARD_BOTTOM - 3*BOARD_INTERVAL;
   parameter hline4 = BOARD_BOTTOM - 4*BOARD_INTERVAL;
   parameter hline5 = BOARD_BOTTOM - 5*BOARD_INTERVAL;
   parameter hline6 = BOARD_BOTTOM - 6*BOARD_INTERVAL;
   parameter hline7 = BOARD_BOTTOM - 7*BOARD_INTERVAL;
   parameter hline8 = BOARD_BOTTOM - 8*BOARD_INTERVAL;
   
   parameter vline0 = BOARD_LEFT;
   parameter vline1 = BOARD_LEFT + BOARD_INTERVAL;
   parameter vline2 = BOARD_LEFT + 2*BOARD_INTERVAL;
   parameter vline3 = BOARD_LEFT + 3*BOARD_INTERVAL;
   parameter vline4 = BOARD_LEFT + 4*BOARD_INTERVAL;
   parameter vline5 = BOARD_LEFT + 5*BOARD_INTERVAL;
   parameter vline6 = BOARD_LEFT + 6*BOARD_INTERVAL;
   parameter vline7 = BOARD_LEFT + 7*BOARD_INTERVAL;
   parameter vline8 = BOARD_LEFT + 8*BOARD_INTERVAL;
   
   parameter [1:0] b = 2'b01;
   parameter [1:0] w = 2'b10;
   parameter [1:0] r = 2'b11;
   
   logic grid, hgrid, vgrid, inbounds, intersection, on_tile, tilebound;
   logic [31:0] hgrid_bounds [8:0][8:0];
   logic [31:0] vgrid_bounds [8:0][8:0];
   logic [15:0] lower_hbound, upper_hbound, lower_vbound, upper_vbound;
   logic [11:0] tilecolor;
   logic [7:0] i, j, i_next, j_next;
   
   always_comb begin
        case (vcount_in)
            hline0 : hgrid = 1;
            hline1 : hgrid = 1;
            hline2 : hgrid = 1;
            hline3 : hgrid = 1;
            hline4 : hgrid = 1;
            hline5 : hgrid = 1;
            hline6 : hgrid = 1;
            hline7 : hgrid = 1;
            hline8 : hgrid = 1;
            default : hgrid = 0;
        endcase
        case (hcount_in)
            vline0 : vgrid = 1;
            vline1 : vgrid = 1;
            vline2 : vgrid = 1;
            vline3 : vgrid = 1;
            vline4 : vgrid = 1;
            vline5 : vgrid = 1;
            vline6 : vgrid = 1;
            vline7 : vgrid = 1;
            vline8 : vgrid = 1;
            default : vgrid = 0;
        endcase
        
        inbounds = (hcount_in < vline8 + 1 & 
                   hcount_in > vline0 - 1  & 
                   vcount_in < hline0 + 1  & 
                   vcount_in > hline8 - 1);
        grid = ((hgrid | vgrid) & inbounds);
        intersection = (hgrid & vgrid & inbounds);
        
        lower_hbound = hcount_in - TILE_WIDTH;
        upper_hbound = hcount_in + TILE_WIDTH;
        lower_vbound = vcount_in + TILE_WIDTH;
        upper_vbound = vcount_in - TILE_WIDTH;
        
        if (i < 8) i_next = i+1;
        else i_next = 0;
        if (j < 8) j_next = j+1;
        else j_next = 0;
        
        tilebound = ((hcount_in > hgrid_bounds[i][j][31:16]) &
                     (hcount_in < hgrid_bounds[i][j][15:0])  &
                     (vcount_in > vgrid_bounds[i][j][15:0])  &
                     (vcount_in < vgrid_bounds[i][j][31:16]));
        on_tile = (board[i][j] == b | board[i][j] == w | board[i][j] == r);
        if (board[i][j] == b) tilecolor = 12'b0;
        else if (board[i][j] == r) tilecolor = 12'b1111_0000_0000;
        else  tilecolor = 12'b1111_1111_1111;
   end
   
   assign phsync_out = hsync_in;
   assign pvsync_out = vsync_in;
   assign pblank_out = blank_in;
//   assign checkerboard = hcount_in[8:6] + vcount_in[8:6];

   
   logic init, hold;
   always_ff @(posedge vclock_in) begin
       if (reset_in) begin
           i <= 0;
           j <= 0;
           init <= 1;
           hold <= 1;
        end else begin
            if (hold) begin
                if (hcount_in == 1343 & vcount_in == 805) begin
                    hold <= 0;
                    init <= 0;
                end
            end
            if (~init & intersection) begin // need to initialize lower bounds
                hgrid_bounds[i][j] <= {{lower_hbound}, {upper_hbound}};
                vgrid_bounds[i][j] <= {{lower_vbound}, {upper_vbound}};
                if (j == 8) i <= i_next;
                j <= j_next;
                if ((i == 8) & (j == 8)) begin
                    init <= 1;
                    i <= 0;
                    j <= 0;
                end
                pixel_out <= 0;
            end
            if (init & ~hold) begin
                if (hcount_in == hgrid_bounds[i][j][15:0]) j <= j_next;
                if (vcount_in == vgrid_bounds[i][j][31:16]) i <= i_next;
                if (tilebound & on_tile) pixel_out <= tilecolor;
                if (~tilebound & on_tile & grid) pixel_out <= 0;
                if (~tilebound & on_tile & ~grid) pixel_out <= {{4{1'b1}}, {4{1'b1}}, {4{1'b0}}};
                if (~on_tile & grid) pixel_out <= 0;
                if (~on_tile & ~grid) pixel_out <= {{4{1'b1}}, {4{1'b1}}, {4{1'b0}}};
            end
        end
    end
endmodule

   
module synchronize #(parameter NSYNC = 3)  // number of sync flops.  must be >= 2
                   (input clk,in,
                    output logic out);

  logic [NSYNC-2:0] sync;

  always_ff @ (posedge clk) begin
    {out,sync} <= {sync[NSYNC-2:0],in};
  end
endmodule


//////////////////////////////////////////////////////////////////////////////////
// Update: 8/8/2019 GH 
// Create Date: 10/02/2015 02:05:19 AM
// Module Name: xvga
//
// xvga: Generate VGA display signals (1024 x 768 @ 60Hz)
//
//                              ---- HORIZONTAL -----     ------VERTICAL -----
//                              Active                    Active
//                    Freq      Video   FP  Sync   BP      Video   FP  Sync  BP
//   640x480, 60Hz    25.175    640     16    96   48       480    11   2    31
//   800x600, 60Hz    40.000    800     40   128   88       600     1   4    23
//   1024x768, 60Hz   65.000    1024    24   136  160       768     3   6    29
//   1280x1024, 60Hz  108.00    1280    48   112  248       768     1   3    38
//   1280x720p 60Hz   75.25     1280    72    80  216       720     3   5    30
//   1920x1080 60Hz   148.5     1920    88    44  148      1080     4   5    36
//
// change the clock frequency, front porches, sync's, and back porches to create 
// other screen resolutions
////////////////////////////////////////////////////////////////////////////////

module xvga(input vclock_in,
            output logic [10:0] hcount_out,    // pixel number on current line
            output logic [9:0] vcount_out,     // line number
            output logic vsync_out, hsync_out,
            output logic blank_out);

   parameter DISPLAY_WIDTH  = 1024;      // display width
   parameter DISPLAY_HEIGHT = 768;       // number of lines

   parameter  H_FP = 24;                 // horizontal front porch
   parameter  H_SYNC_PULSE = 136;        // horizontal sync
   parameter  H_BP = 160;                // horizontal back porch

   parameter  V_FP = 3;                  // vertical front porch
   parameter  V_SYNC_PULSE = 6;          // vertical sync 
   parameter  V_BP = 29;                 // vertical back porch

   // horizontal: 1344 pixels total
   // display 1024 pixels per line
   logic hblank,vblank;
   logic hsyncon,hsyncoff,hreset,hblankon;
   assign hblankon = (hcount_out == (DISPLAY_WIDTH -1));
   assign hsyncon = (hcount_out == (DISPLAY_WIDTH + H_FP - 1));  //1047
   assign hsyncoff = (hcount_out == (DISPLAY_WIDTH + H_FP + H_SYNC_PULSE - 1));  // 1183
   assign hreset = (hcount_out == (DISPLAY_WIDTH + H_FP + H_SYNC_PULSE + H_BP - 1));  //1343

   // vertical: 806 lines total
   // display 768 lines
   logic vsyncon,vsyncoff,vreset,vblankon;
   assign vblankon = hreset & (vcount_out == (DISPLAY_HEIGHT - 1));   // 767 
   assign vsyncon = hreset & (vcount_out == (DISPLAY_HEIGHT + V_FP - 1));  // 771
   assign vsyncoff = hreset & (vcount_out == (DISPLAY_HEIGHT + V_FP + V_SYNC_PULSE - 1));  // 777
   assign vreset = hreset & (vcount_out == (DISPLAY_HEIGHT + V_FP + V_SYNC_PULSE + V_BP - 1)); // 805

   // sync and blanking
   logic next_hblank,next_vblank;
   assign next_hblank = hreset ? 0 : hblankon ? 1 : hblank;
   assign next_vblank = vreset ? 0 : vblankon ? 1 : vblank;
   always_ff @(posedge vclock_in) begin
      hcount_out <= hreset ? 0 : hcount_out + 1;
      hblank <= next_hblank;
      hsync_out <= hsyncon ? 0 : hsyncoff ? 1 : hsync_out;  // active low

      vcount_out <= hreset ? (vreset ? 0 : vcount_out + 1) : vcount_out;
      vblank <= next_vblank;
      vsync_out <= vsyncon ? 0 : vsyncoff ? 1 : vsync_out;  // active low

      blank_out <= next_vblank | (next_hblank & ~hreset);
   end
endmodule
