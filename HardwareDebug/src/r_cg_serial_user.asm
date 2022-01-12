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
#@  compiled at Wed Jan 12 13:55:52 2022

	.EXTERN _g_machine_state
	.EXTERN _g_machine_mode
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
	.PUBLIC _isCommandNeedResponse
	.EXTERN _R_CSI01_Stop
	.EXTERN _R_UART2_Receive
	.EXTERN _isThisCommand
	.EXTERN _R_UART3_Receive

	.SECTION .textf,TEXTF
_isCommandNeedResponse:
	.STACK _isCommandNeedResponse = 4
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
	;***       94 : uint8_t isCommandNeedResponse(uint8_t *data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 94
	movw de, ax
	;***       95 : 	if ((data[0] == H_SET) && (data[1] == NEXT_ANIMATION)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 95
	mov a, [de]
	mov x, a
	cmp a, #0x53
	bnz $.BB@LABEL@1_2
.BB@LABEL@1_1:	; bb
	mov a, [de+0x01]
	cmp a, #0x13
	bz $.BB@LABEL@1_7
.BB@LABEL@1_2:	; if_break_bb
	mov a, x
	;***       96 : 		return 0;
	;***       97 : 	}
	;***       98 : 	switch ((enum UART_header_e) *data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 98
	add a, #0xBD
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_break_bb
	add a, #0xFE
	bz $.BB@LABEL@1_6
.BB@LABEL@1_4:	; if_break_bb
	add a, #0xF3
	bz $.BB@LABEL@1_6
.BB@LABEL@1_5:	; if_break_bb
	dec a
	bnz $.BB@LABEL@1_7
.BB@LABEL@1_6:	; switch_clause_bb26
	oneb !LOWW(_g_commnunication_flag)
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 118
	ret
.BB@LABEL@1_7:	; bb30
	;***       99 : //		case H_ALARM:
	;***      100 : //			commnunication_flag.send_response_flag = 1;
	;***      101 : //			break;
	;***      102 : 	case H_CLEAR:
	;***      103 : 		g_commnunication_flag.send_response_flag = 1;
	;***      104 : 		break;
	;***      105 : 	case H_ERROR:
	;***      106 : 		g_commnunication_flag.send_response_flag = 1;
	;***      107 : 		break;
	;***      108 : 	case H_READ:
	;***      109 : 		g_commnunication_flag.send_response_flag = 1;
	;***      110 : 		break;
	;***      111 : 	case H_SET:
	;***      112 : 		g_commnunication_flag.send_response_flag = 1;
	;***      113 : 		break;
	;***      114 : 	default:
	;***      115 : 		return 0;
	;***      116 : 	}
	;***      117 : 	return 1;
	;***      118 : }
	clrb a
	ret
	.SECTION .text,TEXT
