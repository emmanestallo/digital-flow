module mux_2x1(y, a, b, sel);
    input [3:0] a,b; 
    input sel; 
    output reg [3:0] y;

    always @(a,b,sel)
        begin
            if (sel == 1'b0)
                y=a;
            else if (sel==1'b1)
                y=b;
            else
                y=4'bxxxx;
        end
endmodule