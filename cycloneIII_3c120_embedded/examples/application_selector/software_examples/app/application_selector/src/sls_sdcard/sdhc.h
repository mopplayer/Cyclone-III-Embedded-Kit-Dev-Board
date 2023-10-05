
#ifndef __SLS_AVALON_SD_HOST_REGS_H__
#define __SLS_AVALON_SD_HOST_REGS_H__

/* IDE Slave I/O RD/WR/ADDR macros */
#define IOADDR_SLS_AVALON_SD_HOST_COMMAND_ARG(base)               __IO_CALC_ADDRESS_NATIVE(base, 0)
#define IORD_SLS_AVALON_SD_HOST_COMMAND_ARG(base)                 IORD(base, 0)
#define IOWR_SLS_AVALON_SD_HOST_COMMAND_ARG(base,data)            IOWR(base,0,data)

#define IOADDR_SLS_AVALON_SD_HOST_COMMAND_CNT(base)               __IO_CALC_ADDRESS_NATIVE(base, 1)
#define IORD_SLS_AVALON_SD_HOST_COMMAND_CNT(base)                 IORD(base, 1)
#define IOWR_SLS_AVALON_SD_HOST_COMMAND_CNT(base, data)           IOWR(base, 1, data)

#define IOADDR_SLS_AVALON_SD_HOST_CONTROL(base)                   __IO_CALC_ADDRESS_NATIVE(base, 2)
#define IORD_SLS_AVALON_SD_HOST_CONTROL(base)                     IORD(base, 2)
#define IOWR_SLS_AVALON_SD_HOST_CONTROL(base, data)               IOWR(base, 2, data)

#define IOADDR_SLS_AVALON_SD_HOST_BLOCK_LENGTH(base)              __IO_CALC_ADDRESS_NATIVE(base, 3)
#define IORD_SLS_AVALON_SD_HOST_BLOCK_LENGTH(base)                IORD(base, 3)
#define IOWR_SLS_AVALON_SD_HOST_BLOCK_LENGTH(base, data)          IOWR(base, 3, data)

#define IOADDR_SLS_AVALON_SD_HOST_DMA_LENGTH(base)                __IO_CALC_ADDRESS_NATIVE(base, 4)
#define IORD_SLS_AVALON_SD_HOST_DMA_LENGTH(base)                  IORD(base, 4)
#define IOWR_SLS_AVALON_SD_HOST_DMA_LENGTH(base, data)            IOWR(base, 4, data)

#define IOADDR_SLS_AVALON_SD_HOST_DMA_ADDR(base)                  __IO_CALC_ADDRESS_NATIVE(base, 5)
#define IORD_SLS_AVALON_SD_HOST_DMA_ADDR(base)                    IORD(base, 5)
#define IOWR_SLS_AVALON_SD_HOST_DMA_ADDR(base, data)              IOWR(base, 5, data)

#define IOADDR_SLS_AVALON_SD_HOST_INT_CNTR(base)                  __IO_CALC_ADDRESS_NATIVE(base, 6)
#define IORD_SLS_AVALON_SD_HOST_INT_CNTR(base)                    IORD(base, 6)
#define IOWR_SLS_AVALON_SD_HOST_INT_CNTR(base, data)              IOWR(base, 6, data)

#define IOADDR_SLS_AVALON_SD_HOST_STATUS(base)                    __IO_CALC_ADDRESS_NATIVE(base, 7)
#define IORD_SLS_AVALON_SD_HOST_STATUS(base)                      IORD(base, 7)
#define IOWR_SLS_AVALON_SD_HOST_STATUS(base, data)                IOWR(base, 7, data)

#define IOADDR_SLS_AVALON_SD_HOST_TX_DATA_TIMEOUT(base)           __IO_CALC_ADDRESS_NATIVE(base, 8)
#define IOWR_SLS_AVALON_SD_HOST_TX_DATA_TIMEOUT(base, data)       IOWR(base, 8, data)

#define IOADDR_SLS_AVALON_SD_HOST_RX_DATA_TIMEOUT(base)           __IO_CALC_ADDRESS_NATIVE(base, 9)
#define IOWR_SLS_AVALON_SD_HOST_RX_DATA_TIMEOUT(base, data)       IOWR(base, 9, data)

