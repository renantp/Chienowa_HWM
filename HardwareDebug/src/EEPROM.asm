#CC-RL Compiler RL78 Assembler Source
#@  CC-RL Version : V1.10.00 [20 Nov 2020]
#@  Commmand :
#@   -cpu=S3
#@   -c
#@   -dev=D:/Chieniwa/E2_Studio/.eclipse/com.renesas.platform_1435879475/DebugComp/RL78/RL78/Common/DR5F104ML.DVF
#@   -MAKEUD=D:\Chieniwa\E2_Studio\ControlPCB_HWM\HardwareDebug\src
#@   -I C:\Program Files (x86)\Renesas Electronics\CS+\CC\CC-RL\V1.10.00\inc
#@   -I D:\Chieniwa\E2_Studio\ControlPCB_HWM\generate
#@   -character_set=utf8
#@   -lang=c99
#@   -g
#@   -asmopt=-prn_path=src
#@   -asm_path=src/
#@   -pass_source
#@   -o src/EEPROM.obj
#@   ../src/EEPROM.c
#@  compiled at Mon Nov 22 10:16:12 2021

	.EXTERN _g_csi_rev_end
	.PUBLIC _eeprom_status
	.PUBLIC _spi_flag
	.PUBLIC _EEPROM_Init
	.EXTERN _R_CSI01_Create
	.PUBLIC _rEE_Status
	.PUBLIC _sEE_WriteEnable
	.PUBLIC _sEE_WriteDisable
	.PUBLIC _EE_SPI_Write
	.PUBLIC _EE_SPI_Read
	.PUBLIC _sEE_Block
	.PUBLIC _sEE_SendInstruction
	.PUBLIC _sEE_SendReceiveInstruction
	.PUBLIC _EE_TransmitData
	.PUBLIC _sEE_WriteStatusRegister
	.EXTERN _R_CSI01_Start
	.EXTERN _R_CSI01_Send_Receive

	.SECTION .textf,TEXTF
