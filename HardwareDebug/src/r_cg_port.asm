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
#@   -o src/r_cg_port.obj
#@   ../src/r_cg_port.c
#@  compiled at Mon Dec 27 17:54:58 2021

	.PUBLIC _R_PORT_Create

	.SECTION .textf,TEXTF
_R_PORT_Create:
	.STACK _R_PORT_Create = 4
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
	;***       21 : * File Name    : r_cg_port.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for PORT module.
	;***       26 : * Creation Date: 30/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_port.h"
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
	;***       51 : * Function Name: R_PORT_Create
	;***       52 : * Description  : This function initializes the Port I/O.
	;***       53 : * Arguments    : None
	;***       54 : * Return Value : None
	;***       55 : ***********************************************************************************************************************/
	;***       56 : void R_PORT_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 56
	movw de, #0x0061
	;***       57 : {
	;***       58 :     P0 = _00_Pn0_OUTPUT_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 58
	clrb 0xFFF00
	;***       59 :     P1 = _00_Pn5_OUTPUT_0 | _00_Pn6_OUTPUT_0 | _00_Pn7_OUTPUT_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 59
	clrb 0xFFF01
	;***       60 :     P3 = _00_Pn1_OUTPUT_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 60
	clrb 0xFFF03
	;***       61 :     P5 = _00_Pn5_OUTPUT_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 61
	clrb 0xFFF05
	;***       62 :     P6 = _00_Pn0_OUTPUT_0 | _00_Pn1_OUTPUT_0 | _00_Pn2_OUTPUT_0 | _00_Pn3_OUTPUT_0 | _00_Pn4_OUTPUT_0 |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 62
	clrb 0xFFF06
	;***       63 :          _00_Pn5_OUTPUT_0 | _00_Pn6_OUTPUT_0 | _00_Pn7_OUTPUT_0;
	;***       64 :     P7 = _00_Pn6_OUTPUT_0 | _00_Pn7_OUTPUT_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 64
	clrb 0xFFF07
	;***       65 :     P11 = _00_Pn0_OUTPUT_0 | _00_Pn1_OUTPUT_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 65
	clrb 0xFFF0B
	;***       66 :     P12 = _00_Pn0_OUTPUT_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 66
	clrb 0xFFF0C
	;***       67 :     P13 = _00_Pn0_OUTPUT_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 67
	clrb 0xFFF0D
	;***       68 :     P14 = _00_Pn0_OUTPUT_0 | _00_Pn1_OUTPUT_0 | _00_Pn2_OUTPUT_0 | _00_Pn6_OUTPUT_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 68
	clrb 0xFFF0E
	;***       69 :     PMC1 = _04_PMCn2_NOT_USE | _08_PMCn3_NOT_USE | _00_PMCn6_DI_ON | _00_PMCn7_DI_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 69
	mov [de+0x00], #0x0C
	;***       70 :     PMC10 = _00_PMCn0_DI_ON | _FE_PMC10_DEFAULT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 70
	mov [de+0x09], #0xFE
	;***       71 :     PMC12 = _00_PMCn0_DI_ON | _FE_PMC12_DEFAULT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 71
	mov [de+0x0B], #0xFE
	;***       72 :     PMC14 = _00_PMCn7_DI_ON | _7F_PMC14_DEFAULT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 72
	mov [de+0x0D], #0x7F
	;***       73 :     ADPC = _0C_ADPC_DI_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 73
	mov [de+0x15], #0x0C
	;***       74 :     PM0 = _00_PMn0_MODE_OUTPUT | _02_PMn1_MODE_INPUT | _04_PMn2_NOT_USE | _08_PMn3_NOT_USE | _10_PMn4_MODE_INPUT |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 74
	mov 0xFFF20, #0xFE
	;***       75 :           _20_PMn5_MODE_INPUT | _40_PMn6_MODE_INPUT | _80_PM0_DEFAULT;
	;***       76 :     PM1 = _01_PMn0_NOT_USE | _02_PMn1_NOT_USE | _04_PMn2_NOT_USE | _08_PMn3_NOT_USE | _10_PMn4_NOT_USE |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 76
	mov 0xFFF21, #0x1F
	;***       77 :           _00_PMn5_MODE_OUTPUT | _00_PMn6_MODE_OUTPUT | _00_PMn7_MODE_OUTPUT;
	;***       78 :     PM3 = _01_PMn0_NOT_USE | _00_PMn1_MODE_OUTPUT | _FC_PM3_DEFAULT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 78
	mov 0xFFF23, #0xFD
	;***       79 :     PM5 = _01_PMn0_NOT_USE | _02_PMn1_NOT_USE | _04_PMn2_MODE_INPUT | _08_PMn3_MODE_INPUT | _10_PMn4_MODE_INPUT |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 79
	mov 0xFFF25, #0xDF
	;***       80 :           _00_PMn5_MODE_OUTPUT | _C0_PM5_DEFAULT;
	;***       81 :     PM6 = _00_PMn0_MODE_OUTPUT | _00_PMn1_MODE_OUTPUT | _00_PMn2_MODE_OUTPUT | _00_PMn3_MODE_OUTPUT |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 81
	mov 0xFFF26, #0x00
	;***       82 :           _00_PMn4_MODE_OUTPUT | _00_PMn5_MODE_OUTPUT | _00_PMn6_MODE_OUTPUT | _00_PMn7_MODE_OUTPUT;
	;***       83 :     PM7 = _01_PMn0_MODE_INPUT | _02_PMn1_MODE_INPUT | _04_PMn2_MODE_INPUT | _08_PMn3_MODE_INPUT | _10_PMn4_MODE_INPUT |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 83
	mov 0xFFF27, #0x3F
	;***       84 :           _20_PMn5_MODE_INPUT | _00_PMn6_MODE_OUTPUT | _00_PMn7_MODE_OUTPUT;
	;***       85 :     PM10 = _01_PMn0_MODE_INPUT | _FE_PM10_DEFAULT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 85
	mov 0xFFF2A, #0xFF
	;***       86 :     PM11 = _00_PMn0_MODE_OUTPUT | _00_PMn1_MODE_OUTPUT | _FC_PM11_DEFAULT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 86
	mov 0xFFF2B, #0xFC
	;***       87 :     PM12 = _00_PMn0_MODE_OUTPUT | _FE_PM12_DEFAULT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 87
	mov 0xFFF2C, #0xFE
	;***       88 :     PM14 = _00_PMn0_MODE_OUTPUT | _00_PMn1_MODE_OUTPUT | _00_PMn2_MODE_OUTPUT | _08_PMn3_NOT_USE | _10_PMn4_NOT_USE |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 88
	mov 0xFFF2E, #0xB8
	;***       89 :            _00_PMn6_MODE_OUTPUT | _80_PMn7_MODE_INPUT | _20_PM14_DEFAULT;
	;***       90 :     PM15 = _01_PMn0_NOT_USE | _02_PMn1_NOT_USE | _04_PMn2_NOT_USE | _08_PMn3_MODE_INPUT | _F0_PM15_DEFAULT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_port.c", 90
	mov 0xFFF2F, #0xFF
	ret
	;***       91 : }
	;***       92 : 
	;***       93 : /* Start user code for adding. Do not edit comment generated here */
	;***       94 : /* End user code. Do not edit comment generated here */
