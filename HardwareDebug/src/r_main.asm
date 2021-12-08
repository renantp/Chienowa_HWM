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
#@  compiled at Wed Dec 08 17:03:02 2021

	.EXTERN _g_rtc
	.EXTERN _g_timerSetting
	.EXTERN _g_systemTime
	.EXTERN _g_csi_rev_end
	.EXTERN _g_uart2_fault
	.EXTERN _g_uart2_sendend
	.EXTERN _g_uart3_sendend
	.EXTERN _g_rx_data
	.EXTERN _g_color
	.EXTERN _g_pre_color
	.EXTERN _send_response_flag
	.EXTERN _send_response_time_flag
	.EXTERN _recived_time_setting_flag
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
	.PUBLIC _rx_count
	.PUBLIC _readHS
	.EXTERN _delay_ms
	.PUBLIC _main
	.PUBLIC _R_MAIN_UserInit
	.EXTERN _EEPROM_Init
	.EXTERN _setting_default
	.EXTERN _crc8_1
	.EXTERN _R_RTC_Set_CounterValue
	.EXTERN _R_RTC_Start
	.EXTERN _R_UART2_Receive
	.EXTERN _R_UART3_Receive
	.EXTERN _R_UART2_Send
	.EXTERN _R_WDT_Restart
	.EXTERN _sendToRasPi
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
	.STACK _main = 16
	;***       82 : uint8_t this_size;
	;***       83 : uint8_t rec_buf[12];
	;***       84 : uint8_t send_buf[7] = {8,1,2,3,4,5,6};
	;***       85 : char g_crc[8];
	;***       86 : uint32_t g_crc_32[8];
	;***       87 : uint32_t data_crc[2] = {30500, 60200};
	;***       88 : uint8_t rx_count;
	;***       89 : /* End user code. Do not edit comment generated here */
	;***       90 : void R_MAIN_UserInit(void);
	;***       91 : 
	;***       92 : /***********************************************************************************************************************
	;***       93 : * Function Name: main
	;***       94 : * Description  : This function implements main function.
	;***       95 : * Arguments    : None
	;***       96 : * Return Value : None
	;***       97 : ***********************************************************************************************************************/
	;***       98 : void main(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 98
	subw sp, #0x04
	;***       99 : {
	;***      100 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 100
	call $!_R_MAIN_UserInit
	;***      101 :     /* Start user code. Do not edit comment generated here */
	;***      102 :     EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 102
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	;***      103 : //    O_RS485_MODE_PIN = 1U;
	;***      104 : //    EEPROM_SPI_WriteBuffer(e_send, 0x000f, 4);
	;***      105 : //    delay_ms(1000);
	;***      106 : //    EEPROM_SPI_ReadBuffer(e_data, 0x000f, 3);
	;***      107 : //    R_UART0_Send("Hello \r\n", sizeof("Hello \r\n") - 1);
	;***      108 : //    csi01_status = STATUS_COMPLETE;
	;***      109 :     //Power ON
	;***      110 :     setting_default();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 110
	call !!_setting_default
	;***      111 :     g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, 68);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 111
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00044), a
	;***      112 :     g_rtc.hour = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 112
	mov !LOWW(_g_rtc+0x00002), #0x0A
	;***      113 :     g_rtc.sec = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 113
	mov !LOWW(_g_rtc), #0x02
	;***      114 :     R_RTC_Set_CounterValue(g_rtc);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 114
	subw sp, #0x08
	movw ax, sp
	movw de, #0x0007
	movw bc, #LOWW(_g_rtc)
	call !!_memcpy
	call !!_R_RTC_Set_CounterValue
	addw sp, #0x08
	;***      115 :     R_RTC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 115
	call !!_R_RTC_Start
	;***      116 :     R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 116
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      117 : 
	;***      118 : //    Test nhan
	;***      119 :     O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 119
	clr1 0xFFF00.0
	;***      120 :     R_UART3_Receive(rec_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 120
	movw bc, #0x0007
	movw ax, #LOWW(_rec_buf)
	call !!_R_UART3_Receive
	;***      121 : 
	;***      122 : //    Test gui
	;***      123 : //    O_RS485_MODE_PIN = 1U;
	;***      124 : //    delay_ms(10);
	;***      125 : //    R_UART3_Send(send_buf, 7);
	;***      126 : //    EEPROM_PROTECT_EN();
	;***      127 : 
	;***      128 :     g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 128
	clrb !LOWW(_g_color)
	;***      129 :     g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 129
	mov !LOWW(_g_pre_color), #0x03
	;***      130 :     this_size = sizeof(struct Timer_Setting_s);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 130
	mov !LOWW(_this_size), #0x46
.BB@LABEL@2_1:	; bb359
	;***      131 :     while (1U)
	;***      132 :     {
	;***      133 :     	if(send_response_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 133
	cmp0 !LOWW(_send_response_flag)
	bz $.BB@LABEL@2_6
.BB@LABEL@2_2:	; if_then_bb
	;***      134 :     		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 134
	inc !LOWW(_rx_count)
	;***      135 :     		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 135
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      136 :     		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 136
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@2_3:	; bb21
	mov a, [sp+0x00]
	;***      137 :     		while(state == g_uart2_sendend){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 137
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@2_5
.BB@LABEL@2_4:	; bb20
	;***      138 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 138
	call !!_R_WDT_Restart
	br $.BB@LABEL@2_3
.BB@LABEL@2_5:	; bb29
	;***      139 : 			}
	;***      140 : 
	;***      141 :     		send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 141
	clrb !LOWW(_send_response_flag)
.BB@LABEL@2_6:	; if_break_bb
	;***      142 :     	}
	;***      143 :     	if(send_response_time_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	cmp0 !LOWW(_send_response_time_flag)
	bz $.BB@LABEL@2_11
.BB@LABEL@2_7:	; if_then_bb35
	;***      144 : 			uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 144
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      145 : 			g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00044), a
	;***      146 : 			R_UART2_Send((uint8_t *)&g_timerSetting, 69);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 146
	movw bc, #0x0045
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@2_8:	; bb40
	mov a, [sp+0x00]
	;***      147 : 			while(state == g_uart2_sendend){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@2_10
.BB@LABEL@2_9:	; bb39
	;***      148 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 148
	call !!_R_WDT_Restart
	br $.BB@LABEL@2_8
.BB@LABEL@2_10:	; bb48
	;***      149 : 			}
	;***      150 : 			send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 150
	clrb !LOWW(_send_response_time_flag)
.BB@LABEL@2_11:	; if_break_bb49
	;***      151 :     	}
	;***      152 :     	if(recived_time_setting_flag == 2){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 152
	cmp !LOWW(_recived_time_setting_flag), #0x02
	.bnz $!.BB@LABEL@2_26
.BB@LABEL@2_12:	; if_then_bb55
	;***      153 :     		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 153
	inc !LOWW(_rx_count)
	clrb a
	mov [sp+0x00], a
.BB@LABEL@2_13:	; bb58
	;***      154 : //    		uint8_t *p = (uint8_t *)&g_timerSetting;
	;***      155 :     		uint8_t *p = (uint8_t *)&_setting;
	;***      156 : 			//Do not Edit this, must keep!!!!
	;***      157 : 			for(uint8_t i=0;i<sizeof(struct Timer_Setting_s) - 2; i++){
	;***      158 : 				switch (i%4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 158
	shrw ax, 8+0x00000
	movw [sp+0x02], ax
	mov a, [sp+0x00]
	and a, #0x03
	bz $.BB@LABEL@2_18
.BB@LABEL@2_14:	; bb58
	dec a
	bz $.BB@LABEL@2_17
.BB@LABEL@2_15:	; bb58
	dec a
	bnz $.BB@LABEL@2_21
.BB@LABEL@2_16:	; switch_clause_bb74
	movw ax, [sp+0x02]
	;***      159 : 					case 4:
	;***      160 : 						p[67+3-i] = g_rx_data[i-3];
	;***      161 : 						break;
	;***      162 : 					case 2:
	;***      163 : 						p[67+1-i] = g_rx_data[i-1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 163
	addw ax, #LOWW(_g_rx_data+0x0FFFF)
	movw de, ax
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, #0x0044
	subw ax, bc
	movw bc, ax
	mov a, [de]
	br $.BB@LABEL@2_20
.BB@LABEL@2_17:	; switch_clause_bb87
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, #0x0042
	;***      164 : 						break;
	;***      165 : 					case 1:
	;***      166 : 						p[67-1-i] = g_rx_data[1+i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 166
	subw ax, bc
	movw [sp+0x02], ax
	mov a, [sp+0x00]
	mov b, a
	mov a, LOWW(_g_rx_data+0x00001)[b]
	br $.BB@LABEL@2_19
.BB@LABEL@2_18:	; switch_clause_bb100
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, #0x0040
	;***      167 : 						break;
	;***      168 : 					case 0:
	;***      169 : 						p[67-3-i] = g_rx_data[3+i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 169
	subw ax, bc
	movw [sp+0x02], ax
	mov a, [sp+0x00]
	mov b, a
	mov a, LOWW(_g_rx_data+0x00003)[b]
.BB@LABEL@2_19:	; switch_clause_bb100
	mov b, a
	movw ax, [sp+0x02]
	xchw ax, bc
.BB@LABEL@2_20:	; switch_clause_bb100
	mov LOWW(__setting@3)[bc], a
.BB@LABEL@2_21:	; switch_break_bb
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 157
	inc a
	mov [sp+0x00], a
	cmp a, #0x44
	bnz $.BB@LABEL@2_13
.BB@LABEL@2_22:	; bb122
	;***      170 : 						break;
	;***      171 : 					default:
	;***      172 : 						break;
	;***      173 : 				}
	;***      174 : 			}
	;***      175 : 			_setting.crc = g_rx_data[68];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 175
	mov a, !LOWW(_g_rx_data+0x00044)
	mov [sp+0x00], a
	mov !LOWW(__setting@3+0x00044), a
	;***      176 : 
	;***      177 : 			if(_setting.crc == crc8_1((uint8_t *)g_rx_data, 68)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 177
	mov c, #0x44
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	movw de, #0x0000
	clrw bc
	cmp x, a
	mov a, #0x53
	bnz $.BB@LABEL@2_24
.BB@LABEL@2_23:	; if_then_bb131
	;***      178 : 				rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 178
	inc !LOWW(_rx_count)
	;***      179 : 				sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 179
	clrb x
	call !!_sendToRasPi
	;***      180 : 				g_timerSetting = _setting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 180
	movw de, #0x0046
	movw bc, #LOWW(__setting@3)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	br $.BB@LABEL@2_25
.BB@LABEL@2_24:	; if_else_bb
	;***      181 : 				recived_time_setting_flag = 0;
	;***      182 : 			}else{
	;***      183 : 				sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 183
	mov x, #0x16
	call !!_sendToRasPi
.BB@LABEL@2_25:	; if_break_bb135.PartialDrain
	clrb !LOWW(_recived_time_setting_flag)
.BB@LABEL@2_26:	; if_break_bb135
	;***      184 : //				R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
	;***      185 : 				recived_time_setting_flag = 0;
	;***      186 : 			}
	;***      187 :     	}
	;***      188 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      189 :     	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 189
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick@1+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_28
.BB@LABEL@2_27:	; if_then_bb140
	;***      190 :     		P6_bit.no3 = ~P6_bit.no3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
.BB@LABEL@2_28:	; if_break_bb151
	;***      191 : //    		R_UART3_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      192 : //    		R_UART1_Send((uint8_t *)"Hello", sizeof("Hello")-1);
	;***      193 : //    		g_e_status.raw = rEE_Status();
	;***      194 :     	}
	;***      195 :     	if((g_rx_data[0] == H_SET)&(g_rx_data[1] == OK_USER)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 195
	cmp !LOWW(_g_rx_data+0x00001), #0x01
	mov a, !LOWW(_g_rx_data)
	sknz
.BB@LABEL@2_29:	; if_break_bb151
	cmp a, #0x53
.BB@LABEL@2_30:	; if_break_bb151
	bnz $.BB@LABEL@2_41
.BB@LABEL@2_31:	; if_then_bb164
	;***      196 :     		if(this_size == 70){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 196
	mov a, !LOWW(_this_size)
	cmp a, #0x46
	bnz $.BB@LABEL@2_33
.BB@LABEL@2_32:	; if_then_bb170
	;***      197 :     			if(ns_delay_ms(&g_Tick.tickCustom[1], g_timerSetting.t51*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 197
	movw ax, !LOWW(_g_timerSetting+0x00024)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00026)
	br $.BB@LABEL@2_37
.BB@LABEL@2_33:	; if_else_bb181
	;***      198 : 					sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      199 : 					this_size++;
	;***      200 : 				}
	;***      201 :     		}else if(this_size == 71){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 201
	cmp a, #0x47
	bnz $.BB@LABEL@2_35
.BB@LABEL@2_34:	; if_then_bb187
	;***      202 :     			if(ns_delay_ms(&g_Tick.tickCustom[1], g_timerSetting.t52*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 202
	movw ax, !LOWW(_g_timerSetting+0x00028)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0002A)
	br $.BB@LABEL@2_37
.BB@LABEL@2_35:	; if_else_bb198
	;***      203 : 					sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      204 : 					this_size++;
	;***      205 : 				}
	;***      206 :     		}else if(this_size == 72){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 206
	cmp a, #0x48
	bnz $.BB@LABEL@2_39
.BB@LABEL@2_36:	; if_then_bb204
	;***      207 :     			if(ns_delay_ms(&g_Tick.tickCustom[1], g_timerSetting.t53*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 207
	movw ax, !LOWW(_g_timerSetting+0x0002C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0002E)
.BB@LABEL@2_37:	; if_then_bb204
	push bc
	pop hl
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x00024)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_42
.BB@LABEL@2_38:	; if_then_bb211
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call !!_sendToRasPi
	inc !LOWW(_this_size)
	br $.BB@LABEL@2_42
.BB@LABEL@2_39:	; if_else_bb215
	;***      208 : 					sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      209 : 					this_size++;
	;***      210 : 				}
	;***      211 :     		}else if(this_size == 73){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 211
	cmp a, #0x49
	bnz $.BB@LABEL@2_42
.BB@LABEL@2_40:	; if_then_bb221
	;***      212 :     			g_rx_data[0] = g_rx_data[1] = 0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 212
	clrb !LOWW(_g_rx_data+0x00001)
	clrb !LOWW(_g_rx_data)
	;***      213 :     			g_Tick.tickCustom[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 213
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00024), ax
	;***      214 : 				this_size = sizeof(struct Timer_Setting_s);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 214
	mov !LOWW(_this_size), #0x46
	br $.BB@LABEL@2_42
.BB@LABEL@2_41:	; if_else_bb228
	;***      215 :     		}
	;***      216 :     	}else{
	;***      217 :     		g_Tick.tickCustom[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 217
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00024), ax
.BB@LABEL@2_42:	; if_break_bb230
	;***      218 :     	}
	;***      219 : 
	;***      220 :     	// Check
	;***      221 :     	if(g_uart2_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 221
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@2_44
.BB@LABEL@2_43:	; if_then_bb236
	;***      222 :     		R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 222
	call !!_R_UART2_Stop
	;***      223 :     		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 223
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      224 :     		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 224
	call !!_R_UART2_Start
	;***      225 :     		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 225
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@2_44:	; if_break_bb237
	;***      226 :     	}
	;***      227 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 227
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@2_45:	; bb245
	clrb a
.BB@LABEL@2_46:	; bb246
	mov !LOWW(_flow_p), a
	;***      228 :     	if(ns_delay_ms(&g_Tick.tickCustom[1], 60000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 228
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick@1+0x00024)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_58
.BB@LABEL@2_47:	; if_then_bb254
	;***      229 :     		if(O_SUPPLY_WATER_PIN == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 229
	mov a, 0xFFF01
	mov1 CY, a.7
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@2_51
.BB@LABEL@2_48:	; if_else_bb264
	;***      230 : 				g_TickKeeper.SV1_ON_minutes++;
	;***      231 : 				g_TickKeeper.SV1_OFF_minutes = 0;
	;***      232 : 			}else{
	;***      233 : 				g_TickKeeper.SV1_OFF_minutes++;
	;***      234 : 				g_TickKeeper.SV1_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 234
	movw !LOWW(_g_TickKeeper@2+0x00002), ax
	movw !LOWW(_g_TickKeeper@2), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 233
	addw ax, !LOWW(_g_TickKeeper@2+0x00004)
	movw !LOWW(_g_TickKeeper@2+0x00004), ax
	movw ax, bc
	sknc
.BB@LABEL@2_49:	; if_else_bb264
	incw ax
.BB@LABEL@2_50:	; if_else_bb264
	addw ax, !LOWW(_g_TickKeeper@2+0x00006)
	movw !LOWW(_g_TickKeeper@2+0x00006), ax
	br $.BB@LABEL@2_54
.BB@LABEL@2_51:	; if_then_bb261
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 231
	movw !LOWW(_g_TickKeeper@2+0x00006), ax
	movw !LOWW(_g_TickKeeper@2+0x00004), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 230
	addw ax, !LOWW(_g_TickKeeper@2)
	movw !LOWW(_g_TickKeeper@2), ax
	movw ax, bc
	sknc
.BB@LABEL@2_52:	; if_then_bb261
	incw ax
.BB@LABEL@2_53:	; if_then_bb261
	addw ax, !LOWW(_g_TickKeeper@2+0x00002)
	movw !LOWW(_g_TickKeeper@2+0x00002), ax
.BB@LABEL@2_54:	; if_break_bb267
	;***      235 : 			}
	;***      236 : 			if(O_SPOUT_WATER_PIN == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 236
	mov a, 0xFFF05
	mov1 CY, a.5
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@2_59
.BB@LABEL@2_55:	; if_else_bb278
	;***      237 : 				g_TickKeeper.SV2_ON_minutes++;
	;***      238 : 				g_TickKeeper.SV2_OFF_minutes = 0;
	;***      239 : 			}else{
	;***      240 : 				g_TickKeeper.SV2_OFF_minutes++;
	;***      241 : 				g_TickKeeper.SV2_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 241
	movw !LOWW(_g_TickKeeper@2+0x0000A), ax
	movw !LOWW(_g_TickKeeper@2+0x00008), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 240
	addw ax, !LOWW(_g_TickKeeper@2+0x0000C)
	movw !LOWW(_g_TickKeeper@2+0x0000C), ax
	movw ax, bc
	sknc
.BB@LABEL@2_56:	; if_else_bb278
	incw ax
.BB@LABEL@2_57:	; if_else_bb278
	addw ax, !LOWW(_g_TickKeeper@2+0x0000E)
	movw !LOWW(_g_TickKeeper@2+0x0000E), ax
.BB@LABEL@2_58:	; if_else_bb278
	br $.BB@LABEL@2_62
.BB@LABEL@2_59:	; if_then_bb275
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 238
	movw !LOWW(_g_TickKeeper@2+0x0000E), ax
	movw !LOWW(_g_TickKeeper@2+0x0000C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 237
	addw ax, !LOWW(_g_TickKeeper@2+0x00008)
	movw !LOWW(_g_TickKeeper@2+0x00008), ax
	movw ax, bc
	sknc
.BB@LABEL@2_60:	; if_then_bb275
	incw ax
.BB@LABEL@2_61:	; if_then_bb275
	addw ax, !LOWW(_g_TickKeeper@2+0x0000A)
	movw !LOWW(_g_TickKeeper@2+0x0000A), ax
.BB@LABEL@2_62:	; if_break_bb282
	;***      242 : 			}
	;***      243 :     	}
	;***      244 :     	if(ns_delay_ms(&g_Tick.tick1s, 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 244
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick@1+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@2_66
.BB@LABEL@2_63:	; if_then_bb287
	;***      245 : 
	;***      246 : //    		send_buf[1]++;
	;***      247 : //    		R_UART3_Send(send_buf, 7);
	;***      248 : //    		R_UART3_Receive(rec_buf, 7);
	;***      249 :     		O_CTRL_OUT_PIN = led_st&0x01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 249
	mov a, !LOWW(_led_st)
	mov x, a
	mov1 CY, a.0
	mov a, 0xFFF03
	mov1 a.1, CY
	mov 0xFFF03, a
	;***      250 :     		O_SPOUT_WATER_PIN = led_st&0x01;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 250
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	;***      251 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 251
	cmp0 x
	mov a, #0xFF
	skz
.BB@LABEL@2_64:	; bb311
	clrb a
.BB@LABEL@2_65:	; bb313
	mov !LOWW(_led_st), a
	;***      252 :     	    uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 252
	mov a, !LOWW(_g_uart2_sendend)
	;***      253 : //    	    g_timerSetting.t2_flowSensorStartTime = 0x24770000;
	;***      254 : //    	    g_timerSetting.t2_flowSensorStartTime = 0x0000ffff;
	;***      255 : //    	    g_timerSetting.t3_flowSensorMonitorTime = 0x0000aaaa;
	;***      256 : //    	    g_timerSetting.t6_drainageOffTime = 1000;
	;***      257 : //			g_timerSetting.t51++;
	;***      258 : //    	    g_timerSetting.crc = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	;***      259 : //    	    g_crc[0] = crc_8((unsigned char *)&g_timerSetting, 4);
	;***      260 : //    	    g_crc[1] = Fast_CRC_Cal8Bits(0x00, 4, (unsigned char *)&g_timerSetting);
	;***      261 : //    	    g_crc[2] = Quick_CRC_Cal8Bits(0x00, 4, (unsigned char *)&g_timerSetting);
	;***      262 : //    	    g_crc[3] = crc8x_simple(0x00, (unsigned char *)&g_timerSetting, 4);
	;***      263 : //    	    g_crc[4] = crc8x_fast(0x00, (unsigned char *)&g_timerSetting, 4);
	;***      264 : //    	    g_crc[5] = getCRC((unsigned char *)&g_timerSetting, 4);
	;***      265 :     	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 265
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      266 :     	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 266
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
.BB@LABEL@2_66:	; if_break_bb328
	;***      267 : //    	    g_crc_32 = CRC32_function((uint8_t *)&g_timerSetting, 8);
	;***      268 : //    	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s));
	;***      269 : //    	    R_UART2_Send((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 1);
	;***      270 : //    	    sendToRasPi(H_ALARM, CURRENT_ABNORMAL, 32);
	;***      271 : //    	    while(state == g_uart2_sendend){
	;***      272 : //				R_WDT_Restart();
	;***      273 : //			}
	;***      274 : 
	;***      275 :     		if(led_st == 0x00){
	;***      276 : 
	;***      277 : //    			O_HS_ICL_PIN = 0;
	;***      278 : //    			O_HS_IDA_PIN = 1;
	;***      279 : //    			handSensorLED(RED);
	;***      280 : //    			O_CVCC_ALARM_RS = 1;
	;***      281 : //    			O_PUMP_SALT_PIN = ON;
	;***      282 : //    			electrolyticOperationON();
	;***      283 : 
	;***      284 :     		}else{
	;***      285 : //    			O_HS_ICL_PIN = 1;
	;***      286 : //				O_HS_IDA_PIN = 0;
	;***      287 : //    			handSensorLED(WHITE);
	;***      288 : //    			O_CVCC_ALARM_RS = 0;
	;***      289 : //    			O_PUMP_SALT_PIN = OFF;
	;***      290 : //    			electrolyticOperationOFF();
	;***      291 :     		}
	;***      292 :     	}
	;***      293 : //--------------------------------End testing code---------------------------------------------------------
	;***      294 : //    	main_20211111();
	;***      295 : 
	;***      296 :     	switch (readHS()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 296
	call $!_readHS
	cmp0 a
	bz $.BB@LABEL@2_69
.BB@LABEL@2_67:	; if_break_bb328
	dec a
	bnz $.BB@LABEL@2_70
.BB@LABEL@2_68:	; switch_clause_bb332
	;***      297 : 			case 0:
	;***      298 : 				g_color = WHITE;
	;***      299 : 				break;
	;***      300 : 			case 1:
	;***      301 : 				g_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 301
	mov !LOWW(_g_color), #0x03
	br $.BB@LABEL@2_70
.BB@LABEL@2_69:	; switch_clause_bb331
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 298
	mov !LOWW(_g_color), #0x02
.BB@LABEL@2_70:	; switch_break_bb334
	;***      302 : 				break;
	;***      303 : 			default:
	;***      304 : 
	;***      305 : 				break;
	;***      306 : 		}
	;***      307 :     	if(g_color != g_pre_color){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 307
	mov a, !LOWW(_g_color)
	cmp a, !LOWW(_g_pre_color)
	bz $.BB@LABEL@2_74
.BB@LABEL@2_71:	; if_then_bb342
	;***      308 : 			O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 308
	set1 0xFFF00.0
	;***      309 : 			uint8_t _uart3 = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 309
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	;***      310 : 			send_buf[3]++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 310
	inc !LOWW(_send_buf+0x00003)
	;***      311 : 			R_UART3_Send(send_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 311
	movw bc, #0x0007
	movw ax, #LOWW(_send_buf)
	call !!_R_UART3_Send
.BB@LABEL@2_72:	; bb348
	mov a, [sp+0x00]
	;***      312 : 			while(_uart3 == g_uart3_sendend);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 312
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@2_72
.BB@LABEL@2_73:	; bb356
	;***      313 : 			O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 313
	clr1 0xFFF00.0
.BB@LABEL@2_74:	; if_break_bb357
	;***      314 :     	}
	;***      315 :     	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 315
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      316 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 316
	call !!_R_WDT_Restart
	br $!.BB@LABEL@2_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      317 :     }
	;***      318 :     /* End user code. Do not edit comment generated here */
	;***      319 : }
	;***      320 : 
	;***      321 : /***********************************************************************************************************************
	;***      322 : * Function Name: R_MAIN_UserInit
	;***      323 : * Description  : This function adds user code before implementing main function.
	;***      324 : * Arguments    : None
	;***      325 : * Return Value : None
	;***      326 : ***********************************************************************************************************************/
	;***      327 : void R_MAIN_UserInit(void)
	;***      328 : {
	;***      329 :     /* Start user code. Do not edit comment generated here */
	;***      330 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 330
	ei
	;***      331 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 331
	call !!_R_TAU0_Create
	;***      332 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 332
	call !!_R_SAU0_Create
	;***      333 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 333
	call !!_R_SAU1_Create
	;***      334 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 334
	call !!_R_UART1_Create
	;***      335 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 335
	call !!_R_UART2_Create
	;***      336 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 336
	call !!_R_UART3_Create
	;***      337 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 337
	call !!_R_RTC_Create
	;***      338 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 338
	call !!_R_PORT_Create_UserInit
	;***      339 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 339
	call !!_R_CSI01_Create
	;***      340 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 340
	call !!_R_CSI00_Create
	;***      341 : 
	;***      342 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 342
	call !!_R_TAU0_Channel0_Start
	;***      343 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 343
	call !!_R_UART3_Start
	;***      344 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 344
	call !!_R_UART1_Start
	;***      345 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 345
	call !!_R_UART2_Start
	;***      346 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 346
	call !!_R_CSI00_Start
	;***      347 : //    R_CSI01_Start();
	;***      348 : 
	;***      349 : 
	;***      350 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 350
	call !!_R_ADC_Create
	;***      351 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 351
	call !!_R_ADC_Set_OperationOn
	;***      352 : //    R_ADC_Set_ADChannel(ADCHANNEL0);
	;***      353 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 353
	br !!_R_ADC_Start
	;***      354 :     /* End user code. Do not edit comment generated here */
	;***      355 : }
	;***      356 : 
	;***      357 : /* Start user code for adding. Do not edit comment generated here */
	;***      358 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
	.ALIGN 2
_g_Tick@1:
	.DS (64)
	.ALIGN 2
_g_TickKeeper@2:
	.DS (16)
	.ALIGN 2
__setting@3:
	.DS (70)
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
_rx_count:
	.DS (1)
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
