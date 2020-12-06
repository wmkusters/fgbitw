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
    parameter [1:0] b = 2'b01;
    parameter [1:0] w = 2'b10;
    parameter [1:0] e = 2'b00;  
    parameter cold = 1'b0;

    logic wire_00_10;
    logic wire_00_01;
    logic wire_01_11;
    logic wire_01_02;
    logic wire_02_12;
    logic wire_02_03;
    logic wire_03_13;
    logic wire_03_04;
    logic wire_04_14;
    logic wire_04_05;
    logic wire_05_15;
    logic wire_05_06;
    logic wire_06_16;
    logic wire_06_07;
    logic wire_07_17;
    logic wire_07_08;
    logic wire_08_18;
    logic wire_08_09;
    logic wire_10_20;
    logic wire_10_11;
    logic wire_11_21;
    logic wire_11_12;
    logic wire_12_22;
    logic wire_12_13;
    logic wire_13_23;
    logic wire_13_14;
    logic wire_14_24;
    logic wire_14_15;
    logic wire_15_25;
    logic wire_15_16;
    logic wire_16_26;
    logic wire_16_17;
    logic wire_17_27;
    logic wire_17_18;
    logic wire_18_28;
    logic wire_18_19;
    logic wire_20_30;
    logic wire_20_21;
    logic wire_21_31;
    logic wire_21_22;
    logic wire_22_32;
    logic wire_22_23;
    logic wire_23_33;
    logic wire_23_24;
    logic wire_24_34;
    logic wire_24_25;
    logic wire_25_35;
    logic wire_25_26;
    logic wire_26_36;
    logic wire_26_27;
    logic wire_27_37;
    logic wire_27_28;
    logic wire_28_38;
    logic wire_28_29;
    logic wire_30_40;
    logic wire_30_31;
    logic wire_31_41;
    logic wire_31_32;
    logic wire_32_42;
    logic wire_32_33;
    logic wire_33_43;
    logic wire_33_34;
    logic wire_34_44;
    logic wire_34_35;
    logic wire_35_45;
    logic wire_35_36;
    logic wire_36_46;
    logic wire_36_37;
    logic wire_37_47;
    logic wire_37_38;
    logic wire_38_48;
    logic wire_38_39;
    logic wire_40_50;
    logic wire_40_41;
    logic wire_41_51;
    logic wire_41_42;
    logic wire_42_52;
    logic wire_42_43;
    logic wire_43_53;
    logic wire_43_44;
    logic wire_44_54;
    logic wire_44_45;
    logic wire_45_55;
    logic wire_45_46;
    logic wire_46_56;
    logic wire_46_47;
    logic wire_47_57;
    logic wire_47_48;
    logic wire_48_58;
    logic wire_48_49;
    logic wire_50_60;
    logic wire_50_51;
    logic wire_51_61;
    logic wire_51_52;
    logic wire_52_62;
    logic wire_52_53;
    logic wire_53_63;
    logic wire_53_54;
    logic wire_54_64;
    logic wire_54_55;
    logic wire_55_65;
    logic wire_55_56;
    logic wire_56_66;
    logic wire_56_57;
    logic wire_57_67;
    logic wire_57_58;
    logic wire_58_68;
    logic wire_58_59;
    logic wire_60_70;
    logic wire_60_61;
    logic wire_61_71;
    logic wire_61_62;
    logic wire_62_72;
    logic wire_62_63;
    logic wire_63_73;
    logic wire_63_64;
    logic wire_64_74;
    logic wire_64_65;
    logic wire_65_75;
    logic wire_65_66;
    logic wire_66_76;
    logic wire_66_67;
    logic wire_67_77;
    logic wire_67_68;
    logic wire_68_78;
    logic wire_68_69;
    logic wire_70_80;
    logic wire_70_71;
    logic wire_71_81;
    logic wire_71_72;
    logic wire_72_82;
    logic wire_72_73;
    logic wire_73_83;
    logic wire_73_74;
    logic wire_74_84;
    logic wire_74_75;
    logic wire_75_85;
    logic wire_75_76;
    logic wire_76_86;
    logic wire_76_77;
    logic wire_77_87;
    logic wire_77_78;
    logic wire_78_88;
    logic wire_78_79;
    logic wire_80_90;
    logic wire_80_81;
    logic wire_81_91;
    logic wire_81_82;
    logic wire_82_92;
    logic wire_82_83;
    logic wire_83_93;
    logic wire_83_84;
    logic wire_84_94;
    logic wire_84_85;
    logic wire_85_95;
    logic wire_85_86;
    logic wire_86_96;
    logic wire_86_87;
    logic wire_87_97;
    logic wire_87_88;
    logic wire_88_98;
    logic wire_88_89;

    logic [1:0] pruned_board [8:0] [8:0];
    logic or_wires [8:0][8:0];

    wire_calc calc_00_10(.tile1(board_in[0][0]),
                         .tile2(board_in[1][0]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_00_01),
                         .neighbor4(cold),
                         .neighbor5(wire_10_20),
                         .neighbor6(wire_10_11),
                         .wire_out(wire_00_10)
    );
    wire_calc calc_01_11(.tile1(board_in[0][1]),
                         .tile2(board_in[1][1]),
                         .neighbor1(wire_00_01),
                         .neighbor2(cold),
                         .neighbor3(wire_01_02),
                         .neighbor4(wire_10_11),
                         .neighbor5(wire_11_21),
                         .neighbor6(wire_11_12),
                         .wire_out(wire_01_11)
    );
    wire_calc calc_02_12(.tile1(board_in[0][2]),
                         .tile2(board_in[1][2]),
                         .neighbor1(wire_01_02),
                         .neighbor2(cold),
                         .neighbor3(wire_02_03),
                         .neighbor4(wire_11_12),
                         .neighbor5(wire_12_22),
                         .neighbor6(wire_12_13),
                         .wire_out(wire_02_12)
    );
    wire_calc calc_03_13(.tile1(board_in[0][3]),
                         .tile2(board_in[1][3]),
                         .neighbor1(wire_02_03),
                         .neighbor2(cold),
                         .neighbor3(wire_03_04),
                         .neighbor4(wire_12_13),
                         .neighbor5(wire_13_23),
                         .neighbor6(wire_13_14),
                         .wire_out(wire_03_13)
    );
    wire_calc calc_04_14(.tile1(board_in[0][4]),
                         .tile2(board_in[1][4]),
                         .neighbor1(wire_03_04),
                         .neighbor2(cold),
                         .neighbor3(wire_04_05),
                         .neighbor4(wire_13_14),
                         .neighbor5(wire_14_24),
                         .neighbor6(wire_14_15),
                         .wire_out(wire_04_14)
    );
    wire_calc calc_05_15(.tile1(board_in[0][5]),
                         .tile2(board_in[1][5]),
                         .neighbor1(wire_04_05),
                         .neighbor2(cold),
                         .neighbor3(wire_05_06),
                         .neighbor4(wire_14_15),
                         .neighbor5(wire_15_25),
                         .neighbor6(wire_15_16),
                         .wire_out(wire_05_15)
    );
    wire_calc calc_06_16(.tile1(board_in[0][6]),
                         .tile2(board_in[1][6]),
                         .neighbor1(wire_05_06),
                         .neighbor2(cold),
                         .neighbor3(wire_06_07),
                         .neighbor4(wire_15_16),
                         .neighbor5(wire_16_26),
                         .neighbor6(wire_16_17),
                         .wire_out(wire_06_16)
    );
    wire_calc calc_07_17(.tile1(board_in[0][7]),
                         .tile2(board_in[1][7]),
                         .neighbor1(wire_06_07),
                         .neighbor2(cold),
                         .neighbor3(wire_07_08),
                         .neighbor4(wire_16_17),
                         .neighbor5(wire_17_27),
                         .neighbor6(wire_17_18),
                         .wire_out(wire_07_17)
    );
    wire_calc calc_08_18(.tile1(board_in[0][8]),
                         .tile2(board_in[1][8]),
                         .neighbor1(wire_07_08),
                         .neighbor2(cold),
                         .neighbor3(cold),
                         .neighbor4(wire_17_18),
                         .neighbor5(wire_18_28),
                         .neighbor6(cold),
                         .wire_out(wire_08_18)
    );
    wire_calc calc_10_20(.tile1(board_in[1][0]),
                         .tile2(board_in[2][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_00_10),
                         .neighbor3(wire_10_11),
                         .neighbor4(cold),
                         .neighbor5(wire_20_30),
                         .neighbor6(wire_20_21),
                         .wire_out(wire_10_20)
    );
    wire_calc calc_11_21(.tile1(board_in[1][1]),
                         .tile2(board_in[2][1]),
                         .neighbor1(wire_10_11),
                         .neighbor2(wire_01_11),
                         .neighbor3(wire_11_12),
                         .neighbor4(wire_20_21),
                         .neighbor5(wire_21_31),
                         .neighbor6(wire_21_22),
                         .wire_out(wire_11_21)
    );
    wire_calc calc_12_22(.tile1(board_in[1][2]),
                         .tile2(board_in[2][2]),
                         .neighbor1(wire_11_12),
                         .neighbor2(wire_02_12),
                         .neighbor3(wire_12_13),
                         .neighbor4(wire_21_22),
                         .neighbor5(wire_22_32),
                         .neighbor6(wire_22_23),
                         .wire_out(wire_12_22)
    );
    wire_calc calc_13_23(.tile1(board_in[1][3]),
                         .tile2(board_in[2][3]),
                         .neighbor1(wire_12_13),
                         .neighbor2(wire_03_13),
                         .neighbor3(wire_13_14),
                         .neighbor4(wire_22_23),
                         .neighbor5(wire_23_33),
                         .neighbor6(wire_23_24),
                         .wire_out(wire_13_23)
    );
    wire_calc calc_14_24(.tile1(board_in[1][4]),
                         .tile2(board_in[2][4]),
                         .neighbor1(wire_13_14),
                         .neighbor2(wire_04_14),
                         .neighbor3(wire_14_15),
                         .neighbor4(wire_23_24),
                         .neighbor5(wire_24_34),
                         .neighbor6(wire_24_25),
                         .wire_out(wire_14_24)
    );
    wire_calc calc_15_25(.tile1(board_in[1][5]),
                         .tile2(board_in[2][5]),
                         .neighbor1(wire_14_15),
                         .neighbor2(wire_05_15),
                         .neighbor3(wire_15_16),
                         .neighbor4(wire_24_25),
                         .neighbor5(wire_25_35),
                         .neighbor6(wire_25_26),
                         .wire_out(wire_15_25)
    );
    wire_calc calc_16_26(.tile1(board_in[1][6]),
                         .tile2(board_in[2][6]),
                         .neighbor1(wire_15_16),
                         .neighbor2(wire_06_16),
                         .neighbor3(wire_16_17),
                         .neighbor4(wire_25_26),
                         .neighbor5(wire_26_36),
                         .neighbor6(wire_26_27),
                         .wire_out(wire_16_26)
    );
    wire_calc calc_17_27(.tile1(board_in[1][7]),
                         .tile2(board_in[2][7]),
                         .neighbor1(wire_16_17),
                         .neighbor2(wire_07_17),
                         .neighbor3(wire_17_18),
                         .neighbor4(wire_26_27),
                         .neighbor5(wire_27_37),
                         .neighbor6(wire_27_28),
                         .wire_out(wire_17_27)
    );
    wire_calc calc_18_28(.tile1(board_in[1][8]),
                         .tile2(board_in[2][8]),
                         .neighbor1(wire_17_18),
                         .neighbor2(wire_08_18),
                         .neighbor3(cold),
                         .neighbor4(wire_27_28),
                         .neighbor5(wire_28_38),
                         .neighbor6(cold),
                         .wire_out(wire_18_28)
    );
    wire_calc calc_20_30(.tile1(board_in[2][0]),
                         .tile2(board_in[3][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_10_20),
                         .neighbor3(wire_20_21),
                         .neighbor4(cold),
                         .neighbor5(wire_30_40),
                         .neighbor6(wire_30_31),
                         .wire_out(wire_20_30)
    );
    wire_calc calc_21_31(.tile1(board_in[2][1]),
                         .tile2(board_in[3][1]),
                         .neighbor1(wire_20_21),
                         .neighbor2(wire_11_21),
                         .neighbor3(wire_21_22),
                         .neighbor4(wire_30_31),
                         .neighbor5(wire_31_41),
                         .neighbor6(wire_31_32),
                         .wire_out(wire_21_31)
    );
    wire_calc calc_22_32(.tile1(board_in[2][2]),
                         .tile2(board_in[3][2]),
                         .neighbor1(wire_21_22),
                         .neighbor2(wire_12_22),
                         .neighbor3(wire_22_23),
                         .neighbor4(wire_31_32),
                         .neighbor5(wire_32_42),
                         .neighbor6(wire_32_33),
                         .wire_out(wire_22_32)
    );
    wire_calc calc_23_33(.tile1(board_in[2][3]),
                         .tile2(board_in[3][3]),
                         .neighbor1(wire_22_23),
                         .neighbor2(wire_13_23),
                         .neighbor3(wire_23_24),
                         .neighbor4(wire_32_33),
                         .neighbor5(wire_33_43),
                         .neighbor6(wire_33_34),
                         .wire_out(wire_23_33)
    );
    wire_calc calc_24_34(.tile1(board_in[2][4]),
                         .tile2(board_in[3][4]),
                         .neighbor1(wire_23_24),
                         .neighbor2(wire_14_24),
                         .neighbor3(wire_24_25),
                         .neighbor4(wire_33_34),
                         .neighbor5(wire_34_44),
                         .neighbor6(wire_34_35),
                         .wire_out(wire_24_34)
    );
    wire_calc calc_25_35(.tile1(board_in[2][5]),
                         .tile2(board_in[3][5]),
                         .neighbor1(wire_24_25),
                         .neighbor2(wire_15_25),
                         .neighbor3(wire_25_26),
                         .neighbor4(wire_34_35),
                         .neighbor5(wire_35_45),
                         .neighbor6(wire_35_36),
                         .wire_out(wire_25_35)
    );
    wire_calc calc_26_36(.tile1(board_in[2][6]),
                         .tile2(board_in[3][6]),
                         .neighbor1(wire_25_26),
                         .neighbor2(wire_16_26),
                         .neighbor3(wire_26_27),
                         .neighbor4(wire_35_36),
                         .neighbor5(wire_36_46),
                         .neighbor6(wire_36_37),
                         .wire_out(wire_26_36)
    );
    wire_calc calc_27_37(.tile1(board_in[2][7]),
                         .tile2(board_in[3][7]),
                         .neighbor1(wire_26_27),
                         .neighbor2(wire_17_27),
                         .neighbor3(wire_27_28),
                         .neighbor4(wire_36_37),
                         .neighbor5(wire_37_47),
                         .neighbor6(wire_37_38),
                         .wire_out(wire_27_37)
    );
    wire_calc calc_28_38(.tile1(board_in[2][8]),
                         .tile2(board_in[3][8]),
                         .neighbor1(wire_27_28),
                         .neighbor2(wire_18_28),
                         .neighbor3(cold),
                         .neighbor4(wire_37_38),
                         .neighbor5(wire_38_48),
                         .neighbor6(cold),
                         .wire_out(wire_28_38)
    );
    wire_calc calc_30_40(.tile1(board_in[3][0]),
                         .tile2(board_in[4][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_20_30),
                         .neighbor3(wire_30_31),
                         .neighbor4(cold),
                         .neighbor5(wire_40_50),
                         .neighbor6(wire_40_41),
                         .wire_out(wire_30_40)
    );
    wire_calc calc_31_41(.tile1(board_in[3][1]),
                         .tile2(board_in[4][1]),
                         .neighbor1(wire_30_31),
                         .neighbor2(wire_21_31),
                         .neighbor3(wire_31_32),
                         .neighbor4(wire_40_41),
                         .neighbor5(wire_41_51),
                         .neighbor6(wire_41_42),
                         .wire_out(wire_31_41)
    );
    wire_calc calc_32_42(.tile1(board_in[3][2]),
                         .tile2(board_in[4][2]),
                         .neighbor1(wire_31_32),
                         .neighbor2(wire_22_32),
                         .neighbor3(wire_32_33),
                         .neighbor4(wire_41_42),
                         .neighbor5(wire_42_52),
                         .neighbor6(wire_42_43),
                         .wire_out(wire_32_42)
    );
    wire_calc calc_33_43(.tile1(board_in[3][3]),
                         .tile2(board_in[4][3]),
                         .neighbor1(wire_32_33),
                         .neighbor2(wire_23_33),
                         .neighbor3(wire_33_34),
                         .neighbor4(wire_42_43),
                         .neighbor5(wire_43_53),
                         .neighbor6(wire_43_44),
                         .wire_out(wire_33_43)
    );
    wire_calc calc_34_44(.tile1(board_in[3][4]),
                         .tile2(board_in[4][4]),
                         .neighbor1(wire_33_34),
                         .neighbor2(wire_24_34),
                         .neighbor3(wire_34_35),
                         .neighbor4(wire_43_44),
                         .neighbor5(wire_44_54),
                         .neighbor6(wire_44_45),
                         .wire_out(wire_34_44)
    );
    wire_calc calc_35_45(.tile1(board_in[3][5]),
                         .tile2(board_in[4][5]),
                         .neighbor1(wire_34_35),
                         .neighbor2(wire_25_35),
                         .neighbor3(wire_35_36),
                         .neighbor4(wire_44_45),
                         .neighbor5(wire_45_55),
                         .neighbor6(wire_45_46),
                         .wire_out(wire_35_45)
    );
    wire_calc calc_36_46(.tile1(board_in[3][6]),
                         .tile2(board_in[4][6]),
                         .neighbor1(wire_35_36),
                         .neighbor2(wire_26_36),
                         .neighbor3(wire_36_37),
                         .neighbor4(wire_45_46),
                         .neighbor5(wire_46_56),
                         .neighbor6(wire_46_47),
                         .wire_out(wire_36_46)
    );
    wire_calc calc_37_47(.tile1(board_in[3][7]),
                         .tile2(board_in[4][7]),
                         .neighbor1(wire_36_37),
                         .neighbor2(wire_27_37),
                         .neighbor3(wire_37_38),
                         .neighbor4(wire_46_47),
                         .neighbor5(wire_47_57),
                         .neighbor6(wire_47_48),
                         .wire_out(wire_37_47)
    );
    wire_calc calc_38_48(.tile1(board_in[3][8]),
                         .tile2(board_in[4][8]),
                         .neighbor1(wire_37_38),
                         .neighbor2(wire_28_38),
                         .neighbor3(cold),
                         .neighbor4(wire_47_48),
                         .neighbor5(wire_48_58),
                         .neighbor6(cold),
                         .wire_out(wire_38_48)
    );
    wire_calc calc_40_50(.tile1(board_in[4][0]),
                         .tile2(board_in[5][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_30_40),
                         .neighbor3(wire_40_41),
                         .neighbor4(cold),
                         .neighbor5(wire_50_60),
                         .neighbor6(wire_50_51),
                         .wire_out(wire_40_50)
    );
    wire_calc calc_41_51(.tile1(board_in[4][1]),
                         .tile2(board_in[5][1]),
                         .neighbor1(wire_40_41),
                         .neighbor2(wire_31_41),
                         .neighbor3(wire_41_42),
                         .neighbor4(wire_50_51),
                         .neighbor5(wire_51_61),
                         .neighbor6(wire_51_52),
                         .wire_out(wire_41_51)
    );
    wire_calc calc_42_52(.tile1(board_in[4][2]),
                         .tile2(board_in[5][2]),
                         .neighbor1(wire_41_42),
                         .neighbor2(wire_32_42),
                         .neighbor3(wire_42_43),
                         .neighbor4(wire_51_52),
                         .neighbor5(wire_52_62),
                         .neighbor6(wire_52_53),
                         .wire_out(wire_42_52)
    );
    wire_calc calc_43_53(.tile1(board_in[4][3]),
                         .tile2(board_in[5][3]),
                         .neighbor1(wire_42_43),
                         .neighbor2(wire_33_43),
                         .neighbor3(wire_43_44),
                         .neighbor4(wire_52_53),
                         .neighbor5(wire_53_63),
                         .neighbor6(wire_53_54),
                         .wire_out(wire_43_53)
    );
    wire_calc calc_44_54(.tile1(board_in[4][4]),
                         .tile2(board_in[5][4]),
                         .neighbor1(wire_43_44),
                         .neighbor2(wire_34_44),
                         .neighbor3(wire_44_45),
                         .neighbor4(wire_53_54),
                         .neighbor5(wire_54_64),
                         .neighbor6(wire_54_55),
                         .wire_out(wire_44_54)
    );
    wire_calc calc_45_55(.tile1(board_in[4][5]),
                         .tile2(board_in[5][5]),
                         .neighbor1(wire_44_45),
                         .neighbor2(wire_35_45),
                         .neighbor3(wire_45_46),
                         .neighbor4(wire_54_55),
                         .neighbor5(wire_55_65),
                         .neighbor6(wire_55_56),
                         .wire_out(wire_45_55)
    );
    wire_calc calc_46_56(.tile1(board_in[4][6]),
                         .tile2(board_in[5][6]),
                         .neighbor1(wire_45_46),
                         .neighbor2(wire_36_46),
                         .neighbor3(wire_46_47),
                         .neighbor4(wire_55_56),
                         .neighbor5(wire_56_66),
                         .neighbor6(wire_56_57),
                         .wire_out(wire_46_56)
    );
    wire_calc calc_47_57(.tile1(board_in[4][7]),
                         .tile2(board_in[5][7]),
                         .neighbor1(wire_46_47),
                         .neighbor2(wire_37_47),
                         .neighbor3(wire_47_48),
                         .neighbor4(wire_56_57),
                         .neighbor5(wire_57_67),
                         .neighbor6(wire_57_58),
                         .wire_out(wire_47_57)
    );
    wire_calc calc_48_58(.tile1(board_in[4][8]),
                         .tile2(board_in[5][8]),
                         .neighbor1(wire_47_48),
                         .neighbor2(wire_38_48),
                         .neighbor3(cold),
                         .neighbor4(wire_57_58),
                         .neighbor5(wire_58_68),
                         .neighbor6(cold),
                         .wire_out(wire_48_58)
    );
    wire_calc calc_50_60(.tile1(board_in[5][0]),
                         .tile2(board_in[6][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_40_50),
                         .neighbor3(wire_50_51),
                         .neighbor4(cold),
                         .neighbor5(wire_60_70),
                         .neighbor6(wire_60_61),
                         .wire_out(wire_50_60)
    );
    wire_calc calc_51_61(.tile1(board_in[5][1]),
                         .tile2(board_in[6][1]),
                         .neighbor1(wire_50_51),
                         .neighbor2(wire_41_51),
                         .neighbor3(wire_51_52),
                         .neighbor4(wire_60_61),
                         .neighbor5(wire_61_71),
                         .neighbor6(wire_61_62),
                         .wire_out(wire_51_61)
    );
    wire_calc calc_52_62(.tile1(board_in[5][2]),
                         .tile2(board_in[6][2]),
                         .neighbor1(wire_51_52),
                         .neighbor2(wire_42_52),
                         .neighbor3(wire_52_53),
                         .neighbor4(wire_61_62),
                         .neighbor5(wire_62_72),
                         .neighbor6(wire_62_63),
                         .wire_out(wire_52_62)
    );
    wire_calc calc_53_63(.tile1(board_in[5][3]),
                         .tile2(board_in[6][3]),
                         .neighbor1(wire_52_53),
                         .neighbor2(wire_43_53),
                         .neighbor3(wire_53_54),
                         .neighbor4(wire_62_63),
                         .neighbor5(wire_63_73),
                         .neighbor6(wire_63_64),
                         .wire_out(wire_53_63)
    );
    wire_calc calc_54_64(.tile1(board_in[5][4]),
                         .tile2(board_in[6][4]),
                         .neighbor1(wire_53_54),
                         .neighbor2(wire_44_54),
                         .neighbor3(wire_54_55),
                         .neighbor4(wire_63_64),
                         .neighbor5(wire_64_74),
                         .neighbor6(wire_64_65),
                         .wire_out(wire_54_64)
    );
    wire_calc calc_55_65(.tile1(board_in[5][5]),
                         .tile2(board_in[6][5]),
                         .neighbor1(wire_54_55),
                         .neighbor2(wire_45_55),
                         .neighbor3(wire_55_56),
                         .neighbor4(wire_64_65),
                         .neighbor5(wire_65_75),
                         .neighbor6(wire_65_66),
                         .wire_out(wire_55_65)
    );
    wire_calc calc_56_66(.tile1(board_in[5][6]),
                         .tile2(board_in[6][6]),
                         .neighbor1(wire_55_56),
                         .neighbor2(wire_46_56),
                         .neighbor3(wire_56_57),
                         .neighbor4(wire_65_66),
                         .neighbor5(wire_66_76),
                         .neighbor6(wire_66_67),
                         .wire_out(wire_56_66)
    );
    wire_calc calc_57_67(.tile1(board_in[5][7]),
                         .tile2(board_in[6][7]),
                         .neighbor1(wire_56_57),
                         .neighbor2(wire_47_57),
                         .neighbor3(wire_57_58),
                         .neighbor4(wire_66_67),
                         .neighbor5(wire_67_77),
                         .neighbor6(wire_67_68),
                         .wire_out(wire_57_67)
    );
    wire_calc calc_58_68(.tile1(board_in[5][8]),
                         .tile2(board_in[6][8]),
                         .neighbor1(wire_57_58),
                         .neighbor2(wire_48_58),
                         .neighbor3(cold),
                         .neighbor4(wire_67_68),
                         .neighbor5(wire_68_78),
                         .neighbor6(cold),
                         .wire_out(wire_58_68)
    );
    wire_calc calc_60_70(.tile1(board_in[6][0]),
                         .tile2(board_in[7][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_50_60),
                         .neighbor3(wire_60_61),
                         .neighbor4(cold),
                         .neighbor5(wire_70_80),
                         .neighbor6(wire_70_71),
                         .wire_out(wire_60_70)
    );
    wire_calc calc_61_71(.tile1(board_in[6][1]),
                         .tile2(board_in[7][1]),
                         .neighbor1(wire_60_61),
                         .neighbor2(wire_51_61),
                         .neighbor3(wire_61_62),
                         .neighbor4(wire_70_71),
                         .neighbor5(wire_71_81),
                         .neighbor6(wire_71_72),
                         .wire_out(wire_61_71)
    );
    wire_calc calc_62_72(.tile1(board_in[6][2]),
                         .tile2(board_in[7][2]),
                         .neighbor1(wire_61_62),
                         .neighbor2(wire_52_62),
                         .neighbor3(wire_62_63),
                         .neighbor4(wire_71_72),
                         .neighbor5(wire_72_82),
                         .neighbor6(wire_72_73),
                         .wire_out(wire_62_72)
    );
    wire_calc calc_63_73(.tile1(board_in[6][3]),
                         .tile2(board_in[7][3]),
                         .neighbor1(wire_62_63),
                         .neighbor2(wire_53_63),
                         .neighbor3(wire_63_64),
                         .neighbor4(wire_72_73),
                         .neighbor5(wire_73_83),
                         .neighbor6(wire_73_74),
                         .wire_out(wire_63_73)
    );
    wire_calc calc_64_74(.tile1(board_in[6][4]),
                         .tile2(board_in[7][4]),
                         .neighbor1(wire_63_64),
                         .neighbor2(wire_54_64),
                         .neighbor3(wire_64_65),
                         .neighbor4(wire_73_74),
                         .neighbor5(wire_74_84),
                         .neighbor6(wire_74_75),
                         .wire_out(wire_64_74)
    );
    wire_calc calc_65_75(.tile1(board_in[6][5]),
                         .tile2(board_in[7][5]),
                         .neighbor1(wire_64_65),
                         .neighbor2(wire_55_65),
                         .neighbor3(wire_65_66),
                         .neighbor4(wire_74_75),
                         .neighbor5(wire_75_85),
                         .neighbor6(wire_75_76),
                         .wire_out(wire_65_75)
    );
    wire_calc calc_66_76(.tile1(board_in[6][6]),
                         .tile2(board_in[7][6]),
                         .neighbor1(wire_65_66),
                         .neighbor2(wire_56_66),
                         .neighbor3(wire_66_67),
                         .neighbor4(wire_75_76),
                         .neighbor5(wire_76_86),
                         .neighbor6(wire_76_77),
                         .wire_out(wire_66_76)
    );
    wire_calc calc_67_77(.tile1(board_in[6][7]),
                         .tile2(board_in[7][7]),
                         .neighbor1(wire_66_67),
                         .neighbor2(wire_57_67),
                         .neighbor3(wire_67_68),
                         .neighbor4(wire_76_77),
                         .neighbor5(wire_77_87),
                         .neighbor6(wire_77_78),
                         .wire_out(wire_67_77)
    );
    wire_calc calc_68_78(.tile1(board_in[6][8]),
                         .tile2(board_in[7][8]),
                         .neighbor1(wire_67_68),
                         .neighbor2(wire_58_68),
                         .neighbor3(cold),
                         .neighbor4(wire_77_78),
                         .neighbor5(wire_78_88),
                         .neighbor6(cold),
                         .wire_out(wire_68_78)
    );
    wire_calc calc_70_80(.tile1(board_in[7][0]),
                         .tile2(board_in[8][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_60_70),
                         .neighbor3(wire_70_71),
                         .neighbor4(cold),
                         .neighbor5(cold),
                         .neighbor6(wire_80_81),
                         .wire_out(wire_70_80)
    );
    wire_calc calc_71_81(.tile1(board_in[7][1]),
                         .tile2(board_in[8][1]),
                         .neighbor1(wire_70_71),
                         .neighbor2(wire_61_71),
                         .neighbor3(wire_71_72),
                         .neighbor4(wire_80_81),
                         .neighbor5(cold),
                         .neighbor6(wire_81_82),
                         .wire_out(wire_71_81)
    );
    wire_calc calc_72_82(.tile1(board_in[7][2]),
                         .tile2(board_in[8][2]),
                         .neighbor1(wire_71_72),
                         .neighbor2(wire_62_72),
                         .neighbor3(wire_72_73),
                         .neighbor4(wire_81_82),
                         .neighbor5(cold),
                         .neighbor6(wire_82_83),
                         .wire_out(wire_72_82)
    );
    wire_calc calc_73_83(.tile1(board_in[7][3]),
                         .tile2(board_in[8][3]),
                         .neighbor1(wire_72_73),
                         .neighbor2(wire_63_73),
                         .neighbor3(wire_73_74),
                         .neighbor4(wire_82_83),
                         .neighbor5(cold),
                         .neighbor6(wire_83_84),
                         .wire_out(wire_73_83)
    );
    wire_calc calc_74_84(.tile1(board_in[7][4]),
                         .tile2(board_in[8][4]),
                         .neighbor1(wire_73_74),
                         .neighbor2(wire_64_74),
                         .neighbor3(wire_74_75),
                         .neighbor4(wire_83_84),
                         .neighbor5(cold),
                         .neighbor6(wire_84_85),
                         .wire_out(wire_74_84)
    );
    wire_calc calc_75_85(.tile1(board_in[7][5]),
                         .tile2(board_in[8][5]),
                         .neighbor1(wire_74_75),
                         .neighbor2(wire_65_75),
                         .neighbor3(wire_75_76),
                         .neighbor4(wire_84_85),
                         .neighbor5(cold),
                         .neighbor6(wire_85_86),
                         .wire_out(wire_75_85)
    );
    wire_calc calc_76_86(.tile1(board_in[7][6]),
                         .tile2(board_in[8][6]),
                         .neighbor1(wire_75_76),
                         .neighbor2(wire_66_76),
                         .neighbor3(wire_76_77),
                         .neighbor4(wire_85_86),
                         .neighbor5(cold),
                         .neighbor6(wire_86_87),
                         .wire_out(wire_76_86)
    );
    wire_calc calc_77_87(.tile1(board_in[7][7]),
                         .tile2(board_in[8][7]),
                         .neighbor1(wire_76_77),
                         .neighbor2(wire_67_77),
                         .neighbor3(wire_77_78),
                         .neighbor4(wire_86_87),
                         .neighbor5(cold),
                         .neighbor6(wire_87_88),
                         .wire_out(wire_77_87)
    );
    wire_calc calc_78_88(.tile1(board_in[7][8]),
                         .tile2(board_in[8][8]),
                         .neighbor1(wire_77_78),
                         .neighbor2(wire_68_78),
                         .neighbor3(cold),
                         .neighbor4(wire_87_88),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_78_88)
    );
    wire_calc calc_00_01(.tile1(board_in[0][0]),
                         .tile2(board_in[0][1]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(cold),
                         .neighbor4(wire_01_02),
                         .neighbor5(wire_00_10),
                         .neighbor6(wire_01_11),
                         .wire_out(wire_00_01)
    );
    wire_calc calc_01_02(.tile1(board_in[0][1]),
                         .tile2(board_in[0][2]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_00_01),
                         .neighbor4(wire_02_03),
                         .neighbor5(wire_01_11),
                         .neighbor6(wire_02_12),
                         .wire_out(wire_01_02)
    );
    wire_calc calc_02_03(.tile1(board_in[0][2]),
                         .tile2(board_in[0][3]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_01_02),
                         .neighbor4(wire_03_04),
                         .neighbor5(wire_02_12),
                         .neighbor6(wire_03_13),
                         .wire_out(wire_02_03)
    );
    wire_calc calc_03_04(.tile1(board_in[0][3]),
                         .tile2(board_in[0][4]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_02_03),
                         .neighbor4(wire_04_05),
                         .neighbor5(wire_03_13),
                         .neighbor6(wire_04_14),
                         .wire_out(wire_03_04)
    );
    wire_calc calc_04_05(.tile1(board_in[0][4]),
                         .tile2(board_in[0][5]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_03_04),
                         .neighbor4(wire_05_06),
                         .neighbor5(wire_04_14),
                         .neighbor6(wire_05_15),
                         .wire_out(wire_04_05)
    );
    wire_calc calc_05_06(.tile1(board_in[0][5]),
                         .tile2(board_in[0][6]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_04_05),
                         .neighbor4(wire_06_07),
                         .neighbor5(wire_05_15),
                         .neighbor6(wire_06_16),
                         .wire_out(wire_05_06)
    );
    wire_calc calc_06_07(.tile1(board_in[0][6]),
                         .tile2(board_in[0][7]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_05_06),
                         .neighbor4(wire_07_08),
                         .neighbor5(wire_06_16),
                         .neighbor6(wire_07_17),
                         .wire_out(wire_06_07)
    );
    wire_calc calc_07_08(.tile1(board_in[0][7]),
                         .tile2(board_in[0][8]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_06_07),
                         .neighbor4(cold),
                         .neighbor5(wire_07_17),
                         .neighbor6(wire_08_18),
                         .wire_out(wire_07_08)
    );
    wire_calc calc_10_11(.tile1(board_in[1][0]),
                         .tile2(board_in[1][1]),
                         .neighbor1(wire_00_10),
                         .neighbor2(wire_01_11),
                         .neighbor3(cold),
                         .neighbor4(wire_11_12),
                         .neighbor5(wire_10_20),
                         .neighbor6(wire_11_21),
                         .wire_out(wire_10_11)
    );
    wire_calc calc_11_12(.tile1(board_in[1][1]),
                         .tile2(board_in[1][2]),
                         .neighbor1(wire_01_11),
                         .neighbor2(wire_02_12),
                         .neighbor3(wire_10_11),
                         .neighbor4(wire_12_13),
                         .neighbor5(wire_11_21),
                         .neighbor6(wire_12_22),
                         .wire_out(wire_11_12)
    );
    wire_calc calc_12_13(.tile1(board_in[1][2]),
                         .tile2(board_in[1][3]),
                         .neighbor1(wire_02_12),
                         .neighbor2(wire_03_13),
                         .neighbor3(wire_11_12),
                         .neighbor4(wire_13_14),
                         .neighbor5(wire_12_22),
                         .neighbor6(wire_13_23),
                         .wire_out(wire_12_13)
    );
    wire_calc calc_13_14(.tile1(board_in[1][3]),
                         .tile2(board_in[1][4]),
                         .neighbor1(wire_03_13),
                         .neighbor2(wire_04_14),
                         .neighbor3(wire_12_13),
                         .neighbor4(wire_14_15),
                         .neighbor5(wire_13_23),
                         .neighbor6(wire_14_24),
                         .wire_out(wire_13_14)
    );
    wire_calc calc_14_15(.tile1(board_in[1][4]),
                         .tile2(board_in[1][5]),
                         .neighbor1(wire_04_14),
                         .neighbor2(wire_05_15),
                         .neighbor3(wire_13_14),
                         .neighbor4(wire_15_16),
                         .neighbor5(wire_14_24),
                         .neighbor6(wire_15_25),
                         .wire_out(wire_14_15)
    );
    wire_calc calc_15_16(.tile1(board_in[1][5]),
                         .tile2(board_in[1][6]),
                         .neighbor1(wire_05_15),
                         .neighbor2(wire_06_16),
                         .neighbor3(wire_14_15),
                         .neighbor4(wire_16_17),
                         .neighbor5(wire_15_25),
                         .neighbor6(wire_16_26),
                         .wire_out(wire_15_16)
    );
    wire_calc calc_16_17(.tile1(board_in[1][6]),
                         .tile2(board_in[1][7]),
                         .neighbor1(wire_06_16),
                         .neighbor2(wire_07_17),
                         .neighbor3(wire_15_16),
                         .neighbor4(wire_17_18),
                         .neighbor5(wire_16_26),
                         .neighbor6(wire_17_27),
                         .wire_out(wire_16_17)
    );
    wire_calc calc_17_18(.tile1(board_in[1][7]),
                         .tile2(board_in[1][8]),
                         .neighbor1(wire_07_17),
                         .neighbor2(wire_08_18),
                         .neighbor3(wire_16_17),
                         .neighbor4(cold),
                         .neighbor5(wire_17_27),
                         .neighbor6(wire_18_28),
                         .wire_out(wire_17_18)
    );
    wire_calc calc_20_21(.tile1(board_in[2][0]),
                         .tile2(board_in[2][1]),
                         .neighbor1(wire_10_20),
                         .neighbor2(wire_11_21),
                         .neighbor3(cold),
                         .neighbor4(wire_21_22),
                         .neighbor5(wire_20_30),
                         .neighbor6(wire_21_31),
                         .wire_out(wire_20_21)
    );
    wire_calc calc_21_22(.tile1(board_in[2][1]),
                         .tile2(board_in[2][2]),
                         .neighbor1(wire_11_21),
                         .neighbor2(wire_12_22),
                         .neighbor3(wire_20_21),
                         .neighbor4(wire_22_23),
                         .neighbor5(wire_21_31),
                         .neighbor6(wire_22_32),
                         .wire_out(wire_21_22)
    );
    wire_calc calc_22_23(.tile1(board_in[2][2]),
                         .tile2(board_in[2][3]),
                         .neighbor1(wire_12_22),
                         .neighbor2(wire_13_23),
                         .neighbor3(wire_21_22),
                         .neighbor4(wire_23_24),
                         .neighbor5(wire_22_32),
                         .neighbor6(wire_23_33),
                         .wire_out(wire_22_23)
    );
    wire_calc calc_23_24(.tile1(board_in[2][3]),
                         .tile2(board_in[2][4]),
                         .neighbor1(wire_13_23),
                         .neighbor2(wire_14_24),
                         .neighbor3(wire_22_23),
                         .neighbor4(wire_24_25),
                         .neighbor5(wire_23_33),
                         .neighbor6(wire_24_34),
                         .wire_out(wire_23_24)
    );
    wire_calc calc_24_25(.tile1(board_in[2][4]),
                         .tile2(board_in[2][5]),
                         .neighbor1(wire_14_24),
                         .neighbor2(wire_15_25),
                         .neighbor3(wire_23_24),
                         .neighbor4(wire_25_26),
                         .neighbor5(wire_24_34),
                         .neighbor6(wire_25_35),
                         .wire_out(wire_24_25)
    );
    wire_calc calc_25_26(.tile1(board_in[2][5]),
                         .tile2(board_in[2][6]),
                         .neighbor1(wire_15_25),
                         .neighbor2(wire_16_26),
                         .neighbor3(wire_24_25),
                         .neighbor4(wire_26_27),
                         .neighbor5(wire_25_35),
                         .neighbor6(wire_26_36),
                         .wire_out(wire_25_26)
    );
    wire_calc calc_26_27(.tile1(board_in[2][6]),
                         .tile2(board_in[2][7]),
                         .neighbor1(wire_16_26),
                         .neighbor2(wire_17_27),
                         .neighbor3(wire_25_26),
                         .neighbor4(wire_27_28),
                         .neighbor5(wire_26_36),
                         .neighbor6(wire_27_37),
                         .wire_out(wire_26_27)
    );
    wire_calc calc_27_28(.tile1(board_in[2][7]),
                         .tile2(board_in[2][8]),
                         .neighbor1(wire_17_27),
                         .neighbor2(wire_18_28),
                         .neighbor3(wire_26_27),
                         .neighbor4(cold),
                         .neighbor5(wire_27_37),
                         .neighbor6(wire_28_38),
                         .wire_out(wire_27_28)
    );
    wire_calc calc_30_31(.tile1(board_in[3][0]),
                         .tile2(board_in[3][1]),
                         .neighbor1(wire_20_30),
                         .neighbor2(wire_21_31),
                         .neighbor3(cold),
                         .neighbor4(wire_31_32),
                         .neighbor5(wire_30_40),
                         .neighbor6(wire_31_41),
                         .wire_out(wire_30_31)
    );
    wire_calc calc_31_32(.tile1(board_in[3][1]),
                         .tile2(board_in[3][2]),
                         .neighbor1(wire_21_31),
                         .neighbor2(wire_22_32),
                         .neighbor3(wire_30_31),
                         .neighbor4(wire_32_33),
                         .neighbor5(wire_31_41),
                         .neighbor6(wire_32_42),
                         .wire_out(wire_31_32)
    );
    wire_calc calc_32_33(.tile1(board_in[3][2]),
                         .tile2(board_in[3][3]),
                         .neighbor1(wire_22_32),
                         .neighbor2(wire_23_33),
                         .neighbor3(wire_31_32),
                         .neighbor4(wire_33_34),
                         .neighbor5(wire_32_42),
                         .neighbor6(wire_33_43),
                         .wire_out(wire_32_33)
    );
    wire_calc calc_33_34(.tile1(board_in[3][3]),
                         .tile2(board_in[3][4]),
                         .neighbor1(wire_23_33),
                         .neighbor2(wire_24_34),
                         .neighbor3(wire_32_33),
                         .neighbor4(wire_34_35),
                         .neighbor5(wire_33_43),
                         .neighbor6(wire_34_44),
                         .wire_out(wire_33_34)
    );
    wire_calc calc_34_35(.tile1(board_in[3][4]),
                         .tile2(board_in[3][5]),
                         .neighbor1(wire_24_34),
                         .neighbor2(wire_25_35),
                         .neighbor3(wire_33_34),
                         .neighbor4(wire_35_36),
                         .neighbor5(wire_34_44),
                         .neighbor6(wire_35_45),
                         .wire_out(wire_34_35)
    );
    wire_calc calc_35_36(.tile1(board_in[3][5]),
                         .tile2(board_in[3][6]),
                         .neighbor1(wire_25_35),
                         .neighbor2(wire_26_36),
                         .neighbor3(wire_34_35),
                         .neighbor4(wire_36_37),
                         .neighbor5(wire_35_45),
                         .neighbor6(wire_36_46),
                         .wire_out(wire_35_36)
    );
    wire_calc calc_36_37(.tile1(board_in[3][6]),
                         .tile2(board_in[3][7]),
                         .neighbor1(wire_26_36),
                         .neighbor2(wire_27_37),
                         .neighbor3(wire_35_36),
                         .neighbor4(wire_37_38),
                         .neighbor5(wire_36_46),
                         .neighbor6(wire_37_47),
                         .wire_out(wire_36_37)
    );
    wire_calc calc_37_38(.tile1(board_in[3][7]),
                         .tile2(board_in[3][8]),
                         .neighbor1(wire_27_37),
                         .neighbor2(wire_28_38),
                         .neighbor3(wire_36_37),
                         .neighbor4(cold),
                         .neighbor5(wire_37_47),
                         .neighbor6(wire_38_48),
                         .wire_out(wire_37_38)
    );
    wire_calc calc_40_41(.tile1(board_in[4][0]),
                         .tile2(board_in[4][1]),
                         .neighbor1(wire_30_40),
                         .neighbor2(wire_31_41),
                         .neighbor3(cold),
                         .neighbor4(wire_41_42),
                         .neighbor5(wire_40_50),
                         .neighbor6(wire_41_51),
                         .wire_out(wire_40_41)
    );
    wire_calc calc_41_42(.tile1(board_in[4][1]),
                         .tile2(board_in[4][2]),
                         .neighbor1(wire_31_41),
                         .neighbor2(wire_32_42),
                         .neighbor3(wire_40_41),
                         .neighbor4(wire_42_43),
                         .neighbor5(wire_41_51),
                         .neighbor6(wire_42_52),
                         .wire_out(wire_41_42)
    );
    wire_calc calc_42_43(.tile1(board_in[4][2]),
                         .tile2(board_in[4][3]),
                         .neighbor1(wire_32_42),
                         .neighbor2(wire_33_43),
                         .neighbor3(wire_41_42),
                         .neighbor4(wire_43_44),
                         .neighbor5(wire_42_52),
                         .neighbor6(wire_43_53),
                         .wire_out(wire_42_43)
    );
    wire_calc calc_43_44(.tile1(board_in[4][3]),
                         .tile2(board_in[4][4]),
                         .neighbor1(wire_33_43),
                         .neighbor2(wire_34_44),
                         .neighbor3(wire_42_43),
                         .neighbor4(wire_44_45),
                         .neighbor5(wire_43_53),
                         .neighbor6(wire_44_54),
                         .wire_out(wire_43_44)
    );
    wire_calc calc_44_45(.tile1(board_in[4][4]),
                         .tile2(board_in[4][5]),
                         .neighbor1(wire_34_44),
                         .neighbor2(wire_35_45),
                         .neighbor3(wire_43_44),
                         .neighbor4(wire_45_46),
                         .neighbor5(wire_44_54),
                         .neighbor6(wire_45_55),
                         .wire_out(wire_44_45)
    );
    wire_calc calc_45_46(.tile1(board_in[4][5]),
                         .tile2(board_in[4][6]),
                         .neighbor1(wire_35_45),
                         .neighbor2(wire_36_46),
                         .neighbor3(wire_44_45),
                         .neighbor4(wire_46_47),
                         .neighbor5(wire_45_55),
                         .neighbor6(wire_46_56),
                         .wire_out(wire_45_46)
    );
    wire_calc calc_46_47(.tile1(board_in[4][6]),
                         .tile2(board_in[4][7]),
                         .neighbor1(wire_36_46),
                         .neighbor2(wire_37_47),
                         .neighbor3(wire_45_46),
                         .neighbor4(wire_47_48),
                         .neighbor5(wire_46_56),
                         .neighbor6(wire_47_57),
                         .wire_out(wire_46_47)
    );
    wire_calc calc_47_48(.tile1(board_in[4][7]),
                         .tile2(board_in[4][8]),
                         .neighbor1(wire_37_47),
                         .neighbor2(wire_38_48),
                         .neighbor3(wire_46_47),
                         .neighbor4(cold),
                         .neighbor5(wire_47_57),
                         .neighbor6(wire_48_58),
                         .wire_out(wire_47_48)
    );
    wire_calc calc_50_51(.tile1(board_in[5][0]),
                         .tile2(board_in[5][1]),
                         .neighbor1(wire_40_50),
                         .neighbor2(wire_41_51),
                         .neighbor3(cold),
                         .neighbor4(wire_51_52),
                         .neighbor5(wire_50_60),
                         .neighbor6(wire_51_61),
                         .wire_out(wire_50_51)
    );
    wire_calc calc_51_52(.tile1(board_in[5][1]),
                         .tile2(board_in[5][2]),
                         .neighbor1(wire_41_51),
                         .neighbor2(wire_42_52),
                         .neighbor3(wire_50_51),
                         .neighbor4(wire_52_53),
                         .neighbor5(wire_51_61),
                         .neighbor6(wire_52_62),
                         .wire_out(wire_51_52)
    );
    wire_calc calc_52_53(.tile1(board_in[5][2]),
                         .tile2(board_in[5][3]),
                         .neighbor1(wire_42_52),
                         .neighbor2(wire_43_53),
                         .neighbor3(wire_51_52),
                         .neighbor4(wire_53_54),
                         .neighbor5(wire_52_62),
                         .neighbor6(wire_53_63),
                         .wire_out(wire_52_53)
    );
    wire_calc calc_53_54(.tile1(board_in[5][3]),
                         .tile2(board_in[5][4]),
                         .neighbor1(wire_43_53),
                         .neighbor2(wire_44_54),
                         .neighbor3(wire_52_53),
                         .neighbor4(wire_54_55),
                         .neighbor5(wire_53_63),
                         .neighbor6(wire_54_64),
                         .wire_out(wire_53_54)
    );
    wire_calc calc_54_55(.tile1(board_in[5][4]),
                         .tile2(board_in[5][5]),
                         .neighbor1(wire_44_54),
                         .neighbor2(wire_45_55),
                         .neighbor3(wire_53_54),
                         .neighbor4(wire_55_56),
                         .neighbor5(wire_54_64),
                         .neighbor6(wire_55_65),
                         .wire_out(wire_54_55)
    );
    wire_calc calc_55_56(.tile1(board_in[5][5]),
                         .tile2(board_in[5][6]),
                         .neighbor1(wire_45_55),
                         .neighbor2(wire_46_56),
                         .neighbor3(wire_54_55),
                         .neighbor4(wire_56_57),
                         .neighbor5(wire_55_65),
                         .neighbor6(wire_56_66),
                         .wire_out(wire_55_56)
    );
    wire_calc calc_56_57(.tile1(board_in[5][6]),
                         .tile2(board_in[5][7]),
                         .neighbor1(wire_46_56),
                         .neighbor2(wire_47_57),
                         .neighbor3(wire_55_56),
                         .neighbor4(wire_57_58),
                         .neighbor5(wire_56_66),
                         .neighbor6(wire_57_67),
                         .wire_out(wire_56_57)
    );
    wire_calc calc_57_58(.tile1(board_in[5][7]),
                         .tile2(board_in[5][8]),
                         .neighbor1(wire_47_57),
                         .neighbor2(wire_48_58),
                         .neighbor3(wire_56_57),
                         .neighbor4(cold),
                         .neighbor5(wire_57_67),
                         .neighbor6(wire_58_68),
                         .wire_out(wire_57_58)
    );
    wire_calc calc_60_61(.tile1(board_in[6][0]),
                         .tile2(board_in[6][1]),
                         .neighbor1(wire_50_60),
                         .neighbor2(wire_51_61),
                         .neighbor3(cold),
                         .neighbor4(wire_61_62),
                         .neighbor5(wire_60_70),
                         .neighbor6(wire_61_71),
                         .wire_out(wire_60_61)
    );
    wire_calc calc_61_62(.tile1(board_in[6][1]),
                         .tile2(board_in[6][2]),
                         .neighbor1(wire_51_61),
                         .neighbor2(wire_52_62),
                         .neighbor3(wire_60_61),
                         .neighbor4(wire_62_63),
                         .neighbor5(wire_61_71),
                         .neighbor6(wire_62_72),
                         .wire_out(wire_61_62)
    );
    wire_calc calc_62_63(.tile1(board_in[6][2]),
                         .tile2(board_in[6][3]),
                         .neighbor1(wire_52_62),
                         .neighbor2(wire_53_63),
                         .neighbor3(wire_61_62),
                         .neighbor4(wire_63_64),
                         .neighbor5(wire_62_72),
                         .neighbor6(wire_63_73),
                         .wire_out(wire_62_63)
    );
    wire_calc calc_63_64(.tile1(board_in[6][3]),
                         .tile2(board_in[6][4]),
                         .neighbor1(wire_53_63),
                         .neighbor2(wire_54_64),
                         .neighbor3(wire_62_63),
                         .neighbor4(wire_64_65),
                         .neighbor5(wire_63_73),
                         .neighbor6(wire_64_74),
                         .wire_out(wire_63_64)
    );
    wire_calc calc_64_65(.tile1(board_in[6][4]),
                         .tile2(board_in[6][5]),
                         .neighbor1(wire_54_64),
                         .neighbor2(wire_55_65),
                         .neighbor3(wire_63_64),
                         .neighbor4(wire_65_66),
                         .neighbor5(wire_64_74),
                         .neighbor6(wire_65_75),
                         .wire_out(wire_64_65)
    );
    wire_calc calc_65_66(.tile1(board_in[6][5]),
                         .tile2(board_in[6][6]),
                         .neighbor1(wire_55_65),
                         .neighbor2(wire_56_66),
                         .neighbor3(wire_64_65),
                         .neighbor4(wire_66_67),
                         .neighbor5(wire_65_75),
                         .neighbor6(wire_66_76),
                         .wire_out(wire_65_66)
    );
    wire_calc calc_66_67(.tile1(board_in[6][6]),
                         .tile2(board_in[6][7]),
                         .neighbor1(wire_56_66),
                         .neighbor2(wire_57_67),
                         .neighbor3(wire_65_66),
                         .neighbor4(wire_67_68),
                         .neighbor5(wire_66_76),
                         .neighbor6(wire_67_77),
                         .wire_out(wire_66_67)
    );
    wire_calc calc_67_68(.tile1(board_in[6][7]),
                         .tile2(board_in[6][8]),
                         .neighbor1(wire_57_67),
                         .neighbor2(wire_58_68),
                         .neighbor3(wire_66_67),
                         .neighbor4(cold),
                         .neighbor5(wire_67_77),
                         .neighbor6(wire_68_78),
                         .wire_out(wire_67_68)
    );
    wire_calc calc_70_71(.tile1(board_in[7][0]),
                         .tile2(board_in[7][1]),
                         .neighbor1(wire_60_70),
                         .neighbor2(wire_61_71),
                         .neighbor3(cold),
                         .neighbor4(wire_71_72),
                         .neighbor5(wire_70_80),
                         .neighbor6(wire_71_81),
                         .wire_out(wire_70_71)
    );
    wire_calc calc_71_72(.tile1(board_in[7][1]),
                         .tile2(board_in[7][2]),
                         .neighbor1(wire_61_71),
                         .neighbor2(wire_62_72),
                         .neighbor3(wire_70_71),
                         .neighbor4(wire_72_73),
                         .neighbor5(wire_71_81),
                         .neighbor6(wire_72_82),
                         .wire_out(wire_71_72)
    );
    wire_calc calc_72_73(.tile1(board_in[7][2]),
                         .tile2(board_in[7][3]),
                         .neighbor1(wire_62_72),
                         .neighbor2(wire_63_73),
                         .neighbor3(wire_71_72),
                         .neighbor4(wire_73_74),
                         .neighbor5(wire_72_82),
                         .neighbor6(wire_73_83),
                         .wire_out(wire_72_73)
    );
    wire_calc calc_73_74(.tile1(board_in[7][3]),
                         .tile2(board_in[7][4]),
                         .neighbor1(wire_63_73),
                         .neighbor2(wire_64_74),
                         .neighbor3(wire_72_73),
                         .neighbor4(wire_74_75),
                         .neighbor5(wire_73_83),
                         .neighbor6(wire_74_84),
                         .wire_out(wire_73_74)
    );
    wire_calc calc_74_75(.tile1(board_in[7][4]),
                         .tile2(board_in[7][5]),
                         .neighbor1(wire_64_74),
                         .neighbor2(wire_65_75),
                         .neighbor3(wire_73_74),
                         .neighbor4(wire_75_76),
                         .neighbor5(wire_74_84),
                         .neighbor6(wire_75_85),
                         .wire_out(wire_74_75)
    );
    wire_calc calc_75_76(.tile1(board_in[7][5]),
                         .tile2(board_in[7][6]),
                         .neighbor1(wire_65_75),
                         .neighbor2(wire_66_76),
                         .neighbor3(wire_74_75),
                         .neighbor4(wire_76_77),
                         .neighbor5(wire_75_85),
                         .neighbor6(wire_76_86),
                         .wire_out(wire_75_76)
    );
    wire_calc calc_76_77(.tile1(board_in[7][6]),
                         .tile2(board_in[7][7]),
                         .neighbor1(wire_66_76),
                         .neighbor2(wire_67_77),
                         .neighbor3(wire_75_76),
                         .neighbor4(wire_77_78),
                         .neighbor5(wire_76_86),
                         .neighbor6(wire_77_87),
                         .wire_out(wire_76_77)
    );
    wire_calc calc_77_78(.tile1(board_in[7][7]),
                         .tile2(board_in[7][8]),
                         .neighbor1(wire_67_77),
                         .neighbor2(wire_68_78),
                         .neighbor3(wire_76_77),
                         .neighbor4(cold),
                         .neighbor5(wire_77_87),
                         .neighbor6(wire_78_88),
                         .wire_out(wire_77_78)
    );
    wire_calc calc_80_81(.tile1(board_in[8][0]),
                         .tile2(board_in[8][1]),
                         .neighbor1(wire_70_80),
                         .neighbor2(wire_71_81),
                         .neighbor3(cold),
                         .neighbor4(wire_81_82),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_80_81)
    );
    wire_calc calc_81_82(.tile1(board_in[8][1]),
                         .tile2(board_in[8][2]),
                         .neighbor1(wire_71_81),
                         .neighbor2(wire_72_82),
                         .neighbor3(wire_80_81),
                         .neighbor4(wire_82_83),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_81_82)
    );
    wire_calc calc_82_83(.tile1(board_in[8][2]),
                         .tile2(board_in[8][3]),
                         .neighbor1(wire_72_82),
                         .neighbor2(wire_73_83),
                         .neighbor3(wire_81_82),
                         .neighbor4(wire_83_84),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_82_83)
    );
    wire_calc calc_83_84(.tile1(board_in[8][3]),
                         .tile2(board_in[8][4]),
                         .neighbor1(wire_73_83),
                         .neighbor2(wire_74_84),
                         .neighbor3(wire_82_83),
                         .neighbor4(wire_84_85),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_83_84)
    );
    wire_calc calc_84_85(.tile1(board_in[8][4]),
                         .tile2(board_in[8][5]),
                         .neighbor1(wire_74_84),
                         .neighbor2(wire_75_85),
                         .neighbor3(wire_83_84),
                         .neighbor4(wire_85_86),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_84_85)
    );
    wire_calc calc_85_86(.tile1(board_in[8][5]),
                         .tile2(board_in[8][6]),
                         .neighbor1(wire_75_85),
                         .neighbor2(wire_76_86),
                         .neighbor3(wire_84_85),
                         .neighbor4(wire_86_87),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_85_86)
    );
    wire_calc calc_86_87(.tile1(board_in[8][6]),
                         .tile2(board_in[8][7]),
                         .neighbor1(wire_76_86),
                         .neighbor2(wire_77_87),
                         .neighbor3(wire_85_86),
                         .neighbor4(wire_87_88),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_86_87)
    );
    wire_calc calc_87_88(.tile1(board_in[8][7]),
                         .tile2(board_in[8][8]),
                         .neighbor1(wire_77_87),
                         .neighbor2(wire_78_88),
                         .neighbor3(wire_86_87),
                         .neighbor4(cold),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_87_88)
    );

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

module wire_calc(input logic [1:0] tile1, tile2,
                 input logic neighbor1, neighbor2, neighbor3, neighbor4, neighbor5, neighbor6,
                 output logic wire_out
  );
  parameter e = 2'b00;

  always_comb begin
    if ((tile1 ^ tile2) == 2'b11) begin
      wire_out = 0;
    end else if ((tile1 == e) | (tile2 == e)) begin
      wire_out = 1;
    end else begin
      wire_out = (neighbor1 | neighbor2 | neighbor3 | neighbor4 | neighbor5 | neighbor6);
    end
  end
endmodule
