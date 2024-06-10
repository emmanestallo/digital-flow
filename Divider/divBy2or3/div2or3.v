`include "../buildingBlocks/d_flipflop.v"
`include "../buildingBlocks/and_gate.v"
`include "../buildingBlocks/or_gate.v" 

module divBy2or3(clk_in, mod, Qb); 
input clk_in; 
input mod; 
output Qb; 

wire and1_out;
wire and2_out;
wire dff1_out,dff1_outb; 
wire dff2_out;

andGate and1(dff2_out,mod,and1_out);
dFlipFlop dff1(clk_in,and1_out,dff1_out,dff1_outb);
andGate and2(Qb,dff1_outb,and2_out); 
dFlipFlop dff2(clk_in,and2_out,dff2_out,Qb);
endmodule