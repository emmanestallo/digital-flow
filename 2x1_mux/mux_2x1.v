module mux_2x1(y, a, b, sel);
    input [2:0] a,b; 
    input sel; 
    output reg [2:0] y;

    always @(a,b,sel)
        begin
            if (sel == 1'b0)
                y=a;
            else if (sel==1'b1)
                y=b;
            else
                y=3'bxxx;
        end
endmodule