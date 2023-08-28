module dec_3x8(not_y,y,a,b,c,en);
    input a,b,c,en; 
    output reg [7:0]y;
    output reg [7:0]not_y; 

    always @(a,b,c,en)
        begin
            if (en==0)
            begin
                if(a==1'b0 & b==1'b0 & c==1'b0)
                    y=8'b11111110;
                else if(a==1'b0 & b==1'b0 & c==1'b1)
                    y=8'b11111101;      
                else if(a==1'b0 & b==1'b1 & c==1'b0)
                    y=8'b11111011;
                else if(a==1'b0 & b==1'b1 & c==1'b1)
                    y=8'b11110111; 
                else if(a==1'b1 & b==1'b0 & c==1'b0)
                    y=8'b11101111;
                else if(a==1'b1 & b==1'b0 & c==1'b1)
                    y=8'b11011111;      
                else if(a==1'b1 & b==1'b1 & c==1'b0)
                    y=8'b10111111;
                else if(a==1'b1 & b==1'b1 & c==1'b1)
                    y=8'b01111111;      
                else 
                    y=8'bxxxxxxxx;   
                not_y = ~y;
            end
            else 
                y=8'b11111111;
        end
endmodule