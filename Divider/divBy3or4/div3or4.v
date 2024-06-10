`include "../buildingBlocks/d_flipflop.v"
`include "../buildingBlocks/and_gate.v"
`include "../buildingBlocks/or_gate.v" 

module divBy3or4(clk_in,mod,clk_out);
input clk_in;
input mod; 
output clk_out; 

wire or_out;
wire and_out; 
wire dff1_out, dff1_outb; 
wire dff2_out; 

dFlipFlop dff1(clk_in,clk_out,dff1_out,dff1_outb);
orGate or1(clk_out,mod,or_out); 
andGate and1(or_out,dff1_out,and_out); 
dFlipFlop dff2(clk_in,and_out,dff2_out,clk_out);
endmodule


