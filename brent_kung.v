`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 21:52:12
// Design Name: 
// Module Name: brent_kung
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


module brent_kung #(parameter size = 32, ll=5,lev=4)(output cout,output [size-1:1]sum,input [size-1:1]A, input [size-1:1]B, input cin );

wire genb[ll:0][size-1:0];
wire propb[ll:0][size-1:0];
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
assign propb[0][0]=0;

for(i=0;i<ll;i=i+1)
    begin
    
        for(k=2**(i+1);k<size;k=k+1) 
        begin
            if(k%2**(i+1)<(2**(i+1)-1))
            begin
                assign genb[i+1][k]=genb[i][k];
                assign propb[i+1][k]=propb[i][k];
            end
            else begin 
            BC #(2) m4(genb[i+1][k],propb[i+1][k],{genb[i][k],genb[i][k-2**i]},{propb[i][k],propb[i][k-2**i]});
            end
        end     

            GC #(2) m3(genb[i+1][2**(i+1)-1],{genb[i][2**(i+1)-1],genb[i][(2**(i+1)-1)-2**i]},propb[i][2**(i+1)-1]);
            assign propb[i+1][2**(i+1)-1]=propb[i][2**(i+1)-1];
            assign gen[2**(i+1)-1]=genb[i+1][2**(i+1)-1];
         for(j=0;j<2**(i+1)-1;j=j+1)
         begin
            assign genb[i+1][j]=genb[i][j];
            assign propb[i+1][j]=propb[i][j];
         end                    
    end
for(i=0;i<lev;i=i+1)
begin
    for(j=(2**(i+1))-1;j<size-2;j=j+2**(i+1))
    begin
        GC #(2) m5(gen[j+2**i],{genb[ll][j+2**i],gen[j]},propb[ll][j+2**i]);
    end
end    
for(i=0;i<size-1;i=i+1)
begin
    xor m6(sum[i+1],gen[i],propb[0][i+1]);
end

endgenerate 
assign cout=gen[size-1];
endmodule
