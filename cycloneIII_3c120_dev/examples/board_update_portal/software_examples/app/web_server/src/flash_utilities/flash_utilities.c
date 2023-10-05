/******************************************************************************
* Copyright © 2006 Altera Corporation, San Jose, California, USA.             *
* All rights reserved. All use of this software and documentation is          *
* subject to the License Agreement located at the end of this file below.     *
*
* Filename:  flash_utilities.c
* Purpose:  Utilities for programming the flash.
*
* Functions:  GetFlashName, ProgFlash
*
* Program Flow:  ProgFlash() is passed
*      1.  a flash type (CFI or EPCS)
*      2.  a target_addr ("start" address for flash programming)
*      3.  a pointer to a data buffer
*      4.  the length of the data buffer
*      ProgFlash calls GetFlashName() to determine the name of the flash,
*      opens the flash for programming, erases the block (if necessary)
*      and writes the data to the flash.
*
* NOTE:  Because this code uses the HAL flash layer the details of writing to
* CFI or EPCS flash are hidden.
*/

#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <alt_types.h>
#include <io.h>
#include <system.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <fcntl.h>

#include "system.h"
#include "sys/alt_flash.h"
#include "sys/alt_flash_dev.h"

/* Use the existence of the LCD i2c to determine if we desire the Intel P30 flash
 * routines.
 */
#ifndef LCD_I2C_SCL_NAME
#include "flash_utilities.h"
#else
#include "flash_utilities.h"
//#include "flash_intel_p30/flash_intel_p30.h"
#endif

int current_flash_block;

/******************************************************************
*  Function: GetFlashName
*
*  Purpose: Very simple function which returns either appropriate
*           strings for CFI or EPCS for Nios II Development Boards.
*           Defaults to "/dev/ext_flash", the name of the flash
*           component in the Nios II example designs.
*
******************************************************************/
static int GetFlashName(char line[30], int flash_type)
{
  if (flash_type == CFI)
  {
    strcpy(line, "/dev/ext_flash\0");
  }
  else if (flash_type == EPCS)
  {
    strcpy(line, "/dev/epcs_controller\0");
  }

  return 0;
}

/******************************************************************
*  Function: ProgFlash
*
*  Purpose: This function asks for the name of a flash device,
*  a pointer to a data buffer, and the size of the data buffer.
*
******************************************************************/
int ProgFlash(int flash_type, int target_addr,
                     char* data, int data_len)
{

  // Flash device variables
  alt_flash_fd* fd;
  int number_of_regions;
  int block_size;
  int rgn_ctr = 0;
  flash_region* regions;
  alt_u8 flashname[30];
  int new_flash_block = UNINITIALIZED;
  int erase_flash_block = UNINITIALIZED;

  // General purpose variables
  unsigned int sw_offset = 0;
  int ret_code = 0x0;

  ret_code = GetFlashName(flashname, flash_type);

  fd = alt_flash_open_dev(flashname);
  if (fd)
  {
    /* Get some useful info about the flash */
    ret_code = alt_get_flash_info(fd, &regions, &number_of_regions);
    /* To which flash block is the SREC data destined? */
    /* new_flash_block = target_addr / regions->block_size; */
    /* Ahhh, but what happens if a line spans the end of one block and the
     * beginning of another?
     *  - Better to handle this case well...as well!
     */
    if( number_of_regions == 1 )
    {
      block_size = regions->block_size;
    }
    else
    {
      /* Determine flash erase region, and region's block size. */
      while( rgn_ctr <= (number_of_regions-1) )
      {
        if( (target_addr >= regions[rgn_ctr].offset) &&
            (target_addr <= (regions[rgn_ctr].offset + regions[rgn_ctr].region_size)))
        {
          block_size = regions[rgn_ctr].block_size;
        }
        rgn_ctr++;
      }
    }
    new_flash_block = (target_addr + data_len) / block_size;
    erase_flash_block = (target_addr) / block_size;
    //printf( "\nFlash Name is %s.\nBlock size is %d bytes.\n\nProgramming Flash...\n", flashname, block_size );//mike
    if( current_flash_block == 0 )
    {
      /* Output various flash information when programming the first line. */
      //printf( "\nFlash Name is %s.\nBlock size is %d bytes.\n\nProgramming Flash...\n", flashname, block_size );
      //alt_erase_flash_block(fd, ((new_flash_block-1) * block_size), block_size);
    }

    /* if it's a new block, we need to erase it first. */
    if(new_flash_block != current_flash_block)
    {
      //printf("\nFlash Block %d", new_flash_block);
      //printf("\nBlockSize %d", block_size);

      /* Blindly erase the new flash block */

      alt_erase_flash_block(fd, ((erase_flash_block) * block_size), block_size);
      alt_erase_flash_block(fd, ((new_flash_block) * block_size), block_size);
      //printf("\nErase Block\n");

      current_flash_block = new_flash_block;
    }
    //printf("Target addr = 0x%x.\n", target_addr );

    alt_write_flash_block(fd, (current_flash_block * block_size), target_addr, data, data_len);

    /* This just gives us some zippy dots so we know hard work is being done */
    if ((target_addr - sw_offset) % (block_size / 8) < data_len)
    {
      //printf("\n 0x%8.8X: ", (target_addr & 0xFFFFFF00));
    }
  }
  else
  {
    printf("Error Opening flash device. Exiting.");
  }
  alt_flash_close_dev(fd);

  return (ret_code);
}


/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2006 Altera Corporation, San Jose, California, USA.           *
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
