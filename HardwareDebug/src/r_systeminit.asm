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
#@   -o src/r_systeminit.obj
#@   ../src/r_systeminit.c
#@  compiled at Tue Dec 07 09:51:57 2021

	.PUBLIC _R_Systeminit
	.EXTERN _R_CGC_Get_ResetSource
	.EXTERN _R_CGC_Create
	.EXTERN _R_PORT_Create
	.EXTERN _R_SAU0_Create
	.EXTERN _R_SAU1_Create
	.EXTERN _R_ADC_Create
	.EXTERN _R_TAU0_Create
	.EXTERN _R_WDT_Create
	.EXTERN _R_RTC_Create
	.EXTERN _R_DAC_Create
	.PUBLIC _hdwinit

	.SECTION .textf,TEXTF
_R_Systeminit:
	.STACK _R_Systeminit = 4
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
	;***       21 : * File Name    : r_systeminit.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements system initializing function.
	;***       26 : * Creation Date: 30/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_cgc.h"
	;***       34 : #include "r_cg_port.h"
	;***       35 : #include "r_cg_serial.h"
	;***       36 : #include "r_cg_adc.h"
	;***       37 : #include "r_cg_dac.h"
	;***       38 : #include "r_cg_timer.h"
	;***       39 : #include "r_cg_wdt.h"
	;***       40 : #include "r_cg_rtc.h"
	;***       41 : /* Start user code for include. Do not edit comment generated here */
	;***       42 : /* End user code. Do not edit comment generated here */
	;***       43 : #include "r_cg_userdefine.h"
	;***       44 : 
	;***       45 : /***********************************************************************************************************************
	;***       46 : Pragma directive
	;***       47 : ***********************************************************************************************************************/
	;***       48 : /* Start user code for pragma. Do not edit comment generated here */
	;***       49 : /* End user code. Do not edit comment generated here */
	;***       50 : 
	;***       51 : /***********************************************************************************************************************
	;***       52 : Global variables and functions
	;***       53 : ***********************************************************************************************************************/
	;***       54 : /* Start user code for global. Do not edit comment generated here */
	;***       55 : /* End user code. Do not edit comment generated here */
	;***       56 : 
	;***       57 : /***********************************************************************************************************************
	;***       58 : * Function Name: R_Systeminit
	;***       59 : * Description  : This function initializes every macro.
	;***       60 : * Arguments    : None
	;***       61 : * Return Value : None
	;***       62 : ***********************************************************************************************************************/
	;***       63 : void R_Systeminit(void)
	;***       64 : {
	;***       65 :     PIOR0 = 0x00U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 65
	clrb !0x0077
	;***       66 :     PIOR1 = 0x00U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 66
	clrb !0x0079
	;***       67 :     R_CGC_Get_ResetSource();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 67
	call !!_R_CGC_Get_ResetSource
	;***       68 :     R_CGC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 68
	call !!_R_CGC_Create
	;***       69 :     R_PORT_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 69
	call !!_R_PORT_Create
	;***       70 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 70
	call !!_R_SAU0_Create
	;***       71 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 71
	call !!_R_SAU1_Create
	;***       72 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 72
	call !!_R_ADC_Create
	;***       73 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 73
	call !!_R_TAU0_Create
	;***       74 :     R_WDT_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 74
	call !!_R_WDT_Create
	;***       75 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 75
	call !!_R_RTC_Create
	;***       76 :     R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 76
	call !!_R_DAC_Create
	;***       77 :     IAWCTL = 0x00U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 77
	clrb !0x0078
	ret
_hdwinit:
	.STACK _hdwinit = 4
	;***       78 : }
	;***       79 : 
	;***       80 : 
	;***       81 : /***********************************************************************************************************************
	;***       82 : * Function Name: hdwinit
	;***       83 : * Description  : This function initializes hardware setting.
	;***       84 : * Arguments    : None
	;***       85 : * Return Value : None
	;***       86 : ***********************************************************************************************************************/
	;***       87 : void hdwinit(void)
	;***       88 : {
	;***       89 :     DI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 89
	di
	;***       90 :     R_Systeminit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_systeminit.c", 90
	br $_R_Systeminit
	;***       91 : }
	;***       92 : 
	;***       93 : /* Start user code for adding. Do not edit comment generated here */
	;***       94 : /* End user code. Do not edit comment generated here */
