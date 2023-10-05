#!/usr/bin/env bash

##
#	Create factory recovery flash image
#
#	please ensure that the design hardware and 
#	software build successfully before running
#	this script
##

# Flash memory map for 3c120 design
# =====================================================
# Offset                Contents
# =====================================================
# 0x0000000 - 0x001FFFF   Application Boot Code
# 0x0020000 - 0x003FFFF   HW Image Catalog
# 0x0040000 - 0x00FFFFF   Unused
# 0x0100000 - 0x023FFFF   Selector SW Image
# 0x0240000 - 0x1BFFFFF   Application SW Image
# 0x1C00000 - 0x1FFFFFF   Reserved
# 0x2000000 - 0x237FFFF   Selector HW Image
# 0x2380000 - 0x3BFFFFF   Application HW Images (7)
# 0x3C00000 - 0x3FBFFFF   Unused
# 0x3FC0000 - 0x3FDFFFF   Ethernet Option Bits
# 0x3FE0000 - 0x3FE0080   PFL Option Bits

sof_file="cycloneIII_3c120_niosII_application_selector.sof"
factory_recovery_file="restore_cycloneIII_3c120.flash"

design_hardware_dir="../.."
software_app_dir="../../software_examples/app/application_selector"
boot_code_dir="../app_selector_boot_code"
flash_image_dir="./flash_image"
output_dir="."

# prepare bootloader
pushd ${boot_code_dir}
bash -c "source $SOPC_KIT_NIOS2/nios2_sdk_shell_bashrc ; make clean ; make" || exit -1
popd

# preapre hardware flash file
pushd ${design_hardware_dir}
sof2flash --offset=0x2000000 --input=${sof_file} --output=appsel_hw.flash || exit -1
popd

# prepare software flash file
pushd ${software_app_dir}
make flash || exit -1
popd

# copy over flash image file
cp ${boot_code_dir}/app_selector_boot_code.srec ${flash_image_dir}
cp ${design_hardware_dir}/appsel_hw.flash ${flash_image_dir}
cp ${software_app_dir}/ext_flash.flash ${flash_image_dir}

# combine the recovery file
pushd ${flash_image_dir}
cat app_selector_boot_code.srec catalog.flash appsel_hw.flash ext_flash.flash PFL_option_bits.flash > temp_restore.flash
sed '/^S[05789]/ d' temp_restore.flash > ${factory_recovery_file}
popd

# relocate and clean up the file
mv ${flash_image_dir}/${factory_recovery_file} ${output_dir}
rm ${flash_image_dir}/app_selector_boot_code.srec
rm ${flash_image_dir}/appsel_hw.flash
rm ${flash_image_dir}/ext_flash.flash
rm ${flash_image_dir}/temp_restore.flash

