/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2009 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/

/*
  bts.c: 
  Implements hardware interface functions, such a toggling bits, moving data
  to/from hardware, initializing hardware, etc. 
*/

#include "bts.h"

// display=DISPLAY_ON for print to console, DISPLAY_OFF for no print to console
// aci_rw = READ or WRITE
// base_addr = Base Address of Avalon Control Interface
// lanes = # of rows to display
// words = # of data words which are concatenated in each lane
// heading_str = Main display string
// lane_str   - string to display at the beginning of each row (set to "" and lanes=1 for all display on 1 line)



// COMMON:
int io_aci  (alt_u8 display,alt_u32 aci_val[],char aci_rw[],int base_addr,int map_addr,int lanes, int words, char heading_str[], char lane_str[])
{
  int       A,B;
  int       port_data;
  alt_u32   rd_data;    
  alt_u32   w[32];
  int       n;
  char      line[128];
  char      ch1,ch2,ch3,ch4;
  int       aci_val_depth;

  if (strcmp(aci_rw,WRITE_S)==0) {display=DISPLAY_ON;} // Force print on when entering data
  aci_val_depth = words * lanes;
  if  (display == DISPLAY_ON)
  {
#ifdef   ALT_DEBUG
    printf("\t%s",heading_str);
    if  (lane_str != "") {printf("\n");}
#endif
  }
  for (B=0; B<lanes; B=B+1) {
    if (display == DISPLAY_ON)
    {
#ifdef   ALT_DEBUG
      if  (lane_str == "")
      {
        printf("%s\t=\t",lane_str);
      } else {
        printf("\t\t");
        printf("%s %d\t=\t",lane_str,B);       
      }
#endif
    }            
    if  (strcmp(aci_rw,READSTR_S)==0)
    { 
      for (A=words-1; A>=0; A=A-1)
      {
        rd_data = IORD(base_addr, map_addr+(words*B*4)+(A*4));
        //printf("\ndebug rd_data: ", rd_data);
        aci_val[(B*words) + A] = rd_data;
        if(display == DISPLAY_ON)
        {
#ifdef   ALT_DEBUG
          printf("%c%c%c%c",(rd_data>>24)&0xff,(rd_data>>16)&0xff,(rd_data>>8)&0xff,(rd_data>>0)&0xff);
          if (A == 0) {printf("\n");}
#endif
        }
      }
    }

    if  (strcmp(aci_rw,READ_S)==0)
    {
      for (A=words-1; A>=0; A=A-1)
      {
        rd_data = IORD(base_addr, map_addr+(words*B*4)+(A*4));
        aci_val[(B*words) + A] = rd_data;
        if(display == DISPLAY_ON)
        {
#ifdef   ALT_DEBUG
          if (A != 0)
          {
            printf("%X_",rd_data); 
          } else {
            printf("%Xh\n",rd_data);             
          }
#endif
        }
      }
    }
    if  (strcmp(aci_rw,WRITE_S)==0)
    {
#ifdef   ALT_DEBUG
      printf("Enter Data As %d 32 Bit Hex Words Separated by Spaces: ",words);
#endif
      fgets(line, sizeof(line), stdin);
#ifdef   ALT_DEBUG
      printf("\n");
#endif
      n = sscanf(line,"%X%X%X%X %X%X%X%X %X%X%X%X %X%X%X%X %X%X%X%X %X%X%X%X X%X%X%X %X%X%X%X %X%X%X%X %X%X%X%X %X%X%X%X %X%X%X%X",
                  &w[ 0],&w[ 1],&w[ 2],&w[ 3],&w[ 4],&w[ 5],&w[ 6],&w[ 7],
                  &w[ 8],&w[ 9],&w[10],&w[11],&w[12],&w[13],&w[14],&w[15],      
                  &w[16],&w[17],&w[18],&w[19],&w[20],&w[21],&w[22],&w[23],
                  &w[24],&w[25],&w[26],&w[27],&w[28],&w[29],&w[30],&w[31]         
        );
      //printf("    \nWrite Data = %X_%X_%X_%X\n",w[0],w[1],w[2],w[3]);
      for (A=words-1; A>=0; A=A-1)
      {
        IOWR(base_addr, map_addr+(words*B*4)+(A*4),w[words-1-A]);
        aci_val[(B*words) + A] = w[words-1-A];        
      }
    }
  }
  return  0;
}

// get_port is used only in debug mode
int get_port(alt_u32 *port,alt_u32 *port_com,alt_u32 *port_mem)
{
  char      line[8];
  alt_u32   port_local; 
  alt_u8    key_read  = 0;
  alt_u32   port_ctr;
  alt_u32   port_idx;
  while ((key_read == 0 ) || (*port < port_lo) || (*port > port_hi))
  {
    key_read = 1;
    printf("Detecting Board Test System Ports:\n");
    // Use port 0's board & system id (should be the same for all ports)
    printf("\t");
    // Make certain ports exist
    if (num_com_ports > 0)
    {
        io_aci(DISPLAY_ON,acim_com[0].board_id[0],READSTR_S,acim_com[0].base_address[0],acim_com[0].BOARD_ID_A,1,acim_com[0].id_words[0],     "Board Identification        ","");  
        printf("\t");
        io_aci(DISPLAY_ON,acim_com[0].generic_id[0],READSTR_S,acim_com[0].base_address[0],acim_com[0].GENERIC_ID_A,1,acim_com[0].id_words[0], "System Identification       ","");  

    } else if (num_mem_ports > 0) {
        io_aci(DISPLAY_ON,acim_mem[0].board_id[0],READSTR_S,acim_mem[0].base_address[0],acim_mem[0].BOARD_ID_A,1,acim_mem[0].id_words[0],     "Board Identification        ","");  
        printf("\t");
        io_aci(DISPLAY_ON,acim_mem[0].generic_id[0],READSTR_S,acim_mem[0].base_address[0],acim_mem[0].GENERIC_ID_A,1,acim_mem[0].id_words[0], "System Identification       ","");  
    }
     for (port_ctr=port_lo; port_ctr<=port_hi; port_ctr=port_ctr+1)
    {
      if  (*port == port_ctr) {
        printf("\t\t->%d:\t",port_ctr);
      } else {
        printf("\t\t  %d:\t",port_ctr);
      }
      if ((port_ctr >= port_com_lo) && (port_ctr <= port_com_hi) && (num_com_ports > 0))
      {
        port_idx = port_ctr - port_com_lo; // Index from 0 for COM structure
        io_aci(DISPLAY_ON,acim_com[port_idx].port_id[0],READSTR_S,acim_com[port_idx].base_address[0],acim_com[port_idx].PORT_ID_A,1,acim_com[port_idx].id_words[0],     "Port Identification         ","");  
      }
      if ((port_ctr >= port_mem_lo) && (port_ctr <= port_mem_hi) && (num_mem_ports > 0))
      {
        port_idx = port_ctr - port_mem_lo; // Index from 0 for MEM structure
        io_aci(DISPLAY_ON,acim_mem[port_idx].port_id[0],READSTR_S,acim_mem[port_idx].base_address[0],acim_mem[port_idx].PORT_ID_A,1,acim_mem[port_idx].id_words[0],     "Port Identification         ","");  
      }   
    }
    printf("Select Port # (%d thru %d): ",port_lo,port_hi);
    fgets(line, sizeof(line), stdin);
    sscanf(line,"%d", &port_local ); 
    *port  = port_local;   
    //printf("\nSetting Port = %d\n",*port);
  }
  if ((*port >= port_com_lo) && (*port <= port_com_hi))
  {
    *port_com = *port - port_com_lo; // Index from 0 for COM structure   
    (void) aci_rw_regs_id_com(&acim_com[*port_com],DISPLAY_ON,acim_com[*port_com].base_address[0],READ_S,ALL_S);    
  }
  if ((*port >= port_mem_lo) && (*port <= port_mem_hi))
  {
    *port_mem = *port - port_mem_lo; // Index from 0 for MEM structure  
    (void) aci_rw_regs_id_mem(&acim_mem[*port_mem],DISPLAY_ON,acim_mem[*port_mem].base_address[0],READ_S,ALL_S);    
  }     
  return 0;
}



int assert_bit(alt_u32 base_address,alt_u32 map_address,alt_u32 reg_mask,int assert_polarity,alt_u8 pulse)
{
  alt_u32  rd_data;
  alt_u32    wr_data; 
  int       select;
 
  select = assert_polarity;
  switch  (select)
  {
    case  ASSERT_LO:
    { 
        rd_data = IORD(base_address, map_address); 
        wr_data = rd_data & (~reg_mask);    
        IOWR(base_address,map_address,wr_data);  
        if  (pulse == PULSE)
        {
            usleep(PB_ON);
            wr_data = rd_data | reg_mask;   
            IOWR(base_address,map_address,wr_data);  
            usleep(PB_OFF);  
        }  
        break;
    }                  
    case  ASSERT_HI:
    { 
        rd_data = IORD(base_address, map_address);           
        wr_data = rd_data | reg_mask;         
        IOWR(base_address,map_address,wr_data);  
        if  (pulse == PULSE)
        {
            usleep(PB_ON);
            wr_data = rd_data & (~reg_mask);
            IOWR(base_address,map_address,wr_data);  
            usleep(PB_OFF);
        }
        break;
    }  
    default:  break;
  }
  return  0;
} 


int get_data(char display_str[],alt_u32 *data,alt_u32 data_init,alt_u32 data_min,alt_u32 data_max)
{
  char      line[10]; // Enter is truncated
  alt_u32   key;
  alt_8     exit_loop;
  exit_loop = 0;
  while (exit_loop == 0)
  {
#ifdef   ALT_DEBUG
    printf("\t%s %Xh-%Xh [%Xh]: ",display_str,data_min,data_max,data_init);
#endif
    fgets(line, sizeof(line), stdin); 
#ifdef   ALT_DEBUG
    printf("\n");
#endif
    if  (sscanf(line,"%X",&key) == 1) {
      *data  = key;
    } else {
      *data = data_init;   
    }
    if ((*data >= data_min) && (*data <= data_max))
      {exit_loop=1;}
  }
}


int io_pfa(char aci_rw[],alt_u32 base_address, alt_u32 map_address)
{       
  alt_u32 rd_data;
  if  (strcmp(aci_rw,READ_S)==0)
  {  
    rd_data = IORD(base_address, map_address);
#ifdef   ALT_DEBUG
    printf("\tPFA EPLL Frequency Adjust \t= %Xh\n",rd_data);
#endif
  }
  return  0;          
}


// COM:
// Reset the BTS System & Transmit Serial Data to Establish the Link  

