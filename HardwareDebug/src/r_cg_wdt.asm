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
#@   -o src/r_cg_wdt.obj
#@   ../src/r_cg_wdt.c
#@  compiled at Thu Dec 23 17:24:08 2021

	.PUBLIC _R_WDT_Create
	.PUBLIC _R_WDT_Restart

	.SECTION .textf,TEXTF
_R_WDT_Create:
	.STACK _R_WDT_Create = 4
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
	;***       21 : * File Name    : r_cg_wdt.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for WDT module.
	;***       26 : * Creation Date: 30/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_wdt.h"
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
	;***       51 : * Function Name: R_WDT_Create
	;***       52 : * Description  : This function initializes the watchdogtimer.
	;***       53 : * Arguments    : None
	;***       54 : * Return Value : None
	;***       55 : ***********************************************************************************************************************/
	;***       56 : void R_WDT_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_wdt.c", 56
	movw hl, #0xFFE4
	;***       57 : {
	;***       58 :     WDTIMK = 1U;    /* disable INTWDTI interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_wdt.c", 58
	set1 [hl].0
	;***       59 :     WDTIIF = 0U;    /* clear INTWDTI interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_wdt.c", 59
	clr1 0xFFFE0.0
	;***       60 :     /* Set INTWDTI low priority */
	;***       61 :     WDTIPR1 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_wdt.c", 61
	set1 0xFFFEC.0
	;***       62 :     WDTIPR0 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_wdt.c", 62
	set1 0xFFFE8.0
	;***       63 :     WDTIMK = 0U;    /* enable INTWDTI interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_wdt.c", 63
	clr1 [hl].0
	ret
_R_WDT_Restart:
	.STACK _R_WDT_Restart = 4
	;***       64 : }
	;***       65 : 
	;***       66 : /***********************************************************************************************************************
	;***       67 : * Function Name: R_WDT_Restart
	;***       68 : * Description  : This function restarts the watchdog timer.
	;***       69 : * Arguments    : None
	;***       70 : * Return Value : None
	;***       71 : ***********************************************************************************************************************/
	;***       72 : void R_WDT_Restart(void)
	;***       73 : {
	;***       74 :     WDTE = 0xACU;   /* restart watchdog timer */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_wdt.c", 74
	mov 0xFFFAB, #0xAC
	ret
	;***       75 : }
	;***       76 : 
	;***       77 : /* Start user code for adding. Do not edit comment generated here */
	;***       78 : /* End user code. Do not edit comment generated here */
