module dFlipFlopWR(clk, rst, in, out, not_out);
    input clk;
    input in; 
    input rst; 
    output reg out; 
    output reg not_out;

    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            out <= 1'b0; 
            not_out <= 1'b1;
        end else begin
            out <= in; 
            not_out <= ~in; 
        end
    end
endmodule 


