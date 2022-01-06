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
#@   -o src/r_cg_rtc.obj
#@   ../src/r_cg_rtc.c
#@  compiled at Thu Jan 06 18:03:42 2022

	.PUBLIC _R_RTC_Create
	.PUBLIC _R_RTC_Start
	.PUBLIC _R_RTC_Stop
	.PUBLIC _R_RTC_Get_CounterValue
	.PUBLIC _R_RTC_Set_CounterValue

	.SECTION .textf,TEXTF
_R_RTC_Create:
	.STACK _R_RTC_Create = 4
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
	;***       21 : * File Name    : r_cg_rtc.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements device driver for RTC module.
	;***       26 : * Creation Date: 30/11/2021
	;***       27 : ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 : Includes
	;***       31 : ***********************************************************************************************************************/
	;***       32 : #include "r_cg_macrodriver.h"
	;***       33 : #include "r_cg_rtc.h"
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
	;***       51 : * Function Name: R_RTC_Create
	;***       52 : * Description  : This function initializes the real-time clock module.
	;***       53 : * Arguments    : None
	;***       54 : * Return Value : None
	;***       55 : ***********************************************************************************************************************/
	;***       56 : void R_RTC_Create(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 56
	movw hl, #0x00F0
	;***       57 : {
	;***       58 :     RTCEN = 1U;    /* supply RTC clock */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 58
	set1 [hl].7
	;***       59 :     RTCE = 0U;     /* disable RTC clock operation */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 59
	clr1 0xFFF9D.7
	;***       60 :     RTCMK = 1U;    /* disable INTRTC interrupt */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 60
	set1 0xFFFE7.1
	;***       61 :     RTCIF = 0U;    /* clear INTRTC interrupt flag */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 61
	clr1 0xFFFE3.1
	;***       62 :     RTCC0 = _00_RTC_RTC1HZ_DISABLE | _08_RTC_24HOUR_SYSTEM | _00_RTC_INTRTC_NOT_GENERATE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 62
	mov 0xFFF9D, #0x08
	;***       63 :     /* Set real-time clock */
	;***       64 :     SEC = _00_RTC_COUNTER_SEC;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 64
	mov 0xFFF92, #0x00
	;***       65 :     MIN = _00_RTC_COUNTER_MIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 65
	mov 0xFFF93, #0x00
	;***       66 :     HOUR = _10_RTC_COUNTER_HOUR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 66
	mov 0xFFF94, #0x10
	;***       67 :     WEEK = _04_RTC_COUNTER_WEEK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 67
	mov 0xFFF95, #0x04
	;***       68 :     DAY = _04_RTC_COUNTER_DAY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 68
	mov 0xFFF96, #0x04
	;***       69 :     MONTH = _11_RTC_COUNTER_MONTH;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 69
	mov 0xFFF97, #0x11
	;***       70 :     YEAR = _21_RTC_COUNTER_YEAR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 70
	mov 0xFFF98, #0x21
	ret
_R_RTC_Start:
	.STACK _R_RTC_Start = 4
	;***       71 : }
	;***       72 : 
	;***       73 : /***********************************************************************************************************************
	;***       74 : * Function Name: R_RTC_Start
	;***       75 : * Description  : This function enables the real-time clock.
	;***       76 : * Arguments    : None
	;***       77 : * Return Value : None
	;***       78 : ***********************************************************************************************************************/
	;***       79 : void R_RTC_Start(void)
	;***       80 : {
	;***       81 :     RTCE = 1U;     /* enable RTC clock operation */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 81
	set1 0xFFF9D.7
	ret
_R_RTC_Stop:
	.STACK _R_RTC_Stop = 4
	;***       82 : }
	;***       83 : 
	;***       84 : /***********************************************************************************************************************
	;***       85 : * Function Name: R_RTC_Stop
	;***       86 : * Description  : This function disables the real-time clock.
	;***       87 : * Arguments    : None
	;***       88 : * Return Value : None
	;***       89 : ***********************************************************************************************************************/
	;***       90 : void R_RTC_Stop(void)
	;***       91 : {
	;***       92 :     RTCE = 0U;    /* disable RTC clock operation */
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 92
	clr1 0xFFF9D.7
	ret
_R_RTC_Get_CounterValue:
	.STACK _R_RTC_Get_CounterValue = 4
	;***       93 : }
	;***       94 : 
	;***       95 : /***********************************************************************************************************************
	;***       96 : * Function Name: R_RTC_Get_CounterValue
	;***       97 : * Description  : This function reads the results of real-time clock and store them in the variables.
	;***       98 : * Arguments    : counter_read_val -
	;***       99 : *                    the current real-time clock value(BCD code)
	;***      100 : * Return Value : status -
	;***      101 : *                    MD_OK, MD_BUSY1 or MD_BUSY2
	;***      102 : ***********************************************************************************************************************/
	;***      103 : MD_STATUS R_RTC_Get_CounterValue(rtc_counter_value_t * const counter_read_val)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 103
	movw de, ax
	oneb a
	;***      104 : {
	;***      105 :     MD_STATUS status = MD_OK;
	;***      106 :     uint16_t  w_count;
	;***      107 :     
	;***      108 :     RTCC1 |= _01_RTC_COUNTER_PAUSE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 108
	or a, !0xFF9E
	mov 0xFFF9E, a
	movw ax, #0x0140
.BB@LABEL@4_1:	; bb
	;***      109 : 
	;***      110 :     /* Change the waiting time according to the system */
	;***      111 :     for (w_count = 0U; w_count < RTC_WAITTIME; w_count++)
	;***      112 :     {
	;***      113 :         NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 113
	nop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 111
	addw ax, #0xFFFF
	bnz $.BB@LABEL@4_1
.BB@LABEL@4_2:	; bb13
	;***      114 :     }
	;***      115 : 
	;***      116 :     if (0U == RWST)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 116
	mov a, 0xFFF9E
	bt a.1, $.BB@LABEL@4_4
.BB@LABEL@4_3:	; if_break_bb63
	;***      117 :     {
	;***      118 :         status = MD_BUSY1;
	;***      119 :     }
	;***      120 :     else
	;***      121 :     {
	;***      122 :         counter_read_val->sec = SEC;
	;***      123 :         counter_read_val->min = MIN;
	;***      124 :         counter_read_val->hour = HOUR;
	;***      125 :         counter_read_val->week = WEEK;
	;***      126 :         counter_read_val->day = DAY;
	;***      127 :         counter_read_val->month = MONTH;
	;***      128 :         counter_read_val->year = YEAR;
	;***      129 : 
	;***      130 :         RTCC1 &= (uint8_t)~_01_RTC_COUNTER_PAUSE;
	;***      131 : 
	;***      132 :         /* Change the waiting time according to the system */
	;***      133 :         for (w_count = 0U; w_count < RTC_WAITTIME; w_count++)
	;***      134 :         {
	;***      135 :             NOP();
	;***      136 :         }
	;***      137 : 
	;***      138 :         if (1U == RWST)
	;***      139 :         {
	;***      140 :             status = MD_BUSY2;
	;***      141 :         }
	;***      142 :     }
	;***      143 : 
	;***      144 :     return (status);
	;***      145 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 145
	movw ax, #0x0003
	ret
.BB@LABEL@4_4:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 122
	mov a, 0xFFF92
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 123
	mov a, 0xFFF93
	mov [de+0x01], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 124
	mov a, 0xFFF94
	mov [de+0x02], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 125
	mov a, 0xFFF95
	mov [de+0x04], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 126
	mov a, 0xFFF96
	mov [de+0x03], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 127
	mov a, 0xFFF97
	mov [de+0x05], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 128
	mov a, 0xFFF98
	mov [de+0x06], a
	mov a, #0xFE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 130
	and a, !0xFF9E
	mov 0xFFF9E, a
	movw ax, #0x0140
.BB@LABEL@4_5:	; bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 135
	nop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 133
	addw ax, #0xFFFF
	bnz $.BB@LABEL@4_5
.BB@LABEL@4_6:	; bb54
	mov a, #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 138
	and a, !0xFF9E
	movw bc, #0x0004
	clrw ax
	skz
.BB@LABEL@4_7:	; bb54
	movw ax, bc
.BB@LABEL@4_8:	; bb54
	ret
_R_RTC_Set_CounterValue:
	.STACK _R_RTC_Set_CounterValue = 6
	;***      146 : 
	;***      147 : /***********************************************************************************************************************
	;***      148 : * Function Name: R_RTC_Set_CounterValue
	;***      149 : * Description  : This function changes the real-time clock value.
	;***      150 : * Arguments    : counter_write_val -
	;***      151 : *                    the expected real-time clock value(BCD code)
	;***      152 : * Return Value : status -
	;***      153 : *                    MD_OK, MD_BUSY1 or MD_BUSY2
	;***      154 : ***********************************************************************************************************************/
	;***      155 : MD_STATUS R_RTC_Set_CounterValue(rtc_counter_value_t counter_write_val)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 155
	push hl
	oneb a
	;***      156 : {
	;***      157 :     MD_STATUS status = MD_OK;
	;***      158 :     uint16_t  w_count;
	;***      159 :     
	;***      160 :     RTCC1 |= _01_RTC_COUNTER_PAUSE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 160
	or a, !0xFF9E
	mov 0xFFF9E, a
	movw bc, #0x0140
	movw ax, sp
	addw ax, #0x0006
	movw [sp+0x00], ax
	movw ax, bc
.BB@LABEL@5_1:	; bb
	;***      161 : 
	;***      162 :     /* Change the waiting time according to the system */
	;***      163 :     for (w_count = 0U; w_count < RTC_WAITTIME; w_count++)
	;***      164 :     {
	;***      165 :         NOP();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 165
	nop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 163
	addw ax, #0xFFFF
	bnz $.BB@LABEL@5_1
.BB@LABEL@5_2:	; bb13
	;***      166 :     }
	;***      167 : 
	;***      168 :     if (0U == RWST)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 168
	mov a, 0xFFF9E
	mov1 CY, a.1
	;***      169 :     {
	;***      170 :         status = MD_BUSY1;
	;***      171 :     }
	;***      172 :     else
	;***      173 :     {
	;***      174 :         if (1U == RTCE && 0U == RTCMK)
	;***      175 :         {
	;***      176 :             RTCMK = 1U;   /* disable INTRTC interrupt */
	;***      177 :             SEC = counter_write_val.sec;
	;***      178 :             MIN = counter_write_val.min;
	;***      179 :             HOUR = counter_write_val.hour;
	;***      180 :             WEEK = counter_write_val.week;
	;***      181 :             DAY = counter_write_val.day;
	;***      182 :             MONTH = counter_write_val.month;
	;***      183 :             YEAR = counter_write_val.year;
	;***      184 :             WAFG = 0U;    /* clear matching detection flag */
	;***      185 :             RIFG = 0U;    /* clear constant-period interrupt flag */
	;***      186 :             RTCIF = 0U;   /* clear INTRTC interrupt flag */
	;***      187 :             RTCMK = 0U;   /* enable INTRTC interrupt */
	;***      188 :         }
	;***      189 :         else
	;***      190 :         {
	;***      191 :             SEC = counter_write_val.sec;
	;***      192 :             MIN = counter_write_val.min;
	;***      193 :             HOUR = counter_write_val.hour;
	;***      194 :             WEEK = counter_write_val.week;
	;***      195 :             DAY = counter_write_val.day;
	;***      196 :             MONTH = counter_write_val.month;
	;***      197 :             YEAR = counter_write_val.year;
	;***      198 :         }
	;***      199 :         
	;***      200 :         RTCC1 &= (uint8_t)~_01_RTC_COUNTER_PAUSE;
	;***      201 : 
	;***      202 :         /* Change the waiting time according to the system */
	;***      203 :         for (w_count = 0U; w_count < RTC_WAITTIME; w_count++)
	;***      204 :         {
	;***      205 :             NOP();
	;***      206 :         }
	;***      207 : 
	;***      208 :         if (1U == RWST)
	;***      209 :         {
	;***      210 :             status = MD_BUSY2;
	;***      211 :         }
	;***      212 :     }
	;***      213 : 
	;***      214 :     return (status);
	;***      215 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 215
	movw ax, #0x0003
	.bnc $!.BB@LABEL@5_11
.BB@LABEL@5_3:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 174
	mov a, 0xFFF9D
	bf a.7, $.BB@LABEL@5_6
.BB@LABEL@5_4:	; bb26
	mov a, 0xFFFE7
	bt a.1, $.BB@LABEL@5_6
.BB@LABEL@5_5:	; if_then_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 176
	set1 0xFFFE7.1
	pop de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 179
	movw ax, de
	incw ax
	movw hl, ax
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 177
	mov a, [de]
	mov 0xFFF92, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 178
	mov a, [hl]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 179
	incw hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 178
	mov 0xFFF93, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 179
	mov a, [hl]
	mov 0xFFF94, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 180
	movw ax, de
	addw ax, #0x0004
	movw hl, ax
	mov a, [hl]
	mov 0xFFF95, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 181
	movw ax, de
	addw ax, #0x0003
	movw hl, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 182
	movw ax, de
	addw ax, #0x0005
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 181
	mov a, [hl]
	mov 0xFFF96, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 182
	mov a, [de]
	mov 0xFFF97, a
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 183
	addw ax, #0x0006
	movw de, ax
	movw hl, #0xFF9E
	mov a, [de]
	mov 0xFFF98, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 184
	clr1 [hl].4
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 185
	clr1 [hl].3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 186
	clr1 0xFFFE3.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 187
	clr1 0xFFFE7.1
	br $.BB@LABEL@5_7
.BB@LABEL@5_6:	; if_else_bb55
	pop de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 193
	movw ax, de
	incw ax
	movw hl, ax
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 191
	mov a, [de]
	mov 0xFFF92, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 192
	mov a, [hl]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 193
	incw hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 192
	mov 0xFFF93, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 193
	mov a, [hl]
	mov 0xFFF94, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 194
	movw ax, de
	addw ax, #0x0004
	movw hl, ax
	mov a, [hl]
	mov 0xFFF95, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 195
	movw ax, de
	addw ax, #0x0003
	movw hl, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 196
	movw ax, de
	addw ax, #0x0005
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 195
	mov a, [hl]
	mov 0xFFF96, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 196
	mov a, [de]
	mov 0xFFF97, a
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 197
	addw ax, #0x0006
	movw de, ax
	mov a, [de]
	mov 0xFFF98, a
.BB@LABEL@5_7:	; if_break_bb
	mov a, #0xFE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 200
	and a, !0xFF9E
	mov 0xFFF9E, a
	movw ax, #0x0140
.BB@LABEL@5_8:	; bb74
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 205
	nop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 203
	addw ax, #0xFFFF
	bnz $.BB@LABEL@5_8
.BB@LABEL@5_9:	; bb82
	mov a, #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 208
	and a, !0xFF9E
	movw bc, #0x0004
	clrw ax
	skz
.BB@LABEL@5_10:	; bb82
	movw ax, bc
.BB@LABEL@5_11:	; bb82
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_cg_rtc.c", 215
	ret
	;***      216 : 
	;***      217 : /* Start user code for adding. Do not edit comment generated here */
	;***      218 : /* End user code. Do not edit comment generated here */
