`timescale 1ns/1ns

`define CLOCK_MAX 20000000
`define CLOCK_SPEED 300000 // 300 KHz
`define CLOCK_COUNT (`CLOCK_MAX / `CLOCK_SPEED) / 2
module tm1638(
	output clock_out,
	output reg clock_out_div,
	output strobe,
	output data_io,
	input reset,		// active low
	input clock_in
);
	reg command;
	wire [24:0] count;
	reg command_reset;
	reg [2:0] state;
	wire strobe_int;
	cnt_clock_div CNT_CLOCK_DIV(reset, clock_in, count);
	wire master_reset;
	wire state_int;
	reg [7:0] data_in;

	// assign block
	assign clock_out = clock_in;
	assign master_reset = reset | command_reset;
	assign strobe_int = strobe & command_reset;	
	
	// module definitions
	TM1638_shifter CMD(master_reset,clock,data_in,data_io,strobe);

	// Clock definition
	always @(posedge clock_in) begin
		if (count == `CLOCK_COUNT ) begin
			clock_out_div <= ~clock_out_div; 
		end
	end	
	
	// state machine
	always @(posedge strobe_int) begin
		if(!reset) state <= 0;
		case(state)
			// display mode: 7 Grids, 11 Segments
			0: begin data_in <= 8'b00000011; command_reset <= 1; $display("state0");end
			// display control: turn on display, pulse width 14/16 
			1: begin data_in <= 8'b10001100; command_reset <= 1; $display("state1");end
			// Data write fixed
			2: begin data_in <= 8'b01000100; command_reset <= 1; $display("state2");end
			3: begin state <= 3; $display("state3"); end
			default: begin state <= 3;$display("default -> state3"); end
		endcase
		state <= (state + 1) % 3;
	end

endmodule

