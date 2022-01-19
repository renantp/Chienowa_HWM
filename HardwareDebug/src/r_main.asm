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
#@  compiled at Tue Jan 18 11:54:24 2022

	.EXTERN _g_color
	.EXTERN _g_pre_color
	.EXTERN __settingTime
	.EXTERN __settingNumber
	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_io_status
	.EXTERN _g_Tick
	.EXTERN _g_commnunication_flag
	.EXTERN _g_machine_mode
	.EXTERN _g_systemTime
	.EXTERN _g_csi_rev_end
	.EXTERN _g_uart2_fault
	.EXTERN _g_uart2_sendend
	.EXTERN _g_uart3_sendend
	.EXTERN _g_rx_data
	.EXTERN _g_uart3_rx_data
	.PUBLIC _g_adc_ch
	.PUBLIC _g_e_status
	.PUBLIC _ret_number_setting
	.PUBLIC _led_st
	.PUBLIC _flow_p
	.PUBLIC _salt_h_p
	.PUBLIC _g_eeprom_wren
	.PUBLIC _send_data
	.PUBLIC _receive_data
	.PUBLIC _receive_setting
	.PUBLIC _set
	.PUBLIC _rx_data
	.PUBLIC _data_f
	.PUBLIC _data_f_test
	.PUBLIC _g_control_buffer_f
	.PUBLIC _g_control_buffer_u32
	.PUBLIC _handsensor_status
	.PUBLIC _g_handsensor_status
	.PUBLIC _this_size
	.PUBLIC _this_size_2
	.PUBLIC _send_buf
	.PUBLIC _g_crc
	.PUBLIC _g_crc_32
	.PUBLIC _data_crc
	.PUBLIC _rx_count
	.PUBLIC _dac_out
	.PUBLIC _nostop_checkHandSensor
	.EXTERN _ns_delay_ms
	.PUBLIC _readHS
	.EXTERN _delay_ms
	.PUBLIC _main
	.PUBLIC _R_MAIN_UserInit
	.EXTERN _EEPROM_Init
	.EXTERN _EE_SPI_Read
	.EXTERN _R_UART2_Receive
	.EXTERN _R_UART3_Receive
	.EXTERN _sendRS485
	.EXTERN _handSensorLED
	.EXTERN _realTimeResponse
	.EXTERN _main_loop_20211111
	.EXTERN _UpdateMachineStatus
	.EXTERN _R_UART2_Stop
	.EXTERN _R_UART2_Start
	.EXTERN _sendR485_7byte
	.EXTERN _R_UART3_Stop
	.EXTERN _R_UART3_Start
	.EXTERN _crc8_4
	.EXTERN _crc8_1
	.EXTERN _R_WDT_Restart
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
	.EXTERN _R_UART1_Start
	.EXTERN _R_CSI00_Start
	.EXTERN _R_ADC_Create
	.EXTERN _R_ADC_Set_OperationOn
	.EXTERN _R_ADC_Start
	.EXTERN _R_DAC_Create
	.EXTERN _R_DAC0_Set_ConversionValue
	.EXTERN _R_DAC1_Set_ConversionValue
	.EXTERN _R_DAC0_Start
	.EXTERN _R_DAC1_Start

	.SECTION .textf,TEXTF
