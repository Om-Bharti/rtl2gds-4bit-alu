`timescale 1ns / 1ps

module alu_4bit_seq (
    input clk,
    input rst,
    input [3:0] A, B,
    input [1:0] opcode,
    output reg [3:0] result,
    output reg carry
);

// Input registers
reg [3:0] A_reg, B_reg;
reg [1:0] opcode_reg;

// Internal ALU signals
reg [3:0] alu_out;
reg alu_carry;

// Stage 1: Input registers
always @(posedge clk or posedge rst) begin
    if (rst) begin
        A_reg <= 4'b0000;
        B_reg <= 4'b0000;
        opcode_reg <= 2'b00;
    end else begin
        A_reg <= A;
        B_reg <= B;
        opcode_reg <= opcode;
    end
end

// Stage 2: Combinational ALU
always @(*) begin
    case(opcode_reg)
        2'b00: {alu_carry, alu_out} = A_reg + B_reg;  // ADD
        2'b01: begin alu_out = A_reg & B_reg; alu_carry = 0; end // AND
        2'b10: begin alu_out = A_reg | B_reg; alu_carry = 0; end // OR
        2'b11: begin alu_out = A_reg ^ B_reg; alu_carry = 0; end // XOR
    endcase
end

// Stage 3: Output registers
always @(posedge clk or posedge rst) begin
    if (rst) begin
        result <= 4'b0000;
        carry <= 1'b0;
    end else begin
        result <= alu_out;
        carry <= alu_carry;
    end
end

endmodule
