`timescale 1ns/1ns
`include "full_adder_rtl.v" // includes the module definition for the full adder
module testbench;
	reg [3:0] A, B;
	reg Clock, C_in;
	wire [3:0] SUM;
	wire C_out;

// Instantiate the module under test
full_adder dut  (.A(A), .B(B), .Clock(Clock), .C_in(C_in), .SUM(SUM), .C_out(C_out));

// Clock generation
always #5 Clock = ~Clock; // Clock signal with a period of 10 ns

// Stimulus
initial begin
         $fsdbDumpfile("full_adder.fsdb");
	 $fsdbDumpvars();

//Tool specific command. Creates novas.fsdb file. Used for waveform generation
//// Reset inputs
//
	A <= 0; B <= 0; C_in <= 0; Clock <= 0;
// Apply test cases
	#20 A <= 4'b0001; B <= 4'b0001; C_in <= 0; // 1 + 1 = 2 (binary: 10)
	$display("A = %b, B = %b, C_in = %b, SUM = %b, C_out = %b", A, B, C_in, SUM, C_out);

	#20 A <= 4'b0110; B <= 4'b1010; C_in <= 1; // 6 + 10 + 1 = 17 (binary: 10001)
	$display("A = %b, B = %b, C_in = %b, SUM = %b, C_out = %b", A, B, C_in, SUM, C_out);

	#20 A <= 4'b1000; B <= 4'b1111; C_in <= 1; // 8 + 15 + 1 = 24 (binary: 11000)
	$display("A = %b, B = %b, C_in = %b, SUM = %b, C_out = %b", A, B, C_in, SUM, C_out);

	#100 $finish;

	end
endmodule
