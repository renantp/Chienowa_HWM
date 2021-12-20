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
#@  compiled at Mon Dec 20 17:26:55 2021

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
	.EXTERN _R_UART3_Send

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
	;***       83 : volatile uint8_t send_response_flag, send_response_time_flag, send_response_number_flag, recived_time_setting_flag
	;***       84 : ,send_respone_status_flag, recived_number_setting_flag;
	;***       85 : volatile struct Communicaition_flag_s commnunication_flag;
	;***       86 : volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end, g_uart1_send, g_uart2_sendend, g_uart2_receive;
	;***       87 : uint8_t g_rx_data[72];
	;***       88 : volatile uint8_t g_uart2_fault;
	;***       89 : volatile uint8_t g_uart3_sendend;
	;***       90 : uint8_t isCommand(uint8_t *data){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 90
	movw de, ax
	;***       91 : 	if(data[1] == NEXT_ANIMATION)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 91
	mov a, [de+0x01]
	cmp a, #0x13
	bz $.BB@LABEL@1_7
.BB@LABEL@1_1:	; if_break_bb
	;***       92 : 		return 0;
	;***       93 : 	switch ((enum UART_header_e)*data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 93
	mov a, [de]
	add a, #0xBF
	bz $.BB@LABEL@1_6
.BB@LABEL@1_2:	; if_break_bb
	add a, #0xFE
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
.BB@LABEL@1_6:	; switch_clause_bb14
	oneb !LOWW(_commnunication_flag)
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 113
	ret
.BB@LABEL@1_7:	; bb18
	;***       94 : 		case H_ALARM:
	;***       95 : 			commnunication_flag.send_response_flag = 1;
	;***       96 : 			break;
	;***       97 : 		case H_CLEAR:
	;***       98 : 			commnunication_flag.send_response_flag = 1;
	;***       99 : 			break;
	;***      100 : 		case H_ERROR:
	;***      101 : 			commnunication_flag.send_response_flag = 1;
	;***      102 : 			break;
	;***      103 : 		case H_READ:
	;***      104 : 			commnunication_flag.send_response_flag = 1;
	;***      105 : 			break;
	;***      106 : 		case H_SET:
	;***      107 : 			commnunication_flag.send_response_flag = 1;
	;***      108 : 			break;
	;***      109 : 		default:
	;***      110 : 			return 0;
	;***      111 : 	}
	;***      112 : 	return 1;
	;***      113 : }
	clrb a
	ret
	.SECTION .text,TEXT