int	reset_com(struct aci_map_com *aci)
{
  alt_u32   wr_data; 
  alt_u32   rd_data;
    // Turn off create error bit (if set)
  assert_bit(aci->base_address[0],aci->BCR_A,aci->CER_M,ASSERT_LO,LEVEL);  
  // Turn off start bit (if set)
  assert_bit(aci->base_address[0],aci->BCR_A,aci->STRT_M,ASSERT_LO,LEVEL);
  wr_data = ((~(aci->IPS_M | aci->DWA_M | aci->DRD_M | aci->CER_M | aci->STRT_M | aci->ECB_M | aci->ECD_M )) | (aci->RSN_M)); // Initialize Control Signals
  IOWR(aci->base_address[0],aci->BCR_A,wr_data);   
  IOWR(aci->base_address[0],aci->BIO_A,~0); // LEDs off drive high
  // Initialize SSD also
  assert_bit(aci->base_address[0],aci->BCR_A,aci->RSN_M,ASSERT_LO,PULSE); // Toggle bit to reset BTS,Data Errors will stop.
  rd_data = IORD(aci->base_address[0],aci->BCR_A); // Read BCR to clear EIRQ    
  return  0;
}
 
  
                       

                                   
 int  io_xvc_com(struct aci_map_com *aci,char aci_rw[],alt_u32 base_address, alt_u32 map_address)
 {   
  int        A;
  alt_u8     key;
  char       line[8];
  alt_u32    rd_data;      
#ifdef   ALT_DEBUG
    printf("\t%s XVC ETransceiver Controls:\n",aci_rw); 
#endif
    if  (strcmp(aci_rw,READ_S) == 0)
    {    
      (void)  get_xvc_com(aci,base_address,map_address);
      for (A=0; A<aci->serial_channels[0]; A=A+1)
      {   
#ifdef   ALT_DEBUG
        printf("\t\tChannel %D:\tVOD=%Xh\tP0=%Xh\tP1=%Xh\tP2=%Xh\tRX EQ=%Xh\tDC GAIN=%Xh\tSerial Loopback=%X\n",
                A,aci->xvc_vod[A],aci->xvc_p0[A],aci->xvc_p1[A],aci->xvc_p2[A],aci->xvc_eq[A],aci->xvc_dc[A],aci->xvc_slb[A]);
#endif
      }
    } else {
      (void)  get_xvc_com(aci,base_address,map_address);  // For any reg, use old values if no new data is entered      
      // Read registers:
      //assert_bit(base_address,aci->BCR_A,aci->DRD_M,ASSERT_HI,PULSE);
      //get_xvc_com(aci,base_address,map_address);  
      for (A=0; A<aci->serial_channels[0]; A=A+1)
      {    
        //sprintf(str,"\t\tEnter VOD For Transceiver %d in Hex: ",A); 
        //printf("%s",str);
#ifdef   ALT_DEBUG
        printf("\t\tEnter VOD For Transceiver %d in Hex: ",A);  
#endif
        fgets(line, sizeof(line), stdin);       
#ifdef   ALT_DEBUG
        printf("\n");
#endif
        if  (sscanf(line,"%X",&key) == 1) {aci->xvc_vod[A] = key & (aci->VOD_LMSK);}
      }
      for (A=0; A<aci->serial_channels[0]; A=A+1)
      {       
#ifdef   ALT_DEBUG
        printf("\t\tEnter Preemphasis Pre-Tap For Transceiver %d in Hex: ",A);
#endif
        fgets(line, sizeof(line), stdin);
#ifdef   ALT_DEBUG
        printf("\n");        
#endif
        if  (sscanf(line,"%X",&key) == 1) {aci->xvc_p0[A]  = key & (aci->P0_LMSK);}  
      }
      for (A=0; A<aci->serial_channels[0]; A=A+1)
      {       
#ifdef   ALT_DEBUG
        printf("\t\tEnter Preemphasis Center Tap For Transceiver %d in Hex: ",A);
#endif
        fgets(line, sizeof(line), stdin);
#ifdef   ALT_DEBUG
        printf("\n");
#endif
        if  (sscanf(line,"%X",&key) == 1) {aci->xvc_p1[A]  = key & (aci->P1_LMSK);}  
      }      
      for (A=0; A<aci->serial_channels[0]; A=A+1)
      {       
#ifdef   ALT_DEBUG
        printf("\t\tEnter Preemphasis Post Tap For Transceiver %d in Hex: ",A);
#endif
        fgets(line, sizeof(line), stdin);
#ifdef   ALT_DEBUG
        printf("\n");
#endif
        if  (sscanf(line,"%X",&key) == 1) {aci->xvc_p2[A]  = key & (aci->P2_LMSK);}  
      }
      for (A=0; A<aci->serial_channels[0]; A=A+1)
      {       
#ifdef   ALT_DEBUG
        printf("\t\tEnter RX Equalization For Transceiver %d in Hex: ",A);
#endif
        fgets(line, sizeof(line), stdin);
#ifdef   ALT_DEBUG
        printf("\n");       
#endif
        if  (sscanf(line,"%X",&key) == 1) {aci->xvc_eq[A]  = key & (aci->EQ_LMSK);}  
      }      
      for (A=0; A<aci->serial_channels[0]; A=A+1)
      {       
#ifdef   ALT_DEBUG
        printf("\t\tEnter RX DC Gain For Transceiver %d in Hex: ",A);
#endif
        fgets(line, sizeof(line), stdin);
#ifdef   ALT_DEBUG
        printf("\n");        
#endif
        if  (sscanf(line,"%X",&key) == 1) {aci->xvc_dc[A]  = key & (aci->DC_LMSK);}  
      }
      for (A=0; A<aci->serial_channels[0]; A=A+1)
      {       
#ifdef   ALT_DEBUG
        printf("\t\tEnter Serial Loopback Bit For Transceiver %d: ",A);
#endif
        fgets(line, sizeof(line), stdin);
#ifdef   ALT_DEBUG
        printf("\n");
#endif
        if  (sscanf(line,"%X",&key) == 1) {aci->xvc_slb[A]  = key & (aci->SLB_LMSK);}  
      }  
      (void)  put_xvc_com(aci,base_address,map_address);                
    }              
  } 

 
 
int get_xvc_com(struct aci_map_com *aci,alt_u32 base_address,alt_u32 map_address) {
  int       A;
  alt_u32   rd_data;
  assert_bit(base_address,aci->BCR_A,aci->DRD_M,ASSERT_HI,PULSE);   
  for (A=0; A<aci->serial_channels[0]; A=A+1)
  {   
    rd_data = IORD(base_address, map_address+(A*4));
    aci->xvc_dc[A]   = (rd_data>>(aci->DC_LSB ))  & (aci->DC_LMSK );
    aci->xvc_eq[A]   = (rd_data>>(aci->EQ_LSB ))  & (aci->EQ_LMSK );
    aci->xvc_p0[A]   = (rd_data>>(aci->P0_LSB ))  & (aci->P0_LMSK );
    aci->xvc_p1[A]   = (rd_data>>(aci->P1_LSB ))  & (aci->P1_LMSK );
    aci->xvc_p2[A]   = (rd_data>>(aci->P2_LSB ))  & (aci->P2_LMSK );
    aci->xvc_vod[A]  = (rd_data>>(aci->VOD_LSB))  & (aci->VOD_LMSK); 
    aci->xvc_slb[A]  = (rd_data>>(aci->SLB_LSB))  & (aci->SLB_LMSK);       
  }
  return  0;
};   
 
int put_xvc_com(struct aci_map_com *aci,alt_u32 base_address,alt_u32 map_address) {
  int       A;
  alt_u32   wr_data; 
  for (A=0; A<aci->serial_channels[0]; A=A+1)
  {                   
    wr_data     = (((aci->xvc_dc[A] ) & (aci->DC_LMSK )) <<  (aci->DC_LSB ))  |
                  (((aci->xvc_eq[A] ) & (aci->EQ_LMSK )) <<  (aci->EQ_LSB ))  |              
                  (((aci->xvc_p0[A] ) & (aci->P0_LMSK )) <<  (aci->P0_LSB ))  |
                  (((aci->xvc_p1[A] ) & (aci->P1_LMSK )) <<  (aci->P1_LSB ))  |   
                  (((aci->xvc_p2[A] ) & (aci->P2_LMSK )) <<  (aci->P2_LSB ))  |   
                  (((aci->xvc_vod[A]) & (aci->VOD_LMSK)) <<  (aci->VOD_LSB))  | 
                  (((aci->xvc_slb[A]) & (aci->SLB_LMSK)) <<  (aci->SLB_LSB)); 
   IOWR(base_address, map_address+(A*4),wr_data);    
  }
  assert_bit(base_address,aci->BCR_A,aci->DWA_M,ASSERT_HI,PULSE);    
  return  0;
};                                                            
  
  int aci_rw_regs_id_com (struct aci_map_com *aci,alt_u32 display,alt_u32 base_address,char aci_rw[],char aci_regs[])  {
          if (display == DISPLAY_ON)
            {printf("\n%s %s Avalon Control Interface ID & Parameters:\n",aci_rw,aci_regs);}
          // Get board parameters:  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,ADDRS_PER_REG_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->addrs_per_reg,READ_S,base_address,aci->ADDRS_PER_REG_A,1,1,          "Addresses Per Register      ","");}          
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID1_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id1,READ_S,base_address,aci->BTS_ID1_A,1,1,                "BTS ID1                    ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID2_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id2,READ_S,base_address,aci->BTS_ID2_A,1,1,                "BTS ID2                     ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID3_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id3,READ_S,base_address,aci->BTS_ID3_A,1,1,                "BTS ID3                     ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID4_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id4,READ_S,base_address,aci->BTS_ID4_A,1,1,                "BTS ID4                     ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID5_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id5,READ_S,base_address,aci->BTS_ID5_A,1,1,                "BTS ID5                     ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID6_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id6,READ_S,base_address,aci->BTS_ID6_A,1,1,                "BTS ID6                     ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID7_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id7,READ_S,base_address,aci->BTS_ID7_A,1,1,                "BTS ID7                     ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID8_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id8,READ_S,base_address,aci->BTS_ID8_A,1,1,                "BTS ID8                     ","");}       
           if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,ID_WORDS_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->id_words,READ_S,base_address,aci->ID_WORDS_A,1,1,               "Words Per ID Field          ","");}        
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BOARD_ID_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->board_id,READSTR_S,base_address,aci->BOARD_ID_A,1,aci->id_words[0],"Board Identification        ","");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PORT_ID_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->port_id,READSTR_S,base_address,aci->PORT_ID_A,1,aci->id_words[0], "Port Identification         ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,GENERIC_ID_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->generic_id,READSTR_S,base_address,aci->GENERIC_ID_A,1,aci->id_words[0],"System Identification       ","");}     
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,MAP_DPRIO_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->map_dprio,READ_S,base_address,aci->MAP_DPRIO_A,1,1,              "BTS XCVR DPRIO Map Exists   ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,XCVR_DATA_SKEW_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->xcvr_data_skew_width,READ_S,base_address,aci->XCVR_DATA_SKEW_WIDTH_A,1,1,   "TX Data Skew Reg Width      ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SERIAL_CHANNELS_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->serial_channels,READ_S,base_address,aci->SERIAL_CHANNELS_A,1,1,        "Serial Channels             ","");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,CHANNEL_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->channel_width,READ_S,base_address,aci->CHANNEL_WIDTH_A,1,1,          "Channel Width               ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,NUM_LANES_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->num_lanes,READ_S,base_address,aci->NUM_LANES_A,1,1,              "Error Lanes                 ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,TEC_WORDS_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->tec_words,READ_S,base_address,aci->TEC_WORDS_A,1,1,              "Transaction Counter Words   ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,NUM_SSDS_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->num_ssds,READ_S,base_address,aci->NUM_SSDS_A,1,1,               "Seven Segment Displays      ","");}              
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SSD_BITS_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->ssd_bits,READ_S,base_address,aci->SSD_BITS_A,1,1,               "Control Bits Per Segment    ","");}  
          return 0;
        }  
  
  
  int aci_rw_regs_com (struct aci_map_com *aci,alt_u32 display,alt_u32 base_address,char aci_rw[],char aci_regs[])  {
          if (display == DISPLAY_ON)
            {printf("\n%s %s Avalon Control Interface Registers:\n",aci_rw,aci_regs);}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BCR_S)==0)) && (strcmp(aci_rw,READ_S)==0)) // Only read status from BCR          
            io_bcr_com(aci,base_address,aci->BCR_A);                                                        // Use ASSERT_LO and ASSERT_HI to modify register bits
          // At this point, all parameters & calculates should be available for the calls below:
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PRS_S)==0))                  
            {io_aci(display,aci->prs,aci_rw,base_address,aci->PRS_A,1,aci->data_word_packs[0], "PRS EPRBS Seed Register    ","");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PRD_S)==0)) && (strcmp(aci_rw,READ_S)==0))   
            {io_aci(display,aci->prd,aci_rw,base_address,aci->PRD_A,1,1,                     "PRD - PRBS Depth            ","");}
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PRC_S)==0))   
            {io_aci(display,aci->prc,aci_rw,base_address,aci->PRC_A,1,aci->data_word_packs[0],     "PRC - PRBS Coefficients     ","");}
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,EDM_S)==0))   
            {io_aci(display,aci->edm,aci_rw,base_address,aci->EDM_A,1,aci->data_word_packs[0],     "EDM - Error Detector Mask   ","");}                             
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SDM_S)==0))   
            {io_aci(display,aci->sdm,aci_rw,base_address,aci->SDM_A,1,aci->data_word_packs[0],     "SDM - Sync Detector Mask    ","");}
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,CEM_S)==0))   
            {io_aci(display,aci->cem,aci_rw,base_address,aci->CEM_A,1,aci->data_word_packs[0],     "CEM - Create Error Mask     ","");}
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,TDS_S)==0))   
            {io_aci(display,aci->tds,aci_rw,base_address,aci->TDS_A,aci->serial_channels[0],1,     "TDS - Transmit Data Skew:   ","Channel");} 
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,XVC_S)==0))            
            {io_xvc_com(aci,aci_rw,base_address,aci->XVC_A);}    
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,RTC_S)==0)) && (strcmp(aci_rw,READ_S)==0))            
            {io_aci(display,aci->rtc,aci_rw,base_address,aci->RTC_A,1,aci->tec_words[0],          "RTC ERX Transaction Counter","");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,TTC_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->ttc,aci_rw,base_address,aci->TTC_A,1,aci->tec_words[0],          "TTC ETX Transaction Counter","");}     
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,LEC_S)==0)) && (strcmp(aci_rw,READ_S)==0))          
            {io_aci(display,aci->lec,aci_rw,base_address,aci->LEC_A,aci->num_lanes[0],aci->tec_words[0],  "LEC - Lane Error Counter:   ","LEC");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,WEC_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->wec,aci_rw,base_address,aci->WEC_A,1,aci->tec_words[0],          "WEC - Word Error Counter    ","");}  
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BIO_S)==0))      
            {io_bio_com(aci,aci_rw,base_address,aci->BIO_A);} 
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SSD_S)==0))
            {io_aci(display,aci->ssd,aci_rw,base_address,aci->SSD_A,aci->num_ssds[0],1  ,         "SSD - Seven Segment Display: ","Display");} 
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PFA_S)==0))
            {io_pfa(aci_rw,base_address,aci->PFA_A);}           
          return 0;
        }

