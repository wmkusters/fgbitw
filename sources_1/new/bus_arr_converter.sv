`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2020 02:43:28 PM
// Design Name: 
// Module Name: bus_arr_converter
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


module bus_arr_converter(
    input logic [1:0] arr [8:0][8:0],
    input logic [161:0] bus,
    output logic [1:0] out_arr [8:0][8:0],
    output logic [161:0] out_bus
    );
    always_comb begin
        out_arr = '{'{bus[161:160],bus[159:158],bus[157:156],bus[155:154],bus[153:152],bus[151:150],bus[149:148],bus[147:146],bus[145:144]},
                        '{bus[143:142],bus[141:140],bus[139:138],bus[137:136],bus[135:134],bus[133:132],bus[131:130],bus[129:128],bus[127:126]},
                        '{bus[125:124],bus[123:122],bus[121:120],bus[119:118],bus[117:116],bus[115:114],bus[113:112],bus[111:110],bus[109:108]},
                        '{bus[107:106],bus[105:104],bus[103:102],bus[101:100],bus[99:98],bus[97:96],bus[95:94],bus[93:92],bus[91:90]},
                        '{bus[89:88],bus[87:86],bus[85:84],bus[83:82],bus[81:80],bus[79:78],bus[77:76],bus[75:74],bus[73:72]},
                        '{bus[71:70],bus[69:68],bus[67:66],bus[65:64],bus[63:62],bus[61:60],bus[59:58],bus[57:56],bus[55:54]},
                        '{bus[53:52],bus[51:50],bus[49:48],bus[47:46],bus[45:44],bus[43:42],bus[41:40],bus[39:38],bus[37:36]},
                        '{bus[35:34],bus[33:32],bus[31:30],bus[29:28],bus[27:26],bus[25:24],bus[23:22],bus[21:20],bus[19:18]},
                        '{bus[17:16],bus[15:14],bus[13:12],bus[11:10],bus[9:8],bus[7:6],bus[5:4],bus[3:2],bus[1:0]}};
        out_bus = {arr[8][8], arr[8][7], arr[8][6], arr[8][5], arr[8][4], arr[8][3], arr[8][2], arr[8][1], arr[8][0], 
                    arr[7][8], arr[7][7], arr[7][6], arr[7][5], arr[7][4], arr[7][3], arr[7][2], arr[7][1], arr[7][0], 
                    arr[6][8], arr[6][7], arr[6][6], arr[6][5], arr[6][4], arr[6][3], arr[6][2], arr[6][1], arr[6][0], 
                    arr[5][8], arr[5][7], arr[5][6], arr[5][5], arr[5][4], arr[5][3], arr[5][2], arr[5][1], arr[5][0], 
                    arr[4][8], arr[4][7], arr[4][6], arr[4][5], arr[4][4], arr[4][3], arr[4][2], arr[4][1], arr[4][0], 
                    arr[3][8], arr[3][7], arr[3][6], arr[3][5], arr[3][4], arr[3][3], arr[3][2], arr[3][1], arr[3][0], 
                    arr[2][8], arr[2][7], arr[2][6], arr[2][5], arr[2][4], arr[2][3], arr[2][2], arr[2][1], arr[2][0], 
                    arr[1][8], arr[1][7], arr[1][6], arr[1][5], arr[1][4], arr[1][3], arr[1][2], arr[1][1], arr[1][0], 
                    arr[0][8], arr[0][7], arr[0][6], arr[0][5], arr[0][4], arr[0][3], arr[0][2], arr[0][1], arr[0][0]};
    end
endmodule
