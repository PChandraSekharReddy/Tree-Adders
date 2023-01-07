`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 10:05:56
// Design Name: 
// Module Name: brent_kung_tb
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


module brent_kung_tb #(parameter ADDER_SIZE=16, GROUP_SIZE=4,lev=3);
	reg [ADDER_SIZE-1:1] A, B;
	reg CIN;
	wire [ADDER_SIZE-1:1] SUM;
	wire COUT;
	
	brent_kung #(ADDER_SIZE, GROUP_SIZE,lev) INST1(
	.sum(SUM),
	.cout(COUT),
	.A(A),
	.B(B),
	.cin(CIN));

	initial 
		begin
		#150 $finish;
		end

	initial
		begin
		A=31'b000000000000000; B=31'b000000000000000; CIN=1'b0;
		#20 A=31'b000000111100000; B=31'b000000000001111; CIN=1'b0;
		#40 A=31'b000000111100000; B=31'b000000000001111; CIN=1'b1;
		#60 A=31'b111100011110000; B=31'b111100000001111; CIN=1'b1;
		end
        
endmodule