int io_bio_com(struct aci_map_com *aci,char aci_rw[],alt_u32 base_address, alt_u32 map_address)
{       
  alt_u32 rd_data;
#ifdef   ALT_DEBUG
  printf("\t%s BIO EBoard Input/Output:\n",aci_rw);   
#endif
  if  (strcmp(aci_rw,READ_S)==0)
  {
    rd_data = IORD(base_address, map_address); 
    rd_data = rd_data & bio_mask_dd; // Turn off unused bits
    aci->bio[0] = rd_data;
#ifdef   ALT_DEBUG
    printf("\t\tPB[7:0] \t=\t%X%X%X%X%X%X%X%Xb\n",  // Looks like binary format
            (rd_data>> 7)&1,(rd_data>> 6)&1,(rd_data>> 5)&1,(rd_data>> 4)&1,(rd_data>> 3)&1,(rd_data>> 2)&1,(rd_data>> 1)&1,(rd_data>> 0)&1);
    printf("\t\tDIP[7:0]\t=\t%X%X%X%X%X%X%X%Xb\n",
            (rd_data>>15)&1,(rd_data>>14)&1,(rd_data>>13)&1,(rd_data>>12)&1,(rd_data>>11)&1,(rd_data>>10)&1,(rd_data>> 9)&1,(rd_data>> 8)&1);
    printf("\t\tLED[7:0]\t=\t%X%X%X%X%X%X%X%Xb\n",
            (rd_data>>23)&1,(rd_data>>22)&1,(rd_data>>21)&1,(rd_data>>20)&1,(rd_data>>19)&1,(rd_data>>18)&1,(rd_data>>17)&1,(rd_data>>16)&1);               
#endif
  }
  return  0;        
}

  int io_bcr_com(struct aci_map_com *aci,alt_u32 base_address,alt_u32 map_address)
  {
    alt_u32   rd_data;
    rd_data = IORD(base_address, map_address); 
    aci->bcr[0] = rd_data;          
#ifdef   ALT_DEBUG
    printf("\tBCR - Base Control Register:\n");
    //printf("\t\tFull Register         \tBCR \t=\t%Xh\n",rd_data);
    printf("\t\tReset                 \tRSN \t=\t%X\n",(rd_data>> aci->RSN_B)  &1);
    printf("\t\tEnable Comma Detect   \tECD \t=\t%X\n",(rd_data>> aci->ECD_B)  &1); 
    printf("\t\tEnable Channel Bond   \tECB \t=\t%X\n",(rd_data>> aci->ECB_B)  &1);
    printf("\t\tStart Data            \tSTRT\t=\t%X\n",(rd_data>> aci->STRT_B) &1);  
    printf("\t\tCreate Error          \tCER \t=\t%X\n",(rd_data>> aci->CER_B)  &1);
    printf("\t\tDPRIO Read            \tDRD \t=\t%X\n",(rd_data>> aci->DRD_B)  &1); 
    printf("\t\tDPRIO Write All       \tDWA \t=\t%X\n",(rd_data>> aci->DWA_B)  &1);
    printf("\t\tDPRIO Data Valid      \tDDV \t=\t%X\n",(rd_data>> aci->DDV_B)  &1);
    printf("\t\tDPRIO Busy            \tDBY \t=\t%X\n",(rd_data>> aci->DBY_B)  &1);                                      
    printf("\t\tInitialize PRBS Seed  \tIPS \t=\t%X\n",(rd_data>> aci->IPS_B)  &1);
    printf("\t\tChannel Lock Sync     \tCLS \t=\t%X\n",(rd_data>> aci->CLS_B)  &1);          
    printf("\t\tChannel Lock Acquired \tCLA \t=\t%X\n",(rd_data>> aci->CLA_B)  &1);         
    printf("\t\tRX PLLs & DPAs Locked \tPLLR\t=\t%X\n",(rd_data>> aci->PLLR_B) &1); 
    printf("\t\tTX PLLs & DPAs Locked \tPLLT\t=\t%X\n",(rd_data>> aci->PLLT_B) &1);
    printf("\t\tAll PLLs Locked       \tPLLK\t=\t%X\n",(rd_data>> aci->PLLK_B) &1);  
    printf("\t\tPattern Sync Acquired \tPSA \t=\t%X\n",(rd_data>> aci->PSA_B)  &1);
    printf("\t\tTest Complete         \tTSTC\t=\t%X\n",(rd_data>> aci->TSTC_B) &1); 
    printf("\t\tError Latch           \tERRL\t=\t%X\n",(rd_data>> aci->ERRL_B) &1);
    printf("\t\tError IRQ             \tEIRQ\t=\t%X\n",(rd_data>> aci->EIRQ_B) &1);           
    printf("\t\tPass/Fail             \tPASS\t=\t%X\n",(rd_data>> aci->PASS_B) &1); 
#endif
    return  0;
  };

