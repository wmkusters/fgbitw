`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2020 10:32:08 PM
// Design Name: 
// Module Name: top_level
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


module top_level(   input               clk_100mhz,
                    input [15:0]        sw,
                    input               btnc,
                    input               btnd,
                    output logic [15:0] led,
                    output logic [1:0]  ja
    );
    
    logic               clean;
    logic               old_clean;
    assign led = sw;
    assign ja[1] = 0; //just assign this to be 0
    
    always_ff @(posedge clk_100mhz)begin
        old_clean <= clean;  //for rising edge detection
    end
    
    debounce my_deb(.clk_in(clk_100mhz), 
                    .rst_in(btnd),
                    .bouncey_in(btnc), 
                    .clean_out(clean));
    
    serial_tx my_tx(.clk_in(clk_100mhz), 
                    .rst_in(btnd), 
                    .trigger_in(clean&~old_clean),
                    .val_in(sw[7:0]),
                    .data_out(ja[0]));
endmodule//top_level
