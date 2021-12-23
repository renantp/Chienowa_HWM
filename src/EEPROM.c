/*
 * EEPROM.c
 *
 *  Created on: 23 Sep 2021
 *      Author: Renan
 */
#include "EEPROM.h"
#include "usr_timer.h"
#include "r_cg_wdt.h"

//----------------Local function-------------------------
void sEE_SendInstruction(uint8_t *instruction);
void sEE_SendReceiveInstruction(uint8_t *p_data);
void EE_TransmitData(uint8_t *p_data, uint8_t num);
void sEE_WriteStatusRegister(uint8_t reg);
//-------------------------------------------------------
union EEPROM_status_u eeprom_status;
volatile uint8_t *spi_flag;
uint8_t buf[32+3];
/*!
 * EEPROM initialize, setup SPI transmit end flag, setup write disable block
 * @param intp_flag: SPI transmit done flag
 * @param block
 */
void EEPROM_Init(volatile uint8_t *intp_flag, EEPROM_BLOCK_t block){
	R_CSI01_Create();
	EEPROM_HOLD_DIS();
	EEPROM_PROTECT_DIS();
	CSI01_CS_HIGH();
	spi_flag = intp_flag;
	eeprom_status.refined.BP = block;
	sEE_WriteStatusRegister(eeprom_status.raw);
}
/*!
 * Read status register
 * @return Status register
 */
uint8_t rEE_Status(void){
	uint8_t status = g_csi_rev_end;
	uint8_t cmd[2] = {EEPROM_RDSR};
	sEE_SendReceiveInstruction(cmd);
	eeprom_status.raw = cmd[1];
	return cmd[1];
}
/*!
 * Enable write and write status
 */
void sEE_WriteEnable(void) {
	uint8_t command[2] = {EEPROM_WREN};
	sEE_SendInstruction(command);
}
/*!
 * Disable write and write status
 */
void sEE_WriteDisable(void) {
	uint8_t command[2] = {EEPROM_WRDI};
	sEE_SendInstruction(command);
}
/*!
 * Write data to EEPROM
 * @param pBuffer Pointer to data
 * @param addr Address EEPROM (0x000 - 0xFFF)
 * @param num Number of bytes
 */
void EE_SPI_Write(uint8_t *const pBuffer,
		uint16_t addr, uint32_t num) {
	uint8_t page = num/32;
	uint8_t max_page = page;
	uint8_t rsvd = num%32;
	uint8_t *p = pBuffer;
	buf[0] = EEPROM_WRITE;
	buf[1] = addr>>8;
	buf[2] = addr;
	while(page != 0){
		do{
			rEE_Status();
		}while(eeprom_status.refined.RB == 1);
		if(eeprom_status.refined.WEN == 0)
				sEE_WriteEnable();

		for(uint8_t i=0; i<32; i++){
			buf[i+3] = p[i];
		}
		while(eeprom_status.refined.WEN == 0){
			rEE_Status();
		}
		EE_TransmitData(buf, 32+3);
		page--;
		p+=32;
		addr = addr + (uint16_t)0x0020*(max_page-page);
		buf[0] = EEPROM_WRITE;
		buf[1] = addr>>8;
		buf[2] = addr;
	}

	if(rsvd != 0){
		do{
			rEE_Status();
		}while(eeprom_status.refined.RB == 1);
		if(eeprom_status.refined.WEN == 0)
			sEE_WriteEnable();
		for(uint8_t i=0; i<rsvd; i++){
			buf[i+3] = p[i];
		}
		while(eeprom_status.refined.WEN == 0){
			rEE_Status();
		}
		EE_TransmitData(buf, rsvd+3);
	}
}
/*!
 * Read data from EEPROM
 * @param pBuffer Pointer to read buffer
 * @param addr Read EEPROM address (0x000 - 0xFFF)
 * @param num Number if bytes to read
 */
void EE_SPI_Read(uint8_t *const pBuffer,
		uint16_t addr, uint32_t num){
	uint8_t page = num/32;
	uint8_t max_page = page;
	uint8_t rsvd = num%32;
	uint8_t *p = pBuffer;
	buf[0] = EEPROM_READ;
	buf[1] = addr>>8;
	buf[2] = addr;
	while(page != 0){
	//Wait until EEPROM Ready
		do{
	    	rEE_Status();
	    }while(eeprom_status.refined.RB == 1);
		EE_TransmitData(buf, 32+3);
		for(uint8_t i=0; i<32; i++){
			p[i] = buf[i+3];
		}
		page--;
		p+=32;
		addr = addr + (uint16_t)0x0020*(max_page-page);
		buf[0] = EEPROM_READ;
		buf[1] = addr>>8;
		buf[2] = addr;
	}
	if(rsvd != 0){
		do{
			rEE_Status();
		}while(eeprom_status.refined.RB == 1);
		EE_TransmitData(buf, rsvd+3);
		for(uint8_t i=0; i<rsvd; i++){
			p[i] = buf[i+3];
		}
	}
}
/*!
 * Write disable block
 * @param block: NONE_BLOCK, BLOCK_C00, BLOCK_800, BLOCK_ALL
 */
void sEE_Block(EEPROM_BLOCK_t block){
	eeprom_status.refined.BP = block;
	sEE_WriteStatusRegister(eeprom_status.raw);
}
/*------------------------------------------------------------------
 * ----------------------Local function-----------------------------
 */
void sEE_SendInstruction(uint8_t *instruction){
	EE_TransmitData(instruction, 1);
}
void sEE_SendReceiveInstruction(uint8_t *p_data) {
	EE_TransmitData(p_data, 2);
}
void EE_TransmitData(uint8_t *p_data, uint8_t num){
	uint8_t status = *spi_flag;
	CSI01_CS_LOW();
	R_CSI01_Start();
	R_CSI01_Send_Receive(p_data, num, p_data);
	while(*spi_flag == status);
	CSI01_CS_HIGH();
}
void sEE_WriteStatusRegister(uint8_t reg){
	uint8_t buf[2] = {EEPROM_WRSR ,reg};
	if(eeprom_status.refined.WEN == 0)
		sEE_WriteEnable();
	EE_TransmitData(buf, 2);
}
