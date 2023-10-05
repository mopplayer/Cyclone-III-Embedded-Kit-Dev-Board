/*****************************************************************************
 *  File: reconfig_utils.h
 *
 *  This file contains the constants, structure definitions, and funtion
 *  prototypes for the application selector.
 *
 ****************************************************************************/

#ifndef APP_SELECTOR_H_
#define APP_SELECTOR_H_

#include "sys/alt_flash_dev.h"

//#define DEBUG_MODE 1 // debugging help
//#define UPDATE_PFL 1 // option to keep or update PFL OPTION BITS
//  lcd = fopen(LCD_DISPLAY_NAME, "w");
//

#define ALT_VIDEO_DISPLAY_COLS 800
#define ALT_VIDEO_DISPLAY_ROWS 480
#define ALT_VIDEO_DISPLAY_COLOR_DEPTH 32
#define ALT_VIDEO_DISPLAY_SGDMA_NAME LCD_SGDMA_NAME

#define NUM_VIDEO_FRAMES 2

#define FLASH_SECTOR_SIZE            0x20000	//128KB
#define FLASH_BOOT_BLOCK_SECTOR_SIZE 0x08000	//32KB
#define HW_IMAGE_SIZE                0x36EBE7	// CIII 0x36EBE7
#define SECTORS_FOR_HW_IMAGE         ((HW_IMAGE_SIZE / FLASH_SECTOR_SIZE) + 1) //
#define BYTES_FOR_HW_IMAGE           (SECTORS_FOR_HW_IMAGE * FLASH_SECTOR_SIZE)

/****************************************************************
  Flash Memory Map - for details see the User Guide Appendix A.
****************************************************************/

#define FACTORY_HW_IMAGE_PAGE        0
#define FACTORY_HW_IMAGE_OFFSET      0x00000000
#define FACTORY_SW_IMAGE_OFFSET      0x01180000

#define USER1_HW_IMAGE_PAGE          1
#define USER1_HW_IMAGE_OFFSET        0x00380000

#define USER_SW_IMAGE_OFFSET        0x01500000

#define USER2_HW_IMAGE_PAGE          2
#define USER2_HW_IMAGE_OFFSET        0x00700000

#define RO_ZIPFS_OFFSET              0x01880000
#define ETHERNET_OPTION_BITS         0x03FC0000
#define PFL_OPTION_BIT_OFFSET        0x03FE0000

#define SREC_BUFFER_SIZE             0x00020000

// These are the 16bit masks for the MAXII reconfiguation 32bit registers:
#define MAXII_CLEAR_PSR_MASK         0xFFFFFFFE // 1110 | 0
#define MAXII_CLEAR_PSO_MASK         0xFFFFFFFD // 1101 | 1
#define MAXII_FORCE_RECONFIG_MASK    0x0000000B // 1011 | B
#define MAXII_CLEAR_PSS_MASK         0xFFFFFFF7 // 0111 | 3

#define MAXII_RSU_REG  			0x8 // MAXII_REG

#define PAGE_USER				1	// NIOS_PIO_PAGE_SELECT_BASE
#define SRST					0	// NIOS_PIO_RECONFIGURE_N_BASE

#define USE_HAL_FLASH_DRIVER            0
#define USE_INTEL_P30_FLASH_DRIVER      1

// Error Codes
#define SUCCESS                      0
#define FAILURE                     -1
#define ERROR_FAT_FAILED_TO_MOUNT   -2
#define ERROR_FAT_COULD_NOT_FIND    -3
#define ERROR_FAT_READ_ZERO_BYTES   -4
#define ERROR_SREC_HAS_NO_TIMESTAMP -5
#define ERROR_COULD_NOT_ALLOCATE    -6

// Filetypes
#define FLASH                        1
#define RBF                          2

#define FILE_BUFFER_SIZE FLASH_SECTOR_SIZE

int ReconfigFPGA( unsigned int hw_flash_page );
void InitializePFLOptionBits( unsigned int option_bit_offset );

#endif /*APP_SELECTOR_H_*/
