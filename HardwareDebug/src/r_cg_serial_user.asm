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
#@  compiled at Mon Dec 27 14:01:38 2021

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
	.PUBLIC _isCommand
	.EXTERN _R_CSI01_Stop
	.EXTERN _R_UART2_Receive
	.EXTERN _R_UART3_Receive

	.SECTION .textf,TEXTF
_isCommand:
	.STACK _isCommand = 4
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
	;***       93 : uint8_t isCommand(uint8_t *data){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 93
	movw de, ax
	;***       94 : 	if((data[0] == H_SET)&&(data[1] == NEXT_ANIMATION))
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
	;***       96 : 	switch ((enum UART_header_e)*data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 96
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 116
	ret
.BB@LABEL@1_7:	; bb30
	;***       97 : //		case H_ALARM:
	;***       98 : //			commnunication_flag.send_response_flag = 1;
	;***       99 : //			break;
	;***      100 : 		case H_CLEAR:
	;***      101 : 			commnunication_flag.send_response_flag = 1;
	;***      102 : 			break;
	;***      103 : 		case H_ERROR:
	;***      104 : 			commnunication_flag.send_response_flag = 1;
	;***      105 : 			break;
	;***      106 : 		case H_READ:
	;***      107 : 			commnunication_flag.send_response_flag = 1;
	;***      108 : 			break;
	;***      109 : 		case H_SET:
	;***      110 : 			commnunication_flag.send_response_flag = 1;
	;***      111 : 			break;
	;***      112 : 		default:
	;***      113 : 			return 0;
	;***      114 : 	}
	;***      115 : 	return 1;
	;***      116 : }
	clrb a
	ret
	.SECTION .text,TEXT
