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
  cli.c:
  Implementation of a command line interface which will parse user input
  and call related BTS test functions. There should be a single void function
  which accepts a string as a parameter so that the code in the foreground loop
  can pass user input into the CLI.
*/

#include  "cli.h"
#include "time.h"


void cli(char cli_string[],int *exit){
  char      ch;
  char      line[8];
  char      aci_regs[8];
  int tmp;

    struct cli_struct cli_st;

    alt_irq_register( SC_INF_0_IRQ, &cli_st, handle_sc_interrupts );
    alt_irq_register( HEARTBEAT_0_IRQ, NULL, handle_hb_interrupts );


  printf("%s\n",cli_string);
  // Initialize acim_com structures for all ports in the design:
  // Set num_ports_dd_com & num_ports_dd_mem in bts_defs.h to the number of ports called below
    cli_st.port = 1;
//  (void) init_aci_mem(&cli_st.port_type[1],&acim_mem[0],NIOS_BTS_PORT_DDR3_X16_0_BASE);
// original (void) init_aci_mem(&cli_st.port_type[1],&acim_mem[0],NIOS_BTS_PORT_DDR2_X64_0_BASE);
//  (void) init_aci_mem(&cli_st.port_type[2],&acim_mem[1],NIOS_BTS_PORT_DDR3_X64_0_BASE);

(void) init_aci_mem(&cli_st.port_type[1],&acim_mem[0],NIOS_BTS_PORT_DDR2_X40_0_BASE);


#ifdef   ALT_DEBUG

#else
//  FOR THE GUI, Comment in this code, may need to set STDIN/OUT/ERR to NULL
// Start:  This code runs the GUI.. Comment out to run the command line console from NIOS IDE
    // Replaces get_port()
// From S3 Memory GUI -- remove for S4GX for now:
/*
    port  = 1;
    port_mem = port - port_mem_lo;
    //(void) aci_rw_regs_id_mem(&acim_mem[port_mem],DISPLAY_ON,acim_mem[port_mem].base_address[0],READ_S,ALL_S);
    (void)  usb_gui_mem(&acim_mem[port_mem]);    // Endless loop
*/
// End:  This code runs the GUI.. Comment out to run the command line console from NIOS IDE
#endif


//    cli_st.port = 2;
//    setPort(&cli_st);
    cli_st.port = 1;
    setPort(&cli_st);

  strcpy(aci_regs,ALL_S);
  ch  = "";
  while (ch != 'Q') {
    if  (cli_st.port_type[cli_st.port] == COM)
    {
      printf("\nF>actory Test, P>ort, O>ptimize Transceivers, R>eset, C>omma Detect,\n");
      printf("B>ond Channels, S>tart, E>rror, T>est Status, D>etect Port, I>nput\n");
      printf("A>ddressing, Q>uit\? ");
      fgets(line, sizeof(line), stdin);
      sscanf(line,"%c", &ch );
      switch (ch)
      {
        case  'D': // Detect Port ID
        {
          (void) aci_rw_regs_id_com(&acim_com[cli_st.port_com],DISPLAY_ON,acim_com[cli_st.port_com].base_address[0],READ_S,ALL_S);
              break;
        }
        case  'F': // Factory Test
        {
          (void) factory_test_com(&acim_com[cli_st.port_com]);
          break;
        }
        case  'O':  // Optimize VOD, Preemphasis, and RX Equalization
        { (void)  optimize_xcvrs_com(&acim_com[cli_st.port_com]);
          break;
        }
        case  'A':  // Register to Access in the Avalon Control Register
        {
          printf("Enter Register to Address (eg PRS, PRC, ALL): ");
          fgets(line, sizeof(line), stdin);
          sscanf(line,"%s", &aci_regs );
          break;
        }
        case  'I': // Input Data to the Avalon Control Register
        {
          (void) aci_rw_regs_com(&acim_com[cli_st.port_com],DISPLAY_ON,acim_com[cli_st.port_com].base_address[0],WRITE_S,aci_regs);
          break;
        }
        case  'P': // Port
        {
          (void)  get_port(&cli_st.port,&cli_st.port_com,&cli_st.port_mem);
          break;
        }
        case  'R': // Reset
        {// Reset:
              (void)    reset_com(&acim_com[cli_st.port_com]);
          break;
        }
        case  'C':  // Enable Comma Detect:
        {
         (void) comma_detect_com(&acim_com[cli_st.port_com]);
         break;
        }
        case 'B': // Enable Channel Bonding:
        {
          (void) enable_channel_bond_com(&acim_com[cli_st.port_com]);
          break;
        }
        case 'S': // Start Tests:
        {
          (void) start_com(&acim_com[cli_st.port_com]);
          break;
        }
         case 'E': // Error Insert:
        {
          (void) create_error_com(&acim_com[cli_st.port_com]);
          break;
        }
        case 'T': // Avalon Control Register Test Status:
        {
          (void) aci_rw_regs_com(&acim_com[cli_st.port_com],DISPLAY_ON,acim_com[cli_st.port_com].base_address[0],READ_S,ALL_S);
          break;
        }
        default:
        {
          break;
        }
      }
    }
    if  (cli_st.port_type[cli_st.port] == MEM)
    {
      printf("\nF>actory Test, P>ort, R>eset, S>tart, E>rror,\n");
      printf("T>est Status, D>etect Port, I>nput, A>ddressing, Q>uit, G>UI\? ");
      fgets(line, sizeof(line), stdin);
      sscanf(line,"%c", &ch );
      switch (ch)
      {
        case  'G':
        {
            (void)  usb_gui_mem(&acim_mem[cli_st.port_mem]);
            break;
        }
        case  'D': // Detect Port ID
        {
          (void) aci_rw_regs_id_mem(&acim_mem[cli_st.port_mem],DISPLAY_ON,acim_mem[cli_st.port_mem].base_address[0],READ_S,ALL_S);
              break;
        }
        case  'F': // Factory Test
        {
            factory_test_mem(&acim_mem[cli_st.port_mem]);
          break;
        }
        case  'A':  // Register to Access in the Avalon Control Register
        {
          printf("Enter Register to Address (eg PRS, PRC, SEQ, MEM, ALL): ");
          fgets(line, sizeof(line), stdin);
          sscanf(line,"%s", &aci_regs );
          break;
        }
        case  'I': // Input Data to the Avalon Control Register
        {
          (void) aci_rw_regs_mem(&acim_mem[cli_st.port_mem],DISPLAY_ON,acim_mem[cli_st.port_mem].base_address[0],WRITE_S,aci_regs);
          break;
        }
        case  'P': // Port
        {
          //(void)  get_port(&cli_st.port,&cli_st.port_com,&cli_st.port_mem);
          break;
        }
        case  'R': // Reset
        {// Reset:
              (void)    reset_mem(&acim_mem[cli_st.port_mem]);
          break;
        }
        case 'S': // Start Tests:
        {
          (void) start_mem(&acim_mem[cli_st.port_mem]);
          break;
        }
         case 'E': // Error Insert:
        {
          create_error_mem(&acim_mem[cli_st.port_mem]);
          break;
        }
        case 'T': // Avalon Control Register Test Status:
        {
            aci_rw_regs_mem(&acim_mem[cli_st.port_mem],DISPLAY_ON,acim_mem[cli_st.port_mem].base_address[0],READ_S,ALL_S);
          break;
        }
        default:
        {
          break;
        }
      }
    }

  }
  *exit  = 1;
  //return 0;
}


