/*****************************************************************************
 *  File: app_selector.h
 * 
 *  This file contains the constants, structure definitions, and funtion
 *  prototypes for the application selector.
 *
 ****************************************************************************/

#ifndef APP_SELECTOR_H_
#define APP_SELECTOR_H_

#include "alt_video_display.h"
#include "alt_tpo_lcd.h"
#include "alt_touchscreen.h"
#include "sys/alt_flash_dev.h"
#include "sd_card.h"


#define ALT_VIDEO_DISPLAY_COLS 800
#define ALT_VIDEO_DISPLAY_ROWS 480
#define ALT_VIDEO_DISPLAY_COLOR_DEPTH 32
#define ALT_VIDEO_DISPLAY_SGDMA_NAME LCD_SGDMA_NAME

#define NUM_VIDEO_FRAMES 2


// Flash memory map
// =====================================================
// Offset                Contents
// =====================================================
// 0x0000000 - 0x001FFFF   Application Boot Code
// 0x0020000 - 0x003FFFF   HW Image Catalog
// 0x0040000 - 0x00FFFFF   Unused
// 0x0100000 - 0x023FFFF   Selector SW Image
// 0x0240000 - 0x1BFFFFF   Application SW Image
// 0x1C00000 - 0x1FFFFFF   Reserved
// 0x2000000 - 0x237FFFF   Selector HW Image
// 0x2380000 - 0x3BFFFFF   Application HW Images (7)
// 0x3C00000 - 0x3FBFFFF   Unused
// 0x3FC0000 - 0x3FDFFFF   Ethernet Option Bits
// 0x3FE0000 - 0x3FE0080   PFL Option Bits


#define AS_FLASH_SECTOR_SIZE            0x20000  //128KB
#define AS_SIZE_3C120_SOF               3571462
#define AS_SECTORS_FOR_HW_IMAGE         ((AS_SIZE_3C120_SOF / AS_FLASH_SECTOR_SIZE) + 1)
#define AS_BYTES_FOR_HW_IMAGE           (AS_SECTORS_FOR_HW_IMAGE * AS_FLASH_SECTOR_SIZE)

#define AS_FLASH_IMAGE_CATALOG_OFFSET   0x20000
#define AS_FLASH_IMAGE_CATALOG_SIZE     0x20000
#define AS_FIRST_APP_HW_IMAGE_PAGE      1
#define AS_APP_HW_IMAGE_OFFSET_START    0x2380000
#define AS_APP_HW_IMAGE_OFFSET_END      0x3BFFFFF
#define AS_MAX_FLASH_PAGES              ((AS_APP_HW_IMAGE_OFFSET_END - AS_APP_HW_IMAGE_OFFSET_START) / AS_BYTES_FOR_HW_IMAGE)

#define AS_APP_SW_IMAGE_OFFSET          0x0240000

#define AS_SELECTOR_HW_IMAGE_OFFSET     0x2000000
#define AS_SELECTOR_SW_IMAGE_OFFSET     0x0100000

#define USE_HAL_FLASH_DRIVER            1
#define USE_SPANSION_FLASH_DRIVER       0

#define AS_SREC_BUFFER_SIZE             0x20000

// These are the bit masks for the MAXII reconfiguation register
#define AS_MAXII_CLEAR_PSR_MASK         0xFFFFFE3F
#define AS_MAXII_CLEAR_PSO_MASK         0xFFFFFDFF
#define AS_MAXII_FORCE_RECONFIG_MASK    0x00000004


// Error Codes
#define AS_SUCCESS                      0
#define AS_FAILURE                     -1
#define AS_ERROR_FAT_FAILED_TO_MOUNT   -2
#define AS_ERROR_FAT_COULD_NOT_FIND    -3
#define AS_ERROR_FAT_READ_ZERO_BYTES   -4
#define AS_ERROR_SREC_HAS_NO_TIMESTAMP -5
#define AS_ERROR_COULD_NOT_ALLOCATE    -6

#define AS_MAX_SDCARD_APPS              40

// Main menu actions
#define AS_ACTION_NONE                  0
#define AS_ACTION_LOAD_APP              1
#define AS_ACTION_DISPLAY_APP_INFO      2
#define AS_ACTION_APP_SELECTOR_EXIT     3

// Confirm Window actions
#define AS_ACTION_CANCEL                0
#define AS_ACTION_OK                    1

#define AS_IMAGE_NOT_IN_FLASH          -1

// Filetypes
#define AS_FLASH                        1
#define AS_RBF                          2

#define AS_FILE_BUFFER_SIZE AS_FLASH_SECTOR_SIZE
#define AS_SDCARD_APP_DIRECTORY "/altera_3C120_apps"

typedef struct {
  unsigned int image_offset;
  unsigned char type;
  unsigned int image_length;
  unsigned int image_crc;
  unsigned int hw_filename;
  unsigned int sw_filename;
  unsigned int directory;
  char app_name[64];
} app_info;

typedef struct {
  app_info apps[AS_MAX_SDCARD_APPS];
  int num_apps;
  int target_app;
  int action;  
} app_list_struct;


void ASInitialTask(void* pdata);

void AsInitLCD( alt_video_display *lcd_display, alt_video_frame frame_buffers[] );
void AsInitTouchPanel( alt_touchscreen *touchscreen );
int AsInitTpoLcd( alt_tpo_lcd* lcd_serial );
int AsLoadAppFromSDCard( char app_to_import[], 
                      alt_video_display* display,
                      alt_touchscreen* touchscreen );
int AsFindAppsOnSD( app_list_struct* sd_app_list );
int AsSDCheckForFlashFiles( char dirname[] );
int AsGetFileExtension( char filename[], char file_ext[] );  
int AsMemBlocksOverlap( unsigned int base1,
                        unsigned int length1, 
                        unsigned int base2,
                        unsigned int length2 );          
int AsFindSpotInFlashForEntity( int entity_length, app_list_struct* app_list );
int AsCopyFileFromSDCardToFlash( char filename[], 
                                 int flash_dest, 
                                 alt_video_display* display,
                                 alt_touchscreen* touchscreen,
                                 void* prog_window,
                                 int* total_bytes_complete,
                                 int total_bytes );
int AsReconfigFPGA( unsigned int hw_flash_page );
int AsGetFullFileName( char* filename, char* filenamepart, sdcard_dir_listing* dir_listing );
int AsGetFileSize( char* filename );
char* AsGetInfoText( char app_name[] );
int AsGetSRECTimestamp( char* hw_filename );
int AsFindFlashLocationForHWImage( void );
int AsRecordHWImageInZSFACatalog( int hw_offset, int timestamp );
int AsFindHWImageInFlash( int timestamp );
int AsRefreshCatalog( void );
int AsInfoTxtFileExists( char app_name[] );
int ASFatLongNameMap( char shortname[], char longname[] );
void ASls( void );
unsigned int AsConvertFlashPageToOffset( unsigned int hw_flash_page );
void As_InitializePFLOptionBits( unsigned int option_bit_offset );

#endif /*APP_SELECTOR_H_*/
