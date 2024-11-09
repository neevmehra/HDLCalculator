`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2024 01:28:05 PM
// Design Name: 
// Module Name: registerlogic
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


module registerlogic(
    
    input clk,
    input enable,
    input [4:0] Data,
    output reg [4:0] Q
    
    );
    
    always @ (posedge clk) begin
        if(enable) begin
            Q = Data;
            end
            end
endmodule
