module test_dec_3x8;
    reg [2:0] in; 
    reg en; 
    wire [7:0]y; 
    wire [7:0]not_y;

    dec_3x8 dut(not_y,y,in,en);

    initial begin 
        $dumpfile("test.vcd");
        $dumpvars(0,test_dec_3x8); 

        en=1'b1; in[2]=1'bx; in[1]=1'bx; in[0]=1'bx; #5 
        en=1'b0; in[2]=1'b0; in[1]=1'b0; in[0]=1'b0; #5 
        en=1'b0; in[2]=1'b0; in[1]=1'b0; in[0]=1'b1; #5   
        en=1'b0; in[2]=1'b0; in[1]=1'b1; in[0]=1'b0; #5    
        en=1'b0; in[2]=1'b0; in[1]=1'b1; in[0]=1'b1; #5
        en=1'b0; in[2]=1'b1; in[1]=1'b0; in[0]=1'b0; #5 
        en=1'b0; in[2]=1'b1; in[1]=1'b0; in[0]=1'b1; #5   
        en=1'b0; in[2]=1'b1; in[1]=1'b1; in[0]=1'b0; #5    
        en=1'b0; in[2]=1'b1; in[1]=1'b1; in[0]=1'b1;     
    end

    initial #45 $finish; 
endmodule