_r_uart1_interrupt_receive@1	.vector 0x0026
_r_uart1_interrupt_receive@1:
	.STACK _r_uart1_interrupt_receive@1 = 16
	;***      119 : /* End user code. Do not edit comment generated here */
	;***      120 : 
	;***      121 : /***********************************************************************************************************************
	;***      122 :  * Function Name: r_uart1_interrupt_receive
	;***      123 :  * Description  : This function is INTSR1 interrupt service routine.
	;***      124 :  * Arguments    : None
	;***      125 :  * Return Value : None
	;***      126 :  ***********************************************************************************************************************/
	;***      127 : static void __near r_uart1_interrupt_receive(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 127
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      128 : 	volatile uint8_t rx_data;
	;***      129 : 	volatile uint8_t err_type;
	;***      130 : 
	;***      131 : 	err_type = (uint8_t) (SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 131
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      132 : 	SIR03 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 132
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      133 : 
	;***      134 : 	if (err_type != 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 134
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; if_then_bb
	;***      135 : 		r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 135
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@2_2:	; if_break_bb
	;***      136 : 	}
	;***      137 : 
	;***      138 : 	rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 138
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      139 : 
	;***      140 : 	if (g_uart1_rx_length > g_uart1_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 140
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@2_6
.BB@LABEL@2_3:	; if_then_bb18
	;***      141 : 		*gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 141
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      142 : 		gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 142
	incw !LOWW(_gp_uart1_rx_address)
	;***      143 : 		g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 143
	incw !LOWW(_g_uart1_rx_count)
	;***      144 : 
	;***      145 : 		if (g_uart1_rx_length == g_uart1_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 145
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@2_4:	; if_then_bb30
	;***      146 : 			r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 146
	call !!_r_uart1_callback_receiveend@1
.BB@LABEL@2_5:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 151
	reti
.BB@LABEL@2_6:	; if_else_bb
	;***      147 : 		}
	;***      148 : 	} else {
	;***      149 : 		r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 149
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@2_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      150 : 	}
	;***      151 : }
	;***      152 : 
	;***      153 : /***********************************************************************************************************************
	;***      154 :  * Function Name: r_uart1_interrupt_send
	;***      155 :  * Description  : This function is INTST1 interrupt service routine.
	;***      156 :  * Arguments    : None
	;***      157 :  * Return Value : None
	;***      158 :  ***********************************************************************************************************************/
	;***      159 : static void __near r_uart1_interrupt_send(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 159
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      160 : 	if (g_uart1_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 160
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@3_3
.BB@LABEL@3_1:	; if_else_bb
	;***      161 : 		TXD1 = *gp_uart1_tx_address;
	;***      162 : 		gp_uart1_tx_address++;
	;***      163 : 		g_uart1_tx_count--;
	;***      164 : 	} else {
	;***      165 : 		r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 165
	call !!_r_uart1_callback_sendend@1
.BB@LABEL@3_2:	; if_else_bb
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 167
	reti
.BB@LABEL@3_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 161
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 162
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 163
	decw !LOWW(_g_uart1_tx_count)
	br $.BB@LABEL@3_2
	.SECTION .textf,TEXTF
_r_uart1_callback_receiveend@1:
	.STACK _r_uart1_callback_receiveend@1 = 4
	;***      166 : 	}
	;***      167 : }
	;***      168 : 
	;***      169 : /***********************************************************************************************************************
	;***      170 :  * Function Name: r_uart1_callback_receiveend
	;***      171 :  * Description  : This function is a callback function when UART1 finishes reception.
	;***      172 :  * Arguments    : None
	;***      173 :  * Return Value : None
	;***      174 :  ***********************************************************************************************************************/
	;***      175 : static void r_uart1_callback_receiveend(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 175
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      176 : 	/* Start user code. Do not edit comment generated here */
	;***      177 : 	/* End user code. Do not edit comment generated here */
	;***      178 : }
	;***      179 : 
	;***      180 : /***********************************************************************************************************************
	;***      181 :  * Function Name: r_uart1_callback_softwareoverrun
	;***      182 :  * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      183 :  * Arguments    : rx_data -
	;***      184 :  *                    receive data
	;***      185 :  * Return Value : None
	;***      186 :  ***********************************************************************************************************************/
	;***      187 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 187
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      188 : 	/* Start user code. Do not edit comment generated here */
	;***      189 : 	/* End user code. Do not edit comment generated here */
	;***      190 : }
	;***      191 : 
	;***      192 : /***********************************************************************************************************************
	;***      193 :  * Function Name: r_uart1_callback_sendend
	;***      194 :  * Description  : This function is a callback function when UART1 finishes transmission.
	;***      195 :  * Arguments    : None
	;***      196 :  * Return Value : None
	;***      197 :  ***********************************************************************************************************************/
	;***      198 : static void r_uart1_callback_sendend(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 198
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      199 : 	/* Start user code. Do not edit comment generated here */
	;***      200 : 	/* End user code. Do not edit comment generated here */
	;***      201 : }
	;***      202 : 
	;***      203 : /***********************************************************************************************************************
	;***      204 :  * Function Name: r_uart1_callback_error
	;***      205 :  * Description  : This function is a callback function when UART1 reception error occurs.
	;***      206 :  * Arguments    : err_type -
	;***      207 :  *                    error type value
	;***      208 :  * Return Value : None
	;***      209 :  ***********************************************************************************************************************/
	;***      210 : static void r_uart1_callback_error(uint8_t err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 210
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      211 : 	/* Start user code. Do not edit comment generated here */
	;***      212 : 	/* End user code. Do not edit comment generated here */
	;***      213 : }
	;***      214 : 
	;***      215 : /***********************************************************************************************************************
	;***      216 :  * Function Name: r_csi00_interrupt
	;***      217 :  * Description  : This function is INTCSI00 interrupt service routine.
	;***      218 :  * Arguments    : None
	;***      219 :  * Return Value : None
	;***      220 :  ***********************************************************************************************************************/
	;***      221 : static void __near r_csi00_interrupt(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 221
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      222 : 	volatile uint8_t err_type;
	;***      223 : 
	;***      224 : 	err_type = (uint8_t) (SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 224
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      225 : 	SIR00 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 225
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      226 : 
	;***      227 : 	if (err_type != 1U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 227
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@8_2
.BB@LABEL@8_1:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 236
	reti
.BB@LABEL@8_2:	; if_then_bb
	;***      228 : 		if (g_csi00_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 228
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_3:	; if_else_bb
	;***      229 : 			SIO00 = *gp_csi00_tx_address;
	;***      230 : 			gp_csi00_tx_address++;
	;***      231 : 			g_csi00_tx_count--;
	;***      232 : 		} else {
	;***      233 : 			r_csi00_callback_sendend(); /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 233
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@8_1
.BB@LABEL@8_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 229
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 230
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 231
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@8_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      234 : 		}
	;***      235 : 	}
	;***      236 : }
	;***      237 : 
	;***      238 : /***********************************************************************************************************************
	;***      239 :  * Function Name: r_csi00_callback_sendend
	;***      240 :  * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      241 :  * Arguments    : None
	;***      242 :  * Return Value : None
	;***      243 :  ***********************************************************************************************************************/
	;***      244 : static void r_csi00_callback_sendend(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 244
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      245 : 	/* Start user code. Do not edit comment generated here */
	;***      246 : 	/* End user code. Do not edit comment generated here */
	;***      247 : }
	;***      248 : 
	;***      249 : /***********************************************************************************************************************
	;***      250 :  * Function Name: r_csi01_interrupt
	;***      251 :  * Description  : This function is INTCSI01 interrupt service routine.
	;***      252 :  * Arguments    : None
	;***      253 :  * Return Value : None
	;***      254 :  ***********************************************************************************************************************/
	;***      255 : static void __near r_csi01_interrupt(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 255
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      256 : 	volatile uint8_t err_type;
	;***      257 : 	volatile uint8_t sio_dummy;
	;***      258 : 
	;***      259 : 	err_type = (uint8_t) (SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 259
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      260 : 	SIR01 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 260
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      261 : 
	;***      262 : 	if (1U == err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 262
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@10_2
.BB@LABEL@10_1:	; if_then_bb
	;***      263 : 		r_csi01_callback_error(err_type); /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 263
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_2:	; if_else_bb
	;***      264 : 	} else {
	;***      265 : 		if (g_csi01_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 265
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@10_8
.BB@LABEL@10_3:	; if_else_bb42
	;***      266 : 			if (0U != gp_csi01_rx_address) {
	;***      267 : 				*gp_csi01_rx_address = SIO01;
	;***      268 : 				gp_csi01_rx_address++;
	;***      269 : 			} else {
	;***      270 : 				sio_dummy = SIO01;
	;***      271 : 			}
	;***      272 : 
	;***      273 : 			if (0U != gp_csi01_tx_address) {
	;***      274 : 				SIO01 = *gp_csi01_tx_address;
	;***      275 : 				gp_csi01_tx_address++;
	;***      276 : 			} else {
	;***      277 : 				SIO01 = 0xFFU;
	;***      278 : 			}
	;***      279 : 
	;***      280 : 			g_csi01_tx_count--;
	;***      281 : 		} else {
	;***      282 : 			if (0U == g_csi01_tx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 282
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@10_7
.BB@LABEL@10_4:	; if_then_bb47
	;***      283 : 				if (0U != gp_csi01_rx_address) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 283
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_6
.BB@LABEL@10_5:	; if_else_bb55
	;***      284 : 					*gp_csi01_rx_address = SIO01;
	;***      285 : 				} else {
	;***      286 : 					sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 286
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_7
.BB@LABEL@10_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 284
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@10_7:	; if_break_bb59
	;***      287 : 				}
	;***      288 : 			}
	;***      289 : 
	;***      290 : 			r_csi01_callback_sendend(); /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 290
	call !!_r_csi01_callback_sendend@1
	;***      291 : 			r_csi01_callback_receiveend(); /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 291
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 266
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_10
.BB@LABEL@10_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 270
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_11
.BB@LABEL@10_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 267
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 268
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@10_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 273
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_13
.BB@LABEL@10_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 277
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@10_14
.BB@LABEL@10_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 274
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 275
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@10_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 280
	decw !LOWW(_g_csi01_tx_count)
.BB@LABEL@10_15:	; if_break_bb39
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 294
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      292 : 		}
	;***      293 : 	}
	;***      294 : }
	;***      295 : 
	;***      296 : /***********************************************************************************************************************
	;***      297 :  * Function Name: r_csi01_callback_receiveend
	;***      298 :  * Description  : This function is a callback function when CSI01 finishes reception.
	;***      299 :  * Arguments    : None
	;***      300 :  * Return Value : None
	;***      301 :  ***********************************************************************************************************************/
	;***      302 : static void r_csi01_callback_receiveend(void) {
	;***      303 : 	/* Start user code. Do not edit comment generated here */
	;***      304 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 304
	inc !LOWW(_g_csi_rev_end)
	;***      305 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 305
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      306 : 	/* End user code. Do not edit comment generated here */
	;***      307 : }
	;***      308 : 
	;***      309 : /***********************************************************************************************************************
	;***      310 :  * Function Name: r_csi01_callback_error
	;***      311 :  * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      312 :  * Arguments    : err_type -
	;***      313 :  *                    error type value
	;***      314 :  * Return Value : None
	;***      315 :  ***********************************************************************************************************************/
	;***      316 : static void r_csi01_callback_error(uint8_t err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 316
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      317 : 	/* Start user code. Do not edit comment generated here */
	;***      318 : 
	;***      319 : 	/* End user code. Do not edit comment generated here */
	;***      320 : }
	;***      321 : 
	;***      322 : /***********************************************************************************************************************
	;***      323 :  * Function Name: r_csi01_callback_sendend
	;***      324 :  * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      325 :  * Arguments    : None
	;***      326 :  * Return Value : None
	;***      327 :  ***********************************************************************************************************************/
	;***      328 : static void r_csi01_callback_sendend(void) {
	;***      329 : 	/* Start user code. Do not edit comment generated here */
	;***      330 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 330
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      331 : 	/* End user code. Do not edit comment generated here */
	;***      332 : }
	;***      333 : 
	;***      334 : /***********************************************************************************************************************
	;***      335 :  * Function Name: r_uart2_interrupt_receive
	;***      336 :  * Description  : This function is INTSR2 interrupt service routine.
	;***      337 :  * Arguments    : None
	;***      338 :  * Return Value : None
	;***      339 :  ***********************************************************************************************************************/
	;***      340 : static void __near r_uart2_interrupt_receive(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 340
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      341 : 	volatile uint8_t rx_data;
	;***      342 : 	volatile uint8_t err_type;
	;***      343 : 
	;***      344 : 	err_type = (uint8_t) (SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 344
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      345 : 	SIR11 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 345
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      346 : 
	;***      347 : 	if (err_type != 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 347
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@14_2
.BB@LABEL@14_1:	; if_then_bb
	;***      348 : 		r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 348
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@14_2:	; if_break_bb
	;***      349 : 	}
	;***      350 : 
	;***      351 : 	rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 351
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      352 : 
	;***      353 : 	if (g_uart2_rx_length > g_uart2_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 353
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@14_6
.BB@LABEL@14_3:	; if_then_bb18
	;***      354 : 		*gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 354
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      355 : 		gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 355
	incw !LOWW(_gp_uart2_rx_address)
	;***      356 : 		g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 356
	incw !LOWW(_g_uart2_rx_count)
	;***      357 : 
	;***      358 : 		if (g_uart2_rx_length == g_uart2_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 358
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@14_4:	; if_then_bb30
	;***      359 : 			r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 359
	call !!_r_uart2_callback_receiveend@1
.BB@LABEL@14_5:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 364
	reti
.BB@LABEL@14_6:	; if_else_bb
	;***      360 : 		}
	;***      361 : 	} else {
	;***      362 : 		r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 362
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@14_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      363 : 	}
	;***      364 : }
	;***      365 : 
	;***      366 : /***********************************************************************************************************************
	;***      367 :  * Function Name: r_uart2_interrupt_send
	;***      368 :  * Description  : This function is INTST2 interrupt service routine.
	;***      369 :  * Arguments    : None
	;***      370 :  * Return Value : None
	;***      371 :  ***********************************************************************************************************************/
	;***      372 : static void __near r_uart2_interrupt_send(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 372
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      373 : 	if (g_uart2_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 373
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@15_3
.BB@LABEL@15_1:	; if_else_bb
	;***      374 : 		TXD2 = *gp_uart2_tx_address;
	;***      375 : 		gp_uart2_tx_address++;
	;***      376 : 		g_uart2_tx_count--;
	;***      377 : 	} else {
	;***      378 : 		r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 378
	call !!_r_uart2_callback_sendend@1
.BB@LABEL@15_2:	; if_else_bb
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 380
	reti
.BB@LABEL@15_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 374
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 375
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 376
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@15_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 8
	;***      379 : 	}
	;***      380 : }
	;***      381 : 
	;***      382 : /***********************************************************************************************************************
	;***      383 :  * Function Name: r_uart2_callback_receiveend
	;***      384 :  * Description  : This function is a callback function when UART2 finishes reception.
	;***      385 :  * Arguments    : None
	;***      386 :  * Return Value : None
	;***      387 :  ***********************************************************************************************************************/
	;***      388 : static void r_uart2_callback_receiveend(void) {
	;***      389 : 	/* Start user code. Do not edit comment generated here */
	;***      390 : 
	;***      391 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 391
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      392 : 	g_commnunication_flag.recived_time_setting_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 392
	cmp !LOWW(_g_commnunication_flag+0x00004), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_1:	; bb5
	mov a, !LOWW(_g_commnunication_flag+0x00004)
.BB@LABEL@16_2:	; bb8
	mov !LOWW(_g_commnunication_flag+0x00004), a
	;***      393 : 			g_commnunication_flag.recived_time_setting_flag == 1 ?
	;***      394 : 					2 : g_commnunication_flag.recived_time_setting_flag;
	;***      395 : 	g_commnunication_flag.recived_number_setting_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 395
	cmp !LOWW(_g_commnunication_flag+0x00003), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_3:	; bb16
	mov a, !LOWW(_g_commnunication_flag+0x00003)
.BB@LABEL@16_4:	; bb20
	mov !LOWW(_g_commnunication_flag+0x00003), a
	;***      396 : 			g_commnunication_flag.recived_number_setting_flag == 1 ?
	;***      397 : 					2 : g_commnunication_flag.recived_number_setting_flag;
	;***      398 : 	g_commnunication_flag.recieve_status_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 398
	cmp !LOWW(_g_commnunication_flag+0x00008), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_5:	; bb29
	mov a, !LOWW(_g_commnunication_flag+0x00008)
.BB@LABEL@16_6:	; bb33
	mov !LOWW(_g_commnunication_flag+0x00008), a
	;***      399 : 			g_commnunication_flag.recieve_status_flag == 1 ?
	;***      400 : 					2 : g_commnunication_flag.recieve_status_flag;
	;***      401 : 	if (isCommandNeedResponse(g_rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 401
	movw ax, #LOWW(_g_rx_data)
	call $!_isCommandNeedResponse
	cmp0 a
	.bz $!.BB@LABEL@16_59
.BB@LABEL@16_7:	; bb41
	cmp0 !LOWW(_g_commnunication_flag+0x00004)
	bnz $.BB@LABEL@16_10
.BB@LABEL@16_8:	; bb53
	cmp0 !LOWW(_g_commnunication_flag+0x00003)
	sknz
.BB@LABEL@16_9:	; bb65
	cmp0 !LOWW(_g_commnunication_flag+0x00008)
.BB@LABEL@16_10:	; bb65
	.bnz $!.BB@LABEL@16_59
.BB@LABEL@16_11:	; if_then_bb
	;***      402 : 			&& g_commnunication_flag.recived_time_setting_flag == 0
	;***      403 : 			&& g_commnunication_flag.recived_number_setting_flag == 0
	;***      404 : 			&& g_commnunication_flag.recieve_status_flag == 0) {
	;***      405 : 		if ((g_rx_data[0] == H_READ) && (g_rx_data[1] == READ_TIME)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 405
	mov a, !LOWW(_g_rx_data)
	cmp a, #0x52
	bnz $.BB@LABEL@16_14
.BB@LABEL@16_12:	; bb82
	cmp !LOWW(_g_rx_data+0x00001), #0x02
	bnz $.BB@LABEL@16_14
.BB@LABEL@16_13:	; if_then_bb95
	;***      406 : 			g_commnunication_flag.send_response_time_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 406
	oneb !LOWW(_g_commnunication_flag+0x00001)
	br $.BB@LABEL@16_28
.BB@LABEL@16_14:	; if_else_bb
	;***      407 : 		} else if ((g_rx_data[0] == H_SET) && (g_rx_data[1] == SAVE_TIME)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 407
	cmp a, #0x53
	bnz $.BB@LABEL@16_17
.BB@LABEL@16_15:	; bb100
	cmp !LOWW(_g_rx_data+0x00001), #0x14
	bnz $.BB@LABEL@16_17
.BB@LABEL@16_16:	; if_then_bb113
	;***      408 : 			R_UART2_Receive(g_rx_data, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 408
	movw bc, #0x0095
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      409 : 			g_commnunication_flag.recived_time_setting_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 409
	oneb !LOWW(_g_commnunication_flag+0x00004)
	br $.BB@LABEL@16_31
.BB@LABEL@16_17:	; if_else_bb117
	;***      410 : 		} else if ((g_rx_data[0] == H_READ)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 410
	cmp a, #0x52
	bnz $.BB@LABEL@16_22
.BB@LABEL@16_18:	; bb122
	cmp !LOWW(_g_rx_data+0x00001), #0x17
	bnz $.BB@LABEL@16_20
.BB@LABEL@16_19:	; if_then_bb135
	;***      411 : 				&& (g_rx_data[1] == MACHINE_IO_DATA)) {
	;***      412 : 			g_commnunication_flag.send_response_status_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 412
	oneb !LOWW(_g_commnunication_flag+0x00005)
	br $.BB@LABEL@16_37
.BB@LABEL@16_20:	; bb141
	;***      413 : 		} else if ((g_rx_data[0] == H_READ) && (g_rx_data[1] == READ_NUMBER)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 413
	cmp !LOWW(_g_rx_data+0x00001), #0x03
	bnz $.BB@LABEL@16_22
.BB@LABEL@16_21:	; if_then_bb154
	;***      414 : 			g_commnunication_flag.send_response_number_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 414
	oneb !LOWW(_g_commnunication_flag+0x00002)
	br $.BB@LABEL@16_37
.BB@LABEL@16_22:	; if_else_bb155
	;***      415 : 		} else if ((g_rx_data[0] == H_SET) && (g_rx_data[1] == SAVE_NUMBER)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 415
	cmp a, #0x53
	bnz $.BB@LABEL@16_25
.BB@LABEL@16_23:	; bb160
	cmp !LOWW(_g_rx_data+0x00001), #0x15
	bnz $.BB@LABEL@16_25
.BB@LABEL@16_24:	; if_then_bb173
	;***      416 : 			R_UART2_Receive(g_rx_data, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 416
	movw bc, #0x0025
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      417 : 			g_commnunication_flag.recived_number_setting_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 417
	oneb !LOWW(_g_commnunication_flag+0x00003)
	br $.BB@LABEL@16_43
.BB@LABEL@16_25:	; if_else_bb177
	;***      418 : 		} else if ((g_rx_data[0] == H_READ) && (g_rx_data[1] == WASHING_MODE)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 418
	cmp a, #0x52
	bnz $.BB@LABEL@16_29
.BB@LABEL@16_26:	; bb182
	cmp !LOWW(_g_rx_data+0x00001), #0x18
	bnz $.BB@LABEL@16_29
.BB@LABEL@16_27:	; if_then_bb195
	;***      419 : 			g_commnunication_flag.send_response_mode_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 419
	oneb !LOWW(_g_commnunication_flag+0x00006)
.BB@LABEL@16_28:	; if_then_bb195
	br $.BB@LABEL@16_46
.BB@LABEL@16_29:	; if_else_bb196
	;***      420 : //			commnunication_flag.send_response_flag = 0;
	;***      421 : 		} else if ((g_rx_data[0] == H_CLEAR)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 421
	cmp a, #0x43
	bnz $.BB@LABEL@16_32
.BB@LABEL@16_30:	; if_then_bb202
	;***      422 : 			g_commnunication_flag.alarm_clear_flag = g_rx_data[1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 422
	mov a, !LOWW(_g_rx_data+0x00001)
	mov !LOWW(_g_commnunication_flag+0x00007), a
.BB@LABEL@16_31:	; if_then_bb202
	br $.BB@LABEL@16_49
.BB@LABEL@16_32:	; if_else_bb204
	;***      423 : 		} else if ((g_rx_data[0] == H_SET)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 423
	cmp a, #0x53
	bnz $.BB@LABEL@16_34
.BB@LABEL@16_33:	; bb209
	cmp !LOWW(_g_rx_data+0x00001), #0x13
	bz $.BB@LABEL@16_52
.BB@LABEL@16_34:	; if_else_bb223
	;***      424 : 				&& (g_rx_data[1] == NEXT_ANIMATION)) {
	;***      425 : //			g_machine_state.waitAnimationRes = 0;
	;***      426 : 		} else if ((g_rx_data[0] == H_READ) && (g_rx_data[1] == MID_NIGHT)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 426
	cmp a, #0x52
	bnz $.BB@LABEL@16_38
.BB@LABEL@16_35:	; bb228
	cmp !LOWW(_g_rx_data+0x00001), #0x1D
	bnz $.BB@LABEL@16_38
.BB@LABEL@16_36:	; if_then_bb241
	;***      427 : 			g_commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 427
	clrb !LOWW(_g_commnunication_flag)
	;***      428 : 			g_machine_state.isMidNight = g_rx_data[5];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 428
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_state+0x0000A), a
.BB@LABEL@16_37:	; if_then_bb241
	br $.BB@LABEL@16_55
.BB@LABEL@16_38:	; if_else_bb243
	;***      429 : 		} else if ((g_rx_data[0] == H_SET)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 429
	cmp a, #0x53
	bnz $.BB@LABEL@16_55
.BB@LABEL@16_39:	; bb248
	cmp !LOWW(_g_rx_data+0x00001), #0x1A
	bnz $.BB@LABEL@16_41
.BB@LABEL@16_40:	; if_then_bb261
	;***      430 : 				&& (g_rx_data[1] == TESTING_MODE_START)) {
	;***      431 : 			g_commnunication_flag.test_flag = TESTING_MODE_START;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 431
	mov !LOWW(_g_commnunication_flag+0x00009), #0x1A
	br $.BB@LABEL@16_55
.BB@LABEL@16_41:	; bb267
	;***      432 : 		} else if ((g_rx_data[0] == H_SET) && (g_rx_data[1] == TEST_POWER_ON)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 432
	cmp !LOWW(_g_rx_data+0x00001), #0x1E
	bnz $.BB@LABEL@16_44
.BB@LABEL@16_42:	; if_then_bb280
	;***      433 : 			g_commnunication_flag.test_flag = TEST_POWER_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 433
	mov !LOWW(_g_commnunication_flag+0x00009), #0x1E
.BB@LABEL@16_43:	; if_then_bb280
	br $.BB@LABEL@16_55
.BB@LABEL@16_44:	; bb286
	;***      434 : 		} else if ((g_rx_data[0] == H_SET)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 434
	cmp !LOWW(_g_rx_data+0x00001), #0x1F
	bnz $.BB@LABEL@16_47
.BB@LABEL@16_45:	; if_then_bb299
	;***      435 : 				&& (g_rx_data[1] == TEST_FLOW_RATE)) {
	;***      436 : 			g_commnunication_flag.test_flag = TEST_FLOW_RATE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 436
	mov !LOWW(_g_commnunication_flag+0x00009), #0x1F
.BB@LABEL@16_46:	; if_then_bb299
	br $.BB@LABEL@16_55
.BB@LABEL@16_47:	; bb305
	;***      437 : 		} else if ((g_rx_data[0] == H_SET) && (g_rx_data[1] == TEST_CURRENT)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 437
	cmp !LOWW(_g_rx_data+0x00001), #0x20
	bnz $.BB@LABEL@16_50
.BB@LABEL@16_48:	; if_then_bb318
	;***      438 : 			g_commnunication_flag.test_flag = TEST_CURRENT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 438
	mov !LOWW(_g_commnunication_flag+0x00009), #0x20
.BB@LABEL@16_49:	; if_then_bb318
	br $.BB@LABEL@16_55
.BB@LABEL@16_50:	; bb324
	;***      439 : 		} else if ((g_rx_data[0] == H_SET)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 439
	cmp !LOWW(_g_rx_data+0x00001), #0x21
	bnz $.BB@LABEL@16_53
.BB@LABEL@16_51:	; if_then_bb337
	;***      440 : 				&& (g_rx_data[1] == TEST_INDIVIDUAL)) {
	;***      441 : 			g_commnunication_flag.test_flag = TEST_INDIVIDUAL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 441
	mov !LOWW(_g_commnunication_flag+0x00009), #0x21
	;***      442 : 			g_commnunication_flag.recieve_status_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 442
	oneb !LOWW(_g_commnunication_flag+0x00008)
	;***      443 : 			R_UART2_Receive(g_rx_data, 5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 443
	movw bc, #0x0005
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
.BB@LABEL@16_52:	; if_then_bb337
	br $.BB@LABEL@16_55
.BB@LABEL@16_53:	; bb344
	;***      444 : 		} else if ((g_rx_data[0] == H_SET)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 444
	cmp !LOWW(_g_rx_data+0x00001), #0x22
	sknz
.BB@LABEL@16_54:	; if_then_bb357
	;***      445 : 				&& (g_rx_data[1] == TEST_ELECTROLYTIC)) {
	;***      446 : 			g_commnunication_flag.test_flag = TEST_ELECTROLYTIC;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 446
	mov !LOWW(_g_commnunication_flag+0x00009), #0x22
.BB@LABEL@16_55:	; if_break_bb371
	clrw ax
	;***      447 : 		}
	;***      448 : 		if (isThisCommand(g_rx_data, H_SET, WASHING_MODE, 0xff) != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 448
	push ax
	mov x, #0xFF
	push ax
	movw bc, #0x1853
	movw ax, #LOWW(_g_rx_data)
	call !!_isThisCommand
	addw sp, #0x04
	cmp0 a
	bz $.BB@LABEL@16_57
.BB@LABEL@16_56:	; if_then_bb377
	;***      449 : 			g_machine_mode = g_rx_data[5];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 449
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_mode), a
.BB@LABEL@16_57:	; if_break_bb379
	clrw ax
	;***      450 : 		}
	;***      451 : 		if (isThisCommand(g_rx_data, H_SET, OK_USER, 0xff) != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 451
	push ax
	mov x, #0xFF
	push ax
	movw bc, #0x0153
	movw ax, #LOWW(_g_rx_data)
	call !!_isThisCommand
	addw sp, #0x04
	cmp0 a
	bz $.BB@LABEL@16_63
.BB@LABEL@16_58:	; if_then_bb385
	;***      452 : 			g_machine_state.user = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 452
	mov !LOWW(_g_machine_state+0x0000D), #0x02
	br $.BB@LABEL@16_63
.BB@LABEL@16_59:	; if_else_bb387
	;***      453 : 		}
	;***      454 : 
	;***      455 : 	} else if (g_commnunication_flag.recived_time_setting_flag != 0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 455
	cmp0 !LOWW(_g_commnunication_flag+0x00004)
	bnz $.BB@LABEL@16_62
.BB@LABEL@16_60:	; bb392
	cmp0 !LOWW(_g_commnunication_flag+0x00003)
	bnz $.BB@LABEL@16_62
.BB@LABEL@16_61:	; if_else_bb407
	;***      456 : 			|| g_commnunication_flag.recived_number_setting_flag != 0) {
	;***      457 : 		R_UART2_Receive(g_rx_data, 6);
	;***      458 : 	} else {
	;***      459 : 		g_uart2_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 459
	oneb !LOWW(_g_uart2_fault)
	br $.BB@LABEL@16_63
.BB@LABEL@16_62:	; if_then_bb405
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 457
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
.BB@LABEL@16_63:	; if_break_bb409
	;***      460 : 	}
	;***      461 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 461
	inc !LOWW(_g_uart2_receive)
	ret
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      462 : 
	;***      463 : 	/* End user code. Do not edit comment generated here */
	;***      464 : }
	;***      465 : 
	;***      466 : /***********************************************************************************************************************
	;***      467 :  * Function Name: r_uart2_callback_softwareoverrun
	;***      468 :  * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      469 :  * Arguments    : rx_data -
	;***      470 :  *                    receive data
	;***      471 :  * Return Value : None
	;***      472 :  ***********************************************************************************************************************/
	;***      473 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 473
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      474 : 	/* Start user code. Do not edit comment generated here */
	;***      475 : 	/* End user code. Do not edit comment generated here */
	;***      476 : }
	;***      477 : 
	;***      478 : /***********************************************************************************************************************
	;***      479 :  * Function Name: r_uart2_callback_sendend
	;***      480 :  * Description  : This function is a callback function when UART2 finishes transmission.
	;***      481 :  * Arguments    : None
	;***      482 :  * Return Value : None
	;***      483 :  ***********************************************************************************************************************/
	;***      484 : static void r_uart2_callback_sendend(void) {
	;***      485 : 	/* Start user code. Do not edit comment generated here */
	;***      486 : 	g_uart2_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 486
	inc !LOWW(_g_uart2_sendend)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      487 : 	/* End user code. Do not edit comment generated here */
	;***      488 : }
	;***      489 : 
	;***      490 : /***********************************************************************************************************************
	;***      491 :  * Function Name: r_uart2_callback_error
	;***      492 :  * Description  : This function is a callback function when UART2 reception error occurs.
	;***      493 :  * Arguments    : err_type -
	;***      494 :  *                    error type value
	;***      495 :  * Return Value : None
	;***      496 :  ***********************************************************************************************************************/
	;***      497 : static void r_uart2_callback_error(uint8_t err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 497
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      498 : 	/* Start user code. Do not edit comment generated here */
	;***      499 : 	/* End user code. Do not edit comment generated here */
	;***      500 : }
	;***      501 : 
	;***      502 : /***********************************************************************************************************************
	;***      503 :  * Function Name: r_uart3_interrupt_receive
	;***      504 :  * Description  : This function is INTSR3 interrupt service routine.
	;***      505 :  * Arguments    : None
	;***      506 :  * Return Value : None
	;***      507 :  ***********************************************************************************************************************/
	;***      508 : static void __near r_uart3_interrupt_receive(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 508
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      509 : 	volatile uint8_t rx_data;
	;***      510 : 	volatile uint8_t err_type;
	;***      511 : 
	;***      512 : 	err_type = (uint8_t) (SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 512
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      513 : 	SIR13 = (uint16_t) err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 513
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      514 : 
	;***      515 : 	if (err_type != 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 515
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@20_2
.BB@LABEL@20_1:	; if_then_bb
	;***      516 : 		r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 516
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@20_2:	; if_break_bb
	;***      517 : 	}
	;***      518 : 
	;***      519 : 	rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 519
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      520 : 
	;***      521 : 	if (g_uart3_rx_length > g_uart3_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 521
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@20_6
.BB@LABEL@20_3:	; if_then_bb18
	;***      522 : 		*gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 522
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      523 : 		gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 523
	incw !LOWW(_gp_uart3_rx_address)
	;***      524 : 		g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 524
	incw !LOWW(_g_uart3_rx_count)
	;***      525 : 
	;***      526 : 		if (g_uart3_rx_length == g_uart3_rx_count) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 526
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@20_4:	; if_then_bb30
	;***      527 : 			r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 527
	call !!_r_uart3_callback_receiveend@1
.BB@LABEL@20_5:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 532
	reti
.BB@LABEL@20_6:	; if_else_bb
	;***      528 : 		}
	;***      529 : 	} else {
	;***      530 : 		r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 530
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@20_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      531 : 	}
	;***      532 : }
	;***      533 : 
	;***      534 : /***********************************************************************************************************************
	;***      535 :  * Function Name: r_uart3_interrupt_send
	;***      536 :  * Description  : This function is INTST3 interrupt service routine.
	;***      537 :  * Arguments    : None
	;***      538 :  * Return Value : None
	;***      539 :  ***********************************************************************************************************************/
	;***      540 : static void __near r_uart3_interrupt_send(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 540
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      541 : 	if (g_uart3_tx_count > 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 541
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@21_3
.BB@LABEL@21_1:	; if_else_bb
	;***      542 : 		TXD3 = *gp_uart3_tx_address;
	;***      543 : 		gp_uart3_tx_address++;
	;***      544 : 		g_uart3_tx_count--;
	;***      545 : 	} else {
	;***      546 : 		r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 546
	call !!_r_uart3_callback_sendend@1
.BB@LABEL@21_2:	; if_else_bb
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 548
	reti
.BB@LABEL@21_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 542
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 543
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 544
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@21_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      547 : 	}
	;***      548 : }
	;***      549 : 
	;***      550 : /***********************************************************************************************************************
	;***      551 :  * Function Name: r_uart3_callback_receiveend
	;***      552 :  * Description  : This function is a callback function when UART3 finishes reception.
	;***      553 :  * Arguments    : None
	;***      554 :  * Return Value : None
	;***      555 :  ***********************************************************************************************************************/
	;***      556 : static void r_uart3_callback_receiveend(void) {
	;***      557 : 	/* Start user code. Do not edit comment generated here */
	;***      558 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 558
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      559 : 	if (g_uart3_rx_data[0] == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 559
	mov a, !LOWW(_g_uart3_rx_data)
	cmp a, #0x01
	bnz $.BB@LABEL@22_7
.BB@LABEL@22_1:	; if_then_bb
	;***      560 : 		//Read timer setting
	;***      561 : 		if ((rs485_rx_p[0] == H_READ) && (rs485_rx_p[1] == READ_TIME)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 561
	cmp !LOWW(_g_uart3_rx_data+0x00001), #0x52
	bnz $.BB@LABEL@22_6
.BB@LABEL@22_2:	; bb
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x02
	bnz $.BB@LABEL@22_4
.BB@LABEL@22_3:	; if_then_bb25
	;***      562 : 			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 562
	oneb !LOWW(_g_commnunication_flag+0x0000A)
	ret
.BB@LABEL@22_4:	; bb32
	;***      563 : 		} else if ((rs485_rx_p[0] == 82) && (rs485_rx_p[1] == 24)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 563
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x18
	sknz
.BB@LABEL@22_5:	; if_then_bb47
	;***      564 : 			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 564
	oneb !LOWW(_g_commnunication_flag+0x0000B)
.BB@LABEL@22_6:	; if_else_bb.if_else_bb48_crit_edge.critedge
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 581
	ret
.BB@LABEL@22_7:	; if_else_bb97
	;***      565 : 		} else if ((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 70)) {
	;***      566 : 			//TODO: Start Water Softener
	;***      567 : 
	;***      568 : 		} else if ((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 80)) {
	;***      569 : 			//TODO: Stop Water Softener + Time of SNP ON (4 bytes)
	;***      570 : 		}
	;***      571 : 	} else if (g_uart3_rx_data[0] == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 571
	cmp a, #0x02
	bnz $.BB@LABEL@22_12
.BB@LABEL@22_8:	; if_then_bb103
	;***      572 : 		if ((rs485_rx_p[0] == 11)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 572
	mov a, !LOWW(_g_uart3_rx_data+0x00001)
	cmp a, #0x0B
	bnz $.BB@LABEL@22_10
.BB@LABEL@22_9:	; if_then_bb111
	;***      573 : 			g_commnunication_flag.rs485_send_to_valve_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 573
	oneb !LOWW(_g_commnunication_flag+0x0000C)
	ret
.BB@LABEL@22_10:	; if_else_bb112
	;***      574 : 		} else if ((rs485_rx_p[0] == 12)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 574
	cmp a, #0x0C
	bnz $.BB@LABEL@22_14
.BB@LABEL@22_11:	; if_then_bb120
	;***      575 : 			g_commnunication_flag.rs485_get_valve_gesture_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 575
	oneb !LOWW(_g_commnunication_flag+0x0000D)
	ret
.BB@LABEL@22_12:	; if_else_bb123
	;***      576 : 		}
	;***      577 : 	} else if (g_uart3_rx_data[0] != 0xff) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 577
	inc a
	skz
.BB@LABEL@22_13:	; if_then_bb129
	;***      578 : 		g_commnunication_flag.rs485_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 578
	oneb !LOWW(_g_commnunication_flag+0x0000E)
.BB@LABEL@22_14:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 581
	ret
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      579 : 	}
	;***      580 : 	/* End user code. Do not edit comment generated here */
	;***      581 : }
	;***      582 : 
	;***      583 : /***********************************************************************************************************************
	;***      584 :  * Function Name: r_uart3_callback_softwareoverrun
	;***      585 :  * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      586 :  * Arguments    : rx_data -
	;***      587 :  *                    receive data
	;***      588 :  * Return Value : None
	;***      589 :  ***********************************************************************************************************************/
	;***      590 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 590
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      591 : 	/* Start user code. Do not edit comment generated here */
	;***      592 : 	/* End user code. Do not edit comment generated here */
	;***      593 : }
	;***      594 : 
	;***      595 : /***********************************************************************************************************************
	;***      596 :  * Function Name: r_uart3_callback_sendend
	;***      597 :  * Description  : This function is a callback function when UART3 finishes transmission.
	;***      598 :  * Arguments    : None
	;***      599 :  * Return Value : None
	;***      600 :  ***********************************************************************************************************************/
	;***      601 : static void r_uart3_callback_sendend(void) {
	;***      602 : 	/* Start user code. Do not edit comment generated here */
	;***      603 : 	g_uart3_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 603
	inc !LOWW(_g_uart3_sendend)
	;***      604 : 	O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 604
	clr1 0xFFF00.0
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      605 : 	/* End user code. Do not edit comment generated here */
	;***      606 : }
	;***      607 : 
	;***      608 : /***********************************************************************************************************************
	;***      609 :  * Function Name: r_uart3_callback_error
	;***      610 :  * Description  : This function is a callback function when UART3 reception error occurs.
	;***      611 :  * Arguments    : err_type -
	;***      612 :  *                    error type value
	;***      613 :  * Return Value : None
	;***      614 :  ***********************************************************************************************************************/
	;***      615 : static void r_uart3_callback_error(uint8_t err_type) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 615
	ret
	;***      616 : 	/* Start user code. Do not edit comment generated here */
	;***      617 : 	/* End user code. Do not edit comment generated here */
	;***      618 : }
	;***      619 : 
	;***      620 : /* Start user code for adding. Do not edit comment generated here */
	;***      621 : /* End user code. Do not edit comment generated here */
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
	.DS (15)
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