int init_aci_com(alt_u32 *port_type,struct aci_map_com *aci,alt_u32 base_address)
{  
    *port_type                  =   COM; 
	aci->addrs_per_reg[0]		=	addrs_per_reg_d;	// This must match the avalon component!
	aci->BTS_ID1_A       		=	((aci->addrs_per_reg[0])	*	0x00)		;
	aci->BTS_ID2_A       		=	((aci->addrs_per_reg[0])	*	0x01)		;
	aci->BTS_ID3_A       		=	((aci->addrs_per_reg[0])	*	0x02)		;
	aci->BTS_ID4_A       		=	((aci->addrs_per_reg[0])	*	0x03)		;
	aci->BTS_ID5_A       		=	((aci->addrs_per_reg[0])	*	0x04)		;
	aci->BTS_ID6_A       		=	((aci->addrs_per_reg[0])	*	0x05)		;
	aci->BTS_ID7_A       		=	((aci->addrs_per_reg[0])	*	0x06)		;
	aci->BTS_ID8_A       		=	((aci->addrs_per_reg[0])	*	0x07)		;
	aci->BOARD_ID_A        		=	((aci->addrs_per_reg[0])	*	0x08)		;
	aci->PORT_ID_A       		=	((aci->addrs_per_reg[0])	*	0x09)		;
	aci->GENERIC_ID_A      		=	((aci->addrs_per_reg[0])	*	0x0A)		;
	aci->ADDRS_PER_REG_A   		=	((aci->addrs_per_reg[0])	*	0x0B)		; 
	aci->ID_WORDS_A        		=	((aci->addrs_per_reg[0])	*	0x0C)		; 
	aci->MAP_DPRIO_A       		=	((aci->addrs_per_reg[0])	*	0x0D)		;
	aci->XCVR_DATA_SKEW_WIDTH_A	=	((aci->addrs_per_reg[0])	*	0x0E)		;
	aci->SERIAL_CHANNELS_A     	=	((aci->addrs_per_reg[0])	*	0x0F)		;
	aci->CHANNEL_WIDTH_A       	=	((aci->addrs_per_reg[0])	*	0x10)		;
	aci->NUM_LANES_A           	=	((aci->addrs_per_reg[0])	*	0x11)		;
	aci->TEC_WORDS_A           	=	((aci->addrs_per_reg[0])	*	0x12)		;
	aci->NUM_SSDS_A            	=	((aci->addrs_per_reg[0])	*	0x13)		;
	aci->SSD_BITS_A            	=	((aci->addrs_per_reg[0])	*	0x14)		;
	aci->BCR_A   				=	((aci->addrs_per_reg[0]) 	*	0x15)		;
	aci->PRS_A   				=	((aci->addrs_per_reg[0]) 	*	0x16)		;
	aci->PRD_A   				=	((aci->addrs_per_reg[0]) 	*	0x17)		;
	aci->PRC_A   				=	((aci->addrs_per_reg[0]) 	*	0x18)		;
	aci->EDM_A   				=	((aci->addrs_per_reg[0]) 	*	0x19)		;
	aci->SDM_A   				=	((aci->addrs_per_reg[0]) 	*	0x1A)		;
	aci->CEM_A   				=	((aci->addrs_per_reg[0]) 	*	0x1B)		;
	aci->TDS_A   				=	((aci->addrs_per_reg[0]) 	*	0x1C)		;
	aci->XVC_A   				=	((aci->addrs_per_reg[0]) 	*	0x1D)		;
	aci->TTC_A   				=	((aci->addrs_per_reg[0]) 	*	0x1E)		;
	aci->RTC_A   				=	((aci->addrs_per_reg[0]) 	*	0x1F)		;
	aci->WEC_A   				=	((aci->addrs_per_reg[0]) 	*	0x20)		;
	aci->LEC_A   				=	((aci->addrs_per_reg[0]) 	*	0x21)		;
	aci->BIO_A   				=	((aci->addrs_per_reg[0]) 	*	0x22)		;
	aci->SSD_A   				=	((aci->addrs_per_reg[0]) 	*	0x23)		;
	aci->PFA_A   				=	((aci->addrs_per_reg[0]) 	*	0x24)		;
	aci->PASS_M   				=	0x80000000                         			;
	aci->EIRQ_M   				=	0x40000000                         			;
	aci->ERRL_M   				=	0x20000000                         			;
	aci->TSTC_M   				=	0x10000000                         			;
	aci->PSA_M    				=	0x08000000                         			;
	aci->PLLK_M   				=	0x04000000                         			;
	aci->PLLT_M   				=	0x02000000                         			;
	aci->PLLR_M   				=	0x01000000                         			;
	aci->CLA_M    				=	0x00800000                         			;
	aci->CLS_M    				=	0x00400000                         			;
	aci->IPS_M    				=	0x00000200                         			;
	aci->DBY_M    				=	0x00000100                         			;
	aci->DDV_M    				=	0x00000080                         			;
	aci->DWA_M    				=	0x00000040                         			;
	aci->DRD_M    				=	0x00000020                         			;
	aci->CER_M    				=	0x00000010                         			;
	aci->STRT_M   				=	0x00000008                         			;
	aci->ECB_M    				=	0x00000004                         			;
	aci->ECD_M    				=	0x00000002                         			;
	aci->RSN_M    				=	0x00000001                         			;
	aci->PASS_B    				=	31                                   		;
	aci->EIRQ_B    				=	30                                   		;
	aci->ERRL_B    				=	29                                   		;
	aci->TSTC_B    				=	28                                   		;
	aci->PSA_B     				=	27                                   		;
	aci->PLLK_B    				=	26                                   		;
	aci->PLLT_B    				=	25                                   		;
	aci->PLLR_B    				=	24                                   		;
	aci->CLA_B     				=	23                                   		;
	aci->CLS_B     				=	22                                   		;
	aci->IPS_B     				=	9                                    		;
	aci->DBY_B     				=	8                                    		;
	aci->DDV_B     				=	7                                    		;
	aci->DWA_B     				=	6                                    		;
	aci->DRD_B     				=	5                                    		;
	aci->CER_B     				=	4                                    		;
	aci->STRT_B    				=	3                                    		;
	aci->ECB_B     				=	2                                    		;
	aci->ECD_B     				=	1                                    		;
	aci->RSN_B     				=	0                                    		;
	aci->DC_LSB  				=	0                                    		;
	aci->DC_MSB  				=	2                                    		;
	aci->EQ_LSB  				=	3                                    		;
	aci->EQ_MSB  				=	6                                    		;
	aci->P0_LSB  				=	7                                    		;
	aci->P0_MSB  				=	11                                    		;
	aci->P1_LSB  				=	12                                   		;
	aci->P1_MSB  				=	16                                   		;
	aci->P2_LSB  				=	17                                   		;
	aci->P2_MSB  				=	21                                   		;
	aci->VOD_LSB 				=	22                                   		;
	aci->VOD_MSB 				=	24                                   		;
	aci->SLB_LSB 				=	31                                   		;
	aci->SLB_MSB 				=	31                                   		;
	aci->DC_LMSK   				=	0x7                                  		;
	aci->EQ_LMSK   				=	0xF                                  		;
	aci->P0_LMSK   				=	0x1F                                  		;
	aci->P1_LMSK   				=	0x1F                                  		;
	aci->P2_LMSK   				=	0x1F                                  		;
	aci->VOD_LMSK  				=	0x7                                  		;
	aci->SLB_LMSK  				=	0x1                                  		;
	aci->PB_LSB  				=	0                                    		;
	aci->PB_MSB  				=	7                                    		;
	aci->DIP_LSB 				=	8                                    		;
	aci->DIP_MSB 				=	15                                   		;
	aci->LED_LSB 				=	16                                   		;
	aci->LED_MSB 				=	23	                                 		;
	aci->DC_BITS   				= (aci->DC_MSB ) - (aci->DC_LSB ) + 1	;
	aci->EQ_BITS   				= (aci->EQ_MSB ) - (aci->EQ_LSB ) + 1	;
	aci->P0_BITS   				= (aci->P0_MSB ) - (aci->P0_LSB ) + 1	;
	aci->P1_BITS   				= (aci->P1_MSB ) - (aci->P1_LSB ) + 1	;
	aci->P2_BITS   				= (aci->P2_MSB ) - (aci->P2_LSB ) + 1	;
	aci->VOD_BITS  				= (aci->VOD_MSB) - (aci->VOD_LSB) + 1	;
	aci->PB_BITS   				= (aci->PB_MSB ) - (aci->PB_LSB ) + 1	;
	aci->DIP_BITS  				= (aci->DIP_MSB) - (aci->DIP_LSB) + 1	;
	aci->LED_BITS  				= (aci->LED_MSB) - (aci->LED_LSB) + 1	;      
  aci->base_address[0]   			= base_address                  ;
  aci->nios_width[0]     			= nios_width_dd;
  aci->bio_mask[0]         		=  bio_mask_dd; // 0x000fff0f         ;
  (void) reset_com(aci); 
  (void) aci_rw_regs_id_com(aci,DISPLAY_OFF,base_address,READ_S,ALL_S);  // Gets serial_channels, channel_width, etc
  aci->data_width[0]         		= (aci->serial_channels[0]) * (aci->channel_width[0])  ;
  //aci->data_word_packs[0]    		= (alt_u32) ceil(1.0 * (aci->data_width[0] )  / (aci->nios_width[0])); 
   aci->data_word_packs[0] = (aci->data_width[0]) / (aci->nios_width[0]);
   if ( ((aci->data_width[0]) % (aci->nios_width[0])) != 0)  {
     aci->data_word_packs[0] = aci->data_word_packs[0] + 1;
   }
  (void)  reset_com(aci);
  return 0;
}

