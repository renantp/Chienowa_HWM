#CC-RL Compiler RL78 Assembler Source
#@  CC-RL Version : V1.10.00 [20 Nov 2020]
#@  Commmand :
#@   -cpu=S3
#@   -c
#@   -dev=D:/Chieniwa/E2_Studio/.eclipse/com.renesas.platform_1223251604/DebugComp/RL78/RL78/Common/DR5F104ML.DVF
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
#@  compiled at Tue Aug 23 10:01:01 2022

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
	.EXTERN _Raspberry_uart2_handle
	.EXTERN _R_UART3_Receive

	.SECTION .text,TEXT
_r_uart1_interrupt_receive@1	.vector 0x0026
_r_uart1_interrupt_receive@1:
	.STACK _r_uart1_interrupt_receive@1 = 16
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
	;***       17 : * Copyright (C) 2011, 2021 Renesas Electronics Corporation. All rights reserved.
	;***       18 : ***********************************************************************************************************************/
	;***       19 : 
	;***       20 : /***********************************************************************************************************************
	;***       21 : * File Name    : r_cg_serial_user.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.06.02 [08 Nov 2021]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for Serial module.
	;***       26 : * Creation Date: 8/23/2022
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_serial.h"
	;***       34 : /* Start user code for include. Do not edit comment generated here */
	;***       35 : #include "r_cg_wdt.h"
	;***       36 : #include "r_cg_userdefine.h"
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
	;***       85 : volatile uint8_t send_response_flag, send_response_time_flag,
	;***       86 : 		send_response_number_flag, recived_time_setting_flag,
	;***       87 : 		send_respone_status_flag, recived_number_setting_flag;
	;***       88 : volatile struct Communicaition_flag_s g_commnunication_flag;
	;***       89 : volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end,
	;***       90 : 		g_uart1_send, g_uart2_sendend, g_uart2_receive;
	;***       91 : uint8_t g_rx_data[4 * 40];
	;***       92 : uint8_t g_uart3_rx_data[8];
	;***       93 : volatile uint8_t g_uart2_fault;
	;***       94 : volatile uint8_t g_uart3_sendend;
	;***       95 : 
	;***       96 : /* End user code. Do not edit comment generated here */
	;***       97 : 
	;***       98 : /***********************************************************************************************************************
	;***       99 : * Function Name: r_uart1_interrupt_receive
	;***      100 : * Description  : This function is INTSR1 interrupt service routine.
	;***      101 : * Arguments    : None
	;***      102 : * Return Value : None
	;***      103 : ***********************************************************************************************************************/
	;***      104 : static void __near r_uart1_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 104
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      105 : {
	;***      106 :     volatile uint8_t rx_data;
	;***      107 :     volatile uint8_t err_type;
	;***      108 :     
	;***      109 :     err_type = (uint8_t)(SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 109
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      110 :     SIR03 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 110
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      111 : 
	;***      112 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 112
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@1_2
.BB@LABEL@1_1:	; if_then_bb
	;***      113 :     {
	;***      114 :         r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 114
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@1_2:	; if_break_bb
	;***      115 :     }
	;***      116 :     
	;***      117 :     rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 117
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      118 : 
	;***      119 :     if (g_uart1_rx_length > g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 119
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb18
	;***      120 :     {
	;***      121 :         *gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 121
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      122 :         gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 122
	incw !LOWW(_gp_uart1_rx_address)
	;***      123 :         g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 123
	incw !LOWW(_g_uart1_rx_count)
	;***      124 : 
	;***      125 :         if (g_uart1_rx_length == g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 125
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@1_4:	; if_then_bb30
	;***      126 :         {
	;***      127 :             r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 127
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 134
	reti
.BB@LABEL@1_6:	; if_else_bb
	;***      128 :         }
	;***      129 :     }
	;***      130 :     else
	;***      131 :     {
	;***      132 :         r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 132
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@1_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      133 :     }
	;***      134 : }
	;***      135 : 
	;***      136 : /***********************************************************************************************************************
	;***      137 : * Function Name: r_uart1_interrupt_send
	;***      138 : * Description  : This function is INTST1 interrupt service routine.
	;***      139 : * Arguments    : None
	;***      140 : * Return Value : None
	;***      141 : ***********************************************************************************************************************/
	;***      142 : static void __near r_uart1_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 142
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      143 : {
	;***      144 :     if (g_uart1_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 144
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_3
.BB@LABEL@2_1:	; if_else_bb
	;***      145 :     {
	;***      146 :         TXD1 = *gp_uart1_tx_address;
	;***      147 :         gp_uart1_tx_address++;
	;***      148 :         g_uart1_tx_count--;
	;***      149 :     }
	;***      150 :     else
	;***      151 :     {
	;***      152 :         r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 152
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 154
	reti
.BB@LABEL@2_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 146
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 147
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 148
	decw !LOWW(_g_uart1_tx_count)
	br $.BB@LABEL@2_2
	.SECTION .textf,TEXTF
_r_uart1_callback_receiveend@1:
	.STACK _r_uart1_callback_receiveend@1 = 4
	;***      153 :     }
	;***      154 : }
	;***      155 : 
	;***      156 : /***********************************************************************************************************************
	;***      157 : * Function Name: r_uart1_callback_receiveend
	;***      158 : * Description  : This function is a callback function when UART1 finishes reception.
	;***      159 : * Arguments    : None
	;***      160 : * Return Value : None
	;***      161 : ***********************************************************************************************************************/
	;***      162 : static void r_uart1_callback_receiveend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 162
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      163 : {
	;***      164 :     /* Start user code. Do not edit comment generated here */
	;***      165 : 	/* End user code. Do not edit comment generated here */
	;***      166 : }
	;***      167 : 
	;***      168 : /***********************************************************************************************************************
	;***      169 : * Function Name: r_uart1_callback_softwareoverrun
	;***      170 : * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      171 : * Arguments    : rx_data -
	;***      172 : *                    receive data
	;***      173 : * Return Value : None
	;***      174 : ***********************************************************************************************************************/
	;***      175 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 175
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      176 : {
	;***      177 :     /* Start user code. Do not edit comment generated here */
	;***      178 : 	/* End user code. Do not edit comment generated here */
	;***      179 : }
	;***      180 : 
	;***      181 : /***********************************************************************************************************************
	;***      182 : * Function Name: r_uart1_callback_sendend
	;***      183 : * Description  : This function is a callback function when UART1 finishes transmission.
	;***      184 : * Arguments    : None
	;***      185 : * Return Value : None
	;***      186 : ***********************************************************************************************************************/
	;***      187 : static void r_uart1_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 187
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      188 : {
	;***      189 :     /* Start user code. Do not edit comment generated here */
	;***      190 : 	/* End user code. Do not edit comment generated here */
	;***      191 : }
	;***      192 : 
	;***      193 : /***********************************************************************************************************************
	;***      194 : * Function Name: r_uart1_callback_error
	;***      195 : * Description  : This function is a callback function when UART1 reception error occurs.
	;***      196 : * Arguments    : err_type -
	;***      197 : *                    error type value
	;***      198 : * Return Value : None
	;***      199 : ***********************************************************************************************************************/
	;***      200 : static void r_uart1_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 200
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      201 : {
	;***      202 :     /* Start user code. Do not edit comment generated here */
	;***      203 : 	/* End user code. Do not edit comment generated here */
	;***      204 : }
	;***      205 : 
	;***      206 : /***********************************************************************************************************************
	;***      207 : * Function Name: r_csi00_interrupt
	;***      208 : * Description  : This function is INTCSI00 interrupt service routine.
	;***      209 : * Arguments    : None
	;***      210 : * Return Value : None
	;***      211 : ***********************************************************************************************************************/
	;***      212 : static void __near r_csi00_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 212
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      213 : {
	;***      214 :     volatile uint8_t err_type;
	;***      215 : 
	;***      216 :     err_type = (uint8_t)(SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 216
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      217 :     SIR00 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 217
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      218 : 
	;***      219 :     if (err_type != 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 219
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 232
	reti
.BB@LABEL@7_2:	; if_then_bb
	;***      220 :     {
	;***      221 :         if (g_csi00_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 221
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@7_4
.BB@LABEL@7_3:	; if_else_bb
	;***      222 :         {
	;***      223 :             SIO00 = *gp_csi00_tx_address;
	;***      224 :             gp_csi00_tx_address++;
	;***      225 :             g_csi00_tx_count--;
	;***      226 :         }
	;***      227 :         else
	;***      228 :         {
	;***      229 :             r_csi00_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 229
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@7_1
.BB@LABEL@7_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 223
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 224
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 225
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@7_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      230 :         }
	;***      231 :     }
	;***      232 : }
	;***      233 : 
	;***      234 : /***********************************************************************************************************************
	;***      235 : * Function Name: r_csi00_callback_sendend
	;***      236 : * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      237 : * Arguments    : None
	;***      238 : * Return Value : None
	;***      239 : ***********************************************************************************************************************/
	;***      240 : static void r_csi00_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 240
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      241 : {
	;***      242 :     /* Start user code. Do not edit comment generated here */
	;***      243 : 	/* End user code. Do not edit comment generated here */
	;***      244 : }
	;***      245 : 
	;***      246 : /***********************************************************************************************************************
	;***      247 : * Function Name: r_csi01_interrupt
	;***      248 : * Description  : This function is INTCSI01 interrupt service routine.
	;***      249 : * Arguments    : None
	;***      250 : * Return Value : None
	;***      251 : ***********************************************************************************************************************/
	;***      252 : static void __near r_csi01_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 252
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      253 : {
	;***      254 :     volatile uint8_t err_type;
	;***      255 :     volatile uint8_t sio_dummy;
	;***      256 : 
	;***      257 :     err_type = (uint8_t)(SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 257
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      258 :     SIR01 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 258
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      259 : 
	;***      260 :     if (1U == err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 260
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@9_2
.BB@LABEL@9_1:	; if_then_bb
	;***      261 :     {
	;***      262 :         r_csi01_callback_error(err_type);    /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 262
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@9_15
.BB@LABEL@9_2:	; if_else_bb
	;***      263 :     }
	;***      264 :     else
	;***      265 :     {
	;***      266 :         if (g_csi01_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 266
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_8
.BB@LABEL@9_3:	; if_else_bb42
	;***      267 :         {
	;***      268 :             if (0U != gp_csi01_rx_address)
	;***      269 :             {
	;***      270 :                 *gp_csi01_rx_address = SIO01;
	;***      271 :                 gp_csi01_rx_address++;
	;***      272 :             }
	;***      273 :             else
	;***      274 :             {
	;***      275 :                 sio_dummy = SIO01;
	;***      276 :             }
	;***      277 : 
	;***      278 :             if (0U != gp_csi01_tx_address)
	;***      279 :             {
	;***      280 :                 SIO01 = *gp_csi01_tx_address;
	;***      281 :                 gp_csi01_tx_address++;
	;***      282 :             }
	;***      283 :             else
	;***      284 :             {
	;***      285 :                 SIO01 = 0xFFU;
	;***      286 :             }
	;***      287 : 
	;***      288 :             g_csi01_tx_count--;
	;***      289 :         }
	;***      290 :         else 
	;***      291 :         {
	;***      292 :             if (0U == g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 292
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@9_7
.BB@LABEL@9_4:	; if_then_bb47
	;***      293 :             {
	;***      294 :                 if (0U != gp_csi01_rx_address)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 294
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_6
.BB@LABEL@9_5:	; if_else_bb55
	;***      295 :                 {
	;***      296 :                     *gp_csi01_rx_address = SIO01;
	;***      297 :                 }
	;***      298 :                 else
	;***      299 :                 {
	;***      300 :                     sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 300
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@9_7
.BB@LABEL@9_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 296
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@9_7:	; if_break_bb59
	;***      301 :                 }
	;***      302 :             }
	;***      303 : 
	;***      304 :             r_csi01_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 304
	call !!_r_csi01_callback_sendend@1
	;***      305 :             r_csi01_callback_receiveend();    /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 305
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@9_15
.BB@LABEL@9_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 268
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_10
.BB@LABEL@9_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 275
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@9_11
.BB@LABEL@9_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 270
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 271
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@9_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 278
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_13
.BB@LABEL@9_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 285
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@9_14
.BB@LABEL@9_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 280
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 281
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@9_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 288
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 308
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      306 :         }
	;***      307 :     }
	;***      308 : }
	;***      309 : 
	;***      310 : /***********************************************************************************************************************
	;***      311 : * Function Name: r_csi01_callback_receiveend
	;***      312 : * Description  : This function is a callback function when CSI01 finishes reception.
	;***      313 : * Arguments    : None
	;***      314 : * Return Value : None
	;***      315 : ***********************************************************************************************************************/
	;***      316 : static void r_csi01_callback_receiveend(void)
	;***      317 : {
	;***      318 :     /* Start user code. Do not edit comment generated here */
	;***      319 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 319
	inc !LOWW(_g_csi_rev_end)
	;***      320 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 320
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      321 : 	/* End user code. Do not edit comment generated here */
	;***      322 : }
	;***      323 : 
	;***      324 : /***********************************************************************************************************************
	;***      325 : * Function Name: r_csi01_callback_error
	;***      326 : * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      327 : * Arguments    : err_type -
	;***      328 : *                    error type value
	;***      329 : * Return Value : None
	;***      330 : ***********************************************************************************************************************/
	;***      331 : static void r_csi01_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 331
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      332 : {
	;***      333 :     /* Start user code. Do not edit comment generated here */
	;***      334 : 
	;***      335 : 	/* End user code. Do not edit comment generated here */
	;***      336 : }
	;***      337 : 
	;***      338 : /***********************************************************************************************************************
	;***      339 : * Function Name: r_csi01_callback_sendend
	;***      340 : * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      341 : * Arguments    : None
	;***      342 : * Return Value : None
	;***      343 : ***********************************************************************************************************************/
	;***      344 : static void r_csi01_callback_sendend(void)
	;***      345 : {
	;***      346 :     /* Start user code. Do not edit comment generated here */
	;***      347 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 347
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      348 : 	/* End user code. Do not edit comment generated here */
	;***      349 : }
	;***      350 : 
	;***      351 : /***********************************************************************************************************************
	;***      352 : * Function Name: r_uart2_interrupt_receive
	;***      353 : * Description  : This function is INTSR2 interrupt service routine.
	;***      354 : * Arguments    : None
	;***      355 : * Return Value : None
	;***      356 : ***********************************************************************************************************************/
	;***      357 : static void __near r_uart2_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 357
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      358 : {
	;***      359 :     volatile uint8_t rx_data;
	;***      360 :     volatile uint8_t err_type;
	;***      361 :     
	;***      362 :     err_type = (uint8_t)(SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 362
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      363 :     SIR11 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 363
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      364 : 
	;***      365 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 365
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@13_2
.BB@LABEL@13_1:	; if_then_bb
	;***      366 :     {
	;***      367 :         r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 367
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@13_2:	; if_break_bb
	;***      368 :     }
	;***      369 :     
	;***      370 :     rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 370
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      371 : 
	;***      372 :     if (g_uart2_rx_length > g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 372
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@13_6
.BB@LABEL@13_3:	; if_then_bb18
	;***      373 :     {
	;***      374 :         *gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 374
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      375 :         gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 375
	incw !LOWW(_gp_uart2_rx_address)
	;***      376 :         g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 376
	incw !LOWW(_g_uart2_rx_count)
	;***      377 : 
	;***      378 :         if (g_uart2_rx_length == g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 378
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@13_4:	; if_then_bb30
	;***      379 :         {
	;***      380 :             r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 380
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 387
	reti
.BB@LABEL@13_6:	; if_else_bb
	;***      381 :         }
	;***      382 :     }
	;***      383 :     else
	;***      384 :     {
	;***      385 :         r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 385
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@13_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      386 :     }
	;***      387 : }
	;***      388 : 
	;***      389 : /***********************************************************************************************************************
	;***      390 : * Function Name: r_uart2_interrupt_send
	;***      391 : * Description  : This function is INTST2 interrupt service routine.
	;***      392 : * Arguments    : None
	;***      393 : * Return Value : None
	;***      394 : ***********************************************************************************************************************/
	;***      395 : static void __near r_uart2_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 395
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      396 : {
	;***      397 :     if (g_uart2_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 397
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@14_3
.BB@LABEL@14_1:	; if_else_bb
	;***      398 :     {
	;***      399 :         TXD2 = *gp_uart2_tx_address;
	;***      400 :         gp_uart2_tx_address++;
	;***      401 :         g_uart2_tx_count--;
	;***      402 :     }
	;***      403 :     else
	;***      404 :     {
	;***      405 :         r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 405
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 407
	reti
.BB@LABEL@14_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 399
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 400
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 401
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@14_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 4
	;***      406 :     }
	;***      407 : }
	;***      408 : 
	;***      409 : /***********************************************************************************************************************
	;***      410 : * Function Name: r_uart2_callback_receiveend
	;***      411 : * Description  : This function is a callback function when UART2 finishes reception.
	;***      412 : * Arguments    : None
	;***      413 : * Return Value : None
	;***      414 : ***********************************************************************************************************************/
	;***      415 : static void r_uart2_callback_receiveend(void)
	;***      416 : {
	;***      417 :     /* Start user code. Do not edit comment generated here */
	;***      418 : 	Raspberry_uart2_handle();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 418
	br !!_Raspberry_uart2_handle
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      419 : 	/* End user code. Do not edit comment generated here */
	;***      420 : }
	;***      421 : 
	;***      422 : /***********************************************************************************************************************
	;***      423 : * Function Name: r_uart2_callback_softwareoverrun
	;***      424 : * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      425 : * Arguments    : rx_data -
	;***      426 : *                    receive data
	;***      427 : * Return Value : None
	;***      428 : ***********************************************************************************************************************/
	;***      429 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 429
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      430 : {
	;***      431 :     /* Start user code. Do not edit comment generated here */
	;***      432 : 	/* End user code. Do not edit comment generated here */
	;***      433 : }
	;***      434 : 
	;***      435 : /***********************************************************************************************************************
	;***      436 : * Function Name: r_uart2_callback_sendend
	;***      437 : * Description  : This function is a callback function when UART2 finishes transmission.
	;***      438 : * Arguments    : None
	;***      439 : * Return Value : None
	;***      440 : ***********************************************************************************************************************/
	;***      441 : static void r_uart2_callback_sendend(void)
	;***      442 : {
	;***      443 :     /* Start user code. Do not edit comment generated here */
	;***      444 : 	g_uart2_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 444
	inc !LOWW(_g_uart2_sendend)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      445 : 	/* End user code. Do not edit comment generated here */
	;***      446 : }
	;***      447 : 
	;***      448 : /***********************************************************************************************************************
	;***      449 : * Function Name: r_uart2_callback_error
	;***      450 : * Description  : This function is a callback function when UART2 reception error occurs.
	;***      451 : * Arguments    : err_type -
	;***      452 : *                    error type value
	;***      453 : * Return Value : None
	;***      454 : ***********************************************************************************************************************/
	;***      455 : static void r_uart2_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 455
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      456 : {
	;***      457 :     /* Start user code. Do not edit comment generated here */
	;***      458 : 	/* End user code. Do not edit comment generated here */
	;***      459 : }
	;***      460 : 
	;***      461 : /***********************************************************************************************************************
	;***      462 : * Function Name: r_uart3_interrupt_receive
	;***      463 : * Description  : This function is INTSR3 interrupt service routine.
	;***      464 : * Arguments    : None
	;***      465 : * Return Value : None
	;***      466 : ***********************************************************************************************************************/
	;***      467 : static void __near r_uart3_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 467
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      468 : {
	;***      469 :     volatile uint8_t rx_data;
	;***      470 :     volatile uint8_t err_type;
	;***      471 :     
	;***      472 :     err_type = (uint8_t)(SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 472
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      473 :     SIR13 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 473
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      474 : 
	;***      475 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 475
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@19_2
.BB@LABEL@19_1:	; if_then_bb
	;***      476 :     {
	;***      477 :         r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 477
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@19_2:	; if_break_bb
	;***      478 :     }
	;***      479 :     
	;***      480 :     rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 480
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      481 : 
	;***      482 :     if (g_uart3_rx_length > g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 482
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@19_6
.BB@LABEL@19_3:	; if_then_bb18
	;***      483 :     {
	;***      484 :         *gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 484
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      485 :         gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 485
	incw !LOWW(_gp_uart3_rx_address)
	;***      486 :         g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 486
	incw !LOWW(_g_uart3_rx_count)
	;***      487 : 
	;***      488 :         if (g_uart3_rx_length == g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 488
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@19_4:	; if_then_bb30
	;***      489 :         {
	;***      490 :             r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 490
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 497
	reti
.BB@LABEL@19_6:	; if_else_bb
	;***      491 :         }
	;***      492 :     }
	;***      493 :     else
	;***      494 :     {
	;***      495 :         r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 495
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@19_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      496 :     }
	;***      497 : }
	;***      498 : 
	;***      499 : /***********************************************************************************************************************
	;***      500 : * Function Name: r_uart3_interrupt_send
	;***      501 : * Description  : This function is INTST3 interrupt service routine.
	;***      502 : * Arguments    : None
	;***      503 : * Return Value : None
	;***      504 : ***********************************************************************************************************************/
	;***      505 : static void __near r_uart3_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 505
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      506 : {
	;***      507 :     if (g_uart3_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 507
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@20_3
.BB@LABEL@20_1:	; if_else_bb
	;***      508 :     {
	;***      509 :         TXD3 = *gp_uart3_tx_address;
	;***      510 :         gp_uart3_tx_address++;
	;***      511 :         g_uart3_tx_count--;
	;***      512 :     }
	;***      513 :     else
	;***      514 :     {
	;***      515 :         r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 515
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 517
	reti
.BB@LABEL@20_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 509
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 510
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 511
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@20_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      516 :     }
	;***      517 : }
	;***      518 : 
	;***      519 : /***********************************************************************************************************************
	;***      520 : * Function Name: r_uart3_callback_receiveend
	;***      521 : * Description  : This function is a callback function when UART3 finishes reception.
	;***      522 : * Arguments    : None
	;***      523 : * Return Value : None
	;***      524 : ***********************************************************************************************************************/
	;***      525 : static void r_uart3_callback_receiveend(void)
	;***      526 : {
	;***      527 :     /* Start user code. Do not edit comment generated here */
	;***      528 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 528
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      529 : 	if (g_uart3_rx_data[0] == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 529
	mov a, !LOWW(_g_uart3_rx_data)
	cmp a, #0x01
	bnz $.BB@LABEL@21_7
.BB@LABEL@21_1:	; if_then_bb
	;***      530 : 		//Read timer setting
	;***      531 : 		if ((rs485_rx_p[0] == H_READ) && (rs485_rx_p[1] == READ_TIME)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 531
	cmp !LOWW(_g_uart3_rx_data+0x00001), #0x52
	bnz $.BB@LABEL@21_6
.BB@LABEL@21_2:	; bb
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x02
	bnz $.BB@LABEL@21_4
.BB@LABEL@21_3:	; if_then_bb25
	;***      532 : 			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 532
	oneb !LOWW(_g_commnunication_flag+0x00011)
	ret
.BB@LABEL@21_4:	; bb32
	;***      533 : 		} else if ((rs485_rx_p[0] == 82) && (rs485_rx_p[1] == 24)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 533
	cmp !LOWW(_g_uart3_rx_data+0x00002), #0x18
	sknz
.BB@LABEL@21_5:	; if_then_bb47
	;***      534 : 			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 534
	oneb !LOWW(_g_commnunication_flag+0x00012)
.BB@LABEL@21_6:	; if_else_bb.if_else_bb48_crit_edge.critedge
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 551
	ret
.BB@LABEL@21_7:	; if_else_bb97
	;***      535 : 		} else if ((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 70)) {
	;***      536 : 			//TODO: Start Water Softener
	;***      537 : 
	;***      538 : 		} else if ((rs485_rx_p[0] == 83) && (rs485_rx_p[1] == 80)) {
	;***      539 : 			//TODO: Stop Water Softener + Time of SNP ON (4 bytes)
	;***      540 : 		}
	;***      541 : 	} else if (g_uart3_rx_data[0] == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 541
	cmp a, #0x02
	bnz $.BB@LABEL@21_12
.BB@LABEL@21_8:	; if_then_bb103
	;***      542 : 		if ((rs485_rx_p[0] == 11)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 542
	mov a, !LOWW(_g_uart3_rx_data+0x00001)
	cmp a, #0x0B
	bnz $.BB@LABEL@21_10
.BB@LABEL@21_9:	; if_then_bb111
	;***      543 : 			g_commnunication_flag.rs485_send_to_valve_response_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 543
	oneb !LOWW(_g_commnunication_flag+0x00013)
	ret
.BB@LABEL@21_10:	; if_else_bb112
	;***      544 : 		} else if ((rs485_rx_p[0] == 12)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 544
	cmp a, #0x0C
	bnz $.BB@LABEL@21_14
.BB@LABEL@21_11:	; if_then_bb120
	;***      545 : 			g_commnunication_flag.rs485_get_valve_gesture_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 545
	oneb !LOWW(_g_commnunication_flag+0x00014)
	ret
.BB@LABEL@21_12:	; if_else_bb123
	;***      546 : 		}
	;***      547 : 	} else if (g_uart3_rx_data[0] != 0xff) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 547
	inc a
	skz
.BB@LABEL@21_13:	; if_then_bb129
	;***      548 : 		g_commnunication_flag.rs485_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 548
	oneb !LOWW(_g_commnunication_flag+0x00015)
.BB@LABEL@21_14:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 551
	ret
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      549 : 	}
	;***      550 : 	/* End user code. Do not edit comment generated here */
	;***      551 : }
	;***      552 : 
	;***      553 : /***********************************************************************************************************************
	;***      554 : * Function Name: r_uart3_callback_softwareoverrun
	;***      555 : * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      556 : * Arguments    : rx_data -
	;***      557 : *                    receive data
	;***      558 : * Return Value : None
	;***      559 : ***********************************************************************************************************************/
	;***      560 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 560
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      561 : {
	;***      562 :     /* Start user code. Do not edit comment generated here */
	;***      563 : 	/* End user code. Do not edit comment generated here */
	;***      564 : }
	;***      565 : 
	;***      566 : /***********************************************************************************************************************
	;***      567 : * Function Name: r_uart3_callback_sendend
	;***      568 : * Description  : This function is a callback function when UART3 finishes transmission.
	;***      569 : * Arguments    : None
	;***      570 : * Return Value : None
	;***      571 : ***********************************************************************************************************************/
	;***      572 : static void r_uart3_callback_sendend(void)
	;***      573 : {
	;***      574 :     /* Start user code. Do not edit comment generated here */
	;***      575 : 	g_uart3_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 575
	inc !LOWW(_g_uart3_sendend)
	;***      576 : 	O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 576
	clr1 0xFFF00.0
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      577 : 	/* End user code. Do not edit comment generated here */
	;***      578 : }
	;***      579 : 
	;***      580 : /***********************************************************************************************************************
	;***      581 : * Function Name: r_uart3_callback_error
	;***      582 : * Description  : This function is a callback function when UART3 reception error occurs.
	;***      583 : * Arguments    : err_type -
	;***      584 : *                    error type value
	;***      585 : * Return Value : None
	;***      586 : ***********************************************************************************************************************/
	;***      587 : static void r_uart3_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 587
	ret
	;***      588 : {
	;***      589 :     /* Start user code. Do not edit comment generated here */
	;***      590 : 	/* End user code. Do not edit comment generated here */
	;***      591 : }
	;***      592 : 
	;***      593 : /* Start user code for adding. Do not edit comment generated here */
	;***      594 : /* End user code. Do not edit comment generated here */
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
	.DS (25)
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