#define IOADDR_SLS_AVALON_SD_HOST_CMD_DATA_TIMEOUT(base)          __IO_CALC_ADDRESS_NATIVE(base, 10)
#define IOWR_SLS_AVALON_SD_HOST_CMD_DATA_TIMEOUT(base, data)      IOWR(base, 0xa, data)

#define IOADDR_SLS_AVALON_SD_HOST_RESPONSE1(base)                 __IO_CALC_ADDRESS_NATIVE(base, 8)
#define IORD_SLS_AVALON_SD_HOST_RESPONSE1(base)                   IORD(base, 0xb)

#define IOADDR_SLS_AVALON_SD_HOST_RESPONSE2(base)                 __IO_CALC_ADDRESS_NATIVE(base, 9)
#define IORD_SLS_AVALON_SD_HOST_RESPONSE2(base)                   IORD(base, 0xc)

#define IOADDR_SLS_AVALON_SD_HOST_RESPONSE3(base)                 __IO_CALC_ADDRESS_NATIVE(base, 10)
#define IORD_SLS_AVALON_SD_HOST_RESPONSE3(base)                   IORD(base, 0xd)

#define IOADDR_SLS_AVALON_SD_HOST_RESPONSE4(base)                 __IO_CALC_ADDRESS_NATIVE(base, 11)
#define IORD_SLS_AVALON_SD_HOST_RESPONSE4(base)                   IORD(base, 0xe)

#define IOADDR_SLS_AVALON_SD_HOST_RESPONSE5(base)                 __IO_CALC_ADDRESS_NATIVE(base, 12)
#define IORD_SLS_AVALON_SD_HOST_RESPONSE5(base)                   IORD(base, 0xf)

/* Command Control Register */
#define SLS_AVALON_SD_HOST_COMMAND_CNT_TX_EN                    (0x1)
#define SLS_AVALON_SD_HOST_COMMAND_CNT_RX_EN                    (0x2)
#define SLS_AVALON_SD_HOST_COMMAND_CNT_CMD_EN                   (0x4)
#define SLS_AVALON_SD_HOST_COMMAND_CNT_RESP_TYPE(response)      ((response & 0x3)<<3)
#define SLS_AVALON_SD_HOST_COMMAND_CNT_INDEX(index)             (((index)& 0x3F)<< 10)

/* IP Control Register */
#define SLS_AVALON_SD_HOST_CONTROL_PRESCALE(prescale)           (prescale & 0xFF)
#define SLS_AVALON_SD_HOST_CONTROL_SD_BUS(bus)                  ((bus & 0x1)<<8)
#define SLS_AVALON_SD_HOST_CONTROL_DMA_EN                       (0x200)
#define SLS_AVALON_SD_HOST_CONTROL_SOFT_RESET                   (0x4000)
#define SLS_AVALON_SD_HOST_CONTROL_CORE_EN                      (0x8000)

/* Interrupt Control Register */
#define SLS_AVALON_SD_HOST_INT_CNT_RX_COMPLETE_MASK             (0x1)
#define SLS_AVALON_SD_HOST_INT_CNT_TX_COMPLETE_MASK             (0x2)
#define SLS_AVALON_SD_HOST_INT_CNT_CMD_COMPLETE_MASK            (0x4)
#define SLS_AVALON_SD_HOST_INT_CNT_RX_CRC_ERR_MASK              (0x8)
#define SLS_AVALON_SD_HOST_INT_CNT_TX_CRC_ERR_MASK              (0x10)
#define SLS_AVALON_SD_HOST_INT_CNT_CMD_RESP_CRC_ERR_MASK        (0x20)
#define SLS_AVALON_SD_HOST_INT_CNT_CMD_TIMEOUT_MASK             (0x40)
#define SLS_AVALON_SD_HOST_INT_CNT_RX_TIMEOUT_MASK              (0x80)
#define SLS_AVALON_SD_HOST_INT_CNT_TX_TIMEOUT_MASK              (0x100)
#define SLS_AVALON_SD_HOST_INT_CNT_DMA_COMPLETE_MASK            (0x200)
#define SLS_AVALON_SD_HOST_INT_CNT_CARD_INSERT_MASK             (0x400)
#define SLS_AVALON_SD_HOST_INT_CNT_GLOBAL_INT_MASK              (0x800)
#define SLS_AVALON_SD_HOST_INT_CNT_INT_CLEAR                    (0x1000)

