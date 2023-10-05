/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2005 System Level Solutions India Pvt. Ltd.                   *
* All rights reserved.                                                        *
*																			  *
* As per SD card association rules,SD card access flow through our SD Host    *
* controller API  can not be opened                                  	      *
******************************************************************************/
#include <unistd.h>
#include <system.h>
#include <io.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sls_sd.h"
#include "sdhc.h"

extern struct sls_sd_card sd_info;

int sls_sd_init(void)
{
    int ret;
    sd_info.tx_time_out  = SLS_SD_HOST_TX_TIMEOUT ;
    sd_info.rx_time_out  = SLS_SD_HOST_RX_TIMEOUT ;
    sd_info.cmd_time_out = SLS_SD_HOST_CMD_TIMEOUT ;
    sd_info.power_window = SLS_SD_VDD_SUPPORT ;
//    sd_info.sdhc_clock   = 1000000;
    ret=sdhc_init(&sd_info,sd_info.base,sd_info.irq);
    if(sdhc_mode_select(&sd_info,SLS_SD_HOST_BUS_4BIT_BUS) < 0){
        printf("Error:Failed to set 4Bit bus mode\n");
     }
    if( ret == 0 )
       return ret;
    else
       return -1;
}

#define DEFAULT_BLOCK_SIZE 512
int sls_sd_read_sectors(IF_MV2(int drive,)
                     unsigned long start,
                     int incount,
                     void* inbuf)
{
   if( ((unsigned int)inbuf & 0x3) == 0 )   {
      sdhc_read(&sd_info,start,incount,(unsigned char *)inbuf);
   } else {
      unsigned char *buffer = NULL;
      buffer = malloc ( incount * DEFAULT_BLOCK_SIZE);
      if( buffer ){
         sdhc_read(&sd_info,start,incount,(unsigned char *)buffer);
         memcpy(inbuf,buffer,incount * DEFAULT_BLOCK_SIZE);
         free(buffer);
     }
     else
      return -1;
   }
   return 0;
}

int sls_sd_write_sectors(IF_MV2(int drive,)
                      unsigned long start,
                      int count,
                      const void* buf)
{
   if( ((unsigned int)buf & 0x3) == 0 ) {
      sdhc_write(&sd_info,start,count,(unsigned char *)buf);
   } else {
      unsigned char *buffer = NULL;
      buffer = malloc ( count * DEFAULT_BLOCK_SIZE);
      if( buffer ){
         memcpy(buffer,buf,count * DEFAULT_BLOCK_SIZE);
         sdhc_write(&sd_info,start,count,(unsigned char *)buffer);
         free(buffer);
     }
     else
      return -1;
   }


   return 0;
}
