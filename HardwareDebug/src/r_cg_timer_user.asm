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
#@   -o src/r_cg_timer_user.obj
#@   ../src/r_cg_timer_user.c
#@  compiled at Tue Nov 23 09:22:30 2021

	.PUBLIC _timer0_ch0_flag
	.PUBLIC _timer0_ch1_flag
	.PUBLIC _timer0_ch2_flag
	.PUBLIC _g_systemTime

	.SECTION .text,TEXT
_r_tau0_channel0_interrupt@1	.vector 0x002C
_r_tau0_channel0_interrupt@1:
	.STACK _r_tau0_channel0_interrupt@1 = 8
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
	;***       21 : * File Name    : r_cg_timer_user.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for TAU module.
	;***       26 : * Creation Date: 17/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_timer.h"
	;***       34 : /* Start user code for include. Do not edit comment generated here */
	;***       35 : /* End user code. Do not edit comment generated here */
	;***       36 : #include "r_cg_userdefine.h"
	;***       37 : 
	;***       38 : /***********************************************************************************************************************
	;***       39 : Pragma directive
	;***       40 : ***********************************************************************************************************************/
	;***       41 : #pragma interrupt r_tau0_channel0_interrupt(vect=INTTM00)
	;***       42 : #pragma interrupt r_tau0_channel1_interrupt(vect=INTTM01)
	;***       43 : #pragma interrupt r_tau0_channel2_interrupt(vect=INTTM02)
	;***       44 : /* Start user code for pragma. Do not edit comment generated here */
	;***       45 : volatile uint8_t timer0_ch0_flag, timer0_ch1_flag, timer0_ch2_flag;
	;***       46 : volatile uint32_t g_systemTime;
	;***       47 : /* End user code. Do not edit comment generated here */
	;***       48 : 
	;***       49 : /***********************************************************************************************************************
	;***       50 : Global variables and functions
	;***       51 : ***********************************************************************************************************************/
	;***       52 : /* Start user code for global. Do not edit comment generated here */
	;***       53 : /* End user code. Do not edit comment generated here */
	;***       54 : 
	;***       55 : /***********************************************************************************************************************
	;***       56 : * Function Name: r_tau0_channel0_interrupt
	;***       57 : * Description  : This function is INTTM00 interrupt service routine.
	;***       58 : * Arguments    : None
	;***       59 : * Return Value : None
	;***       60 : ***********************************************************************************************************************/
	;***       61 : static void __near r_tau0_channel0_interrupt(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer_user.c", 61
	push ax
	push bc
	onew ax
	;***       62 : {
	;***       63 :     /* Start user code. Do not edit comment generated here */
	;***       64 : 	g_systemTime++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer_user.c", 64
	addw ax, !LOWW(_g_systemTime)
	movw bc, ax
	clrw ax
	sknc
.BB@LABEL@1_1:	; entry
	incw ax
.BB@LABEL@1_2:	; entry
	addw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_systemTime+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_systemTime), ax
	;***       65 : 	timer0_ch0_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer_user.c", 65
	oneb !LOWW(_timer0_ch0_flag)
	pop bc
	pop ax
	reti
_r_tau0_channel1_interrupt@1	.vector 0x002E
_r_tau0_channel1_interrupt@1:
	.STACK _r_tau0_channel1_interrupt@1 = 4
	;***       66 :     /* End user code. Do not edit comment generated here */
	;***       67 : }
	;***       68 : 
	;***       69 : /***********************************************************************************************************************
	;***       70 : * Function Name: r_tau0_channel1_interrupt
	;***       71 : * Description  : This function is INTTM01 interrupt service routine.
	;***       72 : * Arguments    : None
	;***       73 : * Return Value : None
	;***       74 : ***********************************************************************************************************************/
	;***       75 : static void __near r_tau0_channel1_interrupt(void)
	;***       76 : {
	;***       77 :     /* Start user code. Do not edit comment generated here */
	;***       78 : 	timer0_ch1_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer_user.c", 78
	oneb !LOWW(_timer0_ch1_flag)
	reti
_r_tau0_channel2_interrupt@1	.vector 0x0030
_r_tau0_channel2_interrupt@1:
	.STACK _r_tau0_channel2_interrupt@1 = 4
	;***       79 :     /* End user code. Do not edit comment generated here */
	;***       80 : }
	;***       81 : 
	;***       82 : /***********************************************************************************************************************
	;***       83 : * Function Name: r_tau0_channel2_interrupt
	;***       84 : * Description  : This function is INTTM02 interrupt service routine.
	;***       85 : * Arguments    : None
	;***       86 : * Return Value : None
	;***       87 : ***********************************************************************************************************************/
	;***       88 : static void __near r_tau0_channel2_interrupt(void)
	;***       89 : {
	;***       90 :     /* Start user code. Do not edit comment generated here */
	;***       91 : 	timer0_ch2_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer_user.c", 91
	oneb !LOWW(_timer0_ch2_flag)
	reti
	;***       92 :     /* End user code. Do not edit comment generated here */
	;***       93 : }
	;***       94 : 
	;***       95 : /* Start user code for adding. Do not edit comment generated here */
	;***       96 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
_timer0_ch0_flag:
	.DS (1)
_timer0_ch1_flag:
	.DS (1)
_timer0_ch2_flag:
	.DS (1)
	.ALIGN 2
_g_systemTime:
	.DS (4)
