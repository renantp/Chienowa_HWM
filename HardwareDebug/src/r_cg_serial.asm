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
#@   -o src/r_cg_serial.obj
#@   ../src/r_cg_serial.c
#@  compiled at Thu Jun 30 14:37:27 2022

	.PUBLIC _gp_uart1_tx_address
	.PUBLIC _g_uart1_tx_count
	.PUBLIC _gp_uart1_rx_address
	.PUBLIC _g_uart1_rx_count
	.PUBLIC _g_uart1_rx_length
	.PUBLIC _gp_csi00_rx_address
	.PUBLIC _g_csi00_rx_length
	.PUBLIC _g_csi00_rx_count
	.PUBLIC _gp_csi00_tx_address
	.PUBLIC _g_csi00_send_length
	.PUBLIC _g_csi00_tx_count
	.PUBLIC _gp_csi01_rx_address
	.PUBLIC _g_csi01_rx_length
	.PUBLIC _g_csi01_rx_count
	.PUBLIC _gp_csi01_tx_address
	.PUBLIC _g_csi01_send_length
	.PUBLIC _g_csi01_tx_count
	.PUBLIC _gp_uart2_tx_address
	.PUBLIC _g_uart2_tx_count
	.PUBLIC _gp_uart2_rx_address
	.PUBLIC _g_uart2_rx_count
	.PUBLIC _g_uart2_rx_length
	.PUBLIC _gp_uart3_tx_address
	.PUBLIC _g_uart3_tx_count
	.PUBLIC _gp_uart3_rx_address
	.PUBLIC _g_uart3_rx_count
	.PUBLIC _g_uart3_rx_length
	.PUBLIC _R_CSI01_Receive
	.PUBLIC _R_CSI01_Send
	.PUBLIC _R_SAU0_Create
	.PUBLIC _R_UART1_Create
	.PUBLIC _R_UART1_Start
	.PUBLIC _R_UART1_Stop
	.PUBLIC _R_UART1_Receive
	.PUBLIC _R_UART1_Send
	.PUBLIC _R_CSI00_Create
	.PUBLIC _R_CSI00_Start
	.PUBLIC _R_CSI00_Stop
	.PUBLIC _R_CSI00_Send
	.PUBLIC _R_CSI01_Create
	.PUBLIC _R_CSI01_Start
	.PUBLIC _R_CSI01_Stop
	.PUBLIC _R_CSI01_Send_Receive
	.PUBLIC _R_SAU1_Create
	.PUBLIC _R_UART2_Create
	.PUBLIC _R_UART2_Start
	.PUBLIC _R_UART2_Stop
	.PUBLIC _R_UART2_Receive
	.PUBLIC _R_UART2_Send
	.PUBLIC _R_UART3_Create
	.PUBLIC _R_UART3_Start
	.PUBLIC _R_UART3_Stop
	.PUBLIC _R_UART3_Receive
	.PUBLIC _R_UART3_Send

	.SECTION .textf,TEXTF
