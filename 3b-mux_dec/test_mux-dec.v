module test_mux_dec; 
    wire [2:0] mux_out; 
    wire [7:0] not_dec_out,dec_out; 
    reg [2:0] in1,in2;
    reg select; 
    reg en; 

    mux_2x1 mux(mux_out,in1,in2,select); 
    dec_3x8 dec(not_dec_out,dec_out,mux_out,en);

    initial begin
        $dumpfile("mux_dec.vcd");
        $dumpvars(0,test_mux_dec); 

        en=1'b1;
        in1=4'b000; 
        in2=4'b111; 
        select=1'b0;
        #5 en=1'b0;  
        #5 select=1'b1;
        en=1'b1; 
        #5 en=1'b0;
    end

    initial #20 $finish;     
endmodule