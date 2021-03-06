//==================================================================================================
//  Filename      : testbench.v
//  Created On    : 2018-03-05 15:05:36
//  Last Modified : 2018-03-08 02:01:09
//  Revision      : 
//
//  Description   : 
//
//
//==================================================================================================
module testbench();
	reg clk,rst;
	reg [2:0]pro_reset;
	reg [11:0]in_addr;
	reg changef;
	wire [2:0]leds;
	wire[7:0]SEG;
	wire [7:0]AN;

	initial begin
		clk = 0;
		rst = 0;
		pro_reset = 0;
		in_addr = 0;
		changef = 1;

		$monitor("At time %t, ocnt = %d", $time, clk);
		$dumpfile("counter_test.vcd");
		$dumpvars(0, m_I9);

		#43000 pro_reset[0] = 1;
		#1000 pro_reset[0] = 0;
		#10000 pro_reset[1] = 1;
		#1000 pro_reset[1] = 0;
	end

	always #5 clk = ~clk;


	I9_7980XE m_I9(clk,rst,pro_reset,in_addr,changef,leds,SEG,AN);
endmodule