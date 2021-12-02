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
#@  compiled at Thu Dec 02 17:39:06 2021

	.EXTERN _g_rtc
	.EXTERN _g_timerSetting
	.EXTERN _g_uart3_sendend
	.EXTERN _g_csi_rev_end
	.EXTERN _g_uart2_send
	.EXTERN _g_uart2_fault
	.EXTERN _g_rx_data
	.EXTERN _g_color
	.EXTERN _g_pre_color
	.PUBLIC _g_error
	.PUBLIC _g_adc_ch
	.PUBLIC __stamp
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
	.PUBLIC _read_signal
	.EXTERN _delay_ms
	.PUBLIC _main
	.PUBLIC _R_MAIN_UserInit
	.EXTERN _EEPROM_Init
	.EXTERN _setting_default
	.EXTERN _R_RTC_Set_CounterValue
	.EXTERN _R_RTC_Start
	.EXTERN _R_UART2_Receive
	.EXTERN _R_UART3_Receive
	.EXTERN _ns_delay_ms
	.EXTERN _R_UART2_Stop
	.EXTERN _R_UART2_Start
	.EXTERN _CRC8
	.EXTERN _R_UART2_Send
	.EXTERN _R_WDT_Restart
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
_read_signal:
	.STACK _read_signal = 4
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
	;***       45 : /* End user code. Do not edit comment generated here */
	;***       46 : #include "r_cg_userdefine.h"
	;***       47 : 
	;***       48 : /***********************************************************************************************************************
	;***       49 : Pragma directive
	;***       50 : ***********************************************************************************************************************/
	;***       51 : /* Start user code for pragma. Do not edit comment generated here */
	;***       52 : /* End user code. Do not edit comment generated here */
	;***       53 : 
	;***       54 : /***********************************************************************************************************************
	;***       55 : Global variables and functions
	;***       56 : ***********************************************************************************************************************/
	;***       57 : /* Start user code for global. Do not edit comment generated here */
	;***       58 : volatile int g_error = 0;
	;***       59 : volatile int g_adc_ch = 0;
	;***       60 : uint32_t _stamp[3];
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
	;***       76 : uint8_t read_signal(void){
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
	;***       85 : /* End user code. Do not edit comment generated here */
	;***       86 : void R_MAIN_UserInit(void);
	;***       87 : 
	;***       88 : /***********************************************************************************************************************
	;***       89 : * Function Name: main
	;***       90 : * Description  : This function implements main function.
	;***       91 : * Arguments    : None
	;***       92 : * Return Value : None
	;***       93 : ***********************************************************************************************************************/
	;***       94 : void main(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 94
	push hl
	;***       95 : {
	;***       96 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 96
	call $!_R_MAIN_UserInit
	;***       97 :     /* Start user code. Do not edit comment generated here */
	;***       98 :     EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 98
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	;***       99 : //    O_RS485_MODE_PIN = 1U;
	;***      100 : //    EEPROM_SPI_WriteBuffer(e_send, 0x000f, 4);
	;***      101 : //    delay_ms(1000);
	;***      102 : //    EEPROM_SPI_ReadBuffer(e_data, 0x000f, 3);
	;***      103 : //    R_UART0_Send("Hello \r\n", sizeof("Hello \r\n") - 1);
	;***      104 : //    csi01_status = STATUS_COMPLETE;
	;***      105 :     //Power ON
	;***      106 :     setting_default();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 106
	call !!_setting_default
	;***      107 :     g_rtc.hour = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 107
	mov !LOWW(_g_rtc+0x00002), #0x0A
	;***      108 :     g_rtc.sec = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 108
	mov !LOWW(_g_rtc), #0x02
	;***      109 :     R_RTC_Set_CounterValue(g_rtc);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 109
	subw sp, #0x08
	movw ax, sp
	movw de, #0x0007
	movw bc, #LOWW(_g_rtc)
	call !!_memcpy
	call !!_R_RTC_Set_CounterValue
	addw sp, #0x08
	;***      110 :     R_RTC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 110
	call !!_R_RTC_Start
	;***      111 :     R_UART2_Receive(g_rx_data, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 111
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      112 : 
	;***      113 : //    Test nhan
	;***      114 :     O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 114
	clr1 0xFFF00.0
	;***      115 :     R_UART3_Receive(rec_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 115
	movw bc, #0x0007
	movw ax, #LOWW(_rec_buf)
	call !!_R_UART3_Receive
	;***      116 : 
	;***      117 : //    Test gui
	;***      118 : //    O_RS485_MODE_PIN = 1U;
	;***      119 : //    delay_ms(10);
	;***      120 : //    R_UART3_Send(send_buf, 7);
	;***      121 : //    EEPROM_PROTECT_EN();
	;***      122 : 
	;***      123 :     g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 123
	clrb !LOWW(_g_color)
	;***      124 :     g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 124
	mov !LOWW(_g_pre_color), #0x03
	;***      125 : 
	;***      126 :     this_size = sizeof(struct UART_Buffer_s);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 126
	mov !LOWW(_this_size), #0x06
.BB@LABEL@2_1:	; bb122
	;***      127 :     while (1U)
	;***      128 :     {
	;***      129 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      130 :     	if(ns_delay_ms(&_stamp[0], 200)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 130
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(__stamp)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_3
.BB@LABEL@2_2:	; if_then_bb
	;***      131 :     		P6_bit.no3 = ~P6_bit.no3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 131
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
.BB@LABEL@2_3:	; if_break_bb
	;***      132 : //    		R_UART3_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      133 : //    		R_UART1_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      134 : //    		g_e_status.raw = rEE_Status();
	;***      135 :     	}
	;***      136 :     	if(g_uart2_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 136
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@2_5
.BB@LABEL@2_4:	; if_then_bb23
	;***      137 :     		R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 137
	call !!_R_UART2_Stop
	;***      138 :     		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 138
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      139 :     		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 139
	call !!_R_UART2_Start
	;***      140 :     		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 140
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@2_5:	; if_break_bb24
	;***      141 :     	}
	;***      142 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 142
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@2_6:	; bb32
	clrb a
.BB@LABEL@2_7:	; bb33
	mov !LOWW(_flow_p), a
	;***      143 :     	if(ns_delay_ms(&_stamp[1], 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(__stamp+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_15
.BB@LABEL@2_8:	; if_then_bb41
	;***      144 : //    		send_buf[1]++;
	;***      145 : //    		R_UART3_Send(send_buf, 7);
	;***      146 : //    		R_UART3_Receive(rec_buf, 7);
	;***      147 :     		O_CTRL_OUT_PIN = led_st&0x01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	mov a, !LOWW(_led_st)
	mov x, a
	mov1 CY, a.0
	mov a, 0xFFF03
	mov1 a.1, CY
	mov 0xFFF03, a
	;***      148 :     		O_SPOUT_WATER_PIN = led_st&0x01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 148
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	;***      149 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 149
	cmp0 x
	mov a, #0xFF
	skz
.BB@LABEL@2_9:	; bb65
	clrb a
.BB@LABEL@2_10:	; bb67
	mov !LOWW(_led_st), a
	;***      150 :     	    uint8_t state = g_uart2_send;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 150
	mov a, !LOWW(_g_uart2_send)
	mov [sp+0x00], a
	onew ax
	;***      151 :     	    g_timerSetting.t6_drainageOffTime++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 151
	addw ax, !LOWW(_g_timerSetting+0x00008)
	movw !LOWW(_g_timerSetting+0x00008), ax
	clrw ax
	sknc
.BB@LABEL@2_11:	; bb67
	incw ax
.BB@LABEL@2_12:	; bb67
	addw ax, !LOWW(_g_timerSetting+0x0000A)
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***      152 :     	    g_timerSetting.crc = CRC8((char *)&g_timerSetting, sizeof(g_timerSetting)-2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 152
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_CRC8
	mov !LOWW(_g_timerSetting+0x00044), a
	;***      153 : //    	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s));
	;***      154 :     	    R_UART2_Send((uint8_t *)&g_timerSetting, 36);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 154
	movw bc, #0x0024
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@2_13:	; bb77
	mov a, [sp+0x00]
	;***      155 : //    	    sendToRasPi(H_ALARM, CURRENT_ABNORMAL, 32);
	;***      156 :     	    while(state == g_uart2_send){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 156
	cmp a, !LOWW(_g_uart2_send)
	bnz $.BB@LABEL@2_15
.BB@LABEL@2_14:	; bb76
	;***      157 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 157
	call !!_R_WDT_Restart
	br $.BB@LABEL@2_13
.BB@LABEL@2_15:	; if_break_bb93
	;***      158 : 			}
	;***      159 : 
	;***      160 :     		if(led_st == 0x00){
	;***      161 : //    			O_HS_ICL_PIN = 0;
	;***      162 : //    			O_HS_IDA_PIN = 1;
	;***      163 : //    			handSensorLED(RED);
	;***      164 : //    			O_CVCC_ALARM_RS = 1;
	;***      165 : //    			O_PUMP_SALT_PIN = ON;
	;***      166 : //    			electrolyticOperationON();
	;***      167 : 
	;***      168 :     		}else{
	;***      169 : //    			O_HS_ICL_PIN = 1;
	;***      170 : //				O_HS_IDA_PIN = 0;
	;***      171 : //    			handSensorLED(WHITE);
	;***      172 : //    			O_CVCC_ALARM_RS = 0;
	;***      173 : //    			O_PUMP_SALT_PIN = OFF;
	;***      174 : //    			electrolyticOperationOFF();
	;***      175 :     		}
	;***      176 :     	}
	;***      177 : //--------------------------------End testing code---------------------------------------------------------
	;***      178 : //    	main_20211111();
	;***      179 : 
	;***      180 :     	switch (read_signal()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 180
	call $!_read_signal
	cmp0 a
	bz $.BB@LABEL@2_18
.BB@LABEL@2_16:	; if_break_bb93
	dec a
	bnz $.BB@LABEL@2_19
.BB@LABEL@2_17:	; switch_clause_bb96
	;***      181 : 			case 0:
	;***      182 : 				g_color = WHITE;
	;***      183 : 				break;
	;***      184 : 			case 1:
	;***      185 : 				g_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 185
	mov !LOWW(_g_color), #0x03
	br $.BB@LABEL@2_19
.BB@LABEL@2_18:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 182
	mov !LOWW(_g_color), #0x02
.BB@LABEL@2_19:	; switch_break_bb
	;***      186 : 				break;
	;***      187 : 			default:
	;***      188 : 
	;***      189 : 				break;
	;***      190 : 		}
	;***      191 :     	if(g_color != g_pre_color){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 191
	mov a, !LOWW(_g_color)
	cmp a, !LOWW(_g_pre_color)
	bz $.BB@LABEL@2_23
.BB@LABEL@2_20:	; if_then_bb105
	;***      192 : 			O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 192
	set1 0xFFF00.0
	;***      193 : 			uint8_t _uart3 = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 193
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	;***      194 : 			send_buf[3]++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 194
	inc !LOWW(_send_buf+0x00003)
	;***      195 : 			R_UART3_Send(send_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 195
	movw bc, #0x0007
	movw ax, #LOWW(_send_buf)
	call !!_R_UART3_Send
.BB@LABEL@2_21:	; bb111
	mov a, [sp+0x00]
	;***      196 : 			while(_uart3 == g_uart3_sendend);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 196
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@2_21
.BB@LABEL@2_22:	; bb119
	;***      197 : 			O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 197
	clr1 0xFFF00.0
.BB@LABEL@2_23:	; if_break_bb120
	;***      198 :     	}
	;***      199 :     	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 199
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      200 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 200
	call !!_R_WDT_Restart
	br $!.BB@LABEL@2_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      201 :     }
	;***      202 :     /* End user code. Do not edit comment generated here */
	;***      203 : }
	;***      204 : 
	;***      205 : /***********************************************************************************************************************
	;***      206 : * Function Name: R_MAIN_UserInit
	;***      207 : * Description  : This function adds user code before implementing main function.
	;***      208 : * Arguments    : None
	;***      209 : * Return Value : None
	;***      210 : ***********************************************************************************************************************/
	;***      211 : void R_MAIN_UserInit(void)
	;***      212 : {
	;***      213 :     /* Start user code. Do not edit comment generated here */
	;***      214 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 214
	ei
	;***      215 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	call !!_R_TAU0_Create
	;***      216 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 216
	call !!_R_SAU0_Create
	;***      217 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 217
	call !!_R_SAU1_Create
	;***      218 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 218
	call !!_R_UART1_Create
	;***      219 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 219
	call !!_R_UART2_Create
	;***      220 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 220
	call !!_R_UART3_Create
	;***      221 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 221
	call !!_R_RTC_Create
	;***      222 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 222
	call !!_R_PORT_Create_UserInit
	;***      223 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 223
	call !!_R_CSI01_Create
	;***      224 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 224
	call !!_R_CSI00_Create
	;***      225 : 
	;***      226 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 226
	call !!_R_TAU0_Channel0_Start
	;***      227 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 227
	call !!_R_UART3_Start
	;***      228 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 228
	call !!_R_UART1_Start
	;***      229 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 229
	call !!_R_UART2_Start
	;***      230 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 230
	call !!_R_CSI00_Start
	;***      231 : //    R_CSI01_Start();
	;***      232 : 
	;***      233 : 
	;***      234 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 234
	call !!_R_ADC_Create
	;***      235 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 235
	call !!_R_ADC_Set_OperationOn
	;***      236 : //    R_ADC_Set_ADChannel(ADCHANNEL0);
	;***      237 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 237
	br !!_R_ADC_Start
	;***      238 :     /* End user code. Do not edit comment generated here */
	;***      239 : }
	;***      240 : 
	;***      241 : /* Start user code for adding. Do not edit comment generated here */
	;***      242 : /* End user code. Do not edit comment generated here */
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
	.SECTION .bss,BSS
	.ALIGN 2
__stamp:
	.DS (12)
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
