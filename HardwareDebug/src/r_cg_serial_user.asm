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
#@  compiled at Thu Dec 02 17:39:03 2021

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
	.PUBLIC _g_csi_count
	.PUBLIC _g_csi_err
	.PUBLIC _g_csi_send_end
	.PUBLIC _g_csi_rev_end
	.PUBLIC _g_uart1_end
	.PUBLIC _g_uart2_send
	.PUBLIC _g_uart2_receive
	.PUBLIC _g_rx_data
	.PUBLIC _g_uart2_fault
	.PUBLIC _g_uart3_sendend
	.EXTERN _R_CSI01_Stop
	.EXTERN _R_UART2_Receive
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
	;***       83 : volatile uint8_t g_csi_count, g_csi_err, g_csi_send_end, g_csi_rev_end, g_uart1_end, g_uart2_send, g_uart2_receive;
	;***       84 : uint8_t g_rx_data[32];
	;***       85 : volatile uint8_t g_uart2_fault;
	;***       86 : volatile uint8_t g_uart3_sendend;
	;***       87 : /* End user code. Do not edit comment generated here */
	;***       88 : 
	;***       89 : /***********************************************************************************************************************
	;***       90 : * Function Name: r_uart1_interrupt_receive
	;***       91 : * Description  : This function is INTSR1 interrupt service routine.
	;***       92 : * Arguments    : None
	;***       93 : * Return Value : None
	;***       94 : ***********************************************************************************************************************/
	;***       95 : static void __near r_uart1_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 95
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***       96 : {
	;***       97 :     volatile uint8_t rx_data;
	;***       98 :     volatile uint8_t err_type;
	;***       99 :     
	;***      100 :     err_type = (uint8_t)(SSR03 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 100
	movw ax, !0x0106
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      101 :     SIR03 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 101
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010E, ax
	;***      102 : 
	;***      103 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 103
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@1_2
.BB@LABEL@1_1:	; if_then_bb
	;***      104 :     {
	;***      105 :         r_uart1_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 105
	mov a, [sp+0x00]
	call !!_r_uart1_callback_error@1
.BB@LABEL@1_2:	; if_break_bb
	;***      106 :     }
	;***      107 :     
	;***      108 :     rx_data = RXD1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 108
	mov a, 0xFFF46
	mov [sp+0x01], a
	;***      109 : 
	;***      110 :     if (g_uart1_rx_length > g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 110
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb18
	;***      111 :     {
	;***      112 :         *gp_uart1_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 112
	movw de, !LOWW(_gp_uart1_rx_address)
	mov [de], a
	;***      113 :         gp_uart1_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 113
	incw !LOWW(_gp_uart1_rx_address)
	;***      114 :         g_uart1_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 114
	incw !LOWW(_g_uart1_rx_count)
	;***      115 : 
	;***      116 :         if (g_uart1_rx_length == g_uart1_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 116
	movw ax, !LOWW(_g_uart1_rx_length)
	cmpw ax, !LOWW(_g_uart1_rx_count)
	sknz
.BB@LABEL@1_4:	; if_then_bb30
	;***      117 :         {
	;***      118 :             r_uart1_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 118
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 125
	reti
.BB@LABEL@1_6:	; if_else_bb
	;***      119 :         }
	;***      120 :     }
	;***      121 :     else
	;***      122 :     {
	;***      123 :         r_uart1_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 123
	shrw ax, 8+0x00000
	call !!_r_uart1_callback_softwareoverrun@1
	br $.BB@LABEL@1_5
_r_uart1_interrupt_send@1	.vector 0x0024
_r_uart1_interrupt_send@1:
	.STACK _r_uart1_interrupt_send@1 = 14
	;***      124 :     }
	;***      125 : }
	;***      126 : 
	;***      127 : /***********************************************************************************************************************
	;***      128 : * Function Name: r_uart1_interrupt_send
	;***      129 : * Description  : This function is INTST1 interrupt service routine.
	;***      130 : * Arguments    : None
	;***      131 : * Return Value : None
	;***      132 : ***********************************************************************************************************************/
	;***      133 : static void __near r_uart1_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 133
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      134 : {
	;***      135 :     if (g_uart1_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 135
	movw ax, !LOWW(_g_uart1_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_3
.BB@LABEL@2_1:	; if_else_bb
	;***      136 :     {
	;***      137 :         TXD1 = *gp_uart1_tx_address;
	;***      138 :         gp_uart1_tx_address++;
	;***      139 :         g_uart1_tx_count--;
	;***      140 :     }
	;***      141 :     else
	;***      142 :     {
	;***      143 :         r_uart1_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 143
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 145
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
	;***      144 :     }
	;***      145 : }
	;***      146 : 
	;***      147 : /***********************************************************************************************************************
	;***      148 : * Function Name: r_uart1_callback_receiveend
	;***      149 : * Description  : This function is a callback function when UART1 finishes reception.
	;***      150 : * Arguments    : None
	;***      151 : * Return Value : None
	;***      152 : ***********************************************************************************************************************/
	;***      153 : static void r_uart1_callback_receiveend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 153
	ret
_r_uart1_callback_softwareoverrun@1:
	.STACK _r_uart1_callback_softwareoverrun@1 = 4
	;***      154 : {
	;***      155 :     /* Start user code. Do not edit comment generated here */
	;***      156 :     /* End user code. Do not edit comment generated here */
	;***      157 : }
	;***      158 : 
	;***      159 : /***********************************************************************************************************************
	;***      160 : * Function Name: r_uart1_callback_softwareoverrun
	;***      161 : * Description  : This function is a callback function when UART1 receives an overflow data.
	;***      162 : * Arguments    : rx_data -
	;***      163 : *                    receive data
	;***      164 : * Return Value : None
	;***      165 : ***********************************************************************************************************************/
	;***      166 : static void r_uart1_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 166
	ret
_r_uart1_callback_sendend@1:
	.STACK _r_uart1_callback_sendend@1 = 4
	;***      167 : {
	;***      168 :     /* Start user code. Do not edit comment generated here */
	;***      169 :     /* End user code. Do not edit comment generated here */
	;***      170 : }
	;***      171 : 
	;***      172 : /***********************************************************************************************************************
	;***      173 : * Function Name: r_uart1_callback_sendend
	;***      174 : * Description  : This function is a callback function when UART1 finishes transmission.
	;***      175 : * Arguments    : None
	;***      176 : * Return Value : None
	;***      177 : ***********************************************************************************************************************/
	;***      178 : static void r_uart1_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 178
	ret
_r_uart1_callback_error@1:
	.STACK _r_uart1_callback_error@1 = 4
	;***      179 : {
	;***      180 :     /* Start user code. Do not edit comment generated here */
	;***      181 :     /* End user code. Do not edit comment generated here */
	;***      182 : }
	;***      183 : 
	;***      184 : /***********************************************************************************************************************
	;***      185 : * Function Name: r_uart1_callback_error
	;***      186 : * Description  : This function is a callback function when UART1 reception error occurs.
	;***      187 : * Arguments    : err_type -
	;***      188 : *                    error type value
	;***      189 : * Return Value : None
	;***      190 : ***********************************************************************************************************************/
	;***      191 : static void r_uart1_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 191
	ret
	.SECTION .text,TEXT
_r_csi00_interrupt@1	.vector 0x001E
_r_csi00_interrupt@1:
	.STACK _r_csi00_interrupt@1 = 16
	;***      192 : {
	;***      193 :     /* Start user code. Do not edit comment generated here */
	;***      194 :     /* End user code. Do not edit comment generated here */
	;***      195 : }
	;***      196 : 
	;***      197 : /***********************************************************************************************************************
	;***      198 : * Function Name: r_csi00_interrupt
	;***      199 : * Description  : This function is INTCSI00 interrupt service routine.
	;***      200 : * Arguments    : None
	;***      201 : * Return Value : None
	;***      202 : ***********************************************************************************************************************/
	;***      203 : static void __near r_csi00_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 203
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      204 : {
	;***      205 :     volatile uint8_t err_type;
	;***      206 : 
	;***      207 :     err_type = (uint8_t)(SSR00 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 207
	movw ax, !0x0100
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      208 :     SIR00 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 208
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x0108, ax
	;***      209 : 
	;***      210 :     if (err_type != 1U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 210
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 223
	reti
.BB@LABEL@7_2:	; if_then_bb
	;***      211 :     {
	;***      212 :         if (g_csi00_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 212
	movw ax, !LOWW(_g_csi00_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@7_4
.BB@LABEL@7_3:	; if_else_bb
	;***      213 :         {
	;***      214 :             SIO00 = *gp_csi00_tx_address;
	;***      215 :             gp_csi00_tx_address++;
	;***      216 :             g_csi00_tx_count--;
	;***      217 :         }
	;***      218 :         else
	;***      219 :         {
	;***      220 :             r_csi00_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 220
	call !!_r_csi00_callback_sendend@1
	br $.BB@LABEL@7_1
.BB@LABEL@7_4:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 214
	movw de, !LOWW(_gp_csi00_tx_address)
	mov a, [de]
	mov 0xFFF10, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 215
	incw de
	movw ax, de
	movw !LOWW(_gp_csi00_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 216
	decw !LOWW(_g_csi00_tx_count)
	br $.BB@LABEL@7_1
	.SECTION .textf,TEXTF
_r_csi00_callback_sendend@1:
	.STACK _r_csi00_callback_sendend@1 = 4
	;***      221 :         }
	;***      222 :     }
	;***      223 : }
	;***      224 : 
	;***      225 : /***********************************************************************************************************************
	;***      226 : * Function Name: r_csi00_callback_sendend
	;***      227 : * Description  : This function is a callback function when CSI00 finishes transmission.
	;***      228 : * Arguments    : None
	;***      229 : * Return Value : None
	;***      230 : ***********************************************************************************************************************/
	;***      231 : static void r_csi00_callback_sendend(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 231
	ret
	.SECTION .text,TEXT
_r_csi01_interrupt@1	.vector 0x0020
_r_csi01_interrupt@1:
	.STACK _r_csi01_interrupt@1 = 16
	;***      232 : {
	;***      233 :     /* Start user code. Do not edit comment generated here */
	;***      234 :     /* End user code. Do not edit comment generated here */
	;***      235 : }
	;***      236 : 
	;***      237 : /***********************************************************************************************************************
	;***      238 : * Function Name: r_csi01_interrupt
	;***      239 : * Description  : This function is INTCSI01 interrupt service routine.
	;***      240 : * Arguments    : None
	;***      241 : * Return Value : None
	;***      242 : ***********************************************************************************************************************/
	;***      243 : static void __near r_csi01_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 243
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      244 : {
	;***      245 :     volatile uint8_t err_type;
	;***      246 :     volatile uint8_t sio_dummy;
	;***      247 : 
	;***      248 :     err_type = (uint8_t)(SSR01 & _0001_SAU_OVERRUN_ERROR);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 248
	movw ax, !0x0102
	mov a, x
	and a, #0x01
	mov [sp+0x00], a
	;***      249 :     SIR01 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 249
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x010A, ax
	;***      250 : 
	;***      251 :     if (1U == err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 251
	mov a, [sp+0x00]
	dec a
	bnz $.BB@LABEL@9_2
.BB@LABEL@9_1:	; if_then_bb
	;***      252 :     {
	;***      253 :         r_csi01_callback_error(err_type);    /* overrun error occurs */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 253
	mov a, [sp+0x00]
	call !!_r_csi01_callback_error@1
	br $.BB@LABEL@9_15
.BB@LABEL@9_2:	; if_else_bb
	;***      254 :     }
	;***      255 :     else
	;***      256 :     {
	;***      257 :         if (g_csi01_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 257
	movw ax, !LOWW(_g_csi01_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_8
.BB@LABEL@9_3:	; if_else_bb42
	;***      258 :         {
	;***      259 :             if (0U != gp_csi01_rx_address)
	;***      260 :             {
	;***      261 :                 *gp_csi01_rx_address = SIO01;
	;***      262 :                 gp_csi01_rx_address++;
	;***      263 :             }
	;***      264 :             else
	;***      265 :             {
	;***      266 :                 sio_dummy = SIO01;
	;***      267 :             }
	;***      268 : 
	;***      269 :             if (0U != gp_csi01_tx_address)
	;***      270 :             {
	;***      271 :                 SIO01 = *gp_csi01_tx_address;
	;***      272 :                 gp_csi01_tx_address++;
	;***      273 :             }
	;***      274 :             else
	;***      275 :             {
	;***      276 :                 SIO01 = 0xFFU;
	;***      277 :             }
	;***      278 : 
	;***      279 :             g_csi01_tx_count--;
	;***      280 :         }
	;***      281 :         else 
	;***      282 :         {
	;***      283 :             if (0U == g_csi01_tx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 283
	movw ax, !LOWW(_g_csi01_tx_count)
	cmpw ax, bc
	bnz $.BB@LABEL@9_7
.BB@LABEL@9_4:	; if_then_bb47
	;***      284 :             {
	;***      285 :                 if (0U != gp_csi01_rx_address)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 285
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_6
.BB@LABEL@9_5:	; if_else_bb55
	;***      286 :                 {
	;***      287 :                     *gp_csi01_rx_address = SIO01;
	;***      288 :                 }
	;***      289 :                 else
	;***      290 :                 {
	;***      291 :                     sio_dummy = SIO01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 291
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@9_7
.BB@LABEL@9_6:	; if_then_bb52
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 287
	mov a, 0xFFF12
	mov [de], a
.BB@LABEL@9_7:	; if_break_bb59
	;***      292 :                 }
	;***      293 :             }
	;***      294 : 
	;***      295 :             r_csi01_callback_sendend();    /* complete send */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 295
	call !!_r_csi01_callback_sendend@1
	;***      296 :             r_csi01_callback_receiveend();    /* complete receive */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 296
	call !!_r_csi01_callback_receiveend@1
	br $.BB@LABEL@9_15
.BB@LABEL@9_8:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 259
	movw ax, !LOWW(_gp_csi01_rx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_10
.BB@LABEL@9_9:	; if_else_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 266
	mov a, 0xFFF12
	mov [sp+0x01], a
	br $.BB@LABEL@9_11
.BB@LABEL@9_10:	; if_then_bb21
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 261
	mov a, 0xFFF12
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 262
	incw !LOWW(_gp_csi01_rx_address)
.BB@LABEL@9_11:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 269
	movw ax, !LOWW(_gp_csi01_tx_address)
	cmpw ax, bc
	bnz $.BB@LABEL@9_13
.BB@LABEL@9_12:	; if_else_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 276
	mov 0xFFF12, #0xFF
	br $.BB@LABEL@9_14
.BB@LABEL@9_13:	; if_then_bb32
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 271
	mov a, [de]
	mov 0xFFF12, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 272
	incw de
	movw ax, de
	movw !LOWW(_gp_csi01_tx_address), ax
.BB@LABEL@9_14:	; if_break_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 279
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 299
	reti
	.SECTION .textf,TEXTF
_r_csi01_callback_receiveend@1:
	.STACK _r_csi01_callback_receiveend@1 = 4
	;***      297 :         }
	;***      298 :     }
	;***      299 : }
	;***      300 : 
	;***      301 : /***********************************************************************************************************************
	;***      302 : * Function Name: r_csi01_callback_receiveend
	;***      303 : * Description  : This function is a callback function when CSI01 finishes reception.
	;***      304 : * Arguments    : None
	;***      305 : * Return Value : None
	;***      306 : ***********************************************************************************************************************/
	;***      307 : static void r_csi01_callback_receiveend(void)
	;***      308 : {
	;***      309 :     /* Start user code. Do not edit comment generated here */
	;***      310 : 	g_csi_rev_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 310
	inc !LOWW(_g_csi_rev_end)
	;***      311 : 	R_CSI01_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 311
	br !!_R_CSI01_Stop
_r_csi01_callback_error@1:
	.STACK _r_csi01_callback_error@1 = 4
	;***      312 :     /* End user code. Do not edit comment generated here */
	;***      313 : }
	;***      314 : 
	;***      315 : /***********************************************************************************************************************
	;***      316 : * Function Name: r_csi01_callback_error
	;***      317 : * Description  : This function is a callback function when CSI01 reception error occurs.
	;***      318 : * Arguments    : err_type -
	;***      319 : *                    error type value
	;***      320 : * Return Value : None
	;***      321 : ***********************************************************************************************************************/
	;***      322 : static void r_csi01_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 322
	ret
_r_csi01_callback_sendend@1:
	.STACK _r_csi01_callback_sendend@1 = 4
	;***      323 : {
	;***      324 :     /* Start user code. Do not edit comment generated here */
	;***      325 : 
	;***      326 :     /* End user code. Do not edit comment generated here */
	;***      327 : }
	;***      328 : 
	;***      329 : /***********************************************************************************************************************
	;***      330 : * Function Name: r_csi01_callback_sendend
	;***      331 : * Description  : This function is a callback function when CSI01 finishes transmission.
	;***      332 : * Arguments    : None
	;***      333 : * Return Value : None
	;***      334 : ***********************************************************************************************************************/
	;***      335 : static void r_csi01_callback_sendend(void)
	;***      336 : {
	;***      337 :     /* Start user code. Do not edit comment generated here */
	;***      338 : 	g_csi_send_end++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 338
	inc !LOWW(_g_csi_send_end)
	ret
	.SECTION .text,TEXT
_r_uart2_interrupt_receive@1	.vector 0x0016
_r_uart2_interrupt_receive@1:
	.STACK _r_uart2_interrupt_receive@1 = 16
	;***      339 :     /* End user code. Do not edit comment generated here */
	;***      340 : }
	;***      341 : 
	;***      342 : /***********************************************************************************************************************
	;***      343 : * Function Name: r_uart2_interrupt_receive
	;***      344 : * Description  : This function is INTSR2 interrupt service routine.
	;***      345 : * Arguments    : None
	;***      346 : * Return Value : None
	;***      347 : ***********************************************************************************************************************/
	;***      348 : static void __near r_uart2_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 348
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      349 : {
	;***      350 :     volatile uint8_t rx_data;
	;***      351 :     volatile uint8_t err_type;
	;***      352 :     
	;***      353 :     err_type = (uint8_t)(SSR11 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 353
	movw ax, !0x0142
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      354 :     SIR11 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 354
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014A, ax
	;***      355 : 
	;***      356 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 356
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@13_2
.BB@LABEL@13_1:	; if_then_bb
	;***      357 :     {
	;***      358 :         r_uart2_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 358
	mov a, [sp+0x00]
	call !!_r_uart2_callback_error@1
.BB@LABEL@13_2:	; if_break_bb
	;***      359 :     }
	;***      360 :     
	;***      361 :     rx_data = RXD2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 361
	mov a, 0xFFF4A
	mov [sp+0x01], a
	;***      362 : 
	;***      363 :     if (g_uart2_rx_length > g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 363
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@13_6
.BB@LABEL@13_3:	; if_then_bb18
	;***      364 :     {
	;***      365 :         *gp_uart2_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 365
	movw de, !LOWW(_gp_uart2_rx_address)
	mov [de], a
	;***      366 :         gp_uart2_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 366
	incw !LOWW(_gp_uart2_rx_address)
	;***      367 :         g_uart2_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 367
	incw !LOWW(_g_uart2_rx_count)
	;***      368 : 
	;***      369 :         if (g_uart2_rx_length == g_uart2_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 369
	movw ax, !LOWW(_g_uart2_rx_length)
	cmpw ax, !LOWW(_g_uart2_rx_count)
	sknz
.BB@LABEL@13_4:	; if_then_bb30
	;***      370 :         {
	;***      371 :             r_uart2_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 371
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 378
	reti
.BB@LABEL@13_6:	; if_else_bb
	;***      372 :         }
	;***      373 :     }
	;***      374 :     else
	;***      375 :     {
	;***      376 :         r_uart2_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 376
	shrw ax, 8+0x00000
	call !!_r_uart2_callback_softwareoverrun@1
	br $.BB@LABEL@13_5
_r_uart2_interrupt_send@1	.vector 0x0014
_r_uart2_interrupt_send@1:
	.STACK _r_uart2_interrupt_send@1 = 14
	;***      377 :     }
	;***      378 : }
	;***      379 : 
	;***      380 : /***********************************************************************************************************************
	;***      381 : * Function Name: r_uart2_interrupt_send
	;***      382 : * Description  : This function is INTST2 interrupt service routine.
	;***      383 : * Arguments    : None
	;***      384 : * Return Value : None
	;***      385 : ***********************************************************************************************************************/
	;***      386 : static void __near r_uart2_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 386
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      387 : {
	;***      388 :     if (g_uart2_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 388
	movw ax, !LOWW(_g_uart2_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@14_3
.BB@LABEL@14_1:	; if_else_bb
	;***      389 :     {
	;***      390 :         TXD2 = *gp_uart2_tx_address;
	;***      391 :         gp_uart2_tx_address++;
	;***      392 :         g_uart2_tx_count--;
	;***      393 :     }
	;***      394 :     else
	;***      395 :     {
	;***      396 :         r_uart2_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 396
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 398
	reti
.BB@LABEL@14_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 390
	movw de, !LOWW(_gp_uart2_tx_address)
	mov a, [de]
	mov 0xFFF48, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 391
	incw de
	movw ax, de
	movw !LOWW(_gp_uart2_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 392
	decw !LOWW(_g_uart2_tx_count)
	br $.BB@LABEL@14_2
	.SECTION .textf,TEXTF
_r_uart2_callback_receiveend@1:
	.STACK _r_uart2_callback_receiveend@1 = 4
	;***      397 :     }
	;***      398 : }
	;***      399 : 
	;***      400 : /***********************************************************************************************************************
	;***      401 : * Function Name: r_uart2_callback_receiveend
	;***      402 : * Description  : This function is a callback function when UART2 finishes reception.
	;***      403 : * Arguments    : None
	;***      404 : * Return Value : None
	;***      405 : ***********************************************************************************************************************/
	;***      406 : static void r_uart2_callback_receiveend(void)
	;***      407 : {
	;***      408 :     /* Start user code. Do not edit comment generated here */
	;***      409 : //	R_UART2_Receive(g_rx_data, 32);
	;***      410 : //	R_UART2_Stop();
	;***      411 : //	R_UART2_Start();
	;***      412 : 	R_UART2_Receive(g_rx_data, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 412
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      413 : 	if((g_rx_data[0] == H_READ)|(g_rx_data[0] == H_SET)|(g_rx_data[0] == H_ALARM)|(g_rx_data[0] == H_CLEAR)|(g_rx_data[0] == H_ERROR)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 413
	mov a, !LOWW(_g_rx_data)
	mov c, a
	cmp a, #0x52
	oneb x
	skz
.BB@LABEL@15_1:	; entry
	clrb x
.BB@LABEL@15_2:	; entry
	cmp a, #0x53
	oneb a
	skz
.BB@LABEL@15_3:	; entry
	clrb a
.BB@LABEL@15_4:	; entry
	or a, x
	mov b, a
	mov a, c
	cmp a, #0x41
	oneb x
	skz
.BB@LABEL@15_5:	; entry
	clrb x
.BB@LABEL@15_6:	; entry
	mov a, x
	or a, b
	mov b, a
	mov a, c
	cmp a, #0x43
	oneb x
	skz
.BB@LABEL@15_7:	; entry
	clrb x
.BB@LABEL@15_8:	; entry
	mov a, x
	or a, b
	mov b, a
	mov a, c
	cmp a, #0x45
	oneb x
	skz
.BB@LABEL@15_9:	; entry
	clrb x
.BB@LABEL@15_10:	; entry
	mov a, x
	or a, b
	bnz $.BB@LABEL@15_12
.BB@LABEL@15_11:	; if_else_bb
	;***      414 : 		g_uart2_fault = 0;
	;***      415 : 		if(g_rx_data[0] == H_READ){
	;***      416 : 			R_UART2_Receive(g_rx_data, sizeof(struct UART_Buffer_s));
	;***      417 : 		}
	;***      418 : 	}else{
	;***      419 : 		g_uart2_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 419
	oneb !LOWW(_g_uart2_fault)
	br $.BB@LABEL@15_14
.BB@LABEL@15_12:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 414
	clrb !LOWW(_g_uart2_fault)
	mov a, c
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 415
	cmp a, #0x52
	bnz $.BB@LABEL@15_14
.BB@LABEL@15_13:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 416
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
.BB@LABEL@15_14:	; if_break_bb35
	;***      420 : 	}
	;***      421 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 421
	inc !LOWW(_g_uart2_receive)
	ret
_r_uart2_callback_softwareoverrun@1:
	.STACK _r_uart2_callback_softwareoverrun@1 = 4
	;***      422 :     /* End user code. Do not edit comment generated here */
	;***      423 : }
	;***      424 : 
	;***      425 : /***********************************************************************************************************************
	;***      426 : * Function Name: r_uart2_callback_softwareoverrun
	;***      427 : * Description  : This function is a callback function when UART2 receives an overflow data.
	;***      428 : * Arguments    : rx_data -
	;***      429 : *                    receive data
	;***      430 : * Return Value : None
	;***      431 : ***********************************************************************************************************************/
	;***      432 : static void r_uart2_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 432
	ret
_r_uart2_callback_sendend@1:
	.STACK _r_uart2_callback_sendend@1 = 4
	;***      433 : {
	;***      434 :     /* Start user code. Do not edit comment generated here */
	;***      435 :     /* End user code. Do not edit comment generated here */
	;***      436 : }
	;***      437 : 
	;***      438 : /***********************************************************************************************************************
	;***      439 : * Function Name: r_uart2_callback_sendend
	;***      440 : * Description  : This function is a callback function when UART2 finishes transmission.
	;***      441 : * Arguments    : None
	;***      442 : * Return Value : None
	;***      443 : ***********************************************************************************************************************/
	;***      444 : static void r_uart2_callback_sendend(void)
	;***      445 : {
	;***      446 :     /* Start user code. Do not edit comment generated here */
	;***      447 : 	g_uart2_send++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 447
	inc !LOWW(_g_uart2_send)
	ret
_r_uart2_callback_error@1:
	.STACK _r_uart2_callback_error@1 = 4
	;***      448 :     /* End user code. Do not edit comment generated here */
	;***      449 : }
	;***      450 : 
	;***      451 : /***********************************************************************************************************************
	;***      452 : * Function Name: r_uart2_callback_error
	;***      453 : * Description  : This function is a callback function when UART2 reception error occurs.
	;***      454 : * Arguments    : err_type -
	;***      455 : *                    error type value
	;***      456 : * Return Value : None
	;***      457 : ***********************************************************************************************************************/
	;***      458 : static void r_uart2_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 458
	ret
	.SECTION .text,TEXT
_r_uart3_interrupt_receive@1	.vector 0x003E
_r_uart3_interrupt_receive@1:
	.STACK _r_uart3_interrupt_receive@1 = 16
	;***      459 : {
	;***      460 :     /* Start user code. Do not edit comment generated here */
	;***      461 :     /* End user code. Do not edit comment generated here */
	;***      462 : }
	;***      463 : 
	;***      464 : /***********************************************************************************************************************
	;***      465 : * Function Name: r_uart3_interrupt_receive
	;***      466 : * Description  : This function is INTSR3 interrupt service routine.
	;***      467 : * Arguments    : None
	;***      468 : * Return Value : None
	;***      469 : ***********************************************************************************************************************/
	;***      470 : static void __near r_uart3_interrupt_receive(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 470
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	push hl
	;***      471 : {
	;***      472 :     volatile uint8_t rx_data;
	;***      473 :     volatile uint8_t err_type;
	;***      474 :     
	;***      475 :     err_type = (uint8_t)(SSR13 & 0x0007U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 475
	movw ax, !0x0146
	mov a, x
	and a, #0x07
	mov [sp+0x00], a
	;***      476 :     SIR13 = (uint16_t)err_type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 476
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw !0x014E, ax
	;***      477 : 
	;***      478 :     if (err_type != 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 478
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@19_2
.BB@LABEL@19_1:	; if_then_bb
	;***      479 :     {
	;***      480 :         r_uart3_callback_error(err_type);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 480
	mov a, [sp+0x00]
	call !!_r_uart3_callback_error@1
.BB@LABEL@19_2:	; if_break_bb
	;***      481 :     }
	;***      482 :     
	;***      483 :     rx_data = RXD3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 483
	mov a, 0xFFF16
	mov [sp+0x01], a
	;***      484 : 
	;***      485 :     if (g_uart3_rx_length > g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 485
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	mov a, [sp+0x01]
	bnh $.BB@LABEL@19_6
.BB@LABEL@19_3:	; if_then_bb18
	;***      486 :     {
	;***      487 :         *gp_uart3_rx_address = rx_data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 487
	movw de, !LOWW(_gp_uart3_rx_address)
	mov [de], a
	;***      488 :         gp_uart3_rx_address++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 488
	incw !LOWW(_gp_uart3_rx_address)
	;***      489 :         g_uart3_rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 489
	incw !LOWW(_g_uart3_rx_count)
	;***      490 : 
	;***      491 :         if (g_uart3_rx_length == g_uart3_rx_count)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 491
	movw ax, !LOWW(_g_uart3_rx_length)
	cmpw ax, !LOWW(_g_uart3_rx_count)
	sknz
.BB@LABEL@19_4:	; if_then_bb30
	;***      492 :         {
	;***      493 :             r_uart3_callback_receiveend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 493
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 500
	reti
.BB@LABEL@19_6:	; if_else_bb
	;***      494 :         }
	;***      495 :     }
	;***      496 :     else
	;***      497 :     {
	;***      498 :         r_uart3_callback_softwareoverrun(rx_data);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 498
	shrw ax, 8+0x00000
	call !!_r_uart3_callback_softwareoverrun@1
	br $.BB@LABEL@19_5
_r_uart3_interrupt_send@1	.vector 0x003C
_r_uart3_interrupt_send@1:
	.STACK _r_uart3_interrupt_send@1 = 14
	;***      499 :     }
	;***      500 : }
	;***      501 : 
	;***      502 : /***********************************************************************************************************************
	;***      503 : * Function Name: r_uart3_interrupt_send
	;***      504 : * Description  : This function is INTST3 interrupt service routine.
	;***      505 : * Arguments    : None
	;***      506 : * Return Value : None
	;***      507 : ***********************************************************************************************************************/
	;***      508 : static void __near r_uart3_interrupt_send(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 508
	push ax
	push bc
	push de
	push hl
	mov a, es
	mov x, a
	mov a, cs
	push ax
	;***      509 : {
	;***      510 :     if (g_uart3_tx_count > 0U)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 510
	movw ax, !LOWW(_g_uart3_tx_count)
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@20_3
.BB@LABEL@20_1:	; if_else_bb
	;***      511 :     {
	;***      512 :         TXD3 = *gp_uart3_tx_address;
	;***      513 :         gp_uart3_tx_address++;
	;***      514 :         g_uart3_tx_count--;
	;***      515 :     }
	;***      516 :     else
	;***      517 :     {
	;***      518 :         r_uart3_callback_sendend();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 518
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 520
	reti
.BB@LABEL@20_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 512
	movw de, !LOWW(_gp_uart3_tx_address)
	mov a, [de]
	mov 0xFFF14, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 513
	incw de
	movw ax, de
	movw !LOWW(_gp_uart3_tx_address), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 514
	decw !LOWW(_g_uart3_tx_count)
	br $.BB@LABEL@20_2
	.SECTION .textf,TEXTF
_r_uart3_callback_receiveend@1:
	.STACK _r_uart3_callback_receiveend@1 = 4
	;***      519 :     }
	;***      520 : }
	;***      521 : 
	;***      522 : /***********************************************************************************************************************
	;***      523 : * Function Name: r_uart3_callback_receiveend
	;***      524 : * Description  : This function is a callback function when UART3 finishes reception.
	;***      525 : * Arguments    : None
	;***      526 : * Return Value : None
	;***      527 : ***********************************************************************************************************************/
	;***      528 : static void r_uart3_callback_receiveend(void)
	;***      529 : {
	;***      530 :     /* Start user code. Do not edit comment generated here */
	;***      531 : 	R_UART3_Receive(rec_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 531
	movw bc, #0x0007
	movw ax, #LOWW(_rec_buf)
	br !!_R_UART3_Receive
_r_uart3_callback_softwareoverrun@1:
	.STACK _r_uart3_callback_softwareoverrun@1 = 4
	;***      532 :     /* End user code. Do not edit comment generated here */
	;***      533 : }
	;***      534 : 
	;***      535 : /***********************************************************************************************************************
	;***      536 : * Function Name: r_uart3_callback_softwareoverrun
	;***      537 : * Description  : This function is a callback function when UART3 receives an overflow data.
	;***      538 : * Arguments    : rx_data -
	;***      539 : *                    receive data
	;***      540 : * Return Value : None
	;***      541 : ***********************************************************************************************************************/
	;***      542 : static void r_uart3_callback_softwareoverrun(uint16_t rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 542
	ret
_r_uart3_callback_sendend@1:
	.STACK _r_uart3_callback_sendend@1 = 4
	;***      543 : {
	;***      544 :     /* Start user code. Do not edit comment generated here */
	;***      545 :     /* End user code. Do not edit comment generated here */
	;***      546 : }
	;***      547 : 
	;***      548 : /***********************************************************************************************************************
	;***      549 : * Function Name: r_uart3_callback_sendend
	;***      550 : * Description  : This function is a callback function when UART3 finishes transmission.
	;***      551 : * Arguments    : None
	;***      552 : * Return Value : None
	;***      553 : ***********************************************************************************************************************/
	;***      554 : static void r_uart3_callback_sendend(void)
	;***      555 : {
	;***      556 :     /* Start user code. Do not edit comment generated here */
	;***      557 : 	g_uart3_sendend++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 557
	inc !LOWW(_g_uart3_sendend)
	ret
_r_uart3_callback_error@1:
	.STACK _r_uart3_callback_error@1 = 4
	;***      558 :     /* End user code. Do not edit comment generated here */
	;***      559 : }
	;***      560 : 
	;***      561 : /***********************************************************************************************************************
	;***      562 : * Function Name: r_uart3_callback_error
	;***      563 : * Description  : This function is a callback function when UART3 reception error occurs.
	;***      564 : * Arguments    : err_type -
	;***      565 : *                    error type value
	;***      566 : * Return Value : None
	;***      567 : ***********************************************************************************************************************/
	;***      568 : static void r_uart3_callback_error(uint8_t err_type)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_serial_user.c", 568
	ret
	;***      569 : {
	;***      570 :     /* Start user code. Do not edit comment generated here */
	;***      571 :     /* End user code. Do not edit comment generated here */
	;***      572 : }
	;***      573 : 
	;***      574 : /* Start user code for adding. Do not edit comment generated here */
	;***      575 : /* End user code. Do not edit comment generated here */
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
_g_uart3_sendend:
	.DS (1)
