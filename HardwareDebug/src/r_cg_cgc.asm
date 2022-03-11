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
#@   -o src/r_cg_cgc.obj
#@   ../src/r_cg_cgc.c
#@  compiled at Wed Mar 09 14:07:21 2022

	.PUBLIC _R_CGC_Create

	.SECTION .textf,TEXTF
_R_CGC_Create:
	.STACK _R_CGC_Create = 4
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
	;***       21 : * File Name    : r_cg_cgc.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for CGC module.
	;***       26 : * Creation Date: 30/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_cgc.h"
	;***       34 : /* Start user code for include. Do not edit comment generated here */
	;***       35 : /* End user code. Do not edit comment generated here */
	;***       36 : #include "r_cg_userdefine.h"
	;***       37 : 
	;***       38 : /***********************************************************************************************************************
	;***       39 : Pragma directive
	;***       40 : ***********************************************************************************************************************/
	;***       41 : /* Start user code for pragma. Do not edit comment generated here */
	;***       42 : /* End user code. Do not edit comment generated here */
	;***       43 : 
	;***       44 : /***********************************************************************************************************************
	;***       45 : Global variables and functions
	;***       46 : ***********************************************************************************************************************/
	;***       47 : /* Start user code for global. Do not edit comment generated here */
	;***       48 : /* End user code. Do not edit comment generated here */
	;***       49 : 
	;***       50 : /***********************************************************************************************************************
	;***       51 : * Function Name: R_CGC_Create
	;***       52 : * Description  : This function initializes the clock generator.
	;***       53 : * Arguments    : None
	;***       54 : * Return Value : None
	;***       55 : ***********************************************************************************************************************/
	;***       56 : void R_CGC_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_cgc.c", 56
	movw hl, #0xFFA1
	;***       57 : {
	;***       58 :     /* Set fMX */
	;***       59 :     CMC = _C0_CGC_HISYS_EXT | _30_CGC_SUB_EXT | _00_CGC_SYSOSC_DEFAULT | _00_CGC_SUBMODE_DEFAULT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_cgc.c", 59
	mov 0xFFFA0, #0xF0
	;***       60 :     MSTOP = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_cgc.c", 60
	clr1 [hl].7
	;***       61 :     /* Set fMAIN */
	;***       62 :     MCM0 = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_cgc.c", 62
	clr1 0xFFFA4.4
	;***       63 :     /* Set fSUB */
	;***       64 :     XTSTOP = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_cgc.c", 64
	clr1 [hl].6
	;***       65 :     OSMC = _00_CGC_SUBINHALT_ON | _00_CGC_RTC_CLK_FSUB;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_cgc.c", 65
	clrb !0x00F3
	;***       66 :     /* Set fCLK */
	;***       67 :     CSS = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_cgc.c", 67
	clr1 0xFFFA4.6
	;***       68 :     /* Set fIH */
	;***       69 :     HIOSTOP = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_cgc.c", 69
	clr1 [hl].0
	ret
	;***       70 : }
	;***       71 : 
	;***       72 : /* Start user code for adding. Do not edit comment generated here */
	;***       73 : /* End user code. Do not edit comment generated here */
