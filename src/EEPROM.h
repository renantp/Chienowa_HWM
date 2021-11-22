/*
 * EEPROM.h
 *
 *  Created on: 23 Sep 2021
 *      Author: Renan
 *      Use for IC: BR25G320F
 */

#ifndef EEPROM_H_
#define EEPROM_H_

/* C++ detection */
#ifdef __cplusplus
extern "C" {
#endif

//#include "r_cg_userdefine.h"
#include "r_cg_serial.h"
#include "r_cg_macrodriver.h"
#include "r_cg_userdefine.h"

/* Pin define */
#define CSI01_CS_LOW() 			P14_bit.no1=0
#define CSI01_CS_HIGH()			P14_bit.no1=1
#define EEPROM_HOLD_EN()		P12_bit.no0=0 //HOLD
#define EEPROM_HOLD_DIS()		P12_bit.no0=1 //HOLD
#define EEPROM_PROTECT_EN()		P14_bit.no0=0 //WPB: Write prohibited
#define EEPROM_PROTECT_DIS()	P14_bit.no0=1 //WPB

/*BR25G320 Command*/
#define EEPROM_WREN  (0x06)  /*!< Write Enable >*/
#define EEPROM_WRDI  (0x04)  /*!< Write Disable >*/
#define EEPROM_RDSR  (0x05)  /*!< Read Status Register >*/
#define EEPROM_WRSR  (0x01)  /*!< Write Status Register >*/
#define EEPROM_READ  (0x03)  /*!< Read from Memory Array >*/
#define EEPROM_WRITE (0x02)  /*!< Write to Memory Array >*/

typedef enum {
	NONE_BLOCK, BLOCK_C00, BLOCK_800, BLOCK_ALL
}EEPROM_BLOCK_t;
union EEPROM_status_u{
	struct{
		uint8_t RB:1;
		uint8_t WEN:1;
		uint8_t BP:2;
		uint8_t RSVD: 3;
		uint8_t WPEN: 1;
	}refined;
	uint8_t raw;
};

void EEPROM_Init(volatile uint8_t *intp_flag, EEPROM_BLOCK_t block);
uint8_t rEE_Status(void);
void sEE_WriteEnable(void);
void sEE_WriteDisable(void);
void EE_SPI_Write(uint8_t *const pBuffer,
		uint16_t addr, uint16_t num);
void EE_SPI_Read(uint8_t *const pBuffer,
		uint16_t addr, uint16_t num);
void sEE_Block(EEPROM_BLOCK_t block);

/* Low layer functions */
void sEE_Read(uint8_t *const pBuffer, uint16_t ReadAddr,
		uint16_t NumByteToRead);
void sEE_Write(uint8_t *const pBuffer, uint16_t WriteAddr,
		uint16_t NumByteToWrite);

#ifdef __cplusplus
}
#endif

#endif /* EEPROM_H_ */