void handle_sc_interrupts(void* context, alt_u32 id){
    int ch;
    alt_u32 datasize;
    int data_type;
    int rw_restrict;
    char burst_1or2;
    int tx,rx,er;
    int tmp;

    struct cli_struct *cli_st;
    cli_st = (struct cli_struct *)context;


    ch = IORD(SC_INF_0_BASE, 7); // read IRQ status it should read 1 as data
    if(ch == 0)
        return;
    ch = IORD(SC_INF_0_BASE, 0); // read command
    ch %= 0xFF;

    if  (cli_st->port_type[cli_st->port] == COM){
      switch (ch){
        case  'D': // Detect Port ID
            aci_rw_regs_id_com(&acim_com[cli_st->port_com],DISPLAY_ON,acim_com[cli_st->port_com].base_address[0],READ_S,ALL_S);
            break;
        case  'F': // Factory Test
            factory_test_com(&acim_com[cli_st->port_com]);
            IOWR(SC_INF_0_BASE, 2, IORD(acim_com[cli_st->port_com].base_address[0],acim_com[cli_st->port_com].BCR_A));
            break;
        case  'O':  // Optimize VOD, Preemphasis, and RX Equalization
            optimize_xcvrs_com(&acim_com[cli_st->port_com]);
            break;
        case  'I': // Input Data to the Avalon Control Register
            //aci_rw_regs_com(&acim_com[port_com],DISPLAY_ON,acim_com[port_com].base_address[0],WRITE_S,aci_regs);
            break;
        case  'P': // Port
            cli_st->port = IORD(SC_INF_0_BASE, 127);
            setPort(cli_st);
            IOWR(SC_INF_0_BASE, 127, cli_st->port);
            break;
        case  'R': // Reset
            reset_com(&acim_com[cli_st->port_com]);
            break;
        case  'C':  // Enable Comma Detect:
            comma_detect_com(&acim_com[cli_st->port_com]);
            break;
        case 'B': // Enable Channel Bonding:
            enable_channel_bond_com(&acim_com[cli_st->port_com]);
            break;
        case 'S': // Start Tests:
            start_com(&acim_com[cli_st->port_com]);
            break;
         case 'E': // Error Insert:
            create_error_com(&acim_com[cli_st->port_com]);
            break;
        case 'T': // Avalon Control Register Test Status:
            // update structure values
            aci_rw_regs_com(&acim_com[cli_st->port_com],DISPLAY_OFF,acim_com[cli_st->port_com].base_address[0],READ_S,TTC_S);
            aci_rw_regs_com(&acim_com[cli_st->port_com],DISPLAY_OFF,acim_com[cli_st->port_com].base_address[0],READ_S,RTC_S);
            aci_rw_regs_com(&acim_com[cli_st->port_com],DISPLAY_OFF,acim_com[cli_st->port_com].base_address[0],READ_S,WEC_S);

            // get data from the structure
            IOWR(SC_INF_0_BASE, 64, readTimer());
            IOWR(SC_INF_0_BASE, 65, *acim_com[cli_st->port_com].rtc);
            IOWR(SC_INF_0_BASE, 66, *acim_com[cli_st->port_com].ttc);
            IOWR(SC_INF_0_BASE, 67, *acim_com[cli_st->port_com].wec);
            break;
        case 'c': // changing data size, type, pattern, burst size
            datasize = IORD(SC_INF_0_BASE, 124); // get data size
            // data_type =>>>   1:PRBS  2:memory 3: math
            data_type = IORD(SC_INF_0_BASE, 125);
            // rw_restrict =>>> 1:write/read  2:read only  3:write only
            rw_restrict = IORD(SC_INF_0_BASE, 126);
            // burst_1or2 =>>> burst 1 is for all interfaces. 2 is only for DDR3.
            burst_1or2 = IORD(SC_INF_0_BASE, 127);

            reset_com(&acim_com[cli_st->port_com]); // Reset BTS
            //io_seq_com_gui(&acim_mem[port_com], datasize, data_type, rw_restrict, burst_1or2);
            //io_com_gui(&acim_com[port_com]);
            start_com(&acim_com[cli_st->port_com]);
            break;
        default: break;
      } // end of switch case
    } // end of com port

    else if  (cli_st->port_type[cli_st->port] == MEM){
      switch (ch){
        case  'D': // Detect Port ID
            aci_rw_regs_id_mem(&acim_mem[cli_st->port_mem],DISPLAY_ON,acim_mem[cli_st->port_mem].base_address[0],READ_S,ALL_S);
            break;
        case  'F': // Factory Test
            factory_test_mem(&acim_mem[cli_st->port_mem]);
            //factory_test_mem_gui(&acim_mem[cli_st->port_mem]);
            IOWR(SC_INF_0_BASE, 2, IORD(acim_mem[cli_st->port_mem].base_address[0],acim_mem[cli_st->port_mem].BCR_A));
            break;
        case  'I': // Input Data to the Avalon Control Register
            //aci_rw_regs_mem(&acim_mem[port_mem],DISPLAY_ON,acim_mem[port_mem].base_address[0],WRITE_S,aci_regs);
            break;
        case  'P': // Port
            cli_st->port = IORD(SC_INF_0_BASE, 127);
            setPort(cli_st);
            IOWR(SC_INF_0_BASE, 127, cli_st->port);
            break;
        case  'R': // Reset
            reset_mem(&acim_mem[cli_st->port_mem]);
            break;
        case 'S': // Start Tests:
            start_mem(&acim_mem[cli_st->port_mem]);
            break;
         case 'E': // Error Insert:
            create_error_mem(&acim_mem[cli_st->port_mem]);
            break;
        case 'T': // Avalon Control Register Test Status:
            aci_rw_regs_mem(&acim_mem[cli_st->port_mem],DISPLAY_OFF,acim_mem[cli_st->port_mem].base_address[0],READ_S,TTC_S);
            aci_rw_regs_mem(&acim_mem[cli_st->port_mem],DISPLAY_OFF,acim_mem[cli_st->port_mem].base_address[0],READ_S,RTC_S);
            aci_rw_regs_mem(&acim_mem[cli_st->port_mem],DISPLAY_OFF,acim_mem[cli_st->port_mem].base_address[0],READ_S,WEC_S);

            // get data from the structure
            IOWR(SC_INF_0_BASE, 64, readTimer());
            IOWR(SC_INF_0_BASE, 65, *acim_mem[cli_st->port_mem].rtc);
            IOWR(SC_INF_0_BASE, 66, *acim_mem[cli_st->port_mem].ttc);
            IOWR(SC_INF_0_BASE, 67, *acim_mem[cli_st->port_mem].wec);
            break;
        case 'c': // changing data size, type, pattern, burst size
            datasize = IORD(SC_INF_0_BASE, 124); // get data size
            // data_type =>>>   1:PRBS  2:memory 3: math
            data_type = IORD(SC_INF_0_BASE, 125);
            // rw_restrict =>>> 1:write/read  2:read only  3:write only
            rw_restrict = IORD(SC_INF_0_BASE, 126);
            // burst_1or2 =>>> burst 1 is for all interfaces. 2 is only for DDR3.
            burst_1or2 = IORD(SC_INF_0_BASE, 127);

            reset_mem(&acim_mem[cli_st->port_mem]); // Reset BTS
            io_seq_mem_gui(&acim_mem[cli_st->port_mem], datasize, data_type, rw_restrict, burst_1or2);
            io_mem_gui(&acim_mem[cli_st->port_mem]);
            start_mem(&acim_mem[cli_st->port_mem]);
            break;
        default:break;
        }// end of switch case
      }// end of mem

    IOWR(SC_INF_0_BASE, 7, 0x0); // clear IRQ status
    ch = IORD(SC_INF_0_BASE, 7); // read IRQ, it should be cleared already
    if(ch != 0)
        IOWR(SC_INF_0_BASE, 7, 0x0); // clear IRQ status
}

