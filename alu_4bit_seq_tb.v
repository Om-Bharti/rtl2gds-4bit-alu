`timescale 1ns/1ps

module alu_4bit_seq_tb;

reg clk, rst;
reg [3:0] A, B;
reg [1:0] opcode;

wire [3:0] result;
wire carry;

alu_4bit_seq dut (
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry)
);

// Clock generation
always #5 clk = ~clk;

initial begin
         $fsdbDumpfile("alu_4bit_seq.fsdb");
	 $fsdbDumpvars();
    clk = 0;
    rst = 1;
    A = 0;
    B = 0;
    opcode = 0;

    #10 rst = 0;

    // ADD
    A = 2; B = 3; opcode = 2'b00;
    #20;

    // AND
    A = 2; B = 3; opcode = 2'b01;
    #20;

    // OR
    A = 2; B = 3; opcode = 2'b10;
    #20;

    // XOR
    A = 2; B = 3; opcode = 2'b11;
    #20;

    $finish;
end

endmodule
