`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2020 10:33:46 PM
// Design Name: 
// Module Name: serial_tx
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


module tx (   input           clk_in,
              input           rst_in,
              input           trigger_in,
              input [7:0]     val_in,
              output logic    data_out);
    
    parameter   CLK_HZ = 65_000_000;
    parameter   BAUD_RATE = 9600;
    parameter   DIVISOR = 6771; //CLK_HZ/BAUD_RATE
    parameter   PKT_LEN = 8;
    
    reg   [31:0]        count;
    reg   [7:0]         shift;
    
    logic [(PKT_LEN + 1):0]       shift_buffer; 
    logic               send_flag;

    assign shift_buffer = {1'b1, val_in[(PKT_LEN-1):0], 1'b0};
    
    
    always_ff @(posedge clk_in) begin
        if (rst_in) begin
            count <= DIVISOR-1;
            send_flag <= 0;
            data_out <= 1'b1;
            shift <= 0;
        end else begin
            count <= count - 1;
            
            if (trigger_in) begin
                send_flag <= 1;
                count <= DIVISOR-1;
            end
            
            if (send_flag && ~trigger_in) begin
                data_out <= shift_buffer[shift];
                if (count == 0) begin
                    shift <= shift + 1;
                end
            end
            
            if (count == 0) begin
                count <= DIVISOR-1;
            end
            
            if (shift == PKT_LEN + 2) begin
                shift <= 0;
                send_flag <= 0;
                data_out <= 1'b1;
            end
        end
    end              
endmodule 