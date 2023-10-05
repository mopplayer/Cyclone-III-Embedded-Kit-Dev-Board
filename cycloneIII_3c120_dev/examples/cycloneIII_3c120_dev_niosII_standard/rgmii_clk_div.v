
module rgmii_clk_div (

   reset,
   clk,
   eth_speed,
   mac_clk);
   
input   reset;                  //  Asynchronous Reset
input   clk;                    //  125MHz Reference Clock
input   [1:0] eth_speed;        //  Speed Selection   
output  mac_clk;                //  MAC Clock

reg     mac_clk/* synthesis ALTERA_ATTRIBUTE="PRESERVE_REGISTER=ON" */; 
reg     [1:0] eth_speed_reg1; 
reg     [1:0] eth_speed_reg2; 
reg     [5:0] clk_cnt; 
reg     clk_int; 

always @(posedge reset or posedge clk)
   begin : process_1
   if (reset == 1'b 1)
      begin
      eth_speed_reg1 <= 2'b 10;   
      eth_speed_reg2 <= 2'b 10;   
      end
   else
      begin
      eth_speed_reg1 <= eth_speed;   
      eth_speed_reg2 <= eth_speed_reg1;   
      end
   end

always @(posedge reset or posedge clk)
   begin : process_2
   if (reset == 1'b 1)
      begin
      clk_cnt <= {6{1'b 0}};   
      end
   else
      begin
      if (eth_speed_reg2 == 1'b 01)
         begin
         if (clk_cnt == 6'd 49)
            begin
            clk_cnt <= {6{1'b 0}};   
            end
         else
            begin
            clk_cnt <= clk_cnt + 6'h 1;   
            end
         end
      else if (eth_speed_reg2 == 2'b 00 )
         begin
         if (clk_cnt >= 6'h 4)
            begin
            clk_cnt <= {6{1'b 0}};   
            end
         else
            begin
            clk_cnt <= clk_cnt + 6'h 1;   
            end
         end
      else
         begin
         clk_cnt <= {6{1'b 0}};   
         end
      end
   end

always @(posedge reset or posedge clk)
   begin : process_3
   if (reset == 1'b 1)
      begin
      clk_int <= 1'b 0;   
      end
   else
      begin
      if (eth_speed_reg2 == 2'b 01)
         begin
         if (clk_cnt < 6'h 19)
            begin
            clk_int <= 1'b 1;   
            end
         else
            begin
            clk_int <= 1'b 0;   
            end
         end
      else if (eth_speed_reg2 == 2'b 00 )
         begin
         if (clk_cnt < 6'h 2)
            begin
            clk_int <= 1'b 1;   
            end
         else
            begin
            clk_int <= 1'b 0;   
            end
         end
      else
         begin
         clk_int <= 1'b 0;   
         end
      end
   end

//  Clock MUX
//  ---------        

always @(clk_int or clk or eth_speed_reg2[1])
   begin : process_4
   if (eth_speed_reg2[1] == 1'b 1)
      begin
      mac_clk <= clk;   
      end
   else
      begin
      mac_clk <= clk_int;   
      end
   end

endmodule // module rgmii_clk_div