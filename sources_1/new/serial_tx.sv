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


module serial_tx(   input           clk_in,
                    input           rst_in,
                    input           trigger_in,
                    input [7:0]     val_in,
                    output logic    data_out);
    parameter   DIVISOR = 868; //treat this like a constant!!
    
    logic [9:0]         shift_buffer; //10 bits...interesting
    logic [31:0]        count;
    logic               send_flag;

    assign shift_buffer = {1'b1, val_in[7], val_in[6], val_in[5], val_in[4], val_in[3], val_in[2], val_in[1], val_in[0], 1'b0};
    
    logic [3:0] shift;
    
    always_ff @(posedge clk_in)begin
        if (rst_in)begin
            count <= 0;
            send_flag <= 0;
            data_out <= 1'b1;
            shift <= 0;
        end else begin
            count <= count + 1;
            if (trigger_in) begin
                send_flag <= 1;
                count <= 0;
            end
            if (send_flag) begin
                data_out <= shift_buffer[shift];
                if (count == DIVISOR-1) begin
                    shift <= shift + 1;
                end
            end
            if (count == DIVISOR-1) begin
                count <= 0;
            end
            if (shift == 10) begin
                shift <= 0;
                send_flag <= 0;
                data_out <= 1'b1;
            end
        end
    end              
endmodule 