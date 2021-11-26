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
#@  compiled at Fri Nov 26 10:19:11 2021

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
	.PUBLIC _g_csi_count
	.PUBLIC _g_csi_err
	.PUBLIC _g_csi_send_end
	.PUBLIC _g_csi_rev_end
	.PUBLIC _g_uart1_end
	.PUBLIC _g_uart2_send
	.PUBLIC _g_uart2_receive
	.PUBLIC _g_rx_data
	.PUBLIC _g_uart2_fault
	.EXTERN _R_CSI01_Stop
	.EXTERN _R_UART2_Receive

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
	;***       17 : * Copyright (C) 2011, 2020 Renesas Electronics Corporation. All rights reserved.
	;***       18 : ***********************************************************************************************************************/
	;***       19 : 
	;***       20 : /***********************************************************************************************************************
	;***       21 : * File Name    : r_cg_serial_user.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for Serial module.
	;***       26 : * Creation Date: 24/11/2021
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
	;***       83 : volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end, g_uart1_end, g_uart2_send, g_uart2_receive;
	;***       84 : uint8_t g_rx_data[32];
	;***       85 : volatile uint8_t g_uart2_fault;
	;***       86 : /* End user code. Do not edit comment generated here */
	;***       87 : 
	;***       88 : /***********************************************************************************************************************
	;***       89 : * Function Name: r_uart1_interrupt_receive
	;***       90 : * Description  : This function is INTSR1 interrupt service routine.
	;***       91 : * Arguments    : None
	;***       92 : * Return Value : None
	;***       93 : ***********************************************************************************************************************/
	;***       94 : static void __near r_uart1_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 94
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***       95 : {
	;***       96 :     volatile uint8_t rx_data;
	;***       97 :     volatile uint8_t err_type;
	;***       98 :     
	;***       99 :     err_type = (uint8_t)(SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 99
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      100 :     SIR03 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 100
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      101 : 
	;***      102 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 102
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@1_2
.BB@LABEL@1_1:	; if_then_bb
	;***      103 :     {
	;***      104 :         r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 104
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@1_2:	; if_break_bb
	;***      105 :     }
	;***      106 :     
	;***      107 :     rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 107
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      108 : 
	;***      109 :     if (g_uart1_rx_length > g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 109
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb18
	;***      110 :     {
	;***      111 :         *gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 111
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      112 :         gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 112
	incw !LOWW(_gp_uart1_rx_address)
	;***      113 :         g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 113
	incw !LOWW(_g_uart1_rx_count)
	;***      114 : 
	;***      115 :         if (g_uart1_rx_length == g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 115
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@1_4:	; if_then_bb30
	;***      116 :         {
	;***      117 :             r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 117
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 124
	reti
.BB@LABEL@1_6:	; if_else_bb
	;***      118 :         }
	;***      119 :     }
	;***      120 :     else
	;***      121 :     {
	;***      122 :         r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 122
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@1_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      123 :     }
	;***      124 : }
	;***      125 : 
	;***      126 : /***********************************************************************************************************************
	;***      127 : * Function Name: r_uart1_interrupt_send
	;***      128 : * Description  : This function is INTST1 interrupt service routine.
	;***      129 : * Arguments    : None
	;***      130 : * Return Value : None
	;***      131 : ***********************************************************************************************************************/
	;***      132 : static void __near r_uart1_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 132
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      133 : {
	;***      134 :     if (g_uart1_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 134
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_3
.BB@LABEL@2_1:	; if_else_bb
	;***      135 :     {
	;***      136 :         TXD1 = *gp_uart1_tx_address;
	;***      137 :         gp_uart1_tx_address++;
	;***      138 :         g_uart1_tx_count--;
	;***      139 :     }
	;***      140 :     else
	;***      141 :     {
	;***      142 :         r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 142
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 144
	reti
.BB@LABEL@2_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 136
	movw de, !LOWW(_gp_uart1_tx_address)
	mov a, [de]
	mov 0xFFF44, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 137
	incw de
	movw ax, de
	movw !LOWW(_gp_uart1_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 138
	decw !LOWW(_g_uart1_tx_count)
	br $.BB@LABEL@2_2
	.SECTION .textf,TEXTF
_r_uart1_callback_receiveend@1:
	.STACK _r_uart1_callback_receiveend@1 = 4
	;***      143 :     }
	;***      144 : }
	;***      145 : 
	;***      146 : /***********************************************************************************************************************
	;***      147 : * Function Name: r_uart1_callback_receiveend
	;***      148 : * Description  : This function is a callback function when UART1 finishes reception.
	;***      149 : * Arguments    : None
	;***      150 : * Return Value : None
	;***      151 : ***********************************************************************************************************************/
	;***      152 : static void r_uart1_callback_receiveend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 152
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      153 : {
	;***      154 :     /* Start user code. Do not edit comment generated here */
	;***      155 :     /* End user code. Do not edit comment generated here */
	;***      156 : }
	;***      157 : 
	;***      158 : /***********************************************************************************************************************
	;***      159 : * Function Name: r_uart1_callback_softwareoverrun
	;***      160 : * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      161 : * Arguments    : rx_data -
	;***      162 : *                    receive data
	;***      163 : * Return Value : None
	;***      164 : ***********************************************************************************************************************/
	;***      165 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 165
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      166 : {
	;***      167 :     /* Start user code. Do not edit comment generated here */
	;***      168 :     /* End user code. Do not edit comment generated here */
	;***      169 : }
	;***      170 : 
	;***      171 : /***********************************************************************************************************************
	;***      172 : * Function Name: r_uart1_callback_sendend
	;***      173 : * Description  : This function is a callback function when UART1 finishes transmission.
	;***      174 : * Arguments    : None
	;***      175 : * Return Value : None
	;***      176 : ***********************************************************************************************************************/
	;***      177 : static void r_uart1_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 177
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      178 : {
	;***      179 :     /* Start user code. Do not edit comment generated here */
	;***      180 :     /* End user code. Do not edit comment generated here */
	;***      181 : }
	;***      182 : 
	;***      183 : /***********************************************************************************************************************
	;***      184 : * Function Name: r_uart1_callback_error
	;***      185 : * Description  : This function is a callback function when UART1 reception error occurs.
	;***      186 : * Arguments    : err_type -
	;***      187 : *                    error type value
	;***      188 : * Return Value : None
	;***      189 : ***********************************************************************************************************************/
	;***      190 : static void r_uart1_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 190
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      191 : {
	;***      192 :     /* Start user code. Do not edit comment generated here */
	;***      193 :     /* End user code. Do not edit comment generated here */
	;***      194 : }
	;***      195 : 
	;***      196 : /***********************************************************************************************************************
	;***      197 : * Function Name: r_csi00_interrupt
	;***      198 : * Description  : This function is INTCSI00 interrupt service routine.
	;***      199 : * Arguments    : None
	;***      200 : * Return Value : None
	;***      201 : ***********************************************************************************************************************/
	;***      202 : static void __near r_csi00_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 202
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      203 : {
	;***      204 :     volatile uint8_t err_type;
	;***      205 : 
	;***      206 :     err_type = (uint8_t)(SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 206
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      207 :     SIR00 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 207
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      208 : 
	;***      209 :     if (err_type != 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 209
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 222
	reti
.BB@LABEL@7_2:	; if_then_bb
	;***      210 :     {
	;***      211 :         if (g_csi00_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 211
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@7_4
.BB@LABEL@7_3:	; if_else_bb
	;***      212 :         {
	;***      213 :             SIO00 = *gp_csi00_tx_address;
	;***      214 :             gp_csi00_tx_address++;
	;***      215 :             g_csi00_tx_count--;
	;***      216 :         }
	;***      217 :         else
	;***      218 :         {
	;***      219 :             r_csi00_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 219
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@7_1
.BB@LABEL@7_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 213
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 214
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 215
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@7_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      220 :         }
	;***      221 :     }
	;***      222 : }
	;***      223 : 
	;***      224 : /***********************************************************************************************************************
	;***      225 : * Function Name: r_csi00_callback_sendend
	;***      226 : * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      227 : * Arguments    : None
	;***      228 : * Return Value : None
	;***      229 : ***********************************************************************************************************************/
	;***      230 : static void r_csi00_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 230
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      231 : {
	;***      232 :     /* Start user code. Do not edit comment generated here */
	;***      233 :     /* End user code. Do not edit comment generated here */
	;***      234 : }
	;***      235 : 
	;***      236 : /***********************************************************************************************************************
	;***      237 : * Function Name: r_csi01_interrupt
	;***      238 : * Description  : This function is INTCSI01 interrupt service routine.
	;***      239 : * Arguments    : None
	;***      240 : * Return Value : None
	;***      241 : ***********************************************************************************************************************/
	;***      242 : static void __near r_csi01_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 242
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      243 : {
	;***      244 :     volatile uint8_t err_type;
	;***      245 :     volatile uint8_t sio_dummy;
	;***      246 : 
	;***      247 :     err_type = (uint8_t)(SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 247
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      248 :     SIR01 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 248
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      249 : 
	;***      250 :     if (1U == err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 250
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@9_2
.BB@LABEL@9_1:	; if_then_bb
	;***      251 :     {
	;***      252 :         r_csi01_callback_error(err_type);    /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 252
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@9_15
.BB@LABEL@9_2:	; if_else_bb
	;***      253 :     }
	;***      254 :     else
	;***      255 :     {
	;***      256 :         if (g_csi01_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 256
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_8
.BB@LABEL@9_3:	; if_else_bb42
	;***      257 :         {
	;***      258 :             if (0U != gp_csi01_rx_address)
	;***      259 :             {
	;***      260 :                 *gp_csi01_rx_address = SIO01;
	;***      261 :                 gp_csi01_rx_address++;
	;***      262 :             }
	;***      263 :             else
	;***      264 :             {
	;***      265 :                 sio_dummy = SIO01;
	;***      266 :             }
	;***      267 : 
	;***      268 :             if (0U != gp_csi01_tx_address)
	;***      269 :             {
	;***      270 :                 SIO01 = *gp_csi01_tx_address;
	;***      271 :                 gp_csi01_tx_address++;
	;***      272 :             }
	;***      273 :             else
	;***      274 :             {
	;***      275 :                 SIO01 = 0xFFU;
	;***      276 :             }
	;***      277 : 
	;***      278 :             g_csi01_tx_count--;
	;***      279 :         }
	;***      280 :         else 
	;***      281 :         {
	;***      282 :             if (0U == g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 282
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@9_7
.BB@LABEL@9_4:	; if_then_bb47
	;***      283 :             {
	;***      284 :                 if (0U != gp_csi01_rx_address)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 284
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_6
.BB@LABEL@9_5:	; if_else_bb55
	;***      285 :                 {
	;***      286 :                     *gp_csi01_rx_address = SIO01;
	;***      287 :                 }
	;***      288 :                 else
	;***      289 :                 {
	;***      290 :                     sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 290
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@9_7
.BB@LABEL@9_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 286
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@9_7:	; if_break_bb59
	;***      291 :                 }
	;***      292 :             }
	;***      293 : 
	;***      294 :             r_csi01_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 294
	call !!_r_csi01_callback_sendend@1
	;***      295 :             r_csi01_callback_receiveend();    /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 295
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@9_15
.BB@LABEL@9_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 258
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_10
.BB@LABEL@9_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 265
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@9_11
.BB@LABEL@9_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 260
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 261
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@9_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 268
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_13
.BB@LABEL@9_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 275
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@9_14
.BB@LABEL@9_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 270
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 271
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@9_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 278
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 298
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      296 :         }
	;***      297 :     }
	;***      298 : }
	;***      299 : 
	;***      300 : /***********************************************************************************************************************
	;***      301 : * Function Name: r_csi01_callback_receiveend
	;***      302 : * Description  : This function is a callback function when CSI01 finishes reception.
	;***      303 : * Arguments    : None
	;***      304 : * Return Value : None
	;***      305 : ***********************************************************************************************************************/
	;***      306 : static void r_csi01_callback_receiveend(void)
	;***      307 : {
	;***      308 :     /* Start user code. Do not edit comment generated here */
	;***      309 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 309
	inc !LOWW(_g_csi_rev_end)
	;***      310 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 310
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      311 :     /* End user code. Do not edit comment generated here */
	;***      312 : }
	;***      313 : 
	;***      314 : /***********************************************************************************************************************
	;***      315 : * Function Name: r_csi01_callback_error
	;***      316 : * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      317 : * Arguments    : err_type -
	;***      318 : *                    error type value
	;***      319 : * Return Value : None
	;***      320 : ***********************************************************************************************************************/
	;***      321 : static void r_csi01_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 321
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      322 : {
	;***      323 :     /* Start user code. Do not edit comment generated here */
	;***      324 : 
	;***      325 :     /* End user code. Do not edit comment generated here */
	;***      326 : }
	;***      327 : 
	;***      328 : /***********************************************************************************************************************
	;***      329 : * Function Name: r_csi01_callback_sendend
	;***      330 : * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      331 : * Arguments    : None
	;***      332 : * Return Value : None
	;***      333 : ***********************************************************************************************************************/
	;***      334 : static void r_csi01_callback_sendend(void)
	;***      335 : {
	;***      336 :     /* Start user code. Do not edit comment generated here */
	;***      337 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 337
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      338 :     /* End user code. Do not edit comment generated here */
	;***      339 : }
	;***      340 : 
	;***      341 : /***********************************************************************************************************************
	;***      342 : * Function Name: r_uart2_interrupt_receive
	;***      343 : * Description  : This function is INTSR2 interrupt service routine.
	;***      344 : * Arguments    : None
	;***      345 : * Return Value : None
	;***      346 : ***********************************************************************************************************************/
	;***      347 : static void __near r_uart2_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 347
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      348 : {
	;***      349 :     volatile uint8_t rx_data;
	;***      350 :     volatile uint8_t err_type;
	;***      351 :     
	;***      352 :     err_type = (uint8_t)(SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 352
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      353 :     SIR11 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 353
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      354 : 
	;***      355 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 355
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@13_2
.BB@LABEL@13_1:	; if_then_bb
	;***      356 :     {
	;***      357 :         r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 357
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@13_2:	; if_break_bb
	;***      358 :     }
	;***      359 :     
	;***      360 :     rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 360
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      361 : 
	;***      362 :     if (g_uart2_rx_length > g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 362
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@13_6
.BB@LABEL@13_3:	; if_then_bb18
	;***      363 :     {
	;***      364 :         *gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 364
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      365 :         gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 365
	incw !LOWW(_gp_uart2_rx_address)
	;***      366 :         g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 366
	incw !LOWW(_g_uart2_rx_count)
	;***      367 : 
	;***      368 :         if (g_uart2_rx_length == g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 368
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@13_4:	; if_then_bb30
	;***      369 :         {
	;***      370 :             r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 370
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 377
	reti
.BB@LABEL@13_6:	; if_else_bb
	;***      371 :         }
	;***      372 :     }
	;***      373 :     else
	;***      374 :     {
	;***      375 :         r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 375
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@13_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      376 :     }
	;***      377 : }
	;***      378 : 
	;***      379 : /***********************************************************************************************************************
	;***      380 : * Function Name: r_uart2_interrupt_send
	;***      381 : * Description  : This function is INTST2 interrupt service routine.
	;***      382 : * Arguments    : None
	;***      383 : * Return Value : None
	;***      384 : ***********************************************************************************************************************/
	;***      385 : static void __near r_uart2_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 385
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      386 : {
	;***      387 :     if (g_uart2_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 387
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@14_3
.BB@LABEL@14_1:	; if_else_bb
	;***      388 :     {
	;***      389 :         TXD2 = *gp_uart2_tx_address;
	;***      390 :         gp_uart2_tx_address++;
	;***      391 :         g_uart2_tx_count--;
	;***      392 :     }
	;***      393 :     else
	;***      394 :     {
	;***      395 :         r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 395
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 397
	reti
.BB@LABEL@14_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 389
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 390
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 391
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@14_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 4
	;***      396 :     }
	;***      397 : }
	;***      398 : 
	;***      399 : /***********************************************************************************************************************
	;***      400 : * Function Name: r_uart2_callback_receiveend
	;***      401 : * Description  : This function is a callback function when UART2 finishes reception.
	;***      402 : * Arguments    : None
	;***      403 : * Return Value : None
	;***      404 : ***********************************************************************************************************************/
	;***      405 : static void r_uart2_callback_receiveend(void)
	;***      406 : {
	;***      407 :     /* Start user code. Do not edit comment generated here */
	;***      408 : //	R_UART2_Receive(g_rx_data, 32);
	;***      409 : //	R_UART2_Stop();
	;***      410 : //	R_UART2_Start();
	;***      411 : 	R_UART2_Receive(g_rx_data, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 411
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      412 : 	if(g_rx_data[0] > 6){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 412
	cmp !LOWW(_g_rx_data), #0x07
	bc $.BB@LABEL@15_2
.BB@LABEL@15_1:	; if_then_bb
	;***      413 : 		g_uart2_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 413
	oneb !LOWW(_g_uart2_fault)
	br $.BB@LABEL@15_3
.BB@LABEL@15_2:	; if_else_bb
	;***      414 : 	}else{
	;***      415 : 		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 415
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@15_3:	; if_break_bb
	;***      416 : 	}
	;***      417 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 417
	inc !LOWW(_g_uart2_receive)
	ret
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      418 :     /* End user code. Do not edit comment generated here */
	;***      419 : }
	;***      420 : 
	;***      421 : /***********************************************************************************************************************
	;***      422 : * Function Name: r_uart2_callback_softwareoverrun
	;***      423 : * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      424 : * Arguments    : rx_data -
	;***      425 : *                    receive data
	;***      426 : * Return Value : None
	;***      427 : ***********************************************************************************************************************/
	;***      428 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 428
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      429 : {
	;***      430 :     /* Start user code. Do not edit comment generated here */
	;***      431 :     /* End user code. Do not edit comment generated here */
	;***      432 : }
	;***      433 : 
	;***      434 : /***********************************************************************************************************************
	;***      435 : * Function Name: r_uart2_callback_sendend
	;***      436 : * Description  : This function is a callback function when UART2 finishes transmission.
	;***      437 : * Arguments    : None
	;***      438 : * Return Value : None
	;***      439 : ***********************************************************************************************************************/
	;***      440 : static void r_uart2_callback_sendend(void)
	;***      441 : {
	;***      442 :     /* Start user code. Do not edit comment generated here */
	;***      443 : 	g_uart2_send++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 443
	inc !LOWW(_g_uart2_send)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      444 :     /* End user code. Do not edit comment generated here */
	;***      445 : }
	;***      446 : 
	;***      447 : /***********************************************************************************************************************
	;***      448 : * Function Name: r_uart2_callback_error
	;***      449 : * Description  : This function is a callback function when UART2 reception error occurs.
	;***      450 : * Arguments    : err_type -
	;***      451 : *                    error type value
	;***      452 : * Return Value : None
	;***      453 : ***********************************************************************************************************************/
	;***      454 : static void r_uart2_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 454
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      455 : {
	;***      456 :     /* Start user code. Do not edit comment generated here */
	;***      457 :     /* End user code. Do not edit comment generated here */
	;***      458 : }
	;***      459 : 
	;***      460 : /***********************************************************************************************************************
	;***      461 : * Function Name: r_uart3_interrupt_receive
	;***      462 : * Description  : This function is INTSR3 interrupt service routine.
	;***      463 : * Arguments    : None
	;***      464 : * Return Value : None
	;***      465 : ***********************************************************************************************************************/
	;***      466 : static void __near r_uart3_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 466
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      467 : {
	;***      468 :     volatile uint8_t rx_data;
	;***      469 :     volatile uint8_t err_type;
	;***      470 :     
	;***      471 :     err_type = (uint8_t)(SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 471
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      472 :     SIR13 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 472
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      473 : 
	;***      474 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 474
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@19_2
.BB@LABEL@19_1:	; if_then_bb
	;***      475 :     {
	;***      476 :         r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 476
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@19_2:	; if_break_bb
	;***      477 :     }
	;***      478 :     
	;***      479 :     rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 479
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      480 : 
	;***      481 :     if (g_uart3_rx_length > g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 481
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@19_6
.BB@LABEL@19_3:	; if_then_bb18
	;***      482 :     {
	;***      483 :         *gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 483
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      484 :         gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 484
	incw !LOWW(_gp_uart3_rx_address)
	;***      485 :         g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 485
	incw !LOWW(_g_uart3_rx_count)
	;***      486 : 
	;***      487 :         if (g_uart3_rx_length == g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 487
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@19_4:	; if_then_bb30
	;***      488 :         {
	;***      489 :             r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 489
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 496
	reti
.BB@LABEL@19_6:	; if_else_bb
	;***      490 :         }
	;***      491 :     }
	;***      492 :     else
	;***      493 :     {
	;***      494 :         r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 494
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@19_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      495 :     }
	;***      496 : }
	;***      497 : 
	;***      498 : /***********************************************************************************************************************
	;***      499 : * Function Name: r_uart3_interrupt_send
	;***      500 : * Description  : This function is INTST3 interrupt service routine.
	;***      501 : * Arguments    : None
	;***      502 : * Return Value : None
	;***      503 : ***********************************************************************************************************************/
	;***      504 : static void __near r_uart3_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 504
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      505 : {
	;***      506 :     if (g_uart3_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 506
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@20_3
.BB@LABEL@20_1:	; if_else_bb
	;***      507 :     {
	;***      508 :         TXD3 = *gp_uart3_tx_address;
	;***      509 :         gp_uart3_tx_address++;
	;***      510 :         g_uart3_tx_count--;
	;***      511 :     }
	;***      512 :     else
	;***      513 :     {
	;***      514 :         r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 514
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 516
	reti
.BB@LABEL@20_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 508
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 509
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 510
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@20_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      515 :     }
	;***      516 : }
	;***      517 : 
	;***      518 : /***********************************************************************************************************************
	;***      519 : * Function Name: r_uart3_callback_receiveend
	;***      520 : * Description  : This function is a callback function when UART3 finishes reception.
	;***      521 : * Arguments    : None
	;***      522 : * Return Value : None
	;***      523 : ***********************************************************************************************************************/
	;***      524 : static void r_uart3_callback_receiveend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 524
	ret
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      525 : {
	;***      526 :     /* Start user code. Do not edit comment generated here */
	;***      527 :     /* End user code. Do not edit comment generated here */
	;***      528 : }
	;***      529 : 
	;***      530 : /***********************************************************************************************************************
	;***      531 : * Function Name: r_uart3_callback_softwareoverrun
	;***      532 : * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      533 : * Arguments    : rx_data -
	;***      534 : *                    receive data
	;***      535 : * Return Value : None
	;***      536 : ***********************************************************************************************************************/
	;***      537 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 537
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      538 : {
	;***      539 :     /* Start user code. Do not edit comment generated here */
	;***      540 :     /* End user code. Do not edit comment generated here */
	;***      541 : }
	;***      542 : 
	;***      543 : /***********************************************************************************************************************
	;***      544 : * Function Name: r_uart3_callback_sendend
	;***      545 : * Description  : This function is a callback function when UART3 finishes transmission.
	;***      546 : * Arguments    : None
	;***      547 : * Return Value : None
	;***      548 : ***********************************************************************************************************************/
	;***      549 : static void r_uart3_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 549
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      550 : {
	;***      551 :     /* Start user code. Do not edit comment generated here */
	;***      552 :     /* End user code. Do not edit comment generated here */
	;***      553 : }
	;***      554 : 
	;***      555 : /***********************************************************************************************************************
	;***      556 : * Function Name: r_uart3_callback_error
	;***      557 : * Description  : This function is a callback function when UART3 reception error occurs.
	;***      558 : * Arguments    : err_type -
	;***      559 : *                    error type value
	;***      560 : * Return Value : None
	;***      561 : ***********************************************************************************************************************/
	;***      562 : static void r_uart3_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 562
	ret
	;***      563 : {
	;***      564 :     /* Start user code. Do not edit comment generated here */
	;***      565 :     /* End user code. Do not edit comment generated here */
	;***      566 : }
	;***      567 : 
	;***      568 : /* Start user code for adding. Do not edit comment generated here */
	;***      569 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
_g_csi_count:
	.DS (1)
_g_csi_err:
	.DS (1)
_g_csi_send_end:
	.DS (1)
_g_csi_rev_end:
	.DS (1)
_g_uart1_end:
	.DS (1)
_g_uart2_send:
	.DS (1)
_g_uart2_receive:
	.DS (1)
_g_rx_data:
	.DS (32)
_g_uart2_fault:
	.DS (1)
