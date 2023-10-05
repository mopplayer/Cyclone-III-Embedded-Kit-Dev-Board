//+---------------------------------------------------------------------------
//|
//| Embedded Systems Development Kit, Cyclone III Edition
//| Readme v11.0.0
//|
//+---------------------------------------------------------------------------

This readme.txt file accompanies the Embedded Systems Development Kit, Cyclone III Edition

//=============================
//    System Requirements
//=============================

Software Requirements
========================
Demo appliations require the installation of Quartus II v11.0 or later and are
supported on the following operating systems:
   Windows XP SP3 32-bit 
   Windows XP SP2 64-bit
   Windows 7 Professional 64-bit


Hardware Requirements
========================
   Pentium III or later for Windows
   Color display capable of 1024 X 768 pixel resolution
   CD-ROM drive
   One or more of the following I/O ports:
   -  USB port (if using Windows XP or Windows 2000) for 
      USB-Blaster(TM) or MasterBlaster(TM) 
      communications cables, or APU programming unit

//=============================
//       Release Notes
//=============================

1. Move sdcard_contents folder from demos folder to factory_recovery folder. 

2. Updated board_design_files\cycloneIII_3c120_dev\schematic, assembly and layout folder with Cyclone III FPGA 
   development rev d board collaterals. 

3. Cyclone III FPGA development board PCB gerbers are located at board_design_files\cycloneIII_3c120_dev\
   manufacturing folder.

4. Added signal_integrity folder under board_design_files folder.

5. Added max2_1338.pof for MaxII CPLD programming in factory_recovery folder.

6. The following documents are updated:
   a. L01-43773-01_cycloneIII_3c120_embedded_quick_start_guide.pdf
   b. L01-43813-01_cycloneIII_3c120_embedded_dcl.pdf
   c. P25-36348-01_cycloneIII_3c120_embedded_user_guide.pdf
	 
7. RS-232 UART IO Control - must manually edit system.h
   If your hardware design includes a RS-232 UART and sets I/O Control support
   on, then you may find that compiled software does not work.

   Reason: The driver ioctl() support for altera_avalon_uart component contains
   an invalid type for uart parameter, which causes uart driver fail to 
   evaluate the parameter value.
 
   Resolution: 
      a. Manually edit system.h file:
         change: #define UART1_PARITY "N"
         to: #define UART1_PARITY 'N'
         (i.e. change double-quote character to single-quote character)
      b. Re-build bsp package

8. Compilation of projects will fail if not rebuilt in SOPC Builder first.
   This is not a bug - its just the way things work right now.  This happens
   because when these example designs were generated at the factory, they 
   write out some absolute paths that are not the same on your computer.  
   So the result is that any of the embedded systems development kit example 
   hardware designs need to be regenerated in SOPC Builder on your machine 
   before recompiling in Quartus II.

9. SOF file for Application Selector Design in this package is of QII version 9.1 instead of from this release         version due to third party IP licensing issue. To generate SOF file from this release version, please refer to      the "P25-36348-01_cycloneIII_3c120_embedded_user_guide" on how to obtain a valid full license for third party    IP. 
 

The expected flow for a new user would be:
------------------------------------------
1. Quick Start Guide (Printed and in the box)
   This includes directions for downloading and installing the software,
   installing the Embedded Systems Development Kit CDROM and doing a power-on
   test with the Development Board.

2. User Guide
   In addition to more detailed instructions about installing the software,
   this document has information about running the applications selector and
   the sample applications that are stored on the SD-Card.

3. My First Nios II Software Tutorial
   This document describes using the Nios II Processor in an FPGA.  It walks
   you through compiling and running software on a provided Nios II Standard
   system.

4. My First FPGA Tutorial
   This document walks you through creating your first Quaruts II project
   and building an FPGA design that can be downloaded and run on the 
   cyclone III Starter Board.  This assumes you have downloaded and installed
   the Quartus II software and installed the USB Blaster Driver.  With these
   installed, the My First FPGA Tutorial should take about an hour from start
   to finish.

5. Nios II 3C120 Microprocessor with LCD Controller (Design Example and Datasheet)
   These items provide a starting point for your own embedded development with 
   this kit.  It provides a full-featured hardware reference platform demonstrating 
   a system with a CPU, memory interfaces, communications interfaces, LCD 
   controller, etc.  You can also simply use this design as a starting point for 
   software development.

From this point there are many more things you can do with your Altera Embedded
Systems Development Kit, Cyclone III Edition.  Check the Altera website for 
updates for this development kit.