// MEM:
int	reset_mem(struct aci_map_mem *aci)
{
  alt_u32   wr_data; 
  alt_u32   rd_data;
  // Reset DDR3 memory:
  // Remove GUI Code:
  
  
  
  IOWR(aci->base_address[0],aci->BIO_A,gpo_ddr3_global_reset_n);
  usleep(CONTROLLER_RST_DLY);
  IOWR(aci->base_address[0],aci->BIO_A,gpo_init); // Return lower 32 bits only (if wraps, PC will increment upper bits)                                     
  usleep(CONTROLLER_RST_DLY);
   IOWR(aci->base_address[0],aci->BIO_A,gpo_ddr3_soft_reset_n);
  usleep(CONTROLLER_RST_DLY);
  IOWR(aci->base_address[0],aci->BIO_A,gpo_init); // Return lower 32 bits only (if wraps, PC will increment upper bits)                                     
  usleep(CONTROLLER_RST_DLY); 
  
  ////IOWR(USB_GUI_INST_BASE,usb_gui_gpio_addr,usb_gui_gpio_nios_reset); // Return lower 32 bits only (if wraps, PC will increment upper bits)                                     
  ////usleep(CONTROLLER_RST_DLY);
  ////IOWR(USB_GUI_INST_BASE,usb_gui_gpio_addr,usb_gui_gpio_init); // Return lower 32 bits only (if wraps, PC will increment upper bits)                                     
  ////usleep(CONTROLLER_RST_DLY);
  // Turn off create error bit (if set)
  assert_bit(aci->base_address[0],aci->BCR_A,aci->CER_M,ASSERT_LO,LEVEL);  
  // Turn off start bit (if set)
  assert_bit(aci->base_address[0],aci->BCR_A,aci->STRT_M,ASSERT_LO,LEVEL);  
  //wr_data = ((~(aci->IPS_M | aci->DWA_M | aci->DRD_M | aci->CER_M | aci->STRT_M | aci->ECB_M | aci->ECD_M )) | (aci->RSN_M)); // Initialize Control Signals
  wr_data = ((~(aci->IPS_M | aci->CER_M | aci->STRT_M)) | (aci->RSN_M)); // Initialize Control Signals
  IOWR(aci->base_address[0],aci->BCR_A,wr_data);   
  IOWR(aci->base_address[0],aci->BIO_A,~0); // LEDs off drive high
  // Initialize SSD also
  assert_bit(aci->base_address[0],aci->BCR_A,aci->RSN_M,ASSERT_LO,PULSE); // Toggle bit to reset BTS,Data Errors will stop.
  rd_data = IORD(aci->base_address[0],aci->BCR_A); // Read BCR to clear EIRQ   
  
  IOWR(aci->base_address[0],aci->BIO_A,gpo_ddr3_global_reset_n);
  usleep(CONTROLLER_RST_DLY);
  IOWR(aci->base_address[0],aci->BIO_A,gpo_init); // Return lower 32 bits only (if wraps, PC will increment upper bits)                                     
  usleep(CONTROLLER_RST_DLY);
  IOWR(aci->base_address[0],aci->BIO_A,gpo_ddr3_soft_reset_n);
  usleep(CONTROLLER_RST_DLY);
  IOWR(aci->base_address[0],aci->BIO_A,gpo_init); // Return lower 32 bits only (if wraps, PC will increment upper bits)                                     
  usleep(CONTROLLER_RST_DLY); 
   
   
  // Remove GUI Code:
  ////IOWR(USB_GUI_INST_BASE,usb_gui_gpio_addr,usb_gui_gpio_nios_reset); // Return lower 32 bits only (if wraps, PC will increment upper bits)                                     
  ////usleep(CONTROLLER_RST_DLY);
  ////IOWR(USB_GUI_INST_BASE,usb_gui_gpio_addr,usb_gui_gpio_init); // Return lower 32 bits only (if wraps, PC will increment upper bits)                                     
  ////usleep(CONTROLLER_RST_DLY);  

  return  0;
} 

  int aci_rw_regs_id_mem (struct aci_map_mem *aci,alt_u32 display,alt_u32 base_address,char aci_rw[],char aci_regs[])  {
          if (display == DISPLAY_ON)
            {
#ifdef   ALT_DEBUG
                printf("\n%s %s Avalon Control Interface ID & Parameters:\n",aci_rw,aci_regs);
#endif                
                }
          // Get board parameters:  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,ADDRS_PER_REG_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->addrs_per_reg,READ_S,base_address,aci->ADDRS_PER_REG_A,1,1,          "Addresses Per Register      ","");}          
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID1_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id1,READ_S,base_address,aci->BTS_ID1_A,1,1,                "BTS ID1                    ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID2_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id2,READ_S,base_address,aci->BTS_ID2_A,1,1,                "BTS ID2                     ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID3_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id3,READ_S,base_address,aci->BTS_ID3_A,1,1,                "BTS ID3                     ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID4_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id4,READ_S,base_address,aci->BTS_ID4_A,1,1,                "BTS ID4                     ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID5_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id5,READ_S,base_address,aci->BTS_ID5_A,1,1,                "BTS ID5                     ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID6_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id6,READ_S,base_address,aci->BTS_ID6_A,1,1,                "BTS ID6                     ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID7_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id7,READ_S,base_address,aci->BTS_ID7_A,1,1,                "BTS ID7                     ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BTS_ID8_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->bts_id8,READ_S,base_address,aci->BTS_ID8_A,1,1,                "BTS ID8                     ","");}       
           if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,ID_WORDS_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->id_words,READ_S,base_address,aci->ID_WORDS_A,1,1,               "Words Per ID Field          ","");}        
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BOARD_ID_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->board_id,READSTR_S,base_address,aci->BOARD_ID_A,1,aci->id_words[0],"Board Identification        ","");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PORT_ID_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->port_id,READSTR_S,base_address,aci->PORT_ID_A,1,aci->id_words[0], "Port Identification         ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,GENERIC_ID_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->generic_id,READSTR_S,base_address,aci->GENERIC_ID_A,1,aci->id_words[0],"System Identification       ","");} 
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,MEM_WIDTHAD_A_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->mem_widthad_a,READ_S,base_address,aci->MEM_WIDTHAD_A_A,1,1,                                        "Data Memory Address Width   ","");}             
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,WAVEFORM_SELECT_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->waveform_select_width,READ_S,base_address,aci->WAVEFORM_SELECT_WIDTH_A,1,1,                        "Data Memory Select Width    ","");}              
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,DGEN_MEMORY_BASE_ADDRESS_WRITE_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->dgen_memory_base_address_write,READ_S,base_address,aci->DGEN_MEMORY_BASE_ADDRESS_WRITE_A,1,1,      "Write Memory Base Address   ","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,DGEN_MEMORY_BASE_ADDRESS_READ_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->dgen_memory_base_address_read,READ_S,base_address,aci->DGEN_MEMORY_BASE_ADDRESS_READ_A,1,1,        "Read Memory Base Address    ","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,ADDRS_PER_SEQ_LOG2_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->addrs_per_seq_log2,READ_S,base_address,aci->ADDRS_PER_SEQ_LOG2_A,1,1,                              "Addrs Per Sequencer Log2    ","");}                   
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SEQUENCER_PTR_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->sequencer_ptr_width,READ_S,base_address,aci->SEQUENCER_PTR_WIDTH_A,1,1,                            "Sequencer Pointer Width     ","");}                   
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,MEM_SEQUENCER_BASE_ADDRESS_WRITE_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->mem_sequencer_base_address_write,READ_S,base_address,aci->MEM_SEQUENCER_BASE_ADDRESS_WRITE_A,1,1,  "Write Sequencer Base Address","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,MEM_SEQUENCER_BASE_ADDRESS_READ_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->mem_sequencer_base_address_read,READ_S,base_address,aci->MEM_SEQUENCER_BASE_ADDRESS_READ_A,1,1,    "Read Sequencer Base Address ","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SEQUENCER_BURST_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->sequencer_burst_width,READ_S,base_address,aci->SEQUENCER_BURST_WIDTH_A,1,1,                        "Sequencer Burst Width      ","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,TYPE_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->type_width,READ_S,base_address,aci->TYPE_WIDTH_A,1,1,                                              "Sequencer Type Width       ","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,LOCAL_SIZE_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->local_size_width,READ_S,base_address,aci->LOCAL_SIZE_WIDTH_A,1,1,                                   "Local Memory Burst Width   ","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,LOCAL_SIZE_MAX_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->local_size_max,READ_S,base_address,aci->LOCAL_SIZE_MAX_A,1,1,                                       "Local Memory Burst Max     ","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,LOCAL_ADDR_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->local_addr_width,READ_S,base_address,aci->LOCAL_ADDR_WIDTH_A,1,1,                                   "Local Memory Address Width ","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,LOCAL_DATA_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->data_width,READ_S,base_address,aci->LOCAL_DATA_WIDTH_A,1,1,                                         "Local Memory Data Width    ","");}         
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,LOCAL_BE_WIDTH_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->local_be_width,READ_S,base_address,aci->LOCAL_BE_WIDTH_A,1,1,                                       "Local Byte Enable Width    ","");}         
          // Only diplay if component_type parameter length matches Board ID, Port ID, etc string length
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,COMPONENT_TYPE_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(DISPLAY_OFF,aci->component_type,READSTR_S,base_address,aci->COMPONENT_TYPE_A,1,aci->id_words[0],                     "Component Type             ","");}                
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,NUM_LANES_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->num_lanes,READ_S,base_address,aci->NUM_LANES_A,1,1,              "Error Lanes                 ","");}       
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,TEC_WORDS_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->tec_words,READ_S,base_address,aci->TEC_WORDS_A,1,1,              "Transaction Counter Words   ","");}  
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,NUM_SSDS_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->num_ssds,READ_S,base_address,aci->NUM_SSDS_A,1,1,               "Seven Segment Displays      ","");}              
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SSD_BITS_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->ssd_bits,READ_S,base_address,aci->SSD_BITS_A,1,1,               "Control Bits Per Segment    ","");}  
          return 0;
        }  
  
  int aci_rw_regs_mem (struct aci_map_mem *aci,alt_u32 display,alt_u32 base_address,char aci_rw[],char aci_regs[])  {
          if (display == DISPLAY_ON)
#ifdef   ALT_DEBUG
            {printf("\n%s %s Avalon Component:\n",aci_rw,aci_regs);}
#endif            
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BCR_S)==0)) && (strcmp(aci_rw,READ_S)==0)) // Only read status from BCR          
            io_bcr_mem(aci,base_address,aci->BCR_A);                                                        // Use ASSERT_LO and ASSERT_HI to modify register bits
          // At this point, all parameters & calculates should be available for the calls below:
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PRS_S)==0))                  
            {io_aci(display,aci->prs,aci_rw,base_address,aci->PRS_A,1,aci->data_word_packs[0], "PRS EPRBS Seed Register    ","");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PRD_S)==0)) && (strcmp(aci_rw,READ_S)==0))   
            {io_aci(display,aci->prd,aci_rw,base_address,aci->PRD_A,1,1,                     "PRD - PRBS Depth            ","");}
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PRC_S)==0))   
            {io_aci(display,aci->prc,aci_rw,base_address,aci->PRC_A,1,aci->data_word_packs[0],     "PRC - PRBS Coefficients     ","");}
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,EDM_S)==0))   
            {io_aci(display,aci->edm,aci_rw,base_address,aci->EDM_A,1,aci->data_word_packs[0],     "EDM - Error Detector Mask   ","");}                             
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SDM_S)==0))   
            {io_aci(display,aci->sdm,aci_rw,base_address,aci->SDM_A,1,aci->data_word_packs[0],     "SDM - Sync Detector Mask    ","");}
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,CEM_S)==0))   
            {io_aci(display,aci->cem,aci_rw,base_address,aci->CEM_A,1,aci->data_word_packs[0],     "CEM - Create Error Mask     ","");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,RTC_S)==0)) && (strcmp(aci_rw,READ_S)==0))            
            {io_aci(display,aci->rtc,aci_rw,base_address,aci->RTC_A,1,aci->tec_words[0],          "RTC ERD Transaction Counter","");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,TTC_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->ttc,aci_rw,base_address,aci->TTC_A,1,aci->tec_words[0],          "TTC EWR Transaction Counter","");}     
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,LEC_S)==0)) && (strcmp(aci_rw,READ_S)==0))          
            {io_aci(display,aci->lec,aci_rw,base_address,aci->LEC_A,aci->num_lanes[0],aci->tec_words[0],  "LEC - Lane Error Counter:   ","LEC");}
          if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,WEC_S)==0)) && (strcmp(aci_rw,READ_S)==0)) 
            {io_aci(display,aci->wec,aci_rw,base_address,aci->WEC_A,1,aci->tec_words[0],          "WEC - Word Error Counter    ","");}  
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,BIO_S)==0))      
            {io_bio_mem(aci,aci_rw,base_address,aci->BIO_A);} 
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SSD_S)==0))
            {io_aci(display,aci->ssd,aci_rw,base_address,aci->SSD_A,aci->num_ssds[0],1  ,         "SSD - Seven Segment Display: ","Display");} 
          if  ((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,PFA_S)==0))
            {io_pfa(aci_rw,base_address,aci->PFA_A);}        
           if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,SEQ_S))==0) && (strcmp(aci_rw,WRITE_S)==0))
            {io_seq_mem(aci);}
           if  (((strcmp(aci_regs,ALL_S)==0) || (strcmp(aci_regs ,MEM_S))==0) && (strcmp(aci_rw,WRITE_S)==0))
            {io_mem(aci);}                       
          return 0;
        }

// Initialize waveform memory
int io_mem_gui(struct aci_map_mem *aci)
{
    alt_u32   wave_ptr_addr;
    alt_u32   wave_sel;
    alt_u32   wave_sel_max;
    alt_u32   wave_ptr;
    alt_u32   wave_ptr_lpr;
    alt_u32   wave_ptr_upr;
    alt_u32   wave_ptr_max;
    alt_u32   wdata;
    alt_u32   byte_lane_max;
    alt_u32   byte_lane;
    alt_u32   word_lane;    // 4 bytes per NIOS write
    alt_u8    byte_data;
    alt_u8    byte_data1;
    alt_u8    byte_data2;
    alt_u8    byte_data3;
    alt_u8    byte_data4;
    alt_u32   wave_sel_lar;
    alt_u32   wave_sel_uar;
    if  (nios_width_dd != 32)
    {
#ifdef   ALT_DEBUG
      printf("Memory Input Only Supported For NIOS Data Width = 32\n");
#endif
      return 0;
    }

    wave_ptr_max    = 1<<(aci->mem_widthad_a[0]-aci->waveform_select_width[0]); // Indexed from 1  
    wave_sel_max    = 1<<aci->waveform_select_width[0];  // Indexed from 1     
    //wave_mem_depth  = 1<<aci->mem_widthad_a[0];     
    byte_lane_max = (aci->data_width[0]) >> 3;  // For replicated pattern
    wave_sel_lar  =   0;
    wave_sel_uar  =   wave_sel_max-1;        
#ifdef   ALT_DEBUG
    printf("Replicating Data Across %d Byte Lanes\n",byte_lane_max);    
#endif
    for (wave_sel=wave_sel_lar; wave_sel<=wave_sel_uar; wave_sel++)
    {
        byte_data = wave_sel & 0xff;
        for (wave_ptr=0; wave_ptr<wave_ptr_max; wave_ptr++)
        {
            byte_lane = 0;
            word_lane = 0;
            byte_data1  = byte_data;
            byte_data2  = byte_data1+1;
            byte_data3  = byte_data2+1;
            byte_data4  = byte_data3+1;
            while (byte_lane < byte_lane_max)
            {  
                wdata = byte_data1 + (byte_data2<<8) + (byte_data3<<16) + (byte_data4<<24);
                io_memory(aci,aci->dgen_memory_base_address_write[0],wave_sel,wave_ptr,word_lane,wdata);
                io_memory(aci,aci->dgen_memory_base_address_read[0],wave_sel,wave_ptr,word_lane,wdata);  
                byte_lane = byte_lane + 4;
                word_lane = word_lane + 1;
                byte_data1 = byte_data1 + 4;
                byte_data2 = byte_data2 + 4;
                byte_data3 = byte_data3 + 4;
                byte_data4 = byte_data4 + 4;                
            }
            byte_data++;
        }    
    }
}

