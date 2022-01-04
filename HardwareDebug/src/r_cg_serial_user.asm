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
#@  compiled at Tue Jan 04 16:29:22 2022

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
	.PUBLIC _commnunication_flag
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
	;***       21 : * File Name    : r_cg_serial_user.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for Serial module.
	;***       26 : * Creation Date: 30/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_serial.h"
	;***       34 : /* Start user code for include. Do not edit comment generated here */
	;***       35 : #include "r_cg_wdt.h"
	;***       36 : #include "main.h"
	;***       37 : /* End user code. Do not edit comment generated here */
	;***       38 : #include "r_cg_userdefine.h"
	;***       39 : 
	;***       40 : /***********************************************************************************************************************
	;***       41 : Pragma directive
	;***       42 : ***********************************************************************************************************************/
	;***       43 : #pragma interrupt r_uart1_interrupt_send(vect=INTST1)
	;***       44 : #pragma interrupt r_uart1_interrupt_receive(vect=INTSR1)
	;***       45 : #pragma interrupt r_csi00_interrupt(vect=INTCSI00)
	;***       46 : #pragma interrupt r_csi01_interrupt(vect=INTCSI01)
	;***       47 : #pragma interrupt r_uart2_interrupt_send(vect=INTST2)
	;***       48 : #pragma interrupt r_uart2_interrupt_receive(vect=INTSR2)
	;***       49 : #pragma interrupt r_uart3_interrupt_send(vect=INTST3)
	;***       50 : #pragma interrupt r_uart3_interrupt_receive(vect=INTSR3)
	;***       51 : /* Start user code for pragma. Do not edit comment generated here */
	;***       52 : /* End user code. Do not edit comment generated here */
	;***       53 : 
	;***       54 : /***********************************************************************************************************************
	;***       55 : Global variables and functions
	;***       56 : ***********************************************************************************************************************/
	;***       57 : extern volatile uint8_t * gp_uart1_tx_address;         /* uart1 send buffer address */
	;***       58 : extern volatile uint16_t  g_uart1_tx_count;            /* uart1 send data number */
	;***       59 : extern volatile uint8_t * gp_uart1_rx_address;         /* uart1 receive buffer address */
	;***       60 : extern volatile uint16_t  g_uart1_rx_count;            /* uart1 receive data number */
	;***       61 : extern volatile uint16_t  g_uart1_rx_length;           /* uart1 receive data length */
	;***       62 : extern volatile uint8_t * gp_csi00_rx_address;         /* csi00 receive buffer address */
	;***       63 : extern volatile uint16_t  g_csi00_rx_length;           /* csi00 receive data length */
	;***       64 : extern volatile uint16_t  g_csi00_rx_count;            /* csi00 receive data count */
	;***       65 : extern volatile uint8_t * gp_csi00_tx_address;         /* csi00 send buffer address */
	;***       66 : extern volatile uint16_t  g_csi00_send_length;         /* csi00 send data length */
	;***       67 : extern volatile uint16_t  g_csi00_tx_count;            /* csi00 send data count */
	;***       68 : extern volatile uint8_t * gp_csi01_rx_address;         /* csi01 receive buffer address */
	;***       69 : extern volatile uint16_t  g_csi01_rx_length;           /* csi01 receive data length */
	;***       70 : extern volatile uint16_t  g_csi01_rx_count;            /* csi01 receive data count */
	;***       71 : extern volatile uint8_t * gp_csi01_tx_address;         /* csi01 send buffer address */
	;***       72 : extern volatile uint16_t  g_csi01_send_length;         /* csi01 send data length */
	;***       73 : extern volatile uint16_t  g_csi01_tx_count;            /* csi01 send data count */
	;***       74 : extern volatile uint8_t * gp_uart2_tx_address;         /* uart2 send buffer address */
	;***       75 : extern volatile uint16_t  g_uart2_tx_count;            /* uart2 send data number */
	;***       76 : extern volatile uint8_t * gp_uart2_rx_address;         /* uart2 receive buffer address */
	;***       77 : extern volatile uint16_t  g_uart2_rx_count;            /* uart2 receive data number */
	;***       78 : extern volatile uint16_t  g_uart2_rx_length;           /* uart2 receive data length */
	;***       79 : extern volatile uint8_t * gp_uart3_tx_address;         /* uart3 send buffer address */
	;***       80 : extern volatile uint16_t  g_uart3_tx_count;            /* uart3 send data number */
	;***       81 : extern volatile uint8_t * gp_uart3_rx_address;         /* uart3 receive buffer address */
	;***       82 : extern volatile uint16_t  g_uart3_rx_count;            /* uart3 receive data number */
	;***       83 : extern volatile uint16_t  g_uart3_rx_length;           /* uart3 receive data length */
	;***       84 : /* Start user code for global. Do not edit comment generated here */
	;***       85 : volatile uint8_t send_response_flag, send_response_time_flag, send_response_number_flag, recived_time_setting_flag
	;***       86 : ,send_respone_status_flag, recived_number_setting_flag;
	;***       87 : volatile struct Communicaition_flag_s commnunication_flag;
	;***       88 : volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end, g_uart1_send, g_uart2_sendend, g_uart2_receive;
	;***       89 : uint8_t g_rx_data[4*40];
	;***       90 : uint8_t g_uart3_rx_data[8];
	;***       91 : volatile uint8_t g_uart2_fault;
	;***       92 : volatile uint8_t g_uart3_sendend;
	;***       93 : uint8_t isCommandNeedResponse(uint8_t *data){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 93
	movw de, ax
	;***       94 : 	if((data[0] == H_SET)&&(data[1] == NEXT_ANIMATION)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 94
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
	;***       95 : 		return 0;
	;***       96 : 	}
	;***       97 : 	switch ((enum UART_header_e)*data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 97
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
	oneb !LOWW(_commnunication_flag)
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 117
	ret
.BB@LABEL@1_7:	; bb30
	;***       98 : //		case H_ALARM:
	;***       99 : //			commnunication_flag.send_response_flag = 1;
	;***      100 : //			break;
	;***      101 : 		case H_CLEAR:
	;***      102 : 			commnunication_flag.send_response_flag = 1;
	;***      103 : 			break;
	;***      104 : 		case H_ERROR:
	;***      105 : 			commnunication_flag.send_response_flag = 1;
	;***      106 : 			break;
	;***      107 : 		case H_READ:
	;***      108 : 			commnunication_flag.send_response_flag = 1;
	;***      109 : 			break;
	;***      110 : 		case H_SET:
	;***      111 : 			commnunication_flag.send_response_flag = 1;
	;***      112 : 			break;
	;***      113 : 		default:
	;***      114 : 			return 0;
	;***      115 : 	}
	;***      116 : 	return 1;
	;***      117 : }
	clrb a
	ret
	.SECTION .text,TEXT
