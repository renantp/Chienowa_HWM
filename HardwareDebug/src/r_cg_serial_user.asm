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
#@   -o src/r_cg_serial_user.obj
#@   ../src/r_cg_serial_user.c
#@  compiled at Fri Feb 25 09:28:38 2022

	.PUBLIC _g_uart3_rx_data
	.EXTERN _gp_uart1_tx_address
	.EXTERN _g_uart1_tx_count
	.EXTERN _gp_uart1_rx_address
	.EXTERN _g_uart1_rx_count
	.EXTERN _g_uart1_rx_length
	.EXTERN _gp_csi00_tx_address
	.EXTERN _g_csi00_tx_count
	.EXTERN _gp_csi01_rx_address
	.EXTERN _gp_csi01_tx_address
	.EXTERN _g_csi01_tx_count
	.EXTERN _gp_uart2_tx_address
	.EXTERN _g_uart2_tx_count
	.EXTERN _gp_uart2_rx_address
	.EXTERN _g_uart2_rx_count
	.EXTERN _g_uart2_rx_length
	.EXTERN _gp_uart3_tx_address
	.EXTERN _g_uart3_tx_count
	.EXTERN _gp_uart3_rx_address
	.EXTERN _g_uart3_rx_count
	.EXTERN _g_uart3_rx_length
	.PUBLIC _send_response_flag
	.PUBLIC _send_response_time_flag
	.PUBLIC _send_response_number_flag
	.PUBLIC _recived_time_setting_flag
	.PUBLIC _send_respone_status_flag
	.PUBLIC _recived_number_setting_flag
	.PUBLIC _g_commnunication_flag
	.PUBLIC _g_csi_count
	.PUBLIC _g_csi_err
	.PUBLIC _g_csi_send_end
	.PUBLIC _g_csi_rev_end
	.PUBLIC _g_uart1_send
	.PUBLIC _g_uart2_sendend
	.PUBLIC _g_uart2_receive
	.PUBLIC _g_rx_data
	.PUBLIC _g_uart2_fault
	.PUBLIC _g_uart3_sendend
	.EXTERN _R_CSI01_Stop
	.EXTERN _uart2_handle
	.EXTERN _R_UART3_Receive

	.SECTION .text,TEXT
