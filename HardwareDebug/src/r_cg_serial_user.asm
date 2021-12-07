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
#@  compiled at Tue Dec 07 17:32:39 2021

	.EXTERN _g_timerSetting
	.EXTERN _rec_buf
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
	.PUBLIC _sendResponse
	.EXTERN _R_UART2_Send
	.PUBLIC _isCommand
	.EXTERN _R_CSI01_Stop
	.EXTERN _R_UART2_Receive
	.EXTERN _R_UART3_Receive

	.SECTION .textf,TEXTF
_sendResponse:
	.STACK _sendResponse = 4
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
	;***       35 : /* End user code. Do not edit comment generated here */
	;***       36 : #include "r_cg_userdefine.h"
	;***       37 : 
	;***       38 : /***********************************************************************************************************************
	;***       39 : Pragma directive
	;***       40 : ***********************************************************************************************************************/
	;***       41 : #pragma interrupt r_uart1_interrupt_send(vect=INTST1)
	;***       42 : #pragma interrupt r_uart1_interrupt_receive(vect=INTSR1)
	;***       43 : #pragma interrupt r_csi00_interrupt(vect=INTCSI00)
	;***       44 : #pragma interrupt r_csi01_interrupt(vect=INTCSI01)
	;***       45 : #pragma interrupt r_uart2_interrupt_send(vect=INTST2)
	;***       46 : #pragma interrupt r_uart2_interrupt_receive(vect=INTSR2)
	;***       47 : #pragma interrupt r_uart3_interrupt_send(vect=INTST3)
	;***       48 : #pragma interrupt r_uart3_interrupt_receive(vect=INTSR3)
	;***       49 : /* Start user code for pragma. Do not edit comment generated here */
	;***       50 : /* End user code. Do not edit comment generated here */
	;***       51 : 
	;***       52 : /***********************************************************************************************************************
	;***       53 : Global variables and functions
	;***       54 : ***********************************************************************************************************************/
	;***       55 : extern volatile uint8_t * gp_uart1_tx_address;         /* uart1 send buffer address */
	;***       56 : extern volatile uint16_t  g_uart1_tx_count;            /* uart1 send data number */
	;***       57 : extern volatile uint8_t * gp_uart1_rx_address;         /* uart1 receive buffer address */
	;***       58 : extern volatile uint16_t  g_uart1_rx_count;            /* uart1 receive data number */
	;***       59 : extern volatile uint16_t  g_uart1_rx_length;           /* uart1 receive data length */
	;***       60 : extern volatile uint8_t * gp_csi00_rx_address;         /* csi00 receive buffer address */
	;***       61 : extern volatile uint16_t  g_csi00_rx_length;           /* csi00 receive data length */
	;***       62 : extern volatile uint16_t  g_csi00_rx_count;            /* csi00 receive data count */
	;***       63 : extern volatile uint8_t * gp_csi00_tx_address;         /* csi00 send buffer address */
	;***       64 : extern volatile uint16_t  g_csi00_send_length;         /* csi00 send data length */
	;***       65 : extern volatile uint16_t  g_csi00_tx_count;            /* csi00 send data count */
	;***       66 : extern volatile uint8_t * gp_csi01_rx_address;         /* csi01 receive buffer address */
	;***       67 : extern volatile uint16_t  g_csi01_rx_length;           /* csi01 receive data length */
	;***       68 : extern volatile uint16_t  g_csi01_rx_count;            /* csi01 receive data count */
	;***       69 : extern volatile uint8_t * gp_csi01_tx_address;         /* csi01 send buffer address */
	;***       70 : extern volatile uint16_t  g_csi01_send_length;         /* csi01 send data length */
	;***       71 : extern volatile uint16_t  g_csi01_tx_count;            /* csi01 send data count */
	;***       72 : extern volatile uint8_t * gp_uart2_tx_address;         /* uart2 send buffer address */
	;***       73 : extern volatile uint16_t  g_uart2_tx_count;            /* uart2 send data number */
	;***       74 : extern volatile uint8_t * gp_uart2_rx_address;         /* uart2 receive buffer address */
	;***       75 : extern volatile uint16_t  g_uart2_rx_count;            /* uart2 receive data number */
	;***       76 : extern volatile uint16_t  g_uart2_rx_length;           /* uart2 receive data length */
	;***       77 : extern volatile uint8_t * gp_uart3_tx_address;         /* uart3 send buffer address */
	;***       78 : extern volatile uint16_t  g_uart3_tx_count;            /* uart3 send data number */
	;***       79 : extern volatile uint8_t * gp_uart3_rx_address;         /* uart3 receive buffer address */
	;***       80 : extern volatile uint16_t  g_uart3_rx_count;            /* uart3 receive data number */
	;***       81 : extern volatile uint16_t  g_uart3_rx_length;           /* uart3 receive data length */
	;***       82 : /* Start user code for global. Do not edit comment generated here */
	;***       83 : volatile uint8_t send_response_flag, send_response_time_flag, send_response_number_flag;
	;***       84 : volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end, g_uart1_send, g_uart2_sendend, g_uart2_receive;
	;***       85 : uint8_t g_rx_data[32];
	;***       86 : volatile uint8_t g_uart2_fault;
	;***       87 : volatile uint8_t g_uart3_sendend;
	;***       88 : void sendResponse(uint8_t *data){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 88
	clrb !LOWW(_g_uart2_sendend)
	;***       89 : 	g_uart2_sendend = 0;
	;***       90 : 	R_UART2_Send(data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 90
	movw bc, #0x0006
	br !!_R_UART2_Send
_isCommand:
	.STACK _isCommand = 4
	;***       91 : }
	;***       92 : uint8_t isCommand(uint8_t *data){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 92
	movw de, ax
	;***       93 : 	switch ((enum UART_header_e)data[0]) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 93
	mov a, [de]
	add a, #0xBF
	bz $.BB@LABEL@2_4
.BB@LABEL@2_1:	; entry
	add a, #0xFE
	bz $.BB@LABEL@2_4
.BB@LABEL@2_2:	; entry
	add a, #0xFE
	bz $.BB@LABEL@2_4
.BB@LABEL@2_3:	; entry
	add a, #0xF3
	cmp a, #0x02
	clrb a
	bnc $.BB@LABEL@2_7
.BB@LABEL@2_4:	; bb17.preheader
	movw ax, de
	call $!_sendResponse
.BB@LABEL@2_5:	; bb17
	;***       94 : 		case H_ALARM:
	;***       95 : 			sendResponse(data);
	;***       96 : 			break;
	;***       97 : 		case H_CLEAR:
	;***       98 : 			sendResponse(data);
	;***       99 : 			break;
	;***      100 : 		case H_ERROR:
	;***      101 : 			sendResponse(data);
	;***      102 : 			break;
	;***      103 : 		case H_READ:
	;***      104 : 			sendResponse(data);
	;***      105 : 			break;
	;***      106 : 		case H_SET:
	;***      107 : 			sendResponse(data);
	;***      108 : 			break;
	;***      109 : 		default:
	;***      110 : 			return 0;
	;***      111 : 	}
	;***      112 : 	while(g_uart2_sendend == 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 112
	cmp0 !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@2_5
.BB@LABEL@2_6:	; bb17.bb24_crit_edge
	oneb a
.BB@LABEL@2_7:	; bb24
	;***      113 : 	return 1;
	;***      114 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 114
	ret
	.SECTION .text,TEXT
_r_uart1_interrupt_receive@1	.vector 0x0026
_r_uart1_interrupt_receive@1:
	.STACK _r_uart1_interrupt_receive@1 = 16
	;***      115 : /* End user code. Do not edit comment generated here */
	;***      116 : 
	;***      117 : /***********************************************************************************************************************
	;***      118 : * Function Name: r_uart1_interrupt_receive
	;***      119 : * Description  : This function is INTSR1 interrupt service routine.
	;***      120 : * Arguments    : None
	;***      121 : * Return Value : None
	;***      122 : ***********************************************************************************************************************/
	;***      123 : static void __near r_uart1_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 123
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      124 : {
	;***      125 :     volatile uint8_t rx_data;
	;***      126 :     volatile uint8_t err_type;
	;***      127 :     
	;***      128 :     err_type = (uint8_t)(SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 128
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      129 :     SIR03 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 129
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      130 : 
	;***      131 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 131
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@3_2
.BB@LABEL@3_1:	; if_then_bb
	;***      132 :     {
	;***      133 :         r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 133
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@3_2:	; if_break_bb
	;***      134 :     }
	;***      135 :     
	;***      136 :     rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 136
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      137 : 
	;***      138 :     if (g_uart1_rx_length > g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 138
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@3_6
.BB@LABEL@3_3:	; if_then_bb18
	;***      139 :     {
	;***      140 :         *gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 140
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      141 :         gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 141
	incw !LOWW(_gp_uart1_rx_address)
	;***      142 :         g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 142
	incw !LOWW(_g_uart1_rx_count)
	;***      143 : 
	;***      144 :         if (g_uart1_rx_length == g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 144
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@3_4:	; if_then_bb30
	;***      145 :         {
	;***      146 :             r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 146
	call !!_r_uart1_callback_receiveend@1
.BB@LABEL@3_5:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 153
	reti
.BB@LABEL@3_6:	; if_else_bb
	;***      147 :         }
	;***      148 :     }
	;***      149 :     else
	;***      150 :     {
	;***      151 :         r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 151
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@3_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      152 :     }
	;***      153 : }
	;***      154 : 
	;***      155 : /***********************************************************************************************************************
	;***      156 : * Function Name: r_uart1_interrupt_send
	;***      157 : * Description  : This function is INTST1 interrupt service routine.
	;***      158 : * Arguments    : None
	;***      159 : * Return Value : None
	;***      160 : ***********************************************************************************************************************/
	;***      161 : static void __near r_uart1_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 161
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      162 : {
	;***      163 :     if (g_uart1_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 163
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@4_3
.BB@LABEL@4_1:	; if_else_bb
	;***      164 :     {
	;***      165 :         TXD1 = *gp_uart1_tx_address;
	;***      166 :         gp_uart1_tx_address++;
	;***      167 :         g_uart1_tx_count--;
	;***      168 :     }
	;***      169 :     else
	;***      170 :     {
	;***      171 :         r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 171
	call !!_r_uart1_callback_sendend@1
.BB@LABEL@4_2:	; if_else_bb
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 173
	reti
.BB@LABEL@4_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 165
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 166
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 167
	decw !LOWW(_g_uart1_tx_count)
	br $.BB@LABEL@4_2
	.SECTION .textf,TEXTF
_r_uart1_callback_receiveend@1:
	.STACK _r_uart1_callback_receiveend@1 = 4
	;***      172 :     }
	;***      173 : }
	;***      174 : 
	;***      175 : /***********************************************************************************************************************
	;***      176 : * Function Name: r_uart1_callback_receiveend
	;***      177 : * Description  : This function is a callback function when UART1 finishes reception.
	;***      178 : * Arguments    : None
	;***      179 : * Return Value : None
	;***      180 : ***********************************************************************************************************************/
	;***      181 : static void r_uart1_callback_receiveend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 181
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      182 : {
	;***      183 :     /* Start user code. Do not edit comment generated here */
	;***      184 :     /* End user code. Do not edit comment generated here */
	;***      185 : }
	;***      186 : 
	;***      187 : /***********************************************************************************************************************
	;***      188 : * Function Name: r_uart1_callback_softwareoverrun
	;***      189 : * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      190 : * Arguments    : rx_data -
	;***      191 : *                    receive data
	;***      192 : * Return Value : None
	;***      193 : ***********************************************************************************************************************/
	;***      194 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 194
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      195 : {
	;***      196 :     /* Start user code. Do not edit comment generated here */
	;***      197 :     /* End user code. Do not edit comment generated here */
	;***      198 : }
	;***      199 : 
	;***      200 : /***********************************************************************************************************************
	;***      201 : * Function Name: r_uart1_callback_sendend
	;***      202 : * Description  : This function is a callback function when UART1 finishes transmission.
	;***      203 : * Arguments    : None
	;***      204 : * Return Value : None
	;***      205 : ***********************************************************************************************************************/
	;***      206 : static void r_uart1_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 206
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      207 : {
	;***      208 :     /* Start user code. Do not edit comment generated here */
	;***      209 :     /* End user code. Do not edit comment generated here */
	;***      210 : }
	;***      211 : 
	;***      212 : /***********************************************************************************************************************
	;***      213 : * Function Name: r_uart1_callback_error
	;***      214 : * Description  : This function is a callback function when UART1 reception error occurs.
	;***      215 : * Arguments    : err_type -
	;***      216 : *                    error type value
	;***      217 : * Return Value : None
	;***      218 : ***********************************************************************************************************************/
	;***      219 : static void r_uart1_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 219
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      220 : {
	;***      221 :     /* Start user code. Do not edit comment generated here */
	;***      222 :     /* End user code. Do not edit comment generated here */
	;***      223 : }
	;***      224 : 
	;***      225 : /***********************************************************************************************************************
	;***      226 : * Function Name: r_csi00_interrupt
	;***      227 : * Description  : This function is INTCSI00 interrupt service routine.
	;***      228 : * Arguments    : None
	;***      229 : * Return Value : None
	;***      230 : ***********************************************************************************************************************/
	;***      231 : static void __near r_csi00_interrupt(void)
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
	;***      232 : {
	;***      233 :     volatile uint8_t err_type;
	;***      234 : 
	;***      235 :     err_type = (uint8_t)(SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 235
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      236 :     SIR00 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 236
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      237 : 
	;***      238 :     if (err_type != 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 238
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@9_2
.BB@LABEL@9_1:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 251
	reti
.BB@LABEL@9_2:	; if_then_bb
	;***      239 :     {
	;***      240 :         if (g_csi00_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 240
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_4
.BB@LABEL@9_3:	; if_else_bb
	;***      241 :         {
	;***      242 :             SIO00 = *gp_csi00_tx_address;
	;***      243 :             gp_csi00_tx_address++;
	;***      244 :             g_csi00_tx_count--;
	;***      245 :         }
	;***      246 :         else
	;***      247 :         {
	;***      248 :             r_csi00_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 248
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@9_1
.BB@LABEL@9_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 242
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 243
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 244
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@9_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      249 :         }
	;***      250 :     }
	;***      251 : }
	;***      252 : 
	;***      253 : /***********************************************************************************************************************
	;***      254 : * Function Name: r_csi00_callback_sendend
	;***      255 : * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      256 : * Arguments    : None
	;***      257 : * Return Value : None
	;***      258 : ***********************************************************************************************************************/
	;***      259 : static void r_csi00_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 259
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      260 : {
	;***      261 :     /* Start user code. Do not edit comment generated here */
	;***      262 :     /* End user code. Do not edit comment generated here */
	;***      263 : }
	;***      264 : 
	;***      265 : /***********************************************************************************************************************
	;***      266 : * Function Name: r_csi01_interrupt
	;***      267 : * Description  : This function is INTCSI01 interrupt service routine.
	;***      268 : * Arguments    : None
	;***      269 : * Return Value : None
	;***      270 : ***********************************************************************************************************************/
	;***      271 : static void __near r_csi01_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 271
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      272 : {
	;***      273 :     volatile uint8_t err_type;
	;***      274 :     volatile uint8_t sio_dummy;
	;***      275 : 
	;***      276 :     err_type = (uint8_t)(SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 276
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      277 :     SIR01 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 277
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      278 : 
	;***      279 :     if (1U == err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 279
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_then_bb
	;***      280 :     {
	;***      281 :         r_csi01_callback_error(err_type);    /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 281
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@11_15
.BB@LABEL@11_2:	; if_else_bb
	;***      282 :     }
	;***      283 :     else
	;***      284 :     {
	;***      285 :         if (g_csi01_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 285
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@11_8
.BB@LABEL@11_3:	; if_else_bb42
	;***      286 :         {
	;***      287 :             if (0U != gp_csi01_rx_address)
	;***      288 :             {
	;***      289 :                 *gp_csi01_rx_address = SIO01;
	;***      290 :                 gp_csi01_rx_address++;
	;***      291 :             }
	;***      292 :             else
	;***      293 :             {
	;***      294 :                 sio_dummy = SIO01;
	;***      295 :             }
	;***      296 : 
	;***      297 :             if (0U != gp_csi01_tx_address)
	;***      298 :             {
	;***      299 :                 SIO01 = *gp_csi01_tx_address;
	;***      300 :                 gp_csi01_tx_address++;
	;***      301 :             }
	;***      302 :             else
	;***      303 :             {
	;***      304 :                 SIO01 = 0xFFU;
	;***      305 :             }
	;***      306 : 
	;***      307 :             g_csi01_tx_count--;
	;***      308 :         }
	;***      309 :         else 
	;***      310 :         {
	;***      311 :             if (0U == g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 311
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@11_7
.BB@LABEL@11_4:	; if_then_bb47
	;***      312 :             {
	;***      313 :                 if (0U != gp_csi01_rx_address)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 313
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@11_6
.BB@LABEL@11_5:	; if_else_bb55
	;***      314 :                 {
	;***      315 :                     *gp_csi01_rx_address = SIO01;
	;***      316 :                 }
	;***      317 :                 else
	;***      318 :                 {
	;***      319 :                     sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 319
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@11_7
.BB@LABEL@11_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 315
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@11_7:	; if_break_bb59
	;***      320 :                 }
	;***      321 :             }
	;***      322 : 
	;***      323 :             r_csi01_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 323
	call !!_r_csi01_callback_sendend@1
	;***      324 :             r_csi01_callback_receiveend();    /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 324
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@11_15
.BB@LABEL@11_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 287
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@11_10
.BB@LABEL@11_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 294
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@11_11
.BB@LABEL@11_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 289
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 290
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@11_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 297
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@11_13
.BB@LABEL@11_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 304
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@11_14
.BB@LABEL@11_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 299
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 300
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@11_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 307
	decw !LOWW(_g_csi01_tx_count)
.BB@LABEL@11_15:	; if_break_bb39
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 327
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      325 :         }
	;***      326 :     }
	;***      327 : }
	;***      328 : 
	;***      329 : /***********************************************************************************************************************
	;***      330 : * Function Name: r_csi01_callback_receiveend
	;***      331 : * Description  : This function is a callback function when CSI01 finishes reception.
	;***      332 : * Arguments    : None
	;***      333 : * Return Value : None
	;***      334 : ***********************************************************************************************************************/
	;***      335 : static void r_csi01_callback_receiveend(void)
	;***      336 : {
	;***      337 :     /* Start user code. Do not edit comment generated here */
	;***      338 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 338
	inc !LOWW(_g_csi_rev_end)
	;***      339 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 339
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      340 :     /* End user code. Do not edit comment generated here */
	;***      341 : }
	;***      342 : 
	;***      343 : /***********************************************************************************************************************
	;***      344 : * Function Name: r_csi01_callback_error
	;***      345 : * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      346 : * Arguments    : err_type -
	;***      347 : *                    error type value
	;***      348 : * Return Value : None
	;***      349 : ***********************************************************************************************************************/
	;***      350 : static void r_csi01_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 350
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      351 : {
	;***      352 :     /* Start user code. Do not edit comment generated here */
	;***      353 : 
	;***      354 :     /* End user code. Do not edit comment generated here */
	;***      355 : }
	;***      356 : 
	;***      357 : /***********************************************************************************************************************
	;***      358 : * Function Name: r_csi01_callback_sendend
	;***      359 : * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      360 : * Arguments    : None
	;***      361 : * Return Value : None
	;***      362 : ***********************************************************************************************************************/
	;***      363 : static void r_csi01_callback_sendend(void)
	;***      364 : {
	;***      365 :     /* Start user code. Do not edit comment generated here */
	;***      366 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 366
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      367 :     /* End user code. Do not edit comment generated here */
	;***      368 : }
	;***      369 : 
	;***      370 : /***********************************************************************************************************************
	;***      371 : * Function Name: r_uart2_interrupt_receive
	;***      372 : * Description  : This function is INTSR2 interrupt service routine.
	;***      373 : * Arguments    : None
	;***      374 : * Return Value : None
	;***      375 : ***********************************************************************************************************************/
	;***      376 : static void __near r_uart2_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 376
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      377 : {
	;***      378 :     volatile uint8_t rx_data;
	;***      379 :     volatile uint8_t err_type;
	;***      380 :     
	;***      381 :     err_type = (uint8_t)(SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 381
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      382 :     SIR11 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 382
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      383 : 
	;***      384 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 384
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@15_2
.BB@LABEL@15_1:	; if_then_bb
	;***      385 :     {
	;***      386 :         r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 386
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@15_2:	; if_break_bb
	;***      387 :     }
	;***      388 :     
	;***      389 :     rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 389
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      390 : 
	;***      391 :     if (g_uart2_rx_length > g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 391
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@15_6
.BB@LABEL@15_3:	; if_then_bb18
	;***      392 :     {
	;***      393 :         *gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 393
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      394 :         gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 394
	incw !LOWW(_gp_uart2_rx_address)
	;***      395 :         g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 395
	incw !LOWW(_g_uart2_rx_count)
	;***      396 : 
	;***      397 :         if (g_uart2_rx_length == g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 397
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@15_4:	; if_then_bb30
	;***      398 :         {
	;***      399 :             r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 399
	call !!_r_uart2_callback_receiveend@1
.BB@LABEL@15_5:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 406
	reti
.BB@LABEL@15_6:	; if_else_bb
	;***      400 :         }
	;***      401 :     }
	;***      402 :     else
	;***      403 :     {
	;***      404 :         r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 404
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@15_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      405 :     }
	;***      406 : }
	;***      407 : 
	;***      408 : /***********************************************************************************************************************
	;***      409 : * Function Name: r_uart2_interrupt_send
	;***      410 : * Description  : This function is INTST2 interrupt service routine.
	;***      411 : * Arguments    : None
	;***      412 : * Return Value : None
	;***      413 : ***********************************************************************************************************************/
	;***      414 : static void __near r_uart2_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 414
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      415 : {
	;***      416 :     if (g_uart2_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 416
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@16_3
.BB@LABEL@16_1:	; if_else_bb
	;***      417 :     {
	;***      418 :         TXD2 = *gp_uart2_tx_address;
	;***      419 :         gp_uart2_tx_address++;
	;***      420 :         g_uart2_tx_count--;
	;***      421 :     }
	;***      422 :     else
	;***      423 :     {
	;***      424 :         r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 424
	call !!_r_uart2_callback_sendend@1
.BB@LABEL@16_2:	; if_else_bb
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 426
	reti
.BB@LABEL@16_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 418
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 419
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 420
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@16_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 4
	;***      425 :     }
	;***      426 : }
	;***      427 : 
	;***      428 : /***********************************************************************************************************************
	;***      429 : * Function Name: r_uart2_callback_receiveend
	;***      430 : * Description  : This function is a callback function when UART2 finishes reception.
	;***      431 : * Arguments    : None
	;***      432 : * Return Value : None
	;***      433 : ***********************************************************************************************************************/
	;***      434 : static void r_uart2_callback_receiveend(void)
	;***      435 : {
	;***      436 :     /* Start user code. Do not edit comment generated here */
	;***      437 : //	R_UART2_Receive(g_rx_data, 32);
	;***      438 : //	R_UART2_Stop();
	;***      439 : //	R_UART2_Start();
	;***      440 : 
	;***      441 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 441
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      442 : 	send_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 442
	oneb !LOWW(_send_response_flag)
	;***      443 : //	isCommand(g_rx_data);
	;***      444 : 	if(1){
	;***      445 : 		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 445
	clrb !LOWW(_g_uart2_fault)
	;***      446 : 		if((g_rx_data[0] == H_READ)&(g_rx_data[1] == READ_TIME)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 446
	cmp !LOWW(_g_rx_data+0x00001), #0x02
	mov a, !LOWW(_g_rx_data)
	bnz $.BB@LABEL@17_5
.BB@LABEL@17_1:	; entry
	cmp a, #0x52
	bnz $.BB@LABEL@17_5
.BB@LABEL@17_2:	; if_then_bb12
	;***      447 : 			send_response_time_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 447
	oneb !LOWW(_send_response_time_flag)
	onew ax
	;***      448 : 			g_timerSetting.t51++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 448
	addw ax, !LOWW(_g_timerSetting+0x00024)
	movw !LOWW(_g_timerSetting+0x00024), ax
	clrw ax
	sknc
.BB@LABEL@17_3:	; if_then_bb12
	incw ax
.BB@LABEL@17_4:	; if_then_bb12
	addw ax, !LOWW(_g_timerSetting+0x00026)
	movw !LOWW(_g_timerSetting+0x00026), ax
.BB@LABEL@17_5:	; if_break_bb16
	;***      449 : 		}
	;***      450 : //		if((g_rx_data[0] == H_SET)&(g_rx_data[1] == READ_NUMBER)){
	;***      451 : //			R_UART2_Receive(g_rx_data, sizeof(struct Number_Setting_s)-1);
	;***      452 : //		}else if((g_rx_data[0] == H_SET)&(g_rx_data[1] == READ_TIME)){
	;***      453 : //			R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
	;***      454 : //		}else if((g_rx_data[0] == H_READ)&(g_rx_data[1] == READ_TIME)){
	;***      455 : //			g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, 68);
	;***      456 : //			R_UART2_Send((uint8_t *)&g_timerSetting, 69);
	;***      457 : //			g_timerSetting.t51++;
	;***      458 : //		}
	;***      459 : 	}else{
	;***      460 : 		R_UART2_Receive(g_rx_data, 6);
	;***      461 : 		g_uart2_fault = 1;
	;***      462 : 	}
	;***      463 : ////	if((g_rx_data[0] == H_READ)|(g_rx_data[0] == H_SET)|(g_rx_data[0] == H_ALARM)|(g_rx_data[0] == H_CLEAR)|(g_rx_data[0] == H_ERROR)){
	;***      464 : ////
	;***      465 : ////	}else{
	;***      466 : ////	}
	;***      467 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 467
	inc !LOWW(_g_uart2_receive)
	ret
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      468 :     /* End user code. Do not edit comment generated here */
	;***      469 : }
	;***      470 : 
	;***      471 : /***********************************************************************************************************************
	;***      472 : * Function Name: r_uart2_callback_softwareoverrun
	;***      473 : * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      474 : * Arguments    : rx_data -
	;***      475 : *                    receive data
	;***      476 : * Return Value : None
	;***      477 : ***********************************************************************************************************************/
	;***      478 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 478
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      479 : {
	;***      480 :     /* Start user code. Do not edit comment generated here */
	;***      481 :     /* End user code. Do not edit comment generated here */
	;***      482 : }
	;***      483 : 
	;***      484 : /***********************************************************************************************************************
	;***      485 : * Function Name: r_uart2_callback_sendend
	;***      486 : * Description  : This function is a callback function when UART2 finishes transmission.
	;***      487 : * Arguments    : None
	;***      488 : * Return Value : None
	;***      489 : ***********************************************************************************************************************/
	;***      490 : static void r_uart2_callback_sendend(void)
	;***      491 : {
	;***      492 :     /* Start user code. Do not edit comment generated here */
	;***      493 : 	g_uart2_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 493
	inc !LOWW(_g_uart2_sendend)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      494 :     /* End user code. Do not edit comment generated here */
	;***      495 : }
	;***      496 : 
	;***      497 : /***********************************************************************************************************************
	;***      498 : * Function Name: r_uart2_callback_error
	;***      499 : * Description  : This function is a callback function when UART2 reception error occurs.
	;***      500 : * Arguments    : err_type -
	;***      501 : *                    error type value
	;***      502 : * Return Value : None
	;***      503 : ***********************************************************************************************************************/
	;***      504 : static void r_uart2_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 504
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      505 : {
	;***      506 :     /* Start user code. Do not edit comment generated here */
	;***      507 :     /* End user code. Do not edit comment generated here */
	;***      508 : }
	;***      509 : 
	;***      510 : /***********************************************************************************************************************
	;***      511 : * Function Name: r_uart3_interrupt_receive
	;***      512 : * Description  : This function is INTSR3 interrupt service routine.
	;***      513 : * Arguments    : None
	;***      514 : * Return Value : None
	;***      515 : ***********************************************************************************************************************/
	;***      516 : static void __near r_uart3_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 516
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      517 : {
	;***      518 :     volatile uint8_t rx_data;
	;***      519 :     volatile uint8_t err_type;
	;***      520 :     
	;***      521 :     err_type = (uint8_t)(SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 521
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      522 :     SIR13 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 522
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      523 : 
	;***      524 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 524
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@21_2
.BB@LABEL@21_1:	; if_then_bb
	;***      525 :     {
	;***      526 :         r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 526
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@21_2:	; if_break_bb
	;***      527 :     }
	;***      528 :     
	;***      529 :     rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 529
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      530 : 
	;***      531 :     if (g_uart3_rx_length > g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 531
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@21_6
.BB@LABEL@21_3:	; if_then_bb18
	;***      532 :     {
	;***      533 :         *gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 533
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      534 :         gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 534
	incw !LOWW(_gp_uart3_rx_address)
	;***      535 :         g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 535
	incw !LOWW(_g_uart3_rx_count)
	;***      536 : 
	;***      537 :         if (g_uart3_rx_length == g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 537
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@21_4:	; if_then_bb30
	;***      538 :         {
	;***      539 :             r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 539
	call !!_r_uart3_callback_receiveend@1
.BB@LABEL@21_5:	; return
	pop hl
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 546
	reti
.BB@LABEL@21_6:	; if_else_bb
	;***      540 :         }
	;***      541 :     }
	;***      542 :     else
	;***      543 :     {
	;***      544 :         r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 544
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@21_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      545 :     }
	;***      546 : }
	;***      547 : 
	;***      548 : /***********************************************************************************************************************
	;***      549 : * Function Name: r_uart3_interrupt_send
	;***      550 : * Description  : This function is INTST3 interrupt service routine.
	;***      551 : * Arguments    : None
	;***      552 : * Return Value : None
	;***      553 : ***********************************************************************************************************************/
	;***      554 : static void __near r_uart3_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 554
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      555 : {
	;***      556 :     if (g_uart3_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 556
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@22_3
.BB@LABEL@22_1:	; if_else_bb
	;***      557 :     {
	;***      558 :         TXD3 = *gp_uart3_tx_address;
	;***      559 :         gp_uart3_tx_address++;
	;***      560 :         g_uart3_tx_count--;
	;***      561 :     }
	;***      562 :     else
	;***      563 :     {
	;***      564 :         r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 564
	call !!_r_uart3_callback_sendend@1
.BB@LABEL@22_2:	; if_else_bb
	pop ax
	mov cs, a
	mov a, x
	mov es, a
	pop hl
	pop de
	pop bc
	pop ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 566
	reti
.BB@LABEL@22_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 558
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 559
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 560
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@22_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      565 :     }
	;***      566 : }
	;***      567 : 
	;***      568 : /***********************************************************************************************************************
	;***      569 : * Function Name: r_uart3_callback_receiveend
	;***      570 : * Description  : This function is a callback function when UART3 finishes reception.
	;***      571 : * Arguments    : None
	;***      572 : * Return Value : None
	;***      573 : ***********************************************************************************************************************/
	;***      574 : static void r_uart3_callback_receiveend(void)
	;***      575 : {
	;***      576 :     /* Start user code. Do not edit comment generated here */
	;***      577 : 	R_UART3_Receive(rec_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 577
	movw bc, #0x0007
	movw ax, #LOWW(_rec_buf)
	br !!_R_UART3_Receive
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      578 :     /* End user code. Do not edit comment generated here */
	;***      579 : }
	;***      580 : 
	;***      581 : /***********************************************************************************************************************
	;***      582 : * Function Name: r_uart3_callback_softwareoverrun
	;***      583 : * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      584 : * Arguments    : rx_data -
	;***      585 : *                    receive data
	;***      586 : * Return Value : None
	;***      587 : ***********************************************************************************************************************/
	;***      588 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 588
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      589 : {
	;***      590 :     /* Start user code. Do not edit comment generated here */
	;***      591 :     /* End user code. Do not edit comment generated here */
	;***      592 : }
	;***      593 : 
	;***      594 : /***********************************************************************************************************************
	;***      595 : * Function Name: r_uart3_callback_sendend
	;***      596 : * Description  : This function is a callback function when UART3 finishes transmission.
	;***      597 : * Arguments    : None
	;***      598 : * Return Value : None
	;***      599 : ***********************************************************************************************************************/
	;***      600 : static void r_uart3_callback_sendend(void)
	;***      601 : {
	;***      602 :     /* Start user code. Do not edit comment generated here */
	;***      603 : 	g_uart3_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 603
	inc !LOWW(_g_uart3_sendend)
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      604 :     /* End user code. Do not edit comment generated here */
	;***      605 : }
	;***      606 : 
	;***      607 : /***********************************************************************************************************************
	;***      608 : * Function Name: r_uart3_callback_error
	;***      609 : * Description  : This function is a callback function when UART3 reception error occurs.
	;***      610 : * Arguments    : err_type -
	;***      611 : *                    error type value
	;***      612 : * Return Value : None
	;***      613 : ***********************************************************************************************************************/
	;***      614 : static void r_uart3_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 614
	ret
	;***      615 : {
	;***      616 :     /* Start user code. Do not edit comment generated here */
	;***      617 :     /* End user code. Do not edit comment generated here */
	;***      618 : }
	;***      619 : 
	;***      620 : /* Start user code for adding. Do not edit comment generated here */
	;***      621 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
_send_response_flag:
	.DS (1)
_send_response_time_flag:
	.DS (1)
_send_response_number_flag:
	.DS (1)
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
	.DS (32)
_g_uart2_fault:
	.DS (1)
_g_uart3_sendend:
	.DS (1)
