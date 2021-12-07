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
#@   -o src/r_cg_adc.obj
#@   ../src/r_cg_adc.c
#@  compiled at Tue Dec 07 17:32:31 2021

	.PUBLIC _R_ADC_Create
	.PUBLIC _R_ADC_Start
	.PUBLIC _R_ADC_Stop
	.PUBLIC _R_ADC_Set_OperationOn
	.PUBLIC _R_ADC_Set_OperationOff
	.PUBLIC _R_ADC_Get_Result
	.PUBLIC _R_ADC_Set_ADChannel

	.SECTION .textf,TEXTF
_R_ADC_Create:
	.STACK _R_ADC_Create = 4
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
	;***       21 : * File Name    : r_cg_adc.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for ADC module.
	;***       26 : * Creation Date: 30/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_adc.h"
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
	;***       51 : * Function Name: R_ADC_Create
	;***       52 : * Description  : This function initializes the AD converter.
	;***       53 : * Arguments    : None
	;***       54 : * Return Value : None
	;***       55 : ***********************************************************************************************************************/
	;***       56 : void R_ADC_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 56
	movw ax, #0x0010
	movw de, ax
	;***       57 : {    
	;***       58 :     ADCEN = 1U;  /* supply AD clock */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 58
	addw ax, #0x00E0
	movw hl, ax
	mov a, #0x0F
	set1 [hl].5
	;***       59 :     ADM0 = _00_AD_ADM0_INITIALVALUE;  /* disable AD conversion and clear ADM0 register */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 59
	mov 0xFFF30, #0x00
	;***       60 :     ADMK = 1U;  /* disable INTAD interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 60
	set1 0xFFFE7.0
	;***       61 :     ADIF = 0U;  /* clear INTAD interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 61
	clr1 0xFFFE3.0
	;***       62 :     /* Set INTAD low priority */
	;***       63 :     ADPR1 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 63
	set1 0xFFFEF.0
	;***       64 :     ADPR0 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 64
	set1 0xFFFEB.0
	;***       65 :     /* The reset status of ADPC is analog input, so it's unnecessary to set. */
	;***       66 :     /* Set ANI0 - ANI3 pin as analog input */
	;***       67 :     PM2 |= 0x0FU;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 67
	or a, !0xFF22
	mov 0xFFF22, a
	;***       68 :     ADM0 = _00_AD_CONVERSION_CLOCK_64 | _00_AD_TIME_MODE_NORMAL_1 | _00_AD_OPERMODE_SELECT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 68
	mov 0xFFF30, #0x00
	;***       69 :     ADM1 = _00_AD_TRIGGER_SOFTWARE | _20_AD_CONVMODE_ONESELECT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 69
	mov 0xFFF32, #0x20
	;***       70 :     ADM2 = _00_AD_POSITIVE_VDD | _00_AD_NEGATIVE_VSS | _00_AD_AREA_MODE_1 | _00_AD_RESOLUTION_10BIT;          
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 70
	mov [de+0x00], #0x00
	;***       71 :     ADUL = _FF_AD_ADUL_VALUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 71
	mov [de+0x01], #0xFF
	;***       72 :     ADLL = _00_AD_ADLL_VALUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 72
	mov [de+0x02], #0x00
	;***       73 :     ADS = _01_AD_INPUT_CHANNEL_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 73
	mov 0xFFF31, #0x01
	ret
_R_ADC_Start:
	.STACK _R_ADC_Start = 4
	;***       74 : }
	;***       75 : 
	;***       76 : /***********************************************************************************************************************
	;***       77 : * Function Name: R_ADC_Start
	;***       78 : * Description  : This function starts the AD converter.
	;***       79 : * Arguments    : None
	;***       80 : * Return Value : None
	;***       81 : ***********************************************************************************************************************/
	;***       82 : void R_ADC_Start(void)
	;***       83 : {
	;***       84 :     ADIF = 0U;  /* clear INTAD interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 84
	clr1 0xFFFE3.0
	;***       85 :     ADMK = 0U;  /* enable INTAD interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 85
	clr1 0xFFFE7.0
	;***       86 :     ADCS = 1U;  /* enable AD conversion */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 86
	set1 0xFFF30.7
	ret
_R_ADC_Stop:
	.STACK _R_ADC_Stop = 4
	;***       87 : }
	;***       88 : 
	;***       89 : /***********************************************************************************************************************
	;***       90 : * Function Name: R_ADC_Stop
	;***       91 : * Description  : This function stops the AD converter.
	;***       92 : * Arguments    : None
	;***       93 : * Return Value : None
	;***       94 : ***********************************************************************************************************************/
	;***       95 : void R_ADC_Stop(void)
	;***       96 : {
	;***       97 :     ADCS = 0U;  /* disable AD conversion */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 97
	clr1 0xFFF30.7
	;***       98 :     ADMK = 1U;  /* disable INTAD interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 98
	set1 0xFFFE7.0
	;***       99 :     ADIF = 0U;  /* clear INTAD interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 99
	clr1 0xFFFE3.0
	ret
_R_ADC_Set_OperationOn:
	.STACK _R_ADC_Set_OperationOn = 4
	;***      100 : }
	;***      101 : 
	;***      102 : /***********************************************************************************************************************
	;***      103 : * Function Name: R_ADC_Set_OperationOn
	;***      104 : * Description  : This function enables comparator operation.
	;***      105 : * Arguments    : None
	;***      106 : * Return Value : None
	;***      107 : ***********************************************************************************************************************/
	;***      108 : void R_ADC_Set_OperationOn(void)
	;***      109 : {
	;***      110 :     ADCE = 1U;  /* enable AD comparator */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 110
	set1 0xFFF30.0
	ret
_R_ADC_Set_OperationOff:
	.STACK _R_ADC_Set_OperationOff = 4
	;***      111 : }
	;***      112 : 
	;***      113 : /***********************************************************************************************************************
	;***      114 : * Function Name: R_ADC_Set_OperationOff
	;***      115 : * Description  : This function stops comparator operation.
	;***      116 : * Arguments    : None
	;***      117 : * Return Value : None
	;***      118 : ***********************************************************************************************************************/
	;***      119 : void R_ADC_Set_OperationOff(void)
	;***      120 : {
	;***      121 :     ADCE = 0U;  /* disable AD comparator */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 121
	clr1 0xFFF30.0
	ret
_R_ADC_Get_Result:
	.STACK _R_ADC_Get_Result = 4
	;***      122 : }
	;***      123 : 
	;***      124 : /***********************************************************************************************************************
	;***      125 : * Function Name: R_ADC_Get_Result
	;***      126 : * Description  : This function returns the conversion result in the buffer.
	;***      127 : * Arguments    : buffer -
	;***      128 : *                    the address where to write the conversion result
	;***      129 : * Return Value : None
	;***      130 : ***********************************************************************************************************************/
	;***      131 : void R_ADC_Get_Result(uint16_t * const buffer)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 131
	movw de, ax
	;***      132 : {
	;***      133 :     *buffer = (uint16_t)(ADCR >> 6U);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 133
	movw ax, 0xFFF1E
	shrw ax, 0x06
	movw [de], ax
	ret
_R_ADC_Set_ADChannel:
	.STACK _R_ADC_Set_ADChannel = 4
	;***      134 : }
	;***      135 : 
	;***      136 : /* Start user code for adding. Do not edit comment generated here */
	;***      137 : MD_STATUS R_ADC_Set_ADChannel(ad_channel_t channel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 137
	cmp a, #0x15
	;***      138 : 	if(channel > 20)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 138
	bc $.BB@LABEL@7_2
.BB@LABEL@7_1:	; bb8
	;***      139 : 		return MD_ARGERROR;
	;***      140 : 	ADS = channel;
	;***      141 : 	return MD_OK;
	;***      142 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 142
	movw ax, #0x0081
	ret
.BB@LABEL@7_2:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 140
	mov 0xFFF31, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_adc.c", 141
	clrw ax
	ret
	;***      143 : /* End user code. Do not edit comment generated here */
