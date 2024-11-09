`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2024 01:32:02 PM
// Design Name: 
// Module Name: RCA_4bits
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


module RCA_4bits(

    input clk,
    input enable,
    input [3:0] A,B,
    input Cin,
    output [4:0] sum
    );
    
    wire adder0, adder1, adder2, adder3;
    wire [4:0] Q;
    
    full_adder add0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(Q[0]), .Cout(adder0));
    full_adder add1(.A(A[1]), .B(B[1]), .Cin(adder0), .S(Q[1]), .Cout(adder1));
    full_adder add2(.A(A[2]), .B(B[2]), .Cin(adder1), .S(Q[2]), .Cout(adder2));
    full_adder add3(.A(A[3]), .B(B[3]), .Cin(adder2), .S(Q[3]), .Cout(adder3));
    
    registerlogic register(.clk(clk), .enable(enable), .Data(Q), .Q(sum));
    
endmodule
