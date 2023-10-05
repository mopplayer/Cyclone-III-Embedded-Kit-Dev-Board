#!/bin/bash
#

# this line just causes th user to see what's happening echoed at the bash terminal:
echo "
Building restore flash file for flash...

cat boot_code.flash pfl_bits.flash 3c120_bup.flash 3c120_bts.flash 3c120_html.flash 3c120_bup_sw.flash > temp_restore.flash
cat optionbit.flash 3c120_bup.flash 3c120_bts.flash 3c120_bts_glcd.flash 3c120_bts_ddr2top.flash 3c120_bts_ddr2btm.flash 3c120_html.flash 3c120_bup_sw.flash ethernet_op.flash > temp_restore.flash"
cat optionbit.flash bup_3c120_fpga.flash bts_general.flash bts_glcd.flash bts_ddr2top.flash bts_ddr2btm.flash 3c120_html.flash 3c120_bup_sw.flash > temp_restore.flash

echo " 
Deleting unnecessary s-records within the flash files post-concatenation...

sed '/^S[05789]/ d' temp_restore.flash > restore_3c120_fpga.flash "

sed '/^S[05789]/ d' temp_restore.flash > restore_3c120_fpga.flash 

echo " 
Deleting temp files...
rm -f temp_restore.flash"

rm -f temp_restore.flash

echo "
Done building restore flash file!
"

#
# To restore flash after building the restore files, follow instructions as specified in  
# the User's Guide, chapter entitled: "Restoring the Flash Device with the Factory Settings"
#
# Note that the flash files may also be programmed individually using nios2-flash-programmer as follows:
#
# nios2-flash-programmer -b 0x08000000 pfl_bits.flash
# nios2-flash-programmer -b 0x08000000 3c120_bup.flash
# nios2-flash-programmer -b 0x08000000 3c120_bts.flash
# nios2-flash-programmer -b 0x08000000 3c120_html.flash
# nios2-flash-programmer -b 0x08000000 3c120_bup_sw.flash
#
#