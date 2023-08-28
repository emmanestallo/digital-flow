module test_mux_2x1;
    wire [2:0] mux_out; 
    reg [2:0] in1,in2;
    reg select; 

    mux_2x1 dut(mux_out,in1,in2,select); 

    initial begin
        $dumpfile("2x1mux.vcd");
        $dumpvars(0,test_mux_2x1); 

        in1=4'b000; 
        in2=4'b111; 
        select=1'b0;
        #10
        select=1'b1;        
    end

    initial #30 $finish; 
endmodule