`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2020 12:28:15 AM
// Design Name: 
// Module Name: txrx_tb
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


module txrx_tb;
    logic clk, rst, trig; 
    logic [1:0] line;
    logic [15:0] sw;
    logic [3:0] vga_r, vga_b, vga_g;
    logic vga_hs, vga_vs;
    
    assign sw = 16'b0000_0000_0000_0001;
    top_level uut(.clk_100mhz(clk),
                  .sw(sw),
                  .btnc(rst),
                  .btnu(trig),
                  .jb(line),
                  .vga_r(vga_r),
                  .vga_b(vga_b),
                  .vga_g(vga_g),
                  .vga_hs(vga_hs),
                  .vga_vs(vga_vs),
                  .ja(line));
                 
    always begin
        #5;
        clk = !clk;
     end

     initial begin
        clk = 0;
        rst = 0;
        trig = 0;
        #10000;
        rst = 1;
        #100;
        rst = 0;
        
        #4_000_000
        trig = 1;
        #200;
        trig = 0;
        #20000;
     end
endmodule