/* Status Register */
#define SLS_AVALON_SD_HOST_STATUS_TX_COMPLETE                   (0x1)
#define SLS_AVALON_SD_HOST_STATUS_RX_COMPLETE                   (0x2)
#define SLS_AVALON_SD_HOST_STATUS_CMD_COMPLETE                  (0x4)
#define SLS_AVALON_SD_HOST_STATUS_RX_CRC_ERR                    (0x8)
#define SLS_AVALON_SD_HOST_STATUS_TX_CRC_ERR                    (0x10)
#define SLS_AVALON_SD_HOST_STATUS_CMD_RESP_CRC_ERR              (0x20)
#define SLS_AVALON_SD_HOST_STATUS_CMD_TIMEOUT                   (0x40)
#define SLS_AVALON_SD_HOST_STATUS_RX_TIMEOUT                    (0x80)
#define SLS_AVALON_SD_HOST_STATUS_TX_TIMEOUT                    (0x100)
#define SLS_AVALON_SD_HOST_STATUS_DMA_COMPLETE                  (0x200)
#define SLS_AVALON_SD_HOST_STATUS_RX_FIFO_FULL                  (0x400)
#define SLS_AVALON_SD_HOST_STATUS_RX_FIFO_EMPTY                 (0x800)
#define SLS_AVALON_SD_HOST_STATUS_TX_FIFO_FULL                  (0x1000)
#define SLS_AVALON_SD_HOST_STATUS_TX_FIFO_EMPTY                 (0x2000)
#define SLS_AVALON_SD_HOST_STATUS_CARD_INSERT                   (0x4000)
#define SLS_AVALON_SD_HOST_STATUS_WRITE_PROTECT                 (0x8000)
#define SLS_AVALON_SD_HOST_STATUS_CARD_BUSY                     (0x10000)

/* System Specific Information */
#define SLS_SD_HOST_BUS_4BIT_BUS                                1
#define SLS_SD_HOST_BUS_1BIT_BUS                                0
#define SLS_SD_HOST_RX_TIMEOUT                                  (0xFFFF)
#define SLS_SD_HOST_TX_TIMEOUT                                  (0xFFFF)
#define SLS_SD_HOST_CMD_TIMEOUT                                 (0xFFFF)

#define SUCCESS                                                 0

/*Error code*/
#define E_FAIL                                                  -10
#define E_RX                                                    -11
#define E_TX                                                    -12
#define E_CMD                                                   -13
#define E_POWER_MODE_ERR                                        -14
#define E_NO_SUPPORT                                            -15

#define SD_TYPE_MMC    0    /* MMC card  */
#define SD_TYPE_SD     1    /* SD card   */
#define SD_TYPE_SDIO   2    /* SDIO card */

#define SD_VDD_165_195 0x00000080  /* VDD voltage 1.65 - 1.95 */
#define SD_VDD_20_21   0x00000100  /* VDD voltage 2.0 ~ 2.1 */
#define SD_VDD_21_22   0x00000200  /* VDD voltage 2.1 ~ 2.2 */
#define SD_VDD_22_23   0x00000400  /* VDD voltage 2.2 ~ 2.3 */
#define SD_VDD_23_24   0x00000800  /* VDD voltage 2.3 ~ 2.4 */
#define SD_VDD_24_25   0x00001000  /* VDD voltage 2.4 ~ 2.5 */
#define SD_VDD_25_26   0x00002000  /* VDD voltage 2.5 ~ 2.6 */
#define SD_VDD_26_27   0x00004000  /* VDD voltage 2.6 ~ 2.7 */
#define SD_VDD_27_28   0x00008000  /* VDD voltage 2.7 ~ 2.8 */
#define SD_VDD_28_29   0x00010000  /* VDD voltage 2.8 ~ 2.9 */
#define SD_VDD_29_30   0x00020000  /* VDD voltage 2.9 ~ 3.0 */
#define SD_VDD_30_31   0x00040000  /* VDD voltage 3.0 ~ 3.1 */
#define SD_VDD_31_32   0x00080000  /* VDD voltage 3.1 ~ 3.2 */
#define SD_VDD_32_33   0x00100000  /* VDD voltage 3.2 ~ 3.3 */
#define SD_VDD_33_34   0x00200000  /* VDD voltage 3.3 ~ 3.4 */
#define SD_VDD_34_35   0x00400000  /* VDD voltage 3.4 ~ 3.5 */
#define SD_VDD_35_36   0x00800000  /* VDD voltage 3.5 ~ 3.6 */

