module test_dec_3x8;
    reg a,b,c,en; 
    wire [7:0]y; 
    wire [7:0]not_y;

    dec_3x8 dut(not_y,y,a,b,c,en);

    initial begin 
        $dumpfile("test.vcd");
        $dumpvars(0,test_dec_3x8); 

        en=1'b1; a=1'bx; b=1'bx; c=1'bx; #5 
        en=1'b0; a=1'b0; b=1'b0; c=1'b0; #5 
        en=1'b0; a=1'b0; b=1'b0; c=1'b1; #5   
        en=1'b0; a=1'b0; b=1'b1; c=1'b0; #5    
        en=1'b0; a=1'b0; b=1'b1; c=1'b1; #5
        en=1'b0; a=1'b1; b=1'b0; c=1'b0; #5 
        en=1'b0; a=1'b1; b=1'b0; c=1'b1; #5   
        en=1'b0; a=1'b1; b=1'b1; c=1'b0; #5    
        en=1'b0; a=1'b1; b=1'b1; c=1'b1;     
    end

    initial #45 $finish; 
endmodule