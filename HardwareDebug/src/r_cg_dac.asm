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
#@   -o src/r_cg_dac.obj
#@   ../src/r_cg_dac.c
#@  compiled at Thu Feb 10 14:43:41 2022

	.PUBLIC _R_DAC_Create
	.PUBLIC _R_DAC0_Start
	.PUBLIC _R_DAC0_Stop
	.PUBLIC _R_DAC0_Set_ConversionValue
	.PUBLIC _R_DAC1_Start
	.PUBLIC _R_DAC1_Stop
	.PUBLIC _R_DAC1_Set_ConversionValue

	.SECTION .textf,TEXTF
_R_DAC_Create:
	.STACK _R_DAC_Create = 4
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
	;***       21 : * File Name    : r_cg_dac.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for DAC module.
	;***       26 : * Creation Date: 30/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_dac.h"
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
	;***       51 : * Function Name: R_DAC_Create
	;***       52 : * Description  : This function initializes the DA converter.
	;***       53 : * Arguments    : None
	;***       54 : * Return Value : None
	;***       55 : ***********************************************************************************************************************/
	;***       56 : void R_DAC_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 56
	movw hl, #0x007A
	mov a, #0x04
	;***       57 : {
	;***       58 :     DACEN = 1U;  /* supply DA clock */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 58
	set1 [hl].7
	;***       59 :     DAM = _00_DA0_CONVERSION_MODE_NORMAL | _00_DA1_CONVERSION_MODE_NORMAL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 59
	mov 0xFFF36, #0x00
	;***       60 :     /* Initialize DA0 configuration */
	;***       61 :     DACS0 = _00_DA0_CONVERSION_VALUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 61
	mov 0xFFF34, #0x00
	;***       62 :     /* The reset status of ADPC is analog input, so it's unnecessary to set. */
	;***       63 :     /* Set ANO0 pin */
	;***       64 :     PM2 |= 0x04U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 64
	or a, !0xFF22
	mov 0xFFF22, a
	;***       65 :     /* Initialize DA1 configuration */
	;***       66 :     DACS1 = _00_DA1_CONVERSION_VALUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 66
	mov 0xFFF35, #0x00
	mov a, #0x08
	;***       67 :     /* The reset status of ADPC is analog input, so it's unnecessary to set. */
	;***       68 :     /* Set ANO1 pin */
	;***       69 :     PM2 |= 0x08U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 69
	or a, !0xFF22
	mov 0xFFF22, a
	ret
_R_DAC0_Start:
	.STACK _R_DAC0_Start = 4
	;***       70 : }
	;***       71 : 
	;***       72 : /***********************************************************************************************************************
	;***       73 : * Function Name: R_DAC0_Start
	;***       74 : * Description  : This function enables the DA converter channel 0.
	;***       75 : * Arguments    : None
	;***       76 : * Return Value : None
	;***       77 : ***********************************************************************************************************************/
	;***       78 : void R_DAC0_Start(void)
	;***       79 : {
	;***       80 :     DACE0 = 1U;  /* enable DA0 conversion */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 80
	set1 0xFFF36.4
	ret
_R_DAC0_Stop:
	.STACK _R_DAC0_Stop = 4
	;***       81 : }
	;***       82 : 
	;***       83 : /***********************************************************************************************************************
	;***       84 : * Function Name: R_DAC0_Stop
	;***       85 : * Description  : This function stops the DA converter channel 0.
	;***       86 : * Arguments    : None
	;***       87 : * Return Value : None
	;***       88 : ***********************************************************************************************************************/
	;***       89 : void R_DAC0_Stop(void)
	;***       90 : {
	;***       91 :     DACE0 = 0U;  /* stop DA0 conversion */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 91
	clr1 0xFFF36.4
	ret
_R_DAC0_Set_ConversionValue:
	.STACK _R_DAC0_Set_ConversionValue = 4
	;***       92 : }
	;***       93 : 
	;***       94 : /***********************************************************************************************************************
	;***       95 : * Function Name: R_DAC0_Set_ConversionValue
	;***       96 : * Description  : This function sets the DA converter channel 0 value.
	;***       97 : * Arguments    : reg_value -
	;***       98 : *                    value of conversion
	;***       99 : * Return Value : None
	;***      100 : ***********************************************************************************************************************/
	;***      101 : void R_DAC0_Set_ConversionValue(uint8_t reg_value)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 101
	mov 0xFFF34, a
	;***      102 : {
	;***      103 :     DACS0 = reg_value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 103
	ret
_R_DAC1_Start:
	.STACK _R_DAC1_Start = 4
	;***      104 : }
	;***      105 : 
	;***      106 : /***********************************************************************************************************************
	;***      107 : * Function Name: R_DAC1_Start
	;***      108 : * Description  : This function enables the DA converter channel 1.
	;***      109 : * Arguments    : None
	;***      110 : * Return Value : None
	;***      111 : ***********************************************************************************************************************/
	;***      112 : void R_DAC1_Start(void)
	;***      113 : {
	;***      114 :     DACE1 = 1U;  /* enable DA1 conversion */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 114
	set1 0xFFF36.5
	ret
_R_DAC1_Stop:
	.STACK _R_DAC1_Stop = 4
	;***      115 : }
	;***      116 : 
	;***      117 : /***********************************************************************************************************************
	;***      118 : * Function Name: R_DAC1_Stop
	;***      119 : * Description  : This function stops the DA converter channel 1.
	;***      120 : * Arguments    : None
	;***      121 : * Return Value : None
	;***      122 : ***********************************************************************************************************************/
	;***      123 : void R_DAC1_Stop(void)
	;***      124 : {
	;***      125 :     DACE1 = 0U;  /* stop DA1 conversion */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 125
	clr1 0xFFF36.5
	ret
_R_DAC1_Set_ConversionValue:
	.STACK _R_DAC1_Set_ConversionValue = 4
	;***      126 : }
	;***      127 : 
	;***      128 : /***********************************************************************************************************************
	;***      129 : * Function Name: R_DAC1_Set_ConversionValue
	;***      130 : * Description  : This function sets the DA converter channel 1 value.
	;***      131 : * Arguments    : reg_value -
	;***      132 : *                    value of conversion
	;***      133 : * Return Value : None
	;***      134 : ***********************************************************************************************************************/
	;***      135 : void R_DAC1_Set_ConversionValue(uint8_t reg_value)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 135
	mov 0xFFF35, a
	;***      136 : {
	;***      137 :     DACS1 = reg_value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_dac.c", 137
	ret
	;***      138 : }
	;***      139 : 
	;***      140 : /* Start user code for adding. Do not edit comment generated here */
	;***      141 : /* End user code. Do not edit comment generated here */
