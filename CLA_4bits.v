`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2024 04:00:39 PM
// Design Name: 
// Module Name: CLA_4bits
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

module CLA_4bits(

    input clk,
    input enable,
    input [3:0] A,B,
    input Cin,
    output [4:0] Q
    );
    
    wire [3:0] G, P;
    wire [4:0] C, S;
    wire [3:0] Sum;
    wire Cout;
    assign C[0] = Cin;
    
    assign P[0] = A[0] ^ B[0];
    assign P[1] = A[1] ^ B[1];
    assign P[2] = A[2] ^ B[2];
    assign P[3] = A[3] ^ B[3];
    
    assign G[0] = A[0] & B[0];
    assign G[1] = A[1] & B[1];
    assign G[2] = A[2] & B[2];
    assign G[3] = A[3] & B[3];
    
    assign C[0] = Cin;
//    assign C[1] = G[0] | P[0]&C[0]; This wouldn't work because then it would function as a ripple adder, we want to calculate carries in advance
//    assign C[2] = G[1] | P[1]&C[1];
//    assign C[3] = G[2] | P[2]&C[2];
//    assign C[4] = G[3] | P[3]&C[3];
    assign C[1] = G[0] | P[0]&Cin;
    assign C[2] = G[1] | P[1]&(G[0] | P[0]&Cin);
    assign C[3] = G[2] | P[2]&(G[1] | P[1]&(G[0] | P[0]&Cin));
    assign C[4] = G[3] | P[3]&(G[2] | P[2]&(G[1] | P[1]&(G[0] | P[0]&Cin)));
       
    //assign Cout = C[4];
    
    assign S[0] = P[0] ^ C[0];
    assign S[1] = P[1] ^ C[1];
    assign S[2] = P[2] ^ C[2];
    assign S[3] = P[3] ^ C[3];
    assign S[4] = C[4];
    
    register_logic register(.clk(clk), .enable(enable), .Data(S), .Q(Q));
    
endmodule
