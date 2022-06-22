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
#@   -o src/r_cg_timer.obj
#@   ../src/r_cg_timer.c
#@  compiled at Wed Jun 22 15:37:19 2022

	.PUBLIC _R_TAU0_Create
	.PUBLIC _R_TAU0_Channel0_Start
	.PUBLIC _R_TAU0_Channel0_Stop
	.PUBLIC _R_TAU0_Channel1_Start
	.PUBLIC _R_TAU0_Channel1_Stop
	.PUBLIC _R_TAU0_Channel2_Start
	.PUBLIC _R_TAU0_Channel2_Stop

	.SECTION .textf,TEXTF
_R_TAU0_Create:
	.STACK _R_TAU0_Create = 4
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
	;***       21 : * File Name    : r_cg_timer.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for TAU module.
	;***       26 : * Creation Date: 19/04/2022
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
	;***       51 : * Function Name: R_TAU0_Create
	;***       52 : * Description  : This function initializes the TAU0 module.
	;***       53 : * Arguments    : None
	;***       54 : * Return Value : None
	;***       55 : ***********************************************************************************************************************/
	;***       56 : void R_TAU0_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 56
	movw de, #0x00F0
	movw hl, #0x00F0
	clrw ax
	;***       57 : {
	;***       58 :     TAU0EN = 1U;    /* supplies input clock */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 58
	set1 [hl].0
	movw bc, ax
	;***       59 :     TPS0 = _0000_TAU_CKM0_FCLK_0 | _0000_TAU_CKM1_FCLK_0 | _0000_TAU_CKM2_FCLK_1 | _0000_TAU_CKM3_FCLK_8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 59
	movw [de+0xC6], ax
	movw ax, #0x0A0F
	;***       60 :     /* Stop all channels */
	;***       61 :     TT0 = _0001_TAU_CH0_STOP_TRG_ON | _0002_TAU_CH1_STOP_TRG_ON | _0004_TAU_CH2_STOP_TRG_ON |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 61
	movw [de+0xC4], ax
	;***       62 :           _0008_TAU_CH3_STOP_TRG_ON | _0200_TAU_CH1_H8_STOP_TRG_ON | _0800_TAU_CH3_H8_STOP_TRG_ON;
	;***       63 :     /* Mask channel 0 interrupt */
	;***       64 :     TMMK00 = 1U;    /* disable INTTM00 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 64
	set1 0xFFFE6.4
	;***       65 :     TMIF00 = 0U;    /* clear INTTM00 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 65
	clr1 0xFFFE2.4
	;***       66 :     /* Mask channel 1 interrupt */
	;***       67 :     TMMK01 = 1U;    /* disable INTTM01 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 67
	set1 0xFFFE6.5
	;***       68 :     TMIF01 = 0U;    /* clear INTTM01 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 68
	clr1 0xFFFE2.5
	;***       69 :     /* Mask channel 1 higher 8 bits interrupt */
	;***       70 :     TMMK01H = 1U;    /* disable INTTM01H interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 70
	set1 0xFFFE5.7
	;***       71 :     TMIF01H = 0U;    /* clear INTTM01H interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 71
	clr1 0xFFFE1.7
	;***       72 :     /* Mask channel 2 interrupt */
	;***       73 :     TMMK02 = 1U;    /* disable INTTM02 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 73
	set1 0xFFFE6.6
	;***       74 :     TMIF02 = 0U;    /* clear INTTM02 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 74
	clr1 0xFFFE2.6
	;***       75 :     /* Mask channel 3 interrupt */
	;***       76 :     TMMK03 = 1U;    /* disable INTTM03 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 76
	set1 0xFFFE6.7
	;***       77 :     TMIF03 = 0U;    /* clear INTTM03 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 77
	clr1 0xFFFE2.7
	;***       78 :     /* Mask channel 3 higher 8 bits interrupt */
	;***       79 :     TMMK03H = 1U;    /* disable INTTM03H interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 79
	set1 0xFFFE6.2
	;***       80 :     TMIF03H = 0U;    /* clear INTTM03H interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 80
	clr1 0xFFFE2.2
	;***       81 :     /* Set INTTM00 low priority */
	;***       82 :     TMPR100 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 82
	set1 0xFFFEE.4
	;***       83 :     TMPR000 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 83
	set1 0xFFFEA.4
	;***       84 :     /* Set INTTM01 low priority */
	;***       85 :     TMPR101 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 85
	set1 0xFFFEE.5
	;***       86 :     TMPR001 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 86
	set1 0xFFFEA.5
	;***       87 :     /* Set INTTM02 low priority */
	;***       88 :     TMPR102 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 88
	set1 0xFFFEE.6
	;***       89 :     TMPR002 = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 89
	set1 0xFFFEA.6
	movw ax, bc
	;***       90 :     /* Channel 0 used as interval timer */
	;***       91 :     TMR00 = _0000_TAU_CLOCK_SELECT_CKM0 | _0000_TAU_CLOCK_MODE_CKS | _0000_TAU_COMBINATION_SLAVE |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 91
	movw [de+0xA0], ax
	;***       92 :             _0000_TAU_TRIGGER_SOFTWARE | _0000_TAU_MODE_INTERVAL_TIMER | _0000_TAU_START_INT_UNUSED;
	;***       93 :     TDR00 = _7CFF_TAU_TDR00_VALUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 93
	movw 0xFFF18, #0x7CFF
	;***       94 :     TO0 &= ~_0001_TAU_CH0_OUTPUT_VALUE_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 94
	movw ax, [de+0xC8]
	xch a, x
	and a, #0xFE
	xch a, x
	movw [de+0xC8], ax
	;***       95 :     TOE0 &= ~_0001_TAU_CH0_OUTPUT_ENABLE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 95
	movw ax, [de+0xCA]
	xch a, x
	and a, #0xFE
	xch a, x
	movw [de+0xCA], ax
	movw ax, bc
	;***       96 :     /* Channel 1 used as interval timer */
	;***       97 :     TMR01 = _0000_TAU_CLOCK_SELECT_CKM0 | _0000_TAU_CLOCK_MODE_CKS | _0000_TAU_16BITS_MODE |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 97
	movw [de+0xA2], ax
	;***       98 :             _0000_TAU_TRIGGER_SOFTWARE | _0000_TAU_MODE_INTERVAL_TIMER | _0000_TAU_START_INT_UNUSED;
	;***       99 :     TDR01 = _0C7F_TAU_TDR01_VALUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 99
	movw 0xFFF1A, #0x0C7F
	;***      100 :     TOM0 &= ~_0002_TAU_CH1_OUTPUT_COMBIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 100
	movw ax, [de+0xCE]
	xch a, x
	and a, #0xFD
	xch a, x
	movw [de+0xCE], ax
	;***      101 :     TOL0 &= ~_0002_TAU_CH1_OUTPUT_LEVEL_L;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 101
	movw ax, [de+0xCC]
	xch a, x
	and a, #0xFD
	xch a, x
	movw [de+0xCC], ax
	;***      102 :     TO0 &= ~_0002_TAU_CH1_OUTPUT_VALUE_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 102
	movw ax, [de+0xC8]
	xch a, x
	and a, #0xFD
	xch a, x
	movw [de+0xC8], ax
	;***      103 :     TOE0 &= ~_0002_TAU_CH1_OUTPUT_ENABLE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 103
	movw ax, [de+0xCA]
	xch a, x
	and a, #0xFD
	xch a, x
	movw [de+0xCA], ax
	movw ax, bc
	;***      104 :     /* Channel 2 used as interval timer */
	;***      105 :     TMR02 = _0000_TAU_CLOCK_SELECT_CKM0 | _0000_TAU_CLOCK_MODE_CKS | _0000_TAU_COMBINATION_SLAVE |
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 105
	movw [de+0xA4], ax
	;***      106 :             _0000_TAU_TRIGGER_SOFTWARE | _0000_TAU_MODE_INTERVAL_TIMER | _0000_TAU_START_INT_UNUSED;
	;***      107 :     TDR02 = _0C7F_TAU_TDR02_VALUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 107
	movw 0xFFF64, #0x0C7F
	;***      108 :     TOM0 &= ~_0004_TAU_CH2_OUTPUT_COMBIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 108
	movw ax, [de+0xCE]
	xch a, x
	and a, #0xFB
	xch a, x
	movw [de+0xCE], ax
	;***      109 :     TOL0 &= ~_0004_TAU_CH2_OUTPUT_LEVEL_L;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 109
	movw ax, [de+0xCC]
	xch a, x
	and a, #0xFB
	xch a, x
	movw [de+0xCC], ax
	;***      110 :     TO0 &= ~_0004_TAU_CH2_OUTPUT_VALUE_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 110
	movw ax, [de+0xC8]
	xch a, x
	and a, #0xFB
	xch a, x
	movw [de+0xC8], ax
	;***      111 :     TOE0 &= ~_0004_TAU_CH2_OUTPUT_ENABLE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 111
	movw ax, [de+0xCA]
	xch a, x
	and a, #0xFB
	xch a, x
	movw [de+0xCA], ax
	ret
_R_TAU0_Channel0_Start:
	.STACK _R_TAU0_Channel0_Start = 4
	;***      112 : }
	;***      113 : 
	;***      114 : /***********************************************************************************************************************
	;***      115 : * Function Name: R_TAU0_Channel0_Start
	;***      116 : * Description  : This function starts TAU0 channel 0 counter.
	;***      117 : * Arguments    : None
	;***      118 : * Return Value : None
	;***      119 : ***********************************************************************************************************************/
	;***      120 : void R_TAU0_Channel0_Start(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 120
	movw de, #0x01B2
	;***      121 : {
	;***      122 :     TMIF00 = 0U;    /* clear INTTM00 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 122
	clr1 0xFFFE2.4
	;***      123 :     TMMK00 = 0U;    /* enable INTTM00 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 123
	clr1 0xFFFE6.4
	;***      124 :     TS0 |= _0001_TAU_CH0_START_TRG_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 124
	movw ax, [de]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de], ax
	ret
_R_TAU0_Channel0_Stop:
	.STACK _R_TAU0_Channel0_Stop = 4
	;***      125 : }
	;***      126 : 
	;***      127 : /***********************************************************************************************************************
	;***      128 : * Function Name: R_TAU0_Channel0_Stop
	;***      129 : * Description  : This function stops TAU0 channel 0 counter.
	;***      130 : * Arguments    : None
	;***      131 : * Return Value : None
	;***      132 : ***********************************************************************************************************************/
	;***      133 : void R_TAU0_Channel0_Stop(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 133
	movw de, #0x01B4
	;***      134 : {
	;***      135 :     TT0 |= _0001_TAU_CH0_STOP_TRG_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 135
	movw ax, [de]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de], ax
	;***      136 :     /* Mask channel 0 interrupt */
	;***      137 :     TMMK00 = 1U;    /* disable INTTM00 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 137
	set1 0xFFFE6.4
	;***      138 :     TMIF00 = 0U;    /* clear INTTM00 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 138
	clr1 0xFFFE2.4
	ret
_R_TAU0_Channel1_Start:
	.STACK _R_TAU0_Channel1_Start = 4
	;***      139 : }
	;***      140 : 
	;***      141 : /***********************************************************************************************************************
	;***      142 : * Function Name: R_TAU0_Channel1_Start
	;***      143 : * Description  : This function starts TAU0 channel 1 counter.
	;***      144 : * Arguments    : None
	;***      145 : * Return Value : None
	;***      146 : ***********************************************************************************************************************/
	;***      147 : void R_TAU0_Channel1_Start(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 147
	movw de, #0x01B2
	;***      148 : {
	;***      149 :     TMIF01 = 0U;    /* clear INTTM01 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 149
	clr1 0xFFFE2.5
	;***      150 :     TMMK01 = 0U;    /* enable INTTM01 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 150
	clr1 0xFFFE6.5
	;***      151 :     TS0 |= _0002_TAU_CH1_START_TRG_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 151
	movw ax, [de]
	xch a, x
	or a, #0x02
	xch a, x
	movw [de], ax
	ret
_R_TAU0_Channel1_Stop:
	.STACK _R_TAU0_Channel1_Stop = 4
	;***      152 : }
	;***      153 : 
	;***      154 : /***********************************************************************************************************************
	;***      155 : * Function Name: R_TAU0_Channel1_Stop
	;***      156 : * Description  : This function stops TAU0 channel 1 counter.
	;***      157 : * Arguments    : None
	;***      158 : * Return Value : None
	;***      159 : ***********************************************************************************************************************/
	;***      160 : void R_TAU0_Channel1_Stop(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 160
	movw de, #0x01B4
	;***      161 : {
	;***      162 :     TT0 |= _0002_TAU_CH1_STOP_TRG_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 162
	movw ax, [de]
	xch a, x
	or a, #0x02
	xch a, x
	movw [de], ax
	;***      163 :     /* Mask channel 1 interrupt */
	;***      164 :     TMMK01 = 1U;    /* disable INTTM01 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 164
	set1 0xFFFE6.5
	;***      165 :     TMIF01 = 0U;    /* clear INTTM01 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 165
	clr1 0xFFFE2.5
	ret
_R_TAU0_Channel2_Start:
	.STACK _R_TAU0_Channel2_Start = 4
	;***      166 : }
	;***      167 : 
	;***      168 : /***********************************************************************************************************************
	;***      169 : * Function Name: R_TAU0_Channel2_Start
	;***      170 : * Description  : This function starts TAU0 channel 2 counter.
	;***      171 : * Arguments    : None
	;***      172 : * Return Value : None
	;***      173 : ***********************************************************************************************************************/
	;***      174 : void R_TAU0_Channel2_Start(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 174
	movw de, #0x01B2
	;***      175 : {
	;***      176 :     TMIF02 = 0U;    /* clear INTTM02 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 176
	clr1 0xFFFE2.6
	;***      177 :     TMMK02 = 0U;    /* enable INTTM02 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 177
	clr1 0xFFFE6.6
	;***      178 :     TS0 |= _0004_TAU_CH2_START_TRG_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 178
	movw ax, [de]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de], ax
	ret
_R_TAU0_Channel2_Stop:
	.STACK _R_TAU0_Channel2_Stop = 4
	;***      179 : }
	;***      180 : 
	;***      181 : /***********************************************************************************************************************
	;***      182 : * Function Name: R_TAU0_Channel2_Stop
	;***      183 : * Description  : This function stops TAU0 channel 2 counter.
	;***      184 : * Arguments    : None
	;***      185 : * Return Value : None
	;***      186 : ***********************************************************************************************************************/
	;***      187 : void R_TAU0_Channel2_Stop(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 187
	movw de, #0x01B4
	;***      188 : {
	;***      189 :     TT0 |= _0004_TAU_CH2_STOP_TRG_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 189
	movw ax, [de]
	xch a, x
	or a, #0x04
	xch a, x
	movw [de], ax
	;***      190 :     /* Mask channel 2 interrupt */
	;***      191 :     TMMK02 = 1U;    /* disable INTTM02 interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 191
	set1 0xFFFE6.6
	;***      192 :     TMIF02 = 0U;    /* clear INTTM02 interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_timer.c", 192
	clr1 0xFFFE2.6
	ret
	;***      193 : }
	;***      194 : 
	;***      195 : /* Start user code for adding. Do not edit comment generated here */
	;***      196 : /* End user code. Do not edit comment generated here */
