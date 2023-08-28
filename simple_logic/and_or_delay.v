`timescale 1ns/1ps
module and_or_delay(A,B,C,D,E);
    input A,B,C; 
    output D,E; 

wire w1; 

and #(30) G1 (w1,A,B); // tp=30ns 
not #(10) G2 (E,C); // tp=10ns
or #(20) G3 (D,w1,E); // tp=20ns 
endmodule

