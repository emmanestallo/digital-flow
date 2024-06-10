`include "../buildingBlocks/d_flipflopwr.v"
`include "../buildingBlocks/and_gate.v"

module phaseFreqDet(ref_clk, vco_clk, high1, high2, out_p, out_n);
    input ref_clk;
    input vco_clk;
    input high1; 
    input high2;
    output out_p;
    output out_n; 

    wire and_out; 
    wire dff1_out, dff1_outb;
    wire dff2_out, dff2_outb; 

    // dFlipFlopWR (clock, reset, D, Q, Qb)
    dFlipFlopWR dffwr1(ref_clk, and_out, high1, dff1_out, dff1_outb);
    dFlipFlopWR dffwr2(vco_clk, and_out, high2, dff2_out, dff2_outb);
    andGate and1(dff1_out, dff2_out, and_out); 

    // Assigning outputs
    assign out_p = dff1_out;
    assign out_n = dff2_out;

endmodule