`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 22:21:16
// Design Name: 
// Module Name: GC
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


module GC #(parameter Cell_Width=4)(output group_generate, input [Cell_Width-1:0]g,input [Cell_Width-1:1]p);
wire [Cell_Width-1:0]genAnd;
wire [Cell_Width-1:0]genOr;

assign genOr[0]=g[0];
genvar i;
generate
    for(i=0;i<Cell_Width-1;i=i+1)
        begin
            and m1(genAnd[i],genOr[i],p[i+1]);
            or m2(genOr[i+1],genAnd[i],g[i+1]);
        end
endgenerate

assign group_generate=genOr[Cell_Width-1];


endmodule
