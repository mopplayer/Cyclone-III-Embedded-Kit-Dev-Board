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
  bts_defs.h:
  Contains defines used to configure executable-wide options, such as system
  constants, which version of the CLI to use, or what version of a driver to use
*/

#ifndef _BTS_DEFS_H_
#define _BTS_DEFS_H_

#endif //_BTS_DEFS_H_


// Set for each BTS System:
#define addrs_per_reg_d       0x00000200  
// Enables for Board I/O: Top 8 bits unused [00], 8 LEDs [ff], DIPs [ff], 4 PBs [0f]
#define bio_mask_dd        0x00ffff0f
#define num_com_ports         0
#define num_mem_ports         2  
// Normally set port_lo to 0 
// Normally port_lo is 0, and port_hi is num_ports_dd
// Otherwise, if a memory or communications component doesn't exist,
//   1) Set port_lo & port_hi to the range of existing components.
//		A) If 0 com ports, set port_lo=1 & port_hi=port_lo + num_mem_ports - 1
//      B) If 0 mem ports, set port_lo=0 & port_hi=port_lo + num_com_ports - 1 
//   2) Set num_ports_dd_com = max{1,num_com_ports} [IDE doesn't like "0" size structures
//   3) Set num_ports_dd_mem = max{1,num_mem_ports}  Define a structure, even if a mem or com component doesn't exist]
#define port_lo               1
#define port_hi               port_lo + num_mem_ports - 1   
#define num_ports_dd_com      1
#define num_ports_dd_mem      2
#define num_ports_dd          (num_ports_dd_com + num_ports_dd_mem)
#define port_com_lo           0
#define port_com_hi           (num_ports_dd_com - 1)
#define port_mem_lo           (port_com_hi + 1)
#define port_mem_hi           (port_mem_lo + num_ports_dd_mem - 1)
// Define Port Types:
#define COM                     1
#define MEM                     2 
// Memory Sequencer:
// Read/Write Types:
#define NONE                    0
#define WRITE                   1
#define READ                    2
#define WVR                     3
// Address Types:
//#define   NONE_A              0
#define UP_BURST                1
#define UP_INC                  2
#define DOWN_BURST              3
#define DOWN_DEC                4
#define SHIFT_RT                5
#define SHIFT_LT                6
#define ROTATE_RT               7
#define ROTATE_LT               8
// Data Types
#define PRBS                    1
#define MEMORY                  2
#define MATH                    3
// Reset
#define PULSE                   1
#define LEVEL                   2
#define QDRII_S                 "QDRII"
// DDR2 & DDR3 SDRAM:
#define SHARED_DQ               0
// QDRII
#define SEPARATE_DQ             1

// USB GUI NIOS Component:
// Used by GUI to align FTDI FIFO - BTS NIOS onto a word boundary
#define gui_align_byte                   0x05
// Sent by GUI (on 1 of 4 byte boundarys to word alignment)
#define gui_align_word                   0x01020304
// Sent by GUI after word alignment is established
#define gui_link_established             0xFFFFFFFF
#define usb_gui_rwdata_addr              0x00
#define usb_gui_ready_nios_read_addr     0x04
#define usb_gui_ready_nios_write_addr    0x08
#define usb_gui_write_timer_addr         0x0C
#define usb_gui_gpio_addr                0x10
#define usb_gui_gpio_init                0x00000000
#define usb_gui_gpio_nios_reset          0x00000001
// LOOK AT INIT
//   aci->LED_LSB                =   16                                          ;
//   aci->LED_MSB                =   23                                          ;
#define gpo_ddr3_global_reset_n            0xFFFEFFFF
#define gpo_ddr3_soft_reset_n              0xFFFDFFFF
#define gpo_init                           0xFFFFFFFF

// Using this will cause the MAX to switch to embedded blaster mode,
// and reconfigure the FPGA and terminate this program:
#define usb_gui_gpio_emb_blaster         0x00000002
// BTS System Identification Strings:
// MEM & COM Shared:
#define BTS_ID1_S       		"BTS_ID1"
#define BTS_ID2_S       		"BTS_ID2"
#define BTS_ID3_S       		"BTS_ID3" 
#define BTS_ID4_S       		"BTS_ID4"
#define BTS_ID5_S       		"BTS_ID5"
#define BTS_ID6_S       		"BTS_ID6"
#define BTS_ID7_S       		"BTS_ID7"
#define BTS_ID8_S       		"BTS_ID8"
#define BOARD_ID_S        		"BOARD_ID"
#define PORT_ID_S       		"PORT_ID"
#define GENERIC_ID_S      		"GENERIC_ID"
#define ADDRS_PER_REG_S   		"ADDRS_PER_REG"
#define ID_WORDS_S        		"ID_WORDS"

