module mux_gate(A,B,X,out1);

input A,B,X; 
output reg out1; 

always@(*)
begin
    if(x==0)
    out1 = A;
    else
    out1 = B;
end