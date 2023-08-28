`timescale 1ns/1ps
module test_and_or_delay;
    wire D,E;
    reg A,B,C;

    and_or_delay M_UUT(A,B,C,D,E); 

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test_and_or_delay);

        A=1'b0; B=1'b0; C=1'b0;
        #100; A=1'b1; B=1'b1; C=1'b1; 
    end

    initial #200 $finish; 
endmodule