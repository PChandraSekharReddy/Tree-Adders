`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2022 17:55:37
// Design Name: 
// Module Name: slansky_tb
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


module slansky_tb #(parameter ADDER_SIZE=32, GROUP_SIZE=5);
	reg [ADDER_SIZE-1:1] A, B;
	reg CIN;
	wire [ADDER_SIZE-1:1] SUM;
	wire COUT;
	
	SLANSKY #(ADDER_SIZE, GROUP_SIZE) INST1(
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