int io_mem(struct aci_map_mem *aci)
{
    char      ch;
    char      line[8];
    alt_u32   wave_ptr_addr;
    alt_u32   wave_sel;
    alt_u32   wave_sel_max;
    alt_u32   wave_ptr;
    alt_u32   wave_ptr_lpr;
    alt_u32   wave_ptr_upr;
    alt_u32   wave_ptr_max;
    alt_u32   wdata;
    alt_u32   byte_lane_max;
    alt_u32   byte_lane;
    alt_u32   word_lane;    // 4 bytes per NIOS write
    alt_u8    byte_data;
    alt_u8    byte_data1;
    alt_u8    byte_data2;
    alt_u8    byte_data3;
    alt_u8    byte_data4;
    alt_u32   wave_sel_lar;
    alt_u32   wave_sel_uar;
    ch  = "";
    if  (nios_width_dd != 32)
    {
#ifdef   ALT_DEBUG
      printf("Memory Input Only Supported For NIOS Data Width = 32\n");
#endif
      return 0;
    }
    while (ch != 'Q')
    {
      wave_sel_max    = 1<<aci->waveform_select_width[0];  // Indexed from 1
      wave_ptr_max    = 1<<(aci->mem_widthad_a[0]-aci->waveform_select_width[0]); // Indexed from 1 
      //wave_mem_depth  = 1<<aci->mem_widthad_a[0];     
      byte_lane_max = (aci->data_width[0]) >> 3;  // For replicated pattern
#ifdef   ALT_DEBUG
      printf("Waveform Data Memory: Z>eroes, O>nes, R>eplicated, U>ser, Q>uit? ");
#endif
      fgets(line, sizeof(line), stdin);
      sscanf(line,"%c", &ch );
      switch  (ch)
      {
        case  'R':
        {
          get_data("Data Generator Lower Waveform Select",&wave_sel_lar,0,0,wave_sel_max-1);
          get_data("Data Generator Upper Waveform Select",&wave_sel_uar,wave_sel_max-1,wave_sel_lar,wave_sel_max-1);         
#ifdef   ALT_DEBUG
          printf("Replicating Data Across %d Byte Lanes\n",byte_lane_max);    
#endif
          for (wave_sel=wave_sel_lar; wave_sel<=wave_sel_uar; wave_sel++)
          {
            byte_data = wave_sel & 0xff;
            for (wave_ptr=0; wave_ptr<wave_ptr_max; wave_ptr++)
            {
              byte_lane = 0;
              word_lane = 0;
              byte_data1  = byte_data;
              byte_data2  = byte_data1+1;
              byte_data3  = byte_data2+1;
              byte_data4  = byte_data3+1;
              while (byte_lane < byte_lane_max)
              {  
                wdata = byte_data1 + (byte_data2<<8) + (byte_data3<<16) + (byte_data4<<24);
                io_memory(aci,aci->dgen_memory_base_address_write[0],wave_sel,wave_ptr,word_lane,wdata);
                io_memory(aci,aci->dgen_memory_base_address_read[0],wave_sel,wave_ptr,word_lane,wdata);  
                byte_lane = byte_lane + 4;
                word_lane = word_lane + 1;
                byte_data1 = byte_data1 + 4;
                byte_data2 = byte_data2 + 4;
                byte_data3 = byte_data3 + 4;
                byte_data4 = byte_data4 + 4;                
              }
              byte_data++;
            }
          }
          //io_seq_mem(aci);                   
          break;   
        }  
        case  'Z':
        {
#ifdef   ALT_DEBUG
          printf("Clearing Memory to All Zeroes\n");
#endif
          wdata = 0;
          for (wave_sel=0; wave_sel<=(1<<aci->waveform_select_width[0])-1; wave_sel++)
          {
            for (wave_ptr=0; wave_ptr<wave_ptr_max; wave_ptr++)
            {
              byte_lane = 0;
              word_lane = 0;
              while (byte_lane < byte_lane_max)
              { 
                io_memory(aci,aci->dgen_memory_base_address_write[0],wave_sel,wave_ptr,word_lane,wdata);
                io_memory(aci,aci->dgen_memory_base_address_read[0],wave_sel,wave_ptr,word_lane,wdata);  
                byte_lane = byte_lane + 4;
                word_lane = word_lane + 1;           
              }
            }
          }              
          break;   
        }              
        case  'O':
        {
#ifdef   ALT_DEBUG
          printf("Setting Memory to All Ones\n");
#endif
          wdata = 0xFFFFFFFF;
          for (wave_sel=0; wave_sel<=(1<<aci->waveform_select_width[0])-1; wave_sel++)
          {
            for (wave_ptr=0; wave_ptr<wave_ptr_max; wave_ptr++)
            {
              byte_lane = 0;
              word_lane = 0;
              while (byte_lane < byte_lane_max)
              { 
                io_memory(aci,aci->dgen_memory_base_address_write[0],wave_sel,wave_ptr,word_lane,wdata);
                io_memory(aci,aci->dgen_memory_base_address_read[0],wave_sel,wave_ptr,word_lane,wdata);                
                byte_lane = byte_lane + 4;
                word_lane = word_lane + 1;           
              }
            }
          }              
          break;   
        }                    
        case  'U':
        {
#ifdef   ALT_DEBUG
          printf("User Input\n"); 
#endif
          get_data("Data Generator Waveform Select",&wave_sel,0,0,(1<<aci->waveform_select_width[0])-1);
          get_data("Lower Waveform Pointer",&wave_ptr_lpr,0,0,wave_ptr_max-1);
          get_data("Upper Waveform Pointer",&wave_ptr_upr,wave_ptr_lpr,wave_ptr_lpr,wave_ptr_max-1);         
 
          for (wave_ptr=wave_ptr_lpr; wave_ptr<=wave_ptr_upr; wave_ptr++)
          {
            byte_lane = 0;
            word_lane = 0;
            while (byte_lane < byte_lane_max)
            { 
#ifdef   ALT_DEBUG
              printf("Enter 32 Bit Data Word=%0Xh  Waveform Ptr=%0Xh  Wave Select=%0Xh",word_lane,wave_ptr,wave_sel);
#endif
              get_data("",&wdata,0,0,0xffffffff);
              io_memory(aci,aci->dgen_memory_base_address_write[0],wave_sel,wave_ptr,word_lane,wdata);
              io_memory(aci,aci->dgen_memory_base_address_read[0],wave_sel,wave_ptr,word_lane,wdata);
              byte_lane = byte_lane + 4;
              word_lane = word_lane + 1;           
            }
          }              
          break;   
        }        
      } 
    }  
  //printf("Waveform Memory Base Address = %Xh\n",aci->dgen_memory_base_address_write[0]);
  return 0;
} 

int io_memory (struct aci_map_mem *aci,alt_u32 wave_base_addr,alt_u32 wave_sel,alt_u32 wave_ptr,alt_u32 word_lane,alt_u32 wdata)
{
  alt_u32 wave_ptr_addr;    
  alt_u32 wave_ptr_max;
  alt_u32 wave_base_addr4x;
  alt_u32 wave_mem_depth;
  wave_ptr_max      = 1<<(aci->mem_widthad_a[0]-aci->waveform_select_width[0]); // Indexed from 1               
  wave_ptr_addr     = wave_ptr + (wave_ptr_max*wave_sel); 
  wave_base_addr4x  = aci->base_address[0] + (4 * wave_base_addr);
  wave_mem_depth    = 1<<aci->mem_widthad_a[0]; 
  IOWR(wave_base_addr4x,4*((word_lane * wave_mem_depth)+wave_ptr_addr),wdata);
}

//int io_seq_mem_gui (struct aci_map_mem *aci,alt_u32 seq_mem_burst,alt_u8 data_type8,alt_u8 local_burst8)
int io_seq_mem_gui (struct aci_map_mem *aci,alt_u32 seq_mem_burst,
alt_u32   data_type, alt_u32   rw_restric, alt_u8 local_burst8){
    alt_u32   sequencer_ptr;
    alt_u32   sequencer_ptr_lar         = 0;
    alt_u32   sequencer_ptr_uar;    
    alt_u32   sequencer_burst_length    = 0;    // Use write all / read all into the sequencer
    alt_u32   local_addr_start          = 0;
    alt_u32   local_burst_length;
    alt_u32   local_transaction_length;
    //alt_u32   rw_type;
    alt_u32   address_type              = UP_BURST;
//    alt_u32   data_type;
    alt_u32   waveform_selector;
    alt_u32   waveform_sel_min          = 0;
    alt_u32   waveform_sel_max;
    alt_u32   waveform_periodor         =  0;   
    // New stuff for QDRII
    char      mem_s[8];   // For QDRII memory
    alt_u8    mem_l;
    //alt_u8    d_q_bus_type; // Assume RLDRAM or DDR2 or DDR3
    alt_u32   rw_type_we;     // Write sequencer even and odd entries
    alt_u32   rw_type_wo;
    alt_u32   rw_type_re;
    alt_u32   rw_type_ro;
 
 
    // Start: This should be recoded to simplfy:  just compare component_type = "QDRII"
    mem_s[0] = (aci->component_type[1]>> 0)&0xff;
    mem_s[1] = (aci->component_type[0]>>24)&0xff;
    mem_s[2] = (aci->component_type[0]>>16)&0xff;
    mem_s[3] = (aci->component_type[0]>> 8)&0xff;
    mem_s[4] = (aci->component_type[0]>> 0)&0xff;
    mem_s[5]  = '\0';
    
   
    if (strcmp(mem_s,QDRII_S)==0)   // QDRII - Dedicated write and read sequencers:
    {           
        //d_q_bus_type    = SEPARATE_DQ;
        rw_type_we              = WRITE;
        rw_type_wo              = WRITE;
        rw_type_re              = READ;
        rw_type_ro              = READ;
    } else {    // Simple bursting on shared DQ buses, WRITE / READ / WRITE /READ
        //d_q_bus_type    = SHARED_DQ;
        switch( rw_restric){
            case 2: rw_type_we =   WRITE;
                           rw_type_wo =   WRITE;
                           rw_type_re =   WRITE;
                           rw_type_ro =   WRITE; 
                            break;
            case 3: rw_type_we =   READ; 
                           rw_type_wo =   READ;
                           rw_type_re =   READ;
                           rw_type_ro =   READ; 
                            break;
            default : rw_type_we = WRITE; 
                             rw_type_wo = READ;
                             rw_type_re = WRITE;
                             rw_type_ro = READ;
                            break;
        }
    }    
    if  ((local_burst8 > 0) && (local_burst8 <= aci->local_size_max[0]))
    {
        local_burst_length      = local_burst8;    // Best performance max local burst size
    } else {
        local_burst_length      = aci->local_size_max[0];    // Best performance max local burst size
    }

    local_transaction_length    = seq_mem_burst;             // GUI or this driver should check this is < local_burst_size * memory address range
    waveform_sel_max            = (1<<aci->waveform_select_width[0])-1; 
    waveform_selector           = waveform_sel_min;
    //data_type                   = data_type8;
    sequencer_ptr_uar           = (1<<aci->sequencer_ptr_width[0])-2; // -2 since write, then read
#ifdef   ALT_DEBUG
    printf("local_trans_length = %d   local_burst_length = %d\n",local_transaction_length,local_burst_length);
    printf("Setting Memory Sequencer[%Xh:%Xh] Burst Size = %Xh  Data Type = %Xh",sequencer_ptr_lar,sequencer_ptr_uar,seq_mem_burst,data_type);
#endif
    for (sequencer_ptr=sequencer_ptr_lar; sequencer_ptr<=sequencer_ptr_uar; sequencer_ptr=sequencer_ptr+2)
    {
        // write sequence
        //rw_type =   WRITE;  // write_req
        // NOTE, on DDR2 & DDR3, read_req and write_req, addresses come, and write side datagen advance from the write sequencer
        //                       waveform select for read side datagen advance for read comes from the read sequencer
        io_sequencer_mem(aci,aci->mem_sequencer_base_address_write[0],sequencer_ptr,sequencer_burst_length,local_addr_start,local_burst_length,local_transaction_length,rw_type_we,address_type,data_type,waveform_selector,waveform_periodor);
        io_sequencer_mem(aci,aci->mem_sequencer_base_address_read[0],sequencer_ptr,sequencer_burst_length,local_addr_start,local_burst_length,local_transaction_length,rw_type_re,address_type,data_type,waveform_selector,waveform_periodor); 
        // read sequence
        //rw_type =   READ;   // read_req
        io_sequencer_mem(aci,aci->mem_sequencer_base_address_write[0],sequencer_ptr+1,sequencer_burst_length,local_addr_start,local_burst_length,local_transaction_length,rw_type_wo,address_type,data_type,waveform_selector,waveform_periodor);
        io_sequencer_mem(aci,aci->mem_sequencer_base_address_read[0],sequencer_ptr+1,sequencer_burst_length,local_addr_start,local_burst_length,local_transaction_length,rw_type_ro,address_type,data_type,waveform_selector,waveform_periodor); 
        if (waveform_selector == waveform_sel_max)  {
            waveform_selector = waveform_sel_min; // Wrap arounnd 
        } else {
            waveform_selector = waveform_selector + 1; 
        }
    }      
}

