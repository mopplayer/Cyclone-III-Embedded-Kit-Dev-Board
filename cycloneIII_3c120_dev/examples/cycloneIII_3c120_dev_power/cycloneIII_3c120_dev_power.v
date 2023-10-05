//
// This Power Demo operates very simply as follows:
//
// The input clock i_clk PIN_B9 <or PIN_V9> is the 50 MHz oscillator on the Starter Kit board
//
// There are four input USER PUSH BUTTONs which control the Demo:
//
// Pressing USER_PB0 PIN_AD7  resets the demo to the beginning, node i_nrst 
// Pressing USER_PB1 PIN_AC12 advances the demo to the next higher frequency, node i_nfreq_next
// Pressing USER_PB2 PIN_AH3  advances the demo to the next higher resource utilization, node i_nperc_next
// Pressing USER_PB3 PIN_AA12 toggles the output enable allowing the outputs to toggle, node i_noutput_ena_next
//
// The LEDs indicate what state the Power Demo is currently demonstrating:
//
// LED0 o_nfreq_state[0] PIN_AD15 is bit 0 of the frequency advance indicator.
// LED1 o_nfreq_state[1] PIN_AE20 is bit 1 of the frequency advance indicator.
//
// LED2 o_nperc_state[0] PIN_AF18 is bit 0 of the resource  advance indicator.
// LED3 o_nperc_state[1] PIN_AD19 is bit 1 of the resource  advance indicator.
// LED4 o_nperc_state[2] PIN_AE15 is bit 2 of the resource  advance indicator.
// LED5 o_nperc_state[3] PIN_AC17 is bit 3 of the resource  advance indicator.
// LED6 o_nperc_state[4] PIN_AG19 is bit 4 of the resource  advance indicator.
//
// LED7 o_noutput_ena_state  PIN_AF19 indicates if the outputs are toggling.
//
// Example: 
// LED0 ON
// LED1 OFF
// LED2 ON
// LED3 OFF
// LED4 OFF
// LED5 OFF
// LED6 OFF
// LED7 OFF
//
// This indicates that the demo is at the first frequency, first resource level, no outputs enabled 
//
// Current Measurments: Set the POWER SELECT rotary switch to 0 to measure the internal VCC_INT current in amperes.
// Power up the board and begin advancing through the various USER_PB1, USER_PB2, USER_PB3 options.
// Observe the current on the 4-digit hexadecimal LED POWERDISPLAY panel.
// Notice how current increases as frequency and resources increase.
//
// Current (and power) should be linear with frequency and % resources.
// If current measurements are sublinear there may be voltage drop across the current meter.
// If current measurements are superlinear then try taking measurements faster to minimize the
// increasing static leakage with temperature
//

`timescale 1 ps / 1 ps 

module cycloneIII_3c120_dev_power (
	i_clk,
	i_nrst,
	i_nfreq_next,
	o_nfreq_state,
	i_nperc_next,
	o_nperc_state,
	i_noutput_ena_next,
	o_noutput_ena_state,
	o_outputs
	);

parameter NUM_STAMPS = 19; // 19 is maximum easy output correllation
parameter LOG2_NUM_STAMPS = 5; // 5 minimum LEDs to count to 19 resource stpes
parameter NUM_OUTPUTS_PER_STAMP = 8; // 19 stamps x 8 out puts = 152 outputs possible

input i_clk;
input i_nrst;
input i_nfreq_next;
output [1:0] o_nfreq_state;
input i_nperc_next;
output [LOG2_NUM_STAMPS-1:0] o_nperc_state;
input i_noutput_ena_next;
output o_noutput_ena_state;
output [NUM_OUTPUTS_PER_STAMP*NUM_STAMPS-1:0] o_outputs;

wire [NUM_OUTPUTS_PER_STAMP*NUM_STAMPS-1:0] int_outputs;
wire var_clk;
wire clk12_5;

wire rst = ~i_nrst;

reg [1:0] freq_state;
reg [LOG2_NUM_STAMPS-1:0] perc_state;
reg [NUM_OUTPUTS_PER_STAMP*NUM_STAMPS-1:0] o_outputs;
reg output_ena_state;

wire freq_next_pulse;
wire perc_next_pulse;

wire xor_ena;

wire [NUM_STAMPS-1:0] stamp_out;

wire output_ena_next_pulse;


clk_gen cgen (.i_clk(i_clk),
			  .i_rst(rst),
			  .i_freq_state(freq_state),
			  .o_var_clk(var_clk),
			  .o_clk12_5(clk12_5));

pulse pfreq (.i_clk(clk12_5),
			 .i_rst(rst),
			 .i_in(~i_nfreq_next),
			 .o_out(freq_next_pulse));

always @(posedge clk12_5 or posedge rst)
begin
	if (rst) freq_state <= 0;
	else freq_state <= freq_state + freq_next_pulse;
end

pulse pperc (.i_clk(clk12_5),
			 .i_rst(rst),
			 .i_in(~i_nperc_next),
			 .o_out(perc_next_pulse));

always @(posedge clk12_5 or posedge rst)
begin
	if (rst) perc_state <= 0;
	else if (perc_state == NUM_STAMPS) perc_state <= 0; 
	else perc_state <= perc_state + perc_next_pulse;
end

pulse poe (.i_clk(clk12_5),
		   .i_rst(rst),
		   .i_in(~i_noutput_ena_next),
		   .o_out(output_ena_next_pulse));

always @(posedge clk12_5 or posedge rst)
begin
	if (rst) output_ena_state <= 0;
	else output_ena_state <= output_ena_state + output_ena_next_pulse;
end

pulse pxe (.i_clk(clk12_5),
		   .i_rst(1'b0),
		   .i_in(rst),
		   .o_out(xor_ena));

genvar i;

generate
	for (i=0; i < NUM_STAMPS; i=i+1)
	begin : STAMPGEN
		stamp stamp (.i_clk(var_clk),
					 .i_rst(rst),
					 .i_ena(perc_state >= i),
					 .i_xor_ena(xor_ena),
					 .i_output_ena(output_ena_state),
					 .o_xor_out(stamp_out[i]),
					 .o_out(int_outputs[(i+1)*NUM_OUTPUTS_PER_STAMP-1:i*NUM_OUTPUTS_PER_STAMP]));
		defparam stamp.NUM_OUTPUTS = NUM_OUTPUTS_PER_STAMP;
	end
endgenerate

assign o_nfreq_state = ~(xor_ena ? {1'b0, ^stamp_out} : freq_state);
assign o_nperc_state = ~(xor_ena ? {1'b0, ^stamp_out} : perc_state);

assign o_noutput_ena_state = ~output_ena_state;

always @(posedge var_clk or posedge rst)
begin
	if (rst) o_outputs <= 0;
	else o_outputs <= int_outputs;
end

endmodule