_r_uart1_interrupt_receive@1	.vector 0x0026
_r_uart1_interrupt_receive@1:
	.STACK _r_uart1_interrupt_receive@1 = 16
	;***      117 : /* End user code. Do not edit comment generated here */
	;***      118 : 
	;***      119 : /***********************************************************************************************************************
	;***      120 : * Function Name: r_uart1_interrupt_receive
	;***      121 : * Description  : This function is INTSR1 interrupt service routine.
	;***      122 : * Arguments    : None
	;***      123 : * Return Value : None
	;***      124 : ***********************************************************************************************************************/
	;***      125 : static void __near r_uart1_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 125
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      126 : {
	;***      127 :     volatile uint8_t rx_data;
	;***      128 :     volatile uint8_t err_type;
	;***      129 :     
	;***      130 :     err_type = (uint8_t)(SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 130
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      131 :     SIR03 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 131
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      132 : 
	;***      133 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 133
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; if_then_bb
	;***      134 :     {
	;***      135 :         r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 135
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@2_2:	; if_break_bb
	;***      136 :     }
	;***      137 :     
	;***      138 :     rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 138
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      139 : 
	;***      140 :     if (g_uart1_rx_length > g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 140
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@2_6
.BB@LABEL@2_3:	; if_then_bb18
	;***      141 :     {
	;***      142 :         *gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 142
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      143 :         gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 143
	incw !LOWW(_gp_uart1_rx_address)
	;***      144 :         g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 144
	incw !LOWW(_g_uart1_rx_count)
	;***      145 : 
	;***      146 :         if (g_uart1_rx_length == g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 146
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@2_4:	; if_then_bb30
	;***      147 :         {
	;***      148 :             r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 148
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 155
	reti
.BB@LABEL@2_6:	; if_else_bb
	;***      149 :         }
	;***      150 :     }
	;***      151 :     else
	;***      152 :     {
	;***      153 :         r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 153
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@2_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      154 :     }
	;***      155 : }
	;***      156 : 
	;***      157 : /***********************************************************************************************************************
	;***      158 : * Function Name: r_uart1_interrupt_send
	;***      159 : * Description  : This function is INTST1 interrupt service routine.
	;***      160 : * Arguments    : None
	;***      161 : * Return Value : None
	;***      162 : ***********************************************************************************************************************/
	;***      163 : static void __near r_uart1_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 163
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      164 : {
	;***      165 :     if (g_uart1_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 165
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@3_3
.BB@LABEL@3_1:	; if_else_bb
	;***      166 :     {
	;***      167 :         TXD1 = *gp_uart1_tx_address;
	;***      168 :         gp_uart1_tx_address++;
	;***      169 :         g_uart1_tx_count--;
	;***      170 :     }
	;***      171 :     else
	;***      172 :     {
	;***      173 :         r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 173
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 175
	reti
.BB@LABEL@3_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 167
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 168
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 169
	decw !LOWW(_g_uart1_tx_count)
	br $.BB@LABEL@3_2
	.SECTION .textf,TEXTF
_r_uart1_callback_receiveend@1:
	.STACK _r_uart1_callback_receiveend@1 = 4
	;***      174 :     }
	;***      175 : }
	;***      176 : 
	;***      177 : /***********************************************************************************************************************
	;***      178 : * Function Name: r_uart1_callback_receiveend
	;***      179 : * Description  : This function is a callback function when UART1 finishes reception.
	;***      180 : * Arguments    : None
	;***      181 : * Return Value : None
	;***      182 : ***********************************************************************************************************************/
	;***      183 : static void r_uart1_callback_receiveend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 183
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      184 : {
	;***      185 :     /* Start user code. Do not edit comment generated here */
	;***      186 :     /* End user code. Do not edit comment generated here */
	;***      187 : }
	;***      188 : 
	;***      189 : /***********************************************************************************************************************
	;***      190 : * Function Name: r_uart1_callback_softwareoverrun
	;***      191 : * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      192 : * Arguments    : rx_data -
	;***      193 : *                    receive data
	;***      194 : * Return Value : None
	;***      195 : ***********************************************************************************************************************/
	;***      196 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 196
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      197 : {
	;***      198 :     /* Start user code. Do not edit comment generated here */
	;***      199 :     /* End user code. Do not edit comment generated here */
	;***      200 : }
	;***      201 : 
	;***      202 : /***********************************************************************************************************************
	;***      203 : * Function Name: r_uart1_callback_sendend
	;***      204 : * Description  : This function is a callback function when UART1 finishes transmission.
	;***      205 : * Arguments    : None
	;***      206 : * Return Value : None
	;***      207 : ***********************************************************************************************************************/
	;***      208 : static void r_uart1_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 208
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      209 : {
	;***      210 :     /* Start user code. Do not edit comment generated here */
	;***      211 :     /* End user code. Do not edit comment generated here */
	;***      212 : }
	;***      213 : 
	;***      214 : /***********************************************************************************************************************
	;***      215 : * Function Name: r_uart1_callback_error
	;***      216 : * Description  : This function is a callback function when UART1 reception error occurs.
	;***      217 : * Arguments    : err_type -
	;***      218 : *                    error type value
	;***      219 : * Return Value : None
	;***      220 : ***********************************************************************************************************************/
	;***      221 : static void r_uart1_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 221
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      222 : {
	;***      223 :     /* Start user code. Do not edit comment generated here */
	;***      224 :     /* End user code. Do not edit comment generated here */
	;***      225 : }
	;***      226 : 
	;***      227 : /***********************************************************************************************************************
	;***      228 : * Function Name: r_csi00_interrupt
	;***      229 : * Description  : This function is INTCSI00 interrupt service routine.
	;***      230 : * Arguments    : None
	;***      231 : * Return Value : None
	;***      232 : ***********************************************************************************************************************/
	;***      233 : static void __near r_csi00_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 233
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      234 : {
	;***      235 :     volatile uint8_t err_type;
	;***      236 : 
	;***      237 :     err_type = (uint8_t)(SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 237
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      238 :     SIR00 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 238
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      239 : 
	;***      240 :     if (err_type != 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 240
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 253
	reti
.BB@LABEL@8_2:	; if_then_bb
	;***      241 :     {
	;***      242 :         if (g_csi00_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 242
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_3:	; if_else_bb
	;***      243 :         {
	;***      244 :             SIO00 = *gp_csi00_tx_address;
	;***      245 :             gp_csi00_tx_address++;
	;***      246 :             g_csi00_tx_count--;
	;***      247 :         }
	;***      248 :         else
	;***      249 :         {
	;***      250 :             r_csi00_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 250
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@8_1
.BB@LABEL@8_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 244
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 245
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 246
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@8_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      251 :         }
	;***      252 :     }
	;***      253 : }
	;***      254 : 
	;***      255 : /***********************************************************************************************************************
	;***      256 : * Function Name: r_csi00_callback_sendend
	;***      257 : * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      258 : * Arguments    : None
	;***      259 : * Return Value : None
	;***      260 : ***********************************************************************************************************************/
	;***      261 : static void r_csi00_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 261
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      262 : {
	;***      263 :     /* Start user code. Do not edit comment generated here */
	;***      264 :     /* End user code. Do not edit comment generated here */
	;***      265 : }
	;***      266 : 
	;***      267 : /***********************************************************************************************************************
	;***      268 : * Function Name: r_csi01_interrupt
	;***      269 : * Description  : This function is INTCSI01 interrupt service routine.
	;***      270 : * Arguments    : None
	;***      271 : * Return Value : None
	;***      272 : ***********************************************************************************************************************/
	;***      273 : static void __near r_csi01_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 273
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      274 : {
	;***      275 :     volatile uint8_t err_type;
	;***      276 :     volatile uint8_t sio_dummy;
	;***      277 : 
	;***      278 :     err_type = (uint8_t)(SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 278
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      279 :     SIR01 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 279
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      280 : 
	;***      281 :     if (1U == err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 281
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@10_2
.BB@LABEL@10_1:	; if_then_bb
	;***      282 :     {
	;***      283 :         r_csi01_callback_error(err_type);    /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 283
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_2:	; if_else_bb
	;***      284 :     }
	;***      285 :     else
	;***      286 :     {
	;***      287 :         if (g_csi01_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 287
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@10_8
.BB@LABEL@10_3:	; if_else_bb42
	;***      288 :         {
	;***      289 :             if (0U != gp_csi01_rx_address)
	;***      290 :             {
	;***      291 :                 *gp_csi01_rx_address = SIO01;
	;***      292 :                 gp_csi01_rx_address++;
	;***      293 :             }
	;***      294 :             else
	;***      295 :             {
	;***      296 :                 sio_dummy = SIO01;
	;***      297 :             }
	;***      298 : 
	;***      299 :             if (0U != gp_csi01_tx_address)
	;***      300 :             {
	;***      301 :                 SIO01 = *gp_csi01_tx_address;
	;***      302 :                 gp_csi01_tx_address++;
	;***      303 :             }
	;***      304 :             else
	;***      305 :             {
	;***      306 :                 SIO01 = 0xFFU;
	;***      307 :             }
	;***      308 : 
	;***      309 :             g_csi01_tx_count--;
	;***      310 :         }
	;***      311 :         else 
	;***      312 :         {
	;***      313 :             if (0U == g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 313
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@10_7
.BB@LABEL@10_4:	; if_then_bb47
	;***      314 :             {
	;***      315 :                 if (0U != gp_csi01_rx_address)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 315
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_6
.BB@LABEL@10_5:	; if_else_bb55
	;***      316 :                 {
	;***      317 :                     *gp_csi01_rx_address = SIO01;
	;***      318 :                 }
	;***      319 :                 else
	;***      320 :                 {
	;***      321 :                     sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 321
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_7
.BB@LABEL@10_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 317
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@10_7:	; if_break_bb59
	;***      322 :                 }
	;***      323 :             }
	;***      324 : 
	;***      325 :             r_csi01_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 325
	call !!_r_csi01_callback_sendend@1
	;***      326 :             r_csi01_callback_receiveend();    /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 326
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 289
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_10
.BB@LABEL@10_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 296
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_11
.BB@LABEL@10_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 291
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 292
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@10_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 299
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_13
.BB@LABEL@10_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 306
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@10_14
.BB@LABEL@10_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 301
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 302
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@10_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 309
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 329
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      327 :         }
	;***      328 :     }
	;***      329 : }
	;***      330 : 
	;***      331 : /***********************************************************************************************************************
	;***      332 : * Function Name: r_csi01_callback_receiveend
	;***      333 : * Description  : This function is a callback function when CSI01 finishes reception.
	;***      334 : * Arguments    : None
	;***      335 : * Return Value : None
	;***      336 : ***********************************************************************************************************************/
	;***      337 : static void r_csi01_callback_receiveend(void)
	;***      338 : {
	;***      339 :     /* Start user code. Do not edit comment generated here */
	;***      340 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 340
	inc !LOWW(_g_csi_rev_end)
	;***      341 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 341
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      342 :     /* End user code. Do not edit comment generated here */
	;***      343 : }
	;***      344 : 
	;***      345 : /***********************************************************************************************************************
	;***      346 : * Function Name: r_csi01_callback_error
	;***      347 : * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      348 : * Arguments    : err_type -
	;***      349 : *                    error type value
	;***      350 : * Return Value : None
	;***      351 : ***********************************************************************************************************************/
	;***      352 : static void r_csi01_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 352
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      353 : {
	;***      354 :     /* Start user code. Do not edit comment generated here */
	;***      355 : 
	;***      356 :     /* End user code. Do not edit comment generated here */
	;***      357 : }
	;***      358 : 
	;***      359 : /***********************************************************************************************************************
	;***      360 : * Function Name: r_csi01_callback_sendend
	;***      361 : * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      362 : * Arguments    : None
	;***      363 : * Return Value : None
	;***      364 : ***********************************************************************************************************************/
	;***      365 : static void r_csi01_callback_sendend(void)
	;***      366 : {
	;***      367 :     /* Start user code. Do not edit comment generated here */
	;***      368 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 368
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      369 :     /* End user code. Do not edit comment generated here */
	;***      370 : }
	;***      371 : 
	;***      372 : /***********************************************************************************************************************
	;***      373 : * Function Name: r_uart2_interrupt_receive
	;***      374 : * Description  : This function is INTSR2 interrupt service routine.
	;***      375 : * Arguments    : None
	;***      376 : * Return Value : None
	;***      377 : ***********************************************************************************************************************/
	;***      378 : static void __near r_uart2_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 378
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      379 : {
	;***      380 :     volatile uint8_t rx_data;
	;***      381 :     volatile uint8_t err_type;
	;***      382 :     
	;***      383 :     err_type = (uint8_t)(SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 383
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      384 :     SIR11 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 384
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      385 : 
	;***      386 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 386
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@14_2
.BB@LABEL@14_1:	; if_then_bb
	;***      387 :     {
	;***      388 :         r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 388
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@14_2:	; if_break_bb
	;***      389 :     }
	;***      390 :     
	;***      391 :     rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 391
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      392 : 
	;***      393 :     if (g_uart2_rx_length > g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 393
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@14_6
.BB@LABEL@14_3:	; if_then_bb18
	;***      394 :     {
	;***      395 :         *gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 395
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      396 :         gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 396
	incw !LOWW(_gp_uart2_rx_address)
	;***      397 :         g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 397
	incw !LOWW(_g_uart2_rx_count)
	;***      398 : 
	;***      399 :         if (g_uart2_rx_length == g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 399
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@14_4:	; if_then_bb30
	;***      400 :         {
	;***      401 :             r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 401
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 408
	reti
.BB@LABEL@14_6:	; if_else_bb
	;***      402 :         }
	;***      403 :     }
	;***      404 :     else
	;***      405 :     {
	;***      406 :         r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 406
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@14_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      407 :     }
	;***      408 : }
	;***      409 : 
	;***      410 : /***********************************************************************************************************************
	;***      411 : * Function Name: r_uart2_interrupt_send
	;***      412 : * Description  : This function is INTST2 interrupt service routine.
	;***      413 : * Arguments    : None
	;***      414 : * Return Value : None
	;***      415 : ***********************************************************************************************************************/
	;***      416 : static void __near r_uart2_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 416
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      417 : {
	;***      418 :     if (g_uart2_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 418
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@15_3
.BB@LABEL@15_1:	; if_else_bb
	;***      419 :     {
	;***      420 :         TXD2 = *gp_uart2_tx_address;
	;***      421 :         gp_uart2_tx_address++;
	;***      422 :         g_uart2_tx_count--;
	;***      423 :     }
	;***      424 :     else
	;***      425 :     {
	;***      426 :         r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 426
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 428
	reti
.BB@LABEL@15_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 420
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 421
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 422
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@15_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 4
	;***      427 :     }
	;***      428 : }
	;***      429 : 
	;***      430 : /***********************************************************************************************************************
	;***      431 : * Function Name: r_uart2_callback_receiveend
	;***      432 : * Description  : This function is a callback function when UART2 finishes reception.
	;***      433 : * Arguments    : None
	;***      434 : * Return Value : None
	;***      435 : ***********************************************************************************************************************/
	;***      436 : static void r_uart2_callback_receiveend(void)
	;***      437 : {
	;***      438 :     /* Start user code. Do not edit comment generated here */
	;***      439 : //	R_UART2_Receive(g_rx_data, 32);
	;***      440 : //	R_UART2_Stop();
	;***      441 : //	R_UART2_Start();
	;***      442 : 
	;***      443 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 443
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      444 : 	commnunication_flag.recived_time_setting_flag = commnunication_flag.recived_time_setting_flag == 1 ? 2: commnunication_flag.recived_time_setting_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 444
	cmp !LOWW(_commnunication_flag+0x00004), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_1:	; bb5
	mov a, !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@16_2:	; bb8
	mov !LOWW(_commnunication_flag+0x00004), a
	;***      445 : 	commnunication_flag.recived_number_setting_flag = commnunication_flag.recived_number_setting_flag == 1 ? 2: commnunication_flag.recived_number_setting_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 445
	cmp !LOWW(_commnunication_flag+0x00003), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_3:	; bb16
	mov a, !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@16_4:	; bb20
	mov !LOWW(_commnunication_flag+0x00003), a
	;***      446 : 	if(isCommand(g_rx_data)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 446
	movw ax, #LOWW(_g_rx_data)
	call $!_isCommand
	cmp0 a
	bnz $.BB@LABEL@16_9
.BB@LABEL@16_5:	; if_else_bb162
	;***      447 : 		if((g_rx_data[0] == H_READ)&&(g_rx_data[1] == READ_TIME)){
	;***      448 : 			commnunication_flag.send_response_time_flag = 1;
	;***      449 : 		}else if((g_rx_data[0] == H_SET)&&(g_rx_data[1] == SAVE_TIME)){
	;***      450 : 			R_UART2_Receive(g_rx_data, timeSettingSize);
	;***      451 : 			commnunication_flag.recived_time_setting_flag = 1;
	;***      452 : 		}else if((g_rx_data[0] == H_READ)&&(g_rx_data[1] == READ_MACHINE_STATUS)){
	;***      453 : 			commnunication_flag.send_respone_status_flag = 1;
	;***      454 : 		}else if((g_rx_data[0] == H_READ)&&(g_rx_data[1] == READ_NUMBER)){
	;***      455 : 			commnunication_flag.send_response_number_flag = 1;
	;***      456 : 		}else if((g_rx_data[0] == H_SET)&&(g_rx_data[1] == SAVE_NUMBER)){
	;***      457 : 			R_UART2_Receive(g_rx_data, numberSettingSize);
	;***      458 : 			commnunication_flag.recived_number_setting_flag = 1;
	;***      459 : 		}else if((g_rx_data[0] == H_READ)&&(g_rx_data[1] == WASHING_MODE)){
	;***      460 : 			commnunication_flag.send_response_mode_flag = 1;
	;***      461 : //			commnunication_flag.send_response_flag = 0;
	;***      462 : 		}else if((g_rx_data[0] == H_CLEAR)){
	;***      463 : 			commnunication_flag.alarm_clear_flag = g_rx_data[1];
	;***      464 : 		}
	;***      465 : 	}else if(commnunication_flag.recived_time_setting_flag != 0 || commnunication_flag.recived_number_setting_flag != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 465
	cmp0 !LOWW(_commnunication_flag+0x00004)
	bnz $.BB@LABEL@16_8
.BB@LABEL@16_6:	; bb167
	cmp0 !LOWW(_commnunication_flag+0x00003)
	bnz $.BB@LABEL@16_8
.BB@LABEL@16_7:	; if_else_bb182
	;***      466 : 		R_UART2_Receive(g_rx_data, 6);
	;***      467 : 	}else{
	;***      468 : 		g_uart2_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 468
	oneb !LOWW(_g_uart2_fault)
	br $.BB@LABEL@16_20
.BB@LABEL@16_8:	; if_then_bb180
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 466
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	br $.BB@LABEL@16_24
.BB@LABEL@16_9:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 447
	mov a, !LOWW(_g_rx_data)
	cmp a, #0x52
	bnz $.BB@LABEL@16_12
.BB@LABEL@16_10:	; bb33
	cmp !LOWW(_g_rx_data+0x00001), #0x02
	bnz $.BB@LABEL@16_12
.BB@LABEL@16_11:	; if_then_bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 448
	oneb !LOWW(_commnunication_flag+0x00001)
	br $.BB@LABEL@16_28
.BB@LABEL@16_12:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 449
	cmp a, #0x53
	bnz $.BB@LABEL@16_15
.BB@LABEL@16_13:	; bb51
	cmp !LOWW(_g_rx_data+0x00001), #0x14
	bnz $.BB@LABEL@16_15
.BB@LABEL@16_14:	; if_then_bb64
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 450
	movw bc, #0x008D
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 451
	oneb !LOWW(_commnunication_flag+0x00004)
	br $.BB@LABEL@16_31
.BB@LABEL@16_15:	; if_else_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 452
	cmp a, #0x52
	bnz $.BB@LABEL@16_21
.BB@LABEL@16_16:	; bb74
	cmp !LOWW(_g_rx_data+0x00001), #0x17
	bnz $.BB@LABEL@16_18
.BB@LABEL@16_17:	; if_then_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 453
	oneb !LOWW(_commnunication_flag+0x00005)
	br $.BB@LABEL@16_31
.BB@LABEL@16_18:	; bb93
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 454
	cmp !LOWW(_g_rx_data+0x00001), #0x03
	bnz $.BB@LABEL@16_21
.BB@LABEL@16_19:	; if_then_bb106
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 455
	oneb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@16_20:	; if_then_bb106
	br $.BB@LABEL@16_31
.BB@LABEL@16_21:	; if_else_bb107
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 456
	cmp a, #0x53
	bnz $.BB@LABEL@16_25
.BB@LABEL@16_22:	; bb112
	cmp !LOWW(_g_rx_data+0x00001), #0x15
	bnz $.BB@LABEL@16_25
.BB@LABEL@16_23:	; if_then_bb125
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 457
	movw bc, #0x0021
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 458
	oneb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@16_24:	; if_then_bb125
	br $.BB@LABEL@16_31
.BB@LABEL@16_25:	; if_else_bb129
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 459
	cmp a, #0x52
	bnz $.BB@LABEL@16_29
.BB@LABEL@16_26:	; bb134
	cmp !LOWW(_g_rx_data+0x00001), #0x18
	bnz $.BB@LABEL@16_29
.BB@LABEL@16_27:	; if_then_bb147
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 460
	oneb !LOWW(_commnunication_flag+0x00006)
.BB@LABEL@16_28:	; if_then_bb147
	br $.BB@LABEL@16_31
.BB@LABEL@16_29:	; if_else_bb148
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 462
	cmp a, #0x43
	bnz $.BB@LABEL@16_31
.BB@LABEL@16_30:	; if_then_bb154
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 463
	mov a, !LOWW(_g_rx_data+0x00001)
	mov !LOWW(_commnunication_flag+0x00007), a
.BB@LABEL@16_31:	; if_break_bb184
	;***      469 : 	}
	;***      470 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 470
	inc !LOWW(_g_uart2_receive)
	ret
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      471 :     /* End user code. Do not edit comment generated here */
	;***      472 : }
	;***      473 : 
	;***      474 : /***********************************************************************************************************************
	;***      475 : * Function Name: r_uart2_callback_softwareoverrun
	;***      476 : * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      477 : * Arguments    : rx_data -
	;***      478 : *                    receive data
	;***      479 : * Return Value : None
	;***      480 : ***********************************************************************************************************************/
	;***      481 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 481
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      482 : {
	;***      483 :     /* Start user code. Do not edit comment generated here */
	;***      484 :     /* End user code. Do not edit comment generated here */
	;***      485 : }
	;***      486 : 
	;***      487 : /***********************************************************************************************************************
	;***      488 : * Function Name: r_uart2_callback_sendend
	;***      489 : * Description  : This function is a callback function when UART2 finishes transmission.
	;***      490 : * Arguments    : None
	;***      491 : * Return Value : None
	;***      492 : ***********************************************************************************************************************/
	;***      493 : static void r_uart2_callback_sendend(void)
	;***      494 : {
	;***      495 :     /* Start user code. Do not edit comment generated here */
	;***      496 : 	g_uart2_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 496
	inc !LOWW(_g_uart2_sendend)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      497 :     /* End user code. Do not edit comment generated here */
	;***      498 : }
	;***      499 : 
	;***      500 : /***********************************************************************************************************************
	;***      501 : * Function Name: r_uart2_callback_error
	;***      502 : * Description  : This function is a callback function when UART2 reception error occurs.
	;***      503 : * Arguments    : err_type -
	;***      504 : *                    error type value
	;***      505 : * Return Value : None
	;***      506 : ***********************************************************************************************************************/
	;***      507 : static void r_uart2_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 507
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      508 : {
	;***      509 :     /* Start user code. Do not edit comment generated here */
	;***      510 :     /* End user code. Do not edit comment generated here */
	;***      511 : }
	;***      512 : 
	;***      513 : /***********************************************************************************************************************
	;***      514 : * Function Name: r_uart3_interrupt_receive
	;***      515 : * Description  : This function is INTSR3 interrupt service routine.
	;***      516 : * Arguments    : None
	;***      517 : * Return Value : None
	;***      518 : ***********************************************************************************************************************/
	;***      519 : static void __near r_uart3_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 519
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      520 : {
	;***      521 :     volatile uint8_t rx_data;
	;***      522 :     volatile uint8_t err_type;
	;***      523 :     
	;***      524 :     err_type = (uint8_t)(SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 524
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      525 :     SIR13 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 525
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      526 : 
	;***      527 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 527
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@20_2
.BB@LABEL@20_1:	; if_then_bb
	;***      528 :     {
	;***      529 :         r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 529
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@20_2:	; if_break_bb
	;***      530 :     }
	;***      531 :     
	;***      532 :     rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 532
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      533 : 
	;***      534 :     if (g_uart3_rx_length > g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 534
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@20_6
.BB@LABEL@20_3:	; if_then_bb18
	;***      535 :     {
	;***      536 :         *gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 536
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      537 :         gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 537
	incw !LOWW(_gp_uart3_rx_address)
	;***      538 :         g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 538
	incw !LOWW(_g_uart3_rx_count)
	;***      539 : 
	;***      540 :         if (g_uart3_rx_length == g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 540
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@20_4:	; if_then_bb30
	;***      541 :         {
	;***      542 :             r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 542
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 549
	reti
.BB@LABEL@20_6:	; if_else_bb
	;***      543 :         }
	;***      544 :     }
	;***      545 :     else
	;***      546 :     {
	;***      547 :         r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 547
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@20_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      548 :     }
	;***      549 : }
	;***      550 : 
	;***      551 : /***********************************************************************************************************************
	;***      552 : * Function Name: r_uart3_interrupt_send
	;***      553 : * Description  : This function is INTST3 interrupt service routine.
	;***      554 : * Arguments    : None
	;***      555 : * Return Value : None
	;***      556 : ***********************************************************************************************************************/
	;***      557 : static void __near r_uart3_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 557
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      558 : {
	;***      559 :     if (g_uart3_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 559
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@21_3
.BB@LABEL@21_1:	; if_else_bb
	;***      560 :     {
	;***      561 :         TXD3 = *gp_uart3_tx_address;
	;***      562 :         gp_uart3_tx_address++;
	;***      563 :         g_uart3_tx_count--;
	;***      564 :     }
	;***      565 :     else
	;***      566 :     {
	;***      567 :         r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 567
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 569
	reti
.BB@LABEL@21_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 561
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 562
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 563
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@21_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      568 :     }
	;***      569 : }
	;***      570 : 
	;***      571 : /***********************************************************************************************************************
	;***      572 : * Function Name: r_uart3_callback_receiveend
	;***      573 : * Description  : This function is a callback function when UART3 finishes reception.
	;***      574 : * Arguments    : None
	;***      575 : * Return Value : None
	;***      576 : ***********************************************************************************************************************/
	;***      577 : static void r_uart3_callback_receiveend(void)
	;***      578 : {
	;***      579 :     /* Start user code. Do not edit comment generated here */
	;***      580 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 580
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      581 : 	if(g_uart3_rx_data[0] == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 581
	mov a, !LOWW(_g_uart3_rx_data)
	cmp a, #0x01
	bnz $.BB@LABEL@22_7
.BB@LABEL@22_1:	; if_then_bb
	;***      582 : 		//Read timer setting
	;***      583 : 		if((rs485_rx_p[0] == H_READ) && (rs485_rx_p[1] == READ_TIME)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 583
	cmp !LOWW(_g_uart3_rx_data+0x00001), #0x52
	bnz $.BB@LABEL@22_6
.BB@LABEL@22_2:	; bb
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x02
	bnz $.BB@LABEL@22_4
.BB@LABEL@22_3:	; if_then_bb25
	;***      584 : 			commnunication_flag.rs485_send_to_watersolfner_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 584
	oneb !LOWW(_commnunication_flag+0x00008)
	ret
.BB@LABEL@22_4:	; bb32
	;***      585 : 		}else if((rs485_rx_p[0] == 82) && (rs485_rx_p[1] == 24)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 585
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x18
	sknz
.BB@LABEL@22_5:	; if_then_bb47
	;***      586 : 			commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 586
	oneb !LOWW(_commnunication_flag+0x00009)
.BB@LABEL@22_6:	; if_else_bb.if_else_bb48_crit_edge.critedge
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 603
	ret
.BB@LABEL@22_7:	; if_else_bb97
	;***      587 : 		}else if((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 70)){
	;***      588 : 			//TODO: Start Water Softener
	;***      589 : 
	;***      590 : 		}else if((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 80)){
	;***      591 : 			//TODO: Stop Water Softener + Time of SNP ON (4 bytes)
	;***      592 : 		}
	;***      593 : 	}else if(g_uart3_rx_data[0] == 2){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 593
	cmp a, #0x02
	bnz $.BB@LABEL@22_12
.BB@LABEL@22_8:	; if_then_bb103
	;***      594 : 		if((rs485_rx_p[0] == 11)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 594
	mov a, !LOWW(_g_uart3_rx_data+0x00001)
	cmp a, #0x0B
	bnz $.BB@LABEL@22_10
.BB@LABEL@22_9:	; if_then_bb111
	;***      595 : 			commnunication_flag.rs485_send_to_valve_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 595
	oneb !LOWW(_commnunication_flag+0x0000A)
	ret
.BB@LABEL@22_10:	; if_else_bb112
	;***      596 : 		}else if((rs485_rx_p[0] == 12)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 596
	cmp a, #0x0C
	bnz $.BB@LABEL@22_14
.BB@LABEL@22_11:	; if_then_bb120
	;***      597 : 			commnunication_flag.rs485_get_valve_gesture_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 597
	oneb !LOWW(_commnunication_flag+0x0000B)
	ret
.BB@LABEL@22_12:	; if_else_bb123
	;***      598 : 		}
	;***      599 : 	}else if(g_uart3_rx_data[0] != 0xff){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 599
	inc a
	skz
.BB@LABEL@22_13:	; if_then_bb129
	;***      600 : 		commnunication_flag.rs485_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 600
	oneb !LOWW(_commnunication_flag+0x0000C)
.BB@LABEL@22_14:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 603
	ret
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      601 : 	}
	;***      602 :     /* End user code. Do not edit comment generated here */
	;***      603 : }
	;***      604 : 
	;***      605 : /***********************************************************************************************************************
	;***      606 : * Function Name: r_uart3_callback_softwareoverrun
	;***      607 : * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      608 : * Arguments    : rx_data -
	;***      609 : *                    receive data
	;***      610 : * Return Value : None
	;***      611 : ***********************************************************************************************************************/
	;***      612 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 612
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      613 : {
	;***      614 :     /* Start user code. Do not edit comment generated here */
	;***      615 :     /* End user code. Do not edit comment generated here */
	;***      616 : }
	;***      617 : 
	;***      618 : /***********************************************************************************************************************
	;***      619 : * Function Name: r_uart3_callback_sendend
	;***      620 : * Description  : This function is a callback function when UART3 finishes transmission.
	;***      621 : * Arguments    : None
	;***      622 : * Return Value : None
	;***      623 : ***********************************************************************************************************************/
	;***      624 : static void r_uart3_callback_sendend(void)
	;***      625 : {
	;***      626 :     /* Start user code. Do not edit comment generated here */
	;***      627 : 	g_uart3_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 627
	inc !LOWW(_g_uart3_sendend)
	;***      628 : 	O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 628
	clr1 0xFFF00.0
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      629 :     /* End user code. Do not edit comment generated here */
	;***      630 : }
	;***      631 : 
	;***      632 : /***********************************************************************************************************************
	;***      633 : * Function Name: r_uart3_callback_error
	;***      634 : * Description  : This function is a callback function when UART3 reception error occurs.
	;***      635 : * Arguments    : err_type -
	;***      636 : *                    error type value
	;***      637 : * Return Value : None
	;***      638 : ***********************************************************************************************************************/
	;***      639 : static void r_uart3_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 639
	ret
	;***      640 : {
	;***      641 :     /* Start user code. Do not edit comment generated here */
	;***      642 :     /* End user code. Do not edit comment generated here */
	;***      643 : }
	;***      644 : 
	;***      645 : /* Start user code for adding. Do not edit comment generated here */
	;***      646 : /* End user code. Do not edit comment generated here */
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
	.DS (13)
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