#define SLS_SD_VDD_SUPPORT  ( SD_VDD_27_28 | SD_VDD_28_29 | SD_VDD_29_30 |      \
                              SD_VDD_30_31 | SD_VDD_31_32 | SD_VDD_32_33 |      \
                              SD_VDD_33_34 | SD_VDD_34_35 | SD_VDD_35_36 )


/* SD IP Response type */
#define SLS_SD_HOST_NO_RESPONSE       0
#define SLS_SD_HOST_48B_RESPONSE      1  /* R1 , R1b , R3(OCR) ,R6,R7 */
#define SLS_SD_HOST_136B_RESPONSE     2  /* R2(CSD,CID) */

/* Standard SD commands (4.1)           type  argument     response */

/* class 1 */
#define SD_GO_IDLE_STATE         0   /* bc                          */
#define SD_SEND_OP_COND          1   /* bcr  [31:0] OCR         R3  */
#define SD_ALL_SEND_CID          2   /* bcr                     R2  */
#define SD_SET_RELATIVE_ADDR     3   /* ac   [31:16] RCA        R1  */
#define SD_SET_DSR               4   /* bc   [31:16] RCA            */
#define SD_GET_OCR_SDIO          5   /* bcr                     R2  */
#define SD_SWITCH                6   /* ac   [31:0] See below   R1b */
#define SD_SELECT_CARD           7   /* ac   [31:16] RCA        R1  */
#define SD_SEND_EXT_CSD          8   /* ad                      R7  */
#define SD_SEND_CSD              9   /* ac   [31:16] RCA        R2  */
#define SD_SEND_CID             10   /* ac   [31:16] RCA        R2  */
#define SD_READ_DAT_UNTIL_STOP  11   /* adtc [31:0] dadr        R1  */
#define SD_STOP_TRANSMISSION    12   /* ac                      R1b */
#define SD_SEND_STATUS          13   /* ac   [31:16] RCA        R1  */
#define SD_GO_INACTIVE_STATE    15   /* ac   [31:16] RCA            */
#define SD_SPI_READ_OCR         58   /* spi                  spi_R3 */
#define SD_SPI_CRC_ON_OFF       59   /* spi  [0:0] flag      spi_R1 */

/* class 2 */
#define SD_SET_BLOCKLEN         16   /* ac   [31:0] block len   R1  */
#define SD_READ_SINGLE_BLOCK    17   /* adtc [31:0] data addr   R1  */
#define SD_READ_MULTIPLE_BLOCK  18   /* adtc [31:0] data addr   R1  */

/* class 3 */
#define SD_WRITE_DAT_UNTIL_STOP 20   /* adtc [31:0] data addr   R1  */

/* class 4 */
#define SD_SET_BLOCK_COUNT      23   /* adtc [31:0] data addr   R1  */
#define SD_WRITE_BLOCK          24   /* adtc [31:0] data addr   R1  */
#define SD_WRITE_MULTIPLE_BLOCK 25   /* adtc                    R1  */
#define SD_PROGRAM_CID          26   /* adtc                    R1  */
#define SD_PROGRAM_CSD          27   /* adtc                    R1  */

/* class 6 */
#define SD_SET_WRITE_PROT       28   /* ac   [31:0] data addr   R1b */
#define SD_CLR_WRITE_PROT       29   /* ac   [31:0] data addr   R1b */
#define SD_SEND_WRITE_PROT      30   /* adtc [31:0] wpdata addr R1  */