int io_seq_mem(struct aci_map_mem *aci)
{
  alt_u32   sequencer_ptr;
  alt_u32   sequencer_ptr_lar;  // lower address range
  alt_u32   sequencer_ptr_uar;  // upper address range 
// Sequencer Registers
  alt_u32   sequencer_burst_length;
  alt_u32   local_addr_start;
  alt_u32   local_burst_length;
  alt_u32   local_transaction_length;
  alt_u32   local_transaction_events;
  alt_u32   rw_type;

  alt_u32   address_type;
  alt_u32   data_type;
  alt_u32   waveform_selector;
  alt_u32   waveform_sel_min;
  alt_u32   waveform_sel_max;
  alt_u32   waveform_periodor;
  alt_u32   rd_data;
  // New stuff for QDRII
  char      mem_s[8];   // For QDRII memory
  alt_u8    mem_l;
  alt_u8    d_q_bus_type; // Assume RLDRAM or DDR2 or DDR3


#ifdef   ALT_DEBUG
  printf("Initializing %d Memory Sequencer Locations\n",1<<aci->sequencer_ptr_width[0]);
#endif
  // Start: This should be recoded to simplfy:  just compare component_type = "QDRII"
  mem_s[0] = (aci->component_type[1]>> 0)&0xff;
  mem_s[1] = (aci->component_type[0]>>24)&0xff;
  mem_s[2] = (aci->component_type[0]>>16)&0xff;
  mem_s[3] = (aci->component_type[0]>> 8)&0xff;
  mem_s[4] = (aci->component_type[0]>> 0)&0xff;
  mem_s[5]  = '\0';
  if (strcmp(mem_s,QDRII_S)==0)
  {
    d_q_bus_type    = SEPARATE_DQ;
  } else {
    d_q_bus_type    = SHARED_DQ; 
  }
  // End
  
  // get_data arguments:  Display String, Data, Data Init, Data Min, Data Max
#ifdef   ALT_DEBUG
  printf("Memory Sequencer - Press ENTER For [Default Value]\n");
#endif
  get_data("Memory Sequencer Lower Address Range",&sequencer_ptr_lar,0,0,(1<<aci->sequencer_ptr_width[0])-1);
  get_data("Memory Sequencer Upper Address Range",&sequencer_ptr_uar,(1<<aci->sequencer_ptr_width[0])-1,sequencer_ptr_lar,(1<<aci->sequencer_ptr_width[0])-1);
#ifdef   ALT_DEBUG
  printf("Entering Data for Memory Sequencer Addresses %Xh Through %Xh\n",sequencer_ptr_lar,sequencer_ptr_uar);
#endif
  get_data("Local Memory Start Address",&local_addr_start,0,0,(1<<aci->local_addr_width[0])-1);
  // Init to one full memory access (actual register width is nios_width in the RTL code)
  get_data("Local Memory Burst Size",&local_burst_length,aci->local_size_max[0],1,(1<<aci->local_size_width[0])-1);
  if (d_q_bus_type == SEPARATE_DQ) {
#ifdef   ALT_DEBUG
    printf("Separate D and Q Buses --> D Sequencer Set to WRITE and Q Sequencer Set to READ\n");
#endif
    sequencer_burst_length = 0; // sequencer Bursting Disabled Except for Write/Read
  } else {
  get_data("R/W Type (0=NONE 1=WRITE 2=READ 3=WRITE/READ)",&rw_type,3,0,3);
    if (rw_type != WVR) {
#ifdef   ALT_DEBUG
    printf("\tSequencer Bursting Disabled for R/W Type=%d\n",rw_type);
#endif
    sequencer_burst_length = 0; // sequencer Bursting Disabled Except for Write/Read
  } else {
    get_data("Memory Sequencer Burst Length (0=Off)",&sequencer_burst_length,(1<<aci->sequencer_burst_width[0])-1,0,(1<<aci->sequencer_burst_width[0])-1); 
  }
  }
  get_data("Address Type (0=NONE 1=UP BURST 2=UP INC 3=DOWN BURST 4=DOWN DEC 5=SHIFT RT 6=SHIFT LT 7=ROTATE RT 8=ROTATE LT)",&address_type,1,1,8);
  get_data("Data Type (1=PRBS 2=MEMORY 3=MATH)",&data_type,1,1,3); 
  get_data("Waveform/Math Function Select Min Range",&waveform_sel_min,0,0,(1<<aci->waveform_select_width[0])-1);
  waveform_selector = waveform_sel_min;
  get_data("Waveform/Math Function Select Max Range",&waveform_sel_max,(1<<aci->waveform_select_width[0])-1,waveform_sel_min,(1<<aci->waveform_select_width[0])-1);
#ifdef   ALT_DEBUG
  printf("To Turn Off Periodicity For PRBS & Math Functions Set Waveform Period=0\n");
#endif
  if  (data_type == 2) { // Memory default to a full period
    get_data("Waveform Period",&waveform_periodor,(1<<((aci->mem_widthad_a[0])-(aci->waveform_select_width[0])))-1,0,(1<<((aci->mem_widthad_a[0])-(aci->waveform_select_width[0])))-1);   
  } else {
    get_data("Waveform Period",&waveform_periodor,0,0,(1<<((aci->mem_widthad_a[0])-(aci->waveform_select_width[0])))-1);
  }
  get_data("Local Memory Transaction Events",&local_transaction_events,0x10000,0,(((1<<nios_width_dd)-1)/(1+(local_burst_length * 2 * (sequencer_burst_length+1))))); 
  if  (sequencer_burst_length == 0) {
    local_transaction_length  = local_transaction_events * local_burst_length * 1;
  } else { // *2 for WVR mode
    local_transaction_length  = local_transaction_events * local_burst_length * 2 * sequencer_burst_length;   
  }  
#ifdef   ALT_DEBUG
  printf("Local Transaction Length = %Xh",local_transaction_length);
#endif
  for (sequencer_ptr=sequencer_ptr_lar; sequencer_ptr<=sequencer_ptr_uar; sequencer_ptr++)
  {
    if (d_q_bus_type == SEPARATE_DQ) {
        io_sequencer_mem(aci,aci->mem_sequencer_base_address_write[0],sequencer_ptr,sequencer_burst_length,local_addr_start,local_burst_length,local_transaction_length,WRITE,address_type,data_type,waveform_selector,waveform_periodor);
        io_sequencer_mem(aci,aci->mem_sequencer_base_address_read[0],sequencer_ptr,sequencer_burst_length,local_addr_start,local_burst_length,local_transaction_length,READ,address_type,data_type,waveform_selector,waveform_periodor); 
    } else {
    io_sequencer_mem(aci,aci->mem_sequencer_base_address_write[0],sequencer_ptr,sequencer_burst_length,local_addr_start,local_burst_length,local_transaction_length,rw_type,address_type,data_type,waveform_selector,waveform_periodor);
    io_sequencer_mem(aci,aci->mem_sequencer_base_address_read[0],sequencer_ptr,sequencer_burst_length,local_addr_start,local_burst_length,local_transaction_length,rw_type,address_type,data_type,waveform_selector,waveform_periodor); 
    }
    if (waveform_selector == waveform_sel_max)  {
      waveform_selector = waveform_sel_min; // Wrap arounnd 
    } else {
      waveform_selector = waveform_selector + 1; 
    }
  }  
}

int io_sequencer_mem(struct aci_map_mem *aci,alt_u32 sequencer_base_address,alt_u32 sequencer_ptr,alt_u32 sequencer_burst_length,alt_u32 local_addr_start,alt_u32 local_burst_length,alt_u32 local_transaction_length,alt_u32 rw_type,alt_u32 address_type,alt_u32 data_type,alt_u32 waveform_selector,alt_u32 waveform_periodor)
{
    alt_u32 sequencer_base_address4x;
    alt_u32 sequencer_ptr_x4;
    sequencer_base_address4x  = aci->base_address[0] + (sequencer_base_address * 4);
    sequencer_ptr_x4  = sequencer_ptr * 4;   
    IOWR(sequencer_base_address4x,(aci->SEQUENCER_BURST_LENGTH_A)+sequencer_ptr_x4,sequencer_burst_length);
    IOWR(sequencer_base_address4x,(aci->LOCAL_ADDR_START_A)+sequencer_ptr_x4,local_addr_start); 
    IOWR(sequencer_base_address4x,(aci->LOCAL_BURST_LENGTH_A)+sequencer_ptr_x4,local_burst_length);
    IOWR(sequencer_base_address4x,(aci->LOCAL_TRANSACTIONS_LENGTH_A)+sequencer_ptr_x4,local_transaction_length);
    IOWR(sequencer_base_address4x,(aci->RW_TYPE_A)+sequencer_ptr_x4,rw_type);
    IOWR(sequencer_base_address4x,(aci->ADDRESS_TYPE_A)+sequencer_ptr_x4,address_type);
    IOWR(sequencer_base_address4x,(aci->DATA_TYPE_A)+sequencer_ptr_x4,data_type);   
    IOWR(sequencer_base_address4x,(aci->WAVEFORM_SELECTOR_A)+sequencer_ptr_x4,waveform_selector);
    IOWR(sequencer_base_address4x,(aci->WAVEFORM_PERIODOR_A)+sequencer_ptr_x4,waveform_periodor);
}




int io_bio_mem(struct aci_map_mem *aci,char aci_rw[],alt_u32 base_address, alt_u32 map_address)
{       
  alt_u32 rd_data;
#ifdef   ALT_DEBUG
  printf("\t%s BIO EBoard Input/Output:\n",aci_rw);   
#endif
  if  (strcmp(aci_rw,READ_S)==0)
  {
    rd_data = IORD(base_address, map_address); 
    // Timing issue in avalon control interface?
    // These are pseudo-static signals, shouldn't have any timing issue
    // calling same iord twice.  May want to register the pb, dip, & led
    rd_data = IORD(base_address, map_address); 
    rd_data = rd_data & bio_mask_dd; // Turn off unused bits
    aci->bio[0] = rd_data;
#ifdef   ALT_DEBUG
    printf("\t\tPB[7:0] \t=\t%X%X%X%X%X%X%X%Xb\n",  // Looks like binary format
            (rd_data>> 7)&1,(rd_data>> 6)&1,(rd_data>> 5)&1,(rd_data>> 4)&1,(rd_data>> 3)&1,(rd_data>> 2)&1,(rd_data>> 1)&1,(rd_data>> 0)&1);
    printf("\t\tDIP[7:0]\t=\t%X%X%X%X%X%X%X%Xb\n",
            (rd_data>>15)&1,(rd_data>>14)&1,(rd_data>>13)&1,(rd_data>>12)&1,(rd_data>>11)&1,(rd_data>>10)&1,(rd_data>> 9)&1,(rd_data>> 8)&1);
    printf("\t\tLED[7:0]\t=\t%X%X%X%X%X%X%X%Xb\n",
            (rd_data>>23)&1,(rd_data>>22)&1,(rd_data>>21)&1,(rd_data>>20)&1,(rd_data>>19)&1,(rd_data>>18)&1,(rd_data>>17)&1,(rd_data>>16)&1);               
#endif
  }
  return  0;        
}

  int io_bcr_mem(struct aci_map_mem *aci,alt_u32 base_address,alt_u32 map_address)
  {
    alt_u32   rd_data;
    rd_data = IORD(base_address, map_address); 
    aci->bcr[0] = rd_data;          
#ifdef   ALT_DEBUG
    printf("\tBCR - Base Control Register:\n");
    //printf("\t\tFull Register         \tBCR \t=\t%Xh\n",rd_data);
    printf("\t\tReset                 \tRSN \t=\t%X\n",(rd_data>> aci->RSN_B)  &1);
    printf("\t\tStart Data            \tSTRT\t=\t%X\n",(rd_data>> aci->STRT_B) &1);  
    printf("\t\tCreate Error          \tCER \t=\t%X\n",(rd_data>> aci->CER_B)  &1);                                     
    printf("\t\tInitialize PRBS Seed  \tIPS \t=\t%X\n",(rd_data>> aci->IPS_B)  &1);
    printf("\t\tPLLs Locked           \tPLLK\t=\t%X\n",(rd_data>> aci->PLLK_B) &1);  
    printf("\t\tPattern Sync Acquired \tPSA \t=\t%X\n",(rd_data>> aci->PSA_B)  &1);
    printf("\t\tTest Complete         \tTSTC\t=\t%X\n",(rd_data>> aci->TSTC_B) &1); 
    printf("\t\tError Latch           \tERRL\t=\t%X\n",(rd_data>> aci->ERRL_B) &1);
    printf("\t\tError IRQ             \tEIRQ\t=\t%X\n",(rd_data>> aci->EIRQ_B) &1);           
    printf("\t\tPass/Fail             \tPASS\t=\t%X\n",(rd_data>> aci->PASS_B) &1); 
#endif
    return  0;
  };

