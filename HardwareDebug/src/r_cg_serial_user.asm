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
#@  compiled at Wed Dec 08 17:02:59 2021

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
	.PUBLIC _recived_time_setting_flag
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
	;***       83 : volatile uint8_t send_response_flag, send_response_time_flag, send_response_number_flag, recived_time_setting_flag;
	;***       84 : volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end, g_uart1_send, g_uart2_sendend, g_uart2_receive;
	;***       85 : uint8_t g_rx_data[72];
	;***       86 : volatile uint8_t g_uart2_fault;
	;***       87 : volatile uint8_t g_uart3_sendend;
	;***       88 : uint8_t isCommand(uint8_t *data){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 88
	movw de, ax
	;***       89 : 	switch ((enum UART_header_e)*data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 89
	mov a, [de]
	add a, #0xBF
	bz $.BB@LABEL@1_6
.BB@LABEL@1_1:	; entry
	add a, #0xFE
	bz $.BB@LABEL@1_6
.BB@LABEL@1_2:	; entry
	add a, #0xFE
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; entry
	add a, #0xF3
	bz $.BB@LABEL@1_6
.BB@LABEL@1_4:	; entry
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_5:	; bb11
	;***       90 : 		case H_ALARM:
	;***       91 : 			send_response_flag = 1;
	;***       92 : 			break;
	;***       93 : 		case H_CLEAR:
	;***       94 : 			send_response_flag = 1;
	;***       95 : 			break;
	;***       96 : 		case H_ERROR:
	;***       97 : 			send_response_flag = 1;
	;***       98 : 			break;
	;***       99 : 		case H_READ:
	;***      100 : 			send_response_flag = 1;
	;***      101 : 			break;
	;***      102 : 		case H_SET:
	;***      103 : 			send_response_flag = 1;
	;***      104 : 			break;
	;***      105 : 		default:
	;***      106 : 			return 0;
	;***      107 : 	}
	;***      108 : 	return 1;
	;***      109 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 109
	clrb a
	ret
.BB@LABEL@1_6:	; switch_clause_bb8
	oneb !LOWW(_send_response_flag)
	oneb a
	ret
	.SECTION .text,TEXT
_r_uart1_interrupt_receive@1	.vector 0x0026
_r_uart1_interrupt_receive@1:
	.STACK _r_uart1_interrupt_receive@1 = 16
	;***      110 : /* End user code. Do not edit comment generated here */
	;***      111 : 
	;***      112 : /***********************************************************************************************************************
	;***      113 : * Function Name: r_uart1_interrupt_receive
	;***      114 : * Description  : This function is INTSR1 interrupt service routine.
	;***      115 : * Arguments    : None
	;***      116 : * Return Value : None
	;***      117 : ***********************************************************************************************************************/
	;***      118 : static void __near r_uart1_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 118
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      119 : {
	;***      120 :     volatile uint8_t rx_data;
	;***      121 :     volatile uint8_t err_type;
	;***      122 :     
	;***      123 :     err_type = (uint8_t)(SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 123
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      124 :     SIR03 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 124
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      125 : 
	;***      126 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 126
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; if_then_bb
	;***      127 :     {
	;***      128 :         r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 128
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@2_2:	; if_break_bb
	;***      129 :     }
	;***      130 :     
	;***      131 :     rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 131
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      132 : 
	;***      133 :     if (g_uart1_rx_length > g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 133
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@2_6
.BB@LABEL@2_3:	; if_then_bb18
	;***      134 :     {
	;***      135 :         *gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 135
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      136 :         gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 136
	incw !LOWW(_gp_uart1_rx_address)
	;***      137 :         g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 137
	incw !LOWW(_g_uart1_rx_count)
	;***      138 : 
	;***      139 :         if (g_uart1_rx_length == g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 139
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@2_4:	; if_then_bb30
	;***      140 :         {
	;***      141 :             r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 141
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 148
	reti
.BB@LABEL@2_6:	; if_else_bb
	;***      142 :         }
	;***      143 :     }
	;***      144 :     else
	;***      145 :     {
	;***      146 :         r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 146
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@2_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      147 :     }
	;***      148 : }
	;***      149 : 
	;***      150 : /***********************************************************************************************************************
	;***      151 : * Function Name: r_uart1_interrupt_send
	;***      152 : * Description  : This function is INTST1 interrupt service routine.
	;***      153 : * Arguments    : None
	;***      154 : * Return Value : None
	;***      155 : ***********************************************************************************************************************/
	;***      156 : static void __near r_uart1_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 156
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      157 : {
	;***      158 :     if (g_uart1_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 158
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@3_3
.BB@LABEL@3_1:	; if_else_bb
	;***      159 :     {
	;***      160 :         TXD1 = *gp_uart1_tx_address;
	;***      161 :         gp_uart1_tx_address++;
	;***      162 :         g_uart1_tx_count--;
	;***      163 :     }
	;***      164 :     else
	;***      165 :     {
	;***      166 :         r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 166
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 168
	reti
.BB@LABEL@3_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 160
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 161
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 162
	decw !LOWW(_g_uart1_tx_count)
	br $.BB@LABEL@3_2
	.SECTION .textf,TEXTF
_r_uart1_callback_receiveend@1:
	.STACK _r_uart1_callback_receiveend@1 = 4
	;***      167 :     }
	;***      168 : }
	;***      169 : 
	;***      170 : /***********************************************************************************************************************
	;***      171 : * Function Name: r_uart1_callback_receiveend
	;***      172 : * Description  : This function is a callback function when UART1 finishes reception.
	;***      173 : * Arguments    : None
	;***      174 : * Return Value : None
	;***      175 : ***********************************************************************************************************************/
	;***      176 : static void r_uart1_callback_receiveend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 176
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      177 : {
	;***      178 :     /* Start user code. Do not edit comment generated here */
	;***      179 :     /* End user code. Do not edit comment generated here */
	;***      180 : }
	;***      181 : 
	;***      182 : /***********************************************************************************************************************
	;***      183 : * Function Name: r_uart1_callback_softwareoverrun
	;***      184 : * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      185 : * Arguments    : rx_data -
	;***      186 : *                    receive data
	;***      187 : * Return Value : None
	;***      188 : ***********************************************************************************************************************/
	;***      189 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 189
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      190 : {
	;***      191 :     /* Start user code. Do not edit comment generated here */
	;***      192 :     /* End user code. Do not edit comment generated here */
	;***      193 : }
	;***      194 : 
	;***      195 : /***********************************************************************************************************************
	;***      196 : * Function Name: r_uart1_callback_sendend
	;***      197 : * Description  : This function is a callback function when UART1 finishes transmission.
	;***      198 : * Arguments    : None
	;***      199 : * Return Value : None
	;***      200 : ***********************************************************************************************************************/
	;***      201 : static void r_uart1_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 201
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      202 : {
	;***      203 :     /* Start user code. Do not edit comment generated here */
	;***      204 :     /* End user code. Do not edit comment generated here */
	;***      205 : }
	;***      206 : 
	;***      207 : /***********************************************************************************************************************
	;***      208 : * Function Name: r_uart1_callback_error
	;***      209 : * Description  : This function is a callback function when UART1 reception error occurs.
	;***      210 : * Arguments    : err_type -
	;***      211 : *                    error type value
	;***      212 : * Return Value : None
	;***      213 : ***********************************************************************************************************************/
	;***      214 : static void r_uart1_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 214
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      215 : {
	;***      216 :     /* Start user code. Do not edit comment generated here */
	;***      217 :     /* End user code. Do not edit comment generated here */
	;***      218 : }
	;***      219 : 
	;***      220 : /***********************************************************************************************************************
	;***      221 : * Function Name: r_csi00_interrupt
	;***      222 : * Description  : This function is INTCSI00 interrupt service routine.
	;***      223 : * Arguments    : None
	;***      224 : * Return Value : None
	;***      225 : ***********************************************************************************************************************/
	;***      226 : static void __near r_csi00_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 226
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      227 : {
	;***      228 :     volatile uint8_t err_type;
	;***      229 : 
	;***      230 :     err_type = (uint8_t)(SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 230
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      231 :     SIR00 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 231
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      232 : 
	;***      233 :     if (err_type != 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 233
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 246
	reti
.BB@LABEL@8_2:	; if_then_bb
	;***      234 :     {
	;***      235 :         if (g_csi00_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 235
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_3:	; if_else_bb
	;***      236 :         {
	;***      237 :             SIO00 = *gp_csi00_tx_address;
	;***      238 :             gp_csi00_tx_address++;
	;***      239 :             g_csi00_tx_count--;
	;***      240 :         }
	;***      241 :         else
	;***      242 :         {
	;***      243 :             r_csi00_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 243
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@8_1
.BB@LABEL@8_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 237
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 238
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 239
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@8_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      244 :         }
	;***      245 :     }
	;***      246 : }
	;***      247 : 
	;***      248 : /***********************************************************************************************************************
	;***      249 : * Function Name: r_csi00_callback_sendend
	;***      250 : * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      251 : * Arguments    : None
	;***      252 : * Return Value : None
	;***      253 : ***********************************************************************************************************************/
	;***      254 : static void r_csi00_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 254
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      255 : {
	;***      256 :     /* Start user code. Do not edit comment generated here */
	;***      257 :     /* End user code. Do not edit comment generated here */
	;***      258 : }
	;***      259 : 
	;***      260 : /***********************************************************************************************************************
	;***      261 : * Function Name: r_csi01_interrupt
	;***      262 : * Description  : This function is INTCSI01 interrupt service routine.
	;***      263 : * Arguments    : None
	;***      264 : * Return Value : None
	;***      265 : ***********************************************************************************************************************/
	;***      266 : static void __near r_csi01_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 266
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      267 : {
	;***      268 :     volatile uint8_t err_type;
	;***      269 :     volatile uint8_t sio_dummy;
	;***      270 : 
	;***      271 :     err_type = (uint8_t)(SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 271
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      272 :     SIR01 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 272
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      273 : 
	;***      274 :     if (1U == err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 274
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@10_2
.BB@LABEL@10_1:	; if_then_bb
	;***      275 :     {
	;***      276 :         r_csi01_callback_error(err_type);    /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 276
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_2:	; if_else_bb
	;***      277 :     }
	;***      278 :     else
	;***      279 :     {
	;***      280 :         if (g_csi01_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 280
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@10_8
.BB@LABEL@10_3:	; if_else_bb42
	;***      281 :         {
	;***      282 :             if (0U != gp_csi01_rx_address)
	;***      283 :             {
	;***      284 :                 *gp_csi01_rx_address = SIO01;
	;***      285 :                 gp_csi01_rx_address++;
	;***      286 :             }
	;***      287 :             else
	;***      288 :             {
	;***      289 :                 sio_dummy = SIO01;
	;***      290 :             }
	;***      291 : 
	;***      292 :             if (0U != gp_csi01_tx_address)
	;***      293 :             {
	;***      294 :                 SIO01 = *gp_csi01_tx_address;
	;***      295 :                 gp_csi01_tx_address++;
	;***      296 :             }
	;***      297 :             else
	;***      298 :             {
	;***      299 :                 SIO01 = 0xFFU;
	;***      300 :             }
	;***      301 : 
	;***      302 :             g_csi01_tx_count--;
	;***      303 :         }
	;***      304 :         else 
	;***      305 :         {
	;***      306 :             if (0U == g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 306
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@10_7
.BB@LABEL@10_4:	; if_then_bb47
	;***      307 :             {
	;***      308 :                 if (0U != gp_csi01_rx_address)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 308
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_6
.BB@LABEL@10_5:	; if_else_bb55
	;***      309 :                 {
	;***      310 :                     *gp_csi01_rx_address = SIO01;
	;***      311 :                 }
	;***      312 :                 else
	;***      313 :                 {
	;***      314 :                     sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 314
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_7
.BB@LABEL@10_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 310
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@10_7:	; if_break_bb59
	;***      315 :                 }
	;***      316 :             }
	;***      317 : 
	;***      318 :             r_csi01_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 318
	call !!_r_csi01_callback_sendend@1
	;***      319 :             r_csi01_callback_receiveend();    /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 319
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 282
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_10
.BB@LABEL@10_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 289
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_11
.BB@LABEL@10_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 284
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 285
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@10_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 292
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_13
.BB@LABEL@10_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 299
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@10_14
.BB@LABEL@10_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 294
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 295
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@10_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 302
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 322
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      320 :         }
	;***      321 :     }
	;***      322 : }
	;***      323 : 
	;***      324 : /***********************************************************************************************************************
	;***      325 : * Function Name: r_csi01_callback_receiveend
	;***      326 : * Description  : This function is a callback function when CSI01 finishes reception.
	;***      327 : * Arguments    : None
	;***      328 : * Return Value : None
	;***      329 : ***********************************************************************************************************************/
	;***      330 : static void r_csi01_callback_receiveend(void)
	;***      331 : {
	;***      332 :     /* Start user code. Do not edit comment generated here */
	;***      333 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 333
	inc !LOWW(_g_csi_rev_end)
	;***      334 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 334
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      335 :     /* End user code. Do not edit comment generated here */
	;***      336 : }
	;***      337 : 
	;***      338 : /***********************************************************************************************************************
	;***      339 : * Function Name: r_csi01_callback_error
	;***      340 : * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      341 : * Arguments    : err_type -
	;***      342 : *                    error type value
	;***      343 : * Return Value : None
	;***      344 : ***********************************************************************************************************************/
	;***      345 : static void r_csi01_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 345
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      346 : {
	;***      347 :     /* Start user code. Do not edit comment generated here */
	;***      348 : 
	;***      349 :     /* End user code. Do not edit comment generated here */
	;***      350 : }
	;***      351 : 
	;***      352 : /***********************************************************************************************************************
	;***      353 : * Function Name: r_csi01_callback_sendend
	;***      354 : * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      355 : * Arguments    : None
	;***      356 : * Return Value : None
	;***      357 : ***********************************************************************************************************************/
	;***      358 : static void r_csi01_callback_sendend(void)
	;***      359 : {
	;***      360 :     /* Start user code. Do not edit comment generated here */
	;***      361 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 361
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      362 :     /* End user code. Do not edit comment generated here */
	;***      363 : }
	;***      364 : 
	;***      365 : /***********************************************************************************************************************
	;***      366 : * Function Name: r_uart2_interrupt_receive
	;***      367 : * Description  : This function is INTSR2 interrupt service routine.
	;***      368 : * Arguments    : None
	;***      369 : * Return Value : None
	;***      370 : ***********************************************************************************************************************/
	;***      371 : static void __near r_uart2_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 371
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      372 : {
	;***      373 :     volatile uint8_t rx_data;
	;***      374 :     volatile uint8_t err_type;
	;***      375 :     
	;***      376 :     err_type = (uint8_t)(SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 376
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      377 :     SIR11 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 377
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      378 : 
	;***      379 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 379
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@14_2
.BB@LABEL@14_1:	; if_then_bb
	;***      380 :     {
	;***      381 :         r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 381
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@14_2:	; if_break_bb
	;***      382 :     }
	;***      383 :     
	;***      384 :     rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 384
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      385 : 
	;***      386 :     if (g_uart2_rx_length > g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 386
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@14_6
.BB@LABEL@14_3:	; if_then_bb18
	;***      387 :     {
	;***      388 :         *gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 388
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      389 :         gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 389
	incw !LOWW(_gp_uart2_rx_address)
	;***      390 :         g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 390
	incw !LOWW(_g_uart2_rx_count)
	;***      391 : 
	;***      392 :         if (g_uart2_rx_length == g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 392
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@14_4:	; if_then_bb30
	;***      393 :         {
	;***      394 :             r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 394
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 401
	reti
.BB@LABEL@14_6:	; if_else_bb
	;***      395 :         }
	;***      396 :     }
	;***      397 :     else
	;***      398 :     {
	;***      399 :         r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 399
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@14_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      400 :     }
	;***      401 : }
	;***      402 : 
	;***      403 : /***********************************************************************************************************************
	;***      404 : * Function Name: r_uart2_interrupt_send
	;***      405 : * Description  : This function is INTST2 interrupt service routine.
	;***      406 : * Arguments    : None
	;***      407 : * Return Value : None
	;***      408 : ***********************************************************************************************************************/
	;***      409 : static void __near r_uart2_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 409
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      410 : {
	;***      411 :     if (g_uart2_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 411
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@15_3
.BB@LABEL@15_1:	; if_else_bb
	;***      412 :     {
	;***      413 :         TXD2 = *gp_uart2_tx_address;
	;***      414 :         gp_uart2_tx_address++;
	;***      415 :         g_uart2_tx_count--;
	;***      416 :     }
	;***      417 :     else
	;***      418 :     {
	;***      419 :         r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 419
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 421
	reti
.BB@LABEL@15_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 413
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 414
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 415
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@15_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 4
	;***      420 :     }
	;***      421 : }
	;***      422 : 
	;***      423 : /***********************************************************************************************************************
	;***      424 : * Function Name: r_uart2_callback_receiveend
	;***      425 : * Description  : This function is a callback function when UART2 finishes reception.
	;***      426 : * Arguments    : None
	;***      427 : * Return Value : None
	;***      428 : ***********************************************************************************************************************/
	;***      429 : static void r_uart2_callback_receiveend(void)
	;***      430 : {
	;***      431 :     /* Start user code. Do not edit comment generated here */
	;***      432 : //	R_UART2_Receive(g_rx_data, 32);
	;***      433 : //	R_UART2_Stop();
	;***      434 : //	R_UART2_Start();
	;***      435 : 
	;***      436 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 436
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      437 : 	isCommand(g_rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 437
	movw ax, #LOWW(_g_rx_data)
	call $!_isCommand
	;***      438 : 	recived_time_setting_flag = recived_time_setting_flag == 1 ? 2: recived_time_setting_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 438
	cmp !LOWW(_recived_time_setting_flag), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_1:	; bb6
	mov a, !LOWW(_recived_time_setting_flag)
.BB@LABEL@16_2:	; bb9
	mov !LOWW(_recived_time_setting_flag), a
	;***      439 : 	if(1){
	;***      440 : 		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 440
	clrb !LOWW(_g_uart2_fault)
	;***      441 : 		if((g_rx_data[0] == H_READ)&(g_rx_data[1] == READ_TIME)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 441
	mov a, !LOWW(_g_rx_data+0x00001)
	mov b, a
	cmp a, #0x02
	mov a, !LOWW(_g_rx_data)
	mov x, a
	bnz $.BB@LABEL@16_5
.BB@LABEL@16_3:	; bb9
	cmp a, #0x52
	bnz $.BB@LABEL@16_5
.BB@LABEL@16_4:	; if_then_bb24
	;***      442 : 			send_response_time_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 442
	oneb !LOWW(_send_response_time_flag)
	br $.BB@LABEL@16_8
.BB@LABEL@16_5:	; if_else_bb
	mov a, b
	;***      443 : //			g_timerSetting.t51++;
	;***      444 : 		}else if((g_rx_data[0] == H_SET)&(g_rx_data[1] == SAVE_TIME)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 444
	cmp a, #0x14
	bnz $.BB@LABEL@16_8
.BB@LABEL@16_6:	; if_else_bb
	mov a, x
	cmp a, #0x53
	bnz $.BB@LABEL@16_8
.BB@LABEL@16_7:	; if_then_bb37
	;***      445 : 			R_UART2_Receive(g_rx_data, 69);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 445
	movw bc, #0x0045
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      446 : 			recived_time_setting_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 446
	oneb !LOWW(_recived_time_setting_flag)
.BB@LABEL@16_8:	; if_break_bb42
	;***      447 : 		}
	;***      448 : //		if((g_rx_data[0] == H_SET)&(g_rx_data[1] == READ_NUMBER)){
	;***      449 : //			R_UART2_Receive(g_rx_data, sizeof(struct Number_Setting_s)-1);
	;***      450 : //		}else if((g_rx_data[0] == H_SET)&(g_rx_data[1] == READ_TIME)){
	;***      451 : //			R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
	;***      452 : //		}else if((g_rx_data[0] == H_READ)&(g_rx_data[1] == READ_TIME)){
	;***      453 : //			g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, 68);
	;***      454 : //			R_UART2_Send((uint8_t *)&g_timerSetting, 69);
	;***      455 : //			g_timerSetting.t51++;
	;***      456 : //		}
	;***      457 : 	}else{
	;***      458 : 		R_UART2_Receive(g_rx_data, 6);
	;***      459 : 		g_uart2_fault = 1;
	;***      460 : 	}
	;***      461 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 461
	inc !LOWW(_g_uart2_receive)
	ret
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      462 :     /* End user code. Do not edit comment generated here */
	;***      463 : }
	;***      464 : 
	;***      465 : /***********************************************************************************************************************
	;***      466 : * Function Name: r_uart2_callback_softwareoverrun
	;***      467 : * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      468 : * Arguments    : rx_data -
	;***      469 : *                    receive data
	;***      470 : * Return Value : None
	;***      471 : ***********************************************************************************************************************/
	;***      472 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 472
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      473 : {
	;***      474 :     /* Start user code. Do not edit comment generated here */
	;***      475 :     /* End user code. Do not edit comment generated here */
	;***      476 : }
	;***      477 : 
	;***      478 : /***********************************************************************************************************************
	;***      479 : * Function Name: r_uart2_callback_sendend
	;***      480 : * Description  : This function is a callback function when UART2 finishes transmission.
	;***      481 : * Arguments    : None
	;***      482 : * Return Value : None
	;***      483 : ***********************************************************************************************************************/
	;***      484 : static void r_uart2_callback_sendend(void)
	;***      485 : {
	;***      486 :     /* Start user code. Do not edit comment generated here */
	;***      487 : 	g_uart2_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 487
	inc !LOWW(_g_uart2_sendend)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      488 :     /* End user code. Do not edit comment generated here */
	;***      489 : }
	;***      490 : 
	;***      491 : /***********************************************************************************************************************
	;***      492 : * Function Name: r_uart2_callback_error
	;***      493 : * Description  : This function is a callback function when UART2 reception error occurs.
	;***      494 : * Arguments    : err_type -
	;***      495 : *                    error type value
	;***      496 : * Return Value : None
	;***      497 : ***********************************************************************************************************************/
	;***      498 : static void r_uart2_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 498
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      499 : {
	;***      500 :     /* Start user code. Do not edit comment generated here */
	;***      501 :     /* End user code. Do not edit comment generated here */
	;***      502 : }
	;***      503 : 
	;***      504 : /***********************************************************************************************************************
	;***      505 : * Function Name: r_uart3_interrupt_receive
	;***      506 : * Description  : This function is INTSR3 interrupt service routine.
	;***      507 : * Arguments    : None
	;***      508 : * Return Value : None
	;***      509 : ***********************************************************************************************************************/
	;***      510 : static void __near r_uart3_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 510
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      511 : {
	;***      512 :     volatile uint8_t rx_data;
	;***      513 :     volatile uint8_t err_type;
	;***      514 :     
	;***      515 :     err_type = (uint8_t)(SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 515
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      516 :     SIR13 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 516
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      517 : 
	;***      518 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 518
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@20_2
.BB@LABEL@20_1:	; if_then_bb
	;***      519 :     {
	;***      520 :         r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 520
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@20_2:	; if_break_bb
	;***      521 :     }
	;***      522 :     
	;***      523 :     rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 523
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      524 : 
	;***      525 :     if (g_uart3_rx_length > g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 525
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@20_6
.BB@LABEL@20_3:	; if_then_bb18
	;***      526 :     {
	;***      527 :         *gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 527
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      528 :         gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 528
	incw !LOWW(_gp_uart3_rx_address)
	;***      529 :         g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 529
	incw !LOWW(_g_uart3_rx_count)
	;***      530 : 
	;***      531 :         if (g_uart3_rx_length == g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 531
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@20_4:	; if_then_bb30
	;***      532 :         {
	;***      533 :             r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 533
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 540
	reti
.BB@LABEL@20_6:	; if_else_bb
	;***      534 :         }
	;***      535 :     }
	;***      536 :     else
	;***      537 :     {
	;***      538 :         r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 538
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@20_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      539 :     }
	;***      540 : }
	;***      541 : 
	;***      542 : /***********************************************************************************************************************
	;***      543 : * Function Name: r_uart3_interrupt_send
	;***      544 : * Description  : This function is INTST3 interrupt service routine.
	;***      545 : * Arguments    : None
	;***      546 : * Return Value : None
	;***      547 : ***********************************************************************************************************************/
	;***      548 : static void __near r_uart3_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 548
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      549 : {
	;***      550 :     if (g_uart3_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 550
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@21_3
.BB@LABEL@21_1:	; if_else_bb
	;***      551 :     {
	;***      552 :         TXD3 = *gp_uart3_tx_address;
	;***      553 :         gp_uart3_tx_address++;
	;***      554 :         g_uart3_tx_count--;
	;***      555 :     }
	;***      556 :     else
	;***      557 :     {
	;***      558 :         r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 558
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 560
	reti
.BB@LABEL@21_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 552
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 553
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 554
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@21_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      559 :     }
	;***      560 : }
	;***      561 : 
	;***      562 : /***********************************************************************************************************************
	;***      563 : * Function Name: r_uart3_callback_receiveend
	;***      564 : * Description  : This function is a callback function when UART3 finishes reception.
	;***      565 : * Arguments    : None
	;***      566 : * Return Value : None
	;***      567 : ***********************************************************************************************************************/
	;***      568 : static void r_uart3_callback_receiveend(void)
	;***      569 : {
	;***      570 :     /* Start user code. Do not edit comment generated here */
	;***      571 : 	R_UART3_Receive(rec_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 571
	movw bc, #0x0007
	movw ax, #LOWW(_rec_buf)
	br !!_R_UART3_Receive
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      572 :     /* End user code. Do not edit comment generated here */
	;***      573 : }
	;***      574 : 
	;***      575 : /***********************************************************************************************************************
	;***      576 : * Function Name: r_uart3_callback_softwareoverrun
	;***      577 : * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      578 : * Arguments    : rx_data -
	;***      579 : *                    receive data
	;***      580 : * Return Value : None
	;***      581 : ***********************************************************************************************************************/
	;***      582 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 582
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      583 : {
	;***      584 :     /* Start user code. Do not edit comment generated here */
	;***      585 :     /* End user code. Do not edit comment generated here */
	;***      586 : }
	;***      587 : 
	;***      588 : /***********************************************************************************************************************
	;***      589 : * Function Name: r_uart3_callback_sendend
	;***      590 : * Description  : This function is a callback function when UART3 finishes transmission.
	;***      591 : * Arguments    : None
	;***      592 : * Return Value : None
	;***      593 : ***********************************************************************************************************************/
	;***      594 : static void r_uart3_callback_sendend(void)
	;***      595 : {
	;***      596 :     /* Start user code. Do not edit comment generated here */
	;***      597 : 	g_uart3_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 597
	inc !LOWW(_g_uart3_sendend)
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      598 :     /* End user code. Do not edit comment generated here */
	;***      599 : }
	;***      600 : 
	;***      601 : /***********************************************************************************************************************
	;***      602 : * Function Name: r_uart3_callback_error
	;***      603 : * Description  : This function is a callback function when UART3 reception error occurs.
	;***      604 : * Arguments    : err_type -
	;***      605 : *                    error type value
	;***      606 : * Return Value : None
	;***      607 : ***********************************************************************************************************************/
	;***      608 : static void r_uart3_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 608
	ret
	;***      609 : {
	;***      610 :     /* Start user code. Do not edit comment generated here */
	;***      611 :     /* End user code. Do not edit comment generated here */
	;***      612 : }
	;***      613 : 
	;***      614 : /* Start user code for adding. Do not edit comment generated here */
	;***      615 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
_send_response_flag:
	.DS (1)
_send_response_time_flag:
	.DS (1)
_send_response_number_flag:
	.DS (1)
_recived_time_setting_flag:
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
	.DS (72)
_g_uart2_fault:
	.DS (1)
_g_uart3_sendend:
	.DS (1)
