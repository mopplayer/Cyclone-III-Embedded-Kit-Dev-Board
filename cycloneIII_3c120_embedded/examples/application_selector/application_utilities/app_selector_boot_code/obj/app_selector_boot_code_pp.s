# 1 "app_selector_boot_code.s"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "app_selector_boot_code.s"
# 24 "app_selector_boot_code.s"
# 1 "app_selector_boot_code.h" 1
# 25 "app_selector_boot_code.s" 2
# 35 "app_selector_boot_code.s"
  .global reset
  .global _start
  .global main
  .global end_of_boot_copier
# 52 "app_selector_boot_code.s"
reset:
_start:
main:


  wrctl status, r0



  movhi r6,%hi(0x10000)
cache_flush_loop:
  initi r6
  addi r6, r6,-32
  bne r6, r0, cache_flush_loop


  flushp




  nextpc r8
current_code_offset:
  movia r6, current_code_offset
  sub r11, r8, r6


  movhi r2, %hi(0x240000)
  ori r2, r2, %lo(0x240000)
  add r2, r2, r11

  callr r2


loop_forever:
  br loop_forever

  .end