_nostop_checkHandSensor:
	.STACK _nostop_checkHandSensor = 4
	;***        1 : /***********************************************************************************************************************
	;***        2 :  * DISCLAIMER
	;***        3 :  * This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products.
	;***        4 :  * No other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
	;***        5 :  * applicable laws, including copyright laws.
	;***        6 :  * THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING THIS SOFTWARE, WHETHER EXPRESS, IMPLIED
	;***        7 :  * OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	;***        8 :  * NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY
	;***        9 :  * LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE FOR ANY DIRECT,
	;***       10 :  * INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR
	;***       11 :  * ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
	;***       12 :  * Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability
	;***       13 :  * of this software. By using this software, you agree to the additional terms and conditions found by accessing the
	;***       14 :  * following link:
	;***       15 :  * http://www.renesas.com/disclaimer
	;***       16 :  *
	;***       17 :  * Copyright (C) 2011, 2020 Renesas Electronics Corporation. All rights reserved.
	;***       18 :  ***********************************************************************************************************************/
	;***       19 : 
	;***       20 : /***********************************************************************************************************************
	;***       21 :  * File Name    : r_main.c
	;***       22 :  * Version      : CodeGenerator for RL78/G14 V2.05.05.01 [25 Nov 2020]
	;***       23 :  * Device(s)    : R5F104ML
	;***       24 :  * Tool-Chain   : CCRL
	;***       25 :  * Description  : This file implements main function.
	;***       26 :  * Creation Date: 30/11/2021
	;***       27 :  ***********************************************************************************************************************/
	;***       28 : 
	;***       29 : /***********************************************************************************************************************
	;***       30 :  Includes
	;***       31 :  ***********************************************************************************************************************/
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
	;***       46 : #include "hwm/main.h"
	;***       47 : #include "r_cg_userdefine.h"
	;***       48 : 
	;***       49 : /***********************************************************************************************************************
	;***       50 :  Pragma directive
	;***       51 :  ***********************************************************************************************************************/
	;***       52 : /* Start user code for pragma. Do not edit comment generated here */
	;***       53 : #define CVCC_Current_Set(a) R_DAC0_Set_ConversionValue(a)
	;***       54 : #define Salt_Analog_Set(a) R_DAC1_Set_ConversionValue(a)
	;***       55 : //#define TESTING_FIRMWARE
	;***       56 : /* End user code. Do not edit comment generated here */
	;***       57 : 
	;***       58 : /***********************************************************************************************************************
	;***       59 :  Global variables and functions
	;***       60 :  ***********************************************************************************************************************/
	;***       61 : /* Start user code for global. Do not edit comment generated here */
	;***       62 : 
	;***       63 : volatile int g_adc_ch = 0;
	;***       64 : union EEPROM_status_u g_e_status;
	;***       65 : struct Number_Setting_s ret_number_setting;
	;***       66 : uint8_t led_st = 0xff;
	;***       67 : uint8_t flow_p, salt_h_p;
	;***       68 : uint8_t g_eeprom_wren;
	;***       69 : uint8_t send_data[2] = { 0x23, 0xab };
	;***       70 : uint8_t receive_data[2];
	;***       71 : struct Number_Setting_s receive_setting;
	;***       72 : union EEPROM_status_u set;
	;***       73 : uint32_t rx_data[3];
	;***       74 : float data_f;
	;***       75 : union byte_to_float data_f_test;
	;***       76 : struct UART_Buffer_float_s g_control_buffer_f;
	;***       77 : struct UART_Buffer_u32_s g_control_buffer_u32;
	;***       78 : 
	;***       79 : union {
	;***       80 : 	struct {
	;***       81 : 		uint8_t up_signal;
	;***       82 : 	};
	;***       83 : 	uint8_t status;
	;***       84 : } handsensor_status;
	;***       85 : uint8_t g_handsensor_status[2];
	;***       86 : void nostop_checkHandSensor(void) {
	;***       87 : 	if (DETECT_U() == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 87
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_5
.BB@LABEL@1_1:	; if_then_bb
	;***       88 : 		if (ns_delay_ms(&g_Tick.tickHandSensor[0], 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 88
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x0008C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@1_9
.BB@LABEL@1_2:	; if_then_bb16
	;***       89 : 			g_handsensor_status[0] = g_handsensor_status[0] == 0 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 89
	cmp0 !LOWW(_g_handsensor_status)
	oneb a
	skz
.BB@LABEL@1_3:	; bb22
	clrb a
.BB@LABEL@1_4:	; bb24
	mov !LOWW(_g_handsensor_status), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 98
	ret
.BB@LABEL@1_5:	; if_else_bb
	;***       90 : 		}
	;***       91 : 	} else if (DETECT_D() == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 91
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@1_7
.BB@LABEL@1_6:	; if_then_bb43
	;***       92 : 		g_handsensor_status[1] = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 92
	oneb !LOWW(_g_handsensor_status+0x00001)
	ret
.BB@LABEL@1_7:	; if_else_bb44
	;***       93 : 	} else if (DETECT_U() == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 93
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_9
.BB@LABEL@1_8:	; if_else_bb61
	;***       94 : 
	;***       95 : 	} else if (DETECT_D() == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 95
	mov a, 0xFFF07
.BB@LABEL@1_9:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 98
	ret
_readHS:
	.STACK _readHS = 4
	;***       96 : 
	;***       97 : 	}
	;***       98 : }
	;***       99 : uint8_t readHS(void) {
	;***      100 : 	if (DETECT_U()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 100
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@2_2
.BB@LABEL@2_1:	; bb33
	;***      101 : 		delay_ms(2);
	;***      102 : 		if (DETECT_U())
	;***      103 : 			return 1;
	;***      104 : 		return 0;
	;***      105 : 	} else
	;***      106 : 		return 0;
	;***      107 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 107
	clrb a
	ret
.BB@LABEL@2_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 101
	clrw bc
	onew ax
	incw ax
	call !!_delay_ms
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 102
	mov a, 0xFFF07
	shr a, 0x05
	and a, #0x01
	ret
_main:
	.STACK _main = 24
	;***      108 : uint8_t this_size = sizeof(g_io_status);
	;***      109 : uint8_t this_size_2 = sizeof(union IO_Status_u);
	;***      110 : uint8_t send_buf[7] = { 8, 1, 2, 3, 4, 5, 6 };
	;***      111 : char g_crc[8];
	;***      112 : uint32_t g_crc_32[8];
	;***      113 : uint32_t data_crc[2] = { 30500, 60200 };
	;***      114 : uint8_t rx_count;
	;***      115 : uint8_t dac_out[2] = { 0xff, 0xff };
	;***      116 : /* End user code. Do not edit comment generated here */
	;***      117 : 
	;***      118 : void R_MAIN_UserInit(void);
	;***      119 : 
	;***      120 : /***********************************************************************************************************************
	;***      121 :  * Function Name: main
	;***      122 :  * Description  : This function implements main function.
	;***      123 :  * Arguments    : None
	;***      124 :  * Return Value : None
	;***      125 :  ***********************************************************************************************************************/
	;***      126 : void main(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 126
	subw sp, #0x10
	;***      127 : 	R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 127
	call $!_R_MAIN_UserInit
	;***      128 : 	/* Start user code. Do not edit comment generated here */
	;***      129 : 
	;***      130 : 	//TODO: EEPROM Initialize and read Setting
	;***      131 : 	EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 131
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	clrw ax
	;***      132 : 	EE_SPI_Read((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 132
	push ax
	mov x, #0x25
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      133 : 			numberSettingSize);
	;***      134 : 	EE_SPI_Read((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 134
	push ax
	mov x, #0x95
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	;***      135 : 			timeSettingSize);
	;***      136 : 	_settingNumber = g_numberSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 136
	movw de, #0x0026
	movw bc, #LOWW(_g_numberSetting)
	movw ax, #LOWW(__settingNumber)
	call !!_memcpy
	;***      137 : 	_settingTime = g_timerSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 137
	movw de, #0x0096
	movw bc, #LOWW(_g_timerSetting)
	movw ax, #LOWW(__settingTime)
	call !!_memcpy
	;***      138 : 	EEPROM_PROTECT_EN();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 138
	clr1 0xFFF0E.0
	;***      139 : 
	;***      140 : 	//TODO: Start receive command from Raspberry Pi
	;***      141 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 141
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      142 : 
	;***      143 : 	//TODO: Start receive data from RS485
	;***      144 : 	O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 144
	clr1 0xFFF00.0
	;***      145 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	clrw ax
	;***      146 : 	uint8_t wts, vpcb, vpcb_v = 1;
	;***      147 : 	sendRS485(0xff, 82, 2, 12);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	push ax
	mov x, #0x0C
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      148 : 
	;***      149 : 	//TODO: Turn off Hand Sensor LED
	;***      150 : 	g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 150
	mov !LOWW(_g_pre_color), #0x03
	;***      151 : 	handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 151
	clrb a
	call !!_handSensorLED
	;***      152 : 
	;***      153 : 	//TODO: Set default washing mode
	;***      154 : 	g_machine_mode = HAND_WASHING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 154
	oneb !LOWW(_g_machine_mode)
	oneb a
	mov [sp+0x02], a
	mov [sp+0x01], a
	mov [sp+0x00], a
.BB@LABEL@3_1:	; bb212
	;***      155 : //    sendToRasPi_f(H_SET, OK_ALL, 0x0);
	;***      156 : 
	;***      157 : //TODO: Run Initialize Operation
	;***      158 : //    main_init_20211111();
	;***      159 : #ifdef TESTING_FIRMWARE
	;***      160 : 	uint8_t state = OFF;
	;***      161 : 	while (1) {
	;***      162 : 		if (ns_delay_ms(&g_Tick.tickCustom[2], 500)) {
	;***      163 : 			//    		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      164 : 			//					|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      165 : 			//				sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      166 : 			//						g_io_status.refined.FlowValue);
	;***      167 : 			//			}
	;***      168 : 			dac_out[0] += 13;
	;***      169 : 			CVCC_Current_Set(dac_out[0]);
	;***      170 : 			dac_out[1] += 13;
	;***      171 : 			Salt_Analog_Set(dac_out[1]);
	;***      172 : 		}
	;***      173 : 		if (ns_delay_ms(&g_Tick.tickCustom[3], 1000)) {
	;***      174 : 			O_HS_IDA_PIN = O_HS_ICL_PIN = O_SUPPLY_WATER_PIN_SV1 =
	;***      175 : 			O_CTRL_OUT_PIN = O_SPOUT_WATER_PIN_SV2 = O_PUMP_SALT_PIN_SP1 =
	;***      176 : 			O_ALK_PUMP_PIN_P2 = O_ACID_PUMP_PIN_P1 = O_PUMP_PRESS_PIN =
	;***      177 : 			O_ALARM_OUT_PIN = O_NEUTRALIZE_PIN_SV7 =
	;***      178 : 			O_DRAIN_ALK_PIN_SV6 = O_DRAIN_ACID_PIN_SV5 = O_SPOUT_ACID_PIN_SV3 =
	;***      179 : 			O_SPOUT_ALK_PIN_SV4 = O_CVCC_ON_PIN = O_CVCC_ALARM_RS =
	;***      180 : 			O_OPTION_2_PIN_SV8 = O_OPTION_3_PIN_SV9 = O_OPTION_1_BUZZER = state;
	;***      181 : 			state = ~state;
	;***      182 : 		}
	;***      183 : 		R_WDT_Restart();
	;***      184 : 	}
	;***      185 : #endif
	;***      186 : 	while (1U) {
	;***      187 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 187
	call !!_realTimeResponse
	;***      188 : 		main_loop_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 188
	call !!_main_loop_20211111
	;***      189 : 
	;***      190 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      191 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 191
	call !!_UpdateMachineStatus
	;***      192 : 		if (g_uart2_fault == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 192
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@3_3
.BB@LABEL@3_2:	; if_then_bb
	;***      193 : 			R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 193
	call !!_R_UART2_Stop
	;***      194 : 			delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 194
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      195 : 			R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 195
	call !!_R_UART2_Start
	;***      196 : 			g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 196
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@3_3:	; if_break_bb
	;***      197 : 		}
	;***      198 : 
	;***      199 : 		// Communication with WaterSoftener
	;***      200 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 200
	cmp0 !LOWW(_g_commnunication_flag+0x0000A)
	bz $.BB@LABEL@3_5
.BB@LABEL@3_4:	; if_then_bb23
	clrw ax
	;***      201 : 			sendRS485(0xff, 82, 2, 5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 201
	push ax
	mov x, #0x05
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      202 : //    		rx_count++;
	;***      203 : 			wts = 1; //Test flag = 1
	;***      204 : 			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 204
	clrb !LOWW(_g_commnunication_flag+0x0000A)
	oneb a
	mov [sp+0x00], a
.BB@LABEL@3_5:	; if_break_bb24
	;***      205 : 		}
	;***      206 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 206
	cmp !LOWW(_g_commnunication_flag+0x0000B), #0x01
	bnz $.BB@LABEL@3_9
.BB@LABEL@3_6:	; if_then_bb30
	;***      207 : 			// Sand to Water softener SV state
	;***      208 : 			sendRS485(0xff, 82, 24,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 208
	movw hl, #LOWW(_g_io_status+0x00001)
	onew bc
	bt [hl].0, $.BB@LABEL@3_8
.BB@LABEL@3_7:	; bb38
	decw bc
.BB@LABEL@3_8:	; bb39
	clrw ax
	push ax
	push bc
	mov c, #0x18
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      209 : 					(uint32_t) g_io_status.refined.io.Valve.SV1 == 1 ? 1 : 0);
	;***      210 : 			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 210
	clrb !LOWW(_g_commnunication_flag+0x0000B)
.BB@LABEL@3_9:	; if_break_bb43
	mov a, [sp+0x00]
	;***      211 : 		}
	;***      212 : 		// Test SV1 for Water Softener
	;***      213 : 		if (wts != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 213
	cmp0 a
	bnz $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_else_bb63
	;***      214 : 			if (ns_delay_ms(&g_Tick.tickWaterSoftenerPCB, 5000)) {
	;***      215 : 				if (wts == 1) {
	;***      216 : 					O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      217 : //					sendRS485(1, 82, 24,(uint32_t) 1);
	;***      218 : //					sendRS485(0xff, 82, 24,(uint32_t) 1);
	;***      219 : 					wts = 2;
	;***      220 : 				} else {
	;***      221 : 					O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***      222 : //    				sendRS485(1, 82, 24,(uint32_t) 0);
	;***      223 : //					sendRS485(0xff, 82, 24,(uint32_t) 0);
	;***      224 : 					wts = 0;
	;***      225 : 				}
	;***      226 : 			}
	;***      227 : 		} else {
	;***      228 : 			g_Tick.tickWaterSoftenerPCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 228
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00050), ax
	br $.BB@LABEL@3_15
.BB@LABEL@3_11:	; if_then_bb49
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 214
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x00050)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_15
.BB@LABEL@3_12:	; if_then_bb54
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	dec a
	bnz $.BB@LABEL@3_14
.BB@LABEL@3_13:	; if_then_bb60
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 216
	set1 0xFFF01.7
	mov [sp+0x00], #0x02
	br $.BB@LABEL@3_15
.BB@LABEL@3_14:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 221
	clr1 0xFFF01.7
	clrb a
	mov [sp+0x00], a
.BB@LABEL@3_15:	; if_break_bb65
	;***      229 : 		}
	;***      230 : 
	;***      231 : 		//Valve PCB
	;***      232 : 		if (g_commnunication_flag.rs485_send_to_valve_response_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 232
	cmp !LOWW(_g_commnunication_flag+0x0000C), #0x01
	bnz $.BB@LABEL@3_17
.BB@LABEL@3_16:	; if_then_bb71
	movw ax, sp
	addw ax, #0x0006
	movw [sp+0x04], ax
	;***      233 : 			// 0xff, 12, {Mode, Valve 1, Valve 2, Valve 3, 1}
	;***      234 : 			// 0 - Stand alone 1 - Control Valve
	;***      235 : 			uint8_t _b[5] = { vpcb_v, g_uart3_sendend % 2, g_systemTime % 2, 0,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 235
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1)
	call !!_memcpy
	mov a, [sp+0x02]
	mov [sp+0x06], a
	oneb a
	and a, !LOWW(_g_uart3_sendend)
	mov [sp+0x07], a
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	mov a, x
	and a, #0x01
	mov [sp+0x08], a
	movw ax, [sp+0x04]
	movw bc, ax
	;***      236 : 					1 };
	;***      237 : 			sendR485_7byte(0xff, 12, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 237
	movw ax, #0xFF0C
	call !!_sendR485_7byte
	;***      238 : 			vpcb++;
	;***      239 : 			g_commnunication_flag.rs485_send_to_valve_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 239
	clrb !LOWW(_g_commnunication_flag+0x0000C)
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 238
	inc a
	mov [sp+0x01], a
	br $.BB@LABEL@3_19
.BB@LABEL@3_17:	; if_else_bb89
	;***      240 : 		} else if (g_commnunication_flag.rs485_get_valve_gesture_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 240
	cmp !LOWW(_g_commnunication_flag+0x0000D), #0x01
	bnz $.BB@LABEL@3_19
.BB@LABEL@3_18:	; if_then_bb95
	movw ax, sp
	addw ax, #0x000B
	movw [sp+0x04], ax
	;***      241 : 			uint8_t _b[5] = { 0, 1, 0, 0, 1 };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 241
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1656)
	call !!_memcpy
	movw ax, [sp+0x04]
	movw bc, ax
	;***      242 : 			sendR485_7byte(0xff, 1, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 242
	movw ax, #0xFF01
	call !!_sendR485_7byte
	;***      243 : 			g_commnunication_flag.rs485_get_valve_gesture_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 243
	clrb !LOWW(_g_commnunication_flag+0x0000D)
.BB@LABEL@3_19:	; if_break_bb99
	mov a, [sp+0x01]
	;***      244 : 		}
	;***      245 : 
	;***      246 : 		if (vpcb != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 246
	cmp0 a
	bnz $.BB@LABEL@3_21
.BB@LABEL@3_20:	; if_else_bb123
	;***      247 : 			if (ns_delay_ms(&g_Tick.tickValvePCB, 5000)) {
	;***      248 : 				vpcb_v = vpcb_v == 1 ? 0 : 1;
	;***      249 : 				vpcb = 0;
	;***      250 : 			}
	;***      251 : 		} else {
	;***      252 : 			g_Tick.tickValvePCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 252
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	br $.BB@LABEL@3_24
.BB@LABEL@3_21:	; if_then_bb105
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 247
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x00054)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_24
.BB@LABEL@3_22:	; if_then_bb110
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 248
	dec a
	clrb a
	mov [sp+0x01], a
	bnz $.BB@LABEL@3_26
.BB@LABEL@3_23:	; if_then_bb110.if_break_bb125_crit_edge
	mov [sp+0x02], a
.BB@LABEL@3_24:	; if_break_bb125
	;***      253 : 		}
	;***      254 : 
	;***      255 : 		//RS485 fault check
	;***      256 : 		if (g_commnunication_flag.rs485_fault == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 256
	cmp !LOWW(_g_commnunication_flag+0x0000E), #0x01
	bnz $.BB@LABEL@3_27
.BB@LABEL@3_25:	; if_then_bb131
	;***      257 : 			R_UART3_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 257
	call !!_R_UART3_Stop
	;***      258 : 			g_commnunication_flag.rs485_fault++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 258
	inc !LOWW(_g_commnunication_flag+0x0000E)
	;***      259 : 			g_Tick.tickRS485 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 259
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
	br $.BB@LABEL@3_30
.BB@LABEL@3_26:	; bb116
	oneb a
	br $.BB@LABEL@3_23
.BB@LABEL@3_27:	; if_else_bb135
	;***      260 : 		} else if (g_commnunication_flag.rs485_fault == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 260
	cmp !LOWW(_g_commnunication_flag+0x0000E), #0x02
	bnz $.BB@LABEL@3_30
.BB@LABEL@3_28:	; if_then_bb141
	;***      261 : 			if (ns_delay_ms(&g_Tick.tickRS485, 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 261
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_30
.BB@LABEL@3_29:	; if_then_bb146
	;***      262 : 				R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 262
	call !!_R_UART3_Start
	;***      263 : 				R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 263
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      264 : 				g_commnunication_flag.rs485_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 264
	clrb !LOWW(_g_commnunication_flag+0x0000E)
.BB@LABEL@3_30:	; if_break_bb150
	;***      265 : 			}
	;***      266 : 		}
	;***      267 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      268 : //    	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	;***      269 : //    		P6_bit.no3 = ~P6_bit.no3;
	;***      270 : //    		O_SUPPLY_WATER_PIN_SV1 = ~O_SUPPLY_WATER_PIN_SV1;
	;***      271 : //    	}
	;***      272 : //    	if(g_machine_state.user == 1){
	;***      273 : //    		HandWashingMode_nostop();
	;***      274 : //    	}else{
	;***      275 : //    		g_Tick.tickCustom[1] = g_systemTime;
	;***      276 : //    	}
	;***      277 : 
	;***      278 : 		// Check
	;***      279 : 		flow_p = I_FLOW_PLUSE_PIN == 1 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 279
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_31:	; bb158
	clrb a
.BB@LABEL@3_32:	; bb160
	mov !LOWW(_flow_p), a
	;***      280 : 		if (ns_delay_ms(&g_Tick.tickCustom[1], 60000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 280
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick+0x00098)
	call !!_ns_delay_ms
	;***      281 : //    		if(O_SUPPLY_WATER_PIN_SV1 == ON){
	;***      282 : //				g_TickKeeper.SV1_ON_minutes++;
	;***      283 : //				g_TickKeeper.SV1_OFF_minutes = 0;
	;***      284 : //			}else{
	;***      285 : //				g_TickKeeper.SV1_OFF_minutes++;
	;***      286 : //				g_TickKeeper.SV1_ON_minutes = 0;
	;***      287 : //			}
	;***      288 : //			if(O_SPOUT_WATER_PIN_SV2 == ON){
	;***      289 : //				g_TickKeeper.SV2_ON_minutes++;
	;***      290 : //				g_TickKeeper.SV2_OFF_minutes = 0;
	;***      291 : //			}else{
	;***      292 : //				g_TickKeeper.SV2_OFF_minutes++;
	;***      293 : //				g_TickKeeper.SV2_ON_minutes = 0;
	;***      294 : //			}
	;***      295 : 		}
	;***      296 : 
	;***      297 : 		if (ns_delay_ms(&g_Tick.tick1s, 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 297
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_36
.BB@LABEL@3_33:	; if_then_bb174
	;***      298 : 
	;***      299 : 			led_st = led_st == 0 ? 0xff : 0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 299
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_34:	; bb180
	clrb a
.BB@LABEL@3_35:	; bb182
	mov !LOWW(_led_st), a
	;***      300 : 			uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 300
	mov a, !LOWW(_g_uart2_sendend)
	;***      301 : 			g_crc[6] = crc8_4((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 301
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      302 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      303 : 			g_crc[7] = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 303
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
.BB@LABEL@3_36:	; if_break_bb197
	;***      304 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      305 : //    	    switch (g_color) {
	;***      306 : //				case BLACK:
	;***      307 : //					g_color = RED;
	;***      308 : //					break;
	;***      309 : //				case RED:
	;***      310 : //					g_color = BLUE;
	;***      311 : //					break;
	;***      312 : //				case BLUE:
	;***      313 : //					g_color = WHITE;
	;***      314 : //					break;
	;***      315 : //				default:
	;***      316 : //					g_color = BLACK;
	;***      317 : //					break;
	;***      318 : //			}
	;***      319 : 			if (led_st == 0x00) {
	;***      320 : 
	;***      321 : //    			O_CVCC_ON_PIN = ON;
	;***      322 : //    			O_HS_ICL_PIN = 0;
	;***      323 : //    			O_HS_IDA_PIN = 1;
	;***      324 : //    			handSensorLED(RED);
	;***      325 : //    			O_CVCC_ALARM_RS = 1;
	;***      326 : //    			O_PUMP_SALT_PIN = ON;
	;***      327 : //    			electrolyticOperationON();
	;***      328 : //    			g_io_status.refined.Valve.SV4 = 1;
	;***      329 : //				g_io_status.refined.Pump2 = 1;
	;***      330 : //				g_io_status.refined.Valve.SV5 = 0;
	;***      331 : //				g_io_status.refined.Pump1 = 0;
	;***      332 : //				g_io_status.refined.SaltLowLevel = 1;
	;***      333 : //    			e_send[0]++;
	;***      334 : //    			g_numberSetting.upperVoltage1++;
	;***      335 : //    			g_numberSetting.crc--;
	;***      336 : //    			g_numberSetting.crc2++;
	;***      337 : //    			g_numberSetting.lowerFlow++;
	;***      338 : //    			g_numberSetting.hello++;
	;***      339 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
	;***      340 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting.crc, 0x800, 6);
	;***      341 : //    			EE_SPI_Write((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
	;***      342 : 			} else {
	;***      343 : //    			O_CVCC_ON_PIN = OFF;
	;***      344 : //    			O_HS_ICL_PIN = 1;
	;***      345 : //				O_HS_IDA_PIN = 0;
	;***      346 : //    			handSensorLED(WHITE);
	;***      347 : //    			O_CVCC_ALARM_RS = 0;
	;***      348 : //    			O_PUMP_SALT_PIN = OFF;
	;***      349 : //    			electrolyticOperationOFF();
	;***      350 : //    			g_io_status.refined.Valve.SV4 = 0;
	;***      351 : //				g_io_status.refined.Pump2 = 0;
	;***      352 : //				g_io_status.refined.Valve.SV5 = 1;
	;***      353 : //				g_io_status.refined.Pump1 = 1;
	;***      354 : //				g_io_status.refined.SaltLowLevel = 0;
	;***      355 : //    			EE_SPI_Read((uint8_t *)&ret_number_setting, 0x000, sizeof(g_numberSetting));
	;***      356 : 
	;***      357 : 			}
	;***      358 : 		}
	;***      359 : 
	;***      360 : //--------------------------------End testing code---------------------------------------------------------
	;***      361 : //    	if(g_machine_state.mode == BUSY){
	;***      362 : //    		g_machine_state.user = 0;
	;***      363 : //    		if(ns_delay_ms(&g_Tick.tickDebouceHandSensor, g_timerSetting.t55_waterDischargeDelay_s*1000)){
	;***      364 : //    			g_machine_state.mode = INDIE;
	;***      365 : //    		}
	;***      366 : //    	}else{
	;***      367 : //    		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      368 : //    	}
	;***      369 : 
	;***      370 : 		if ((g_machine_state.mode == WATER_WASHING)
	;***      371 : 				| (g_machine_state.mode == INDIE)) {
	;***      372 : //			nostop_WaterWashingMode();
	;***      373 : 		}
	;***      374 : //    	InitialOperationModeStart();
	;***      375 : 
	;***      376 : //    	if(g_color != g_pre_color){
	;***      377 : //			O_RS485_MODE_PIN = 1U;
	;***      378 : //			uint8_t _uart3 = g_uart3_sendend;
	;***      379 : //			send_buf[3]++;
	;***      380 : //			R_UART3_Send(send_buf, 7);
	;***      381 : //			while(_uart3 == g_uart3_sendend);
	;***      382 : //			O_RS485_MODE_PIN = 0U;
	;***      383 : //    	}
	;***      384 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 384
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      385 : 	}
	;***      386 : 	/* End user code. Do not edit comment generated here */
	;***      387 : }
	;***      388 : 
	;***      389 : /***********************************************************************************************************************
	;***      390 :  * Function Name: R_MAIN_UserInit
	;***      391 :  * Description  : This function adds user code before implementing main function.
	;***      392 :  * Arguments    : None
	;***      393 :  * Return Value : None
	;***      394 :  ***********************************************************************************************************************/
	;***      395 : void R_MAIN_UserInit(void) {
	;***      396 : 	/* Start user code. Do not edit comment generated here */
	;***      397 : 	EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 397
	ei
	;***      398 : 	R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 398
	call !!_R_TAU0_Create
	;***      399 : 	R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 399
	call !!_R_SAU0_Create
	;***      400 : 	R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 400
	call !!_R_SAU1_Create
	;***      401 : 	R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 401
	call !!_R_UART1_Create
	;***      402 : 	R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 402
	call !!_R_UART2_Create
	;***      403 : 	R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 403
	call !!_R_UART3_Create
	;***      404 : 	R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 404
	call !!_R_RTC_Create
	;***      405 : 	R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 405
	call !!_R_PORT_Create_UserInit
	;***      406 : 	R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 406
	call !!_R_CSI01_Create
	;***      407 : 	R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 407
	call !!_R_CSI00_Create
	;***      408 : 
	;***      409 : 	R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 409
	call !!_R_TAU0_Channel0_Start
	;***      410 : 	R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 410
	call !!_R_UART3_Start
	;***      411 : 	R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 411
	call !!_R_UART1_Start
	;***      412 : 	R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 412
	call !!_R_UART2_Start
	;***      413 : 	R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 413
	call !!_R_CSI00_Start
	;***      414 : //    R_CSI01_Start();
	;***      415 : 
	;***      416 : 	R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 416
	call !!_R_ADC_Create
	;***      417 : 	R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 417
	call !!_R_ADC_Set_OperationOn
	;***      418 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 418
	call !!_R_ADC_Start
	;***      419 : 
	;***      420 : 	R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 420
	call !!_R_DAC_Create
	;***      421 : 	CVCC_Current_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 421
	clrb a
	call !!_R_DAC0_Set_ConversionValue
	;***      422 : 	Salt_Analog_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 422
	clrb a
	call !!_R_DAC1_Set_ConversionValue
	;***      423 : 	R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 423
	call !!_R_DAC0_Start
	;***      424 : 	R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 424
	br !!_R_DAC1_Start
	;***      425 : 	/* End user code. Do not edit comment generated here */
	;***      426 : }
	;***      427 : 
	;***      428 : /* Start user code for adding. Do not edit comment generated here */
	;***      429 : /* End user code. Do not edit comment generated here */
	.SECTION .data,DATA
	.ALIGN 2
_g_adc_ch:
	.DS (2)
_led_st:
	.DB 0xFF
_send_data:
	.DB 0x23,0xAB
_this_size:
	.DB 0x12
_this_size_2:
	.DB 0x12
_send_buf:
	.DB 0x08,0x01,0x02,0x03,0x04,0x05,0x06
	.ALIGN 2
_data_crc:
	.DB4 0x00007724,0x0000EB28
_dac_out:
	.DB 0xFF,0xFF
	.SECTION .bss,BSS
_g_e_status:
	.DS (1)
	.ALIGN 2
_ret_number_setting:
	.DS (38)
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
	.DS (38)
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
_g_control_buffer_f:
	.DS (6)
	.ALIGN 2
_g_control_buffer_u32:
	.DS (6)
_handsensor_status:
	.DS (1)
_g_handsensor_status:
	.DS (2)
_g_crc:
	.DS (8)
	.ALIGN 2
_g_crc_32:
	.DS (32)
_rx_count:
	.DS (1)
	.SECTION .const,CONST
.STR@1:
	.DS (4)
	.DB 0x01
.STR@1656:
	.DS (1)
	.DB 0x01
	.DS (2)
	.DB 0x01
