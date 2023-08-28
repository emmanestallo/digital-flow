module test_dec_2x4;
    reg a,b,en; 
    wire [3:0]y; 

    dec_2x4 dut(y,a,b,en); 

    initial begin 
        $dumpfile("test.vcd");
        $dumpvars(0,test_dec_2x4); 

        en=1; a=1'bx; b=1'bx; #5 
        en=0; a=1'b0; b=1'b0; #5 
        en=0; a=1'b0; b=1'b1; #5 
        en=0; a=1'b1; b=1'b0; #5 
        en=0; a=1'b1; b=1'b1; 
    end

    initial #25 $finish;
endmodule