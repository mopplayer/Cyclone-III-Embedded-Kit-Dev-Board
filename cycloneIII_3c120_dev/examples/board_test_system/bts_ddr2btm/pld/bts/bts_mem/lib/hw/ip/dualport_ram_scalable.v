module dualport_ram_scalable
(
	q,
	addr_in,
	addr_out,
	d,
	we,
	clk1,
	clk2,
	re,
);
				
				
				
// Use this to infer M9K or M4K or M512 Memories:
					
	parameter	data_width		=	8;
	parameter	addr_width		=	5;	// log2(addr_width)
	parameter	mem_size		=	1<<addr_width;

	output	[data_width-1:0]	q;
	input 	[data_width-1:0]	d;
	input 	[addr_width-1:0]	addr_in;                  
	input 	[addr_width-1:0]	addr_out;
	input 						we;
	input						clk1;
	input						clk2;
	input						re;
	
	reg [addr_width-1:0]		addr_out_reg;
	reg [data_width-1:0]		q;
	reg [data_width-1:0]		mem [mem_size-1:0];	// / * sy nth esis ra mst yle = "M512" * /


	always @(posedge clk1)
	begin
		if (we)
		begin
			mem[addr_in] <= d;
		end
	end

	always @(posedge clk2)
	begin
		if	(re)
		begin
			q			<= mem[addr_out];
		end
	end  

	
endmodule