#define NUM_LANES_S           	"NUM_LANES"
#define TEC_WORDS_S           	"TEC_WORDS"
#define NUM_SSDS_S            	"NUM_SSDS"
#define SSD_BITS_S              "SSD_BITS"
// BTS Hardware Control:        
#define BCR_S  					"BCR"
#define PRS_S  					"PRS"
#define PRD_S  					"PRD"
#define PRC_S  					"PRC"
#define EDM_S  					"EDM"
#define SDM_S  					"SDM"
#define CEM_S  					"CEM"                                                                                                                                                       
#define TTC_S  					"TTC"
#define RTC_S  					"RTC"
#define WEC_S  					"WEC"
#define LEC_S  					"LEC"
#define BIO_S  					"BIO"
#define SSD_S  					"SSD"
#define PFA_S  					"PFA"                
// COM Specific
#define MAP_DPRIO_S       		"MAP_DPRIO"
#define XCVR_DATA_SKEW_WIDTH_S	"XCVR_DATA_SKEW_WIDTH"
#define SERIAL_CHANNELS_S     	"SERIAL_CHANNELS"
#define CHANNEL_WIDTH_S       	"CHANNEL_WIDTH"                              
#define TDS_S  					"TDS"
#define XVC_S  					"XVC"
// MEM Specific
#define	MEM_WIDTHAD_A_S							"MEM_WIDTHAD_A"						
#define SEQUENCER_PTR_WIDTH_S					"SEQUENCER_PTR_WIDTH"	
#define ADDRS_PER_SEQ_LOG2_S          "ADDRS_PER_SEQ_LOG2"			
#define WAVEFORM_SELECT_WIDTH_S					"WAVEFORM_SELECT_WIDTH"				
#define MEM_SEQUENCER_BASE_ADDRESS_WRITE_S		"MEM_SEQUENCER_BASE_ADDRESS_WRITE"	
#define	MEM_SEQUENCER_BASE_ADDRESS_READ_S		"MEM_SEQUENCER_BASE_ADDRESS_READ"	
#define DGEN_MEMORY_BASE_ADDRESS_WRITE_S	    "DGEN_MEMORY_BASE_ADDRESS_WRITE"	
#define DGEN_MEMORY_BASE_ADDRESS_READ_S			"DGEN_MEMORY_BASE_ADDRESS_READ"		
#define	SEQUENCER_BURST_WIDTH_S					"SEQUENCER_BURST_WIDTH"				
#define TYPE_WIDTH_S						    "TYPE_WIDTH"						
#define LOCAL_SIZE_WIDTH_S						"LOCAL_SIZE_WIDTH"
#define LOCAL_SIZE_MAX_S              "LOCAL_SIZE_MAX"					
#define LOCAL_ADDR_WIDTH_S						"LOCAL_ADDR_WIDTH"					
#define	LOCAL_DATA_WIDTH_S						"LOCAL_DATA_WIDTH"					
#define	LOCAL_BE_WIDTH_S                     	"LOCAL_BE_WIDTH"                    
#define COMPONENT_TYPE_S					    "COMPONENT_TYPE"	
#define SEQ_S                         "SEQ"
#define MEM_S                         "MEM"				
#define DISPLAY_ON    1
#define DISPLAY_OFF   0
// Assert Value
#define ASSERT_LO   0
#define ASSERT_HI   1
//#define PB_ON       100000 --- com
//#define PB_OFF      100000
//#define PB_ON       100    --- mem
//#define PB_OFF      100
#define PB_ON                   100000
#define PB_OFF                  1000
// Deassert error trigger, then assert
#define PB_ER                   100000
#define CONTROLLER_RST_DLY      10000
#define INSTR_ECHO_DELAY        100000
#define FACTORY_DLY             500000



// Required:
#define nios_width_dd          32



