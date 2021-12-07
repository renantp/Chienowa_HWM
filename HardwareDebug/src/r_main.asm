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
#@   -o src/r_main.obj
#@   ../src/r_main.c
#@  compiled at Tue Dec 07 17:32:41 2021

	.EXTERN _g_rtc
	.EXTERN _g_timerSetting
	.EXTERN _g_csi_rev_end
	.EXTERN _g_uart2_fault
	.EXTERN _g_uart2_sendend
	.EXTERN _g_uart3_sendend
	.EXTERN _g_rx_data
	.EXTERN _g_color
	.EXTERN _g_pre_color
	.EXTERN _send_response_flag
	.EXTERN _send_response_time_flag
	.PUBLIC _g_error
	.PUBLIC _g_adc_ch
	.PUBLIC _g_e_status
	.PUBLIC _led_st
	.PUBLIC _flow_p
	.PUBLIC _salt_h_p
	.PUBLIC _e_send
	.PUBLIC _e_data
	.PUBLIC _g_eeprom_wren
	.PUBLIC _send_data
	.PUBLIC _receive_data
	.PUBLIC _receive_setting
	.PUBLIC _set
	.PUBLIC _rx_data
	.PUBLIC _data_f
	.PUBLIC _data_f_test
	.PUBLIC _g_control_buffer
	.PUBLIC _this_size
	.PUBLIC _rec_buf
	.PUBLIC _send_buf
	.PUBLIC _g_crc
	.PUBLIC _g_crc_32
	.PUBLIC _data_crc
	.PUBLIC _readHS
	.EXTERN _delay_ms
	.PUBLIC _main
	.PUBLIC _R_MAIN_UserInit
	.EXTERN _EEPROM_Init
	.EXTERN _setting_default
	.EXTERN _R_RTC_Set_CounterValue
	.EXTERN _R_RTC_Start
	.EXTERN _R_UART2_Receive
	.EXTERN _R_UART3_Receive
	.EXTERN _R_UART2_Send
	.EXTERN _R_WDT_Restart
	.EXTERN _crc8_1
	.EXTERN _ns_delay_ms
	.EXTERN _R_UART2_Stop
	.EXTERN _R_UART2_Start
	.EXTERN _crc8_4
	.EXTERN _R_UART3_Send
	.EXTERN _handSensorLED
	.EXTERN _R_TAU0_Create
	.EXTERN _R_SAU0_Create
	.EXTERN _R_SAU1_Create
	.EXTERN _R_UART1_Create
	.EXTERN _R_UART2_Create
	.EXTERN _R_UART3_Create
	.EXTERN _R_RTC_Create
	.EXTERN _R_PORT_Create_UserInit
	.EXTERN _R_CSI01_Create
	.EXTERN _R_CSI00_Create
	.EXTERN _R_TAU0_Channel0_Start
	.EXTERN _R_UART3_Start
	.EXTERN _R_UART1_Start
	.EXTERN _R_CSI00_Start
	.EXTERN _R_ADC_Create
	.EXTERN _R_ADC_Set_OperationOn
	.EXTERN _R_ADC_Start

	.SECTION .textf,TEXTF