/* class 5 */
#define SD_ERASE_GROUP_START    35   /* ac   [31:0] data addr   R1  */
#define SD_ERASE_GROUP_END      36   /* ac   [31:0] data addr   R1  */
#define SD_ERASE                38   /* ac                      R1b */

/* class 9 */
#define SD_FAST_IO              39   /* ac   <Complex>          R4  */
#define SD_GO_IRQ_STATE         40   /* bcr                     R5  */

/* class 7 */
#define SD_LOCK_UNLOCK          42   /* adtc                    R1b */

/* class 8 */
#define SD_APP_CMD              55   /* ac   [31:16] RCA        R1  */
#define SD_GEN_CMD              56   /* adtc [0] RD/WR          R1  */

/* Application commands */
#define SD_APP_SET_BUS_WIDTH      6   /* ac   [1:0] bus width    R1  */
#define SD_APP_SEND_NUM_WR_BLKS  22   /* adtc                    R1  */
#define SD_APP_OP_COND           41   /* bcr  [31:0] OCR         R3  */
#define SD_APP_SEND_SCR          51   /* adtc                    R1  */

/*
 * SD_SWITCH argument format:
 *
 *      [31] Check (0) or switch (1)
 *      [30:24] Reserved (0)
 *      [23:20] Function group 6
 *      [19:16] Function group 5
 *      [15:12] Function group 4
 *      [11:8] Function group 3
 *      [7:4] Function group 2
 *      [3:0] Function group 1
 */

/*
 * SD_SEND_IF_COND argument format:
 *
 *  [31:12] Reserved (0)
 *  [11:8] Host Voltage Supply Flags
 *  [7:0] Check Pattern (0xAA)
 */
struct sd_cid {
  unsigned int    manfid;
  char            prod_name[8];
  unsigned int    serial;
  unsigned short  oemid;
  unsigned short  year;
  unsigned char   hwrev;
  unsigned char   fwrev;
  unsigned char   month;
};

struct sd_csd {
  unsigned char   mmca_vsn;
  unsigned short  cmdclass;
  unsigned short  tacc_clks;
  unsigned int    tacc_ns;
  unsigned int    r2w_factor;
  unsigned int    max_dtr;
  unsigned int    read_blkbits;
  unsigned int    write_blkbits;
  unsigned int    capacity;
  unsigned int    read_partial:1,
                  read_misalign:1,
                  write_partial:1,
                  write_misalign:1;
};

/*
 * sd device
 */
struct sls_sd_card {
  unsigned int     base;
  unsigned int     irq;

  unsigned int     sd_present;            /* card type */
  unsigned int     bus_width;       /* card type */

  unsigned int     ocr_avail;
  unsigned int     rca;             /* relative card address of device */
  unsigned int     flag8;
  unsigned int     ccs;
  unsigned int     raw_cid[4];      /* raw card CID        */
  unsigned int     raw_csd[4];      /* raw card CSD        */
  struct sd_cid    cid;             /* card identification */
  struct sd_csd    csd;              /* card specific       */

  unsigned int     required_Block_len;
  unsigned int     power_window;

  unsigned int     tx_time_out;
  unsigned int     rx_time_out;
  unsigned int     cmd_time_out;

  unsigned int     sdhc_clock;
};

void sdhc_decode_cid(struct sls_sd_card *card);
int sdhc_decode_csd(struct sls_sd_card *card);
int send_command(struct sls_sd_card *card,unsigned int command_arg, char res_type, unsigned int command_index);
int sdhc_mode_select(struct sls_sd_card *card,unsigned char mode);
int sdhc_read(struct sls_sd_card *card,unsigned int start_block,unsigned int NoOfBlocks, unsigned char *read_buffer);
int sdhc_write(struct sls_sd_card *card,unsigned int start_block,unsigned int NoOfBlocks,unsigned char *write_buffer);
int sdhc_init(struct sls_sd_card *card,unsigned int base_addr,unsigned int irq);

#endif // __SLS_AVALON_SD_HOST_REGS_H__






