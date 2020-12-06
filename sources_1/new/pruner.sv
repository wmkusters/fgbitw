`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:01:40 PM
// Design Name: 
// Module Name: pruner
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


module pruner(input logic [1:0] prune_color,
			  input logic [1:0] board_in [8:0][8:0],
			  output logic [1:0] pruned_board [8:0][8:0]
    );
	parameter w = 2'b10;
	parameter b = 2'b01;	
	else assign prune_color = b;

	logic [1:0] pruned_board [8:0] [8:0];
	logic or_wires [8:0][8:0];


	always_comb begin
		or_wires[0][0] = (wire_00_10 | wire_00_01);
		or_wires[0][1] = (wire_01_11 | wire_00_01 | wire_01_02);
		or_wires[0][2] = (wire_02_12 | wire_01_02 | wire_02_03);
		or_wires[0][3] = (wire_03_13 | wire_02_03 | wire_03_04);
		or_wires[0][4] = (wire_04_14 | wire_03_04 | wire_04_05);
		or_wires[0][5] = (wire_05_15 | wire_04_05 | wire_05_06);
		or_wires[0][6] = (wire_06_16 | wire_05_06 | wire_06_07);
		or_wires[0][7] = (wire_07_17 | wire_06_07 | wire_07_08);
		or_wires[0][8] = (wire_08_18 | wire_07_08);
		or_wires[1][0] = (wire_00_10 | wire_10_20 | wire_10_11);
		or_wires[1][1] = (wire_01_11 | wire_11_21 | wire_10_11 | wire_11_12);
		or_wires[1][2] = (wire_02_12 | wire_12_22 | wire_11_12 | wire_12_13);
		or_wires[1][3] = (wire_03_13 | wire_13_23 | wire_12_13 | wire_13_14);
		or_wires[1][4] = (wire_04_14 | wire_14_24 | wire_13_14 | wire_14_15);
		or_wires[1][5] = (wire_05_15 | wire_15_25 | wire_14_15 | wire_15_16);
		or_wires[1][6] = (wire_06_16 | wire_16_26 | wire_15_16 | wire_16_17);
		or_wires[1][7] = (wire_07_17 | wire_17_27 | wire_16_17 | wire_17_18);
		or_wires[1][8] = (wire_08_18 | wire_18_28 | wire_17_18);
		or_wires[2][0] = (wire_10_20 | wire_20_30 | wire_20_21);
		or_wires[2][1] = (wire_11_21 | wire_21_31 | wire_20_21 | wire_21_22);
		or_wires[2][2] = (wire_12_22 | wire_22_32 | wire_21_22 | wire_22_23);
		or_wires[2][3] = (wire_13_23 | wire_23_33 | wire_22_23 | wire_23_24);
		or_wires[2][4] = (wire_14_24 | wire_24_34 | wire_23_24 | wire_24_25);
		or_wires[2][5] = (wire_15_25 | wire_25_35 | wire_24_25 | wire_25_26);
		or_wires[2][6] = (wire_16_26 | wire_26_36 | wire_25_26 | wire_26_27);
		or_wires[2][7] = (wire_17_27 | wire_27_37 | wire_26_27 | wire_27_28);
		or_wires[2][8] = (wire_18_28 | wire_28_38 | wire_27_28);
		or_wires[3][0] = (wire_20_30 | wire_30_40 | wire_30_31);
		or_wires[3][1] = (wire_21_31 | wire_31_41 | wire_30_31 | wire_31_32);
		or_wires[3][2] = (wire_22_32 | wire_32_42 | wire_31_32 | wire_32_33);
		or_wires[3][3] = (wire_23_33 | wire_33_43 | wire_32_33 | wire_33_34);
		or_wires[3][4] = (wire_24_34 | wire_34_44 | wire_33_34 | wire_34_35);
		or_wires[3][5] = (wire_25_35 | wire_35_45 | wire_34_35 | wire_35_36);
		or_wires[3][6] = (wire_26_36 | wire_36_46 | wire_35_36 | wire_36_37);
		or_wires[3][7] = (wire_27_37 | wire_37_47 | wire_36_37 | wire_37_38);
		or_wires[3][8] = (wire_28_38 | wire_38_48 | wire_37_38);
		or_wires[4][0] = (wire_30_40 | wire_40_50 | wire_40_41);
		or_wires[4][1] = (wire_31_41 | wire_41_51 | wire_40_41 | wire_41_42);
		or_wires[4][2] = (wire_32_42 | wire_42_52 | wire_41_42 | wire_42_43);
		or_wires[4][3] = (wire_33_43 | wire_43_53 | wire_42_43 | wire_43_44);
		or_wires[4][4] = (wire_34_44 | wire_44_54 | wire_43_44 | wire_44_45);
		or_wires[4][5] = (wire_35_45 | wire_45_55 | wire_44_45 | wire_45_46);
		or_wires[4][6] = (wire_36_46 | wire_46_56 | wire_45_46 | wire_46_47);
		or_wires[4][7] = (wire_37_47 | wire_47_57 | wire_46_47 | wire_47_48);
		or_wires[4][8] = (wire_38_48 | wire_48_58 | wire_47_48);
		or_wires[5][0] = (wire_40_50 | wire_50_60 | wire_50_51);
		or_wires[5][1] = (wire_41_51 | wire_51_61 | wire_50_51 | wire_51_52);
		or_wires[5][2] = (wire_42_52 | wire_52_62 | wire_51_52 | wire_52_53);
		or_wires[5][3] = (wire_43_53 | wire_53_63 | wire_52_53 | wire_53_54);
		or_wires[5][4] = (wire_44_54 | wire_54_64 | wire_53_54 | wire_54_55);
		or_wires[5][5] = (wire_45_55 | wire_55_65 | wire_54_55 | wire_55_56);
		or_wires[5][6] = (wire_46_56 | wire_56_66 | wire_55_56 | wire_56_57);
		or_wires[5][7] = (wire_47_57 | wire_57_67 | wire_56_57 | wire_57_58);
		or_wires[5][8] = (wire_48_58 | wire_58_68 | wire_57_58);
		or_wires[6][0] = (wire_50_60 | wire_60_70 | wire_60_61);
		or_wires[6][1] = (wire_51_61 | wire_61_71 | wire_60_61 | wire_61_62);
		or_wires[6][2] = (wire_52_62 | wire_62_72 | wire_61_62 | wire_62_63);
		or_wires[6][3] = (wire_53_63 | wire_63_73 | wire_62_63 | wire_63_64);
		or_wires[6][4] = (wire_54_64 | wire_64_74 | wire_63_64 | wire_64_65);
		or_wires[6][5] = (wire_55_65 | wire_65_75 | wire_64_65 | wire_65_66);
		or_wires[6][6] = (wire_56_66 | wire_66_76 | wire_65_66 | wire_66_67);
		or_wires[6][7] = (wire_57_67 | wire_67_77 | wire_66_67 | wire_67_68);
		or_wires[6][8] = (wire_58_68 | wire_68_78 | wire_67_68);
		or_wires[7][0] = (wire_60_70 | wire_70_80 | wire_70_71);
		or_wires[7][1] = (wire_61_71 | wire_71_81 | wire_70_71 | wire_71_72);
		or_wires[7][2] = (wire_62_72 | wire_72_82 | wire_71_72 | wire_72_73);
		or_wires[7][3] = (wire_63_73 | wire_73_83 | wire_72_73 | wire_73_74);
		or_wires[7][4] = (wire_64_74 | wire_74_84 | wire_73_74 | wire_74_75);
		or_wires[7][5] = (wire_65_75 | wire_75_85 | wire_74_75 | wire_75_76);
		or_wires[7][6] = (wire_66_76 | wire_76_86 | wire_75_76 | wire_76_77);
		or_wires[7][7] = (wire_67_77 | wire_77_87 | wire_76_77 | wire_77_78);
		or_wires[7][8] = (wire_68_78 | wire_78_88 | wire_77_78);
		or_wires[8][0] = (wire_70_80 | wire_80_81);
		or_wires[8][1] = (wire_71_81 | wire_80_81 | wire_81_82);
		or_wires[8][2] = (wire_72_82 | wire_81_82 | wire_82_83);
		or_wires[8][3] = (wire_73_83 | wire_82_83 | wire_83_84);
		or_wires[8][4] = (wire_74_84 | wire_83_84 | wire_84_85);
		or_wires[8][5] = (wire_75_85 | wire_84_85 | wire_85_86);
		or_wires[8][6] = (wire_76_86 | wire_85_86 | wire_86_87);
		or_wires[8][7] = (wire_77_87 | wire_86_87 | wire_87_88);
		or_wires[8][8] = (wire_78_88 | wire_87_88);
	end

	always_comb begin
		pruned_board[0][0] = (prune_color == board_in[0][0]) ? (or_wires[0][0] ? board_in[0][0] : e) : (board_in[0][0]);
		pruned_board[0][1] = (prune_color == board_in[0][1]) ? (or_wires[0][1] ? board_in[0][1] : e) : (board_in[0][1]);
		pruned_board[0][2] = (prune_color == board_in[0][2]) ? (or_wires[0][2] ? board_in[0][2] : e) : (board_in[0][2]);
		pruned_board[0][3] = (prune_color == board_in[0][3]) ? (or_wires[0][3] ? board_in[0][3] : e) : (board_in[0][3]);
		pruned_board[0][4] = (prune_color == board_in[0][4]) ? (or_wires[0][4] ? board_in[0][4] : e) : (board_in[0][4]);
		pruned_board[0][5] = (prune_color == board_in[0][5]) ? (or_wires[0][5] ? board_in[0][5] : e) : (board_in[0][5]);
		pruned_board[0][6] = (prune_color == board_in[0][6]) ? (or_wires[0][6] ? board_in[0][6] : e) : (board_in[0][6]);
		pruned_board[0][7] = (prune_color == board_in[0][7]) ? (or_wires[0][7] ? board_in[0][7] : e) : (board_in[0][7]);
		pruned_board[0][8] = (prune_color == board_in[0][8]) ? (or_wires[0][8] ? board_in[0][8] : e) : (board_in[0][8]);
		pruned_board[1][0] = (prune_color == board_in[1][0]) ? (or_wires[1][0] ? board_in[1][0] : e) : (board_in[1][0]);
		pruned_board[1][1] = (prune_color == board_in[1][1]) ? (or_wires[1][1] ? board_in[1][1] : e) : (board_in[1][1]);
		pruned_board[1][2] = (prune_color == board_in[1][2]) ? (or_wires[1][2] ? board_in[1][2] : e) : (board_in[1][2]);
		pruned_board[1][3] = (prune_color == board_in[1][3]) ? (or_wires[1][3] ? board_in[1][3] : e) : (board_in[1][3]);
		pruned_board[1][4] = (prune_color == board_in[1][4]) ? (or_wires[1][4] ? board_in[1][4] : e) : (board_in[1][4]);
		pruned_board[1][5] = (prune_color == board_in[1][5]) ? (or_wires[1][5] ? board_in[1][5] : e) : (board_in[1][5]);
		pruned_board[1][6] = (prune_color == board_in[1][6]) ? (or_wires[1][6] ? board_in[1][6] : e) : (board_in[1][6]);
		pruned_board[1][7] = (prune_color == board_in[1][7]) ? (or_wires[1][7] ? board_in[1][7] : e) : (board_in[1][7]);
		pruned_board[1][8] = (prune_color == board_in[1][8]) ? (or_wires[1][8] ? board_in[1][8] : e) : (board_in[1][8]);
		pruned_board[2][0] = (prune_color == board_in[2][0]) ? (or_wires[2][0] ? board_in[2][0] : e) : (board_in[2][0]);
		pruned_board[2][1] = (prune_color == board_in[2][1]) ? (or_wires[2][1] ? board_in[2][1] : e) : (board_in[2][1]);
		pruned_board[2][2] = (prune_color == board_in[2][2]) ? (or_wires[2][2] ? board_in[2][2] : e) : (board_in[2][2]);
		pruned_board[2][3] = (prune_color == board_in[2][3]) ? (or_wires[2][3] ? board_in[2][3] : e) : (board_in[2][3]);
		pruned_board[2][4] = (prune_color == board_in[2][4]) ? (or_wires[2][4] ? board_in[2][4] : e) : (board_in[2][4]);
		pruned_board[2][5] = (prune_color == board_in[2][5]) ? (or_wires[2][5] ? board_in[2][5] : e) : (board_in[2][5]);
		pruned_board[2][6] = (prune_color == board_in[2][6]) ? (or_wires[2][6] ? board_in[2][6] : e) : (board_in[2][6]);
		pruned_board[2][7] = (prune_color == board_in[2][7]) ? (or_wires[2][7] ? board_in[2][7] : e) : (board_in[2][7]);
		pruned_board[2][8] = (prune_color == board_in[2][8]) ? (or_wires[2][8] ? board_in[2][8] : e) : (board_in[2][8]);
		pruned_board[3][0] = (prune_color == board_in[3][0]) ? (or_wires[3][0] ? board_in[3][0] : e) : (board_in[3][0]);
		pruned_board[3][1] = (prune_color == board_in[3][1]) ? (or_wires[3][1] ? board_in[3][1] : e) : (board_in[3][1]);
		pruned_board[3][2] = (prune_color == board_in[3][2]) ? (or_wires[3][2] ? board_in[3][2] : e) : (board_in[3][2]);
		pruned_board[3][3] = (prune_color == board_in[3][3]) ? (or_wires[3][3] ? board_in[3][3] : e) : (board_in[3][3]);
		pruned_board[3][4] = (prune_color == board_in[3][4]) ? (or_wires[3][4] ? board_in[3][4] : e) : (board_in[3][4]);
		pruned_board[3][5] = (prune_color == board_in[3][5]) ? (or_wires[3][5] ? board_in[3][5] : e) : (board_in[3][5]);
		pruned_board[3][6] = (prune_color == board_in[3][6]) ? (or_wires[3][6] ? board_in[3][6] : e) : (board_in[3][6]);
		pruned_board[3][7] = (prune_color == board_in[3][7]) ? (or_wires[3][7] ? board_in[3][7] : e) : (board_in[3][7]);
		pruned_board[3][8] = (prune_color == board_in[3][8]) ? (or_wires[3][8] ? board_in[3][8] : e) : (board_in[3][8]);
		pruned_board[4][0] = (prune_color == board_in[4][0]) ? (or_wires[4][0] ? board_in[4][0] : e) : (board_in[4][0]);
		pruned_board[4][1] = (prune_color == board_in[4][1]) ? (or_wires[4][1] ? board_in[4][1] : e) : (board_in[4][1]);
		pruned_board[4][2] = (prune_color == board_in[4][2]) ? (or_wires[4][2] ? board_in[4][2] : e) : (board_in[4][2]);
		pruned_board[4][3] = (prune_color == board_in[4][3]) ? (or_wires[4][3] ? board_in[4][3] : e) : (board_in[4][3]);
		pruned_board[4][4] = (prune_color == board_in[4][4]) ? (or_wires[4][4] ? board_in[4][4] : e) : (board_in[4][4]);
		pruned_board[4][5] = (prune_color == board_in[4][5]) ? (or_wires[4][5] ? board_in[4][5] : e) : (board_in[4][5]);
		pruned_board[4][6] = (prune_color == board_in[4][6]) ? (or_wires[4][6] ? board_in[4][6] : e) : (board_in[4][6]);
		pruned_board[4][7] = (prune_color == board_in[4][7]) ? (or_wires[4][7] ? board_in[4][7] : e) : (board_in[4][7]);
		pruned_board[4][8] = (prune_color == board_in[4][8]) ? (or_wires[4][8] ? board_in[4][8] : e) : (board_in[4][8]);
		pruned_board[5][0] = (prune_color == board_in[5][0]) ? (or_wires[5][0] ? board_in[5][0] : e) : (board_in[5][0]);
		pruned_board[5][1] = (prune_color == board_in[5][1]) ? (or_wires[5][1] ? board_in[5][1] : e) : (board_in[5][1]);
		pruned_board[5][2] = (prune_color == board_in[5][2]) ? (or_wires[5][2] ? board_in[5][2] : e) : (board_in[5][2]);
		pruned_board[5][3] = (prune_color == board_in[5][3]) ? (or_wires[5][3] ? board_in[5][3] : e) : (board_in[5][3]);
		pruned_board[5][4] = (prune_color == board_in[5][4]) ? (or_wires[5][4] ? board_in[5][4] : e) : (board_in[5][4]);
		pruned_board[5][5] = (prune_color == board_in[5][5]) ? (or_wires[5][5] ? board_in[5][5] : e) : (board_in[5][5]);
		pruned_board[5][6] = (prune_color == board_in[5][6]) ? (or_wires[5][6] ? board_in[5][6] : e) : (board_in[5][6]);
		pruned_board[5][7] = (prune_color == board_in[5][7]) ? (or_wires[5][7] ? board_in[5][7] : e) : (board_in[5][7]);
		pruned_board[5][8] = (prune_color == board_in[5][8]) ? (or_wires[5][8] ? board_in[5][8] : e) : (board_in[5][8]);
		pruned_board[6][0] = (prune_color == board_in[6][0]) ? (or_wires[6][0] ? board_in[6][0] : e) : (board_in[6][0]);
		pruned_board[6][1] = (prune_color == board_in[6][1]) ? (or_wires[6][1] ? board_in[6][1] : e) : (board_in[6][1]);
		pruned_board[6][2] = (prune_color == board_in[6][2]) ? (or_wires[6][2] ? board_in[6][2] : e) : (board_in[6][2]);
		pruned_board[6][3] = (prune_color == board_in[6][3]) ? (or_wires[6][3] ? board_in[6][3] : e) : (board_in[6][3]);
		pruned_board[6][4] = (prune_color == board_in[6][4]) ? (or_wires[6][4] ? board_in[6][4] : e) : (board_in[6][4]);
		pruned_board[6][5] = (prune_color == board_in[6][5]) ? (or_wires[6][5] ? board_in[6][5] : e) : (board_in[6][5]);
		pruned_board[6][6] = (prune_color == board_in[6][6]) ? (or_wires[6][6] ? board_in[6][6] : e) : (board_in[6][6]);
		pruned_board[6][7] = (prune_color == board_in[6][7]) ? (or_wires[6][7] ? board_in[6][7] : e) : (board_in[6][7]);
		pruned_board[6][8] = (prune_color == board_in[6][8]) ? (or_wires[6][8] ? board_in[6][8] : e) : (board_in[6][8]);
		pruned_board[7][0] = (prune_color == board_in[7][0]) ? (or_wires[7][0] ? board_in[7][0] : e) : (board_in[7][0]);
		pruned_board[7][1] = (prune_color == board_in[7][1]) ? (or_wires[7][1] ? board_in[7][1] : e) : (board_in[7][1]);
		pruned_board[7][2] = (prune_color == board_in[7][2]) ? (or_wires[7][2] ? board_in[7][2] : e) : (board_in[7][2]);
		pruned_board[7][3] = (prune_color == board_in[7][3]) ? (or_wires[7][3] ? board_in[7][3] : e) : (board_in[7][3]);
		pruned_board[7][4] = (prune_color == board_in[7][4]) ? (or_wires[7][4] ? board_in[7][4] : e) : (board_in[7][4]);
		pruned_board[7][5] = (prune_color == board_in[7][5]) ? (or_wires[7][5] ? board_in[7][5] : e) : (board_in[7][5]);
		pruned_board[7][6] = (prune_color == board_in[7][6]) ? (or_wires[7][6] ? board_in[7][6] : e) : (board_in[7][6]);
		pruned_board[7][7] = (prune_color == board_in[7][7]) ? (or_wires[7][7] ? board_in[7][7] : e) : (board_in[7][7]);
		pruned_board[7][8] = (prune_color == board_in[7][8]) ? (or_wires[7][8] ? board_in[7][8] : e) : (board_in[7][8]);
		pruned_board[8][0] = (prune_color == board_in[8][0]) ? (or_wires[8][0] ? board_in[8][0] : e) : (board_in[8][0]);
		pruned_board[8][1] = (prune_color == board_in[8][1]) ? (or_wires[8][1] ? board_in[8][1] : e) : (board_in[8][1]);
		pruned_board[8][2] = (prune_color == board_in[8][2]) ? (or_wires[8][2] ? board_in[8][2] : e) : (board_in[8][2]);
		pruned_board[8][3] = (prune_color == board_in[8][3]) ? (or_wires[8][3] ? board_in[8][3] : e) : (board_in[8][3]);
		pruned_board[8][4] = (prune_color == board_in[8][4]) ? (or_wires[8][4] ? board_in[8][4] : e) : (board_in[8][4]);
		pruned_board[8][5] = (prune_color == board_in[8][5]) ? (or_wires[8][5] ? board_in[8][5] : e) : (board_in[8][5]);
		pruned_board[8][6] = (prune_color == board_in[8][6]) ? (or_wires[8][6] ? board_in[8][6] : e) : (board_in[8][6]);
		pruned_board[8][7] = (prune_color == board_in[8][7]) ? (or_wires[8][7] ? board_in[8][7] : e) : (board_in[8][7]);
		pruned_board[8][8] = (prune_color == board_in[8][8]) ? (or_wires[8][8] ? board_in[8][8] : e) : (board_in[8][8]);	
	end	
endmodule
