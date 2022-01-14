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
#@   -o src/r_cg_cgc_user.obj
#@   ../src/r_cg_cgc_user.c
#@  compiled at Fri Jan 14 16:27:54 2022

	.PUBLIC _R_CGC_Get_ResetSource

	.SECTION .textf,TEXTF
_R_CGC_Get_ResetSource:
	.STACK _R_CGC_Get_ResetSource = 4
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
	;***       21 : * File Name    : r_cg_cgc_user.c
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
	;***       51 : * Function Name: R_CGC_Get_ResetSource
	;***       52 : * Description  : This function process of Reset.
	;***       53 : * Arguments    : None
	;***       54 : * Return Value : None
	;***       55 : ***********************************************************************************************************************/
	;***       56 : void R_CGC_Get_ResetSource(void)
	;***       57 : {
	;***       58 :     uint8_t reset_flag = RESF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_cgc_user.c", 58
	mov a, 0xFFFA8
	ret
	;***       59 :     /* Start user code. Do not edit comment generated here */
	;***       60 :     /* End user code. Do not edit comment generated here */
	;***       61 : }
	;***       62 : 
	;***       63 : /* Start user code for adding. Do not edit comment generated here */
	;***       64 : /* End user code. Do not edit comment generated here */