_R_CSI01_Receive:
	.STACK _R_CSI01_Receive = 4
	;***        1 : /***********************************************************************************************************************
	;***        2 : * DISCLAIMER
	;***        3 : * This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products.
	;***        4 : * No other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
	;***        5 : * applicable laws, including copyright laws. 
	;***        6 : * THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING THIS SOFTWARE, WHETHER EXPRESS, IMPLIED
	;***        7 : * OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	;***        8 : * NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY
	;***        9 : * LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE FOR ANY DIRECT,
	;***       10 : * INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR
	;***       11 : * ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
	;***       12 : * Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability 
	;***       13 : * of this software. By using this software, you agree to the additional terms and conditions found by accessing the 
	;***       14 : * following link:
	;***       15 : * http://www.renesas.com/disclaimer
	;***       16 : *
	;***       17 : * Copyright (C) 2011, 2020 Renesas Electronics Corporation. All rights reserved.
	;***       18 : ***********************************************************************************************************************/
	;***       19 : 
	;***       20 : /***********************************************************************************************************************
	;***       21 : * File Name    : r_cg_serial.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for Serial module.
	;***       26 : * Creation Date: 19/04/2022
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_serial.h"
	;***       34 : /* Start user code for include. Do not edit comment generated here */
	;***       35 : /* End user code. Do not edit comment generated here */
	;***       36 : #include "r_cg_userdefine.h"
	;***       37 : 
	;***       38 : /***********************************************************************************************************************
	;***       39 : Pragma directive
	;***       40 : ***********************************************************************************************************************/
	;***       41 : /* Start user code for pragma. Do not edit comment generated here */
	;***       42 : /* End user code. Do not edit comment generated here */
	;***       43 : 
	;***       44 : /***********************************************************************************************************************
	;***       45 : Global variables and functions
	;***       46 : ***********************************************************************************************************************/
	;***       47 : volatile uint8_t * gp_uart1_tx_address;        /* uart1 transmit buffer address */
	;***       48 : volatile uint16_t  g_uart1_tx_count;           /* uart1 transmit data number */
	;***       49 : volatile uint8_t * gp_uart1_rx_address;        /* uart1 receive buffer address */
	;***       50 : volatile uint16_t  g_uart1_rx_count;           /* uart1 receive data number */
	;***       51 : volatile uint16_t  g_uart1_rx_length;          /* uart1 receive data length */
	;***       52 : volatile uint8_t * gp_csi00_rx_address;        /* csi00 receive buffer address */
	;***       53 : volatile uint16_t  g_csi00_rx_length;          /* csi00 receive data length */
	;***       54 : volatile uint16_t  g_csi00_rx_count;           /* csi00 receive data count */
	;***       55 : volatile uint8_t * gp_csi00_tx_address;        /* csi00 send buffer address */
	;***       56 : volatile uint16_t  g_csi00_send_length;        /* csi00 send data length */
	;***       57 : volatile uint16_t  g_csi00_tx_count;           /* csi00 send data count */
	;***       58 : volatile uint8_t * gp_csi01_rx_address;        /* csi01 receive buffer address */
	;***       59 : volatile uint16_t  g_csi01_rx_length;          /* csi01 receive data length */
	;***       60 : volatile uint16_t  g_csi01_rx_count;           /* csi01 receive data count */
	;***       61 : volatile uint8_t * gp_csi01_tx_address;        /* csi01 send buffer address */
	;***       62 : volatile uint16_t  g_csi01_send_length;        /* csi01 send data length */
	;***       63 : volatile uint16_t  g_csi01_tx_count;           /* csi01 send data count */
	;***       64 : volatile uint8_t * gp_uart2_tx_address;        /* uart2 transmit buffer address */
	;***       65 : volatile uint16_t  g_uart2_tx_count;           /* uart2 transmit data number */
	;***       66 : volatile uint8_t * gp_uart2_rx_address;        /* uart2 receive buffer address */
	;***       67 : volatile uint16_t  g_uart2_rx_count;           /* uart2 receive data number */
	;***       68 : volatile uint16_t  g_uart2_rx_length;          /* uart2 receive data length */
	;***       69 : volatile uint8_t * gp_uart3_tx_address;        /* uart3 transmit buffer address */
	;***       70 : volatile uint16_t  g_uart3_tx_count;           /* uart3 transmit data number */
	;***       71 : volatile uint8_t * gp_uart3_rx_address;        /* uart3 receive buffer address */
	;***       72 : volatile uint16_t  g_uart3_rx_count;           /* uart3 receive data number */
	;***       73 : volatile uint16_t  g_uart3_rx_length;          /* uart3 receive data length */
	;***       74 : /* Start user code for global. Do not edit comment generated here */
	;***       75 : MD_STATUS R_CSI01_Receive(uint8_t * const rx_buf, uint16_t rx_num)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 75
	movw de, ax
	movw ax, bc
	;***       76 : {
	;***       77 :     MD_STATUS status = MD_OK;
	;***       78 : 
	;***       79 :     if (rx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 79
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@1_2
.BB@LABEL@1_1:	; if_break_bb
	;***       80 :     {
	;***       81 :         status = MD_ARGERROR;
	;***       82 :     }
	;***       83 :     else
	;***       84 :     {
	;***       85 :         g_csi01_rx_length = rx_num;    /* receive data length */
	;***       86 :         g_csi01_rx_count = 0U;         /* receive data count */
	;***       87 :         gp_csi01_rx_address = rx_buf;  /* receive buffer pointer */
	;***       88 :         SIO01 = 0xFFU;    /* start receive by dummy write */
	;***       89 :     }
	;***       90 : 
	;***       91 :     return (status);
	;***       92 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 92
	movw ax, #0x0081
	ret
.BB@LABEL@1_2:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 85
	movw !LOWW(_g_csi01_rx_length), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 86
	movw !LOWW(_g_csi01_rx_count), ax
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 87
	movw !LOWW(_gp_csi01_rx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 88
	mov 0xFFF12, #0xFF
	clrw ax
	ret
_R_CSI01_Send:
	.STACK _R_CSI01_Send = 4
	;***       93 : MD_STATUS R_CSI01_Send(uint8_t * const tx_buf, uint16_t tx_num)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 93
	movw de, ax
	movw ax, bc
	;***       94 : {
	;***       95 :     MD_STATUS status = MD_OK;
	;***       96 : 
	;***       97 :     if (tx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 97
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; if_break_bb
	;***       98 :     {
	;***       99 :         status = MD_ARGERROR;
	;***      100 :     }
	;***      101 :     else
	;***      102 :     {
	;***      103 :         g_csi01_tx_count = tx_num;        /* send data count */
	;***      104 :         gp_csi01_tx_address = tx_buf;     /* send buffer pointer */
	;***      105 :         CSIMK01 = 1U;                     /* disable INTCSI01 interrupt */
	;***      106 :         SIO01 = *gp_csi00_tx_address;    /* started by writing data to SDR[7:0] */
	;***      107 :         gp_csi01_tx_address++;
	;***      108 :         g_csi01_tx_count--;
	;***      109 :         CSIMK01 = 0U;                     /* enable INTCSI00 interrupt */
	;***      110 :     }
	;***      111 : 
	;***      112 :     return (status);
	;***      113 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 113
	movw ax, #0x0081
	ret
.BB@LABEL@2_2:	; if_else_bb
	movw hl, #0xFFE5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 103
	movw !LOWW(_g_csi01_tx_count), ax
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 104
	movw !LOWW(_gp_csi01_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 105
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 106
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 107
	incw !LOWW(_gp_csi01_tx_address)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 108
	decw !LOWW(_g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 109
	clr1 [hl].6
	clrw ax
	ret
_R_SAU0_Create:
	.STACK _R_SAU0_Create = 4
	;***      114 : /* End user code. Do not edit comment generated here */
	;***      115 : 
	;***      116 : /***********************************************************************************************************************
	;***      117 : * Function Name: R_SAU0_Create
	;***      118 : * Description  : This function initializes the SAU0 module.
	;***      119 : * Arguments    : None
	;***      120 : * Return Value : None
	;***      121 : ***********************************************************************************************************************/
	;***      122 : void R_SAU0_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 122
	movw hl, #0x00F0
	movw ax, #0x0044
	;***      123 : {
	;***      124 :     SAU0EN = 1U;    /* supply SAU0 clock */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 124
	set1 [hl].2
	;***      125 :     NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 125
	nop
	;***      126 :     NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 126
	nop
	;***      127 :     NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 127
	nop
	;***      128 :     NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 128
	nop
	;***      129 :     SPS0 = _0004_SAU_CK00_FCLK_4 | _0040_SAU_CK01_FCLK_4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 129
	movw [hl+0x36], ax
	;***      130 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 130
	call $!_R_UART1_Create
	;***      131 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 131
	call $!_R_CSI00_Create
	;***      132 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 132
	br $!_R_CSI01_Create
_R_UART1_Create:
	.STACK _R_UART1_Create = 4
	;***      133 : }
	;***      134 : 
	;***      135 : /***********************************************************************************************************************
	;***      136 : * Function Name: R_UART1_Create
	;***      137 : * Description  : This function initializes the UART1 module.
	;***      138 : * Arguments    : None
	;***      139 : * Return Value : None
	;***      140 : ***********************************************************************************************************************/
	;***      141 : void R_UART1_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 141
	movw de, #0x0060
	;***      142 : {
	;***      143 :     ST0 |= _0008_SAU_CH3_STOP_TRG_ON | _0004_SAU_CH2_STOP_TRG_ON;    /* disable UART1 receive and transmit */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 143
	movw ax, [de+0xC4]
	xch a, x
	or a, #0x0C
	xch a, x
	movw [de+0xC4], ax
	;***      144 :     STMK1 = 1U;    /* disable INTST1 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 144
	set1 0xFFFE6.0
	;***      145 :     STIF1 = 0U;    /* clear INTST1 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 145
	clr1 0xFFFE2.0
	;***      146 :     SRMK1 = 1U;    /* disable INTSR1 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 146
	set1 0xFFFE6.1
	;***      147 :     SRIF1 = 0U;    /* clear INTSR1 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 147
	clr1 0xFFFE2.1
	;***      148 :     SREMK1 = 1U;   /* disable INTSRE1 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 148
	set1 0xFFFE6.2
	;***      149 :     SREIF1 = 0U;   /* clear INTSRE1 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 149
	clr1 0xFFFE2.2
	;***      150 :     /* Set INTST1 low priority */
	;***      151 :     STPR11 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 151
	set1 0xFFFEE.0
	;***      152 :     STPR01 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 152
	set1 0xFFFEA.0
	;***      153 :     /* Set INTSR1 low priority */
	;***      154 :     SRPR11 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 154
	set1 0xFFFEE.1
	;***      155 :     SRPR01 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 155
	set1 0xFFFEA.1
	movw ax, #0x0022
	;***      156 :     SMR02 = _0020_SAU_SMRMN_INITIALVALUE | _0000_SAU_CLOCK_SELECT_CK00 | _0000_SAU_TRIGGER_SOFTWARE |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 156
	movw [de+0xB4], ax
	movw ax, #0x8097
	;***      157 :             _0002_SAU_MODE_UART | _0000_SAU_TRANSFER_END;
	;***      158 :     SCR02 = _8000_SAU_TRANSMISSION | _0000_SAU_INTSRE_MASK | _0000_SAU_PARITY_NONE | _0080_SAU_LSB | _0010_SAU_STOP_1 |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 158
	movw [de+0xBC], ax
	;***      159 :             _0007_SAU_LENGTH_8;
	;***      160 :     SDR02 = _CE00_UART1_TRANSMIT_DIVISOR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 160
	movw 0xFFF44, #0xCE00
	;***      161 :     NFEN0 |= _04_SAU_RXD1_FILTER_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 161
	mov a, [de+0x10]
	set1 a.2
	mov [de+0x10], a
	movw ax, #0x0007
	;***      162 :     SIR03 = _0004_SAU_SIRMN_FECTMN | _0002_SAU_SIRMN_PECTMN | _0001_SAU_SIRMN_OVCTMN;    /* clear error flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 162
	movw [de+0xAE], ax
	movw ax, #0x0122
	;***      163 :     SMR03 = _0020_SAU_SMRMN_INITIALVALUE | _0000_SAU_CLOCK_SELECT_CK00 | _0100_SAU_TRIGGER_RXD | _0000_SAU_EDGE_FALL |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 163
	movw [de+0xB6], ax
	movw ax, #0x4097
	;***      164 :             _0002_SAU_MODE_UART | _0000_SAU_TRANSFER_END;
	;***      165 :     SCR03 = _4000_SAU_RECEPTION | _0000_SAU_INTSRE_MASK | _0000_SAU_PARITY_NONE | _0080_SAU_LSB | _0010_SAU_STOP_1 |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 165
	movw [de+0xBE], ax
	;***      166 :             _0007_SAU_LENGTH_8;
	;***      167 :     SDR03 = _CE00_UART1_RECEIVE_DIVISOR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 167
	movw 0xFFF46, #0xCE00
	;***      168 :     SO0 |= _0004_SAU_CH2_DATA_OUTPUT_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 168
	movw ax, [de+0xC8]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de+0xC8], ax
	;***      169 :     SOL0 |= _0000_SAU_CHANNEL2_NORMAL;    /* output level normal */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 169
	movw ax, [de+0xD4]
	movw [de+0xD4], ax
	;***      170 :     SOE0 |= _0004_SAU_CH2_OUTPUT_ENABLE;    /* enable UART1 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 170
	movw ax, [de+0xCA]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de+0xCA], ax
	;***      171 :     /* Set RxD1 pin */
	;***      172 :     PMC0 &= 0xF7U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 172
	mov a, [de]
	clr1 a.3
	mov [de], a
	mov a, #0x08
	;***      173 :     PM0 |= 0x08U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 173
	or a, !0xFF20
	mov 0xFFF20, a
	;***      174 :     /* Set TxD1 pin */
	;***      175 :     PMC0 &= 0xFBU;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 175
	mov a, [de]
	clr1 a.2
	mov [de], a
	;***      176 :     P0 |= 0x04U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 176
	or 0xFFF00, #0x04
	mov a, #0xFB
	;***      177 :     PM0 &= 0xFBU;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 177
	and a, !0xFF20
	mov 0xFFF20, a
	ret
_R_UART1_Start:
	.STACK _R_UART1_Start = 4
	;***      178 : }
	;***      179 : 
	;***      180 : /***********************************************************************************************************************
	;***      181 : * Function Name: R_UART1_Start
	;***      182 : * Description  : This function starts the UART1 module operation.
	;***      183 : * Arguments    : None
	;***      184 : * Return Value : None
	;***      185 : ***********************************************************************************************************************/
	;***      186 : void R_UART1_Start(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 186
	movw de, #0x0122
	;***      187 : {
	;***      188 :     SO0 |= _0004_SAU_CH2_DATA_OUTPUT_1;    /* output level normal */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 188
	movw ax, [de+0x06]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de+0x06], ax
	;***      189 :     SOE0 |= _0004_SAU_CH2_OUTPUT_ENABLE;    /* enable UART1 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 189
	movw ax, [de+0x08]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de+0x08], ax
	;***      190 :     SS0 |= _0008_SAU_CH3_START_TRG_ON | _0004_SAU_CH2_START_TRG_ON;    /* enable UART1 receive and transmit */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 190
	movw ax, [de]
	xch a, x
	or a, #0x0C
	xch a, x
	movw [de], ax
	;***      191 :     STIF1 = 0U;    /* clear INTST1 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 191
	clr1 0xFFFE2.0
	;***      192 :     SRIF1 = 0U;    /* clear INTSR1 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 192
	clr1 0xFFFE2.1
	;***      193 :     STMK1 = 0U;    /* enable INTST1 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 193
	clr1 0xFFFE6.0
	;***      194 :     SRMK1 = 0U;    /* enable INTSR1 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 194
	clr1 0xFFFE6.1
	ret
_R_UART1_Stop:
	.STACK _R_UART1_Stop = 4
	;***      195 : }
	;***      196 : 
	;***      197 : /***********************************************************************************************************************
	;***      198 : * Function Name: R_UART1_Stop
	;***      199 : * Description  : This function stops the UART1 module operation.
	;***      200 : * Arguments    : None
	;***      201 : * Return Value : None
	;***      202 : ***********************************************************************************************************************/
	;***      203 : void R_UART1_Stop(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 203
	movw de, #0x0124
	;***      204 : {
	;***      205 :     STMK1 = 1U;    /* disable INTST1 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 205
	set1 0xFFFE6.0
	;***      206 :     SRMK1 = 1U;    /* disable INTSR1 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 206
	set1 0xFFFE6.1
	;***      207 :     ST0 |= _0008_SAU_CH3_STOP_TRG_ON | _0004_SAU_CH2_STOP_TRG_ON;    /* disable UART1 receive and transmit */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 207
	movw ax, [de]
	xch a, x
	or a, #0x0C
	xch a, x
	movw [de], ax
	;***      208 :     SOE0 &= ~_0004_SAU_CH2_OUTPUT_ENABLE;    /* disable UART1 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 208
	movw ax, [de+0x06]
	xch a, x
	and a, #0xFB
	xch a, x
	movw [de+0x06], ax
	;***      209 :     STIF1 = 0U;    /* clear INTST1 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 209
	clr1 0xFFFE2.0
	;***      210 :     SRIF1 = 0U;    /* clear INTSR1 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 210
	clr1 0xFFFE2.1
	ret
_R_UART1_Receive:
	.STACK _R_UART1_Receive = 4
	;***      211 :    
	;***      212 : }
	;***      213 : 
	;***      214 : /***********************************************************************************************************************
	;***      215 : * Function Name: R_UART1_Receive
	;***      216 : * Description  : This function receives UART1 data.
	;***      217 : * Arguments    : rx_buf -
	;***      218 : *                    receive buffer pointer
	;***      219 : *                rx_num -
	;***      220 : *                    buffer size
	;***      221 : * Return Value : status -
	;***      222 : *                    MD_OK or MD_ARGERROR
	;***      223 : ***********************************************************************************************************************/
	;***      224 : MD_STATUS R_UART1_Receive(uint8_t * const rx_buf, uint16_t rx_num)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 224
	movw de, ax
	movw ax, bc
	;***      225 : {
	;***      226 :     MD_STATUS status = MD_OK;
	;***      227 : 
	;***      228 :     if (rx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 228
	or a, x
	bnz $.BB@LABEL@7_2
.BB@LABEL@7_1:	; if_break_bb
	;***      229 :     {
	;***      230 :         status = MD_ARGERROR;
	;***      231 :     }
	;***      232 :     else
	;***      233 :     {
	;***      234 :         g_uart1_rx_count = 0U;
	;***      235 :         g_uart1_rx_length = rx_num;
	;***      236 :         gp_uart1_rx_address = rx_buf;
	;***      237 :     }
	;***      238 : 
	;***      239 :     return (status);
	;***      240 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 240
	movw ax, #0x0081
	ret
.BB@LABEL@7_2:	; if_else_bb
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 234
	movw !LOWW(_g_uart1_rx_count), ax
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 235
	movw !LOWW(_g_uart1_rx_length), ax
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 236
	movw !LOWW(_gp_uart1_rx_address), ax
	clrw ax
	ret
_R_UART1_Send:
	.STACK _R_UART1_Send = 4
	;***      241 : 
	;***      242 : /***********************************************************************************************************************
	;***      243 : * Function Name: R_UART1_Send
	;***      244 : * Description  : This function sends UART1 data.
	;***      245 : * Arguments    : tx_buf -
	;***      246 : *                    transfer buffer pointer
	;***      247 : *                tx_num -
	;***      248 : *                    buffer size
	;***      249 : * Return Value : status -
	;***      250 : *                    MD_OK or MD_ARGERROR
	;***      251 : ***********************************************************************************************************************/
	;***      252 : MD_STATUS R_UART1_Send(uint8_t * const tx_buf, uint16_t tx_num)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 252
	movw de, ax
	movw ax, bc
	;***      253 : {
	;***      254 :     MD_STATUS status = MD_OK;
	;***      255 : 
	;***      256 :     if (tx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 256
	or a, x
	bnz $.BB@LABEL@8_2
.BB@LABEL@8_1:	; if_break_bb
	;***      257 :     {
	;***      258 :         status = MD_ARGERROR;
	;***      259 :     }
	;***      260 :     else
	;***      261 :     {
	;***      262 :         gp_uart1_tx_address = tx_buf;
	;***      263 :         g_uart1_tx_count = tx_num;
	;***      264 :         STMK1 = 1U;    /* disable INTST1 interrupt */
	;***      265 :         TXD1 = *gp_uart1_tx_address;
	;***      266 :         gp_uart1_tx_address++;
	;***      267 :         g_uart1_tx_count--;
	;***      268 :         STMK1 = 0U;    /* enable INTST1 interrupt */
	;***      269 :     }
	;***      270 : 
	;***      271 :     return (status);
	;***      272 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 272
	movw ax, #0x0081
	ret
.BB@LABEL@8_2:	; if_else_bb
	movw hl, #0xFFE6
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 262
	movw !LOWW(_gp_uart1_tx_address), ax
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 263
	movw !LOWW(_g_uart1_tx_count), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 264
	set1 [hl].0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 265
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 266
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 267
	decw !LOWW(_g_uart1_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 268
	clr1 [hl].0
	clrw ax
	ret
_R_CSI00_Create:
	.STACK _R_CSI00_Create = 4
	;***      273 : 
	;***      274 : /***********************************************************************************************************************
	;***      275 : * Function Name: R_CSI00_Create
	;***      276 : * Description  : This function initializes the CSI00 module.
	;***      277 : * Arguments    : None
	;***      278 : * Return Value : None
	;***      279 : ***********************************************************************************************************************/
	;***      280 : void R_CSI00_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 280
	movw de, #0x0108
	;***      281 : {
	;***      282 :     ST0 |= _0001_SAU_CH0_STOP_TRG_ON;    /* disable CSI00 */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 282
	movw ax, [de+0x1C]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de+0x1C], ax
	;***      283 :     CSIMK00 = 1U;    /* disable INTCSI00 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 283
	set1 0xFFFE5.5
	;***      284 :     CSIIF00 = 0U;    /* clear INTCSI00 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 284
	clr1 0xFFFE1.5
	;***      285 :     /* Set INTCSI00 low priority */
	;***      286 :     CSIPR100 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 286
	set1 0xFFFED.5
	;***      287 :     CSIPR000 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 287
	set1 0xFFFE9.5
	movw ax, #0x0003
	;***      288 :     SIR00 = _0002_SAU_SIRMN_PECTMN | _0001_SAU_SIRMN_OVCTMN;    /* clear error flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 288
	movw [de], ax
	mov x, #0x20
	;***      289 :     SMR00 = _0020_SAU_SMRMN_INITIALVALUE | _0000_SAU_CLOCK_SELECT_CK00 | _0000_SAU_CLOCK_MODE_CKS |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 289
	movw [de+0x08], ax
	movw ax, #0xB087
	;***      290 :             _0000_SAU_TRIGGER_SOFTWARE | _0000_SAU_MODE_CSI | _0000_SAU_TRANSFER_END;
	;***      291 :     SCR00 = _8000_SAU_TRANSMISSION | _3000_SAU_TIMING_4 | _0080_SAU_LSB | _0007_SAU_LENGTH_8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 291
	movw [de+0x10], ax
	;***      292 :     SDR00 = _CE00_CSI00_DIVISOR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 292
	movw 0xFFF10, #0xCE00
	;***      293 :     SO0 &= ~_0100_SAU_CH0_CLOCK_OUTPUT_1;    /* CSI00 clock initial level */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 293
	movw ax, [de+0x20]
	and a, #0xFE
	movw [de+0x20], ax
	;***      294 :     SO0 &= ~_0001_SAU_CH0_DATA_OUTPUT_1;    /* CSI00 SO initial level */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 294
	movw ax, [de+0x20]
	xch a, x
	and a, #0xFE
	xch a, x
	movw [de+0x20], ax
	;***      295 :     SOE0 |= _0001_SAU_CH0_OUTPUT_ENABLE;    /* enable CSI00 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 295
	movw ax, [de+0x22]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de+0x22], ax
	;***      296 :     /* Set SO00 pin */
	;***      297 :     P5 |= 0x02U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 297
	or 0xFFF05, #0x02
	mov a, #0xFD
	;***      298 :     PM5 &= 0xFDU;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 298
	and a, !0xFF25
	mov 0xFFF25, a
	;***      299 :     /* Set SCK00 pin */
	;***      300 :     P3 |= 0x01U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 300
	or 0xFFF03, #0x01
	mov a, #0xFE
	;***      301 :     PM3 &= 0xFEU;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 301
	and a, !0xFF23
	mov 0xFFF23, a
	ret
_R_CSI00_Start:
	.STACK _R_CSI00_Start = 4
	;***      302 : }
	;***      303 : 
	;***      304 : /***********************************************************************************************************************
	;***      305 : * Function Name: R_CSI00_Start
	;***      306 : * Description  : This function starts the CSI00 module operation.
	;***      307 : * Arguments    : None
	;***      308 : * Return Value : None
	;***      309 : ***********************************************************************************************************************/
	;***      310 : void R_CSI00_Start(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 310
	movw de, #0x0122
	;***      311 : {
	;***      312 :     SO0 &= ~_0100_SAU_CH0_CLOCK_OUTPUT_1;   /* CSI00 clock initial level */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 312
	movw ax, [de+0x06]
	and a, #0xFE
	movw [de+0x06], ax
	;***      313 :     SO0 &= ~_0001_SAU_CH0_DATA_OUTPUT_1;           /* CSI00 SO initial level */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 313
	movw ax, [de+0x06]
	xch a, x
	and a, #0xFE
	xch a, x
	movw [de+0x06], ax
	;***      314 :     SOE0 |= _0001_SAU_CH0_OUTPUT_ENABLE;           /* enable CSI00 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 314
	movw ax, [de+0x08]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de+0x08], ax
	;***      315 :     SS0 |= _0001_SAU_CH0_START_TRG_ON;             /* enable CSI00 */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 315
	movw ax, [de]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de], ax
	;***      316 :     CSIIF00 = 0U;    /* clear INTCSI00 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 316
	clr1 0xFFFE1.5
	;***      317 :     CSIMK00 = 0U;    /* enable INTCSI00 */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 317
	clr1 0xFFFE5.5
	ret
_R_CSI00_Stop:
	.STACK _R_CSI00_Stop = 4
	;***      318 : }
	;***      319 : 
	;***      320 : /***********************************************************************************************************************
	;***      321 : * Function Name: R_CSI00_Stop
	;***      322 : * Description  : This function stops the CSI00 module operation.
	;***      323 : * Arguments    : None
	;***      324 : * Return Value : None
	;***      325 : ***********************************************************************************************************************/
	;***      326 : void R_CSI00_Stop(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 326
	movw de, #0x0124
	;***      327 : {
	;***      328 :     CSIMK00 = 1U;    /* disable INTCSI00 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 328
	set1 0xFFFE5.5
	;***      329 :     ST0 |= _0001_SAU_CH0_STOP_TRG_ON;        /* disable CSI00 */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 329
	movw ax, [de]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de], ax
	;***      330 :     SOE0 &= ~_0001_SAU_CH0_OUTPUT_ENABLE;    /* disable CSI00 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 330
	movw ax, [de+0x06]
	xch a, x
	and a, #0xFE
	xch a, x
	movw [de+0x06], ax
	;***      331 :     CSIIF00 = 0U;    /* clear INTCSI00 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 331
	clr1 0xFFFE1.5
	ret
_R_CSI00_Send:
	.STACK _R_CSI00_Send = 4
	;***      332 : }
	;***      333 : 
	;***      334 : /***********************************************************************************************************************
	;***      335 : * Function Name: R_CSI00_Send
	;***      336 : * Description  : This function sends CSI00 data.
	;***      337 : * Arguments    : tx_buf -
	;***      338 : *                    transfer buffer pointer
	;***      339 : *                tx_num -
	;***      340 : *                    buffer size
	;***      341 : * Return Value : status -
	;***      342 : *                    MD_OK or MD_ARGERROR
	;***      343 : ***********************************************************************************************************************/
	;***      344 : MD_STATUS R_CSI00_Send(uint8_t * const tx_buf, uint16_t tx_num)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 344
	movw de, ax
	movw ax, bc
	;***      345 : {
	;***      346 :     MD_STATUS status = MD_OK;
	;***      347 : 
	;***      348 :     if (tx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 348
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@12_2
.BB@LABEL@12_1:	; if_break_bb
	;***      349 :     {
	;***      350 :         status = MD_ARGERROR;
	;***      351 :     }
	;***      352 :     else
	;***      353 :     {
	;***      354 :         g_csi00_tx_count = tx_num;        /* send data count */
	;***      355 :         gp_csi00_tx_address = tx_buf;     /* send buffer pointer */
	;***      356 :         CSIMK00 = 1U;                     /* disable INTCSI00 interrupt */
	;***      357 :         SIO00 = *gp_csi00_tx_address;    /* started by writing data to SDR[7:0] */
	;***      358 :         gp_csi00_tx_address++;
	;***      359 :         g_csi00_tx_count--;
	;***      360 :         CSIMK00 = 0U;                     /* enable INTCSI00 interrupt */
	;***      361 :     }
	;***      362 : 
	;***      363 :     return (status);
	;***      364 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 364
	movw ax, #0x0081
	ret
.BB@LABEL@12_2:	; if_else_bb
	movw hl, #0xFFE5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 354
	movw !LOWW(_g_csi00_tx_count), ax
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 355
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 356
	set1 [hl].5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 357
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 358
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 359
	decw !LOWW(_g_csi00_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 360
	clr1 [hl].5
	clrw ax
	ret
_R_CSI01_Create:
	.STACK _R_CSI01_Create = 4
	;***      365 : 
	;***      366 : /***********************************************************************************************************************
	;***      367 : * Function Name: R_CSI01_Create
	;***      368 : * Description  : This function initializes the CSI01 module.
	;***      369 : * Arguments    : None
	;***      370 : * Return Value : None
	;***      371 : ***********************************************************************************************************************/
	;***      372 : void R_CSI01_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 372
	movw de, #0x010A
	;***      373 : {
	;***      374 :     ST0 |= _0002_SAU_CH1_STOP_TRG_ON;    /* disable CSI01 */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 374
	movw ax, [de+0x1A]
	xch a, x
	or a, #0x02
	xch a, x
	movw [de+0x1A], ax
	;***      375 :     CSIMK01 = 1U;    /* disable INTCSI01 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 375
	set1 0xFFFE5.6
	;***      376 :     CSIIF01 = 0U;    /* clear INTCSI01 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 376
	clr1 0xFFFE1.6
	;***      377 :     /* Set INTCSI01 low priority */
	;***      378 :     CSIPR101 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 378
	set1 0xFFFED.6
	;***      379 :     CSIPR001 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 379
	set1 0xFFFE9.6
	movw ax, #0x0007
	;***      380 :     SIR01 = _0004_SAU_SIRMN_FECTMN | _0002_SAU_SIRMN_PECTMN | _0001_SAU_SIRMN_OVCTMN;    /* clear error flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 380
	movw [de], ax
	mov x, #0x20
	;***      381 :     SMR01 = _0020_SAU_SMRMN_INITIALVALUE | _0000_SAU_CLOCK_SELECT_CK00 | _0000_SAU_CLOCK_MODE_CKS |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 381
	movw [de+0x08], ax
	movw ax, #0xF007
	;***      382 :             _0000_SAU_TRIGGER_SOFTWARE | _0000_SAU_MODE_CSI | _0000_SAU_TRANSFER_END;
	;***      383 :     SCR01 = _C000_SAU_RECEPTION_TRANSMISSION | _3000_SAU_TIMING_4 | _0000_SAU_MSB | _0007_SAU_LENGTH_8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 383
	movw [de+0x10], ax
	;***      384 :     SDR01 = _CE00_CSI01_DIVISOR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 384
	movw 0xFFF12, #0xCE00
	;***      385 :     SO0 &= ~_0200_SAU_CH1_CLOCK_OUTPUT_1;    /* CSI01 clock initial level */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 385
	movw ax, [de+0x1E]
	and a, #0xFD
	movw [de+0x1E], ax
	;***      386 :     SO0 &= ~_0002_SAU_CH1_DATA_OUTPUT_1;    /* CSI01 SO initial level */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 386
	movw ax, [de+0x1E]
	xch a, x
	and a, #0xFD
	xch a, x
	movw [de+0x1E], ax
	;***      387 :     SOE0 |= _0002_SAU_CH1_OUTPUT_ENABLE;    /* enable CSI01 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 387
	movw ax, [de+0x20]
	xch a, x
	or a, #0x02
	xch a, x
	movw [de+0x20], ax
	mov a, #0x10
	;***      388 :     /* Set SI01 pin */
	;***      389 :     PM4 |= 0x10U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 389
	or a, !0xFF24
	mov 0xFFF24, a
	;***      390 :     /* Set SO01 pin */
	;***      391 :     P4 |= 0x20U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 391
	or 0xFFF04, #0x20
	mov a, #0xDF
	;***      392 :     PM4 &= 0xDFU;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 392
	and a, !0xFF24
	mov 0xFFF24, a
	;***      393 :     /* Set SCK01 pin */
	;***      394 :     P4 |= 0x08U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 394
	or 0xFFF04, #0x08
	mov a, #0xF7
	;***      395 :     PM4 &= 0xF7U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 395
	and a, !0xFF24
	mov 0xFFF24, a
	ret
_R_CSI01_Start:
	.STACK _R_CSI01_Start = 4
	;***      396 : }
	;***      397 : 
	;***      398 : /***********************************************************************************************************************
	;***      399 : * Function Name: R_CSI01_Start
	;***      400 : * Description  : This function starts the CSI01 module operation.
	;***      401 : * Arguments    : None
	;***      402 : * Return Value : None
	;***      403 : ***********************************************************************************************************************/
	;***      404 : void R_CSI01_Start(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 404
	movw de, #0x0122
	;***      405 : {
	;***      406 :     SO0 &= ~_0200_SAU_CH1_CLOCK_OUTPUT_1;   /* CSI01 clock initial level */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 406
	movw ax, [de+0x06]
	and a, #0xFD
	movw [de+0x06], ax
	;***      407 :     SO0 &= ~_0002_SAU_CH1_DATA_OUTPUT_1;           /* CSI01 SO initial level */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 407
	movw ax, [de+0x06]
	xch a, x
	and a, #0xFD
	xch a, x
	movw [de+0x06], ax
	;***      408 :     SOE0 |= _0002_SAU_CH1_OUTPUT_ENABLE;           /* enable CSI01 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 408
	movw ax, [de+0x08]
	xch a, x
	or a, #0x02
	xch a, x
	movw [de+0x08], ax
	;***      409 :     SS0 |= _0002_SAU_CH1_START_TRG_ON;             /* enable CSI01 */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 409
	movw ax, [de]
	xch a, x
	or a, #0x02
	xch a, x
	movw [de], ax
	;***      410 :     CSIIF01 = 0U;    /* clear INTCSI01 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 410
	clr1 0xFFFE1.6
	;***      411 :     CSIMK01 = 0U;    /* enable INTCSI01 */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 411
	clr1 0xFFFE5.6
	ret
_R_CSI01_Stop:
	.STACK _R_CSI01_Stop = 4
	;***      412 : }
	;***      413 : 
	;***      414 : /***********************************************************************************************************************
	;***      415 : * Function Name: R_CSI01_Stop
	;***      416 : * Description  : This function stops the CSI01 module operation.
	;***      417 : * Arguments    : None
	;***      418 : * Return Value : None
	;***      419 : ***********************************************************************************************************************/
	;***      420 : void R_CSI01_Stop(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 420
	movw de, #0x0124
	;***      421 : {
	;***      422 :     CSIMK01 = 1U;    /* disable INTCSI01 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 422
	set1 0xFFFE5.6
	;***      423 :     ST0 |= _0002_SAU_CH1_STOP_TRG_ON;        /* disable CSI01 */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 423
	movw ax, [de]
	xch a, x
	or a, #0x02
	xch a, x
	movw [de], ax
	;***      424 :     SOE0 &= ~_0002_SAU_CH1_OUTPUT_ENABLE;    /* disable CSI01 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 424
	movw ax, [de+0x06]
	xch a, x
	and a, #0xFD
	xch a, x
	movw [de+0x06], ax
	;***      425 :     CSIIF01 = 0U;    /* clear INTCSI01 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 425
	clr1 0xFFFE1.6
	ret
_R_CSI01_Send_Receive:
	.STACK _R_CSI01_Send_Receive = 4
	;***      426 : }
	;***      427 : 
	;***      428 : /***********************************************************************************************************************
	;***      429 : * Function Name: R_CSI01_Send_Receive
	;***      430 : * Description  : This function sends and receives CSI01 data.
	;***      431 : * Arguments    : tx_buf -
	;***      432 : *                    transfer buffer pointer
	;***      433 : *                tx_num -
	;***      434 : *                    buffer size
	;***      435 : *                rx_buf -
	;***      436 : *                    receive buffer pointer
	;***      437 : * Return Value : status -
	;***      438 : *                    MD_OK or MD_ARGERROR
	;***      439 : ***********************************************************************************************************************/
	;***      440 : MD_STATUS R_CSI01_Send_Receive(uint8_t * const tx_buf, uint16_t tx_num, uint8_t * const rx_buf)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 440
	movw hl, ax
	movw ax, bc
	;***      441 : {
	;***      442 :     MD_STATUS status = MD_OK;
	;***      443 : 
	;***      444 :     if (tx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 444
	or a, x
	bnz $.BB@LABEL@16_2
.BB@LABEL@16_1:	; if_break_bb22
	;***      445 :     {
	;***      446 :         status = MD_ARGERROR;
	;***      447 :     }
	;***      448 :     else
	;***      449 :     {
	;***      450 :         g_csi01_tx_count = tx_num;        /* send data count */
	;***      451 :         gp_csi01_tx_address = tx_buf;     /* send buffer pointer */
	;***      452 :         gp_csi01_rx_address = rx_buf;     /* receive buffer pointer */
	;***      453 :         CSIMK01 = 1U;                     /* disable INTCSI01 interrupt */
	;***      454 : 
	;***      455 :         if (0U != gp_csi01_tx_address)
	;***      456 :         {
	;***      457 :             SIO01 = *gp_csi01_tx_address;    /* started by writing data to SDR[7:0] */
	;***      458 :             gp_csi01_tx_address++;
	;***      459 :         }
	;***      460 :         else
	;***      461 :         {
	;***      462 :             SIO01 = 0xFFU;
	;***      463 :         }
	;***      464 : 
	;***      465 :         g_csi01_tx_count--;
	;***      466 :         CSIMK01 = 0U;                     /* enable INTCSI01 interrupt */
	;***      467 :     }
	;***      468 : 
	;***      469 :     return (status);
	;***      470 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 470
	movw ax, #0x0081
	ret
.BB@LABEL@16_2:	; if_else_bb
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 450
	movw !LOWW(_g_csi01_tx_count), ax
	movw ax, hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 451
	movw !LOWW(_gp_csi01_tx_address), ax
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 452
	movw !LOWW(_gp_csi01_rx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 453
	set1 0xFFFE5.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 455
	movw ax, !LOWW(_gp_csi01_tx_address)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@16_4
.BB@LABEL@16_3:	; if_else_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 462
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@16_5
.BB@LABEL@16_4:	; if_then_bb14
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 457
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 458
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@16_5:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 465
	decw !LOWW(_g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 466
	clr1 0xFFFE5.6
	clrw ax
	ret
_R_SAU1_Create:
	.STACK _R_SAU1_Create = 4
	;***      471 : 
	;***      472 : /***********************************************************************************************************************
	;***      473 : * Function Name: R_SAU1_Create
	;***      474 : * Description  : This function initializes the SAU1 module.
	;***      475 : * Arguments    : None
	;***      476 : * Return Value : None
	;***      477 : ***********************************************************************************************************************/
	;***      478 : void R_SAU1_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 478
	movw hl, #0x00F0
	movw ax, #0x0044
	;***      479 : {
	;***      480 :     SAU1EN = 1U;    /* supply SAU1 clock */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 480
	set1 [hl].3
	;***      481 :     NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 481
	nop
	;***      482 :     NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 482
	nop
	;***      483 :     NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 483
	nop
	;***      484 :     NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 484
	nop
	;***      485 :     SPS1 = _0004_SAU_CK00_FCLK_4 | _0040_SAU_CK01_FCLK_4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 485
	movw [hl+0x76], ax
	;***      486 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 486
	call $!_R_UART2_Create
	;***      487 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 487
	br $!_R_UART3_Create
_R_UART2_Create:
	.STACK _R_UART2_Create = 4
	;***      488 : }
	;***      489 : 
	;***      490 : /***********************************************************************************************************************
	;***      491 : * Function Name: R_UART2_Create
	;***      492 : * Description  : This function initializes the UART2 module.
	;***      493 : * Arguments    : None
	;***      494 : * Return Value : None
	;***      495 : ***********************************************************************************************************************/
	;***      496 : void R_UART2_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 496
	movw de, #0x0070
	;***      497 : {
	;***      498 :     ST1 |= _0002_SAU_CH1_STOP_TRG_ON | _0001_SAU_CH0_STOP_TRG_ON;    /* disable UART2 receive and transmit */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 498
	movw ax, [de+0xF4]
	xch a, x
	or a, #0x03
	xch a, x
	movw [de+0xF4], ax
	;***      499 :     STMK2 = 1U;    /* disable INTST2 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 499
	set1 0xFFFE5.0
	;***      500 :     STIF2 = 0U;    /* clear INTST2 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 500
	clr1 0xFFFE1.0
	;***      501 :     SRMK2 = 1U;    /* disable INTSR2 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 501
	set1 0xFFFE5.1
	;***      502 :     SRIF2 = 0U;    /* clear INTSR2 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 502
	clr1 0xFFFE1.1
	;***      503 :     SREMK2 = 1U;   /* disable INTSRE2 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 503
	set1 0xFFFE5.2
	;***      504 :     SREIF2 = 0U;   /* clear INTSRE2 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 504
	clr1 0xFFFE1.2
	;***      505 :     /* Set INTST2 low priority */
	;***      506 :     STPR12 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 506
	set1 0xFFFED.0
	;***      507 :     STPR02 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 507
	set1 0xFFFE9.0
	;***      508 :     /* Set INTSR2 low priority */
	;***      509 :     SRPR12 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 509
	set1 0xFFFED.1
	;***      510 :     SRPR02 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 510
	set1 0xFFFE9.1
	movw ax, #0x0022
	;***      511 :     SMR10 = _0020_SAU_SMRMN_INITIALVALUE | _0000_SAU_CLOCK_SELECT_CK00 | _0000_SAU_TRIGGER_SOFTWARE |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 511
	movw [de+0xE0], ax
	movw ax, #0x8097
	;***      512 :             _0002_SAU_MODE_UART | _0000_SAU_TRANSFER_END;
	;***      513 :     SCR10 = _8000_SAU_TRANSMISSION | _0000_SAU_INTSRE_MASK | _0000_SAU_PARITY_NONE | _0080_SAU_LSB | _0010_SAU_STOP_1 |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 513
	movw [de+0xE8], ax
	;***      514 :             _0007_SAU_LENGTH_8;
	;***      515 :     SDR10 = _CE00_UART2_TRANSMIT_DIVISOR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 515
	movw 0xFFF48, #0xCE00
	;***      516 :     NFEN0 |= _10_SAU_RXD2_FILTER_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 516
	mov a, [de]
	set1 a.4
	mov [de], a
	movw ax, #0x0007
	;***      517 :     SIR11 = _0004_SAU_SIRMN_FECTMN | _0002_SAU_SIRMN_PECTMN | _0001_SAU_SIRMN_OVCTMN;    /* clear error flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 517
	movw [de+0xDA], ax
	movw ax, #0x0122
	;***      518 :     SMR11 = _0020_SAU_SMRMN_INITIALVALUE | _0000_SAU_CLOCK_SELECT_CK00 | _0100_SAU_TRIGGER_RXD | _0000_SAU_EDGE_FALL |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 518
	movw [de+0xE2], ax
	movw ax, #0x4097
	;***      519 :             _0002_SAU_MODE_UART | _0000_SAU_TRANSFER_END;
	;***      520 :     SCR11 = _4000_SAU_RECEPTION | _0000_SAU_INTSRE_MASK | _0000_SAU_PARITY_NONE | _0080_SAU_LSB | _0010_SAU_STOP_1 |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 520
	movw [de+0xEA], ax
	;***      521 :             _0007_SAU_LENGTH_8;
	;***      522 :     SDR11 = _CE00_UART2_RECEIVE_DIVISOR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 522
	movw 0xFFF4A, #0xCE00
	;***      523 :     SO1 |= _0001_SAU_CH0_DATA_OUTPUT_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 523
	movw ax, [de+0xF8]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de+0xF8], ax
	;***      524 :     SOL1 |= _0000_SAU_CHANNEL0_NORMAL;    /* output level normal */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 524
	movw ax, !0x0174
	movw !0x0174, ax
	;***      525 :     SOE1 |= _0001_SAU_CH0_OUTPUT_ENABLE;    /* enable UART2 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 525
	movw ax, [de+0xFA]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de+0xFA], ax
	mov a, #0x10
	;***      526 :     /* Set RxD2 pin */
	;***      527 :     PM1 |= 0x10U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 527
	or a, !0xFF21
	mov 0xFFF21, a
	mov a, #0xF7
	mov x, a
	;***      528 :     /* Set TxD2 pin */
	;***      529 :     PMC1 &= 0xF7U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 529
	and a, !0x0061
	mov !0x0061, a
	;***      530 :     P1 |= 0x08U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 530
	or 0xFFF01, #0x08
	mov a, x
	;***      531 :     PM1 &= 0xF7U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 531
	and a, !0xFF21
	mov 0xFFF21, a
	ret
_R_UART2_Start:
	.STACK _R_UART2_Start = 4
	;***      532 : }
	;***      533 : 
	;***      534 : /***********************************************************************************************************************
	;***      535 : * Function Name: R_UART2_Start
	;***      536 : * Description  : This function starts the UART2 module operation.
	;***      537 : * Arguments    : None
	;***      538 : * Return Value : None
	;***      539 : ***********************************************************************************************************************/
	;***      540 : void R_UART2_Start(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 540
	movw de, #0x0162
	;***      541 : {
	;***      542 :     SO1 |= _0001_SAU_CH0_DATA_OUTPUT_1;    /* output level normal */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 542
	movw ax, [de+0x06]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de+0x06], ax
	;***      543 :     SOE1 |= _0001_SAU_CH0_OUTPUT_ENABLE;    /* enable UART2 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 543
	movw ax, [de+0x08]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de+0x08], ax
	;***      544 :     SS1 |= _0002_SAU_CH1_START_TRG_ON | _0001_SAU_CH0_START_TRG_ON;    /* enable UART2 receive and transmit */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 544
	movw ax, [de]
	xch a, x
	or a, #0x03
	xch a, x
	movw [de], ax
	;***      545 :     STIF2 = 0U;    /* clear INTST2 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 545
	clr1 0xFFFE1.0
	;***      546 :     SRIF2 = 0U;    /* clear INTSR2 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 546
	clr1 0xFFFE1.1
	;***      547 :     STMK2 = 0U;    /* enable INTST2 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 547
	clr1 0xFFFE5.0
	;***      548 :     SRMK2 = 0U;    /* enable INTSR2 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 548
	clr1 0xFFFE5.1
	ret
_R_UART2_Stop:
	.STACK _R_UART2_Stop = 4
	;***      549 : }
	;***      550 : 
	;***      551 : /***********************************************************************************************************************
	;***      552 : * Function Name: R_UART2_Stop
	;***      553 : * Description  : This function stops the UART2 module operation.
	;***      554 : * Arguments    : None
	;***      555 : * Return Value : None
	;***      556 : ***********************************************************************************************************************/
	;***      557 : void R_UART2_Stop(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 557
	movw de, #0x0164
	;***      558 : {
	;***      559 :     STMK2 = 1U;    /* disable INTST2 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 559
	set1 0xFFFE5.0
	;***      560 :     SRMK2 = 1U;    /* disable INTSR2 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 560
	set1 0xFFFE5.1
	;***      561 :     ST1 |= _0002_SAU_CH1_STOP_TRG_ON | _0001_SAU_CH0_STOP_TRG_ON;    /* disable UART2 receive and transmit */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 561
	movw ax, [de]
	xch a, x
	or a, #0x03
	xch a, x
	movw [de], ax
	;***      562 :     SOE1 &= ~_0001_SAU_CH0_OUTPUT_ENABLE;    /* disable UART2 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 562
	movw ax, [de+0x06]
	xch a, x
	and a, #0xFE
	xch a, x
	movw [de+0x06], ax
	;***      563 :     STIF2 = 0U;    /* clear INTST2 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 563
	clr1 0xFFFE1.0
	;***      564 :     SRIF2 = 0U;    /* clear INTSR2 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 564
	clr1 0xFFFE1.1
	ret
_R_UART2_Receive:
	.STACK _R_UART2_Receive = 4
	;***      565 :    
	;***      566 : }
	;***      567 : 
	;***      568 : /***********************************************************************************************************************
	;***      569 : * Function Name: R_UART2_Receive
	;***      570 : * Description  : This function receives UART2 data.
	;***      571 : * Arguments    : rx_buf -
	;***      572 : *                    receive buffer pointer
	;***      573 : *                rx_num -
	;***      574 : *                    buffer size
	;***      575 : * Return Value : status -
	;***      576 : *                    MD_OK or MD_ARGERROR
	;***      577 : ***********************************************************************************************************************/
	;***      578 : MD_STATUS R_UART2_Receive(uint8_t * const rx_buf, uint16_t rx_num)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 578
	movw de, ax
	movw ax, bc
	;***      579 : {
	;***      580 :     MD_STATUS status = MD_OK;
	;***      581 : 
	;***      582 :     if (rx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 582
	or a, x
	bnz $.BB@LABEL@21_2
.BB@LABEL@21_1:	; if_break_bb
	;***      583 :     {
	;***      584 :         status = MD_ARGERROR;
	;***      585 :     }
	;***      586 :     else
	;***      587 :     {
	;***      588 :         g_uart2_rx_count = 0U;
	;***      589 :         g_uart2_rx_length = rx_num;
	;***      590 :         gp_uart2_rx_address = rx_buf;
	;***      591 :     }
	;***      592 : 
	;***      593 :     return (status);
	;***      594 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 594
	movw ax, #0x0081
	ret
.BB@LABEL@21_2:	; if_else_bb
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 588
	movw !LOWW(_g_uart2_rx_count), ax
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 589
	movw !LOWW(_g_uart2_rx_length), ax
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 590
	movw !LOWW(_gp_uart2_rx_address), ax
	clrw ax
	ret
_R_UART2_Send:
	.STACK _R_UART2_Send = 4
	;***      595 : 
	;***      596 : /***********************************************************************************************************************
	;***      597 : * Function Name: R_UART2_Send
	;***      598 : * Description  : This function sends UART2 data.
	;***      599 : * Arguments    : tx_buf -
	;***      600 : *                    transfer buffer pointer
	;***      601 : *                tx_num -
	;***      602 : *                    buffer size
	;***      603 : * Return Value : status -
	;***      604 : *                    MD_OK or MD_ARGERROR
	;***      605 : ***********************************************************************************************************************/
	;***      606 : MD_STATUS R_UART2_Send(uint8_t * const tx_buf, uint16_t tx_num)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 606
	movw de, ax
	movw ax, bc
	;***      607 : {
	;***      608 :     MD_STATUS status = MD_OK;
	;***      609 : 
	;***      610 :     if (tx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 610
	or a, x
	bnz $.BB@LABEL@22_2
.BB@LABEL@22_1:	; if_break_bb
	;***      611 :     {
	;***      612 :         status = MD_ARGERROR;
	;***      613 :     }
	;***      614 :     else
	;***      615 :     {
	;***      616 :         gp_uart2_tx_address = tx_buf;
	;***      617 :         g_uart2_tx_count = tx_num;
	;***      618 :         STMK2 = 1U;    /* disable INTST2 interrupt */
	;***      619 :         TXD2 = *gp_uart2_tx_address;
	;***      620 :         gp_uart2_tx_address++;
	;***      621 :         g_uart2_tx_count--;
	;***      622 :         STMK2 = 0U;    /* enable INTST2 interrupt */
	;***      623 :     }
	;***      624 : 
	;***      625 :     return (status);
	;***      626 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 626
	movw ax, #0x0081
	ret
.BB@LABEL@22_2:	; if_else_bb
	movw hl, #0xFFE5
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 616
	movw !LOWW(_gp_uart2_tx_address), ax
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 617
	movw !LOWW(_g_uart2_tx_count), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 618
	set1 [hl].0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 619
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 620
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 621
	decw !LOWW(_g_uart2_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 622
	clr1 [hl].0
	clrw ax
	ret
_R_UART3_Create:
	.STACK _R_UART3_Create = 4
	;***      627 : 
	;***      628 : /***********************************************************************************************************************
	;***      629 : * Function Name: R_UART3_Create
	;***      630 : * Description  : This function initializes the UART3 module.
	;***      631 : * Arguments    : None
	;***      632 : * Return Value : None
	;***      633 : ***********************************************************************************************************************/
	;***      634 : void R_UART3_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 634
	movw de, #0x0070
	;***      635 : {
	;***      636 :     ST1 |= _0008_SAU_CH3_STOP_TRG_ON | _0004_SAU_CH2_STOP_TRG_ON;    /* disable UART3 receive and transmit */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 636
	movw ax, [de+0xF4]
	xch a, x
	or a, #0x0C
	xch a, x
	movw [de+0xF4], ax
	;***      637 :     STMK3 = 1U;    /* disable INTST3 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 637
	set1 0xFFFE7.4
	;***      638 :     STIF3 = 0U;    /* clear INTST3 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 638
	clr1 0xFFFE3.4
	;***      639 :     SRMK3 = 1U;    /* disable INTSR3 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 639
	set1 0xFFFE7.5
	;***      640 :     SRIF3 = 0U;    /* clear INTSR3 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 640
	clr1 0xFFFE3.5
	;***      641 :     SREMK3 = 1U;   /* disable INTSRE3 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 641
	set1 0xFFFD5.4
	;***      642 :     SREIF3 = 0U;   /* clear INTSRE3 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 642
	clr1 0xFFFD1.4
	;***      643 :     /* Set INTST3 low priority */
	;***      644 :     STPR13 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 644
	set1 0xFFFEF.4
	;***      645 :     STPR03 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 645
	set1 0xFFFEB.4
	;***      646 :     /* Set INTSR3 low priority */
	;***      647 :     SRPR13 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 647
	set1 0xFFFEF.5
	;***      648 :     SRPR03 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 648
	set1 0xFFFEB.5
	movw ax, #0x0022
	;***      649 :     SMR12 = _0020_SAU_SMRMN_INITIALVALUE | _0000_SAU_CLOCK_SELECT_CK00 | _0000_SAU_TRIGGER_SOFTWARE |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 649
	movw [de+0xE4], ax
	movw ax, #0x8097
	;***      650 :             _0002_SAU_MODE_UART | _0000_SAU_TRANSFER_END;
	;***      651 :     SCR12 = _8000_SAU_TRANSMISSION | _0000_SAU_INTSRE_MASK | _0000_SAU_PARITY_NONE | _0080_SAU_LSB | _0010_SAU_STOP_1 |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 651
	movw [de+0xEC], ax
	;***      652 :             _0007_SAU_LENGTH_8;
	;***      653 :     SDR12 = _CE00_UART3_TRANSMIT_DIVISOR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 653
	movw 0xFFF14, #0xCE00
	;***      654 :     NFEN0 |= _40_SAU_RXD3_FILTER_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 654
	mov a, [de]
	set1 a.6
	mov [de], a
	movw ax, #0x0007
	;***      655 :     SIR13 = _0004_SAU_SIRMN_FECTMN | _0002_SAU_SIRMN_PECTMN | _0001_SAU_SIRMN_OVCTMN;    /* clear error flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 655
	movw [de+0xDE], ax
	movw ax, #0x0122
	;***      656 :     SMR13 = _0020_SAU_SMRMN_INITIALVALUE | _0000_SAU_CLOCK_SELECT_CK00 | _0100_SAU_TRIGGER_RXD | _0000_SAU_EDGE_FALL |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 656
	movw [de+0xE6], ax
	movw ax, #0x4097
	;***      657 :             _0002_SAU_MODE_UART | _0000_SAU_TRANSFER_END;
	;***      658 :     SCR13 = _4000_SAU_RECEPTION | _0000_SAU_INTSRE_MASK | _0000_SAU_PARITY_NONE | _0080_SAU_LSB | _0010_SAU_STOP_1 |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 658
	movw [de+0xEE], ax
	;***      659 :             _0007_SAU_LENGTH_8;
	;***      660 :     SDR13 = _CE00_UART3_RECEIVE_DIVISOR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 660
	movw 0xFFF16, #0xCE00
	;***      661 :     SO1 |= _0004_SAU_CH2_DATA_OUTPUT_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 661
	movw ax, [de+0xF8]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de+0xF8], ax
	;***      662 :     SOL1 |= _0000_SAU_CHANNEL2_NORMAL;    /* output level normal */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 662
	movw ax, !0x0174
	movw !0x0174, ax
	;***      663 :     SOE1 |= _0004_SAU_CH2_OUTPUT_ENABLE;    /* enable UART3 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 663
	movw ax, [de+0xFA]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de+0xFA], ax
	mov a, #0x08
	;***      664 :     /* Set RxD3 pin */
	;***      665 :     PM14 |= 0x08U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 665
	or a, !0xFF2E
	mov 0xFFF2E, a
	;***      666 :     /* Set TxD3 pin */
	;***      667 :     P14 |= 0x10U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 667
	or 0xFFF0E, #0x10
	mov a, #0xEF
	;***      668 :     PM14 &= 0xEFU;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 668
	and a, !0xFF2E
	mov 0xFFF2E, a
	ret
_R_UART3_Start:
	.STACK _R_UART3_Start = 4
	;***      669 : }
	;***      670 : 
	;***      671 : /***********************************************************************************************************************
	;***      672 : * Function Name: R_UART3_Start
	;***      673 : * Description  : This function starts the UART3 module operation.
	;***      674 : * Arguments    : None
	;***      675 : * Return Value : None
	;***      676 : ***********************************************************************************************************************/
	;***      677 : void R_UART3_Start(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 677
	movw de, #0x0162
	;***      678 : {
	;***      679 :     SO1 |= _0004_SAU_CH2_DATA_OUTPUT_1;    /* output level normal */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 679
	movw ax, [de+0x06]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de+0x06], ax
	;***      680 :     SOE1 |= _0004_SAU_CH2_OUTPUT_ENABLE;    /* enable UART3 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 680
	movw ax, [de+0x08]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de+0x08], ax
	;***      681 :     SS1 |= _0008_SAU_CH3_START_TRG_ON | _0004_SAU_CH2_START_TRG_ON;    /* enable UART3 receive and transmit */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 681
	movw ax, [de]
	xch a, x
	or a, #0x0C
	xch a, x
	movw [de], ax
	;***      682 :     STIF3 = 0U;    /* clear INTST3 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 682
	clr1 0xFFFE3.4
	;***      683 :     SRIF3 = 0U;    /* clear INTSR3 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 683
	clr1 0xFFFE3.5
	;***      684 :     STMK3 = 0U;    /* enable INTST3 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 684
	clr1 0xFFFE7.4
	;***      685 :     SRMK3 = 0U;    /* enable INTSR3 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 685
	clr1 0xFFFE7.5
	ret
_R_UART3_Stop:
	.STACK _R_UART3_Stop = 4
	;***      686 : }
	;***      687 : 
	;***      688 : /***********************************************************************************************************************
	;***      689 : * Function Name: R_UART3_Stop
	;***      690 : * Description  : This function stops the UART3 module operation.
	;***      691 : * Arguments    : None
	;***      692 : * Return Value : None
	;***      693 : ***********************************************************************************************************************/
	;***      694 : void R_UART3_Stop(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 694
	movw de, #0x0164
	;***      695 : {
	;***      696 :     STMK3 = 1U;    /* disable INTST3 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 696
	set1 0xFFFE7.4
	;***      697 :     SRMK3 = 1U;    /* disable INTSR3 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 697
	set1 0xFFFE7.5
	;***      698 :     ST1 |= _0008_SAU_CH3_STOP_TRG_ON | _0004_SAU_CH2_STOP_TRG_ON;    /* disable UART3 receive and transmit */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 698
	movw ax, [de]
	xch a, x
	or a, #0x0C
	xch a, x
	movw [de], ax
	;***      699 :     SOE1 &= ~_0004_SAU_CH2_OUTPUT_ENABLE;    /* disable UART3 output */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 699
	movw ax, [de+0x06]
	xch a, x
	and a, #0xFB
	xch a, x
	movw [de+0x06], ax
	;***      700 :     STIF3 = 0U;    /* clear INTST3 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 700
	clr1 0xFFFE3.4
	;***      701 :     SRIF3 = 0U;    /* clear INTSR3 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 701
	clr1 0xFFFE3.5
	ret
_R_UART3_Receive:
	.STACK _R_UART3_Receive = 4
	;***      702 :    
	;***      703 : }
	;***      704 : 
	;***      705 : /***********************************************************************************************************************
	;***      706 : * Function Name: R_UART3_Receive
	;***      707 : * Description  : This function receives UART3 data.
	;***      708 : * Arguments    : rx_buf -
	;***      709 : *                    receive buffer pointer
	;***      710 : *                rx_num -
	;***      711 : *                    buffer size
	;***      712 : * Return Value : status -
	;***      713 : *                    MD_OK or MD_ARGERROR
	;***      714 : ***********************************************************************************************************************/
	;***      715 : MD_STATUS R_UART3_Receive(uint8_t * const rx_buf, uint16_t rx_num)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 715
	movw de, ax
	movw ax, bc
	;***      716 : {
	;***      717 :     MD_STATUS status = MD_OK;
	;***      718 : 
	;***      719 :     if (rx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 719
	or a, x
	bnz $.BB@LABEL@26_2
.BB@LABEL@26_1:	; if_break_bb
	;***      720 :     {
	;***      721 :         status = MD_ARGERROR;
	;***      722 :     }
	;***      723 :     else
	;***      724 :     {
	;***      725 :         g_uart3_rx_count = 0U;
	;***      726 :         g_uart3_rx_length = rx_num;
	;***      727 :         gp_uart3_rx_address = rx_buf;
	;***      728 :     }
	;***      729 : 
	;***      730 :     return (status);
	;***      731 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 731
	movw ax, #0x0081
	ret
.BB@LABEL@26_2:	; if_else_bb
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 725
	movw !LOWW(_g_uart3_rx_count), ax
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 726
	movw !LOWW(_g_uart3_rx_length), ax
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 727
	movw !LOWW(_gp_uart3_rx_address), ax
	clrw ax
	ret
_R_UART3_Send:
	.STACK _R_UART3_Send = 4
	;***      732 : 
	;***      733 : /***********************************************************************************************************************
	;***      734 : * Function Name: R_UART3_Send
	;***      735 : * Description  : This function sends UART3 data.
	;***      736 : * Arguments    : tx_buf -
	;***      737 : *                    transfer buffer pointer
	;***      738 : *                tx_num -
	;***      739 : *                    buffer size
	;***      740 : * Return Value : status -
	;***      741 : *                    MD_OK or MD_ARGERROR
	;***      742 : ***********************************************************************************************************************/
	;***      743 : MD_STATUS R_UART3_Send(uint8_t * const tx_buf, uint16_t tx_num)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 743
	movw de, ax
	movw ax, bc
	;***      744 : {
	;***      745 :     MD_STATUS status = MD_OK;
	;***      746 : 
	;***      747 :     if (tx_num < 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 747
	or a, x
	bnz $.BB@LABEL@27_2
.BB@LABEL@27_1:	; if_break_bb
	;***      748 :     {
	;***      749 :         status = MD_ARGERROR;
	;***      750 :     }
	;***      751 :     else
	;***      752 :     {
	;***      753 :         gp_uart3_tx_address = tx_buf;
	;***      754 :         g_uart3_tx_count = tx_num;
	;***      755 :         STMK3 = 1U;    /* disable INTST3 interrupt */
	;***      756 :         TXD3 = *gp_uart3_tx_address;
	;***      757 :         gp_uart3_tx_address++;
	;***      758 :         g_uart3_tx_count--;
	;***      759 :         STMK3 = 0U;    /* enable INTST3 interrupt */
	;***      760 :     }
	;***      761 : 
	;***      762 :     return (status);
	;***      763 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 763
	movw ax, #0x0081
	ret
.BB@LABEL@27_2:	; if_else_bb
	movw hl, #0xFFE7
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 753
	movw !LOWW(_gp_uart3_tx_address), ax
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 754
	movw !LOWW(_g_uart3_tx_count), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 755
	set1 [hl].4
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 756
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 757
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 758
	decw !LOWW(_g_uart3_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial.c", 759
	clr1 [hl].4
	clrw ax
	ret
	;***      764 : 
	;***      765 : /* Start user code for adding. Do not edit comment generated here */
	;***      766 : //MD_STATUS R_CSI01_Send_Receive(uint8_t * const tx_buf, uint16_t tx_num, uint8_t * const rx_buf)
	;***      767 : //{
	;***      768 : //    MD_STATUS status = MD_OK;
	;***      769 : //
	;***      770 : //    if (tx_num < 1U)
	;***      771 : //    {
	;***      772 : //        status = MD_ARGERROR;
	;***      773 : //    }
	;***      774 : //    else
	;***      775 : //    {
	;***      776 : //        g_csi01_send_length = tx_num;     /* send data length */
	;***      777 : //        g_csi01_tx_count = tx_num;        /* send data count */
	;***      778 : //        gp_csi01_tx_address = tx_buf;     /* send buffer pointer */
	;***      779 : //        gp_csi01_rx_address = rx_buf;     /* receive buffer pointer */
	;***      780 : //
	;***      781 : //        if (1U == tx_num)
	;***      782 : //        {
	;***      783 : //            SMR01 &= (~_0001_SAU_BUFFER_EMPTY); //0bxxxx xxx0
	;***      784 : //        }
	;***      785 : //        else
	;***      786 : //        {
	;***      787 : //            SMR01 |= _0001_SAU_BUFFER_EMPTY;	//0bxxxx xxx1
	;***      788 : //        }
	;***      789 : //
	;***      790 : //        CSIMK01 = 1U;                     /* disable INTCSI01 interrupt */
	;***      791 : //
	;***      792 : //        if (0U != gp_csi01_tx_address)
	;***      793 : //        {
	;***      794 : //            SIO01 = *gp_csi01_tx_address;    /* started by writing data to SDR[7:0] */
	;***      795 : //            gp_csi01_tx_address++;
	;***      796 : //        }
	;***      797 : //        else
	;***      798 : //        {
	;***      799 : //            SIO01 = 0xFFU;
	;***      800 : //        }
	;***      801 : //
	;***      802 : //        g_csi01_tx_count--; // 1-1=0;
	;***      803 : //        CSIMK01 = 0U;                     /* enable INTCSI01 interrupt */
	;***      804 : //    }
	;***      805 : //
	;***      806 : //    return (status);
	;***      807 : //}
	;***      808 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
	.ALIGN 2
_gp_uart1_tx_address:
	.DS (2)
	.ALIGN 2
_g_uart1_tx_count:
	.DS (2)
	.ALIGN 2
_gp_uart1_rx_address:
	.DS (2)
	.ALIGN 2
_g_uart1_rx_count:
	.DS (2)
	.ALIGN 2
_g_uart1_rx_length:
	.DS (2)
	.ALIGN 2
_gp_csi00_rx_address:
	.DS (2)
	.ALIGN 2
_g_csi00_rx_length:
	.DS (2)
	.ALIGN 2
_g_csi00_rx_count:
	.DS (2)
	.ALIGN 2
_gp_csi00_tx_address:
	.DS (2)
	.ALIGN 2
_g_csi00_send_length:
	.DS (2)
	.ALIGN 2
_g_csi00_tx_count:
	.DS (2)
	.ALIGN 2
_gp_csi01_rx_address:
	.DS (2)
	.ALIGN 2
_g_csi01_rx_length:
	.DS (2)
	.ALIGN 2
_g_csi01_rx_count:
	.DS (2)
	.ALIGN 2
_gp_csi01_tx_address:
	.DS (2)
	.ALIGN 2
_g_csi01_send_length:
	.DS (2)
	.ALIGN 2
_g_csi01_tx_count:
	.DS (2)
	.ALIGN 2
_gp_uart2_tx_address:
	.DS (2)
	.ALIGN 2
_g_uart2_tx_count:
	.DS (2)
	.ALIGN 2
_gp_uart2_rx_address:
	.DS (2)
	.ALIGN 2
_g_uart2_rx_count:
	.DS (2)
	.ALIGN 2
_g_uart2_rx_length:
	.DS (2)
	.ALIGN 2
_gp_uart3_tx_address:
	.DS (2)
	.ALIGN 2
_g_uart3_tx_count:
	.DS (2)
	.ALIGN 2
_gp_uart3_rx_address:
	.DS (2)
	.ALIGN 2
_g_uart3_rx_count:
	.DS (2)
	.ALIGN 2
_g_uart3_rx_length:
	.DS (2)
