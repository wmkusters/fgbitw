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


module pruner(input logic clk_in, start_flag, reset_in,
              input logic [1:0] prune_color,
              input logic [1:0] board_in [8:0][8:0],
              output logic done_pulse,
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

    logic wire_00_10mem;
    logic wire_00_01mem;
    logic wire_01_11mem;
    logic wire_01_02mem;
    logic wire_02_12mem;
    logic wire_02_03mem;
    logic wire_03_13mem;
    logic wire_03_04mem;
    logic wire_04_14mem;
    logic wire_04_05mem;
    logic wire_05_15mem;
    logic wire_05_06mem;
    logic wire_06_16mem;
    logic wire_06_07mem;
    logic wire_07_17mem;
    logic wire_07_08mem;
    logic wire_08_18mem;
    logic wire_08_09mem;
    logic wire_10_20mem;
    logic wire_10_11mem;
    logic wire_11_21mem;
    logic wire_11_12mem;
    logic wire_12_22mem;
    logic wire_12_13mem;
    logic wire_13_23mem;
    logic wire_13_14mem;
    logic wire_14_24mem;
    logic wire_14_15mem;
    logic wire_15_25mem;
    logic wire_15_16mem;
    logic wire_16_26mem;
    logic wire_16_17mem;
    logic wire_17_27mem;
    logic wire_17_18mem;
    logic wire_18_28mem;
    logic wire_18_19mem;
    logic wire_20_30mem;
    logic wire_20_21mem;
    logic wire_21_31mem;
    logic wire_21_22mem;
    logic wire_22_32mem;
    logic wire_22_23mem;
    logic wire_23_33mem;
    logic wire_23_24mem;
    logic wire_24_34mem;
    logic wire_24_25mem;
    logic wire_25_35mem;
    logic wire_25_26mem;
    logic wire_26_36mem;
    logic wire_26_27mem;
    logic wire_27_37mem;
    logic wire_27_28mem;
    logic wire_28_38mem;
    logic wire_28_29mem;
    logic wire_30_40mem;
    logic wire_30_31mem;
    logic wire_31_41mem;
    logic wire_31_32mem;
    logic wire_32_42mem;
    logic wire_32_33mem;
    logic wire_33_43mem;
    logic wire_33_34mem;
    logic wire_34_44mem;
    logic wire_34_35mem;
    logic wire_35_45mem;
    logic wire_35_36mem;
    logic wire_36_46mem;
    logic wire_36_37mem;
    logic wire_37_47mem;
    logic wire_37_38mem;
    logic wire_38_48mem;
    logic wire_38_39mem;
    logic wire_40_50mem;
    logic wire_40_41mem;
    logic wire_41_51mem;
    logic wire_41_42mem;
    logic wire_42_52mem;
    logic wire_42_43mem;
    logic wire_43_53mem;
    logic wire_43_44mem;
    logic wire_44_54mem;
    logic wire_44_45mem;
    logic wire_45_55mem;
    logic wire_45_46mem;
    logic wire_46_56mem;
    logic wire_46_47mem;
    logic wire_47_57mem;
    logic wire_47_48mem;
    logic wire_48_58mem;
    logic wire_48_49mem;
    logic wire_50_60mem;
    logic wire_50_51mem;
    logic wire_51_61mem;
    logic wire_51_52mem;
    logic wire_52_62mem;
    logic wire_52_53mem;
    logic wire_53_63mem;
    logic wire_53_54mem;
    logic wire_54_64mem;
    logic wire_54_55mem;
    logic wire_55_65mem;
    logic wire_55_56mem;
    logic wire_56_66mem;
    logic wire_56_57mem;
    logic wire_57_67mem;
    logic wire_57_58mem;
    logic wire_58_68mem;
    logic wire_58_59mem;
    logic wire_60_70mem;
    logic wire_60_61mem;
    logic wire_61_71mem;
    logic wire_61_62mem;
    logic wire_62_72mem;
    logic wire_62_63mem;
    logic wire_63_73mem;
    logic wire_63_64mem;
    logic wire_64_74mem;
    logic wire_64_65mem;
    logic wire_65_75mem;
    logic wire_65_66mem;
    logic wire_66_76mem;
    logic wire_66_67mem;
    logic wire_67_77mem;
    logic wire_67_68mem;
    logic wire_68_78mem;
    logic wire_68_69mem;
    logic wire_70_80mem;
    logic wire_70_71mem;
    logic wire_71_81mem;
    logic wire_71_72mem;
    logic wire_72_82mem;
    logic wire_72_73mem;
    logic wire_73_83mem;
    logic wire_73_74mem;
    logic wire_74_84mem;
    logic wire_74_75mem;
    logic wire_75_85mem;
    logic wire_75_76mem;
    logic wire_76_86mem;
    logic wire_76_77mem;
    logic wire_77_87mem;
    logic wire_77_78mem;
    logic wire_78_88mem;
    logic wire_78_79mem;
    logic wire_80_90mem;
    logic wire_80_81mem;
    logic wire_81_91mem;
    logic wire_81_82mem;
    logic wire_82_92mem;
    logic wire_82_83mem;
    logic wire_83_93mem;
    logic wire_83_84mem;
    logic wire_84_94mem;
    logic wire_84_85mem;
    logic wire_85_95mem;
    logic wire_85_86mem;
    logic wire_86_96mem;
    logic wire_86_87mem;
    logic wire_87_97mem;
    logic wire_87_88mem;
    logic wire_88_98mem;
    logic wire_88_89mem;
    parameter WAITING = 4'b0001;
    parameter PULSE = 4'b0010;
    parameter PROPAGATING = 4'b0100;
    parameter PRUNED = 4'b1000;

    logic [6:0] prop_count;
    logic [3:0] state, next_state;
    always_comb begin
        case (state)
            WAITING: next_state = (start_flag ? PULSE : state);
            PULSE: next_state = PROPAGATING;
            PROPAGATING: next_state = (prop_count == 0) ? PRUNED : state;
            PRUNED: next_state = WAITING;
        endcase
    end

    always_ff @(posedge clk_in) begin
        if (reset_in) begin
            state <= WAITING;
        end else begin   
            case(state)           
                WAITING: begin
                    prop_count <= 7'd81;
                    done_pulse <= 0;
                end
                PULSE: begin
                    wire_00_10mem <= 0;
                    wire_00_01mem <= 0;
                    wire_01_11mem <= 0;
                    wire_01_02mem <= 0;
                    wire_02_12mem <= 0;
                    wire_02_03mem <= 0;
                    wire_03_13mem <= 0;
                    wire_03_04mem <= 0;
                    wire_04_14mem <= 0;
                    wire_04_05mem <= 0;
                    wire_05_15mem <= 0;
                    wire_05_06mem <= 0;
                    wire_06_16mem <= 0;
                    wire_06_07mem <= 0;
                    wire_07_17mem <= 0;
                    wire_07_08mem <= 0;
                    wire_08_18mem <= 0;
                    wire_08_09mem <= 0;
                    wire_10_20mem <= 0;
                    wire_10_11mem <= 0;
                    wire_11_21mem <= 0;
                    wire_11_12mem <= 0;
                    wire_12_22mem <= 0;
                    wire_12_13mem <= 0;
                    wire_13_23mem <= 0;
                    wire_13_14mem <= 0;
                    wire_14_24mem <= 0;
                    wire_14_15mem <= 0;
                    wire_15_25mem <= 0;
                    wire_15_16mem <= 0;
                    wire_16_26mem <= 0;
                    wire_16_17mem <= 0;
                    wire_17_27mem <= 0;
                    wire_17_18mem <= 0;
                    wire_18_28mem <= 0;
                    wire_18_19mem <= 0;
                    wire_20_30mem <= 0;
                    wire_20_21mem <= 0;
                    wire_21_31mem <= 0;
                    wire_21_22mem <= 0;
                    wire_22_32mem <= 0;
                    wire_22_23mem <= 0;
                    wire_23_33mem <= 0;
                    wire_23_24mem <= 0;
                    wire_24_34mem <= 0;
                    wire_24_25mem <= 0;
                    wire_25_35mem <= 0;
                    wire_25_26mem <= 0;
                    wire_26_36mem <= 0;
                    wire_26_27mem <= 0;
                    wire_27_37mem <= 0;
                    wire_27_28mem <= 0;
                    wire_28_38mem <= 0;
                    wire_28_29mem <= 0;
                    wire_30_40mem <= 0;
                    wire_30_31mem <= 0;
                    wire_31_41mem <= 0;
                    wire_31_32mem <= 0;
                    wire_32_42mem <= 0;
                    wire_32_33mem <= 0;
                    wire_33_43mem <= 0;
                    wire_33_34mem <= 0;
                    wire_34_44mem <= 0;
                    wire_34_35mem <= 0;
                    wire_35_45mem <= 0;
                    wire_35_36mem <= 0;
                    wire_36_46mem <= 0;
                    wire_36_37mem <= 0;
                    wire_37_47mem <= 0;
                    wire_37_38mem <= 0;
                    wire_38_48mem <= 0;
                    wire_38_39mem <= 0;
                    wire_40_50mem <= 0;
                    wire_40_41mem <= 0;
                    wire_41_51mem <= 0;
                    wire_41_42mem <= 0;
                    wire_42_52mem <= 0;
                    wire_42_43mem <= 0;
                    wire_43_53mem <= 0;
                    wire_43_44mem <= 0;
                    wire_44_54mem <= 0;
                    wire_44_45mem <= 0;
                    wire_45_55mem <= 0;
                    wire_45_46mem <= 0;
                    wire_46_56mem <= 0;
                    wire_46_47mem <= 0;
                    wire_47_57mem <= 0;
                    wire_47_48mem <= 0;
                    wire_48_58mem <= 0;
                    wire_48_49mem <= 0;
                    wire_50_60mem <= 0;
                    wire_50_51mem <= 0;
                    wire_51_61mem <= 0;
                    wire_51_52mem <= 0;
                    wire_52_62mem <= 0;
                    wire_52_53mem <= 0;
                    wire_53_63mem <= 0;
                    wire_53_54mem <= 0;
                    wire_54_64mem <= 0;
                    wire_54_55mem <= 0;
                    wire_55_65mem <= 0;
                    wire_55_56mem <= 0;
                    wire_56_66mem <= 0;
                    wire_56_57mem <= 0;
                    wire_57_67mem <= 0;
                    wire_57_58mem <= 0;
                    wire_58_68mem <= 0;
                    wire_58_59mem <= 0;
                    wire_60_70mem <= 0;
                    wire_60_61mem <= 0;
                    wire_61_71mem <= 0;
                    wire_61_62mem <= 0;
                    wire_62_72mem <= 0;
                    wire_62_63mem <= 0;
                    wire_63_73mem <= 0;
                    wire_63_64mem <= 0;
                    wire_64_74mem <= 0;
                    wire_64_65mem <= 0;
                    wire_65_75mem <= 0;
                    wire_65_66mem <= 0;
                    wire_66_76mem <= 0;
                    wire_66_67mem <= 0;
                    wire_67_77mem <= 0;
                    wire_67_68mem <= 0;
                    wire_68_78mem <= 0;
                    wire_68_69mem <= 0;
                    wire_70_80mem <= 0;
                    wire_70_71mem <= 0;
                    wire_71_81mem <= 0;
                    wire_71_72mem <= 0;
                    wire_72_82mem <= 0;
                    wire_72_73mem <= 0;
                    wire_73_83mem <= 0;
                    wire_73_74mem <= 0;
                    wire_74_84mem <= 0;
                    wire_74_75mem <= 0;
                    wire_75_85mem <= 0;
                    wire_75_76mem <= 0;
                    wire_76_86mem <= 0;
                    wire_76_77mem <= 0;
                    wire_77_87mem <= 0;
                    wire_77_78mem <= 0;
                    wire_78_88mem <= 0;
                    wire_78_79mem <= 0;
                    wire_80_90mem <= 0;
                    wire_80_81mem <= 0;
                    wire_81_91mem <= 0;
                    wire_81_82mem <= 0;
                    wire_82_92mem <= 0;
                    wire_82_83mem <= 0;
                    wire_83_93mem <= 0;
                    wire_83_84mem <= 0;
                    wire_84_94mem <= 0;
                    wire_84_85mem <= 0;
                    wire_85_95mem <= 0;
                    wire_85_86mem <= 0;
                    wire_86_96mem <= 0;
                    wire_86_87mem <= 0;
                    wire_87_97mem <= 0;
                    wire_87_88mem <= 0;
                    wire_88_98mem <= 0;
                    wire_88_89mem <= 0; 
                end
                PROPAGATING: begin
                    prop_count <= prop_count - 1;
                    wire_00_10mem <= wire_00_10;
                    wire_00_01mem <= wire_00_01;
                    wire_01_11mem <= wire_01_11;
                    wire_01_02mem <= wire_01_02;
                    wire_02_12mem <= wire_02_12;
                    wire_02_03mem <= wire_02_03;
                    wire_03_13mem <= wire_03_13;
                    wire_03_04mem <= wire_03_04;
                    wire_04_14mem <= wire_04_14;
                    wire_04_05mem <= wire_04_05;
                    wire_05_15mem <= wire_05_15;
                    wire_05_06mem <= wire_05_06;
                    wire_06_16mem <= wire_06_16;
                    wire_06_07mem <= wire_06_07;
                    wire_07_17mem <= wire_07_17;
                    wire_07_08mem <= wire_07_08;
                    wire_08_18mem <= wire_08_18;
                    wire_08_09mem <= wire_08_09;
                    wire_10_20mem <= wire_10_20;
                    wire_10_11mem <= wire_10_11;
                    wire_11_21mem <= wire_11_21;
                    wire_11_12mem <= wire_11_12;
                    wire_12_22mem <= wire_12_22;
                    wire_12_13mem <= wire_12_13;
                    wire_13_23mem <= wire_13_23;
                    wire_13_14mem <= wire_13_14;
                    wire_14_24mem <= wire_14_24;
                    wire_14_15mem <= wire_14_15;
                    wire_15_25mem <= wire_15_25;
                    wire_15_16mem <= wire_15_16;
                    wire_16_26mem <= wire_16_26;
                    wire_16_17mem <= wire_16_17;
                    wire_17_27mem <= wire_17_27;
                    wire_17_18mem <= wire_17_18;
                    wire_18_28mem <= wire_18_28;
                    wire_18_19mem <= wire_18_19;
                    wire_20_30mem <= wire_20_30;
                    wire_20_21mem <= wire_20_21;
                    wire_21_31mem <= wire_21_31;
                    wire_21_22mem <= wire_21_22;
                    wire_22_32mem <= wire_22_32;
                    wire_22_23mem <= wire_22_23;
                    wire_23_33mem <= wire_23_33;
                    wire_23_24mem <= wire_23_24;
                    wire_24_34mem <= wire_24_34;
                    wire_24_25mem <= wire_24_25;
                    wire_25_35mem <= wire_25_35;
                    wire_25_26mem <= wire_25_26;
                    wire_26_36mem <= wire_26_36;
                    wire_26_27mem <= wire_26_27;
                    wire_27_37mem <= wire_27_37;
                    wire_27_28mem <= wire_27_28;
                    wire_28_38mem <= wire_28_38;
                    wire_28_29mem <= wire_28_29;
                    wire_30_40mem <= wire_30_40;
                    wire_30_31mem <= wire_30_31;
                    wire_31_41mem <= wire_31_41;
                    wire_31_32mem <= wire_31_32;
                    wire_32_42mem <= wire_32_42;
                    wire_32_33mem <= wire_32_33;
                    wire_33_43mem <= wire_33_43;
                    wire_33_34mem <= wire_33_34;
                    wire_34_44mem <= wire_34_44;
                    wire_34_35mem <= wire_34_35;
                    wire_35_45mem <= wire_35_45;
                    wire_35_36mem <= wire_35_36;
                    wire_36_46mem <= wire_36_46;
                    wire_36_37mem <= wire_36_37;
                    wire_37_47mem <= wire_37_47;
                    wire_37_38mem <= wire_37_38;
                    wire_38_48mem <= wire_38_48;
                    wire_38_39mem <= wire_38_39;
                    wire_40_50mem <= wire_40_50;
                    wire_40_41mem <= wire_40_41;
                    wire_41_51mem <= wire_41_51;
                    wire_41_42mem <= wire_41_42;
                    wire_42_52mem <= wire_42_52;
                    wire_42_43mem <= wire_42_43;
                    wire_43_53mem <= wire_43_53;
                    wire_43_44mem <= wire_43_44;
                    wire_44_54mem <= wire_44_54;
                    wire_44_45mem <= wire_44_45;
                    wire_45_55mem <= wire_45_55;
                    wire_45_46mem <= wire_45_46;
                    wire_46_56mem <= wire_46_56;
                    wire_46_47mem <= wire_46_47;
                    wire_47_57mem <= wire_47_57;
                    wire_47_48mem <= wire_47_48;
                    wire_48_58mem <= wire_48_58;
                    wire_48_49mem <= wire_48_49;
                    wire_50_60mem <= wire_50_60;
                    wire_50_51mem <= wire_50_51;
                    wire_51_61mem <= wire_51_61;
                    wire_51_52mem <= wire_51_52;
                    wire_52_62mem <= wire_52_62;
                    wire_52_53mem <= wire_52_53;
                    wire_53_63mem <= wire_53_63;
                    wire_53_54mem <= wire_53_54;
                    wire_54_64mem <= wire_54_64;
                    wire_54_55mem <= wire_54_55;
                    wire_55_65mem <= wire_55_65;
                    wire_55_56mem <= wire_55_56;
                    wire_56_66mem <= wire_56_66;
                    wire_56_57mem <= wire_56_57;
                    wire_57_67mem <= wire_57_67;
                    wire_57_58mem <= wire_57_58;
                    wire_58_68mem <= wire_58_68;
                    wire_58_59mem <= wire_58_59;
                    wire_60_70mem <= wire_60_70;
                    wire_60_61mem <= wire_60_61;
                    wire_61_71mem <= wire_61_71;
                    wire_61_62mem <= wire_61_62;
                    wire_62_72mem <= wire_62_72;
                    wire_62_63mem <= wire_62_63;
                    wire_63_73mem <= wire_63_73;
                    wire_63_64mem <= wire_63_64;
                    wire_64_74mem <= wire_64_74;
                    wire_64_65mem <= wire_64_65;
                    wire_65_75mem <= wire_65_75;
                    wire_65_66mem <= wire_65_66;
                    wire_66_76mem <= wire_66_76;
                    wire_66_67mem <= wire_66_67;
                    wire_67_77mem <= wire_67_77;
                    wire_67_68mem <= wire_67_68;
                    wire_68_78mem <= wire_68_78;
                    wire_68_69mem <= wire_68_69;
                    wire_70_80mem <= wire_70_80;
                    wire_70_71mem <= wire_70_71;
                    wire_71_81mem <= wire_71_81;
                    wire_71_72mem <= wire_71_72;
                    wire_72_82mem <= wire_72_82;
                    wire_72_73mem <= wire_72_73;
                    wire_73_83mem <= wire_73_83;
                    wire_73_74mem <= wire_73_74;
                    wire_74_84mem <= wire_74_84;
                    wire_74_75mem <= wire_74_75;
                    wire_75_85mem <= wire_75_85;
                    wire_75_76mem <= wire_75_76;
                    wire_76_86mem <= wire_76_86;
                    wire_76_77mem <= wire_76_77;
                    wire_77_87mem <= wire_77_87;
                    wire_77_78mem <= wire_77_78;
                    wire_78_88mem <= wire_78_88;
                    wire_78_79mem <= wire_78_79;
                    wire_80_90mem <= wire_80_90;
                    wire_80_81mem <= wire_80_81;
                    wire_81_91mem <= wire_81_91;
                    wire_81_82mem <= wire_81_82;
                    wire_82_92mem <= wire_82_92;
                    wire_82_83mem <= wire_82_83;
                    wire_83_93mem <= wire_83_93;
                    wire_83_84mem <= wire_83_84;
                    wire_84_94mem <= wire_84_94;
                    wire_84_85mem <= wire_84_85;
                    wire_85_95mem <= wire_85_95;
                    wire_85_86mem <= wire_85_86;
                    wire_86_96mem <= wire_86_96;
                    wire_86_87mem <= wire_86_87;
                    wire_87_97mem <= wire_87_97;
                    wire_87_88mem <= wire_87_88;
                    wire_88_98mem <= wire_88_98;
                    wire_88_89mem <= wire_88_89;    
                end
                PRUNED: begin
                    done_pulse <= 1;
                end
            endcase
            state <= next_state;
        end
    end

    logic [1:0] pruned_board [8:0] [8:0]; 
    logic or_wires [8:0][8:0];

    wire_calc calc_00_10(.tile1(board_in[0][0]),
                         .tile2(board_in[1][0]),
                         .neighbor1(cold    ),
                         .neighbor2(cold),
                         .neighbor3(wire_00_01mem),
                         .neighbor4(cold),
                         .neighbor5(wire_10_20mem),
                         .neighbor6(wire_10_11mem),
                         .wire_out(wire_00_10)
    );
    wire_calc calc_01_11(.tile1(board_in[0][1]),
                         .tile2(board_in[1][1]),
                         .neighbor1(wire_00_01mem),
                         .neighbor2(cold),
                         .neighbor3(wire_01_02mem),
                         .neighbor4(wire_10_11mem),
                         .neighbor5(wire_11_21mem),
                         .neighbor6(wire_11_12mem),
                         .wire_out(wire_01_11)
    );
    wire_calc calc_02_12(.tile1(board_in[0][2]),
                         .tile2(board_in[1][2]),
                         .neighbor1(wire_01_02mem),
                         .neighbor2(cold),
                         .neighbor3(wire_02_03mem),
                         .neighbor4(wire_11_12mem),
                         .neighbor5(wire_12_22mem),
                         .neighbor6(wire_12_13mem),
                         .wire_out(wire_02_12)
    );
    wire_calc calc_03_13(.tile1(board_in[0][3]),
                         .tile2(board_in[1][3]),
                         .neighbor1(wire_02_03mem),
                         .neighbor2(cold),
                         .neighbor3(wire_03_04mem),
                         .neighbor4(wire_12_13mem),
                         .neighbor5(wire_13_23mem),
                         .neighbor6(wire_13_14mem),
                         .wire_out(wire_03_13)
    );
    wire_calc calc_04_14(.tile1(board_in[0][4]),
                         .tile2(board_in[1][4]),
                         .neighbor1(wire_03_04mem),
                         .neighbor2(cold),
                         .neighbor3(wire_04_05mem),
                         .neighbor4(wire_13_14mem),
                         .neighbor5(wire_14_24mem),
                         .neighbor6(wire_14_15mem),
                         .wire_out(wire_04_14)
    );
    wire_calc calc_05_15(.tile1(board_in[0][5]),
                         .tile2(board_in[1][5]),
                         .neighbor1(wire_04_05mem),
                         .neighbor2(cold),
                         .neighbor3(wire_05_06mem),
                         .neighbor4(wire_14_15mem),
                         .neighbor5(wire_15_25mem),
                         .neighbor6(wire_15_16mem),
                         .wire_out(wire_05_15)
    );
    wire_calc calc_06_16(.tile1(board_in[0][6]),
                         .tile2(board_in[1][6]),
                         .neighbor1(wire_05_06mem),
                         .neighbor2(cold),
                         .neighbor3(wire_06_07mem),
                         .neighbor4(wire_15_16mem),
                         .neighbor5(wire_16_26mem),
                         .neighbor6(wire_16_17mem),
                         .wire_out(wire_06_16)
    );
    wire_calc calc_07_17(.tile1(board_in[0][7]),
                         .tile2(board_in[1][7]),
                         .neighbor1(wire_06_07mem),
                         .neighbor2(cold),
                         .neighbor3(wire_07_08mem),
                         .neighbor4(wire_16_17mem),
                         .neighbor5(wire_17_27mem),
                         .neighbor6(wire_17_18mem),
                         .wire_out(wire_07_17)
    );
    wire_calc calc_08_18(.tile1(board_in[0][8]),
                         .tile2(board_in[1][8]),
                         .neighbor1(wire_07_08mem),
                         .neighbor2(cold),
                         .neighbor3(cold),
                         .neighbor4(wire_17_18mem),
                         .neighbor5(wire_18_28mem),
                         .neighbor6(cold),
                         .wire_out(wire_08_18)
    );
    wire_calc calc_10_20(.tile1(board_in[1][0]),
                         .tile2(board_in[2][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_00_10mem),
                         .neighbor3(wire_10_11mem),
                         .neighbor4(cold),
                         .neighbor5(wire_20_30mem),
                         .neighbor6(wire_20_21mem),
                         .wire_out(wire_10_20)
    );
    wire_calc calc_11_21(.tile1(board_in[1][1]),
                         .tile2(board_in[2][1]),
                         .neighbor1(wire_10_11mem),
                         .neighbor2(wire_01_11mem),
                         .neighbor3(wire_11_12mem),
                         .neighbor4(wire_20_21mem),
                         .neighbor5(wire_21_31mem),
                         .neighbor6(wire_21_22mem),
                         .wire_out(wire_11_21)
    );
    wire_calc calc_12_22(.tile1(board_in[1][2]),
                         .tile2(board_in[2][2]),
                         .neighbor1(wire_11_12mem),
                         .neighbor2(wire_02_12mem),
                         .neighbor3(wire_12_13mem),
                         .neighbor4(wire_21_22mem),
                         .neighbor5(wire_22_32mem),
                         .neighbor6(wire_22_23mem),
                         .wire_out(wire_12_22)
    );
    wire_calc calc_13_23(.tile1(board_in[1][3]),
                         .tile2(board_in[2][3]),
                         .neighbor1(wire_12_13mem),
                         .neighbor2(wire_03_13mem),
                         .neighbor3(wire_13_14mem),
                         .neighbor4(wire_22_23mem),
                         .neighbor5(wire_23_33mem),
                         .neighbor6(wire_23_24mem),
                         .wire_out(wire_13_23)
    );
    wire_calc calc_14_24(.tile1(board_in[1][4]),
                         .tile2(board_in[2][4]),
                         .neighbor1(wire_13_14mem),
                         .neighbor2(wire_04_14mem),
                         .neighbor3(wire_14_15mem),
                         .neighbor4(wire_23_24mem),
                         .neighbor5(wire_24_34mem),
                         .neighbor6(wire_24_25mem),
                         .wire_out(wire_14_24)
    );
    wire_calc calc_15_25(.tile1(board_in[1][5]),
                         .tile2(board_in[2][5]),
                         .neighbor1(wire_14_15mem),
                         .neighbor2(wire_05_15mem),
                         .neighbor3(wire_15_16mem),
                         .neighbor4(wire_24_25mem),
                         .neighbor5(wire_25_35mem),
                         .neighbor6(wire_25_26mem),
                         .wire_out(wire_15_25)
    );
    wire_calc calc_16_26(.tile1(board_in[1][6]),
                         .tile2(board_in[2][6]),
                         .neighbor1(wire_15_16mem),
                         .neighbor2(wire_06_16mem),
                         .neighbor3(wire_16_17mem),
                         .neighbor4(wire_25_26mem),
                         .neighbor5(wire_26_36mem),
                         .neighbor6(wire_26_27mem),
                         .wire_out(wire_16_26)
    );
    wire_calc calc_17_27(.tile1(board_in[1][7]),
                         .tile2(board_in[2][7]),
                         .neighbor1(wire_16_17mem),
                         .neighbor2(wire_07_17mem),
                         .neighbor3(wire_17_18mem),
                         .neighbor4(wire_26_27mem),
                         .neighbor5(wire_27_37mem),
                         .neighbor6(wire_27_28mem),
                         .wire_out(wire_17_27)
    );
    wire_calc calc_18_28(.tile1(board_in[1][8]),
                         .tile2(board_in[2][8]),
                         .neighbor1(wire_17_18mem),
                         .neighbor2(wire_08_18mem),
                         .neighbor3(cold),
                         .neighbor4(wire_27_28mem),
                         .neighbor5(wire_28_38mem),
                         .neighbor6(cold),
                         .wire_out(wire_18_28)
    );
    wire_calc calc_20_30(.tile1(board_in[2][0]),
                         .tile2(board_in[3][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_10_20mem),
                         .neighbor3(wire_20_21mem),
                         .neighbor4(cold),
                         .neighbor5(wire_30_40mem),
                         .neighbor6(wire_30_31mem),
                         .wire_out(wire_20_30)
    );
    wire_calc calc_21_31(.tile1(board_in[2][1]),
                         .tile2(board_in[3][1]),
                         .neighbor1(wire_20_21mem),
                         .neighbor2(wire_11_21mem),
                         .neighbor3(wire_21_22mem),
                         .neighbor4(wire_30_31mem),
                         .neighbor5(wire_31_41mem),
                         .neighbor6(wire_31_32mem),
                         .wire_out(wire_21_31)
    );
    wire_calc calc_22_32(.tile1(board_in[2][2]),
                         .tile2(board_in[3][2]),
                         .neighbor1(wire_21_22mem),
                         .neighbor2(wire_12_22mem),
                         .neighbor3(wire_22_23mem),
                         .neighbor4(wire_31_32mem),
                         .neighbor5(wire_32_42mem),
                         .neighbor6(wire_32_33mem),
                         .wire_out(wire_22_32)
    );
    wire_calc calc_23_33(.tile1(board_in[2][3]),
                         .tile2(board_in[3][3]),
                         .neighbor1(wire_22_23mem),
                         .neighbor2(wire_13_23mem),
                         .neighbor3(wire_23_24mem),
                         .neighbor4(wire_32_33mem),
                         .neighbor5(wire_33_43mem),
                         .neighbor6(wire_33_34mem),
                         .wire_out(wire_23_33)
    );
    wire_calc calc_24_34(.tile1(board_in[2][4]),
                         .tile2(board_in[3][4]),
                         .neighbor1(wire_23_24mem),
                         .neighbor2(wire_14_24mem),
                         .neighbor3(wire_24_25mem),
                         .neighbor4(wire_33_34mem),
                         .neighbor5(wire_34_44mem),
                         .neighbor6(wire_34_35mem),
                         .wire_out(wire_24_34)
    );
    wire_calc calc_25_35(.tile1(board_in[2][5]),
                         .tile2(board_in[3][5]),
                         .neighbor1(wire_24_25mem),
                         .neighbor2(wire_15_25mem),
                         .neighbor3(wire_25_26mem),
                         .neighbor4(wire_34_35mem),
                         .neighbor5(wire_35_45mem),
                         .neighbor6(wire_35_36mem),
                         .wire_out(wire_25_35)
    );
    wire_calc calc_26_36(.tile1(board_in[2][6]),
                         .tile2(board_in[3][6]),
                         .neighbor1(wire_25_26mem),
                         .neighbor2(wire_16_26mem),
                         .neighbor3(wire_26_27mem),
                         .neighbor4(wire_35_36mem),
                         .neighbor5(wire_36_46mem),
                         .neighbor6(wire_36_37mem),
                         .wire_out(wire_26_36)
    );
    wire_calc calc_27_37(.tile1(board_in[2][7]),
                         .tile2(board_in[3][7]),
                         .neighbor1(wire_26_27mem),
                         .neighbor2(wire_17_27mem),
                         .neighbor3(wire_27_28mem),
                         .neighbor4(wire_36_37mem),
                         .neighbor5(wire_37_47mem),
                         .neighbor6(wire_37_38mem),
                         .wire_out(wire_27_37)
    );
    wire_calc calc_28_38(.tile1(board_in[2][8]),
                         .tile2(board_in[3][8]),
                         .neighbor1(wire_27_28mem),
                         .neighbor2(wire_18_28mem),
                         .neighbor3(cold),
                         .neighbor4(wire_37_38mem),
                         .neighbor5(wire_38_48mem),
                         .neighbor6(cold),
                         .wire_out(wire_28_38)
    );
    wire_calc calc_30_40(.tile1(board_in[3][0]),
                         .tile2(board_in[4][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_20_30mem),
                         .neighbor3(wire_30_31mem),
                         .neighbor4(cold),
                         .neighbor5(wire_40_50mem),
                         .neighbor6(wire_40_41mem),
                         .wire_out(wire_30_40)
    );
    wire_calc calc_31_41(.tile1(board_in[3][1]),
                         .tile2(board_in[4][1]),
                         .neighbor1(wire_30_31mem),
                         .neighbor2(wire_21_31mem),
                         .neighbor3(wire_31_32mem),
                         .neighbor4(wire_40_41mem),
                         .neighbor5(wire_41_51mem),
                         .neighbor6(wire_41_42mem),
                         .wire_out(wire_31_41)
    );
    wire_calc calc_32_42(.tile1(board_in[3][2]),
                         .tile2(board_in[4][2]),
                         .neighbor1(wire_31_32mem),
                         .neighbor2(wire_22_32mem),
                         .neighbor3(wire_32_33mem),
                         .neighbor4(wire_41_42mem),
                         .neighbor5(wire_42_52mem),
                         .neighbor6(wire_42_43mem),
                         .wire_out(wire_32_42)
    );
    wire_calc calc_33_43(.tile1(board_in[3][3]),
                         .tile2(board_in[4][3]),
                         .neighbor1(wire_32_33mem),
                         .neighbor2(wire_23_33mem),
                         .neighbor3(wire_33_34mem),
                         .neighbor4(wire_42_43mem),
                         .neighbor5(wire_43_53mem),
                         .neighbor6(wire_43_44mem),
                         .wire_out(wire_33_43)
    );
    wire_calc calc_34_44(.tile1(board_in[3][4]),
                         .tile2(board_in[4][4]),
                         .neighbor1(wire_33_34mem),
                         .neighbor2(wire_24_34mem),
                         .neighbor3(wire_34_35mem),
                         .neighbor4(wire_43_44mem),
                         .neighbor5(wire_44_54mem),
                         .neighbor6(wire_44_45mem),
                         .wire_out(wire_34_44)
    );
    wire_calc calc_35_45(.tile1(board_in[3][5]),
                         .tile2(board_in[4][5]),
                         .neighbor1(wire_34_35mem),
                         .neighbor2(wire_25_35mem),
                         .neighbor3(wire_35_36mem),
                         .neighbor4(wire_44_45mem),
                         .neighbor5(wire_45_55mem),
                         .neighbor6(wire_45_46mem),
                         .wire_out(wire_35_45)
    );
    wire_calc calc_36_46(.tile1(board_in[3][6]),
                         .tile2(board_in[4][6]),
                         .neighbor1(wire_35_36mem),
                         .neighbor2(wire_26_36mem),
                         .neighbor3(wire_36_37mem),
                         .neighbor4(wire_45_46mem),
                         .neighbor5(wire_46_56mem),
                         .neighbor6(wire_46_47mem),
                         .wire_out(wire_36_46)
    );
    wire_calc calc_37_47(.tile1(board_in[3][7]),
                         .tile2(board_in[4][7]),
                         .neighbor1(wire_36_37mem),
                         .neighbor2(wire_27_37mem),
                         .neighbor3(wire_37_38mem),
                         .neighbor4(wire_46_47mem),
                         .neighbor5(wire_47_57mem),
                         .neighbor6(wire_47_48mem),
                         .wire_out(wire_37_47)
    );
    wire_calc calc_38_48(.tile1(board_in[3][8]),
                         .tile2(board_in[4][8]),
                         .neighbor1(wire_37_38mem),
                         .neighbor2(wire_28_38mem),
                         .neighbor3(cold),
                         .neighbor4(wire_47_48mem),
                         .neighbor5(wire_48_58mem),
                         .neighbor6(cold),
                         .wire_out(wire_38_48)
    );
    wire_calc calc_40_50(.tile1(board_in[4][0]),
                         .tile2(board_in[5][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_30_40mem),
                         .neighbor3(wire_40_41mem),
                         .neighbor4(cold),
                         .neighbor5(wire_50_60mem),
                         .neighbor6(wire_50_51mem),
                         .wire_out(wire_40_50)
    );
    wire_calc calc_41_51(.tile1(board_in[4][1]),
                         .tile2(board_in[5][1]),
                         .neighbor1(wire_40_41mem),
                         .neighbor2(wire_31_41mem),
                         .neighbor3(wire_41_42mem),
                         .neighbor4(wire_50_51mem),
                         .neighbor5(wire_51_61mem),
                         .neighbor6(wire_51_52mem),
                         .wire_out(wire_41_51)
    );
    wire_calc calc_42_52(.tile1(board_in[4][2]),
                         .tile2(board_in[5][2]),
                         .neighbor1(wire_41_42mem),
                         .neighbor2(wire_32_42mem),
                         .neighbor3(wire_42_43mem),
                         .neighbor4(wire_51_52mem),
                         .neighbor5(wire_52_62mem),
                         .neighbor6(wire_52_53mem),
                         .wire_out(wire_42_52)
    );
    wire_calc calc_43_53(.tile1(board_in[4][3]),
                         .tile2(board_in[5][3]),
                         .neighbor1(wire_42_43mem),
                         .neighbor2(wire_33_43mem),
                         .neighbor3(wire_43_44mem),
                         .neighbor4(wire_52_53mem),
                         .neighbor5(wire_53_63mem),
                         .neighbor6(wire_53_54mem),
                         .wire_out(wire_43_53)
    );
    wire_calc calc_44_54(.tile1(board_in[4][4]),
                         .tile2(board_in[5][4]),
                         .neighbor1(wire_43_44mem),
                         .neighbor2(wire_34_44mem),
                         .neighbor3(wire_44_45mem),
                         .neighbor4(wire_53_54mem),
                         .neighbor5(wire_54_64mem),
                         .neighbor6(wire_54_55mem),
                         .wire_out(wire_44_54)
    );
    wire_calc calc_45_55(.tile1(board_in[4][5]),
                         .tile2(board_in[5][5]),
                         .neighbor1(wire_44_45mem),
                         .neighbor2(wire_35_45mem),
                         .neighbor3(wire_45_46mem),
                         .neighbor4(wire_54_55mem),
                         .neighbor5(wire_55_65mem),
                         .neighbor6(wire_55_56mem),
                         .wire_out(wire_45_55)
    );
    wire_calc calc_46_56(.tile1(board_in[4][6]),
                         .tile2(board_in[5][6]),
                         .neighbor1(wire_45_46mem),
                         .neighbor2(wire_36_46mem),
                         .neighbor3(wire_46_47mem),
                         .neighbor4(wire_55_56mem),
                         .neighbor5(wire_56_66mem),
                         .neighbor6(wire_56_57mem),
                         .wire_out(wire_46_56)
    );
    wire_calc calc_47_57(.tile1(board_in[4][7]),
                         .tile2(board_in[5][7]),
                         .neighbor1(wire_46_47mem),
                         .neighbor2(wire_37_47mem),
                         .neighbor3(wire_47_48mem),
                         .neighbor4(wire_56_57mem),
                         .neighbor5(wire_57_67mem),
                         .neighbor6(wire_57_58mem),
                         .wire_out(wire_47_57)
    );
    wire_calc calc_48_58(.tile1(board_in[4][8]),
                         .tile2(board_in[5][8]),
                         .neighbor1(wire_47_48mem),
                         .neighbor2(wire_38_48mem),
                         .neighbor3(cold),
                         .neighbor4(wire_57_58mem),
                         .neighbor5(wire_58_68mem),
                         .neighbor6(cold),
                         .wire_out(wire_48_58)
    );
    wire_calc calc_50_60(.tile1(board_in[5][0]),
                         .tile2(board_in[6][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_40_50mem),
                         .neighbor3(wire_50_51mem),
                         .neighbor4(cold),
                         .neighbor5(wire_60_70mem),
                         .neighbor6(wire_60_61mem),
                         .wire_out(wire_50_60)
    );
    wire_calc calc_51_61(.tile1(board_in[5][1]),
                         .tile2(board_in[6][1]),
                         .neighbor1(wire_50_51mem),
                         .neighbor2(wire_41_51mem),
                         .neighbor3(wire_51_52mem),
                         .neighbor4(wire_60_61mem),
                         .neighbor5(wire_61_71mem),
                         .neighbor6(wire_61_62mem),
                         .wire_out(wire_51_61)
    );
    wire_calc calc_52_62(.tile1(board_in[5][2]),
                         .tile2(board_in[6][2]),
                         .neighbor1(wire_51_52mem),
                         .neighbor2(wire_42_52mem),
                         .neighbor3(wire_52_53mem),
                         .neighbor4(wire_61_62mem),
                         .neighbor5(wire_62_72mem),
                         .neighbor6(wire_62_63mem),
                         .wire_out(wire_52_62)
    );
    wire_calc calc_53_63(.tile1(board_in[5][3]),
                         .tile2(board_in[6][3]),
                         .neighbor1(wire_52_53mem),
                         .neighbor2(wire_43_53mem),
                         .neighbor3(wire_53_54mem),
                         .neighbor4(wire_62_63mem),
                         .neighbor5(wire_63_73mem),
                         .neighbor6(wire_63_64mem),
                         .wire_out(wire_53_63)
    );
    wire_calc calc_54_64(.tile1(board_in[5][4]),
                         .tile2(board_in[6][4]),
                         .neighbor1(wire_53_54mem),
                         .neighbor2(wire_44_54mem),
                         .neighbor3(wire_54_55mem),
                         .neighbor4(wire_63_64mem),
                         .neighbor5(wire_64_74mem),
                         .neighbor6(wire_64_65mem),
                         .wire_out(wire_54_64)
    );
    wire_calc calc_55_65(.tile1(board_in[5][5]),
                         .tile2(board_in[6][5]),
                         .neighbor1(wire_54_55mem),
                         .neighbor2(wire_45_55mem),
                         .neighbor3(wire_55_56mem),
                         .neighbor4(wire_64_65mem),
                         .neighbor5(wire_65_75mem),
                         .neighbor6(wire_65_66mem),
                         .wire_out(wire_55_65)
    );
    wire_calc calc_56_66(.tile1(board_in[5][6]),
                         .tile2(board_in[6][6]),
                         .neighbor1(wire_55_56mem),
                         .neighbor2(wire_46_56mem),
                         .neighbor3(wire_56_57mem),
                         .neighbor4(wire_65_66mem),
                         .neighbor5(wire_66_76mem),
                         .neighbor6(wire_66_67mem),
                         .wire_out(wire_56_66)
    );
    wire_calc calc_57_67(.tile1(board_in[5][7]),
                         .tile2(board_in[6][7]),
                         .neighbor1(wire_56_57mem),
                         .neighbor2(wire_47_57mem),
                         .neighbor3(wire_57_58mem),
                         .neighbor4(wire_66_67mem),
                         .neighbor5(wire_67_77mem),
                         .neighbor6(wire_67_68mem),
                         .wire_out(wire_57_67)
    );
    wire_calc calc_58_68(.tile1(board_in[5][8]),
                         .tile2(board_in[6][8]),
                         .neighbor1(wire_57_58mem),
                         .neighbor2(wire_48_58mem),
                         .neighbor3(cold),
                         .neighbor4(wire_67_68mem),
                         .neighbor5(wire_68_78mem),
                         .neighbor6(cold),
                         .wire_out(wire_58_68)
    );
    wire_calc calc_60_70(.tile1(board_in[6][0]),
                         .tile2(board_in[7][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_50_60mem),
                         .neighbor3(wire_60_61mem),
                         .neighbor4(cold),
                         .neighbor5(wire_70_80mem),
                         .neighbor6(wire_70_71mem),
                         .wire_out(wire_60_70)
    );
    wire_calc calc_61_71(.tile1(board_in[6][1]),
                         .tile2(board_in[7][1]),
                         .neighbor1(wire_60_61mem),
                         .neighbor2(wire_51_61mem),
                         .neighbor3(wire_61_62mem),
                         .neighbor4(wire_70_71mem),
                         .neighbor5(wire_71_81mem),
                         .neighbor6(wire_71_72mem),
                         .wire_out(wire_61_71)
    );
    wire_calc calc_62_72(.tile1(board_in[6][2]),
                         .tile2(board_in[7][2]),
                         .neighbor1(wire_61_62mem),
                         .neighbor2(wire_52_62mem),
                         .neighbor3(wire_62_63mem),
                         .neighbor4(wire_71_72mem),
                         .neighbor5(wire_72_82mem),
                         .neighbor6(wire_72_73mem),
                         .wire_out(wire_62_72)
    );
    wire_calc calc_63_73(.tile1(board_in[6][3]),
                         .tile2(board_in[7][3]),
                         .neighbor1(wire_62_63mem),
                         .neighbor2(wire_53_63mem),
                         .neighbor3(wire_63_64mem),
                         .neighbor4(wire_72_73mem),
                         .neighbor5(wire_73_83mem),
                         .neighbor6(wire_73_74mem),
                         .wire_out(wire_63_73)
    );
    wire_calc calc_64_74(.tile1(board_in[6][4]),
                         .tile2(board_in[7][4]),
                         .neighbor1(wire_63_64mem),
                         .neighbor2(wire_54_64mem),
                         .neighbor3(wire_64_65mem),
                         .neighbor4(wire_73_74mem),
                         .neighbor5(wire_74_84mem),
                         .neighbor6(wire_74_75mem),
                         .wire_out(wire_64_74)
    );
    wire_calc calc_65_75(.tile1(board_in[6][5]),
                         .tile2(board_in[7][5]),
                         .neighbor1(wire_64_65mem),
                         .neighbor2(wire_55_65mem),
                         .neighbor3(wire_65_66mem),
                         .neighbor4(wire_74_75mem),
                         .neighbor5(wire_75_85mem),
                         .neighbor6(wire_75_76mem),
                         .wire_out(wire_65_75)
    );
    wire_calc calc_66_76(.tile1(board_in[6][6]),
                         .tile2(board_in[7][6]),
                         .neighbor1(wire_65_66mem),
                         .neighbor2(wire_56_66mem),
                         .neighbor3(wire_66_67mem),
                         .neighbor4(wire_75_76mem),
                         .neighbor5(wire_76_86mem),
                         .neighbor6(wire_76_77mem),
                         .wire_out(wire_66_76)
    );
    wire_calc calc_67_77(.tile1(board_in[6][7]),
                         .tile2(board_in[7][7]),
                         .neighbor1(wire_66_67mem),
                         .neighbor2(wire_57_67mem),
                         .neighbor3(wire_67_68mem),
                         .neighbor4(wire_76_77mem),
                         .neighbor5(wire_77_87mem),
                         .neighbor6(wire_77_78mem),
                         .wire_out(wire_67_77)
    );
    wire_calc calc_68_78(.tile1(board_in[6][8]),
                         .tile2(board_in[7][8]),
                         .neighbor1(wire_67_68mem),
                         .neighbor2(wire_58_68mem),
                         .neighbor3(cold),
                         .neighbor4(wire_77_78mem),
                         .neighbor5(wire_78_88mem),
                         .neighbor6(cold),
                         .wire_out(wire_68_78)
    );
    wire_calc calc_70_80(.tile1(board_in[7][0]),
                         .tile2(board_in[8][0]),
                         .neighbor1(cold),
                         .neighbor2(wire_60_70mem),
                         .neighbor3(wire_70_71mem),
                         .neighbor4(cold),
                         .neighbor5(cold),
                         .neighbor6(wire_80_81mem),
                         .wire_out(wire_70_80)
    );
    wire_calc calc_71_81(.tile1(board_in[7][1]),
                         .tile2(board_in[8][1]),
                         .neighbor1(wire_70_71mem),
                         .neighbor2(wire_61_71mem),
                         .neighbor3(wire_71_72mem),
                         .neighbor4(wire_80_81mem),
                         .neighbor5(cold),
                         .neighbor6(wire_81_82mem),
                         .wire_out(wire_71_81)
    );
    wire_calc calc_72_82(.tile1(board_in[7][2]),
                         .tile2(board_in[8][2]),
                         .neighbor1(wire_71_72mem),
                         .neighbor2(wire_62_72mem),
                         .neighbor3(wire_72_73mem),
                         .neighbor4(wire_81_82mem),
                         .neighbor5(cold),
                         .neighbor6(wire_82_83mem),
                         .wire_out(wire_72_82)
    );
    wire_calc calc_73_83(.tile1(board_in[7][3]),
                         .tile2(board_in[8][3]),
                         .neighbor1(wire_72_73mem),
                         .neighbor2(wire_63_73mem),
                         .neighbor3(wire_73_74mem),
                         .neighbor4(wire_82_83mem),
                         .neighbor5(cold),
                         .neighbor6(wire_83_84mem),
                         .wire_out(wire_73_83)
    );
    wire_calc calc_74_84(.tile1(board_in[7][4]),
                         .tile2(board_in[8][4]),
                         .neighbor1(wire_73_74mem),
                         .neighbor2(wire_64_74mem),
                         .neighbor3(wire_74_75mem),
                         .neighbor4(wire_83_84mem),
                         .neighbor5(cold),
                         .neighbor6(wire_84_85mem),
                         .wire_out(wire_74_84)
    );
    wire_calc calc_75_85(.tile1(board_in[7][5]),
                         .tile2(board_in[8][5]),
                         .neighbor1(wire_74_75mem),
                         .neighbor2(wire_65_75mem),
                         .neighbor3(wire_75_76mem),
                         .neighbor4(wire_84_85mem),
                         .neighbor5(cold),
                         .neighbor6(wire_85_86mem),
                         .wire_out(wire_75_85)
    );
    wire_calc calc_76_86(.tile1(board_in[7][6]),
                         .tile2(board_in[8][6]),
                         .neighbor1(wire_75_76mem),
                         .neighbor2(wire_66_76mem),
                         .neighbor3(wire_76_77mem),
                         .neighbor4(wire_85_86mem),
                         .neighbor5(cold),
                         .neighbor6(wire_86_87mem),
                         .wire_out(wire_76_86)
    );
    wire_calc calc_77_87(.tile1(board_in[7][7]),
                         .tile2(board_in[8][7]),
                         .neighbor1(wire_76_77mem),
                         .neighbor2(wire_67_77mem),
                         .neighbor3(wire_77_78mem),
                         .neighbor4(wire_86_87mem),
                         .neighbor5(cold),
                         .neighbor6(wire_87_88mem),
                         .wire_out(wire_77_87)
    );
    wire_calc calc_78_88(.tile1(board_in[7][8]),
                         .tile2(board_in[8][8]),
                         .neighbor1(wire_77_78mem),
                         .neighbor2(wire_68_78mem),
                         .neighbor3(cold),
                         .neighbor4(wire_87_88mem),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_78_88)
    );
    wire_calc calc_00_01(.tile1(board_in[0][0]),
                         .tile2(board_in[0][1]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(cold),
                         .neighbor4(wire_01_02mem),
                         .neighbor5(wire_00_10mem),
                         .neighbor6(wire_01_11mem),
                         .wire_out(wire_00_01)
    );
    wire_calc calc_01_02(.tile1(board_in[0][1]),
                         .tile2(board_in[0][2]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_00_01mem),
                         .neighbor4(wire_02_03mem),
                         .neighbor5(wire_01_11mem),
                         .neighbor6(wire_02_12mem),
                         .wire_out(wire_01_02)
    );
    wire_calc calc_02_03(.tile1(board_in[0][2]),
                         .tile2(board_in[0][3]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_01_02mem),
                         .neighbor4(wire_03_04mem),
                         .neighbor5(wire_02_12mem),
                         .neighbor6(wire_03_13mem),
                         .wire_out(wire_02_03)
    );
    wire_calc calc_03_04(.tile1(board_in[0][3]),
                         .tile2(board_in[0][4]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_02_03mem),
                         .neighbor4(wire_04_05mem),
                         .neighbor5(wire_03_13mem),
                         .neighbor6(wire_04_14mem),
                         .wire_out(wire_03_04)
    );
    wire_calc calc_04_05(.tile1(board_in[0][4]),
                         .tile2(board_in[0][5]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_03_04mem),
                         .neighbor4(wire_05_06mem),
                         .neighbor5(wire_04_14mem),
                         .neighbor6(wire_05_15mem),
                         .wire_out(wire_04_05)
    );
    wire_calc calc_05_06(.tile1(board_in[0][5]),
                         .tile2(board_in[0][6]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_04_05mem),
                         .neighbor4(wire_06_07mem),
                         .neighbor5(wire_05_15mem),
                         .neighbor6(wire_06_16mem),
                         .wire_out(wire_05_06)
    );
    wire_calc calc_06_07(.tile1(board_in[0][6]),
                         .tile2(board_in[0][7]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_05_06mem),
                         .neighbor4(wire_07_08mem),
                         .neighbor5(wire_06_16mem),
                         .neighbor6(wire_07_17mem),
                         .wire_out(wire_06_07)
    );
    wire_calc calc_07_08(.tile1(board_in[0][7]),
                         .tile2(board_in[0][8]),
                         .neighbor1(cold),
                         .neighbor2(cold),
                         .neighbor3(wire_06_07mem),
                         .neighbor4(cold),
                         .neighbor5(wire_07_17mem),
                         .neighbor6(wire_08_18mem),
                         .wire_out(wire_07_08)
    );
    wire_calc calc_10_11(.tile1(board_in[1][0]),
                         .tile2(board_in[1][1]),
                         .neighbor1(wire_00_10mem),
                         .neighbor2(wire_01_11mem),
                         .neighbor3(cold),
                         .neighbor4(wire_11_12mem),
                         .neighbor5(wire_10_20mem),
                         .neighbor6(wire_11_21mem),
                         .wire_out(wire_10_11)
    );
    wire_calc calc_11_12(.tile1(board_in[1][1]),
                         .tile2(board_in[1][2]),
                         .neighbor1(wire_01_11mem),
                         .neighbor2(wire_02_12mem),
                         .neighbor3(wire_10_11mem),
                         .neighbor4(wire_12_13mem),
                         .neighbor5(wire_11_21mem),
                         .neighbor6(wire_12_22mem),
                         .wire_out(wire_11_12)
    );
    wire_calc calc_12_13(.tile1(board_in[1][2]),
                         .tile2(board_in[1][3]),
                         .neighbor1(wire_02_12mem),
                         .neighbor2(wire_03_13mem),
                         .neighbor3(wire_11_12mem),
                         .neighbor4(wire_13_14mem),
                         .neighbor5(wire_12_22mem),
                         .neighbor6(wire_13_23mem),
                         .wire_out(wire_12_13)
    );
    wire_calc calc_13_14(.tile1(board_in[1][3]),
                         .tile2(board_in[1][4]),
                         .neighbor1(wire_03_13mem),
                         .neighbor2(wire_04_14mem),
                         .neighbor3(wire_12_13mem),
                         .neighbor4(wire_14_15mem),
                         .neighbor5(wire_13_23mem),
                         .neighbor6(wire_14_24mem),
                         .wire_out(wire_13_14)
    );
    wire_calc calc_14_15(.tile1(board_in[1][4]),
                         .tile2(board_in[1][5]),
                         .neighbor1(wire_04_14mem),
                         .neighbor2(wire_05_15mem),
                         .neighbor3(wire_13_14mem),
                         .neighbor4(wire_15_16mem),
                         .neighbor5(wire_14_24mem),
                         .neighbor6(wire_15_25mem),
                         .wire_out(wire_14_15)
    );
    wire_calc calc_15_16(.tile1(board_in[1][5]),
                         .tile2(board_in[1][6]),
                         .neighbor1(wire_05_15mem),
                         .neighbor2(wire_06_16mem),
                         .neighbor3(wire_14_15mem),
                         .neighbor4(wire_16_17mem),
                         .neighbor5(wire_15_25mem),
                         .neighbor6(wire_16_26mem),
                         .wire_out(wire_15_16)
    );
    wire_calc calc_16_17(.tile1(board_in[1][6]),
                         .tile2(board_in[1][7]),
                         .neighbor1(wire_06_16mem),
                         .neighbor2(wire_07_17mem),
                         .neighbor3(wire_15_16mem),
                         .neighbor4(wire_17_18mem),
                         .neighbor5(wire_16_26mem),
                         .neighbor6(wire_17_27mem),
                         .wire_out(wire_16_17)
    );
    wire_calc calc_17_18(.tile1(board_in[1][7]),
                         .tile2(board_in[1][8]),
                         .neighbor1(wire_07_17mem),
                         .neighbor2(wire_08_18mem),
                         .neighbor3(wire_16_17mem),
                         .neighbor4(cold),
                         .neighbor5(wire_17_27mem),
                         .neighbor6(wire_18_28mem),
                         .wire_out(wire_17_18)
    );
    wire_calc calc_20_21(.tile1(board_in[2][0]),
                         .tile2(board_in[2][1]),
                         .neighbor1(wire_10_20mem),
                         .neighbor2(wire_11_21mem),
                         .neighbor3(cold),
                         .neighbor4(wire_21_22mem),
                         .neighbor5(wire_20_30mem),
                         .neighbor6(wire_21_31mem),
                         .wire_out(wire_20_21)
    );
    wire_calc calc_21_22(.tile1(board_in[2][1]),
                         .tile2(board_in[2][2]),
                         .neighbor1(wire_11_21mem),
                         .neighbor2(wire_12_22mem),
                         .neighbor3(wire_20_21mem),
                         .neighbor4(wire_22_23mem),
                         .neighbor5(wire_21_31mem),
                         .neighbor6(wire_22_32mem),
                         .wire_out(wire_21_22)
    );
    wire_calc calc_22_23(.tile1(board_in[2][2]),
                         .tile2(board_in[2][3]),
                         .neighbor1(wire_12_22mem),
                         .neighbor2(wire_13_23mem),
                         .neighbor3(wire_21_22mem),
                         .neighbor4(wire_23_24mem),
                         .neighbor5(wire_22_32mem),
                         .neighbor6(wire_23_33mem),
                         .wire_out(wire_22_23)
    );
    wire_calc calc_23_24(.tile1(board_in[2][3]),
                         .tile2(board_in[2][4]),
                         .neighbor1(wire_13_23mem),
                         .neighbor2(wire_14_24mem),
                         .neighbor3(wire_22_23mem),
                         .neighbor4(wire_24_25mem),
                         .neighbor5(wire_23_33mem),
                         .neighbor6(wire_24_34mem),
                         .wire_out(wire_23_24)
    );
    wire_calc calc_24_25(.tile1(board_in[2][4]),
                         .tile2(board_in[2][5]),
                         .neighbor1(wire_14_24mem),
                         .neighbor2(wire_15_25mem),
                         .neighbor3(wire_23_24mem),
                         .neighbor4(wire_25_26mem),
                         .neighbor5(wire_24_34mem),
                         .neighbor6(wire_25_35mem),
                         .wire_out(wire_24_25)
    );
    wire_calc calc_25_26(.tile1(board_in[2][5]),
                         .tile2(board_in[2][6]),
                         .neighbor1(wire_15_25mem),
                         .neighbor2(wire_16_26mem),
                         .neighbor3(wire_24_25mem),
                         .neighbor4(wire_26_27mem),
                         .neighbor5(wire_25_35mem),
                         .neighbor6(wire_26_36mem),
                         .wire_out(wire_25_26)
    );
    wire_calc calc_26_27(.tile1(board_in[2][6]),
                         .tile2(board_in[2][7]),
                         .neighbor1(wire_16_26mem),
                         .neighbor2(wire_17_27mem),
                         .neighbor3(wire_25_26mem),
                         .neighbor4(wire_27_28mem),
                         .neighbor5(wire_26_36mem),
                         .neighbor6(wire_27_37mem),
                         .wire_out(wire_26_27)
    );
    wire_calc calc_27_28(.tile1(board_in[2][7]),
                         .tile2(board_in[2][8]),
                         .neighbor1(wire_17_27mem),
                         .neighbor2(wire_18_28mem),
                         .neighbor3(wire_26_27mem),
                         .neighbor4(cold),
                         .neighbor5(wire_27_37mem),
                         .neighbor6(wire_28_38mem),
                         .wire_out(wire_27_28)
    );
    wire_calc calc_30_31(.tile1(board_in[3][0]),
                         .tile2(board_in[3][1]),
                         .neighbor1(wire_20_30mem),
                         .neighbor2(wire_21_31mem),
                         .neighbor3(cold),
                         .neighbor4(wire_31_32mem),
                         .neighbor5(wire_30_40mem),
                         .neighbor6(wire_31_41mem),
                         .wire_out(wire_30_31)
    );
    wire_calc calc_31_32(.tile1(board_in[3][1]),
                         .tile2(board_in[3][2]),
                         .neighbor1(wire_21_31mem),
                         .neighbor2(wire_22_32mem),
                         .neighbor3(wire_30_31mem),
                         .neighbor4(wire_32_33mem),
                         .neighbor5(wire_31_41mem),
                         .neighbor6(wire_32_42mem),
                         .wire_out(wire_31_32)
    );
    wire_calc calc_32_33(.tile1(board_in[3][2]),
                         .tile2(board_in[3][3]),
                         .neighbor1(wire_22_32mem),
                         .neighbor2(wire_23_33mem),
                         .neighbor3(wire_31_32mem),
                         .neighbor4(wire_33_34mem),
                         .neighbor5(wire_32_42mem),
                         .neighbor6(wire_33_43mem),
                         .wire_out(wire_32_33)
    );
    wire_calc calc_33_34(.tile1(board_in[3][3]),
                         .tile2(board_in[3][4]),
                         .neighbor1(wire_23_33mem),
                         .neighbor2(wire_24_34mem),
                         .neighbor3(wire_32_33mem),
                         .neighbor4(wire_34_35mem),
                         .neighbor5(wire_33_43mem),
                         .neighbor6(wire_34_44mem),
                         .wire_out(wire_33_34)
    );
    wire_calc calc_34_35(.tile1(board_in[3][4]),
                         .tile2(board_in[3][5]),
                         .neighbor1(wire_24_34mem),
                         .neighbor2(wire_25_35mem),
                         .neighbor3(wire_33_34mem),
                         .neighbor4(wire_35_36mem),
                         .neighbor5(wire_34_44mem),
                         .neighbor6(wire_35_45mem),
                         .wire_out(wire_34_35)
    );
    wire_calc calc_35_36(.tile1(board_in[3][5]),
                         .tile2(board_in[3][6]),
                         .neighbor1(wire_25_35mem),
                         .neighbor2(wire_26_36mem),
                         .neighbor3(wire_34_35mem),
                         .neighbor4(wire_36_37mem),
                         .neighbor5(wire_35_45mem),
                         .neighbor6(wire_36_46mem),
                         .wire_out(wire_35_36)
    );
    wire_calc calc_36_37(.tile1(board_in[3][6]),
                         .tile2(board_in[3][7]),
                         .neighbor1(wire_26_36mem),
                         .neighbor2(wire_27_37mem),
                         .neighbor3(wire_35_36mem),
                         .neighbor4(wire_37_38mem),
                         .neighbor5(wire_36_46mem),
                         .neighbor6(wire_37_47mem),
                         .wire_out(wire_36_37)
    );
    wire_calc calc_37_38(.tile1(board_in[3][7]),
                         .tile2(board_in[3][8]),
                         .neighbor1(wire_27_37mem),
                         .neighbor2(wire_28_38mem),
                         .neighbor3(wire_36_37mem),
                         .neighbor4(cold),
                         .neighbor5(wire_37_47mem),
                         .neighbor6(wire_38_48mem),
                         .wire_out(wire_37_38)
    );
    wire_calc calc_40_41(.tile1(board_in[4][0]),
                         .tile2(board_in[4][1]),
                         .neighbor1(wire_30_40mem),
                         .neighbor2(wire_31_41mem),
                         .neighbor3(cold),
                         .neighbor4(wire_41_42mem),
                         .neighbor5(wire_40_50mem),
                         .neighbor6(wire_41_51mem),
                         .wire_out(wire_40_41)
    );
    wire_calc calc_41_42(.tile1(board_in[4][1]),
                         .tile2(board_in[4][2]),
                         .neighbor1(wire_31_41mem),
                         .neighbor2(wire_32_42mem),
                         .neighbor3(wire_40_41mem),
                         .neighbor4(wire_42_43mem),
                         .neighbor5(wire_41_51mem),
                         .neighbor6(wire_42_52mem),
                         .wire_out(wire_41_42)
    );
    wire_calc calc_42_43(.tile1(board_in[4][2]),
                         .tile2(board_in[4][3]),
                         .neighbor1(wire_32_42mem),
                         .neighbor2(wire_33_43mem),
                         .neighbor3(wire_41_42mem),
                         .neighbor4(wire_43_44mem),
                         .neighbor5(wire_42_52mem),
                         .neighbor6(wire_43_53mem),
                         .wire_out(wire_42_43)
    );
    wire_calc calc_43_44(.tile1(board_in[4][3]),
                         .tile2(board_in[4][4]),
                         .neighbor1(wire_33_43mem),
                         .neighbor2(wire_34_44mem),
                         .neighbor3(wire_42_43mem),
                         .neighbor4(wire_44_45mem),
                         .neighbor5(wire_43_53mem),
                         .neighbor6(wire_44_54mem),
                         .wire_out(wire_43_44)
    );
    wire_calc calc_44_45(.tile1(board_in[4][4]),
                         .tile2(board_in[4][5]),
                         .neighbor1(wire_34_44mem),
                         .neighbor2(wire_35_45mem),
                         .neighbor3(wire_43_44mem),
                         .neighbor4(wire_45_46mem),
                         .neighbor5(wire_44_54mem),
                         .neighbor6(wire_45_55mem),
                         .wire_out(wire_44_45)
    );
    wire_calc calc_45_46(.tile1(board_in[4][5]),
                         .tile2(board_in[4][6]),
                         .neighbor1(wire_35_45mem),
                         .neighbor2(wire_36_46mem),
                         .neighbor3(wire_44_45mem),
                         .neighbor4(wire_46_47mem),
                         .neighbor5(wire_45_55mem),
                         .neighbor6(wire_46_56mem),
                         .wire_out(wire_45_46)
    );
    wire_calc calc_46_47(.tile1(board_in[4][6]),
                         .tile2(board_in[4][7]),
                         .neighbor1(wire_36_46mem),
                         .neighbor2(wire_37_47mem),
                         .neighbor3(wire_45_46mem),
                         .neighbor4(wire_47_48mem),
                         .neighbor5(wire_46_56mem),
                         .neighbor6(wire_47_57mem),
                         .wire_out(wire_46_47)
    );
    wire_calc calc_47_48(.tile1(board_in[4][7]),
                         .tile2(board_in[4][8]),
                         .neighbor1(wire_37_47mem),
                         .neighbor2(wire_38_48mem),
                         .neighbor3(wire_46_47mem),
                         .neighbor4(cold),
                         .neighbor5(wire_47_57mem),
                         .neighbor6(wire_48_58mem),
                         .wire_out(wire_47_48)
    );
    wire_calc calc_50_51(.tile1(board_in[5][0]),
                         .tile2(board_in[5][1]),
                         .neighbor1(wire_40_50mem),
                         .neighbor2(wire_41_51mem),
                         .neighbor3(cold),
                         .neighbor4(wire_51_52mem),
                         .neighbor5(wire_50_60mem),
                         .neighbor6(wire_51_61mem),
                         .wire_out(wire_50_51)
    );
    wire_calc calc_51_52(.tile1(board_in[5][1]),
                         .tile2(board_in[5][2]),
                         .neighbor1(wire_41_51mem),
                         .neighbor2(wire_42_52mem),
                         .neighbor3(wire_50_51mem),
                         .neighbor4(wire_52_53mem),
                         .neighbor5(wire_51_61mem),
                         .neighbor6(wire_52_62mem),
                         .wire_out(wire_51_52)
    );
    wire_calc calc_52_53(.tile1(board_in[5][2]),
                         .tile2(board_in[5][3]),
                         .neighbor1(wire_42_52mem),
                         .neighbor2(wire_43_53mem),
                         .neighbor3(wire_51_52mem),
                         .neighbor4(wire_53_54mem),
                         .neighbor5(wire_52_62mem),
                         .neighbor6(wire_53_63mem),
                         .wire_out(wire_52_53)
    );
    wire_calc calc_53_54(.tile1(board_in[5][3]),
                         .tile2(board_in[5][4]),
                         .neighbor1(wire_43_53mem),
                         .neighbor2(wire_44_54mem),
                         .neighbor3(wire_52_53mem),
                         .neighbor4(wire_54_55mem),
                         .neighbor5(wire_53_63mem),
                         .neighbor6(wire_54_64mem),
                         .wire_out(wire_53_54)
    );
    wire_calc calc_54_55(.tile1(board_in[5][4]),
                         .tile2(board_in[5][5]),
                         .neighbor1(wire_44_54mem),
                         .neighbor2(wire_45_55mem),
                         .neighbor3(wire_53_54mem),
                         .neighbor4(wire_55_56mem),
                         .neighbor5(wire_54_64mem),
                         .neighbor6(wire_55_65mem),
                         .wire_out(wire_54_55)
    );
    wire_calc calc_55_56(.tile1(board_in[5][5]),
                         .tile2(board_in[5][6]),
                         .neighbor1(wire_45_55mem),
                         .neighbor2(wire_46_56mem),
                         .neighbor3(wire_54_55mem),
                         .neighbor4(wire_56_57mem),
                         .neighbor5(wire_55_65mem),
                         .neighbor6(wire_56_66mem),
                         .wire_out(wire_55_56)
    );
    wire_calc calc_56_57(.tile1(board_in[5][6]),
                         .tile2(board_in[5][7]),
                         .neighbor1(wire_46_56mem),
                         .neighbor2(wire_47_57mem),
                         .neighbor3(wire_55_56mem),
                         .neighbor4(wire_57_58mem),
                         .neighbor5(wire_56_66mem),
                         .neighbor6(wire_57_67mem),
                         .wire_out(wire_56_57)
    );
    wire_calc calc_57_58(.tile1(board_in[5][7]),
                         .tile2(board_in[5][8]),
                         .neighbor1(wire_47_57mem),
                         .neighbor2(wire_48_58mem),
                         .neighbor3(wire_56_57mem),
                         .neighbor4(cold),
                         .neighbor5(wire_57_67mem),
                         .neighbor6(wire_58_68mem),
                         .wire_out(wire_57_58)
    );
    wire_calc calc_60_61(.tile1(board_in[6][0]),
                         .tile2(board_in[6][1]),
                         .neighbor1(wire_50_60mem),
                         .neighbor2(wire_51_61mem),
                         .neighbor3(cold),
                         .neighbor4(wire_61_62mem),
                         .neighbor5(wire_60_70mem),
                         .neighbor6(wire_61_71mem),
                         .wire_out(wire_60_61)
    );
    wire_calc calc_61_62(.tile1(board_in[6][1]),
                         .tile2(board_in[6][2]),
                         .neighbor1(wire_51_61mem),
                         .neighbor2(wire_52_62mem),
                         .neighbor3(wire_60_61mem),
                         .neighbor4(wire_62_63mem),
                         .neighbor5(wire_61_71mem),
                         .neighbor6(wire_62_72mem),
                         .wire_out(wire_61_62)
    );
    wire_calc calc_62_63(.tile1(board_in[6][2]),
                         .tile2(board_in[6][3]),
                         .neighbor1(wire_52_62mem),
                         .neighbor2(wire_53_63mem),
                         .neighbor3(wire_61_62mem),
                         .neighbor4(wire_63_64mem),
                         .neighbor5(wire_62_72mem),
                         .neighbor6(wire_63_73mem),
                         .wire_out(wire_62_63)
    );
    wire_calc calc_63_64(.tile1(board_in[6][3]),
                         .tile2(board_in[6][4]),
                         .neighbor1(wire_53_63mem),
                         .neighbor2(wire_54_64mem),
                         .neighbor3(wire_62_63mem),
                         .neighbor4(wire_64_65mem),
                         .neighbor5(wire_63_73mem),
                         .neighbor6(wire_64_74mem),
                         .wire_out(wire_63_64)
    );
    wire_calc calc_64_65(.tile1(board_in[6][4]),
                         .tile2(board_in[6][5]),
                         .neighbor1(wire_54_64mem),
                         .neighbor2(wire_55_65mem),
                         .neighbor3(wire_63_64mem),
                         .neighbor4(wire_65_66mem),
                         .neighbor5(wire_64_74mem),
                         .neighbor6(wire_65_75mem),
                         .wire_out(wire_64_65)
    );
    wire_calc calc_65_66(.tile1(board_in[6][5]),
                         .tile2(board_in[6][6]),
                         .neighbor1(wire_55_65mem),
                         .neighbor2(wire_56_66mem),
                         .neighbor3(wire_64_65mem),
                         .neighbor4(wire_66_67mem),
                         .neighbor5(wire_65_75mem),
                         .neighbor6(wire_66_76mem),
                         .wire_out(wire_65_66)
    );
    wire_calc calc_66_67(.tile1(board_in[6][6]),
                         .tile2(board_in[6][7]),
                         .neighbor1(wire_56_66mem),
                         .neighbor2(wire_57_67mem),
                         .neighbor3(wire_65_66mem),
                         .neighbor4(wire_67_68mem),
                         .neighbor5(wire_66_76mem),
                         .neighbor6(wire_67_77mem),
                         .wire_out(wire_66_67)
    );
    wire_calc calc_67_68(.tile1(board_in[6][7]),
                         .tile2(board_in[6][8]),
                         .neighbor1(wire_57_67mem),
                         .neighbor2(wire_58_68mem),
                         .neighbor3(wire_66_67mem),
                         .neighbor4(cold),
                         .neighbor5(wire_67_77mem),
                         .neighbor6(wire_68_78mem),
                         .wire_out(wire_67_68)
    );
    wire_calc calc_70_71(.tile1(board_in[7][0]),
                         .tile2(board_in[7][1]),
                         .neighbor1(wire_60_70mem),
                         .neighbor2(wire_61_71mem),
                         .neighbor3(cold),
                         .neighbor4(wire_71_72mem),
                         .neighbor5(wire_70_80mem),
                         .neighbor6(wire_71_81mem),
                         .wire_out(wire_70_71)
    );
    wire_calc calc_71_72(.tile1(board_in[7][1]),
                         .tile2(board_in[7][2]),
                         .neighbor1(wire_61_71mem),
                         .neighbor2(wire_62_72mem),
                         .neighbor3(wire_70_71mem),
                         .neighbor4(wire_72_73mem),
                         .neighbor5(wire_71_81mem),
                         .neighbor6(wire_72_82mem),
                         .wire_out(wire_71_72)
    );
    wire_calc calc_72_73(.tile1(board_in[7][2]),
                         .tile2(board_in[7][3]),
                         .neighbor1(wire_62_72mem),
                         .neighbor2(wire_63_73mem),
                         .neighbor3(wire_71_72mem),
                         .neighbor4(wire_73_74mem),
                         .neighbor5(wire_72_82mem),
                         .neighbor6(wire_73_83mem),
                         .wire_out(wire_72_73)
    );
    wire_calc calc_73_74(.tile1(board_in[7][3]),
                         .tile2(board_in[7][4]),
                         .neighbor1(wire_63_73mem),
                         .neighbor2(wire_64_74mem),
                         .neighbor3(wire_72_73mem),
                         .neighbor4(wire_74_75mem),
                         .neighbor5(wire_73_83mem),
                         .neighbor6(wire_74_84mem),
                         .wire_out(wire_73_74)
    );
    wire_calc calc_74_75(.tile1(board_in[7][4]),
                         .tile2(board_in[7][5]),
                         .neighbor1(wire_64_74mem),
                         .neighbor2(wire_65_75mem),
                         .neighbor3(wire_73_74mem),
                         .neighbor4(wire_75_76mem),
                         .neighbor5(wire_74_84mem),
                         .neighbor6(wire_75_85mem),
                         .wire_out(wire_74_75)
    );
    wire_calc calc_75_76(.tile1(board_in[7][5]),
                         .tile2(board_in[7][6]),
                         .neighbor1(wire_65_75mem),
                         .neighbor2(wire_66_76mem),
                         .neighbor3(wire_74_75mem),
                         .neighbor4(wire_76_77mem),
                         .neighbor5(wire_75_85mem),
                         .neighbor6(wire_76_86mem),
                         .wire_out(wire_75_76)
    );
    wire_calc calc_76_77(.tile1(board_in[7][6]),
                         .tile2(board_in[7][7]),
                         .neighbor1(wire_66_76mem),
                         .neighbor2(wire_67_77mem),
                         .neighbor3(wire_75_76mem),
                         .neighbor4(wire_77_78mem),
                         .neighbor5(wire_76_86mem),
                         .neighbor6(wire_77_87mem),
                         .wire_out(wire_76_77)
    );
    wire_calc calc_77_78(.tile1(board_in[7][7]),
                         .tile2(board_in[7][8]),
                         .neighbor1(wire_67_77mem),
                         .neighbor2(wire_68_78mem),
                         .neighbor3(wire_76_77mem),
                         .neighbor4(cold),
                         .neighbor5(wire_77_87mem),
                         .neighbor6(wire_78_88mem),
                         .wire_out(wire_77_78)
    );
    wire_calc calc_80_81(.tile1(board_in[8][0]),
                         .tile2(board_in[8][1]),
                         .neighbor1(wire_70_80mem),
                         .neighbor2(wire_71_81mem),
                         .neighbor3(cold),
                         .neighbor4(wire_81_82mem),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_80_81)
    );
    wire_calc calc_81_82(.tile1(board_in[8][1]),
                         .tile2(board_in[8][2]),
                         .neighbor1(wire_71_81mem),
                         .neighbor2(wire_72_82mem),
                         .neighbor3(wire_80_81mem),
                         .neighbor4(wire_82_83mem),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_81_82)
    );
    wire_calc calc_82_83(.tile1(board_in[8][2]),
                         .tile2(board_in[8][3]),
                         .neighbor1(wire_72_82mem),
                         .neighbor2(wire_73_83mem),
                         .neighbor3(wire_81_82mem),
                         .neighbor4(wire_83_84mem),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_82_83)
    );
    wire_calc calc_83_84(.tile1(board_in[8][3]),
                         .tile2(board_in[8][4]),
                         .neighbor1(wire_73_83mem),
                         .neighbor2(wire_74_84mem),
                         .neighbor3(wire_82_83mem),
                         .neighbor4(wire_84_85mem),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_83_84)
    );
    wire_calc calc_84_85(.tile1(board_in[8][4]),
                         .tile2(board_in[8][5]),
                         .neighbor1(wire_74_84mem),
                         .neighbor2(wire_75_85mem),
                         .neighbor3(wire_83_84mem),
                         .neighbor4(wire_85_86mem),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_84_85)
    );
    wire_calc calc_85_86(.tile1(board_in[8][5]),
                         .tile2(board_in[8][6]),
                         .neighbor1(wire_75_85mem),
                         .neighbor2(wire_76_86mem),
                         .neighbor3(wire_84_85mem),
                         .neighbor4(wire_86_87mem),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_85_86)
    );
    wire_calc calc_86_87(.tile1(board_in[8][6]),
                         .tile2(board_in[8][7]),
                         .neighbor1(wire_76_86mem),
                         .neighbor2(wire_77_87mem),
                         .neighbor3(wire_85_86mem),
                         .neighbor4(wire_87_88mem),
                         .neighbor5(cold),
                         .neighbor6(cold),
                         .wire_out(wire_86_87)
    );
    wire_calc calc_87_88(.tile1(board_in[8][7]),
                         .tile2(board_in[8][8]),
                         .neighbor1(wire_77_87mem),
                         .neighbor2(wire_78_88mem),
                         .neighbor3(wire_86_87mem),
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