_r_uart1_interrupt_receive@1	.vector 0x0026
_r_uart1_interrupt_receive@1:
	.STACK _r_uart1_interrupt_receive@1 = 16
	;***      114 : /* End user code. Do not edit comment generated here */
	;***      115 : 
	;***      116 : /***********************************************************************************************************************
	;***      117 : * Function Name: r_uart1_interrupt_receive
	;***      118 : * Description  : This function is INTSR1 interrupt service routine.
	;***      119 : * Arguments    : None
	;***      120 : * Return Value : None
	;***      121 : ***********************************************************************************************************************/
	;***      122 : static void __near r_uart1_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 122
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      123 : {
	;***      124 :     volatile uint8_t rx_data;
	;***      125 :     volatile uint8_t err_type;
	;***      126 :     
	;***      127 :     err_type = (uint8_t)(SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 127
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      128 :     SIR03 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 128
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      129 : 
	;***      130 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 130
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; if_then_bb
	;***      131 :     {
	;***      132 :         r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 132
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@2_2:	; if_break_bb
	;***      133 :     }
	;***      134 :     
	;***      135 :     rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 135
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      136 : 
	;***      137 :     if (g_uart1_rx_length > g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 137
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@2_6
.BB@LABEL@2_3:	; if_then_bb18
	;***      138 :     {
	;***      139 :         *gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 139
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      140 :         gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 140
	incw !LOWW(_gp_uart1_rx_address)
	;***      141 :         g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 141
	incw !LOWW(_g_uart1_rx_count)
	;***      142 : 
	;***      143 :         if (g_uart1_rx_length == g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 143
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@2_4:	; if_then_bb30
	;***      144 :         {
	;***      145 :             r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 145
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 152
	reti
.BB@LABEL@2_6:	; if_else_bb
	;***      146 :         }
	;***      147 :     }
	;***      148 :     else
	;***      149 :     {
	;***      150 :         r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 150
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@2_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      151 :     }
	;***      152 : }
	;***      153 : 
	;***      154 : /***********************************************************************************************************************
	;***      155 : * Function Name: r_uart1_interrupt_send
	;***      156 : * Description  : This function is INTST1 interrupt service routine.
	;***      157 : * Arguments    : None
	;***      158 : * Return Value : None
	;***      159 : ***********************************************************************************************************************/
	;***      160 : static void __near r_uart1_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 160
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      161 : {
	;***      162 :     if (g_uart1_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 162
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@3_3
.BB@LABEL@3_1:	; if_else_bb
	;***      163 :     {
	;***      164 :         TXD1 = *gp_uart1_tx_address;
	;***      165 :         gp_uart1_tx_address++;
	;***      166 :         g_uart1_tx_count--;
	;***      167 :     }
	;***      168 :     else
	;***      169 :     {
	;***      170 :         r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 170
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 172
	reti
.BB@LABEL@3_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 164
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 165
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 166
	decw !LOWW(_g_uart1_tx_count)
	br $.BB@LABEL@3_2
	.SECTION .textf,TEXTF
_r_uart1_callback_receiveend@1:
	.STACK _r_uart1_callback_receiveend@1 = 4
	;***      171 :     }
	;***      172 : }
	;***      173 : 
	;***      174 : /***********************************************************************************************************************
	;***      175 : * Function Name: r_uart1_callback_receiveend
	;***      176 : * Description  : This function is a callback function when UART1 finishes reception.
	;***      177 : * Arguments    : None
	;***      178 : * Return Value : None
	;***      179 : ***********************************************************************************************************************/
	;***      180 : static void r_uart1_callback_receiveend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 180
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      181 : {
	;***      182 :     /* Start user code. Do not edit comment generated here */
	;***      183 :     /* End user code. Do not edit comment generated here */
	;***      184 : }
	;***      185 : 
	;***      186 : /***********************************************************************************************************************
	;***      187 : * Function Name: r_uart1_callback_softwareoverrun
	;***      188 : * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      189 : * Arguments    : rx_data -
	;***      190 : *                    receive data
	;***      191 : * Return Value : None
	;***      192 : ***********************************************************************************************************************/
	;***      193 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 193
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      194 : {
	;***      195 :     /* Start user code. Do not edit comment generated here */
	;***      196 :     /* End user code. Do not edit comment generated here */
	;***      197 : }
	;***      198 : 
	;***      199 : /***********************************************************************************************************************
	;***      200 : * Function Name: r_uart1_callback_sendend
	;***      201 : * Description  : This function is a callback function when UART1 finishes transmission.
	;***      202 : * Arguments    : None
	;***      203 : * Return Value : None
	;***      204 : ***********************************************************************************************************************/
	;***      205 : static void r_uart1_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 205
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      206 : {
	;***      207 :     /* Start user code. Do not edit comment generated here */
	;***      208 :     /* End user code. Do not edit comment generated here */
	;***      209 : }
	;***      210 : 
	;***      211 : /***********************************************************************************************************************
	;***      212 : * Function Name: r_uart1_callback_error
	;***      213 : * Description  : This function is a callback function when UART1 reception error occurs.
	;***      214 : * Arguments    : err_type -
	;***      215 : *                    error type value
	;***      216 : * Return Value : None
	;***      217 : ***********************************************************************************************************************/
	;***      218 : static void r_uart1_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 218
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      219 : {
	;***      220 :     /* Start user code. Do not edit comment generated here */
	;***      221 :     /* End user code. Do not edit comment generated here */
	;***      222 : }
	;***      223 : 
	;***      224 : /***********************************************************************************************************************
	;***      225 : * Function Name: r_csi00_interrupt
	;***      226 : * Description  : This function is INTCSI00 interrupt service routine.
	;***      227 : * Arguments    : None
	;***      228 : * Return Value : None
	;***      229 : ***********************************************************************************************************************/
	;***      230 : static void __near r_csi00_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 230
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      231 : {
	;***      232 :     volatile uint8_t err_type;
	;***      233 : 
	;***      234 :     err_type = (uint8_t)(SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 234
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      235 :     SIR00 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 235
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      236 : 
	;***      237 :     if (err_type != 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 237
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 250
	reti
.BB@LABEL@8_2:	; if_then_bb
	;***      238 :     {
	;***      239 :         if (g_csi00_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 239
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_3:	; if_else_bb
	;***      240 :         {
	;***      241 :             SIO00 = *gp_csi00_tx_address;
	;***      242 :             gp_csi00_tx_address++;
	;***      243 :             g_csi00_tx_count--;
	;***      244 :         }
	;***      245 :         else
	;***      246 :         {
	;***      247 :             r_csi00_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 247
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@8_1
.BB@LABEL@8_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 241
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 242
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 243
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@8_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      248 :         }
	;***      249 :     }
	;***      250 : }
	;***      251 : 
	;***      252 : /***********************************************************************************************************************
	;***      253 : * Function Name: r_csi00_callback_sendend
	;***      254 : * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      255 : * Arguments    : None
	;***      256 : * Return Value : None
	;***      257 : ***********************************************************************************************************************/
	;***      258 : static void r_csi00_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 258
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      259 : {
	;***      260 :     /* Start user code. Do not edit comment generated here */
	;***      261 :     /* End user code. Do not edit comment generated here */
	;***      262 : }
	;***      263 : 
	;***      264 : /***********************************************************************************************************************
	;***      265 : * Function Name: r_csi01_interrupt
	;***      266 : * Description  : This function is INTCSI01 interrupt service routine.
	;***      267 : * Arguments    : None
	;***      268 : * Return Value : None
	;***      269 : ***********************************************************************************************************************/
	;***      270 : static void __near r_csi01_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 270
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      271 : {
	;***      272 :     volatile uint8_t err_type;
	;***      273 :     volatile uint8_t sio_dummy;
	;***      274 : 
	;***      275 :     err_type = (uint8_t)(SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 275
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      276 :     SIR01 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 276
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      277 : 
	;***      278 :     if (1U == err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 278
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@10_2
.BB@LABEL@10_1:	; if_then_bb
	;***      279 :     {
	;***      280 :         r_csi01_callback_error(err_type);    /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 280
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_2:	; if_else_bb
	;***      281 :     }
	;***      282 :     else
	;***      283 :     {
	;***      284 :         if (g_csi01_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 284
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@10_8
.BB@LABEL@10_3:	; if_else_bb42
	;***      285 :         {
	;***      286 :             if (0U != gp_csi01_rx_address)
	;***      287 :             {
	;***      288 :                 *gp_csi01_rx_address = SIO01;
	;***      289 :                 gp_csi01_rx_address++;
	;***      290 :             }
	;***      291 :             else
	;***      292 :             {
	;***      293 :                 sio_dummy = SIO01;
	;***      294 :             }
	;***      295 : 
	;***      296 :             if (0U != gp_csi01_tx_address)
	;***      297 :             {
	;***      298 :                 SIO01 = *gp_csi01_tx_address;
	;***      299 :                 gp_csi01_tx_address++;
	;***      300 :             }
	;***      301 :             else
	;***      302 :             {
	;***      303 :                 SIO01 = 0xFFU;
	;***      304 :             }
	;***      305 : 
	;***      306 :             g_csi01_tx_count--;
	;***      307 :         }
	;***      308 :         else 
	;***      309 :         {
	;***      310 :             if (0U == g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 310
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@10_7
.BB@LABEL@10_4:	; if_then_bb47
	;***      311 :             {
	;***      312 :                 if (0U != gp_csi01_rx_address)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 312
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_6
.BB@LABEL@10_5:	; if_else_bb55
	;***      313 :                 {
	;***      314 :                     *gp_csi01_rx_address = SIO01;
	;***      315 :                 }
	;***      316 :                 else
	;***      317 :                 {
	;***      318 :                     sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 318
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_7
.BB@LABEL@10_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 314
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@10_7:	; if_break_bb59
	;***      319 :                 }
	;***      320 :             }
	;***      321 : 
	;***      322 :             r_csi01_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 322
	call !!_r_csi01_callback_sendend@1
	;***      323 :             r_csi01_callback_receiveend();    /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 323
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@10_15
.BB@LABEL@10_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 286
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_10
.BB@LABEL@10_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 293
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@10_11
.BB@LABEL@10_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 288
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 289
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@10_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 296
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@10_13
.BB@LABEL@10_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 303
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@10_14
.BB@LABEL@10_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 298
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 299
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@10_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 306
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 326
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      324 :         }
	;***      325 :     }
	;***      326 : }
	;***      327 : 
	;***      328 : /***********************************************************************************************************************
	;***      329 : * Function Name: r_csi01_callback_receiveend
	;***      330 : * Description  : This function is a callback function when CSI01 finishes reception.
	;***      331 : * Arguments    : None
	;***      332 : * Return Value : None
	;***      333 : ***********************************************************************************************************************/
	;***      334 : static void r_csi01_callback_receiveend(void)
	;***      335 : {
	;***      336 :     /* Start user code. Do not edit comment generated here */
	;***      337 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 337
	inc !LOWW(_g_csi_rev_end)
	;***      338 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 338
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      339 :     /* End user code. Do not edit comment generated here */
	;***      340 : }
	;***      341 : 
	;***      342 : /***********************************************************************************************************************
	;***      343 : * Function Name: r_csi01_callback_error
	;***      344 : * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      345 : * Arguments    : err_type -
	;***      346 : *                    error type value
	;***      347 : * Return Value : None
	;***      348 : ***********************************************************************************************************************/
	;***      349 : static void r_csi01_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 349
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      350 : {
	;***      351 :     /* Start user code. Do not edit comment generated here */
	;***      352 : 
	;***      353 :     /* End user code. Do not edit comment generated here */
	;***      354 : }
	;***      355 : 
	;***      356 : /***********************************************************************************************************************
	;***      357 : * Function Name: r_csi01_callback_sendend
	;***      358 : * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      359 : * Arguments    : None
	;***      360 : * Return Value : None
	;***      361 : ***********************************************************************************************************************/
	;***      362 : static void r_csi01_callback_sendend(void)
	;***      363 : {
	;***      364 :     /* Start user code. Do not edit comment generated here */
	;***      365 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 365
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      366 :     /* End user code. Do not edit comment generated here */
	;***      367 : }
	;***      368 : 
	;***      369 : /***********************************************************************************************************************
	;***      370 : * Function Name: r_uart2_interrupt_receive
	;***      371 : * Description  : This function is INTSR2 interrupt service routine.
	;***      372 : * Arguments    : None
	;***      373 : * Return Value : None
	;***      374 : ***********************************************************************************************************************/
	;***      375 : static void __near r_uart2_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 375
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      376 : {
	;***      377 :     volatile uint8_t rx_data;
	;***      378 :     volatile uint8_t err_type;
	;***      379 :     
	;***      380 :     err_type = (uint8_t)(SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 380
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      381 :     SIR11 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 381
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      382 : 
	;***      383 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 383
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@14_2
.BB@LABEL@14_1:	; if_then_bb
	;***      384 :     {
	;***      385 :         r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 385
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@14_2:	; if_break_bb
	;***      386 :     }
	;***      387 :     
	;***      388 :     rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 388
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      389 : 
	;***      390 :     if (g_uart2_rx_length > g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 390
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@14_6
.BB@LABEL@14_3:	; if_then_bb18
	;***      391 :     {
	;***      392 :         *gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 392
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      393 :         gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 393
	incw !LOWW(_gp_uart2_rx_address)
	;***      394 :         g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 394
	incw !LOWW(_g_uart2_rx_count)
	;***      395 : 
	;***      396 :         if (g_uart2_rx_length == g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 396
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@14_4:	; if_then_bb30
	;***      397 :         {
	;***      398 :             r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 398
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 405
	reti
.BB@LABEL@14_6:	; if_else_bb
	;***      399 :         }
	;***      400 :     }
	;***      401 :     else
	;***      402 :     {
	;***      403 :         r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 403
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@14_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      404 :     }
	;***      405 : }
	;***      406 : 
	;***      407 : /***********************************************************************************************************************
	;***      408 : * Function Name: r_uart2_interrupt_send
	;***      409 : * Description  : This function is INTST2 interrupt service routine.
	;***      410 : * Arguments    : None
	;***      411 : * Return Value : None
	;***      412 : ***********************************************************************************************************************/
	;***      413 : static void __near r_uart2_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 413
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      414 : {
	;***      415 :     if (g_uart2_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 415
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@15_3
.BB@LABEL@15_1:	; if_else_bb
	;***      416 :     {
	;***      417 :         TXD2 = *gp_uart2_tx_address;
	;***      418 :         gp_uart2_tx_address++;
	;***      419 :         g_uart2_tx_count--;
	;***      420 :     }
	;***      421 :     else
	;***      422 :     {
	;***      423 :         r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 423
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 425
	reti
.BB@LABEL@15_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 417
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 418
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 419
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@15_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 4
	;***      424 :     }
	;***      425 : }
	;***      426 : 
	;***      427 : /***********************************************************************************************************************
	;***      428 : * Function Name: r_uart2_callback_receiveend
	;***      429 : * Description  : This function is a callback function when UART2 finishes reception.
	;***      430 : * Arguments    : None
	;***      431 : * Return Value : None
	;***      432 : ***********************************************************************************************************************/
	;***      433 : static void r_uart2_callback_receiveend(void)
	;***      434 : {
	;***      435 :     /* Start user code. Do not edit comment generated here */
	;***      436 : //	R_UART2_Receive(g_rx_data, 32);
	;***      437 : //	R_UART2_Stop();
	;***      438 : //	R_UART2_Start();
	;***      439 : 
	;***      440 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 440
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      441 : 	isCommand(g_rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 441
	movw ax, #LOWW(_g_rx_data)
	call $!_isCommand
	;***      442 : 	commnunication_flag.recived_time_setting_flag = commnunication_flag.recived_time_setting_flag == 1 ? 2: commnunication_flag.recived_time_setting_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 442
	cmp !LOWW(_commnunication_flag+0x00004), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_1:	; bb6
	mov a, !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@16_2:	; bb9
	mov !LOWW(_commnunication_flag+0x00004), a
	;***      443 : 	commnunication_flag.recived_number_setting_flag = commnunication_flag.recived_number_setting_flag == 1 ? 2: commnunication_flag.recived_number_setting_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 443
	cmp !LOWW(_commnunication_flag+0x00003), #0x01
	mov a, #0x02
	skz
.BB@LABEL@16_3:	; bb17
	mov a, !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@16_4:	; bb21
	mov !LOWW(_commnunication_flag+0x00003), a
	;***      444 : 	if(1){
	;***      445 : 		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 445
	clrb !LOWW(_g_uart2_fault)
	;***      446 : 		if((g_rx_data[0] == H_READ)&(g_rx_data[1] == READ_TIME)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 446
	mov a, !LOWW(_g_rx_data+0x00001)
	mov b, a
	cmp a, #0x02
	mov a, !LOWW(_g_rx_data)
	mov x, a
	bnz $.BB@LABEL@16_7
.BB@LABEL@16_5:	; bb21
	cmp a, #0x52
	bnz $.BB@LABEL@16_7
.BB@LABEL@16_6:	; if_then_bb38
	;***      447 : 			commnunication_flag.send_response_time_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 447
	oneb !LOWW(_commnunication_flag+0x00001)
	br $.BB@LABEL@16_19
.BB@LABEL@16_7:	; if_else_bb
	mov a, b
	;***      448 : //			g_timerSetting.t51++;
	;***      449 : 		}else if((g_rx_data[0] == H_SET)&(g_rx_data[1] == SAVE_TIME)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 449
	cmp a, #0x14
	bnz $.BB@LABEL@16_10
.BB@LABEL@16_8:	; if_else_bb
	mov a, x
	cmp a, #0x53
	bnz $.BB@LABEL@16_10
.BB@LABEL@16_9:	; if_then_bb51
	;***      450 : 			R_UART2_Receive(g_rx_data, 69);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 450
	movw bc, #0x0045
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      451 : 			commnunication_flag.recived_time_setting_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 451
	oneb !LOWW(_commnunication_flag+0x00004)
	br $.BB@LABEL@16_19
.BB@LABEL@16_10:	; if_else_bb53
	mov a, b
	;***      452 : 		}else if((g_rx_data[0] == H_READ)&(g_rx_data[1] == READ_MACHINE_STATUS)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 452
	cmp a, #0x17
	bnz $.BB@LABEL@16_13
.BB@LABEL@16_11:	; if_else_bb53
	mov a, x
	cmp a, #0x52
	bnz $.BB@LABEL@16_13
.BB@LABEL@16_12:	; if_then_bb66
	;***      453 : 			commnunication_flag.send_respone_status_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 453
	oneb !LOWW(_commnunication_flag+0x00005)
	br $.BB@LABEL@16_19
.BB@LABEL@16_13:	; if_else_bb67
	mov a, b
	;***      454 : 		}else if((g_rx_data[0] == H_READ)&(g_rx_data[1] == READ_NUMBER)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 454
	cmp a, #0x03
	bnz $.BB@LABEL@16_16
.BB@LABEL@16_14:	; if_else_bb67
	mov a, x
	cmp a, #0x52
	bnz $.BB@LABEL@16_16
.BB@LABEL@16_15:	; if_then_bb81
	;***      455 : 			commnunication_flag.send_response_number_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 455
	oneb !LOWW(_commnunication_flag+0x00002)
	br $.BB@LABEL@16_19
.BB@LABEL@16_16:	; if_else_bb82
	mov a, b
	;***      456 : 		}else if((g_rx_data[0] == H_SET)&(g_rx_data[1] == SAVE_NUMBER)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 456
	cmp a, #0x15
	bnz $.BB@LABEL@16_19
.BB@LABEL@16_17:	; if_else_bb82
	mov a, x
	cmp a, #0x53
	bnz $.BB@LABEL@16_19
.BB@LABEL@16_18:	; if_then_bb95
	;***      457 : 			R_UART2_Receive(g_rx_data, 33);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 457
	movw bc, #0x0021
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      458 : 			commnunication_flag.recived_number_setting_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 458
	oneb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@16_19:	; if_break_bb103
	;***      459 : 		}
	;***      460 : //		if((g_rx_data[0] == H_SET)&(g_rx_data[1] == READ_NUMBER)){
	;***      461 : //			R_UART2_Receive(g_rx_data, sizeof(struct Number_Setting_s)-1);
	;***      462 : //		}else if((g_rx_data[0] == H_SET)&(g_rx_data[1] == READ_TIME)){
	;***      463 : //			R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
	;***      464 : //		}else if((g_rx_data[0] == H_READ)&(g_rx_data[1] == READ_TIME)){
	;***      465 : //			g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, 68);
	;***      466 : //			R_UART2_Send((uint8_t *)&g_timerSetting, 69);
	;***      467 : //			g_timerSetting.t51++;
	;***      468 : //		}
	;***      469 : 	}else{
	;***      470 : 		R_UART2_Receive(g_rx_data, 6);
	;***      471 : 		g_uart2_fault = 1;
	;***      472 : 	}
	;***      473 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 473
	inc !LOWW(_g_uart2_receive)
	ret
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      474 :     /* End user code. Do not edit comment generated here */
	;***      475 : }
	;***      476 : 
	;***      477 : /***********************************************************************************************************************
	;***      478 : * Function Name: r_uart2_callback_softwareoverrun
	;***      479 : * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      480 : * Arguments    : rx_data -
	;***      481 : *                    receive data
	;***      482 : * Return Value : None
	;***      483 : ***********************************************************************************************************************/
	;***      484 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 484
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      485 : {
	;***      486 :     /* Start user code. Do not edit comment generated here */
	;***      487 :     /* End user code. Do not edit comment generated here */
	;***      488 : }
	;***      489 : 
	;***      490 : /***********************************************************************************************************************
	;***      491 : * Function Name: r_uart2_callback_sendend
	;***      492 : * Description  : This function is a callback function when UART2 finishes transmission.
	;***      493 : * Arguments    : None
	;***      494 : * Return Value : None
	;***      495 : ***********************************************************************************************************************/
	;***      496 : static void r_uart2_callback_sendend(void)
	;***      497 : {
	;***      498 :     /* Start user code. Do not edit comment generated here */
	;***      499 : 	g_uart2_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 499
	inc !LOWW(_g_uart2_sendend)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      500 :     /* End user code. Do not edit comment generated here */
	;***      501 : }
	;***      502 : 
	;***      503 : /***********************************************************************************************************************
	;***      504 : * Function Name: r_uart2_callback_error
	;***      505 : * Description  : This function is a callback function when UART2 reception error occurs.
	;***      506 : * Arguments    : err_type -
	;***      507 : *                    error type value
	;***      508 : * Return Value : None
	;***      509 : ***********************************************************************************************************************/
	;***      510 : static void r_uart2_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 510
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      511 : {
	;***      512 :     /* Start user code. Do not edit comment generated here */
	;***      513 :     /* End user code. Do not edit comment generated here */
	;***      514 : }
	;***      515 : 
	;***      516 : /***********************************************************************************************************************
	;***      517 : * Function Name: r_uart3_interrupt_receive
	;***      518 : * Description  : This function is INTSR3 interrupt service routine.
	;***      519 : * Arguments    : None
	;***      520 : * Return Value : None
	;***      521 : ***********************************************************************************************************************/
	;***      522 : static void __near r_uart3_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 522
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      523 : {
	;***      524 :     volatile uint8_t rx_data;
	;***      525 :     volatile uint8_t err_type;
	;***      526 :     
	;***      527 :     err_type = (uint8_t)(SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 527
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      528 :     SIR13 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 528
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      529 : 
	;***      530 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 530
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@20_2
.BB@LABEL@20_1:	; if_then_bb
	;***      531 :     {
	;***      532 :         r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 532
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@20_2:	; if_break_bb
	;***      533 :     }
	;***      534 :     
	;***      535 :     rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 535
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      536 : 
	;***      537 :     if (g_uart3_rx_length > g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 537
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@20_6
.BB@LABEL@20_3:	; if_then_bb18
	;***      538 :     {
	;***      539 :         *gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 539
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      540 :         gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 540
	incw !LOWW(_gp_uart3_rx_address)
	;***      541 :         g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 541
	incw !LOWW(_g_uart3_rx_count)
	;***      542 : 
	;***      543 :         if (g_uart3_rx_length == g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 543
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@20_4:	; if_then_bb30
	;***      544 :         {
	;***      545 :             r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 545
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 552
	reti
.BB@LABEL@20_6:	; if_else_bb
	;***      546 :         }
	;***      547 :     }
	;***      548 :     else
	;***      549 :     {
	;***      550 :         r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 550
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@20_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      551 :     }
	;***      552 : }
	;***      553 : 
	;***      554 : /***********************************************************************************************************************
	;***      555 : * Function Name: r_uart3_interrupt_send
	;***      556 : * Description  : This function is INTST3 interrupt service routine.
	;***      557 : * Arguments    : None
	;***      558 : * Return Value : None
	;***      559 : ***********************************************************************************************************************/
	;***      560 : static void __near r_uart3_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 560
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      561 : {
	;***      562 :     if (g_uart3_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 562
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@21_3
.BB@LABEL@21_1:	; if_else_bb
	;***      563 :     {
	;***      564 :         TXD3 = *gp_uart3_tx_address;
	;***      565 :         gp_uart3_tx_address++;
	;***      566 :         g_uart3_tx_count--;
	;***      567 :     }
	;***      568 :     else
	;***      569 :     {
	;***      570 :         r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 570
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 572
	reti
.BB@LABEL@21_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 564
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 565
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 566
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@21_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      571 :     }
	;***      572 : }
	;***      573 : 
	;***      574 : /***********************************************************************************************************************
	;***      575 : * Function Name: r_uart3_callback_receiveend
	;***      576 : * Description  : This function is a callback function when UART3 finishes reception.
	;***      577 : * Arguments    : None
	;***      578 : * Return Value : None
	;***      579 : ***********************************************************************************************************************/
	;***      580 : static void r_uart3_callback_receiveend(void)
	;***      581 : {
	;***      582 :     /* Start user code. Do not edit comment generated here */
	;***      583 : 	R_UART3_Receive(rec_buf, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 583
	movw bc, #0x0006
	movw ax, #LOWW(_rec_buf)
	call !!_R_UART3_Receive
	;***      584 : 	if((rec_buf[0]==H_SET)|(rec_buf[0]==SAVE_TIME)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 584
	mov a, !LOWW(_rec_buf)
	cmp a, #0x53
	oneb x
	skz
.BB@LABEL@22_1:	; entry
	clrb x
.BB@LABEL@22_2:	; entry
	cmp a, #0x14
	oneb a
	skz
.BB@LABEL@22_3:	; entry
	clrb a
.BB@LABEL@22_4:	; entry
	or a, x
	sknz
.BB@LABEL@22_5:	; return
	;***      585 : 		rec_buf[2] = 0xff;
	;***      586 : 		O_RS485_MODE_PIN = 1U;
	;***      587 : 		R_UART3_Send(rec_buf, 6);
	;***      588 : 	}
	;***      589 :     /* End user code. Do not edit comment generated here */
	;***      590 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 590
	ret
.BB@LABEL@22_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 585
	mov !LOWW(_rec_buf+0x00002), #0xFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 586
	set1 0xFFF00.0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 587
	movw bc, #0x0006
	movw ax, #LOWW(_rec_buf)
	br !!_R_UART3_Send
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      591 : 
	;***      592 : /***********************************************************************************************************************
	;***      593 : * Function Name: r_uart3_callback_softwareoverrun
	;***      594 : * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      595 : * Arguments    : rx_data -
	;***      596 : *                    receive data
	;***      597 : * Return Value : None
	;***      598 : ***********************************************************************************************************************/
	;***      599 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 599
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      600 : {
	;***      601 :     /* Start user code. Do not edit comment generated here */
	;***      602 :     /* End user code. Do not edit comment generated here */
	;***      603 : }
	;***      604 : 
	;***      605 : /***********************************************************************************************************************
	;***      606 : * Function Name: r_uart3_callback_sendend
	;***      607 : * Description  : This function is a callback function when UART3 finishes transmission.
	;***      608 : * Arguments    : None
	;***      609 : * Return Value : None
	;***      610 : ***********************************************************************************************************************/
	;***      611 : static void r_uart3_callback_sendend(void)
	;***      612 : {
	;***      613 :     /* Start user code. Do not edit comment generated here */
	;***      614 : 	g_uart3_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 614
	inc !LOWW(_g_uart3_sendend)
	;***      615 : 	O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 615
	clr1 0xFFF00.0
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      616 :     /* End user code. Do not edit comment generated here */
	;***      617 : }
	;***      618 : 
	;***      619 : /***********************************************************************************************************************
	;***      620 : * Function Name: r_uart3_callback_error
	;***      621 : * Description  : This function is a callback function when UART3 reception error occurs.
	;***      622 : * Arguments    : err_type -
	;***      623 : *                    error type value
	;***      624 : * Return Value : None
	;***      625 : ***********************************************************************************************************************/
	;***      626 : static void r_uart3_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 626
	ret
	;***      627 : {
	;***      628 :     /* Start user code. Do not edit comment generated here */
	;***      629 :     /* End user code. Do not edit comment generated here */
	;***      630 : }
	;***      631 : 
	;***      632 : /* Start user code for adding. Do not edit comment generated here */
	;***      633 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
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
	.DS (6)
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
