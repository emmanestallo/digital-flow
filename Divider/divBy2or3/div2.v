`include "posDFF.v"
`timescale 1ns/1ps

module divby2();

reg D;
wire Q; 
wire Qb;
reg clk; 

posDFF pDFF(clk, D, Q, Qb);

initial begin 
    clk = 0; 
    forever #0.5 clk = ~clk; 
end

initial begin
    D = 1; 
    #2; 
    forever begin
        #1; 
        D <= Qb; 
    end
end

initial begin
    $dumpfile("div2.vcd");
    $dumpvars(0, divby2); 
end

initial #10 $finish; 

endmodule