_readHS:
	.STACK _readHS = 4
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
	;***       21 : * File Name    : r_main.c
	;***       22 : * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 : * Device(s)    : R5F104ML
	;***       24 : * Tool-Chain   : CCRL
	;***       25 : * Description  : This file implements main function.
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
	;***       42 : #include "EEPROM.h"
	;***       43 : #include "usr_timer.h"
	;***       44 : #include "usr_setting_sheet.h"
	;***       45 : #include "crc8.h"
	;***       46 : /* End user code. Do not edit comment generated here */
	;***       47 : #include "r_cg_userdefine.h"
	;***       48 : 
	;***       49 : /***********************************************************************************************************************
	;***       50 : Pragma directive
	;***       51 : ***********************************************************************************************************************/
	;***       52 : /* Start user code for pragma. Do not edit comment generated here */
	;***       53 : /* End user code. Do not edit comment generated here */
	;***       54 : 
	;***       55 : /***********************************************************************************************************************
	;***       56 : Global variables and functions
	;***       57 : ***********************************************************************************************************************/
	;***       58 : /* Start user code for global. Do not edit comment generated here */
	;***       59 : volatile int g_error = 0;
	;***       60 : volatile int g_adc_ch = 0;
	;***       61 : union EEPROM_status_u g_e_status;
	;***       62 : uint8_t led_st = 0xff;
	;***       63 : uint8_t flow_p, salt_h_p;
	;***       64 : uint8_t e_send[12] = {EEPROM_RDSR, 0b10100101, EEPROM_WRSR, 0x00, EEPROM_WRSR, 0x02, EEPROM_WREN, EEPROM_WRDI};
	;***       65 : uint8_t e_data[12] = {0,0};
	;***       66 : uint8_t g_eeprom_wren;
	;***       67 : uint8_t send_data[2] = { 0x23, 0xab};
	;***       68 : uint8_t receive_data[2];
	;***       69 : struct Number_Setting_s receive_setting;
	;***       70 : union EEPROM_status_u set;
	;***       71 : uint32_t rx_data[3];
	;***       72 : float data_f;
	;***       73 : union byte_to_float data_f_test;
	;***       74 : struct UART_Buffer_s g_control_buffer;
	;***       75 : #define DETECT I_HS_ODA_PIN
	;***       76 : uint8_t readHS(void){
	;***       77 :    if(DETECT){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 77
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_2
.BB@LABEL@1_1:	; bb18
	;***       78 : 	  delay_ms(2);
	;***       79 :       if(DETECT) return 1;return 0;
	;***       80 :    }else return 0;
	;***       81 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 81
	clrb a
	ret
.BB@LABEL@1_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 78
	clrw bc
	onew ax
	incw ax
	call !!_delay_ms
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 79
	mov a, 0xFFF07
	shr a, 0x05
	and a, #0x01
	ret
_main:
	.STACK _main = 14
	;***       82 : uint8_t this_size;
	;***       83 : uint8_t rec_buf[12];
	;***       84 : uint8_t send_buf[7] = {8,1,2,3,4,5,6};
	;***       85 : char g_crc[8];
	;***       86 : uint32_t g_crc_32[8];
	;***       87 : uint32_t data_crc[2] = {30500, 60200};
	;***       88 : /* End user code. Do not edit comment generated here */
	;***       89 : void R_MAIN_UserInit(void);
	;***       90 : 
	;***       91 : /***********************************************************************************************************************
	;***       92 : * Function Name: main
	;***       93 : * Description  : This function implements main function.
	;***       94 : * Arguments    : None
	;***       95 : * Return Value : None
	;***       96 : ***********************************************************************************************************************/
	;***       97 : void main(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 97
	push hl
	;***       98 : {
	;***       99 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 99
	call $!_R_MAIN_UserInit
	;***      100 :     /* Start user code. Do not edit comment generated here */
	;***      101 :     EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 101
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	;***      102 : //    O_RS485_MODE_PIN = 1U;
	;***      103 : //    EEPROM_SPI_WriteBuffer(e_send, 0x000f, 4);
	;***      104 : //    delay_ms(1000);
	;***      105 : //    EEPROM_SPI_ReadBuffer(e_data, 0x000f, 3);
	;***      106 : //    R_UART0_Send("Hello \r\n", sizeof("Hello \r\n") - 1);
	;***      107 : //    csi01_status = STATUS_COMPLETE;
	;***      108 :     //Power ON
	;***      109 :     setting_default();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 109
	call !!_setting_default
	;***      110 :     g_rtc.hour = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 110
	mov !LOWW(_g_rtc+0x00002), #0x0A
	;***      111 :     g_rtc.sec = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 111
	mov !LOWW(_g_rtc), #0x02
	;***      112 :     R_RTC_Set_CounterValue(g_rtc);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 112
	subw sp, #0x08
	movw ax, sp
	movw de, #0x0007
	movw bc, #LOWW(_g_rtc)
	call !!_memcpy
	call !!_R_RTC_Set_CounterValue
	addw sp, #0x08
	;***      113 :     R_RTC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 113
	call !!_R_RTC_Start
	;***      114 :     R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 114
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      115 : 
	;***      116 : //    Test nhan
	;***      117 :     O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 117
	clr1 0xFFF00.0
	;***      118 :     R_UART3_Receive(rec_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 118
	movw bc, #0x0007
	movw ax, #LOWW(_rec_buf)
	call !!_R_UART3_Receive
	;***      119 : 
	;***      120 : //    Test gui
	;***      121 : //    O_RS485_MODE_PIN = 1U;
	;***      122 : //    delay_ms(10);
	;***      123 : //    R_UART3_Send(send_buf, 7);
	;***      124 : //    EEPROM_PROTECT_EN();
	;***      125 : 
	;***      126 :     g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 126
	clrb !LOWW(_g_color)
	;***      127 :     g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 127
	mov !LOWW(_g_pre_color), #0x03
	;***      128 : 
	;***      129 :     this_size = sizeof(struct Timer_Setting_s);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 129
	mov !LOWW(_this_size), #0x46
.BB@LABEL@2_1:	; bb187
	;***      130 :     while (1U)
	;***      131 :     {
	;***      132 :     	if(send_response_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 132
	cmp0 !LOWW(_send_response_flag)
	bz $.BB@LABEL@2_6
.BB@LABEL@2_2:	; if_then_bb
	;***      133 :     		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 133
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      134 :     		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 134
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@2_3:	; bb16
	mov a, [sp+0x00]
	;***      135 :     		while(state == g_uart2_sendend){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 135
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@2_5
.BB@LABEL@2_4:	; bb15
	;***      136 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 136
	call !!_R_WDT_Restart
	br $.BB@LABEL@2_3
.BB@LABEL@2_5:	; bb24
	;***      137 : 			}
	;***      138 :     		send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 138
	clrb !LOWW(_send_response_flag)
.BB@LABEL@2_6:	; if_break_bb
	;***      139 :     	}
	;***      140 :     	if(send_response_time_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 140
	cmp0 !LOWW(_send_response_time_flag)
	bz $.BB@LABEL@2_11
.BB@LABEL@2_7:	; if_then_bb30
	;***      141 : 			uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 141
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      142 : 			g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 142
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00044), a
	;***      143 : 			R_UART2_Send((uint8_t *)&g_timerSetting, 69);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	movw bc, #0x0045
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@2_8:	; bb35
	mov a, [sp+0x00]
	;***      144 : 			while(state == g_uart2_sendend){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 144
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@2_10
.BB@LABEL@2_9:	; bb34
	;***      145 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	call !!_R_WDT_Restart
	br $.BB@LABEL@2_8
.BB@LABEL@2_10:	; bb43
	;***      146 : 			}
	;***      147 : 			send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	clrb !LOWW(_send_response_time_flag)
.BB@LABEL@2_11:	; if_break_bb44
	;***      148 :     	}
	;***      149 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      150 :     	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 150
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_13
.BB@LABEL@2_12:	; if_then_bb49
	;***      151 :     		P6_bit.no3 = ~P6_bit.no3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 151
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
.BB@LABEL@2_13:	; if_break_bb60
	;***      152 : //    		R_UART3_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      153 : //    		R_UART1_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      154 : //    		g_e_status.raw = rEE_Status();
	;***      155 :     	}
	;***      156 :     	// Check
	;***      157 :     	if(g_uart2_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 157
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@2_15
.BB@LABEL@2_14:	; if_then_bb66
	;***      158 :     		R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 158
	call !!_R_UART2_Stop
	;***      159 :     		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 159
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      160 :     		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 160
	call !!_R_UART2_Start
	;***      161 :     		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 161
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@2_15:	; if_break_bb67
	;***      162 :     	}
	;***      163 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 163
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@2_16:	; bb75
	clrb a
.BB@LABEL@2_17:	; bb76
	mov !LOWW(_flow_p), a
	;***      164 :     	if(ns_delay_ms(&g_Tick.tickCustom[1], 60000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 164
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_29
.BB@LABEL@2_18:	; if_then_bb84
	;***      165 :     		if(O_SUPPLY_WATER_PIN == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 165
	mov a, 0xFFF01
	mov1 CY, a.7
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@2_22
.BB@LABEL@2_19:	; if_else_bb
	;***      166 : 				g_TickKeeper.SV1_ON_minutes++;
	;***      167 : 				g_TickKeeper.SV1_OFF_minutes = 0;
	;***      168 : 			}else{
	;***      169 : 				g_TickKeeper.SV1_OFF_minutes++;
	;***      170 : 				g_TickKeeper.SV1_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 170
	movw !LOWW(_g_TickKeeper@2+0x00002), ax
	movw !LOWW(_g_TickKeeper@2), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 169
	addw ax, !LOWW(_g_TickKeeper@2+0x00004)
	movw !LOWW(_g_TickKeeper@2+0x00004), ax
	movw ax, bc
	sknc
.BB@LABEL@2_20:	; if_else_bb
	incw ax
.BB@LABEL@2_21:	; if_else_bb
	addw ax, !LOWW(_g_TickKeeper@2+0x00006)
	movw !LOWW(_g_TickKeeper@2+0x00006), ax
	br $.BB@LABEL@2_25
.BB@LABEL@2_22:	; if_then_bb91
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 167
	movw !LOWW(_g_TickKeeper@2+0x00006), ax
	movw !LOWW(_g_TickKeeper@2+0x00004), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 166
	addw ax, !LOWW(_g_TickKeeper@2)
	movw !LOWW(_g_TickKeeper@2), ax
	movw ax, bc
	sknc
.BB@LABEL@2_23:	; if_then_bb91
	incw ax
.BB@LABEL@2_24:	; if_then_bb91
	addw ax, !LOWW(_g_TickKeeper@2+0x00002)
	movw !LOWW(_g_TickKeeper@2+0x00002), ax
.BB@LABEL@2_25:	; if_break_bb96
	;***      171 : 			}
	;***      172 : 			if(O_SPOUT_WATER_PIN == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 172
	mov a, 0xFFF05
	mov1 CY, a.5
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@2_30
.BB@LABEL@2_26:	; if_else_bb107
	;***      173 : 				g_TickKeeper.SV2_ON_minutes++;
	;***      174 : 				g_TickKeeper.SV2_OFF_minutes = 0;
	;***      175 : 			}else{
	;***      176 : 				g_TickKeeper.SV2_OFF_minutes++;
	;***      177 : 				g_TickKeeper.SV2_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 177
	movw !LOWW(_g_TickKeeper@2+0x0000A), ax
	movw !LOWW(_g_TickKeeper@2+0x00008), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 176
	addw ax, !LOWW(_g_TickKeeper@2+0x0000C)
	movw !LOWW(_g_TickKeeper@2+0x0000C), ax
	movw ax, bc
	sknc
.BB@LABEL@2_27:	; if_else_bb107
	incw ax
.BB@LABEL@2_28:	; if_else_bb107
	addw ax, !LOWW(_g_TickKeeper@2+0x0000E)
	movw !LOWW(_g_TickKeeper@2+0x0000E), ax
.BB@LABEL@2_29:	; if_else_bb107
	br $.BB@LABEL@2_33
.BB@LABEL@2_30:	; if_then_bb104
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 174
	movw !LOWW(_g_TickKeeper@2+0x0000E), ax
	movw !LOWW(_g_TickKeeper@2+0x0000C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 173
	addw ax, !LOWW(_g_TickKeeper@2+0x00008)
	movw !LOWW(_g_TickKeeper@2+0x00008), ax
	movw ax, bc
	sknc
.BB@LABEL@2_31:	; if_then_bb104
	incw ax
.BB@LABEL@2_32:	; if_then_bb104
	addw ax, !LOWW(_g_TickKeeper@2+0x0000A)
	movw !LOWW(_g_TickKeeper@2+0x0000A), ax
.BB@LABEL@2_33:	; if_break_bb111
	;***      178 : 			}
	;***      179 :     	}
	;***      180 :     	if(ns_delay_ms(&g_Tick.tick1s, 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 180
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick@1)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_37
.BB@LABEL@2_34:	; if_then_bb116
	;***      181 : 
	;***      182 : //    		send_buf[1]++;
	;***      183 : //    		R_UART3_Send(send_buf, 7);
	;***      184 : //    		R_UART3_Receive(rec_buf, 7);
	;***      185 :     		O_CTRL_OUT_PIN = led_st&0x01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 185
	mov a, !LOWW(_led_st)
	mov x, a
	mov1 CY, a.0
	mov a, 0xFFF03
	mov1 a.1, CY
	mov 0xFFF03, a
	;***      186 :     		O_SPOUT_WATER_PIN = led_st&0x01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 186
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	;***      187 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 187
	cmp0 x
	mov a, #0xFF
	skz
.BB@LABEL@2_35:	; bb140
	clrb a
.BB@LABEL@2_36:	; bb142
	mov !LOWW(_led_st), a
	;***      188 :     	    uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 188
	mov a, !LOWW(_g_uart2_sendend)
	clrw ax
	;***      189 : //    	    g_timerSetting.t2_flowSensorStartTime = 0x24770000;
	;***      190 :     	    g_timerSetting.t2_flowSensorStartTime = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***      191 :     	    g_timerSetting.t3_flowSensorMonitorTime = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 191
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***      192 :     	    g_timerSetting.t6_drainageOffTime = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 192
	movw !LOWW(_g_timerSetting+0x0000A), ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	movw !LOWW(_g_timerSetting), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 191
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 192
	movw !LOWW(_g_timerSetting+0x00008), ax
	;***      193 : //			g_timerSetting.t51++;
	;***      194 :     	    g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 194
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00044), a
	;***      195 : //    	    g_crc[0] = crc_8((unsigned char *)&g_timerSetting, 4);
	;***      196 : //    	    g_crc[1] = Fast_CRC_Cal8Bits(0x00, 4, (unsigned char *)&g_timerSetting);
	;***      197 : //    	    g_crc[2] = Quick_CRC_Cal8Bits(0x00, 4, (unsigned char *)&g_timerSetting);
	;***      198 : //    	    g_crc[3] = crc8x_simple(0x00, (unsigned char *)&g_timerSetting, 4);
	;***      199 : //    	    g_crc[4] = crc8x_fast(0x00, (unsigned char *)&g_timerSetting, 4);
	;***      200 : //    	    g_crc[5] = getCRC((unsigned char *)&g_timerSetting, 4);
	;***      201 :     	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 201
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      202 :     	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 202
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
.BB@LABEL@2_37:	; if_break_bb158
	;***      203 : //    	    g_crc_32 = CRC32_function((uint8_t *)&g_timerSetting, 8);
	;***      204 : //    	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s));
	;***      205 : //    	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 1);
	;***      206 : //    	    sendToRasPi(H_ALARM, CURRENT_ABNORMAL, 32);
	;***      207 : //    	    while(state == g_uart2_sendend){
	;***      208 : //				R_WDT_Restart();
	;***      209 : //			}
	;***      210 : 
	;***      211 :     		if(led_st == 0x00){
	;***      212 : 
	;***      213 : //    			O_HS_ICL_PIN = 0;
	;***      214 : //    			O_HS_IDA_PIN = 1;
	;***      215 : //    			handSensorLED(RED);
	;***      216 : //    			O_CVCC_ALARM_RS = 1;
	;***      217 : //    			O_PUMP_SALT_PIN = ON;
	;***      218 : //    			electrolyticOperationON();
	;***      219 : 
	;***      220 :     		}else{
	;***      221 : //    			O_HS_ICL_PIN = 1;
	;***      222 : //				O_HS_IDA_PIN = 0;
	;***      223 : //    			handSensorLED(WHITE);
	;***      224 : //    			O_CVCC_ALARM_RS = 0;
	;***      225 : //    			O_PUMP_SALT_PIN = OFF;
	;***      226 : //    			electrolyticOperationOFF();
	;***      227 :     		}
	;***      228 :     	}
	;***      229 : //--------------------------------End testing code---------------------------------------------------------
	;***      230 : //    	main_20211111();
	;***      231 : 
	;***      232 :     	switch (readHS()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 232
	call $!_readHS
	cmp0 a
	bz $.BB@LABEL@2_40
.BB@LABEL@2_38:	; if_break_bb158
	dec a
	bnz $.BB@LABEL@2_41
.BB@LABEL@2_39:	; switch_clause_bb161
	;***      233 : 			case 0:
	;***      234 : 				g_color = WHITE;
	;***      235 : 				break;
	;***      236 : 			case 1:
	;***      237 : 				g_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 237
	mov !LOWW(_g_color), #0x03
	br $.BB@LABEL@2_41
.BB@LABEL@2_40:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 234
	mov !LOWW(_g_color), #0x02
.BB@LABEL@2_41:	; switch_break_bb
	;***      238 : 				break;
	;***      239 : 			default:
	;***      240 : 
	;***      241 : 				break;
	;***      242 : 		}
	;***      243 :     	if(g_color != g_pre_color){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 243
	mov a, !LOWW(_g_color)
	cmp a, !LOWW(_g_pre_color)
	bz $.BB@LABEL@2_45
.BB@LABEL@2_42:	; if_then_bb170
	;***      244 : 			O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 244
	set1 0xFFF00.0
	;***      245 : 			uint8_t _uart3 = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 245
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	;***      246 : 			send_buf[3]++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 246
	inc !LOWW(_send_buf+0x00003)
	;***      247 : 			R_UART3_Send(send_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 247
	movw bc, #0x0007
	movw ax, #LOWW(_send_buf)
	call !!_R_UART3_Send
.BB@LABEL@2_43:	; bb176
	mov a, [sp+0x00]
	;***      248 : 			while(_uart3 == g_uart3_sendend);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 248
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@2_43
.BB@LABEL@2_44:	; bb184
	;***      249 : 			O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 249
	clr1 0xFFF00.0
.BB@LABEL@2_45:	; if_break_bb185
	;***      250 :     	}
	;***      251 :     	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 251
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      252 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 252
	call !!_R_WDT_Restart
	br $!.BB@LABEL@2_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      253 :     }
	;***      254 :     /* End user code. Do not edit comment generated here */
	;***      255 : }
	;***      256 : 
	;***      257 : /***********************************************************************************************************************
	;***      258 : * Function Name: R_MAIN_UserInit
	;***      259 : * Description  : This function adds user code before implementing main function.
	;***      260 : * Arguments    : None
	;***      261 : * Return Value : None
	;***      262 : ***********************************************************************************************************************/
	;***      263 : void R_MAIN_UserInit(void)
	;***      264 : {
	;***      265 :     /* Start user code. Do not edit comment generated here */
	;***      266 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 266
	ei
	;***      267 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 267
	call !!_R_TAU0_Create
	;***      268 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 268
	call !!_R_SAU0_Create
	;***      269 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 269
	call !!_R_SAU1_Create
	;***      270 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 270
	call !!_R_UART1_Create
	;***      271 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 271
	call !!_R_UART2_Create
	;***      272 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 272
	call !!_R_UART3_Create
	;***      273 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 273
	call !!_R_RTC_Create
	;***      274 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 274
	call !!_R_PORT_Create_UserInit
	;***      275 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 275
	call !!_R_CSI01_Create
	;***      276 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 276
	call !!_R_CSI00_Create
	;***      277 : 
	;***      278 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 278
	call !!_R_TAU0_Channel0_Start
	;***      279 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 279
	call !!_R_UART3_Start
	;***      280 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 280
	call !!_R_UART1_Start
	;***      281 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 281
	call !!_R_UART2_Start
	;***      282 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 282
	call !!_R_CSI00_Start
	;***      283 : //    R_CSI01_Start();
	;***      284 : 
	;***      285 : 
	;***      286 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 286
	call !!_R_ADC_Create
	;***      287 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 287
	call !!_R_ADC_Set_OperationOn
	;***      288 : //    R_ADC_Set_ADChannel(ADCHANNEL0);
	;***      289 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 289
	br !!_R_ADC_Start
	;***      290 :     /* End user code. Do not edit comment generated here */
	;***      291 : }
	;***      292 : 
	;***      293 : /* Start user code for adding. Do not edit comment generated here */
	;***      294 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
	.ALIGN 2
_g_Tick@1:
	.DS (48)
	.ALIGN 2
_g_TickKeeper@2:
	.DS (16)
_g_e_status:
	.DS (1)
_flow_p:
	.DS (1)
_salt_h_p:
	.DS (1)
_g_eeprom_wren:
	.DS (1)
_receive_data:
	.DS (2)
	.ALIGN 2
_receive_setting:
	.DS (34)
_set:
	.DS (1)
	.ALIGN 2
_rx_data:
	.DS (12)
	.ALIGN 2
_data_f:
	.DS (4)
	.ALIGN 2
_data_f_test:
	.DS (4)
	.ALIGN 2
_g_control_buffer:
	.DS (6)
_this_size:
	.DS (1)
_rec_buf:
	.DS (12)
_g_crc:
	.DS (8)
	.ALIGN 2
_g_crc_32:
	.DS (32)
	.SECTION .data,DATA
	.ALIGN 2
_g_error:
	.DS (2)
	.ALIGN 2
_g_adc_ch:
	.DS (2)
_led_st:
	.DB 0xFF
_e_send:
	.DB 0x05,0xA5,0x01
	.DS (1)
	.DB 0x01,0x02,0x06,0x04
	.DS (4)
_e_data:
	.DS (12)
_send_data:
	.DB 0x23,0xAB
_send_buf:
	.DB 0x08,0x01,0x02,0x03,0x04,0x05,0x06
	.ALIGN 2
_data_crc:
	.DB4 0x00007724,0x0000EB28
