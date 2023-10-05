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
  cli.h:
  Header file to support cli.c. All defines, data types,
  and function prototypes used in cli.c should be declared here.
*/

#ifndef _CLI_H_
#define _CLI_H_

#endif //_CLI_H_

#include <stdio.h>
#include <string.h>
#include "system.h"
#include "alt_types.h"
#include "bts_defs.h"

#include "sys/alt_irq.h"
#include "io.h"
#include <unistd.h>

void cli(char cli_string[],int *exit);
void handle_sc_interrupts(void* context, alt_u32 id);
void handle_hb_interrupts(void* context, alt_u32 id);
alt_u32 readTimer();


struct cli_struct{
  alt_u32   port;
  alt_u32   port_com;
  alt_u32   port_mem;
  alt_u32   port_type[num_ports_dd];
};
void setPort(struct cli_struct *);
void factory_test_mem_gui(struct aci_map_mem *aci);
void check_loopbackcard();