// Make defines for structure memory allocation large enough to accomodate any design
// COM Specific:
#define serial_channels_dd     32
#define channel_width_dd       32
// MEM & COM Shared:
//#define num_lanes_dd           serial_channels_dd
// Eg:  For DDR2 x 72 with avalon, there are 72*4/8 lanes (if one LEC for each byte lane)
#define num_lanes_dd           72
#define tec_words_dd           2

#define num_ssds_dd            16
#define ssd_bits_dd            16
//COM #define data_width_dd          serial_channels_dd * channel_width_dd
//MEM #define data_width_dd          288
//#define data_width_dd				(9 * nios_width_dd)
#define data_width_dd           16 * nios_width_dd
// Make an integer:
#define data_word_packs_dd     data_width_dd / nios_width_dd   
#define id_words_dd            16


#define READ_S          "Read"
#define WRITE_S         "Write"
#define READSTR_S       "ReadStr"
#define ALL_S           "ALL"
  


struct aci_map_com
 {
	// Main Avalon Control Interface BTS Hardware Control Registers:
    alt_u32	bcr[1];
    alt_u32	prs[data_word_packs_dd];
    alt_u32	prd[1];
    alt_u32	prc[data_word_packs_dd];
    alt_u32	edm[data_word_packs_dd];
    alt_u32	sdm[data_word_packs_dd];
    alt_u32	cem[data_word_packs_dd];
    alt_u32	tds[serial_channels_dd];
    alt_u8	xvc_dc[serial_channels_dd];
    alt_u8	xvc_eq[serial_channels_dd]; 
    alt_u8	xvc_p0[serial_channels_dd];
    alt_u8	xvc_p1[serial_channels_dd];
    alt_u8	xvc_p2[serial_channels_dd];
    alt_u8	xvc_vod[serial_channels_dd];                                   
    alt_u8	xvc_slb[serial_channels_dd];
    alt_u32 ttc[tec_words_dd];
    alt_u32 rtc[tec_words_dd];
    alt_u32 wec[tec_words_dd];              // tec_words register width
    alt_u32 lec[num_lanes_dd*tec_words_dd];   // tec_words register width
    alt_u32 bio[1];
    alt_u8  ssd[num_ssds_dd];    // ssd_bits register width
    alt_u32 pfa[1];
	// BTS System Identification:
	alt_u32 bts_id1[1]; 
  	alt_u32 bts_id2[1];
  	alt_u32 bts_id3[1];
  	alt_u32 bts_id4[1];
  	alt_u32 bts_id5[1];
  	alt_u32 bts_id6[1];
  	alt_u32 bts_id7[1];
  	alt_u32 bts_id8[1];
  	//char  	board_id[4*id_words_dd];
  	//char  	port_id[4*id_words_dd];
  	//char  	generic_id[4*id_words_dd]; 
    alt_u32 board_id[id_words_dd];
    alt_u32 port_id[id_words_dd];
    alt_u32 generic_id[id_words_dd];    
  	alt_u32 addrs_per_reg[1]; 
  	alt_u32 id_words[1];            
  	alt_u32 map_dprio[1];          
  	alt_u32 xcvr_data_skew_width[1];
  	alt_u32 serial_channels[1];    
  	alt_u32 channel_width[1];       
  	alt_u32 num_lanes[1];           
  	alt_u32 tec_words[1];           
  	alt_u32 num_ssds[1];            
  	alt_u32 ssd_bits[1];    
	 // From system.h or calculated
	alt_u32	base_address[1];		// Base address of the port 
	alt_u32	data_width[1];
	alt_u32	nios_width[1];
	alt_u32	data_word_packs[1]; 
	alt_u32	bio_mask[1];
	// Addressing, masks, bit locations
	alt_u32	BTS_ID1_A       		;
	alt_u32	BTS_ID2_A       		;
	alt_u32	BTS_ID3_A       		;
	alt_u32	BTS_ID4_A       		;
	alt_u32	BTS_ID5_A       		;
	alt_u32	BTS_ID6_A       		;
	alt_u32	BTS_ID7_A       		;
	alt_u32	BTS_ID8_A       		;
	alt_u32	BOARD_ID_A        		;
	alt_u32	PORT_ID_A       		;
	alt_u32	GENERIC_ID_A      		;
	alt_u32	ADDRS_PER_REG_A   		;
	alt_u32	ID_WORDS_A        		;
	alt_u32	MAP_DPRIO_A       		;
	alt_u32	XCVR_DATA_SKEW_WIDTH_A	;
	alt_u32	SERIAL_CHANNELS_A     	;
	alt_u32	CHANNEL_WIDTH_A       	;
	alt_u32	NUM_LANES_A           	;
	alt_u32	TEC_WORDS_A           	;
	alt_u32	NUM_SSDS_A            	;
	alt_u32	SSD_BITS_A            	;
	alt_u32	BCR_A                   ;
	alt_u32	PRS_A                   ;
	alt_u32	PRD_A                   ;
	alt_u32	PRC_A                   ;
	alt_u32	EDM_A                   ;
	alt_u32	SDM_A                   ;
	alt_u32	CEM_A                   ;
	alt_u32	TDS_A                   ;
	alt_u32	XVC_A                   ;
	alt_u32	TTC_A                   ;
	alt_u32	RTC_A                   ;
	alt_u32	WEC_A                   ;
	alt_u32	LEC_A                   ;
	alt_u32	BIO_A                   ;
	alt_u32	SSD_A                   ;
	alt_u32	PFA_A	                ;  
// BCR Mask Bits 	
	alt_u32	PASS_M                  ;
	alt_u32	EIRQ_M                  ;
	alt_u32	ERRL_M                  ;
	alt_u32	TSTC_M                  ;
	alt_u32	PSA_M                   ;
	alt_u32	PLLK_M                  ;
	alt_u32	PLLT_M                  ;
	alt_u32	PLLR_M                  ;
	alt_u32	CLA_M                   ;
	alt_u32	CLS_M                   ;
	alt_u32	IPS_M                   ;
	alt_u32	DBY_M                   ;
	alt_u32	DDV_M                   ;
	alt_u32	DWA_M                   ;
	alt_u32	DRD_M                   ;
	alt_u32	CER_M                   ;
	alt_u32	STRT_M                  ;
	alt_u32	ECB_M                   ;
	alt_u32	ECD_M                   ;
	alt_u32	RSN_M                   ;  
// Bit locations    			
	alt_u32	PASS_B                  ;
	alt_u32	EIRQ_B                  ;
	alt_u32	ERRL_B                  ;
	alt_u32	TSTC_B                  ;
	alt_u32	PSA_B                   ;
	alt_u32	PLLK_B                  ;
	alt_u32	PLLT_B                  ;
	alt_u32	PLLR_B                  ;
	alt_u32	CLA_B                   ;
	alt_u32	CLS_B                   ;
	alt_u32	IPS_B                   ;
	alt_u32	DBY_B                   ;
	alt_u32	DDV_B                   ;
	alt_u32	DWA_B                   ;
	alt_u32	DRD_B                   ;
	alt_u32	CER_B                   ;
	alt_u32	STRT_B                  ;
	alt_u32	ECB_B                   ;
	alt_u32	ECD_B                   ;
	alt_u32	RSN_B                   ;
	alt_u32	DC_LSB                  ;
	alt_u32	DC_MSB                  ;
	alt_u32	EQ_LSB                  ;
	alt_u32	EQ_MSB                  ;
	alt_u32	P0_LSB                  ;
	alt_u32	P0_MSB                  ;
	alt_u32	P1_LSB                  ;
	alt_u32	P1_MSB                  ;
	alt_u32	P2_LSB                  ;
	alt_u32	P2_MSB                  ;
	alt_u32	VOD_LSB                 ;
	alt_u32	VOD_MSB                 ;
	alt_u32	SLB_LSB                 ;
	alt_u32	SLB_MSB                 ;   
// Mask after bits are right shifted:
	alt_u32	DC_LMSK                 ;
	alt_u32	EQ_LMSK                 ;
	alt_u32	P0_LMSK                 ;
	alt_u32	P1_LMSK                 ;
	alt_u32	P2_LMSK                 ;
	alt_u32	VOD_LMSK                ;
	alt_u32	SLB_LMSK                ;
	alt_u32	PB_LSB                  ;
	alt_u32	PB_MSB                  ;
	alt_u32	DIP_LSB                 ;
	alt_u32	DIP_MSB                 ;
	alt_u32	LED_LSB                 ;
	alt_u32	LED_MSB                 ;
	alt_u32	DC_BITS                 ;
	alt_u32	EQ_BITS                 ;
	alt_u32	P0_BITS                 ;
	alt_u32	P1_BITS                 ;
	alt_u32	P2_BITS                 ;
	alt_u32	VOD_BITS                ;
	alt_u32	PB_BITS                 ;
	alt_u32	DIP_BITS                ;
	alt_u32	LED_BITS                ;
  };



 struct aci_map_com acim_com[num_ports_dd_com];


