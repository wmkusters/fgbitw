`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 01:43:06 AM
// Design Name: 
// Module Name: byte_to_dec
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


module byte_to_dec(
	input logic [7:0] byte_in,
	output logic [3:0] dec_out_ten, dec_out_one
    );
	
	always_comb begin
		if (byte_in < 7'd10) begin
			dec_out_ten = 4'b0000;
			dec_out_one = byte_in;
		end else if ((byte_in > 7'd9) & (byte_in < 7'd20)) begin
			dec_out_ten = 4'b0001;
			dec_out_one = byte_in - 7'd10;
		end else if ((byte_in > 7'd19) & (byte_in < 7'd30)) begin
			dec_out_ten = 4'b0010;
			dec_out_one = byte_in - 7'd20; 
		end else if ((byte_in > 7'd29) & (byte_in < 7'd40)) begin
			dec_out_ten = 4'b0011;
			dec_out_one = byte_in - 7'd30; 
		end else if ((byte_in > 7'd39) & (byte_in < 7'd50)) begin
			dec_out_ten = 4'b0100;
			dec_out_one = byte_in - 7'd40; 
		end else if ((byte_in > 7'd49) & (byte_in < 7'd60)) begin
			dec_out_ten = 4'b0101;
			dec_out_one = byte_in - 7'd50; 
		end else if ((byte_in > 7'd59) & (byte_in < 7'd70)) begin
			dec_out_ten = 4'b0110;
			dec_out_one = byte_in - 7'd60; 
		end else if ((byte_in > 7'd69) & (byte_in < 7'd80)) begin
			dec_out_ten = 4'b0111;
			dec_out_one = byte_in - 7'd70; 
		end else if ((byte_in > 7'd79) & (byte_in < 7'd82)) begin
			dec_out_ten = 4'b1000;
			dec_out_one = byte_in - 7'd80; 
		end			
	end
endmodule
