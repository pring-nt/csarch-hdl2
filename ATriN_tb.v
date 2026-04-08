// NAME: TRINIDAD, NATHAN P. SECTION: S04
`timescale 1ns/1ps

module FF_Circuit_tb();

	reg t_Y, t_clk, t_rst;
	wire t_A, t_B, t_C, t_D;

	FF_Circuit dut(t_A, t_B, t_C, t_D, t_Y, t_clk, t_rst);

	//initialize clock
	initial
		begin
			t_clk = 1'b0;
			forever #5 t_clk = ~t_clk;
		end

	//initialize reset
	initial
		begin
			t_rst = 1'b0;
			#10 t_rst = 1'b1;
		end

	//initialize Y
	initial
		begin
			t_Y = 1'b0;
			#100
			t_Y = 1'b1;
		end

	//initialize print statements
	initial
		begin
			$monitor("time = %d | clk = %b | rst = %b | Y = %b | A = %b | B = %b | C = %b | D = %b",
			 $time, t_clk, t_rst, t_Y, t_A, t_B, t_C, t_D);
		end

	//initialize za warudo
	initial #200 $finish;
endmodule