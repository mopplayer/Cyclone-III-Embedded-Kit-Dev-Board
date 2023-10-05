// Aaron's idea for switch debouncing with a single pulse result:

`timescale 1 ps / 1 ps 

module pulse (
	i_clk,
	i_rst,
	i_in,
	o_out);

input i_clk;
input i_rst;
input i_in;
output o_out;

// new code
parameter N = 18; // 18 = 21ms delay

reg [(N-1):0] count;
					
always @(posedge i_clk or posedge i_rst) 
begin
  if (i_rst) 
	begin
		count <= 0;
	end
  else begin
    if (!i_in)
		count <= 0;
    else if (!(&count)) begin
			count <= count + 1;
		end 
	end
end

assign o_out = (&count[(N-1):1]) & !count[0];

endmodule

