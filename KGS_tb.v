`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2022 18:01:08
// Design Name: 
// Module Name: KGS_tb
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


module KGS_tb #(parameter size=32, LL=5);
	reg [size-1:1] A, B;
	reg CIN;
	wire [size-1:1] SUM;
	wire COUT;
	
	KGS #(size, LL) DUT(.sum(SUM),.cout(COUT),.A(A),.B(B),.cin(CIN));

	initial 
		begin
		#200 $finish;
		end

	initial
		begin
		A=31'b000000000000000; B=31'b000000000000000; CIN=1'b0;
		#20 A=31'b000000111100000; B=31'b000000000001111; CIN=1'b0;
		#40 A=31'b000000111100000; B=31'b000000000001111; CIN=1'b1;
		#60 A=31'b111100011110000; B=31'b111100000001111; CIN=1'b1;
		end
        
endmodule