_r_uart1_interrupt_receive@1	.vector 0x0026
_r_uart1_interrupt_receive@1:
	.STACK _r_uart1_interrupt_receive@1 = 16
	;***      118 : /* End user code. Do not edit comment generated here */
	;***      119 : 
	;***      120 : /***********************************************************************************************************************
	;***      121 : * Function Name: r_uart1_interrupt_receive
	;***      122 : * Description  : This function is INTSR1 interrupt service routine.
	;***      123 : * Arguments    : None
	;***      124 : * Return Value : None
	;***      125 : ***********************************************************************************************************************/
	;***      126 : static void __near r_uart1_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 126
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      127 : {
	;***      128 :     volatile uint8_t rx_data;
	;***      129 :     volatile uint8_t err_type;
	;***      130 :     
	;***      131 :     err_type = (uint8_t)(SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 131
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      132 :     SIR03 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 132
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      133 : 
	;***      134 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 134
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; if_then_bb
	;***      135 :     {
	;***      136 :         r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 136
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@2_2:	; if_break_bb
	;***      137 :     }
	;***      138 :     
	;***      139 :     rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 139
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      140 : 
	;***      141 :     if (g_uart1_rx_length > g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 141
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@2_6
.BB@LABEL@2_3:	; if_then_bb18
	;***      142 :     {
	;***      143 :         *gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 143
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      144 :         gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 144
	incw !LOWW(_gp_uart1_rx_address)
	;***      145 :         g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 145
	incw !LOWW(_g_uart1_rx_count)
	;***      146 : 
	;***      147 :         if (g_uart1_rx_length == g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 147
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@2_4:	; if_then_bb30
	;***      148 :         {
	;***      149 :             r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 149
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 156
	reti
.BB@LABEL@2_6:	; if_else_bb
	;***      150 :         }
	;***      151 :     }
	;***      152 :     else
	;***      153 :     {
	;***      154 :         r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 154
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@2_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      155 :     }
	;***      156 : }
	;***      157 : 
	;***      158 : /***********************************************************************************************************************
	;***      159 : * Function Name: r_uart1_interrupt_send
	;***      160 : * Description  : This function is INTST1 interrupt service routine.
	;***      161 : * Arguments    : None
	;***      162 : * Return Value : None
	;***      163 : ***********************************************************************************************************************/
	;***      164 : static void __near r_uart1_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 164
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      165 : {
	;***      166 :     if (g_uart1_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 166
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@3_3
.BB@LABEL@3_1:	; if_else_bb
	;***      167 :     {
	;***      168 :         TXD1 = *gp_uart1_tx_address;
	;***      169 :         gp_uart1_tx_address++;
	;***      170 :         g_uart1_tx_count--;
	;***      171 :     }
	;***      172 :     else
	;***      173 :     {
	;***      174 :         r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 174
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 176
	reti
.BB@LABEL@3_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 168
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 169
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 170
	decw !LOWW(_g_uart1_tx_count)
	br $.BB@LABEL@3_2
	.SECTION .textf,TEXTF
_r_uart1_callback_receiveend@1:
	.STACK _r_uart1_callback_receiveend@1 = 4
	;***      175 :     }
	;***      176 : }
	;***      177 : 
	;***      178 : /***********************************************************************************************************************
	;***      179 : * Function Name: r_uart1_callback_receiveend
	;***      180 : * Description  : This function is a callback function when UART1 finishes reception.
	;***      181 : * Arguments    : None
	;***      182 : * Return Value : None
	;***      183 : ***********************************************************************************************************************/
	;***      184 : static void r_uart1_callback_receiveend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 184
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      185 : {
	;***      186 :     /* Start user code. Do not edit comment generated here */
	;***      187 :     /* End user code. Do not edit comment generated here */
	;***      188 : }
	;***      189 : 
	;***      190 : /***********************************************************************************************************************
	;***      191 : * Function Name: r_uart1_callback_softwareoverrun
	;***      192 : * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      193 : * Arguments    : rx_data -
	;***      194 : *                    receive data
	;***      195 : * Return Value : None
	;***      196 : ***********************************************************************************************************************/
	;***      197 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 197
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      198 : {
	;***      199 :     /* Start user code. Do not edit comment generated here */
	;***      200 :     /* End user code. Do not edit comment generated here */
	;***      201 : }
	;***      202 : 
	;***      203 : /***********************************************************************************************************************
	;***      204 : * Function Name: r_uart1_callback_sendend
	;***      205 : * Description  : This function is a callback function when UART1 finishes transmission.
	;***      206 : * Arguments    : None
	;***      207 : * Return Value : None
	;***      208 : ***********************************************************************************************************************/
	;***      209 : static void r_uart1_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 209
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      210 : {
	;***      211 :     /* Start user code. Do not edit comment generated here */
	;***      212 :     /* End user code. Do not edit comment generated here */
	;***      213 : }
	;***      214 : 
	;***      215 : /***********************************************************************************************************************
	;***      216 : * Function Name: r_uart1_callback_error
	;***      217 : * Description  : This function is a callback function when UART1 reception error occurs.
	;***      218 : * Arguments    : err_type -
	;***      219 : *                    error type value
	;***      220 : * Return Value : None
	;***      221 : ***********************************************************************************************************************/
	;***      222 : static void r_uart1_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 222
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      223 : {
	;***      224 :     /* Start user code. Do not edit comment generated here */
	;***      225 :     /* End user code. Do not edit comment generated here */
	;***      226 : }
	;***      227 : 
	;***      228 : /***********************************************************************************************************************
	;***      229 : * Function Name: r_csi00_interrupt
	;***      230 : * Description  : This function is INTCSI00 interrupt service routine.
	;***      231 : * Arguments    : None
	;***      232 : * Return Value : None
	;***      233 : ***********************************************************************************************************************/
	;***      234 : static void __near r_csi00_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 234
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      235 : {
	;***      236 :     volatile uint8_t err_type;
	;***      237 : 
	;***      238 :     err_type = (uint8_t)(SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 238
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      239 :     SIR00 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 239
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      240 : 
	;***      241 :     if (err_type != 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 241
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 254
	reti
.BB@LABEL@8_2:	; if_then_bb
	;***      242 :     {
	;***      243 :         if (g_csi00_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 243
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_3:	; if_else_bb
	;***      244 :         {
	;***      245 :             SIO00 = *gp_csi00_tx_address;
	;***      246 :             gp_csi00_tx_address++;
	;***      247 :             g_csi00_tx_count--;
	;***      248 :         }
	;***      249 :         else
	;***      250 :         {
	;***      251 :             r_csi00_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 251
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@8_1
.BB@LABEL@8_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 245
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 246
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 247
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@8_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      252 :         }
	;***      253 :     }
	;***      254 : }
	;***      255 : 
	;***      256 : /***********************************************************************************************************************
	;***      257 : * Function Name: r_csi00_callback_sendend
	;***      258 : * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      259 : * Arguments    : None
	;***      260 : * Return Value : None
	;***      261 : ***********************************************************************************************************************/
	;***      262 : static void r_csi00_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 262
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      263 : {
	;***      264 :     /* Start user code. Do not edit comment generated here */
	;***      265 :     /* End user code. Do not edit comment generated here */
	;***      266 : }
	;***      267 : 
	;***      268 : /***********************************************************************************************************************
	;***      269 : * Function Name: r_csi01_interrupt
	;***      270 : * Description  : This function is INTCSI01 interrupt service routine.
	;***      271 : * Arguments    : None
	;***      272 : * Return Value : None
	;***      273 : ***********************************************************************************************************************/
	;***      274 : static void __near r_csi01_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 274
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      275 : {
	;***      276 :     volatile uint8_t err_type;
	;***      277 :     volatile uint8_t sio_dummy;
	;***      278 : 
	;***      279 :     err_type = (uint8_t)(SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 279
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      280 :     SIR01 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 280
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      281 : 
	;***      282 :     if (1U == err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 282
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@10_2
.BB@LABEL@10_1:	; if_then_bb
	;***      283 :     {
	;***      284 :         r_csi01_callback_error(err_type);    /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 284
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_2:	; if_else_bb
	;***      285 :     }
	;***      286 :     else
	;***      287 :     {
	;***      288 :         if (g_csi01_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 288
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@10_8
.BB@LABEL@10_3:	; if_else_bb42
	;***      289 :         {
	;***      290 :             if (0U != gp_csi01_rx_address)
	;***      291 :             {
	;***      292 :                 *gp_csi01_rx_address = SIO01;
	;***      293 :                 gp_csi01_rx_address++;
	;***      294 :             }
	;***      295 :             else
	;***      296 :             {
	;***      297 :                 sio_dummy = SIO01;
	;***      298 :             }
	;***      299 : 
	;***      300 :             if (0U != gp_csi01_tx_address)
	;***      301 :             {
	;***      302 :                 SIO01 = *gp_csi01_tx_address;
	;***      303 :                 gp_csi01_tx_address++;
	;***      304 :             }
	;***      305 :             else
	;***      306 :             {
	;***      307 :                 SIO01 = 0xFFU;
	;***      308 :             }
	;***      309 : 
	;***      310 :             g_csi01_tx_count--;
	;***      311 :         }
	;***      312 :         else 
	;***      313 :         {
	;***      314 :             if (0U == g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 314
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@10_7
.BB@LABEL@10_4:	; if_then_bb47
	;***      315 :             {
	;***      316 :                 if (0U != gp_csi01_rx_address)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 316
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_6
.BB@LABEL@10_5:	; if_else_bb55
	;***      317 :                 {
	;***      318 :                     *gp_csi01_rx_address = SIO01;
	;***      319 :                 }
	;***      320 :                 else
	;***      321 :                 {
	;***      322 :                     sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 322
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_7
.BB@LABEL@10_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 318
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@10_7:	; if_break_bb59
	;***      323 :                 }
	;***      324 :             }
	;***      325 : 
	;***      326 :             r_csi01_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 326
	call !!_r_csi01_callback_sendend@1
	;***      327 :             r_csi01_callback_receiveend();    /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 327
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 290
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_10
.BB@LABEL@10_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 297
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_11
.BB@LABEL@10_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 292
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 293
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@10_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 300
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_13
.BB@LABEL@10_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 307
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@10_14
.BB@LABEL@10_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 302
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 303
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@10_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 310
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 330
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      328 :         }
	;***      329 :     }
	;***      330 : }
	;***      331 : 
	;***      332 : /***********************************************************************************************************************
	;***      333 : * Function Name: r_csi01_callback_receiveend
	;***      334 : * Description  : This function is a callback function when CSI01 finishes reception.
	;***      335 : * Arguments    : None
	;***      336 : * Return Value : None
	;***      337 : ***********************************************************************************************************************/
	;***      338 : static void r_csi01_callback_receiveend(void)
	;***      339 : {
	;***      340 :     /* Start user code. Do not edit comment generated here */
	;***      341 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 341
	inc !LOWW(_g_csi_rev_end)
	;***      342 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 342
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      343 :     /* End user code. Do not edit comment generated here */
	;***      344 : }
	;***      345 : 
	;***      346 : /***********************************************************************************************************************
	;***      347 : * Function Name: r_csi01_callback_error
	;***      348 : * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      349 : * Arguments    : err_type -
	;***      350 : *                    error type value
	;***      351 : * Return Value : None
	;***      352 : ***********************************************************************************************************************/
	;***      353 : static void r_csi01_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 353
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      354 : {
	;***      355 :     /* Start user code. Do not edit comment generated here */
	;***      356 : 
	;***      357 :     /* End user code. Do not edit comment generated here */
	;***      358 : }
	;***      359 : 
	;***      360 : /***********************************************************************************************************************
	;***      361 : * Function Name: r_csi01_callback_sendend
	;***      362 : * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      363 : * Arguments    : None
	;***      364 : * Return Value : None
	;***      365 : ***********************************************************************************************************************/
	;***      366 : static void r_csi01_callback_sendend(void)
	;***      367 : {
	;***      368 :     /* Start user code. Do not edit comment generated here */
	;***      369 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 369
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      370 :     /* End user code. Do not edit comment generated here */
	;***      371 : }
	;***      372 : 
	;***      373 : /***********************************************************************************************************************
	;***      374 : * Function Name: r_uart2_interrupt_receive
	;***      375 : * Description  : This function is INTSR2 interrupt service routine.
	;***      376 : * Arguments    : None
	;***      377 : * Return Value : None
	;***      378 : ***********************************************************************************************************************/
	;***      379 : static void __near r_uart2_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 379
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      380 : {
	;***      381 :     volatile uint8_t rx_data;
	;***      382 :     volatile uint8_t err_type;
	;***      383 :     
	;***      384 :     err_type = (uint8_t)(SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 384
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      385 :     SIR11 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 385
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      386 : 
	;***      387 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 387
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@14_2
.BB@LABEL@14_1:	; if_then_bb
	;***      388 :     {
	;***      389 :         r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 389
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@14_2:	; if_break_bb
	;***      390 :     }
	;***      391 :     
	;***      392 :     rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 392
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      393 : 
	;***      394 :     if (g_uart2_rx_length > g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 394
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@14_6
.BB@LABEL@14_3:	; if_then_bb18
	;***      395 :     {
	;***      396 :         *gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 396
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      397 :         gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 397
	incw !LOWW(_gp_uart2_rx_address)
	;***      398 :         g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 398
	incw !LOWW(_g_uart2_rx_count)
	;***      399 : 
	;***      400 :         if (g_uart2_rx_length == g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 400
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@14_4:	; if_then_bb30
	;***      401 :         {
	;***      402 :             r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 402
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 409
	reti
.BB@LABEL@14_6:	; if_else_bb
	;***      403 :         }
	;***      404 :     }
	;***      405 :     else
	;***      406 :     {
	;***      407 :         r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 407
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@14_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      408 :     }
	;***      409 : }
	;***      410 : 
	;***      411 : /***********************************************************************************************************************
	;***      412 : * Function Name: r_uart2_interrupt_send
	;***      413 : * Description  : This function is INTST2 interrupt service routine.
	;***      414 : * Arguments    : None
	;***      415 : * Return Value : None
	;***      416 : ***********************************************************************************************************************/
	;***      417 : static void __near r_uart2_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 417
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      418 : {
	;***      419 :     if (g_uart2_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 419
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@15_3
.BB@LABEL@15_1:	; if_else_bb
	;***      420 :     {
	;***      421 :         TXD2 = *gp_uart2_tx_address;
	;***      422 :         gp_uart2_tx_address++;
	;***      423 :         g_uart2_tx_count--;
	;***      424 :     }
	;***      425 :     else
	;***      426 :     {
	;***      427 :         r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 427
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 429
	reti
.BB@LABEL@15_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 421
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 422
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 423
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@15_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 8
	;***      428 :     }
	;***      429 : }
	;***      430 : 
	;***      431 : /***********************************************************************************************************************
	;***      432 : * Function Name: r_uart2_callback_receiveend
	;***      433 : * Description  : This function is a callback function when UART2 finishes reception.
	;***      434 : * Arguments    : None
	;***      435 : * Return Value : None
	;***      436 : ***********************************************************************************************************************/
	;***      437 : static void r_uart2_callback_receiveend(void)
	;***      438 : {
	;***      439 :     /* Start user code. Do not edit comment generated here */
	;***      440 : 
	;***      441 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 441
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      442 : 	commnunication_flag.recived_time_setting_flag = commnunication_flag.recived_time_setting_flag == 1 ? 2: commnunication_flag.recived_time_setting_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 442
	cmp !LOWW(_commnunication_flag+0x00004), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_1:	; bb5
	mov a, !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@16_2:	; bb8
	mov !LOWW(_commnunication_flag+0x00004), a
	;***      443 : 	commnunication_flag.recived_number_setting_flag = commnunication_flag.recived_number_setting_flag == 1 ? 2: commnunication_flag.recived_number_setting_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 443
	cmp !LOWW(_commnunication_flag+0x00003), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_3:	; bb16
	mov a, !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@16_4:	; bb20
	mov !LOWW(_commnunication_flag+0x00003), a
	;***      444 : 	if(isCommandNeedResponse(g_rx_data)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 444
	movw ax, #LOWW(_g_rx_data)
	call $!_isCommandNeedResponse
	cmp0 a
	bnz $.BB@LABEL@16_10
.BB@LABEL@16_5:	; if_else_bb318
	;***      445 : 		if((g_rx_data[0] == H_READ)&&(g_rx_data[1] == READ_TIME)){
	;***      446 : 			commnunication_flag.send_response_time_flag = 1;
	;***      447 : 		}else if((g_rx_data[0] == H_SET)&&(g_rx_data[1] == SAVE_TIME)){
	;***      448 : 			R_UART2_Receive(g_rx_data, timeSettingSize);
	;***      449 : 			commnunication_flag.recived_time_setting_flag = 1;
	;***      450 : 		}else if((g_rx_data[0] == H_READ)&&(g_rx_data[1] == READ_MACHINE_STATUS)){
	;***      451 : 			commnunication_flag.send_respone_status_flag = 1;
	;***      452 : 		}else if((g_rx_data[0] == H_READ)&&(g_rx_data[1] == READ_NUMBER)){
	;***      453 : 			commnunication_flag.send_response_number_flag = 1;
	;***      454 : 		}else if((g_rx_data[0] == H_SET)&&(g_rx_data[1] == SAVE_NUMBER)){
	;***      455 : 			R_UART2_Receive(g_rx_data, numberSettingSize);
	;***      456 : 			commnunication_flag.recived_number_setting_flag = 1;
	;***      457 : 		}else if((g_rx_data[0] == H_READ)&&(g_rx_data[1] == WASHING_MODE)){
	;***      458 : 			commnunication_flag.send_response_mode_flag = 1;
	;***      459 : //			commnunication_flag.send_response_flag = 0;
	;***      460 : 		}else if((g_rx_data[0] == H_CLEAR)){
	;***      461 : 			commnunication_flag.alarm_clear_flag = g_rx_data[1];
	;***      462 : 		}else if((g_rx_data[0] == H_SET)&&(g_rx_data[1] == NEXT_ANIMATION)){
	;***      463 : //			g_machine_state.waitAnimationRes = 0;
	;***      464 : 		}else if((g_rx_data[0] == H_READ) && (g_rx_data[1] == MID_NIGHT)){
	;***      465 : 			commnunication_flag.send_response_flag = 0;
	;***      466 : 			g_machine_state.isMidNight = g_rx_data[5];
	;***      467 : 		}else if((g_rx_data[0] == H_SET) && (g_rx_data[1] == TEST_POWER_ON)){
	;***      468 : 			commnunication_flag.test_flag = TEST_POWER_ON;
	;***      469 : 		}else if((g_rx_data[0] == H_SET) && (g_rx_data[1] == TEST_FLOW_RATE)){
	;***      470 : 			commnunication_flag.test_flag = TEST_FLOW_RATE;
	;***      471 : 		}else if((g_rx_data[0] == H_SET) && (g_rx_data[1] == TEST_CURRENT)){
	;***      472 : 			commnunication_flag.test_flag = TEST_CURRENT;
	;***      473 : 		}else if((g_rx_data[0] == H_SET) && (g_rx_data[1] == TEST_INDIVIDUAL)){
	;***      474 : 			commnunication_flag.test_flag = TEST_INDIVIDUAL;
	;***      475 : 		}else if((g_rx_data[0] == H_SET) && (g_rx_data[1] == TEST_ELECTROLYTIC)){
	;***      476 : 			commnunication_flag.test_flag = TEST_ELECTROLYTIC;
	;***      477 : 		}
	;***      478 : 		if(isThisCommand(g_rx_data, H_SET, WASHING_MODE, 0xff) != 0){
	;***      479 : 			g_machine_mode = g_rx_data[5];
	;***      480 : 		}
	;***      481 : 		if (isThisCommand(g_rx_data, H_SET, OK_USER, 0xff) != 0) {
	;***      482 : 			g_machine_state.user = 2;
	;***      483 : 		}
	;***      484 : 	}else if(commnunication_flag.recived_time_setting_flag != 0 || commnunication_flag.recived_number_setting_flag != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 484
	cmp0 !LOWW(_commnunication_flag+0x00004)
	bnz $.BB@LABEL@16_8
.BB@LABEL@16_6:	; bb323
	cmp0 !LOWW(_commnunication_flag+0x00003)
	bnz $.BB@LABEL@16_8
.BB@LABEL@16_7:	; if_else_bb338
	;***      485 : 		R_UART2_Receive(g_rx_data, 6);
	;***      486 : 	}else{
	;***      487 : 		g_uart2_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 487
	oneb !LOWW(_g_uart2_fault)
	br $.BB@LABEL@16_9
.BB@LABEL@16_8:	; if_then_bb336
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 485
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
.BB@LABEL@16_9:	; if_then_bb336
	br $!.BB@LABEL@16_55
.BB@LABEL@16_10:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 445
	mov a, !LOWW(_g_rx_data)
	cmp a, #0x52
	bnz $.BB@LABEL@16_13
.BB@LABEL@16_11:	; bb33
	cmp !LOWW(_g_rx_data+0x00001), #0x02
	bnz $.BB@LABEL@16_13
.BB@LABEL@16_12:	; if_then_bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 446
	oneb !LOWW(_commnunication_flag+0x00001)
	br $.BB@LABEL@16_27
.BB@LABEL@16_13:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 447
	cmp a, #0x53
	bnz $.BB@LABEL@16_16
.BB@LABEL@16_14:	; bb51
	cmp !LOWW(_g_rx_data+0x00001), #0x14
	bnz $.BB@LABEL@16_16
.BB@LABEL@16_15:	; if_then_bb64
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 448
	movw bc, #0x0095
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 449
	oneb !LOWW(_commnunication_flag+0x00004)
	br $.BB@LABEL@16_30
.BB@LABEL@16_16:	; if_else_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 450
	cmp a, #0x52
	bnz $.BB@LABEL@16_21
.BB@LABEL@16_17:	; bb74
	cmp !LOWW(_g_rx_data+0x00001), #0x17
	bnz $.BB@LABEL@16_19
.BB@LABEL@16_18:	; if_then_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 451
	oneb !LOWW(_commnunication_flag+0x00005)
	br $.BB@LABEL@16_36
.BB@LABEL@16_19:	; bb93
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 452
	cmp !LOWW(_g_rx_data+0x00001), #0x03
	bnz $.BB@LABEL@16_21
.BB@LABEL@16_20:	; if_then_bb106
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 453
	oneb !LOWW(_commnunication_flag+0x00002)
	br $.BB@LABEL@16_36
.BB@LABEL@16_21:	; if_else_bb107
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 454
	cmp a, #0x53
	bnz $.BB@LABEL@16_24
.BB@LABEL@16_22:	; bb112
	cmp !LOWW(_g_rx_data+0x00001), #0x15
	bnz $.BB@LABEL@16_24
.BB@LABEL@16_23:	; if_then_bb125
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 455
	movw bc, #0x0025
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 456
	oneb !LOWW(_commnunication_flag+0x00003)
	br $.BB@LABEL@16_42
.BB@LABEL@16_24:	; if_else_bb129
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 457
	cmp a, #0x52
	bnz $.BB@LABEL@16_28
.BB@LABEL@16_25:	; bb134
	cmp !LOWW(_g_rx_data+0x00001), #0x18
	bnz $.BB@LABEL@16_28
.BB@LABEL@16_26:	; if_then_bb147
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 458
	oneb !LOWW(_commnunication_flag+0x00006)
.BB@LABEL@16_27:	; if_then_bb147
	br $.BB@LABEL@16_45
.BB@LABEL@16_28:	; if_else_bb148
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 460
	cmp a, #0x43
	bnz $.BB@LABEL@16_31
.BB@LABEL@16_29:	; if_then_bb154
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 461
	mov a, !LOWW(_g_rx_data+0x00001)
	mov !LOWW(_commnunication_flag+0x00007), a
.BB@LABEL@16_30:	; if_then_bb154
	br $.BB@LABEL@16_48
.BB@LABEL@16_31:	; if_else_bb156
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 462
	cmp a, #0x53
	bnz $.BB@LABEL@16_33
.BB@LABEL@16_32:	; bb161
	cmp !LOWW(_g_rx_data+0x00001), #0x13
	bz $.BB@LABEL@16_51
.BB@LABEL@16_33:	; if_else_bb175
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 464
	cmp a, #0x52
	bnz $.BB@LABEL@16_37
.BB@LABEL@16_34:	; bb180
	cmp !LOWW(_g_rx_data+0x00001), #0x1C
	bnz $.BB@LABEL@16_37
.BB@LABEL@16_35:	; if_then_bb193
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 465
	clrb !LOWW(_commnunication_flag)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 466
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_state+0x0000A), a
.BB@LABEL@16_36:	; if_then_bb193
	br $.BB@LABEL@16_51
.BB@LABEL@16_37:	; if_else_bb195
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 467
	cmp a, #0x53
	bnz $.BB@LABEL@16_51
.BB@LABEL@16_38:	; bb200
	cmp !LOWW(_g_rx_data+0x00001), #0x1D
	bnz $.BB@LABEL@16_40
.BB@LABEL@16_39:	; if_then_bb213
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 468
	mov !LOWW(_commnunication_flag+0x00008), #0x1D
	br $.BB@LABEL@16_51
.BB@LABEL@16_40:	; bb219
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 469
	cmp !LOWW(_g_rx_data+0x00001), #0x1E
	bnz $.BB@LABEL@16_43
.BB@LABEL@16_41:	; if_then_bb232
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 470
	mov !LOWW(_commnunication_flag+0x00008), #0x1E
.BB@LABEL@16_42:	; if_then_bb232
	br $.BB@LABEL@16_51
.BB@LABEL@16_43:	; bb238
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 471
	cmp !LOWW(_g_rx_data+0x00001), #0x1F
	bnz $.BB@LABEL@16_46
.BB@LABEL@16_44:	; if_then_bb251
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 472
	mov !LOWW(_commnunication_flag+0x00008), #0x1F
.BB@LABEL@16_45:	; if_then_bb251
	br $.BB@LABEL@16_51
.BB@LABEL@16_46:	; bb257
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 473
	cmp !LOWW(_g_rx_data+0x00001), #0x20
	bnz $.BB@LABEL@16_49
.BB@LABEL@16_47:	; if_then_bb270
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 474
	mov !LOWW(_commnunication_flag+0x00008), #0x20
.BB@LABEL@16_48:	; if_then_bb270
	br $.BB@LABEL@16_51
.BB@LABEL@16_49:	; bb276
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 475
	cmp !LOWW(_g_rx_data+0x00001), #0x21
	sknz
.BB@LABEL@16_50:	; if_then_bb289
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 476
	mov !LOWW(_commnunication_flag+0x00008), #0x21
.BB@LABEL@16_51:	; if_break_bb302
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 478
	push ax
	mov x, #0xFF
	push ax
	movw bc, #0x1853
	movw ax, #LOWW(_g_rx_data)
	call !!_isThisCommand
	addw sp, #0x04
	cmp0 a
	bz $.BB@LABEL@16_53
.BB@LABEL@16_52:	; if_then_bb308
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 479
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_mode), a
.BB@LABEL@16_53:	; if_break_bb310
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 481
	push ax
	mov x, #0xFF
	push ax
	movw bc, #0x0153
	movw ax, #LOWW(_g_rx_data)
	call !!_isThisCommand
	addw sp, #0x04
	cmp0 a
	skz
.BB@LABEL@16_54:	; if_then_bb316
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 482
	mov !LOWW(_g_machine_state+0x0000D), #0x02
.BB@LABEL@16_55:	; if_break_bb340
	;***      488 : 	}
	;***      489 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 489
	inc !LOWW(_g_uart2_receive)
	ret
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      490 : 
	;***      491 :     /* End user code. Do not edit comment generated here */
	;***      492 : }
	;***      493 : 
	;***      494 : /***********************************************************************************************************************
	;***      495 : * Function Name: r_uart2_callback_softwareoverrun
	;***      496 : * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      497 : * Arguments    : rx_data -
	;***      498 : *                    receive data
	;***      499 : * Return Value : None
	;***      500 : ***********************************************************************************************************************/
	;***      501 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 501
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      502 : {
	;***      503 :     /* Start user code. Do not edit comment generated here */
	;***      504 :     /* End user code. Do not edit comment generated here */
	;***      505 : }
	;***      506 : 
	;***      507 : /***********************************************************************************************************************
	;***      508 : * Function Name: r_uart2_callback_sendend
	;***      509 : * Description  : This function is a callback function when UART2 finishes transmission.
	;***      510 : * Arguments    : None
	;***      511 : * Return Value : None
	;***      512 : ***********************************************************************************************************************/
	;***      513 : static void r_uart2_callback_sendend(void)
	;***      514 : {
	;***      515 :     /* Start user code. Do not edit comment generated here */
	;***      516 : 	g_uart2_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 516
	inc !LOWW(_g_uart2_sendend)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      517 :     /* End user code. Do not edit comment generated here */
	;***      518 : }
	;***      519 : 
	;***      520 : /***********************************************************************************************************************
	;***      521 : * Function Name: r_uart2_callback_error
	;***      522 : * Description  : This function is a callback function when UART2 reception error occurs.
	;***      523 : * Arguments    : err_type -
	;***      524 : *                    error type value
	;***      525 : * Return Value : None
	;***      526 : ***********************************************************************************************************************/
	;***      527 : static void r_uart2_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 527
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      528 : {
	;***      529 :     /* Start user code. Do not edit comment generated here */
	;***      530 :     /* End user code. Do not edit comment generated here */
	;***      531 : }
	;***      532 : 
	;***      533 : /***********************************************************************************************************************
	;***      534 : * Function Name: r_uart3_interrupt_receive
	;***      535 : * Description  : This function is INTSR3 interrupt service routine.
	;***      536 : * Arguments    : None
	;***      537 : * Return Value : None
	;***      538 : ***********************************************************************************************************************/
	;***      539 : static void __near r_uart3_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 539
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      540 : {
	;***      541 :     volatile uint8_t rx_data;
	;***      542 :     volatile uint8_t err_type;
	;***      543 :     
	;***      544 :     err_type = (uint8_t)(SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 544
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      545 :     SIR13 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 545
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      546 : 
	;***      547 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 547
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@20_2
.BB@LABEL@20_1:	; if_then_bb
	;***      548 :     {
	;***      549 :         r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 549
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@20_2:	; if_break_bb
	;***      550 :     }
	;***      551 :     
	;***      552 :     rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 552
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      553 : 
	;***      554 :     if (g_uart3_rx_length > g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 554
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@20_6
.BB@LABEL@20_3:	; if_then_bb18
	;***      555 :     {
	;***      556 :         *gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 556
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      557 :         gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 557
	incw !LOWW(_gp_uart3_rx_address)
	;***      558 :         g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 558
	incw !LOWW(_g_uart3_rx_count)
	;***      559 : 
	;***      560 :         if (g_uart3_rx_length == g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 560
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@20_4:	; if_then_bb30
	;***      561 :         {
	;***      562 :             r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 562
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 569
	reti
.BB@LABEL@20_6:	; if_else_bb
	;***      563 :         }
	;***      564 :     }
	;***      565 :     else
	;***      566 :     {
	;***      567 :         r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 567
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@20_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      568 :     }
	;***      569 : }
	;***      570 : 
	;***      571 : /***********************************************************************************************************************
	;***      572 : * Function Name: r_uart3_interrupt_send
	;***      573 : * Description  : This function is INTST3 interrupt service routine.
	;***      574 : * Arguments    : None
	;***      575 : * Return Value : None
	;***      576 : ***********************************************************************************************************************/
	;***      577 : static void __near r_uart3_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 577
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      578 : {
	;***      579 :     if (g_uart3_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 579
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@21_3
.BB@LABEL@21_1:	; if_else_bb
	;***      580 :     {
	;***      581 :         TXD3 = *gp_uart3_tx_address;
	;***      582 :         gp_uart3_tx_address++;
	;***      583 :         g_uart3_tx_count--;
	;***      584 :     }
	;***      585 :     else
	;***      586 :     {
	;***      587 :         r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 587
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 589
	reti
.BB@LABEL@21_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 581
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 582
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 583
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@21_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      588 :     }
	;***      589 : }
	;***      590 : 
	;***      591 : /***********************************************************************************************************************
	;***      592 : * Function Name: r_uart3_callback_receiveend
	;***      593 : * Description  : This function is a callback function when UART3 finishes reception.
	;***      594 : * Arguments    : None
	;***      595 : * Return Value : None
	;***      596 : ***********************************************************************************************************************/
	;***      597 : static void r_uart3_callback_receiveend(void)
	;***      598 : {
	;***      599 :     /* Start user code. Do not edit comment generated here */
	;***      600 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 600
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      601 : 	if(g_uart3_rx_data[0] == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 601
	mov a, !LOWW(_g_uart3_rx_data)
	cmp a, #0x01
	bnz $.BB@LABEL@22_7
.BB@LABEL@22_1:	; if_then_bb
	;***      602 : 		//Read timer setting
	;***      603 : 		if((rs485_rx_p[0] == H_READ) && (rs485_rx_p[1] == READ_TIME)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 603
	cmp !LOWW(_g_uart3_rx_data+0x00001), #0x52
	bnz $.BB@LABEL@22_6
.BB@LABEL@22_2:	; bb
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x02
	bnz $.BB@LABEL@22_4
.BB@LABEL@22_3:	; if_then_bb25
	;***      604 : 			commnunication_flag.rs485_send_to_watersolfner_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 604
	oneb !LOWW(_commnunication_flag+0x00009)
	ret
.BB@LABEL@22_4:	; bb32
	;***      605 : 		}else if((rs485_rx_p[0] == 82) && (rs485_rx_p[1] == 24)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 605
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x18
	sknz
.BB@LABEL@22_5:	; if_then_bb47
	;***      606 : 			commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 606
	oneb !LOWW(_commnunication_flag+0x0000A)
.BB@LABEL@22_6:	; if_else_bb.if_else_bb48_crit_edge.critedge
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 623
	ret
.BB@LABEL@22_7:	; if_else_bb97
	;***      607 : 		}else if((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 70)){
	;***      608 : 			//TODO: Start Water Softener
	;***      609 : 
	;***      610 : 		}else if((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 80)){
	;***      611 : 			//TODO: Stop Water Softener + Time of SNP ON (4 bytes)
	;***      612 : 		}
	;***      613 : 	}else if(g_uart3_rx_data[0] == 2){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 613
	cmp a, #0x02
	bnz $.BB@LABEL@22_12
.BB@LABEL@22_8:	; if_then_bb103
	;***      614 : 		if((rs485_rx_p[0] == 11)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 614
	mov a, !LOWW(_g_uart3_rx_data+0x00001)
	cmp a, #0x0B
	bnz $.BB@LABEL@22_10
.BB@LABEL@22_9:	; if_then_bb111
	;***      615 : 			commnunication_flag.rs485_send_to_valve_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 615
	oneb !LOWW(_commnunication_flag+0x0000B)
	ret
.BB@LABEL@22_10:	; if_else_bb112
	;***      616 : 		}else if((rs485_rx_p[0] == 12)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 616
	cmp a, #0x0C
	bnz $.BB@LABEL@22_14
.BB@LABEL@22_11:	; if_then_bb120
	;***      617 : 			commnunication_flag.rs485_get_valve_gesture_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 617
	oneb !LOWW(_commnunication_flag+0x0000C)
	ret
.BB@LABEL@22_12:	; if_else_bb123
	;***      618 : 		}
	;***      619 : 	}else if(g_uart3_rx_data[0] != 0xff){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 619
	inc a
	skz
.BB@LABEL@22_13:	; if_then_bb129
	;***      620 : 		commnunication_flag.rs485_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 620
	oneb !LOWW(_commnunication_flag+0x0000D)
.BB@LABEL@22_14:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 623
	ret
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      621 : 	}
	;***      622 :     /* End user code. Do not edit comment generated here */
	;***      623 : }
	;***      624 : 
	;***      625 : /***********************************************************************************************************************
	;***      626 : * Function Name: r_uart3_callback_softwareoverrun
	;***      627 : * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      628 : * Arguments    : rx_data -
	;***      629 : *                    receive data
	;***      630 : * Return Value : None
	;***      631 : ***********************************************************************************************************************/
	;***      632 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 632
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      633 : {
	;***      634 :     /* Start user code. Do not edit comment generated here */
	;***      635 :     /* End user code. Do not edit comment generated here */
	;***      636 : }
	;***      637 : 
	;***      638 : /***********************************************************************************************************************
	;***      639 : * Function Name: r_uart3_callback_sendend
	;***      640 : * Description  : This function is a callback function when UART3 finishes transmission.
	;***      641 : * Arguments    : None
	;***      642 : * Return Value : None
	;***      643 : ***********************************************************************************************************************/
	;***      644 : static void r_uart3_callback_sendend(void)
	;***      645 : {
	;***      646 :     /* Start user code. Do not edit comment generated here */
	;***      647 : 	g_uart3_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 647
	inc !LOWW(_g_uart3_sendend)
	;***      648 : 	O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 648
	clr1 0xFFF00.0
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      649 :     /* End user code. Do not edit comment generated here */
	;***      650 : }
	;***      651 : 
	;***      652 : /***********************************************************************************************************************
	;***      653 : * Function Name: r_uart3_callback_error
	;***      654 : * Description  : This function is a callback function when UART3 reception error occurs.
	;***      655 : * Arguments    : err_type -
	;***      656 : *                    error type value
	;***      657 : * Return Value : None
	;***      658 : ***********************************************************************************************************************/
	;***      659 : static void r_uart3_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 659
	ret
	;***      660 : {
	;***      661 :     /* Start user code. Do not edit comment generated here */
	;***      662 :     /* End user code. Do not edit comment generated here */
	;***      663 : }
	;***      664 : 
	;***      665 : /* Start user code for adding. Do not edit comment generated here */
	;***      666 : /* End user code. Do not edit comment generated here */
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
_commnunication_flag:
	.DS (14)
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
