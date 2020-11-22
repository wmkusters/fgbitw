`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2020 11:58:05 PM
// Design Name: 
// Module Name: tx_tb
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

module tx_tb;
    logic clk;
    logic rst;
    logic trig;
    logic [161:0] val_in;
    logic data_out;

    tx my_tx(    .clk_in(clk),
                 .rst_in(rst),
                 .trigger_in(trig),
                 .val_in(val_in),
                 .data_out(data_out));
                 
    always begin
        #5;
        clk = !clk;
     end

     initial begin
        clk = 0;
        rst = 0;
        trig = 0;
        val_in = 162'h2_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA;
        #10000;
        rst = 1;
        #10;
        rst = 0;
        
        #10;
        trig = 1;
        #10;
        trig = 0;
        #20000000;
     end
endmodule

