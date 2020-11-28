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
    logic clk;
    logic rst;
    logic trig;
    logic [207:0] val_in;
    logic data_out;
    logic [161:0] data;
    logic ready;

    tx my_tx(    .clk_in(clk),
                 .rst_in(rst),
                 .trigger_in(trig),
                 .val_in(val_in),
                 .data_out(data_out));
                 
    rx my_rx(    .clk_in(clk),
                 .rst_in(rst),
                 .rx(data_out),
                 .data_out(data),
                 .ready(ready));
                 
    always begin
        #5;
        clk = !clk;
     end

     initial begin
        clk = 0;
        rst = 0;
        trig = 0;
        val_in = 208'hAAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA;
        #10000;
        rst = 1;
        #10;
        rst = 0;
        
        #30000000;
        trig = 1;
        #10000000;
        trig = 0;
        #30000000;
     end
endmodule
