`include "phaseFrequencyDetector.v"
`timescale 1ns/1ps

//pfd (ref_clk, vco_clk, D1, D2, Q1, Q2)
module tb_pfd(); 
reg ref_clk; 
reg vco_clk; 
reg D1, D2; 
wire Q1, Q2; 

phaseFreqDet uut(ref_clk, vco_clk, D1, D2, Q1, Q2); 

initial begin 
    D1 = 1; 
    D2 = 1;
end

initial begin
    ref_clk = 0; 
    forever #0.5 ref_clk = ~ref_clk;
end

initial begin
    #0.1
    vco_clk = 0; 
    forever #0.5 vco_clk = ~vco_clk; 
end 

initial begin 
    $dumpfile("pfd.vcd");
    $dumpvars(0, tb_pfd);
end

initial begin
    force uut.dffwr1.out = 1'b0;
    force uut.dffwr1.not_out = 1'b1;
    force uut.dffwr2.out = 1'b1;
    force uut.dffwr2.not_out = 1'b0;
    #1
    release uut.dffwr1.out;
    release uut.dffwr1.not_out;
    release uut.dffwr2.out;
    release uut.dffwr2.not_out;
end


initial #50 $finish; 





endmodule