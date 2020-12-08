module tallier(
    input [1:0] board [8:0][8:0],
    output logic [7:0] sum
    );   

   	integer i; 	
   	integer j;

	always_comb begin
		for (i = 0; i < 9; i = i + 1) begin
            for (j = 0; j < 9; j = j + 1) begin
            	sum += board[i][j][1] + board[i][j][0];
            end
        end
	end    
endmodule