`timescale 1ns / 1ps
module uar_sampler_tb;
    logic clk;
    logic rst;
    logic sig;
    logic sig_samp;

    uar_sampler sampler(    .clk_in(clk),
                            .rst_in(rst),
                            .sig_in(sig),
                            .sig_out(sig_samp));
    always begin
        #5;
        clk = !clk;
     end

     initial begin
        clk = 0;
        rst = 0;
        sig = 1;
        #10000;
        rst = 1;
        #10;
        rst = 0;
        
        #10;
        sig = 0;
        #104167;
        sig = 1;
        #104167;
        sig = 0;
        #104167;
        sig = 1;
        #104167;
        sig = 0;
        #104167;
        sig = 0;
        #104167;
        sig = 0;
        #104167;
        sig = 1;
        #104167;
        sig = 1;
        #104167;
        sig = 1;
        #104167;
        sig = 0;
        #104167;
        sig = 1;
        #1000000;
     end
endmodule
