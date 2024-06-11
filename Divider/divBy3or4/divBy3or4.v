`include "../buildingBlocks/dFlipFlop.v"
`include "../buildingBlocks/andGate.v"
`include "../buildingBlocks/orGate.v" 

module divBy3or4(clk_in,mod,clk_out);
input clk_in;
input mod; 
output clk_out; 

wire or_out;
wire and_out; 
wire dff1_out, dff1_outb; 
wire dff2_out; 

//dff (clk, D, Q, Qb)
//and (in1, in2, out)
//or (in1, in2, out)
dFlipFlop dff1(clk_in,clk_out,dff1_out,dff1_outb);
orGate or1(clk_out,mod,or_out); 
andGate and1(or_out,dff1_out,and_out); 
dFlipFlop dff2(clk_in,and_out,dff2_out,clk_out);
endmodule


