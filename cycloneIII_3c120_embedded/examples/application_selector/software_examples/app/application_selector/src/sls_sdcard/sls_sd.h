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

#include "debug.h"


#undef HAVE_MULTIVOLUME

#ifdef HAVE_MULTIVOLUME
#define IF_MV(x) x /* optional volume/drive parameter */
#define IF_MV2(x,y) x,y /* same, for a list of arguments */
#define IF_MV_NONVOID(x) x /* for prototype with sole volume parameter */
#define NUM_VOLUMES 2
#else /* empty definitions if no multi-volume */
#define IF_MV(x)
#define IF_MV2(x,y)
#define IF_MV_NONVOID(x) void
#define NUM_VOLUMES 1
#endif

#define SWAP_WORDS

// Little Endian
#define SWAB16(x) (x)
#define SWAB32(x) (x)

#define USE_INTERRUPT

int sls_sd_init(void);
int sls_sd_read_sectors(IF_MV2(int drive,)
                     unsigned long start,
                     int incount,
                     void* inbuf);
int sls_sd_write_sectors(IF_MV2(int drive,)
                      unsigned long start,
                      int count,
                      const void* buf);

