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
  bts_test.c:
  Implements functions which perform BTS tests, such as a loopback
  test on a specific interface, ddr2 memory test, etc.
*/

#include  "bts_test.h"

// COM:
int factory_test_com(struct aci_map_com *aci)
{
  (void) reset_com(aci);  
  (void) comma_detect_com(aci);
  (void) enable_channel_bond_com(aci);
  (void) start_com(aci);   
  usleep(FACTORY_DLY);
  (void) aci_rw_regs_com(aci,DISPLAY_ON,aci->base_address[0],READ_S,BCR_S); 
  return  0;
}

int optimize_xcvrs_com(struct aci_map_com *aci)
{
  alt_u8  done_flag = 0;
  int     A = 0;
  
  while (done_flag  ==  0)
  {
    // Establish link & send bonded word data
   (void) reset_com(aci);  
   (void) comma_detect_com(aci);
   (void) enable_channel_bond_com(aci);
   (void) start_com(aci);   
    // Measure error rate
   (void)  aci_rw_regs_com(aci,DISPLAY_ON,aci->base_address[0],READ_S,LEC_S);
   // Change VOD, Preemphasis, & RX Equalization
   (void)  aci_rw_regs_com(aci,DISPLAY_ON,aci->base_address[0],READ_S,XVC_S);    
   // If error rate is low enough, set done_flag = 1
   
    printf("optimized vod3 @ %d = %Xh\n",A,aci->xvc_vod[3]);
    if  (A == 0)
    {
      printf("Channel Optimization Timed Out\n");
      done_flag = 2;   
    }
    A = A + 1;
  }
  return  0;
}             

// Enable Comma Detect (RX)
int comma_detect_com(struct aci_map_com *aci)
{
  assert_bit(aci->base_address[0],aci->BCR_A,aci->ECD_M,ASSERT_HI,PULSE);
  return  0;
}

// Enable Channel Bond (RX)
int enable_channel_bond_com(struct aci_map_com *aci)
{
  assert_bit(aci->base_address[0],aci->BCR_A,aci->ECB_M,ASSERT_HI,PULSE);
  return  0;
}  

// Start Transmitting PRBS Data (TX)
int start_com(struct aci_map_com *aci)
{
  assert_bit(aci->base_address[0],aci->BCR_A,aci->STRT_M,ASSERT_HI,PULSE); 
  //assert_bit(aci->base_address[0],aci->BCR_A,aci->STRT_M,ASSERT_LO,LEVEL); // Deassert if set   
  //usleep(PB_OFF);     
  //assert_bit(aci->base_address[0],aci->BCR_A,aci->STRT_M,ASSERT_HI,LEVEL);
  return  0;
}  

// Create Error In the PRBS Data (TX)
int create_error_com(struct aci_map_com *aci)
{
  assert_bit(aci->base_address[0],aci->BCR_A,aci->CER_M,ASSERT_LO,LEVEL);
  usleep(PB_ER);    
  assert_bit(aci->base_address[0],aci->BCR_A,aci->CER_M,ASSERT_HI,LEVEL);
  return  0;
} 

// MEM
// Enable Comma Detect (RX)
int factory_test_mem(struct aci_map_mem *aci)
{   
  (void) reset_mem(aci);  
  (void) start_mem(aci);   
  usleep(FACTORY_DLY); 
  (void) aci_rw_regs_mem(aci,DISPLAY_ON,aci->base_address[0],READ_S,BCR_S); 
  return  0;
}


// Start Transmitting PRBS Data (TX)
int start_mem(struct aci_map_mem *aci)
{
  assert_bit(aci->base_address[0],aci->BCR_A,aci->STRT_M,ASSERT_LO,LEVEL); // Deassert if set   
  usleep(PB_OFF);       
  assert_bit(aci->base_address[0],aci->BCR_A,aci->STRT_M,ASSERT_HI,LEVEL);
  return  0;
}  

// Create Error In the PRBS Data (TX)
int create_error_mem(struct aci_map_mem *aci)
{
  assert_bit(aci->base_address[0],aci->BCR_A,aci->CER_M,ASSERT_LO,LEVEL);
  usleep(PB_ER);     
  assert_bit(aci->base_address[0],aci->BCR_A,aci->CER_M,ASSERT_HI,LEVEL);
  return  0;
} 