struct aci_map_mem
 {
	// Main Avalon Control Interface BTS Hardware Control Registers:
    alt_u32	bcr[1];
    alt_u32	prs[data_word_packs_dd];
    alt_u32	prd[1];
    alt_u32	prc[data_word_packs_dd];
    alt_u32	edm[data_word_packs_dd];
    alt_u32	sdm[data_word_packs_dd];
    alt_u32	cem[data_word_packs_dd];
    alt_u32 ttc[tec_words_dd];
    alt_u32 rtc[tec_words_dd];
    alt_u32 wec[tec_words_dd];              // tec_words register width
    alt_u32 lec[num_lanes_dd*tec_words_dd];   // tec_words register width
    alt_u32 bio[1];
    alt_u8  ssd[num_ssds_dd];    // ssd_bits register width
    alt_u32 pfa[1];  
    alt_u32 mem_widthad_a[1];					    
	  alt_u32 sequencer_ptr_width[1];				
	  alt_u32 waveform_select_width[1];			    
    alt_u32 mem_sequencer_base_address_write[1]; 
    alt_u32 mem_sequencer_base_address_read[1];	
    alt_u32 dgen_memory_base_address_write[1];	
    alt_u32 dgen_memory_base_address_read[1];	    
    alt_u32 sequencer_burst_width[1];			    
    alt_u32 type_width[1];						
    alt_u32 local_size_width[1];
    alt_u32 local_size_max[1];			    
    alt_u32 local_addr_width[1];			    
    alt_u32 local_data_width[1];			    
    alt_u32 local_be_width[1];					
    alt_u32 component_type[id_words_dd];
    // BTS System Identification:
    alt_u32 bts_id1[1]; 
  	alt_u32 bts_id2[1];
  	alt_u32 bts_id3[1];
  	alt_u32 bts_id4[1];
  	alt_u32 bts_id5[1];
  	alt_u32 bts_id6[1];
  	alt_u32 bts_id7[1];
  	alt_u32 bts_id8[1];
  	//char  	board_id[4*id_words_dd];
  	//char  	port_id[4*id_words_dd];
  	//char  	generic_id[4*id_words_dd]; 
    alt_u32 board_id[id_words_dd];
    alt_u32 port_id[id_words_dd];
    alt_u32 generic_id[id_words_dd];    
  	alt_u32 addrs_per_reg[1]; 
    alt_u32 addrs_per_seq_log2[1];
  	alt_u32 id_words[1];            
	  alt_u32	data_width[1];
  	alt_u32 num_lanes[1];           
  	alt_u32 tec_words[1];           
  	alt_u32 num_ssds[1];            
  	alt_u32 ssd_bits[1];    
	 // From system.h or calculated
	alt_u32	base_address[1];		// Base address of the port 
	//alt_u32	data_width[1];
	//alt_u32	lane_width[1];
	alt_u32	nios_width[1];
	alt_u32	data_word_packs[1]; 
	alt_u32	bio_mask[1];
	// Addressing, masks, bit locations
	alt_u32	BTS_ID1_A       						;
	alt_u32	BTS_ID2_A       						;
	alt_u32	BTS_ID3_A       						;
	alt_u32	BTS_ID4_A       						;
	alt_u32	BTS_ID5_A       						;
	alt_u32	BTS_ID6_A       						;
	alt_u32	BTS_ID7_A       						;
	alt_u32	BTS_ID8_A       						;
	alt_u32	BOARD_ID_A        						;
	alt_u32	PORT_ID_A       						;
	alt_u32	GENERIC_ID_A      						;
	alt_u32	ADDRS_PER_REG_A   						;
	alt_u32	ID_WORDS_A        						;
	//alt_u32	DATA_WIDTH_A       	    				;
	alt_u32	NUM_LANES_A           					;
	alt_u32	TEC_WORDS_A           					;
	alt_u32	NUM_SSDS_A            					;
	alt_u32	SSD_BITS_A            					;
	alt_u32	BCR_A                   				;
	alt_u32	PRS_A                   				;
	alt_u32	PRD_A                   				;
	alt_u32	PRC_A                   				;
	alt_u32	EDM_A                   				;
	alt_u32	SDM_A                   				;
	alt_u32	CEM_A                   				;
	alt_u32	TTC_A                   				;
	alt_u32	RTC_A                   				;
	alt_u32	WEC_A                   				;
	alt_u32	LEC_A                   				;
	alt_u32	BIO_A                   				;
	alt_u32	SSD_A                   				;
	alt_u32	PFA_A	                  				;  
	alt_u32	MEM_WIDTHAD_A_A;					      ;
	alt_u32	SEQUENCER_PTR_WIDTH_A           ;	
	alt_u32	WAVEFORM_SELECT_WIDTH_A				  ;
	alt_u32	MEM_SEQUENCER_BASE_ADDRESS_WRITE_A	;
	alt_u32	MEM_SEQUENCER_BASE_ADDRESS_READ_A	  ;
	alt_u32	DGEN_MEMORY_BASE_ADDRESS_WRITE_A	  ;
	alt_u32	DGEN_MEMORY_BASE_ADDRESS_READ_A		  ;
	alt_u32	SEQUENCER_BURST_WIDTH_A				      ;
	alt_u32	TYPE_WIDTH_A						        ;
	alt_u32	LOCAL_SIZE_WIDTH_A					    ;
  alt_u32 LOCAL_SIZE_MAX_A                ;
	alt_u32	LOCAL_ADDR_WIDTH_A					    ;
	alt_u32	LOCAL_DATA_WIDTH_A					    ;
	alt_u32	LOCAL_BE_WIDTH_A                ;
	alt_u32	COMPONENT_TYPE_A						    ;
// Memory Sequencer Registers
  alt_u32 ADDRS_PER_SEQ_LOG2_A            ;
  alt_u32 SEQUENCER_BURST_LENGTH_A        ;
  alt_u32 LOCAL_ADDR_START_A              ;
  alt_u32 LOCAL_BURST_LENGTH_A            ;
  alt_u32 LOCAL_TRANSACTIONS_LENGTH_A     ;
  alt_u32 RW_TYPE_A                       ;
  alt_u32 ADDRESS_TYPE_A                  ;
  alt_u32 DATA_TYPE_A                     ;
  alt_u32 WAVEFORM_SELECTOR_A             ;
  alt_u32 WAVEFORM_PERIODOR_A             ;
// BCR Mask Bits 	
	alt_u32	PASS_M                  				;
	alt_u32	EIRQ_M                  				;
	alt_u32	ERRL_M                  				;
	alt_u32	TSTC_M                  				;
	alt_u32	PSA_M                   				;
	alt_u32	PLLK_M                  				;
	alt_u32	IPS_M                   				;
	alt_u32	CER_M                   				;
	alt_u32	STRT_M                  				;
	alt_u32	ECB_M                   				;
	alt_u32	ECD_M                   				;
	alt_u32	RSN_M                   				;  
// Bit locations    			    				
	alt_u32	PASS_B                  				;
	alt_u32	EIRQ_B                  				;
	alt_u32	ERRL_B                  				;
	alt_u32	TSTC_B                  				;
	alt_u32	PSA_B                   				;
	alt_u32	PLLK_B                  				;
	alt_u32	IPS_B                   				;
	alt_u32	CER_B                   				;
	alt_u32	STRT_B                  				;
	alt_u32	RSN_B                   				;
// Mask after bits are right shifted:   			
	alt_u32	PB_LSB                  				;
	alt_u32	PB_MSB                  				;
	alt_u32	DIP_LSB                 				;
	alt_u32	DIP_MSB                 				;
	alt_u32	LED_LSB                 				;
	alt_u32	LED_MSB                 				;
	alt_u32	PB_BITS                 				;
	alt_u32	DIP_BITS                				;
	alt_u32	LED_BITS                				;
  };

 struct aci_map_mem acim_mem[num_ports_dd_mem];

 

