#include <stdio.h>
#include "maxii.h"
#include "i2c.h"
#include "system.h"

int SetMaxIIMode( char mode )
{
  int ret_code;
  const char RegAddr = 0x00; 
  ret_code = I2C_Write(PIO_ID_EEPROM_SCL_BASE, PIO_ID_EEPROM_DAT_BASE, MODE_I2C_ADDR, RegAddr, mode);
  
  return( ret_code );
}

int GetMaxIIMode( char *mode )
{
  int ret_code;
  const char RegAddr = 0x00;
  ret_code = I2C_Read(PIO_ID_EEPROM_SCL_BASE, PIO_ID_EEPROM_DAT_BASE, MODE_I2C_ADDR, RegAddr, mode);

  return( ret_code );
}
