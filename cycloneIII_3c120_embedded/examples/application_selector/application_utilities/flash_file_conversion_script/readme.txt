
Instructions for using n2c3.sh
=====================================

The n2c3.sh script takes an .elf file and a .sof file as input.  The script
creates a .flash file for each one which is compatible with the Nios II 
Development Kit Cyclone III Edition Application Selector.

Usage:

./n2c3.sh <elf_file>.elf <sof_file>.sof

Creates the files
  - <elf_file>_sw.flash
  - <sof_file>_hw.flash

