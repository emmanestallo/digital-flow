`include "divBy3or4.v"
`timescale 1ns/1ps 

module tb_div3or4();
reg clk_in; 
reg mod; 
wire clk_out; 

divBy3or4 uut(clk_in,mod,clk_out); 

initial begin
    clk_in = 0; 
    forever #0.5 clk_in = ~clk_in;        
end

initial begin
    mod = 1; 
    #15 mod = 0; 
    #15 mod = 1; 
end

initial begin
    $dumpfile("divBy3or4.vcd");
    $dumpvars(0, tb_div3or4);
end

initial begin
    force uut.dff1.out = 1'b0;
    force uut.dff1.not_out = 1'b1;
    force uut.dff2.out = 1'b1;
    force uut.dff2.not_out = 1'b0;
    #1 
    release uut.dff1.out;
    release uut.dff1.not_out;
    release uut.dff2.out;
    release uut.dff2.not_out;
end

initial #50 $finish; 

endmodule


