`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2022 10:30:52
// Design Name: 
// Module Name: KGS
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module KGS #(parameter size = 32, ll=5)(output cout,output [size-1:1]sum,input [size-1:1]A, input [size-1:1]B, input cin );

wire genb[ll:0][size-1:0];
wire propb[ll:0][size-1:1];
wire [size-1:0]gen;




genvar i,j,k,l;
generate 

for(i=1;i<size;i=i+1)
begin
and m1(genb[0][i],A[i],B[i]);
xor m2(propb[0][i],A[i],B[i]);
end
assign gen[0]=cin;
assign genb[0][0]=cin;

for(i=0;i<ll;i=i+1)
    begin
    
             
        for(j=0;j<(2**i);j=j+1) 
        begin
            GC #(2) m3(gen[j+(2**i)],{genb[i][j+(2**i)],gen[j]},propb[i][j+(2**i)]);
            
        end
         
        for(k=2**(i+1);k<size;k=k+1) 
        begin
            BC #(2) m4(genb[i+1][k],propb[i+1][k],{genb[i][k],genb[i][k-(2**i)]},{propb[i][k],propb[i][k-(2**i)]});
        end 

    end
for(i=0;i<size-1;i=i+1)
begin
xor m5(sum[i+1],gen[i],propb[0][i+1]);
end
endgenerate 
assign cout=gen[size-1];
endmodule
