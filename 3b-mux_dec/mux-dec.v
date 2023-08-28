/* 
Combines a 3-bit multiplexer and a 3x8 decoder with enable 
*/

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

module dec_3x8(not_y,y,in,en);
    input [2:0] in;
    input en;  
    output reg [7:0]y;
    output reg [7:0]not_y; 

    always @(in,en)
        begin
            if (en==0)
            begin
                if(in[2]==1'b0 & in[1]==1'b0 & in[0]==1'b0)
                    y=8'b11111110;
                else if(in[2]==1'b0 & in[1]==1'b0 & in[0]==1'b1)
                    y=8'b11111101;      
                else if(in[2]==1'b0 & in[1]==1'b1 & in[0]==1'b0)
                    y=8'b11111011;
                else if(in[2]==1'b0 & in[1]==1'b1 & in[0]==1'b1)
                    y=8'b11110111; 
                else if(in[2]==1'b1 & in[1]==1'b0 & in[0]==1'b0)
                    y=8'b11101111;
                else if(in[2]==1'b1 & in[1]==1'b0 & in[0]==1'b1)
                    y=8'b11011111;      
                else if(in[2]==1'b1 & in[1]==1'b1 & in[0]==1'b0)
                    y=8'b10111111;
                else if(in[2]==1'b1 & in[1]==1'b1 & in[0]==1'b1)
                    y=8'b01111111;      
                else 
                    y=8'bxxxxxxxx;   
            end
            else 
                y=8'b11111111;
            not_y = ~y;
        end
endmodule