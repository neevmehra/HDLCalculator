`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2024 04:20:51 PM
// Design Name: 
// Module Name: CLA_tb
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


module CLA_tb;

reg clk;
reg [3:0] A, B;
reg enable;
reg Cin;
wire [4:0] Q;

CLA_4bits ul (
.clk(clk),
.enable(enable),
.Cin(Cin),
.Q(Q),
.A(A),
.B(B)

);

initial begin

clk = 0;

enable = 0;
A = 4'b0000;
B = 4'b0101;
Cin = 0;
enable = 1;

#10

enable = 0;
A = 4'b0101;
B = 4'b0111;
Cin = 0;
enable = 1;

#10

enable = 0;
A = 4'b1000;
B = 4'b0111;
Cin = 1;
enable = 1;

#10

enable = 0;
A = 4'b1001;
B = 4'b0100;
Cin = 0;
enable = 1;

#10

enable = 0;
A = 4'b1000;
B = 4'b1000;
Cin = 1;
enable = 1;

#10

enable = 0;
A = 4'b1101;
B = 4'b1010;
Cin = 1;
enable = 1;

#10

enable = 0;
A = 4'b1110;
B = 4'b1111;
Cin = 0;
enable = 1;

end

always
#5 clk = ~clk;

endmodule