int init_aci_mem(alt_u32 *port_type,struct aci_map_mem *aci,alt_u32 base_address)
{ 
  *port_type = MEM;
  alt_u32 addrs_per_seq;  
	aci->addrs_per_reg[0]			  =	addrs_per_reg_d;	// This must match the avalon component!
  //aci->addrs_per_seq_log2[0]  = addrs_per_seq_log2_d;
	aci->BTS_ID1_A       		=	((aci->addrs_per_reg[0])	*	0x00)		;
	aci->BTS_ID2_A       		=	((aci->addrs_per_reg[0])	*	0x01)		;
	aci->BTS_ID3_A       		=	((aci->addrs_per_reg[0])	*	0x02)		;
	aci->BTS_ID4_A       		=	((aci->addrs_per_reg[0])	*	0x03)		;
	aci->BTS_ID5_A       		=	((aci->addrs_per_reg[0])	*	0x04)		;
	aci->BTS_ID6_A       		=	((aci->addrs_per_reg[0])	*	0x05)		;
	aci->BTS_ID7_A       		=	((aci->addrs_per_reg[0])	*	0x06)		;
	aci->BTS_ID8_A       		=	((aci->addrs_per_reg[0])	*	0x07)		;
	aci->BOARD_ID_A        		=	((aci->addrs_per_reg[0])	*	0x08)		;
	aci->PORT_ID_A       		=	((aci->addrs_per_reg[0])	*	0x09)		;
	aci->GENERIC_ID_A      		=	((aci->addrs_per_reg[0])	*	0x0A)		;
	aci->ADDRS_PER_REG_A   		=	((aci->addrs_per_reg[0])	*	0x0B)		; 
	aci->ID_WORDS_A        		=	((aci->addrs_per_reg[0])	*	0x0C)		; 
	aci->NUM_LANES_A           	=	((aci->addrs_per_reg[0])	*	0x11)		;
	aci->TEC_WORDS_A           	=	((aci->addrs_per_reg[0])	*	0x12)		;
	aci->NUM_SSDS_A            	=	((aci->addrs_per_reg[0])	*	0x13)		;
	aci->SSD_BITS_A            	=	((aci->addrs_per_reg[0])	*	0x14)		;
	aci->BCR_A   				=	((aci->addrs_per_reg[0]) 	*	0x15)		;
	aci->PRS_A   				=	((aci->addrs_per_reg[0]) 	*	0x16)		;
	aci->PRD_A   				=	((aci->addrs_per_reg[0]) 	*	0x17)		;
	aci->PRC_A   				=	((aci->addrs_per_reg[0]) 	*	0x18)		;
	aci->EDM_A   				=	((aci->addrs_per_reg[0]) 	*	0x19)		;
	aci->SDM_A   				=	((aci->addrs_per_reg[0]) 	*	0x1A)		;
	aci->CEM_A   				=	((aci->addrs_per_reg[0]) 	*	0x1B)		;
	aci->TTC_A   				=	((aci->addrs_per_reg[0]) 	*	0x1E)		;
	aci->RTC_A   				=	((aci->addrs_per_reg[0]) 	*	0x1F)		;
	aci->WEC_A   				=	((aci->addrs_per_reg[0]) 	*	0x20)		;
	aci->LEC_A   				=	((aci->addrs_per_reg[0]) 	*	0x21)		;
	aci->BIO_A   				=	((aci->addrs_per_reg[0]) 	*	0x22)		;
	aci->SSD_A   				=	((aci->addrs_per_reg[0]) 	*	0x23)		;
	aci->PFA_A   				=	((aci->addrs_per_reg[0]) 	*	0x24)		;
  aci->MEM_WIDTHAD_A_A                      = ((aci->addrs_per_reg[0])  * 0x40)   ;
  aci->SEQUENCER_PTR_WIDTH_A                = ((aci->addrs_per_reg[0])  * 0x41)   ;  
  aci->WAVEFORM_SELECT_WIDTH_A              = ((aci->addrs_per_reg[0])  * 0x42)   ;
  aci->MEM_SEQUENCER_BASE_ADDRESS_WRITE_A   = ((aci->addrs_per_reg[0])  * 0x43)   ;   
  aci->MEM_SEQUENCER_BASE_ADDRESS_READ_A    = ((aci->addrs_per_reg[0])  * 0x44)   ; 
  aci->DGEN_MEMORY_BASE_ADDRESS_WRITE_A     = ((aci->addrs_per_reg[0])  * 0x45)   ; 
  aci->DGEN_MEMORY_BASE_ADDRESS_READ_A      = ((aci->addrs_per_reg[0])  * 0x46)   ; 
  aci->SEQUENCER_BURST_WIDTH_A              = ((aci->addrs_per_reg[0])  * 0x47)   ;
  aci->TYPE_WIDTH_A                         = ((aci->addrs_per_reg[0])  * 0x48)   ;
  aci->LOCAL_SIZE_WIDTH_A                   = ((aci->addrs_per_reg[0])  * 0x49)   ;
  aci->LOCAL_ADDR_WIDTH_A                   = ((aci->addrs_per_reg[0])  * 0x4A)   ;
  aci->LOCAL_DATA_WIDTH_A                   = ((aci->addrs_per_reg[0])  * 0x4B)   ;
  aci->LOCAL_BE_WIDTH_A                     = ((aci->addrs_per_reg[0])  * 0x4C)   ;  
  aci->COMPONENT_TYPE_A                     = ((aci->addrs_per_reg[0])  * 0x4D)   ;
  aci->ADDRS_PER_SEQ_LOG2_A                 = ((aci->addrs_per_reg[0])  * 0x4E)   ;
  aci->LOCAL_SIZE_MAX_A                     = ((aci->addrs_per_reg[0])  * 0x4F)   ;  
	aci->PASS_M   				=	0x80000000                         			;
	aci->EIRQ_M   				=	0x40000000                         			;
	aci->ERRL_M   				=	0x20000000                         			;
	aci->TSTC_M   				=	0x10000000                         			;
	aci->PSA_M    				=	0x08000000                         			;
	aci->PLLK_M   				=	0x04000000                         			;
	aci->IPS_M    				=	0x00000200                         			;
	aci->CER_M    				=	0x00000010                         			;
	aci->STRT_M   				=	0x00000008                         			;
	aci->RSN_M    				=	0x00000001                         			;
	aci->PASS_B    				=	31                                   		;
	aci->EIRQ_B    				=	30                                   		;
	aci->ERRL_B    				=	29                                   		;
	aci->TSTC_B    				=	28                                   		;
	aci->PSA_B     				=	27                                   		;
	aci->PLLK_B    				=	26                                   		;
	aci->IPS_B     				=	9                                    		;
	aci->CER_B     				=	4                                    		;
	aci->STRT_B    				=	3                                    		;
	aci->RSN_B     				=	0                                    		;
	aci->PB_LSB  				=	0                                    		;
	aci->PB_MSB  				=	7                                    		;
	aci->DIP_LSB 				=	8                                    		;
	aci->DIP_MSB 				=	15                                   		;
	aci->LED_LSB 				=	16                                   		;
	aci->LED_MSB 				=	23	                                 		;
	aci->PB_BITS   				= (aci->PB_MSB ) - (aci->PB_LSB ) + 1	;
	aci->DIP_BITS  				= (aci->DIP_MSB) - (aci->DIP_LSB) + 1	;
	aci->LED_BITS  				= (aci->LED_MSB) - (aci->LED_LSB) + 1	;      
  aci->base_address[0] 	= base_address                  ;
  aci->nios_width[0]    = nios_width_dd;
  aci->bio_mask[0]       =  bio_mask_dd; // 0x000fff0f 
  (void) reset_mem(aci);
  (void) aci_rw_regs_id_mem(aci,DISPLAY_OFF,base_address,READ_S,ALL_S);  // Gets serial_channels, channel_width, addrs_per_seq_log2 etc
  // aci->data_word_packs[0]    		= (alt_u32) ceil(1.0 * (aci->data_width[0] )  / (aci->nios_width[0])); 
   aci->data_word_packs[0] = (aci->data_width[0]) / (aci->nios_width[0]);
   if ( ((aci->data_width[0]) % (aci->nios_width[0])) != 0)  {
     aci->data_word_packs[0] = aci->data_word_packs[0] + 1;
   }  
  addrs_per_seq                             = 1<<(aci->addrs_per_seq_log2[0]);
  aci->SEQUENCER_BURST_LENGTH_A             = (addrs_per_seq * 0x00);
  aci->LOCAL_ADDR_START_A                   = (addrs_per_seq * 0x01);
  aci->LOCAL_BURST_LENGTH_A                 = (addrs_per_seq * 0x02);
  aci->LOCAL_TRANSACTIONS_LENGTH_A          = (addrs_per_seq * 0x03);
  aci->RW_TYPE_A                            = (addrs_per_seq * 0x04);
  aci->ADDRESS_TYPE_A                       = (addrs_per_seq * 0x05);
  aci->DATA_TYPE_A                          = (addrs_per_seq * 0x06);
  aci->WAVEFORM_SELECTOR_A                  = (addrs_per_seq * 0x07);
  aci->WAVEFORM_PERIODOR_A                  = (addrs_per_seq * 0x08);
  (void)  reset_mem(aci);
  return 0;
}



// memory set for user defined pattern
int io_mem_gui_user(struct  aci_map_mem *aci, alt_u32   wdata){
    alt_u32   wave_sel;
    alt_u32   wave_ptr;
    alt_u32   wave_ptr_max;
    alt_u32   byte_lane_max;
    alt_u32   byte_lane;
    alt_u32   word_lane;    // 4 bytes per NIOS write

      wave_ptr_max    = 1<<(aci->mem_widthad_a[0]-aci->waveform_select_width[0]); // Indexed from 1 
      byte_lane_max = (aci->data_width[0]) >> 3;  // For replicated pattern
    
  for (wave_sel=0; wave_sel<=(1<<aci->waveform_select_width[0])-1; wave_sel++)
  {
    for (wave_ptr=0; wave_ptr<wave_ptr_max; wave_ptr++)
    {
      byte_lane = 0;
      word_lane = 0;
      while (byte_lane < byte_lane_max)
      { 
        io_memory(aci,aci->dgen_memory_base_address_write[0],wave_sel,wave_ptr,word_lane,wdata);
        io_memory(aci,aci->dgen_memory_base_address_read[0],wave_sel,wave_ptr,word_lane,wdata);
        byte_lane = byte_lane + 4;
        word_lane = word_lane + 1;
      }
    }
  }
}

// Remove GUI Code:
int usb_gui_mem(struct  aci_map_mem *aci)
{
    return 0;
}