void handle_hb_interrupts(void* context, alt_u32 id){
    // Just read this address to keep the heartbeat beating...
    int dummy_read = IORD(HEARTBEAT_0_BASE, 0);
    dummy_read++; // this is just dummy process...

}

alt_u32 readTimer(){
    alt_u32 rd = 0;

    IOWR(TIMER_0_BASE, 5, 0x1234); // write value will be ignored. Just need to issue write comand to this address
    rd = IORD(TIMER_0_BASE, 5); // read timer
    rd = rd << 16;
    rd = rd + IORD(TIMER_0_BASE, 4); // read timer

    // this value needs to go buffer
    // if the lower half has read, then put this upper half to the scj_inf register.


    IOWR(TIMER_0_BASE, 0, 0x0); // clear round flag
    IOWR(TIMER_0_BASE, 1, 0xA); // stop counter
    IOWR(TIMER_0_BASE, 2, 0xFFFF); // write max counter value
    IOWR(TIMER_0_BASE, 3, 0xFFFF); // write max counter value
    IOWR(TIMER_0_BASE, 1, 0x6); // sart counter

    return rd;
}

//void setPort(int port){
void setPort(struct cli_struct * cli_st){
          if ((cli_st->port >= port_com_lo) && (cli_st->port <= port_com_hi)){
            cli_st->port_com = cli_st->port - port_com_lo; // Index from 0 for COM structure
                #ifdef   ALT_DEBUG
                        printf("port=%d  com_port=%d",cli_st->port,cli_st->port_com);
                #endif
            aci_rw_regs_id_com(&acim_com[cli_st->port_com],DISPLAY_ON,acim_com[cli_st->port_com].base_address[0],READ_S,ALL_S);
          }else if ((cli_st->port >= port_mem_lo) && (cli_st->port <= port_mem_hi)){
            cli_st->port_mem = cli_st->port - port_mem_lo; // Index from 0 for MEM structure
            printf("debug: Inside setPort Mem\n");
				#ifdef   ALT_DEBUG
                        printf("port=%d  mem_port=%d",cli_st->port,cli_st->port_mem);
                #endif
            aci_rw_regs_id_mem(&acim_mem[cli_st->port_mem],DISPLAY_ON,acim_mem[cli_st->port_mem].base_address[0],READ_S,ALL_S);
          }else{
                #ifdef   ALT_DEBUG
                                printf("\nwrong port number has selected\n");
                #endif
          }
          //factory_test_mem_gui(&acim_mem[cli_st->port_mem]);
          factory_test_mem(&acim_mem[cli_st->port_mem]);
}

void factory_test_mem_gui(struct aci_map_mem *aci){
    int d, count, tmp;

    d = 0;
    tmp = 0;
    count = 0;

//    while(tmp < 10){
//        if(((d & 0x80000000)>>31) != 1){
            reset_mem(aci);
            start_mem(aci);
            count = 0;
            while(count < 1000000){
                d = IORD(aci->base_address[0], aci->BCR_A);
                if(((d & 0x80000000)>>31) == 1){
                    tmp = 20;
                    break;
                }else
                    count++;
            }
//            tmp++;
//        }else
//            break;
//    }
}