_EEPROM_Init:
	.STACK _EEPROM_Init = 8
	;***        1 : /*
	;***        2 :  * EEPROM.c
	;***        3 :  *
	;***        4 :  *  Created on: 23 Sep 2021
	;***        5 :  *      Author: Renan
	;***        6 :  */
	;***        7 : #include "EEPROM.h"
	;***        8 : #include "usr_timer.h"
	;***        9 : #include "r_cg_wdt.h"
	;***       10 : 
	;***       11 : //----------------Local function-------------------------
	;***       12 : void sEE_SendInstruction(uint8_t *instruction);
	;***       13 : void sEE_SendReceiveInstruction(uint8_t *p_data);
	;***       14 : void EE_TransmitData(uint8_t *p_data, uint8_t num);
	;***       15 : void sEE_WriteStatusRegister(uint8_t reg);
	;***       16 : //-------------------------------------------------------
	;***       17 : union EEPROM_status_u eeprom_status;
	;***       18 : volatile uint8_t *spi_flag;
	;***       19 : 
	;***       20 : /*!
	;***       21 :  * EEPROM initialize, setup SPI transmit end flag, setup write disable block
	;***       22 :  * @param intp_flag: SPI transmit done flag
	;***       23 :  * @param block
	;***       24 :  */
	;***       25 : void EEPROM_Init(volatile uint8_t *intp_flag, EEPROM_BLOCK_t block){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 25
	push ax
	push bc
	;***       26 : 	R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 26
	call !!_R_CSI01_Create
	movw hl, #0xFF0E
	;***       27 : 	EEPROM_HOLD_DIS();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 27
	set1 0xFFF0C.0
	;***       28 : 	EEPROM_PROTECT_DIS();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 28
	set1 [hl].0
	;***       29 : 	CSI01_CS_HIGH();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 29
	set1 [hl].1
	movw ax, [sp+0x02]
	;***       30 : 	spi_flag = intp_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 30
	movw !LOWW(_spi_flag), ax
	mov a, [sp+0x00]
	;***       31 : 	eeprom_status.refined.BP = block;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 31
	shl a, 0x02
	and a, #0x0C
	mov x, a
	mov a, #0xF3
	and a, !LOWW(_eeprom_status)
	add a, x
	mov !LOWW(_eeprom_status), a
	;***       32 : 	sEE_WriteStatusRegister(eeprom_status.raw);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 32
	addw sp, #0x04
	br $!_sEE_WriteStatusRegister
_rEE_Status:
	.STACK _rEE_Status = 6
	;***       33 : }
	;***       34 : /*!
	;***       35 :  * Read status register
	;***       36 :  * @return Status register
	;***       37 :  */
	;***       38 : uint8_t rEE_Status(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 38
	push hl
	;***       39 : 	uint8_t status = g_csi_rev_end;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 39
	mov a, !LOWW(_g_csi_rev_end)
	;***       40 : 	uint8_t cmd[2] = {EEPROM_RDSR};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 40
	mov [sp+0x01], #0x00
	mov [sp+0x00], #0x00
	mov [sp+0x00], #0x05
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 109
	mov c, #0x02
	movw ax, sp
	call $!_EE_TransmitData
	;***       41 : 	sEE_SendReceiveInstruction(cmd);
	;***       42 : 	eeprom_status.raw = cmd[1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 42
	mov a, [sp+0x01]
	mov !LOWW(_eeprom_status), a
	;***       43 : 	return cmd[1];
	;***       44 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 44
	pop hl
	ret
_sEE_WriteEnable:
	.STACK _sEE_WriteEnable = 6
	;***       45 : /*!
	;***       46 :  * Enable write and write status
	;***       47 :  */
	;***       48 : void sEE_WriteEnable(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 48
	push hl
	;***       49 : 	uint8_t command[2] = {EEPROM_WREN};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 49
	mov [sp+0x01], #0x00
	mov [sp+0x00], #0x00
	mov [sp+0x00], #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 106
	oneb c
	movw ax, sp
	call $!_EE_TransmitData
	pop hl
	ret
_sEE_WriteDisable:
	.STACK _sEE_WriteDisable = 6
	;***       50 : 	sEE_SendInstruction(command);
	;***       51 : }
	;***       52 : /*!
	;***       53 :  * Disable write and write status
	;***       54 :  */
	;***       55 : void sEE_WriteDisable(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 55
	push hl
	;***       56 : 	uint8_t command[2] = {EEPROM_WRDI};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 56
	mov [sp+0x01], #0x00
	mov [sp+0x00], #0x00
	mov [sp+0x00], #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 106
	oneb c
	movw ax, sp
	call $!_EE_TransmitData
	pop hl
	ret
_EE_SPI_Write:
	.STACK _EE_SPI_Write = 48
	;***       57 : 	sEE_SendInstruction(command);
	;***       58 : }
	;***       59 : /*!
	;***       60 :  * Write data to EEPROM
	;***       61 :  * @param pBuffer Pointer to data
	;***       62 :  * @param addr Address EEPROM (0x000 - 0xFFF)
	;***       63 :  * @param num Number of bytes
	;***       64 :  */
	;***       65 : void EE_SPI_Write(uint8_t *const pBuffer,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 65
	push de
	push ax
	subw sp, #0x26
	;***       66 : 		uint16_t addr, uint16_t num) {
	;***       67 : 	uint8_t buf[36] = {EEPROM_WRITE, addr>>8, addr};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 67
	movw de, #0x0024
	push bc
	movw ax, sp
	addw ax, #0x0004
	movw [sp+0x02], ax
	clrw bc
	call !!_memset
	mov [sp+0x04], #0x02
	movw ax, [sp+0x00]
	movw bc, ax
	mov [sp+0x05], a
	mov a, c
	mov [sp+0x06], a
	;***       68 : 	if(eeprom_status.refined.WEN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 68
	mov a, !LOWW(_eeprom_status)
	bf a.1, $.BB@LABEL@5_4
.BB@LABEL@5_1:	; entry.bb37_crit_edge
	clrb a
.BB@LABEL@5_2:	; entry.bb37_crit_edge
	mov [sp+0x00], a
	;***       69 : 		sEE_WriteEnable();
	;***       70 : 	for(uint8_t i=0; i<num; i++){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 70
	shrw ax, 8+0x00000
	movw de, ax
	movw ax, [sp+0x2A]
	movw bc, ax
	movw ax, de
	cmpw ax, bc
	bnc $.BB@LABEL@5_5
.BB@LABEL@5_3:	; bb
	movw bc, ax
	movw ax, [sp+0x28]
	addw ax, de
	movw de, ax
	movw ax, [sp+0x02]
	addw ax, bc
	;***       71 : 		buf[i+3] = pBuffer[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 71
	addw ax, #0x0003
	movw hl, ax
	mov a, [de]
	mov [hl], a
	mov a, [sp+0x00]
	inc a
	br $.BB@LABEL@5_2
.BB@LABEL@5_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 69
	call $!_sEE_WriteEnable
	br $.BB@LABEL@5_1
.BB@LABEL@5_5:	; bb44
	mov a, [sp+0x2A]
	;***       72 : 	}
	;***       73 : 	EE_TransmitData(buf, num+3);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 73
	add a, #0x03
	mov c, a
	movw ax, sp
	addw ax, #0x0004
	call $!_EE_TransmitData
	addw sp, #0x2C
	ret
_EE_SPI_Read:
	.STACK _EE_SPI_Read = 48
	;***       74 : }
	;***       75 : /*!
	;***       76 :  * Read data from EEPROM
	;***       77 :  * @param pBuffer Pointer to read buffer
	;***       78 :  * @param addr Read EEPROM address (0x000 - 0xFFF)
	;***       79 :  * @param num Number if bytes to read
	;***       80 :  */
	;***       81 : void EE_SPI_Read(uint8_t *const pBuffer,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 81
	push de
	push ax
	subw sp, #0x26
	;***       82 : 		uint16_t addr, uint16_t num){
	;***       83 : 	uint8_t buf[36] = {EEPROM_READ, addr>>8, addr};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 83
	movw de, #0x0024
	push bc
	clrw bc
	movw ax, sp
	addw ax, #0x0004
	call !!_memset
	mov [sp+0x04], #0x03
	movw ax, [sp+0x00]
	movw bc, ax
	mov [sp+0x05], a
	mov a, c
	mov [sp+0x06], a
.BB@LABEL@6_1:	; bb
	;***       84 : 	//Wait until EEPROM Ready
	;***       85 : 	do{
	;***       86 :     	rEE_Status();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 86
	call $!_rEE_Status
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 85
	movw hl, #LOWW(_eeprom_status)
	bt [hl].0, $.BB@LABEL@6_1
.BB@LABEL@6_2:	; bb25
	mov a, [sp+0x2A]
	;***       87 :     }while(eeprom_status.refined.RB == 1);
	;***       88 : 
	;***       89 : 	EE_TransmitData(buf, num+3);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 89
	add a, #0x03
	mov c, a
	movw ax, sp
	addw ax, #0x0004
	movw [sp+0x02], ax
	call $!_EE_TransmitData
	clrb a
.BB@LABEL@6_3:	; bb25
	mov [sp+0x00], a
	;***       90 : 	for(uint8_t i=0; i<num; i++){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 90
	shrw ax, 8+0x00000
	movw de, ax
	movw ax, [sp+0x2A]
	movw bc, ax
	movw ax, de
	cmpw ax, bc
	bnc $.BB@LABEL@6_5
.BB@LABEL@6_4:	; bb30
	;***       91 : 		pBuffer[i] = buf[i+3];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 91
	movw bc, ax
	movw ax, [sp+0x02]
	addw ax, de
	addw ax, #0x0003
	movw de, ax
	movw ax, [sp+0x28]
	addw ax, bc
	movw hl, ax
	mov a, [de]
	mov [hl], a
	mov a, [sp+0x00]
	inc a
	br $.BB@LABEL@6_3
.BB@LABEL@6_5:	; return
	;***       92 : 	}
	;***       93 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 93
	addw sp, #0x2C
	ret
_sEE_Block:
	.STACK _sEE_Block = 4
	;***       94 : /*!
	;***       95 :  * Write disable block
	;***       96 :  * @param block: NONE_BLOCK, BLOCK_C00, BLOCK_800, BLOCK_ALL
	;***       97 :  */
	;***       98 : void sEE_Block(EEPROM_BLOCK_t block){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 98
	shl a, 0x02
	;***       99 : 	eeprom_status.refined.BP = block;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 99
	and a, #0x0C
	mov x, a
	mov a, #0xF3
	and a, !LOWW(_eeprom_status)
	add a, x
	mov !LOWW(_eeprom_status), a
	;***      100 : 	sEE_WriteStatusRegister(eeprom_status.raw);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 100
	br $_sEE_WriteStatusRegister
_sEE_SendInstruction:
	.STACK _sEE_SendInstruction = 4
	;***      101 : }
	;***      102 : /*------------------------------------------------------------------
	;***      103 :  * ----------------------Local function-----------------------------
	;***      104 :  */
	;***      105 : void sEE_SendInstruction(uint8_t *instruction){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 105
	oneb c
	;***      106 : 	EE_TransmitData(instruction, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 106
	br $_EE_TransmitData
_sEE_SendReceiveInstruction:
	.STACK _sEE_SendReceiveInstruction = 4
	;***      107 : }
	;***      108 : void sEE_SendReceiveInstruction(uint8_t *p_data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 108
	mov c, #0x02
	;***      109 : 	EE_TransmitData(p_data, 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 109
	br $_EE_TransmitData
_EE_TransmitData:
	.STACK _EE_TransmitData = 10
	;***      110 : }
	;***      111 : void EE_TransmitData(uint8_t *p_data, uint8_t num){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 111
	movw de, !LOWW(_spi_flag)
	push ax
	push bc
	;***      112 : 	uint8_t status = *spi_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 112
	mov a, [de]
	mov [sp+0x01], a
	;***      113 : 	CSI01_CS_LOW();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 113
	clr1 0xFFF0E.1
	;***      114 : 	R_CSI01_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 114
	call !!_R_CSI01_Start
	movw ax, [sp+0x02]
	movw hl, ax
	;***      115 : 	R_CSI01_Send_Receive(p_data, num, p_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 115
	push hl
	pop de
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw bc, ax
	movw ax, hl
	call !!_R_CSI01_Send_Receive
.BB@LABEL@10_1:	; bb10
	;***      116 : 	while(*spi_flag == status);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 116
	movw hl, !LOWW(_spi_flag)
	mov a, [sp+0x01]
	cmp a, [hl]
	bz $.BB@LABEL@10_1
.BB@LABEL@10_2:	; bb18
	;***      117 : 	CSI01_CS_HIGH();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 117
	set1 0xFFF0E.1
	addw sp, #0x04
	ret
_sEE_WriteStatusRegister:
	.STACK _sEE_WriteStatusRegister = 6
	;***      118 : }
	;***      119 : void sEE_WriteStatusRegister(uint8_t reg){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 119
	push hl
	;***      120 : 	uint8_t buf[2] = {EEPROM_WRSR ,reg};
	;***      121 : 	if(eeprom_status.refined.WEN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 121
	movw hl, #LOWW(_eeprom_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 120
	mov [sp+0x01], #0x00
	mov [sp+0x00], #0x01
	mov [sp+0x01], a
	bt [hl].1, $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_then_bb
	;***      122 : 		sEE_WriteEnable();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 122
	call $!_sEE_WriteEnable
.BB@LABEL@11_2:	; if_break_bb
	;***      123 : 	EE_TransmitData(buf, 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 123
	mov c, #0x02
	movw ax, sp
	call $!_EE_TransmitData
	pop hl
	ret
	;***      124 : }
	.SECTION .bss,BSS
_eeprom_status:
	.DS (1)
	.ALIGN 2
_spi_flag:
	.DS (2)
	.SECTION .const,CONST
.STR@1:
	.DB 0x01
	.DS (1)
