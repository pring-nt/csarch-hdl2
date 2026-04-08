// NAME: TRINIDAD, NATHAN P. SECTION: S04
`timescale 1ns/1ps

module FF_JK(Q, J, K, clk, rst);
	output reg Q;
	input J, K;
	input clk, rst;

  	always @(posedge clk, negedge rst)
  	if(rst == 0 ) Q <= 0;
  	else
		begin
			case ({J, K})
				2'b00: Q <= Q;    // No change
				2'b01: Q <= 1'b0; // Set 0
				2'b10: Q <= 1'b1; // Set 1
				2'b11: Q <= ~Q;   // Toggle
			endcase	
		end
endmodule

module FF_Circuit(A, B, C, D, Y, clk, rst);
    input Y, clk, rst;
    output A, B, C, D; // D doesn't change at all
    assign D = 0;
    wire JKA, JKB, JKC;

    assign JKA = ((~B)&(~C)&(~Y)) | (B&C&Y); // JA and KB are equal so I just combined them, same with JKB and JKC
    assign JKB = ((~C)&(~Y)) | (C&Y);
    assign JKC = 1'b1;

    FF_JK JK1(A, JKA, JKA, clk, rst);
    FF_JK JK2(B, JKB, JKB, clk, rst);
    FF_JK JK3(C, JKC, JKC, clk, rst);
endmodule