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
#@  compiled at Fri Jan 28 15:05:19 2022

	.EXTERN _g_csi_rev_end
	.PUBLIC _eeprom_status
	.PUBLIC _spi_flag
	.PUBLIC _buf
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
	;***       19 : uint8_t buf[32+3];
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 167
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 164
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 164
	oneb c
	movw ax, sp
	call $!_EE_TransmitData
	pop hl
	ret
_EE_SPI_Write:
	.STACK _EE_SPI_Write = 14
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
	push bc
	push ax
	subw sp, #0x06
	;***       66 : 		uint16_t addr, uint32_t num) {
	;***       67 : 	uint8_t page = num/32;
	;***       68 : 	uint8_t max_page = page;
	;***       69 : 	uint8_t rsvd = num%32;
	;***       70 : 	uint8_t *p = pBuffer;
	;***       71 : 	buf[0] = EEPROM_WRITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 71
	mov !LOWW(_buf), #0x02
	;***       72 : 	buf[1] = addr>>8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 72
	movw ax, bc
	mov !LOWW(_buf+0x00001), a
	movw ax, [sp+0x0E]
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 69
	mov a, x
	and a, #0x1F
	mov [sp+0x02], a
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 67
	shrw ax, 0x05
	mov a, x
	mov [sp+0x04], a
	;***       73 : 	buf[2] = addr;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 73
	inc a
	mov [sp+0x03], a
	mov a, [sp+0x04]
.BB@LABEL@5_1:	; entry
	dec a
	mov [sp+0x01], a
	mov a, c
	mov !LOWW(_buf+0x00002), a
	mov a, [sp+0x03]
	;***       74 : 	while(page != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 74
	dec a
	mov [sp+0x03], a
	bz $.BB@LABEL@5_10
.BB@LABEL@5_2:	; bb23
	;***       75 : 		do{
	;***       76 : 			rEE_Status();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 76
	call $!_rEE_Status
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 75
	movw hl, #LOWW(_eeprom_status)
	bt [hl].0, $.BB@LABEL@5_2
.BB@LABEL@5_3:	; bb31
	;***       77 : 		}while(eeprom_status.refined.RB == 1);
	;***       78 : 		if(eeprom_status.refined.WEN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 78
	bf [hl].1, $.BB@LABEL@5_8
.BB@LABEL@5_4:	; bb31.bb39_crit_edge
	clrb a
	mov [sp+0x00], a
.BB@LABEL@5_5:	; bb39
	;***       79 : 				sEE_WriteEnable();
	;***       80 : 
	;***       81 : 		for(uint8_t i=0; i<32; i++){
	;***       82 : 			buf[i+3] = p[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 82
	shrw ax, 8+0x00000
	movw bc, ax
	movw ax, [sp+0x06]
	addw ax, bc
	movw de, ax
	mov a, [sp+0x00]
	mov b, a
	mov a, [de]
	mov LOWW(_buf+0x00003)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 81
	inc b
	mov a, b
	mov [sp+0x00], a
	cmp a, #0x20
	bnz $.BB@LABEL@5_5
.BB@LABEL@5_6:	; bb61
	;***       83 : 		}
	;***       84 : 		while(eeprom_status.refined.WEN == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 84
	movw hl, #LOWW(_eeprom_status)
	bt [hl].1, $.BB@LABEL@5_9
.BB@LABEL@5_7:	; bb59
	;***       85 : 			rEE_Status();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 85
	call $!_rEE_Status
	br $.BB@LABEL@5_6
.BB@LABEL@5_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 79
	call $!_sEE_WriteEnable
	br $.BB@LABEL@5_4
.BB@LABEL@5_9:	; bb69
	;***       86 : 		}
	;***       87 : 		EE_TransmitData(buf, 32+3);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 87
	mov c, #0x23
	movw ax, #LOWW(_buf)
	call $!_EE_TransmitData
	;***       88 : 		page--;
	;***       89 : 		p+=32;
	;***       90 : 		addr = addr + (uint16_t)0x0020*(max_page-page);
	;***       91 : 		buf[0] = EEPROM_WRITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 91
	mov !LOWW(_buf), #0x02
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 90
	shrw ax, 8+0x00000
	movw bc, ax
	mov a, [sp+0x04]
	shrw ax, 8+0x00000
	subw ax, bc
	movw bc, ax
	shlw bc, 0x05
	movw ax, [sp+0x08]
	addw ax, bc
	movw [sp+0x08], ax
	movw bc, ax
	;***       92 : 		buf[1] = addr>>8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 92
	mov !LOWW(_buf+0x00001), a
	movw ax, [sp+0x06]
	;***       93 : 		buf[2] = addr;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 93
	addw ax, #0x0020
	movw [sp+0x06], ax
	mov a, [sp+0x01]
	br $.BB@LABEL@5_1
.BB@LABEL@5_10:	; bb93
	mov a, [sp+0x02]
	;***       94 : 	}
	;***       95 : 
	;***       96 : 	if(rsvd != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 96
	cmp0 a
	bnz $.BB@LABEL@5_12
.BB@LABEL@5_11:	; return
	;***       97 : 		do{
	;***       98 : 			rEE_Status();
	;***       99 : 		}while(eeprom_status.refined.RB == 1);
	;***      100 : 		if(eeprom_status.refined.WEN == 0)
	;***      101 : 			sEE_WriteEnable();
	;***      102 : 		for(uint8_t i=0; i<rsvd; i++){
	;***      103 : 			buf[i+3] = p[i];
	;***      104 : 		}
	;***      105 : 		while(eeprom_status.refined.WEN == 0){
	;***      106 : 			rEE_Status();
	;***      107 : 		}
	;***      108 : 		EE_TransmitData(buf, rsvd+3);
	;***      109 : 	}
	;***      110 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 110
	addw sp, #0x0A
	ret
.BB@LABEL@5_12:	; bb100
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 98
	call $!_rEE_Status
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 97
	movw hl, #LOWW(_eeprom_status)
	bt [hl].0, $.BB@LABEL@5_12
.BB@LABEL@5_13:	; bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 100
	bf [hl].1, $.BB@LABEL@5_17
.BB@LABEL@5_14:	; bb109.bb132_crit_edge
	clrb a
.BB@LABEL@5_15:	; bb109.bb132_crit_edge
	mov [sp+0x00], a
	mov a, [sp+0x02]
	mov x, a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 102
	cmp a, x
	bz $.BB@LABEL@5_18
.BB@LABEL@5_16:	; bb119
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 103
	shrw ax, 8+0x00000
	movw bc, ax
	movw ax, [sp+0x06]
	addw ax, bc
	movw de, ax
	mov a, [sp+0x00]
	mov b, a
	mov a, [de]
	mov LOWW(_buf+0x00003)[b], a
	mov a, [sp+0x00]
	inc a
	br $.BB@LABEL@5_15
.BB@LABEL@5_17:	; if_then_bb117
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 101
	call $!_sEE_WriteEnable
	br $.BB@LABEL@5_14
.BB@LABEL@5_18:	; bb143
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 105
	movw hl, #LOWW(_eeprom_status)
	bt [hl].1, $.BB@LABEL@5_20
.BB@LABEL@5_19:	; bb141
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 106
	call $!_rEE_Status
	br $.BB@LABEL@5_18
.BB@LABEL@5_20:	; bb151
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 108
	add a, #0x03
	mov c, a
	movw ax, #LOWW(_buf)
	addw sp, #0x0A
	br $!_EE_TransmitData
_EE_SPI_Read:
	.STACK _EE_SPI_Read = 14
	;***      111 : /*!
	;***      112 :  * Read data from EEPROM
	;***      113 :  * @param pBuffer Pointer to read buffer
	;***      114 :  * @param addr Read EEPROM address (0x000 - 0xFFF)
	;***      115 :  * @param num Number if bytes to read
	;***      116 :  */
	;***      117 : void EE_SPI_Read(uint8_t *const pBuffer,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 117
	push bc
	push ax
	subw sp, #0x06
	;***      118 : 		uint16_t addr, uint32_t num){
	;***      119 : 	uint8_t page = num/32;
	;***      120 : 	uint8_t max_page = page;
	;***      121 : 	uint8_t rsvd = num%32;
	;***      122 : 	uint8_t *p = pBuffer;
	;***      123 : 	buf[0] = EEPROM_READ;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 123
	mov !LOWW(_buf), #0x03
	;***      124 : 	buf[1] = addr>>8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 124
	movw ax, bc
	mov !LOWW(_buf+0x00001), a
	movw ax, [sp+0x0E]
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 121
	mov a, x
	and a, #0x1F
	mov [sp+0x02], a
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 119
	shrw ax, 0x05
	mov a, x
	mov [sp+0x04], a
	;***      125 : 	buf[2] = addr;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 125
	inc a
	mov [sp+0x03], a
	mov a, [sp+0x04]
.BB@LABEL@6_1:	; entry
	dec a
	mov [sp+0x01], a
	mov a, c
	mov !LOWW(_buf+0x00002), a
	mov a, [sp+0x03]
	;***      126 : 	while(page != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 126
	dec a
	mov [sp+0x03], a
	bz $.BB@LABEL@6_6
.BB@LABEL@6_2:	; bb23
	;***      127 : 	//Wait until EEPROM Ready
	;***      128 : 		do{
	;***      129 : 	    	rEE_Status();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 129
	call $!_rEE_Status
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 128
	movw hl, #LOWW(_eeprom_status)
	bt [hl].0, $.BB@LABEL@6_2
.BB@LABEL@6_3:	; bb31
	;***      130 : 	    }while(eeprom_status.refined.RB == 1);
	;***      131 : 		EE_TransmitData(buf, 32+3);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 131
	mov c, #0x23
	movw ax, #LOWW(_buf)
	call $!_EE_TransmitData
	clrb a
	mov [sp+0x00], a
.BB@LABEL@6_4:	; bb32
	;***      132 : 		for(uint8_t i=0; i<32; i++){
	;***      133 : 			p[i] = buf[i+3];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 133
	shrw ax, 8+0x00000
	movw bc, ax
	movw ax, [sp+0x06]
	addw ax, bc
	movw de, ax
	mov a, [sp+0x00]
	mov b, a
	mov a, LOWW(_buf+0x00003)[b]
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 132
	inc b
	mov a, b
	mov [sp+0x00], a
	cmp a, #0x20
	bnz $.BB@LABEL@6_4
.BB@LABEL@6_5:	; bb51
	;***      134 : 		}
	;***      135 : 		page--;
	;***      136 : 		p+=32;
	;***      137 : 		addr = addr + (uint16_t)0x0020*(max_page-page);
	;***      138 : 		buf[0] = EEPROM_READ;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 138
	mov !LOWW(_buf), #0x03
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 137
	shrw ax, 8+0x00000
	movw bc, ax
	mov a, [sp+0x04]
	shrw ax, 8+0x00000
	subw ax, bc
	movw bc, ax
	shlw bc, 0x05
	movw ax, [sp+0x08]
	addw ax, bc
	movw [sp+0x08], ax
	movw bc, ax
	;***      139 : 		buf[1] = addr>>8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 139
	mov !LOWW(_buf+0x00001), a
	movw ax, [sp+0x06]
	;***      140 : 		buf[2] = addr;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 140
	addw ax, #0x0020
	movw [sp+0x06], ax
	mov a, [sp+0x01]
	br $.BB@LABEL@6_1
.BB@LABEL@6_6:	; bb75
	mov a, [sp+0x02]
	;***      141 : 	}
	;***      142 : 	if(rsvd != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 142
	cmp0 a
	bz $.BB@LABEL@6_11
.BB@LABEL@6_7:	; bb81
	;***      143 : 		do{
	;***      144 : 			rEE_Status();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 144
	call $!_rEE_Status
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 143
	movw hl, #LOWW(_eeprom_status)
	bt [hl].0, $.BB@LABEL@6_7
.BB@LABEL@6_8:	; bb90
	mov a, [sp+0x02]
	;***      145 : 		}while(eeprom_status.refined.RB == 1);
	;***      146 : 		EE_TransmitData(buf, rsvd+3);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 146
	add a, #0x03
	mov c, a
	movw ax, #LOWW(_buf)
	call $!_EE_TransmitData
	clrb a
.BB@LABEL@6_9:	; bb90
	mov [sp+0x00], a
	mov a, [sp+0x02]
	mov x, a
	mov a, [sp+0x00]
	;***      147 : 		for(uint8_t i=0; i<rsvd; i++){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 147
	cmp a, x
	bz $.BB@LABEL@6_11
.BB@LABEL@6_10:	; bb95
	;***      148 : 			p[i] = buf[i+3];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 148
	shrw ax, 8+0x00000
	movw bc, ax
	movw ax, [sp+0x06]
	addw ax, bc
	movw de, ax
	mov a, [sp+0x00]
	mov b, a
	mov a, LOWW(_buf+0x00003)[b]
	mov [de], a
	mov a, [sp+0x00]
	inc a
	br $.BB@LABEL@6_9
.BB@LABEL@6_11:	; return
	;***      149 : 		}
	;***      150 : 	}
	;***      151 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 151
	addw sp, #0x0A
	ret
_sEE_Block:
	.STACK _sEE_Block = 4
	;***      152 : /*!
	;***      153 :  * Write disable block
	;***      154 :  * @param block: NONE_BLOCK, BLOCK_C00, BLOCK_800, BLOCK_ALL
	;***      155 :  */
	;***      156 : void sEE_Block(EEPROM_BLOCK_t block){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 156
	shl a, 0x02
	;***      157 : 	eeprom_status.refined.BP = block;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 157
	and a, #0x0C
	mov x, a
	mov a, #0xF3
	and a, !LOWW(_eeprom_status)
	add a, x
	mov !LOWW(_eeprom_status), a
	;***      158 : 	sEE_WriteStatusRegister(eeprom_status.raw);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 158
	br $_sEE_WriteStatusRegister
_sEE_SendInstruction:
	.STACK _sEE_SendInstruction = 4
	;***      159 : }
	;***      160 : /*------------------------------------------------------------------
	;***      161 :  * ----------------------Local function-----------------------------
	;***      162 :  */
	;***      163 : void sEE_SendInstruction(uint8_t *instruction){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 163
	oneb c
	;***      164 : 	EE_TransmitData(instruction, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 164
	br $_EE_TransmitData
_sEE_SendReceiveInstruction:
	.STACK _sEE_SendReceiveInstruction = 4
	;***      165 : }
	;***      166 : void sEE_SendReceiveInstruction(uint8_t *p_data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 166
	mov c, #0x02
	;***      167 : 	EE_TransmitData(p_data, 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 167
	br $_EE_TransmitData
_EE_TransmitData:
	.STACK _EE_TransmitData = 10
	;***      168 : }
	;***      169 : void EE_TransmitData(uint8_t *p_data, uint8_t num){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 169
	movw de, !LOWW(_spi_flag)
	push ax
	push bc
	;***      170 : 	uint8_t status = *spi_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 170
	mov a, [de]
	mov [sp+0x01], a
	;***      171 : 	CSI01_CS_LOW();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 171
	clr1 0xFFF0E.1
	;***      172 : 	R_CSI01_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 172
	call !!_R_CSI01_Start
	movw ax, [sp+0x02]
	movw hl, ax
	;***      173 : 	R_CSI01_Send_Receive(p_data, num, p_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 173
	push hl
	pop de
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw bc, ax
	movw ax, hl
	call !!_R_CSI01_Send_Receive
.BB@LABEL@10_1:	; bb10
	;***      174 : 	while(*spi_flag == status);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 174
	movw hl, !LOWW(_spi_flag)
	mov a, [sp+0x01]
	cmp a, [hl]
	bz $.BB@LABEL@10_1
.BB@LABEL@10_2:	; bb18
	;***      175 : 	CSI01_CS_HIGH();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 175
	set1 0xFFF0E.1
	addw sp, #0x04
	ret
_sEE_WriteStatusRegister:
	.STACK _sEE_WriteStatusRegister = 6
	;***      176 : }
	;***      177 : void sEE_WriteStatusRegister(uint8_t reg){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 177
	push hl
	;***      178 : 	uint8_t buf[2] = {EEPROM_WRSR ,reg};
	;***      179 : 	if(eeprom_status.refined.WEN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 179
	movw hl, #LOWW(_eeprom_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 178
	mov [sp+0x01], #0x00
	mov [sp+0x00], #0x01
	mov [sp+0x01], a
	bt [hl].1, $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_then_bb
	;***      180 : 		sEE_WriteEnable();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 180
	call $!_sEE_WriteEnable
.BB@LABEL@11_2:	; if_break_bb
	;***      181 : 	EE_TransmitData(buf, 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/EEPROM.c", 181
	mov c, #0x02
	movw ax, sp
	call $!_EE_TransmitData
	pop hl
	ret
	;***      182 : }
	.SECTION .bss,BSS
_eeprom_status:
	.DS (1)
	.ALIGN 2
_spi_flag:
	.DS (2)
_buf:
	.DS (35)
	.SECTION .const,CONST
.STR@1:
	.DB 0x01
	.DS (1)
