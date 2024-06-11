module dFlipFlop(clk,in,out,not_out);
input clk;
input in; 
output reg out; 
output reg not_out;

always @(posedge clk) begin
    out <= in; 
    not_out <= ~in; 
end
endmodule 