_r_uart1_interrupt_receive@1	.vector 0x0026
_r_uart1_interrupt_receive@1:
	.STACK _r_uart1_interrupt_receive@1 = 16
	;***        1 : /***********************************************************************************************************************
	;***        2 :  * DISCLAIMER
	;***        3 :  * This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products.
	;***        4 :  * No other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
	;***        5 :  * applicable laws, including copyright laws.
	;***        6 :  * THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING THIS SOFTWARE, WHETHER EXPRESS, IMPLIED
	;***        7 :  * OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	;***        8 :  * NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY
	;***        9 :  * LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE FOR ANY DIRECT,
	;***       10 :  * INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR
	;***       11 :  * ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
	;***       12 :  * Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability
	;***       13 :  * of this software. By using this software, you agree to the additional terms and conditions found by accessing the
	;***       14 :  * following link:
	;***       15 :  * http://www.renesas.com/disclaimer
	;***       16 :  *
	;***       17 :  * Copyright (C) 2011, 2020 Renesas Electronics Corporation. All rights reserved.
	;***       18 :  ***********************************************************************************************************************/
	;***       19 : 
	;***       20 : /***********************************************************************************************************************
	;***       21 :  * File Name    : r_cg_serial_user.c
	;***       22 :  * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 :  * Device(s)    : R5F104ML
	;***       24 :  * Tool-Chain   : CCRL
	;***       25 :  * Description  : This file implements device driver for Serial module.
	;***       26 :  * Creation Date: 30/11/2021
	;***       27 :  ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 :  Includes
	;***       31 :  ***********************************************************************************************************************/
	;***       32 : #include "hwm/main.h"
	;***       33 : #include "r_cg_macrodriver.h"
	;***       34 : #include "r_cg_serial.h"
	;***       35 : /* Start user code for include. Do not edit comment generated here */
	;***       36 : #include "r_cg_wdt.h"
	;***       37 : #include "r_cg_userdefine.h"
	;***       38 : 
	;***       39 : /***********************************************************************************************************************
	;***       40 :  Pragma directive
	;***       41 :  ***********************************************************************************************************************/
	;***       42 : #pragma interrupt r_uart1_interrupt_send(vect=INTST1)
	;***       43 : #pragma interrupt r_uart1_interrupt_receive(vect=INTSR1)
	;***       44 : #pragma interrupt r_csi00_interrupt(vect=INTCSI00)
	;***       45 : #pragma interrupt r_csi01_interrupt(vect=INTCSI01)
	;***       46 : #pragma interrupt r_uart2_interrupt_send(vect=INTST2)
	;***       47 : #pragma interrupt r_uart2_interrupt_receive(vect=INTSR2)
	;***       48 : #pragma interrupt r_uart3_interrupt_send(vect=INTST3)
	;***       49 : #pragma interrupt r_uart3_interrupt_receive(vect=INTSR3)
	;***       50 : /* Start user code for pragma. Do not edit comment generated here */
	;***       51 : /* End user code. Do not edit comment generated here */
	;***       52 : 
	;***       53 : /***********************************************************************************************************************
	;***       54 :  Global variables and functions
	;***       55 :  ***********************************************************************************************************************/
	;***       56 : extern volatile uint8_t *gp_uart1_tx_address; /* uart1 send buffer address */
	;***       57 : extern volatile uint16_t g_uart1_tx_count; /* uart1 send data number */
	;***       58 : extern volatile uint8_t *gp_uart1_rx_address; /* uart1 receive buffer address */
	;***       59 : extern volatile uint16_t g_uart1_rx_count; /* uart1 receive data number */
	;***       60 : extern volatile uint16_t g_uart1_rx_length; /* uart1 receive data length */
	;***       61 : extern volatile uint8_t *gp_csi00_rx_address; /* csi00 receive buffer address */
	;***       62 : extern volatile uint16_t g_csi00_rx_length; /* csi00 receive data length */
	;***       63 : extern volatile uint16_t g_csi00_rx_count; /* csi00 receive data count */
	;***       64 : extern volatile uint8_t *gp_csi00_tx_address; /* csi00 send buffer address */
	;***       65 : extern volatile uint16_t g_csi00_send_length; /* csi00 send data length */
	;***       66 : extern volatile uint16_t g_csi00_tx_count; /* csi00 send data count */
	;***       67 : extern volatile uint8_t *gp_csi01_rx_address; /* csi01 receive buffer address */
	;***       68 : extern volatile uint16_t g_csi01_rx_length; /* csi01 receive data length */
	;***       69 : extern volatile uint16_t g_csi01_rx_count; /* csi01 receive data count */
	;***       70 : extern volatile uint8_t *gp_csi01_tx_address; /* csi01 send buffer address */
	;***       71 : extern volatile uint16_t g_csi01_send_length; /* csi01 send data length */
	;***       72 : extern volatile uint16_t g_csi01_tx_count; /* csi01 send data count */
	;***       73 : extern volatile uint8_t *gp_uart2_tx_address; /* uart2 send buffer address */
	;***       74 : extern volatile uint16_t g_uart2_tx_count; /* uart2 send data number */
	;***       75 : extern volatile uint8_t *gp_uart2_rx_address; /* uart2 receive buffer address */
	;***       76 : extern volatile uint16_t g_uart2_rx_count; /* uart2 receive data number */
	;***       77 : extern volatile uint16_t g_uart2_rx_length; /* uart2 receive data length */
	;***       78 : extern volatile uint8_t *gp_uart3_tx_address; /* uart3 send buffer address */
	;***       79 : extern volatile uint16_t g_uart3_tx_count; /* uart3 send data number */
	;***       80 : extern volatile uint8_t *gp_uart3_rx_address; /* uart3 receive buffer address */
	;***       81 : extern volatile uint16_t g_uart3_rx_count; /* uart3 receive data number */
	;***       82 : extern volatile uint16_t g_uart3_rx_length; /* uart3 receive data length */
	;***       83 : /* Start user code for global. Do not edit comment generated here */
	;***       84 : volatile uint8_t send_response_flag, send_response_time_flag,
	;***       85 : 		send_response_number_flag, recived_time_setting_flag,
	;***       86 : 		send_respone_status_flag, recived_number_setting_flag;
	;***       87 : volatile struct Communicaition_flag_s g_commnunication_flag;
	;***       88 : volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end,
	;***       89 : 		g_uart1_send, g_uart2_sendend, g_uart2_receive;
	;***       90 : uint8_t g_rx_data[4 * 40];
	;***       91 : uint8_t g_uart3_rx_data[8];
	;***       92 : volatile uint8_t g_uart2_fault;
	;***       93 : volatile uint8_t g_uart3_sendend;
	;***       94 : 
	;***       95 : /* End user code. Do not edit comment generated here */
	;***       96 : 
	;***       97 : /***********************************************************************************************************************
	;***       98 :  * Function Name: r_uart1_interrupt_receive
	;***       99 :  * Description  : This function is INTSR1 interrupt service routine.
	;***      100 :  * Arguments    : None
	;***      101 :  * Return Value : None
	;***      102 :  ***********************************************************************************************************************/
	;***      103 : static void __near r_uart1_interrupt_receive(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 103
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      104 : 	volatile uint8_t rx_data;
	;***      105 : 	volatile uint8_t err_type;
	;***      106 : 
	;***      107 : 	err_type = (uint8_t) (SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 107
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      108 : 	SIR03 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 108
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      109 : 
	;***      110 : 	if (err_type != 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 110
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@1_2
.BB@LABEL@1_1:	; if_then_bb
	;***      111 : 		r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 111
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@1_2:	; if_break_bb
	;***      112 : 	}
	;***      113 : 
	;***      114 : 	rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 114
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      115 : 
	;***      116 : 	if (g_uart1_rx_length > g_uart1_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 116
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb18
	;***      117 : 		*gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 117
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      118 : 		gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 118
	incw !LOWW(_gp_uart1_rx_address)
	;***      119 : 		g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 119
	incw !LOWW(_g_uart1_rx_count)
	;***      120 : 
	;***      121 : 		if (g_uart1_rx_length == g_uart1_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 121
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@1_4:	; if_then_bb30
	;***      122 : 			r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 122
	call !!_r_uart1_callback_receiveend@1
.BB@LABEL@1_5:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 127
	reti
.BB@LABEL@1_6:	; if_else_bb
	;***      123 : 		}
	;***      124 : 	} else {
	;***      125 : 		r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 125
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@1_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      126 : 	}
	;***      127 : }
	;***      128 : 
	;***      129 : /***********************************************************************************************************************
	;***      130 :  * Function Name: r_uart1_interrupt_send
	;***      131 :  * Description  : This function is INTST1 interrupt service routine.
	;***      132 :  * Arguments    : None
	;***      133 :  * Return Value : None
	;***      134 :  ***********************************************************************************************************************/
	;***      135 : static void __near r_uart1_interrupt_send(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 135
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      136 : 	if (g_uart1_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 136
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_3
.BB@LABEL@2_1:	; if_else_bb
	;***      137 : 		TXD1 = *gp_uart1_tx_address;
	;***      138 : 		gp_uart1_tx_address++;
	;***      139 : 		g_uart1_tx_count--;
	;***      140 : 	} else {
	;***      141 : 		r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 141
	call !!_r_uart1_callback_sendend@1
.BB@LABEL@2_2:	; if_else_bb
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 143
	reti
.BB@LABEL@2_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 137
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 138
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 139
	decw !LOWW(_g_uart1_tx_count)
	br $.BB@LABEL@2_2
	.SECTION .textf,TEXTF
_r_uart1_callback_receiveend@1:
	.STACK _r_uart1_callback_receiveend@1 = 4
	;***      142 : 	}
	;***      143 : }
	;***      144 : 
	;***      145 : /***********************************************************************************************************************
	;***      146 :  * Function Name: r_uart1_callback_receiveend
	;***      147 :  * Description  : This function is a callback function when UART1 finishes reception.
	;***      148 :  * Arguments    : None
	;***      149 :  * Return Value : None
	;***      150 :  ***********************************************************************************************************************/
	;***      151 : static void r_uart1_callback_receiveend(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 151
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      152 : 	/* Start user code. Do not edit comment generated here */
	;***      153 : 	/* End user code. Do not edit comment generated here */
	;***      154 : }
	;***      155 : 
	;***      156 : /***********************************************************************************************************************
	;***      157 :  * Function Name: r_uart1_callback_softwareoverrun
	;***      158 :  * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      159 :  * Arguments    : rx_data -
	;***      160 :  *                    receive data
	;***      161 :  * Return Value : None
	;***      162 :  ***********************************************************************************************************************/
	;***      163 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 163
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      164 : 	/* Start user code. Do not edit comment generated here */
	;***      165 : 	/* End user code. Do not edit comment generated here */
	;***      166 : }
	;***      167 : 
	;***      168 : /***********************************************************************************************************************
	;***      169 :  * Function Name: r_uart1_callback_sendend
	;***      170 :  * Description  : This function is a callback function when UART1 finishes transmission.
	;***      171 :  * Arguments    : None
	;***      172 :  * Return Value : None
	;***      173 :  ***********************************************************************************************************************/
	;***      174 : static void r_uart1_callback_sendend(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 174
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      175 : 	/* Start user code. Do not edit comment generated here */
	;***      176 : 	/* End user code. Do not edit comment generated here */
	;***      177 : }
	;***      178 : 
	;***      179 : /***********************************************************************************************************************
	;***      180 :  * Function Name: r_uart1_callback_error
	;***      181 :  * Description  : This function is a callback function when UART1 reception error occurs.
	;***      182 :  * Arguments    : err_type -
	;***      183 :  *                    error type value
	;***      184 :  * Return Value : None
	;***      185 :  ***********************************************************************************************************************/
	;***      186 : static void r_uart1_callback_error(uint8_t err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 186
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      187 : 	/* Start user code. Do not edit comment generated here */
	;***      188 : 	/* End user code. Do not edit comment generated here */
	;***      189 : }
	;***      190 : 
	;***      191 : /***********************************************************************************************************************
	;***      192 :  * Function Name: r_csi00_interrupt
	;***      193 :  * Description  : This function is INTCSI00 interrupt service routine.
	;***      194 :  * Arguments    : None
	;***      195 :  * Return Value : None
	;***      196 :  ***********************************************************************************************************************/
	;***      197 : static void __near r_csi00_interrupt(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 197
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      198 : 	volatile uint8_t err_type;
	;***      199 : 
	;***      200 : 	err_type = (uint8_t) (SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 200
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      201 : 	SIR00 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 201
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      202 : 
	;***      203 : 	if (err_type != 1U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 203
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@7_2
.BB@LABEL@7_1:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 212
	reti
.BB@LABEL@7_2:	; if_then_bb
	;***      204 : 		if (g_csi00_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 204
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@7_4
.BB@LABEL@7_3:	; if_else_bb
	;***      205 : 			SIO00 = *gp_csi00_tx_address;
	;***      206 : 			gp_csi00_tx_address++;
	;***      207 : 			g_csi00_tx_count--;
	;***      208 : 		} else {
	;***      209 : 			r_csi00_callback_sendend(); /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 209
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@7_1
.BB@LABEL@7_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 205
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 206
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 207
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@7_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      210 : 		}
	;***      211 : 	}
	;***      212 : }
	;***      213 : 
	;***      214 : /***********************************************************************************************************************
	;***      215 :  * Function Name: r_csi00_callback_sendend
	;***      216 :  * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      217 :  * Arguments    : None
	;***      218 :  * Return Value : None
	;***      219 :  ***********************************************************************************************************************/
	;***      220 : static void r_csi00_callback_sendend(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 220
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      221 : 	/* Start user code. Do not edit comment generated here */
	;***      222 : 	/* End user code. Do not edit comment generated here */
	;***      223 : }
	;***      224 : 
	;***      225 : /***********************************************************************************************************************
	;***      226 :  * Function Name: r_csi01_interrupt
	;***      227 :  * Description  : This function is INTCSI01 interrupt service routine.
	;***      228 :  * Arguments    : None
	;***      229 :  * Return Value : None
	;***      230 :  ***********************************************************************************************************************/
	;***      231 : static void __near r_csi01_interrupt(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 231
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      232 : 	volatile uint8_t err_type;
	;***      233 : 	volatile uint8_t sio_dummy;
	;***      234 : 
	;***      235 : 	err_type = (uint8_t) (SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 235
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      236 : 	SIR01 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 236
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      237 : 
	;***      238 : 	if (1U == err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 238
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@9_2
.BB@LABEL@9_1:	; if_then_bb
	;***      239 : 		r_csi01_callback_error(err_type); /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 239
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@9_15
.BB@LABEL@9_2:	; if_else_bb
	;***      240 : 	} else {
	;***      241 : 		if (g_csi01_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 241
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_8
.BB@LABEL@9_3:	; if_else_bb42
	;***      242 : 			if (0U != gp_csi01_rx_address) {
	;***      243 : 				*gp_csi01_rx_address = SIO01;
	;***      244 : 				gp_csi01_rx_address++;
	;***      245 : 			} else {
	;***      246 : 				sio_dummy = SIO01;
	;***      247 : 			}
	;***      248 : 
	;***      249 : 			if (0U != gp_csi01_tx_address) {
	;***      250 : 				SIO01 = *gp_csi01_tx_address;
	;***      251 : 				gp_csi01_tx_address++;
	;***      252 : 			} else {
	;***      253 : 				SIO01 = 0xFFU;
	;***      254 : 			}
	;***      255 : 
	;***      256 : 			g_csi01_tx_count--;
	;***      257 : 		} else {
	;***      258 : 			if (0U == g_csi01_tx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 258
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@9_7
.BB@LABEL@9_4:	; if_then_bb47
	;***      259 : 				if (0U != gp_csi01_rx_address) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 259
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_6
.BB@LABEL@9_5:	; if_else_bb55
	;***      260 : 					*gp_csi01_rx_address = SIO01;
	;***      261 : 				} else {
	;***      262 : 					sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 262
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@9_7
.BB@LABEL@9_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 260
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@9_7:	; if_break_bb59
	;***      263 : 				}
	;***      264 : 			}
	;***      265 : 
	;***      266 : 			r_csi01_callback_sendend(); /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 266
	call !!_r_csi01_callback_sendend@1
	;***      267 : 			r_csi01_callback_receiveend(); /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 267
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@9_15
.BB@LABEL@9_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 242
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_10
.BB@LABEL@9_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 246
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@9_11
.BB@LABEL@9_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 243
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 244
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@9_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 249
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_13
.BB@LABEL@9_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 253
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@9_14
.BB@LABEL@9_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 250
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 251
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@9_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 256
	decw !LOWW(_g_csi01_tx_count)
.BB@LABEL@9_15:	; if_break_bb39
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 270
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      268 : 		}
	;***      269 : 	}
	;***      270 : }
	;***      271 : 
	;***      272 : /***********************************************************************************************************************
	;***      273 :  * Function Name: r_csi01_callback_receiveend
	;***      274 :  * Description  : This function is a callback function when CSI01 finishes reception.
	;***      275 :  * Arguments    : None
	;***      276 :  * Return Value : None
	;***      277 :  ***********************************************************************************************************************/
	;***      278 : static void r_csi01_callback_receiveend(void) {
	;***      279 : 	/* Start user code. Do not edit comment generated here */
	;***      280 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 280
	inc !LOWW(_g_csi_rev_end)
	;***      281 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 281
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      282 : 	/* End user code. Do not edit comment generated here */
	;***      283 : }
	;***      284 : 
	;***      285 : /***********************************************************************************************************************
	;***      286 :  * Function Name: r_csi01_callback_error
	;***      287 :  * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      288 :  * Arguments    : err_type -
	;***      289 :  *                    error type value
	;***      290 :  * Return Value : None
	;***      291 :  ***********************************************************************************************************************/
	;***      292 : static void r_csi01_callback_error(uint8_t err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 292
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      293 : 	/* Start user code. Do not edit comment generated here */
	;***      294 : 
	;***      295 : 	/* End user code. Do not edit comment generated here */
	;***      296 : }
	;***      297 : 
	;***      298 : /***********************************************************************************************************************
	;***      299 :  * Function Name: r_csi01_callback_sendend
	;***      300 :  * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      301 :  * Arguments    : None
	;***      302 :  * Return Value : None
	;***      303 :  ***********************************************************************************************************************/
	;***      304 : static void r_csi01_callback_sendend(void) {
	;***      305 : 	/* Start user code. Do not edit comment generated here */
	;***      306 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 306
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      307 : 	/* End user code. Do not edit comment generated here */
	;***      308 : }
	;***      309 : 
	;***      310 : /***********************************************************************************************************************
	;***      311 :  * Function Name: r_uart2_interrupt_receive
	;***      312 :  * Description  : This function is INTSR2 interrupt service routine.
	;***      313 :  * Arguments    : None
	;***      314 :  * Return Value : None
	;***      315 :  ***********************************************************************************************************************/
	;***      316 : static void __near r_uart2_interrupt_receive(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 316
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      317 : 	volatile uint8_t rx_data;
	;***      318 : 	volatile uint8_t err_type;
	;***      319 : 
	;***      320 : 	err_type = (uint8_t) (SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 320
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      321 : 	SIR11 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 321
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      322 : 
	;***      323 : 	if (err_type != 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 323
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@13_2
.BB@LABEL@13_1:	; if_then_bb
	;***      324 : 		r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 324
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@13_2:	; if_break_bb
	;***      325 : 	}
	;***      326 : 
	;***      327 : 	rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 327
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      328 : 
	;***      329 : 	if (g_uart2_rx_length > g_uart2_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 329
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@13_6
.BB@LABEL@13_3:	; if_then_bb18
	;***      330 : 		*gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 330
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      331 : 		gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 331
	incw !LOWW(_gp_uart2_rx_address)
	;***      332 : 		g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 332
	incw !LOWW(_g_uart2_rx_count)
	;***      333 : 
	;***      334 : 		if (g_uart2_rx_length == g_uart2_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 334
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@13_4:	; if_then_bb30
	;***      335 : 			r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 335
	call !!_r_uart2_callback_receiveend@1
.BB@LABEL@13_5:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 340
	reti
.BB@LABEL@13_6:	; if_else_bb
	;***      336 : 		}
	;***      337 : 	} else {
	;***      338 : 		r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 338
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@13_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      339 : 	}
	;***      340 : }
	;***      341 : 
	;***      342 : /***********************************************************************************************************************
	;***      343 :  * Function Name: r_uart2_interrupt_send
	;***      344 :  * Description  : This function is INTST2 interrupt service routine.
	;***      345 :  * Arguments    : None
	;***      346 :  * Return Value : None
	;***      347 :  ***********************************************************************************************************************/
	;***      348 : static void __near r_uart2_interrupt_send(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 348
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      349 : 	if (g_uart2_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 349
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@14_3
.BB@LABEL@14_1:	; if_else_bb
	;***      350 : 		TXD2 = *gp_uart2_tx_address;
	;***      351 : 		gp_uart2_tx_address++;
	;***      352 : 		g_uart2_tx_count--;
	;***      353 : 	} else {
	;***      354 : 		r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 354
	call !!_r_uart2_callback_sendend@1
.BB@LABEL@14_2:	; if_else_bb
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 356
	reti
.BB@LABEL@14_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 350
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 351
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 352
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@14_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 4
	;***      355 : 	}
	;***      356 : }
	;***      357 : 
	;***      358 : /***********************************************************************************************************************
	;***      359 :  * Function Name: r_uart2_callback_receiveend
	;***      360 :  * Description  : This function is a callback function when UART2 finishes reception.
	;***      361 :  * Arguments    : None
	;***      362 :  * Return Value : None
	;***      363 :  ***********************************************************************************************************************/
	;***      364 : static void r_uart2_callback_receiveend(void) {
	;***      365 : 	/* Start user code. Do not edit comment generated here */
	;***      366 : 	uart2_handle();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 366
	br !!_uart2_handle
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      367 : 	/* End user code. Do not edit comment generated here */
	;***      368 : }
	;***      369 : 
	;***      370 : /***********************************************************************************************************************
	;***      371 :  * Function Name: r_uart2_callback_softwareoverrun
	;***      372 :  * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      373 :  * Arguments    : rx_data -
	;***      374 :  *                    receive data
	;***      375 :  * Return Value : None
	;***      376 :  ***********************************************************************************************************************/
	;***      377 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 377
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      378 : 	/* Start user code. Do not edit comment generated here */
	;***      379 : 	/* End user code. Do not edit comment generated here */
	;***      380 : }
	;***      381 : 
	;***      382 : /***********************************************************************************************************************
	;***      383 :  * Function Name: r_uart2_callback_sendend
	;***      384 :  * Description  : This function is a callback function when UART2 finishes transmission.
	;***      385 :  * Arguments    : None
	;***      386 :  * Return Value : None
	;***      387 :  ***********************************************************************************************************************/
	;***      388 : static void r_uart2_callback_sendend(void) {
	;***      389 : 	/* Start user code. Do not edit comment generated here */
	;***      390 : 	g_uart2_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 390
	inc !LOWW(_g_uart2_sendend)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      391 : 	/* End user code. Do not edit comment generated here */
	;***      392 : }
	;***      393 : 
	;***      394 : /***********************************************************************************************************************
	;***      395 :  * Function Name: r_uart2_callback_error
	;***      396 :  * Description  : This function is a callback function when UART2 reception error occurs.
	;***      397 :  * Arguments    : err_type -
	;***      398 :  *                    error type value
	;***      399 :  * Return Value : None
	;***      400 :  ***********************************************************************************************************************/
	;***      401 : static void r_uart2_callback_error(uint8_t err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 401
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      402 : 	/* Start user code. Do not edit comment generated here */
	;***      403 : 	/* End user code. Do not edit comment generated here */
	;***      404 : }
	;***      405 : 
	;***      406 : /***********************************************************************************************************************
	;***      407 :  * Function Name: r_uart3_interrupt_receive
	;***      408 :  * Description  : This function is INTSR3 interrupt service routine.
	;***      409 :  * Arguments    : None
	;***      410 :  * Return Value : None
	;***      411 :  ***********************************************************************************************************************/
	;***      412 : static void __near r_uart3_interrupt_receive(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 412
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      413 : 	volatile uint8_t rx_data;
	;***      414 : 	volatile uint8_t err_type;
	;***      415 : 
	;***      416 : 	err_type = (uint8_t) (SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 416
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      417 : 	SIR13 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 417
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      418 : 
	;***      419 : 	if (err_type != 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 419
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@19_2
.BB@LABEL@19_1:	; if_then_bb
	;***      420 : 		r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 420
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@19_2:	; if_break_bb
	;***      421 : 	}
	;***      422 : 
	;***      423 : 	rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 423
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      424 : 
	;***      425 : 	if (g_uart3_rx_length > g_uart3_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 425
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@19_6
.BB@LABEL@19_3:	; if_then_bb18
	;***      426 : 		*gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 426
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      427 : 		gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 427
	incw !LOWW(_gp_uart3_rx_address)
	;***      428 : 		g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 428
	incw !LOWW(_g_uart3_rx_count)
	;***      429 : 
	;***      430 : 		if (g_uart3_rx_length == g_uart3_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 430
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@19_4:	; if_then_bb30
	;***      431 : 			r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 431
	call !!_r_uart3_callback_receiveend@1
.BB@LABEL@19_5:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 436
	reti
.BB@LABEL@19_6:	; if_else_bb
	;***      432 : 		}
	;***      433 : 	} else {
	;***      434 : 		r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 434
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@19_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      435 : 	}
	;***      436 : }
	;***      437 : 
	;***      438 : /***********************************************************************************************************************
	;***      439 :  * Function Name: r_uart3_interrupt_send
	;***      440 :  * Description  : This function is INTST3 interrupt service routine.
	;***      441 :  * Arguments    : None
	;***      442 :  * Return Value : None
	;***      443 :  ***********************************************************************************************************************/
	;***      444 : static void __near r_uart3_interrupt_send(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 444
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      445 : 	if (g_uart3_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 445
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@20_3
.BB@LABEL@20_1:	; if_else_bb
	;***      446 : 		TXD3 = *gp_uart3_tx_address;
	;***      447 : 		gp_uart3_tx_address++;
	;***      448 : 		g_uart3_tx_count--;
	;***      449 : 	} else {
	;***      450 : 		r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 450
	call !!_r_uart3_callback_sendend@1
.BB@LABEL@20_2:	; if_else_bb
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 452
	reti
.BB@LABEL@20_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 446
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 447
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 448
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@20_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      451 : 	}
	;***      452 : }
	;***      453 : 
	;***      454 : /***********************************************************************************************************************
	;***      455 :  * Function Name: r_uart3_callback_receiveend
	;***      456 :  * Description  : This function is a callback function when UART3 finishes reception.
	;***      457 :  * Arguments    : None
	;***      458 :  * Return Value : None
	;***      459 :  ***********************************************************************************************************************/
	;***      460 : static void r_uart3_callback_receiveend(void) {
	;***      461 : 	/* Start user code. Do not edit comment generated here */
	;***      462 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 462
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      463 : 	if (g_uart3_rx_data[0] == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 463
	mov a, !LOWW(_g_uart3_rx_data)
	cmp a, #0x01
	bnz $.BB@LABEL@21_7
.BB@LABEL@21_1:	; if_then_bb
	;***      464 : 		//Read timer setting
	;***      465 : 		if ((rs485_rx_p[0] == H_READ) && (rs485_rx_p[1] == READ_TIME)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 465
	cmp !LOWW(_g_uart3_rx_data+0x00001), #0x52
	bnz $.BB@LABEL@21_6
.BB@LABEL@21_2:	; bb
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x02
	bnz $.BB@LABEL@21_4
.BB@LABEL@21_3:	; if_then_bb25
	;***      466 : 			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 466
	oneb !LOWW(_g_commnunication_flag+0x0000A)
	ret
.BB@LABEL@21_4:	; bb32
	;***      467 : 		} else if ((rs485_rx_p[0] == 82) && (rs485_rx_p[1] == 24)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 467
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x18
	sknz
.BB@LABEL@21_5:	; if_then_bb47
	;***      468 : 			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 468
	oneb !LOWW(_g_commnunication_flag+0x0000B)
.BB@LABEL@21_6:	; if_else_bb.if_else_bb48_crit_edge.critedge
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 485
	ret
.BB@LABEL@21_7:	; if_else_bb97
	;***      469 : 		} else if ((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 70)) {
	;***      470 : 			//TODO: Start Water Softener
	;***      471 : 
	;***      472 : 		} else if ((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 80)) {
	;***      473 : 			//TODO: Stop Water Softener + Time of SNP ON (4 bytes)
	;***      474 : 		}
	;***      475 : 	} else if (g_uart3_rx_data[0] == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 475
	cmp a, #0x02
	bnz $.BB@LABEL@21_12
.BB@LABEL@21_8:	; if_then_bb103
	;***      476 : 		if ((rs485_rx_p[0] == 11)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 476
	mov a, !LOWW(_g_uart3_rx_data+0x00001)
	cmp a, #0x0B
	bnz $.BB@LABEL@21_10
.BB@LABEL@21_9:	; if_then_bb111
	;***      477 : 			g_commnunication_flag.rs485_send_to_valve_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 477
	oneb !LOWW(_g_commnunication_flag+0x0000C)
	ret
.BB@LABEL@21_10:	; if_else_bb112
	;***      478 : 		} else if ((rs485_rx_p[0] == 12)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 478
	cmp a, #0x0C
	bnz $.BB@LABEL@21_14
.BB@LABEL@21_11:	; if_then_bb120
	;***      479 : 			g_commnunication_flag.rs485_get_valve_gesture_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 479
	oneb !LOWW(_g_commnunication_flag+0x0000D)
	ret
.BB@LABEL@21_12:	; if_else_bb123
	;***      480 : 		}
	;***      481 : 	} else if (g_uart3_rx_data[0] != 0xff) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 481
	inc a
	skz
.BB@LABEL@21_13:	; if_then_bb129
	;***      482 : 		g_commnunication_flag.rs485_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 482
	oneb !LOWW(_g_commnunication_flag+0x0000E)
.BB@LABEL@21_14:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 485
	ret
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      483 : 	}
	;***      484 : 	/* End user code. Do not edit comment generated here */
	;***      485 : }
	;***      486 : 
	;***      487 : /***********************************************************************************************************************
	;***      488 :  * Function Name: r_uart3_callback_softwareoverrun
	;***      489 :  * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      490 :  * Arguments    : rx_data -
	;***      491 :  *                    receive data
	;***      492 :  * Return Value : None
	;***      493 :  ***********************************************************************************************************************/
	;***      494 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 494
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      495 : 	/* Start user code. Do not edit comment generated here */
	;***      496 : 	/* End user code. Do not edit comment generated here */
	;***      497 : }
	;***      498 : 
	;***      499 : /***********************************************************************************************************************
	;***      500 :  * Function Name: r_uart3_callback_sendend
	;***      501 :  * Description  : This function is a callback function when UART3 finishes transmission.
	;***      502 :  * Arguments    : None
	;***      503 :  * Return Value : None
	;***      504 :  ***********************************************************************************************************************/
	;***      505 : static void r_uart3_callback_sendend(void) {
	;***      506 : 	/* Start user code. Do not edit comment generated here */
	;***      507 : 	g_uart3_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 507
	inc !LOWW(_g_uart3_sendend)
	;***      508 : 	O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 508
	clr1 0xFFF00.0
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      509 : 	/* End user code. Do not edit comment generated here */
	;***      510 : }
	;***      511 : 
	;***      512 : /***********************************************************************************************************************
	;***      513 :  * Function Name: r_uart3_callback_error
	;***      514 :  * Description  : This function is a callback function when UART3 reception error occurs.
	;***      515 :  * Arguments    : err_type -
	;***      516 :  *                    error type value
	;***      517 :  * Return Value : None
	;***      518 :  ***********************************************************************************************************************/
	;***      519 : static void r_uart3_callback_error(uint8_t err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 519
	ret
	;***      520 : 	/* Start user code. Do not edit comment generated here */
	;***      521 : 	/* End user code. Do not edit comment generated here */
	;***      522 : }
	;***      523 : 
	;***      524 : /* Start user code for adding. Do not edit comment generated here */
	;***      525 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
_g_uart3_rx_data:
	.DS (8)
_send_response_flag:
	.DS (1)
_send_response_time_flag:
	.DS (1)
_send_response_number_flag:
	.DS (1)
_recived_time_setting_flag:
	.DS (1)
_send_respone_status_flag:
	.DS (1)
_recived_number_setting_flag:
	.DS (1)
_g_commnunication_flag:
	.DS (17)
_g_csi_count:
	.DS (1)
_g_csi_err:
	.DS (1)
_g_csi_send_end:
	.DS (1)
_g_csi_rev_end:
	.DS (1)
_g_uart1_send:
	.DS (1)
_g_uart2_sendend:
	.DS (1)
_g_uart2_receive:
	.DS (1)
_g_rx_data:
	.DS (160)
_g_uart2_fault:
	.DS (1)
_g_uart3_sendend:
	.DS (1)
