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
#@  compiled at Fri Feb 25 09:28:40 2022

	.EXTERN _g_color
	.EXTERN _g_pre_color
	.EXTERN __settingTime
	.EXTERN __settingNumber
	.EXTERN _g_test_control
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
	.EXTERN _main_init_20211111
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
	movw ax, #LOWW(_g_Tick+0x00090)
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
	clrw ax
	;***      135 : 			timeSettingSize);
	;***      136 : 	EE_SPI_Read((uint8_t*) &g_test_control.data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 136
	push ax
	incw ax
	push ax
	movw bc, #0x0025
	movw ax, #LOWW(_g_test_control)
	call !!_EE_SPI_Read
	addw sp, #0x04
	;***      137 : 			NUMBER_SETTING_ADDRESS + numberSettingSize, sizeof(g_test_control.data));
	;***      138 : 	_settingNumber = g_numberSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 138
	movw de, #0x0026
	movw bc, #LOWW(_g_numberSetting)
	movw ax, #LOWW(__settingNumber)
	call !!_memcpy
	;***      139 : 	_settingTime = g_timerSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 139
	movw de, #0x0096
	movw bc, #LOWW(_g_timerSetting)
	movw ax, #LOWW(__settingTime)
	call !!_memcpy
	;***      140 : 	EEPROM_PROTECT_EN();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 140
	clr1 0xFFF0E.0
	;***      141 : 
	;***      142 : 	//TODO: Start receive command from Raspberry Pi
	;***      143 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      144 : 
	;***      145 : 	//TODO: Start receive data from RS485
	;***      146 : 	O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 146
	clr1 0xFFF00.0
	;***      147 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	clrw ax
	;***      148 : 	uint8_t wts, vpcb, vpcb_v = 1;
	;***      149 : 	sendRS485(0xff, 82, 2, 12);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 149
	push ax
	mov x, #0x0C
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      150 : 
	;***      151 : 	//TODO: Turn off Hand Sensor LED
	;***      152 : 	g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 152
	mov !LOWW(_g_pre_color), #0x03
	;***      153 : 	handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 153
	clrb a
	call !!_handSensorLED
	movw hl, #LOWW(_g_test_control)
	;***      154 : 
	;***      155 : 	//TODO: Set default washing mode
	;***      156 : 	g_machine_mode = HAND_WASHING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 156
	oneb !LOWW(_g_machine_mode)
	;***      157 : //    sendToRasPi_f(H_SET, OK_ALL, 0x0);
	;***      158 : 
	;***      159 : //TODO: Run Initialize Operation
	;***      160 : 	if(g_test_control.raw.power_on == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 160
	.bt [hl].1, $!.BB@LABEL@3_12
.BB@LABEL@3_1:	; entry.bb224_crit_edge
	oneb a
	mov [sp+0x02], a
	mov [sp+0x01], a
	mov [sp+0x00], a
.BB@LABEL@3_2:	; bb224
	;***      161 : 		main_init_20211111();
	;***      162 : 	}
	;***      163 : 
	;***      164 : #ifdef TESTING_FIRMWARE
	;***      165 : 	uint8_t state = OFF;
	;***      166 : 	while (1) {
	;***      167 : 		if (ns_delay_ms(&g_Tick.tickCustom[2], 500)) {
	;***      168 : 			//    		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      169 : 			//					|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      170 : 			//				sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      171 : 			//						g_io_status.refined.FlowValue);
	;***      172 : 			//			}
	;***      173 : 			dac_out[0] += 13;
	;***      174 : 			CVCC_Current_Set(dac_out[0]);
	;***      175 : 			dac_out[1] += 13;
	;***      176 : 			Salt_Analog_Set(dac_out[1]);
	;***      177 : 		}
	;***      178 : 		if (ns_delay_ms(&g_Tick.tickCustom[3], 1000)) {
	;***      179 : 			O_HS_IDA_PIN = O_HS_ICL_PIN = O_SUPPLY_WATER_PIN_SV1 =
	;***      180 : 			O_CTRL_OUT_PIN = O_SPOUT_WATER_PIN_SV2 = O_PUMP_SALT_PIN_SP1 =
	;***      181 : 			O_ALK_PUMP_PIN_P2 = O_ACID_PUMP_PIN_P1 = O_PUMP_PRESS_PIN =
	;***      182 : 			O_ALARM_OUT_PIN = O_NEUTRALIZE_PIN_SV7 =
	;***      183 : 			O_DRAIN_ALK_PIN_SV6 = O_DRAIN_ACID_PIN_SV5 = O_SPOUT_ACID_PIN_SV3 =
	;***      184 : 			O_SPOUT_ALK_PIN_SV4 = O_CVCC_ON_PIN = O_CVCC_ALARM_RS =
	;***      185 : 			O_OPTION_2_PIN_SV8 = O_OPTION_3_PIN_SV9 = O_OPTION_1_BUZZER = state;
	;***      186 : 			state = ~state;
	;***      187 : 		}
	;***      188 : 		R_WDT_Restart();
	;***      189 : 	}
	;***      190 : #endif
	;***      191 : 	while (1U) {
	;***      192 : 
	;***      193 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 193
	call !!_realTimeResponse
	;***      194 : 		main_loop_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 194
	call !!_main_loop_20211111
	;***      195 : 
	;***      196 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 196
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      197 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 197
	call !!_UpdateMachineStatus
	;***      198 : 		if (g_uart2_fault == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 198
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@3_4
.BB@LABEL@3_3:	; if_then_bb28
	;***      199 : 			R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 199
	call !!_R_UART2_Stop
	;***      200 : 			delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 200
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      201 : 			R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 201
	call !!_R_UART2_Start
	;***      202 : 			g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 202
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@3_4:	; if_break_bb29
	;***      203 : 		}
	;***      204 : 
	;***      205 : 		// Communication with WaterSoftener
	;***      206 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 206
	cmp0 !LOWW(_g_commnunication_flag+0x0000A)
	bz $.BB@LABEL@3_6
.BB@LABEL@3_5:	; if_then_bb35
	clrw ax
	;***      207 : 			sendRS485(0xff, 82, 2, 5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 207
	push ax
	mov x, #0x05
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      208 : //    		rx_count++;
	;***      209 : 			wts = 1; //Test flag = 1
	;***      210 : 			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 210
	clrb !LOWW(_g_commnunication_flag+0x0000A)
	oneb a
	mov [sp+0x00], a
.BB@LABEL@3_6:	; if_break_bb36
	;***      211 : 		}
	;***      212 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 212
	cmp !LOWW(_g_commnunication_flag+0x0000B), #0x01
	bnz $.BB@LABEL@3_10
.BB@LABEL@3_7:	; if_then_bb42
	;***      213 : 			// Sand to Water softener SV state
	;***      214 : 			sendRS485(0xff, 82, 24,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 214
	movw hl, #LOWW(_g_io_status+0x00001)
	onew bc
	bt [hl].0, $.BB@LABEL@3_9
.BB@LABEL@3_8:	; bb50
	decw bc
.BB@LABEL@3_9:	; bb51
	clrw ax
	push ax
	push bc
	mov c, #0x18
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      215 : 					(uint32_t) g_io_status.refined.io.Valve.SV1 == 1 ? 1 : 0);
	;***      216 : 			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 216
	clrb !LOWW(_g_commnunication_flag+0x0000B)
.BB@LABEL@3_10:	; if_break_bb55
	mov a, [sp+0x00]
	;***      217 : 		}
	;***      218 : 		// Test SV1 for Water Softener
	;***      219 : 		if (wts != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 219
	cmp0 a
	bnz $.BB@LABEL@3_13
.BB@LABEL@3_11:	; if_else_bb75
	;***      220 : 			if (ns_delay_ms(&g_Tick.tickWaterSoftenerPCB, 5000)) {
	;***      221 : 				if (wts == 1) {
	;***      222 : 					O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      223 : //					sendRS485(1, 82, 24,(uint32_t) 1);
	;***      224 : //					sendRS485(0xff, 82, 24,(uint32_t) 1);
	;***      225 : 					wts = 2;
	;***      226 : 				} else {
	;***      227 : 					O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***      228 : //    				sendRS485(1, 82, 24,(uint32_t) 0);
	;***      229 : //					sendRS485(0xff, 82, 24,(uint32_t) 0);
	;***      230 : 					wts = 0;
	;***      231 : 				}
	;***      232 : 			}
	;***      233 : 		} else {
	;***      234 : 			g_Tick.tickWaterSoftenerPCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 234
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00050), ax
	br $.BB@LABEL@3_17
.BB@LABEL@3_12:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 161
	call !!_main_init_20211111
	br $!.BB@LABEL@3_1
.BB@LABEL@3_13:	; if_then_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 220
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x00050)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_17
.BB@LABEL@3_14:	; if_then_bb66
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 221
	dec a
	bnz $.BB@LABEL@3_16
.BB@LABEL@3_15:	; if_then_bb72
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 222
	set1 0xFFF01.7
	mov [sp+0x00], #0x02
	br $.BB@LABEL@3_17
.BB@LABEL@3_16:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 227
	clr1 0xFFF01.7
	clrb a
	mov [sp+0x00], a
.BB@LABEL@3_17:	; if_break_bb77
	;***      235 : 		}
	;***      236 : 
	;***      237 : 		//Valve PCB
	;***      238 : 		if (g_commnunication_flag.rs485_send_to_valve_response_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 238
	cmp !LOWW(_g_commnunication_flag+0x0000C), #0x01
	bnz $.BB@LABEL@3_19
.BB@LABEL@3_18:	; if_then_bb83
	movw ax, sp
	addw ax, #0x0006
	movw [sp+0x04], ax
	;***      239 : 			// 0xff, 12, {Mode, Valve 1, Valve 2, Valve 3, 1}
	;***      240 : 			// 0 - Stand alone 1 - Control Valve
	;***      241 : 			uint8_t _b[5] = { vpcb_v, g_uart3_sendend % 2, g_systemTime % 2, 0,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 241
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
	;***      242 : 					1 };
	;***      243 : 			sendR485_7byte(0xff, 12, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 243
	movw ax, #0xFF0C
	call !!_sendR485_7byte
	;***      244 : 			vpcb++;
	;***      245 : 			g_commnunication_flag.rs485_send_to_valve_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 245
	clrb !LOWW(_g_commnunication_flag+0x0000C)
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 244
	inc a
	mov [sp+0x01], a
	br $.BB@LABEL@3_21
.BB@LABEL@3_19:	; if_else_bb101
	;***      246 : 		} else if (g_commnunication_flag.rs485_get_valve_gesture_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 246
	cmp !LOWW(_g_commnunication_flag+0x0000D), #0x01
	bnz $.BB@LABEL@3_21
.BB@LABEL@3_20:	; if_then_bb107
	movw ax, sp
	addw ax, #0x000B
	movw [sp+0x04], ax
	;***      247 : 			uint8_t _b[5] = { 0, 1, 0, 0, 1 };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 247
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1683)
	call !!_memcpy
	movw ax, [sp+0x04]
	movw bc, ax
	;***      248 : 			sendR485_7byte(0xff, 1, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 248
	movw ax, #0xFF01
	call !!_sendR485_7byte
	;***      249 : 			g_commnunication_flag.rs485_get_valve_gesture_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 249
	clrb !LOWW(_g_commnunication_flag+0x0000D)
.BB@LABEL@3_21:	; if_break_bb111
	mov a, [sp+0x01]
	;***      250 : 		}
	;***      251 : 
	;***      252 : 		if (vpcb != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 252
	cmp0 a
	bnz $.BB@LABEL@3_23
.BB@LABEL@3_22:	; if_else_bb135
	;***      253 : 			if (ns_delay_ms(&g_Tick.tickValvePCB, 5000)) {
	;***      254 : 				vpcb_v = vpcb_v == 1 ? 0 : 1;
	;***      255 : 				vpcb = 0;
	;***      256 : 			}
	;***      257 : 		} else {
	;***      258 : 			g_Tick.tickValvePCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 258
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	br $.BB@LABEL@3_26
.BB@LABEL@3_23:	; if_then_bb117
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 253
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x00054)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_26
.BB@LABEL@3_24:	; if_then_bb122
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 254
	dec a
	clrb a
	mov [sp+0x01], a
	bnz $.BB@LABEL@3_28
.BB@LABEL@3_25:	; if_then_bb122.if_break_bb137_crit_edge
	mov [sp+0x02], a
.BB@LABEL@3_26:	; if_break_bb137
	;***      259 : 		}
	;***      260 : 
	;***      261 : 		//RS485 fault check
	;***      262 : 		if (g_commnunication_flag.rs485_fault == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 262
	cmp !LOWW(_g_commnunication_flag+0x0000E), #0x01
	bnz $.BB@LABEL@3_29
.BB@LABEL@3_27:	; if_then_bb143
	;***      263 : 			R_UART3_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 263
	call !!_R_UART3_Stop
	;***      264 : 			g_commnunication_flag.rs485_fault++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 264
	inc !LOWW(_g_commnunication_flag+0x0000E)
	;***      265 : 			g_Tick.tickRS485 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 265
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
	br $.BB@LABEL@3_32
.BB@LABEL@3_28:	; bb128
	oneb a
	br $.BB@LABEL@3_25
.BB@LABEL@3_29:	; if_else_bb147
	;***      266 : 		} else if (g_commnunication_flag.rs485_fault == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 266
	cmp !LOWW(_g_commnunication_flag+0x0000E), #0x02
	bnz $.BB@LABEL@3_32
.BB@LABEL@3_30:	; if_then_bb153
	;***      267 : 			if (ns_delay_ms(&g_Tick.tickRS485, 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 267
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_32
.BB@LABEL@3_31:	; if_then_bb158
	;***      268 : 				R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 268
	call !!_R_UART3_Start
	;***      269 : 				R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 269
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      270 : 				g_commnunication_flag.rs485_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 270
	clrb !LOWW(_g_commnunication_flag+0x0000E)
.BB@LABEL@3_32:	; if_break_bb162
	;***      271 : 			}
	;***      272 : 		}
	;***      273 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      274 : //    	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	;***      275 : //    		P6_bit.no3 = ~P6_bit.no3;
	;***      276 : //    		O_SUPPLY_WATER_PIN_SV1 = ~O_SUPPLY_WATER_PIN_SV1;
	;***      277 : //    	}
	;***      278 : //    	if(g_machine_state.user == 1){
	;***      279 : //    		HandWashingMode_nostop();
	;***      280 : //    	}else{
	;***      281 : //    		g_Tick.tickCustom[1] = g_systemTime;
	;***      282 : //    	}
	;***      283 : 
	;***      284 : 		// Check
	;***      285 : 		flow_p = I_FLOW_PLUSE_PIN == 1 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 285
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_33:	; bb170
	clrb a
.BB@LABEL@3_34:	; bb172
	mov !LOWW(_flow_p), a
	;***      286 : 		if (ns_delay_ms(&g_Tick.tickCustom[1], 60000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 286
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick+0x0009C)
	call !!_ns_delay_ms
	;***      287 : //    		if(O_SUPPLY_WATER_PIN_SV1 == ON){
	;***      288 : //				g_TickKeeper.SV1_ON_minutes++;
	;***      289 : //				g_TickKeeper.SV1_OFF_minutes = 0;
	;***      290 : //			}else{
	;***      291 : //				g_TickKeeper.SV1_OFF_minutes++;
	;***      292 : //				g_TickKeeper.SV1_ON_minutes = 0;
	;***      293 : //			}
	;***      294 : //			if(O_SPOUT_WATER_PIN_SV2 == ON){
	;***      295 : //				g_TickKeeper.SV2_ON_minutes++;
	;***      296 : //				g_TickKeeper.SV2_OFF_minutes = 0;
	;***      297 : //			}else{
	;***      298 : //				g_TickKeeper.SV2_OFF_minutes++;
	;***      299 : //				g_TickKeeper.SV2_ON_minutes = 0;
	;***      300 : //			}
	;***      301 : 		}
	;***      302 : 
	;***      303 : 		if (ns_delay_ms(&g_Tick.tick1s, 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 303
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_38
.BB@LABEL@3_35:	; if_then_bb186
	;***      304 : 
	;***      305 : 			led_st = led_st == 0 ? 0xff : 0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 305
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_36:	; bb192
	clrb a
.BB@LABEL@3_37:	; bb194
	mov !LOWW(_led_st), a
	;***      306 : 			uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 306
	mov a, !LOWW(_g_uart2_sendend)
	;***      307 : 			g_crc[6] = crc8_4((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 307
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      308 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      309 : 			g_crc[7] = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 309
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
.BB@LABEL@3_38:	; if_break_bb209
	;***      310 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      311 : //    	    switch (g_color) {
	;***      312 : //				case BLACK:
	;***      313 : //					g_color = RED;
	;***      314 : //					break;
	;***      315 : //				case RED:
	;***      316 : //					g_color = BLUE;
	;***      317 : //					break;
	;***      318 : //				case BLUE:
	;***      319 : //					g_color = WHITE;
	;***      320 : //					break;
	;***      321 : //				default:
	;***      322 : //					g_color = BLACK;
	;***      323 : //					break;
	;***      324 : //			}
	;***      325 : 			if (led_st == 0x00) {
	;***      326 : 
	;***      327 : //    			O_CVCC_ON_PIN = ON;
	;***      328 : //    			O_HS_ICL_PIN = 0;
	;***      329 : //    			O_HS_IDA_PIN = 1;
	;***      330 : //    			handSensorLED(RED);
	;***      331 : //    			O_CVCC_ALARM_RS = 1;
	;***      332 : //    			O_PUMP_SALT_PIN = ON;
	;***      333 : //    			electrolyticOperationON();
	;***      334 : //    			g_io_status.refined.Valve.SV4 = 1;
	;***      335 : //				g_io_status.refined.Pump2 = 1;
	;***      336 : //				g_io_status.refined.Valve.SV5 = 0;
	;***      337 : //				g_io_status.refined.Pump1 = 0;
	;***      338 : //				g_io_status.refined.SaltLowLevel = 1;
	;***      339 : //    			e_send[0]++;
	;***      340 : //    			g_numberSetting.upperVoltage1++;
	;***      341 : //    			g_numberSetting.crc--;
	;***      342 : //    			g_numberSetting.crc2++;
	;***      343 : //    			g_numberSetting.lowerFlow++;
	;***      344 : //    			g_numberSetting.hello++;
	;***      345 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
	;***      346 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting.crc, 0x800, 6);
	;***      347 : //    			EE_SPI_Write((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
	;***      348 : 			} else {
	;***      349 : //    			O_CVCC_ON_PIN = OFF;
	;***      350 : //    			O_HS_ICL_PIN = 1;
	;***      351 : //				O_HS_IDA_PIN = 0;
	;***      352 : //    			handSensorLED(WHITE);
	;***      353 : //    			O_CVCC_ALARM_RS = 0;
	;***      354 : //    			O_PUMP_SALT_PIN = OFF;
	;***      355 : //    			electrolyticOperationOFF();
	;***      356 : //    			g_io_status.refined.Valve.SV4 = 0;
	;***      357 : //				g_io_status.refined.Pump2 = 0;
	;***      358 : //				g_io_status.refined.Valve.SV5 = 1;
	;***      359 : //				g_io_status.refined.Pump1 = 1;
	;***      360 : //				g_io_status.refined.SaltLowLevel = 0;
	;***      361 : //    			EE_SPI_Read((uint8_t *)&ret_number_setting, 0x000, sizeof(g_numberSetting));
	;***      362 : 
	;***      363 : 			}
	;***      364 : 		}
	;***      365 : 
	;***      366 : //--------------------------------End testing code---------------------------------------------------------
	;***      367 : //    	if(g_machine_state.mode == BUSY){
	;***      368 : //    		g_machine_state.user = 0;
	;***      369 : //    		if(ns_delay_ms(&g_Tick.tickDebouceHandSensor, g_timerSetting.t55_waterDischargeDelay_s*1000)){
	;***      370 : //    			g_machine_state.mode = INDIE;
	;***      371 : //    		}
	;***      372 : //    	}else{
	;***      373 : //    		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      374 : //    	}
	;***      375 : 
	;***      376 : 		if ((g_machine_state.mode == WATER_WASHING)
	;***      377 : 				| (g_machine_state.mode == INDIE)) {
	;***      378 : //			nostop_WaterWashingMode();
	;***      379 : 		}
	;***      380 : //    	InitialOperationModeStart();
	;***      381 : 
	;***      382 : //    	if(g_color != g_pre_color){
	;***      383 : //			O_RS485_MODE_PIN = 1U;
	;***      384 : //			uint8_t _uart3 = g_uart3_sendend;
	;***      385 : //			send_buf[3]++;
	;***      386 : //			R_UART3_Send(send_buf, 7);
	;***      387 : //			while(_uart3 == g_uart3_sendend);
	;***      388 : //			O_RS485_MODE_PIN = 0U;
	;***      389 : //    	}
	;***      390 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 390
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_2
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      391 : 	}
	;***      392 : 	/* End user code. Do not edit comment generated here */
	;***      393 : }
	;***      394 : 
	;***      395 : /***********************************************************************************************************************
	;***      396 :  * Function Name: R_MAIN_UserInit
	;***      397 :  * Description  : This function adds user code before implementing main function.
	;***      398 :  * Arguments    : None
	;***      399 :  * Return Value : None
	;***      400 :  ***********************************************************************************************************************/
	;***      401 : void R_MAIN_UserInit(void) {
	;***      402 : 	/* Start user code. Do not edit comment generated here */
	;***      403 : 	EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 403
	ei
	;***      404 : 	R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 404
	call !!_R_TAU0_Create
	;***      405 : 	R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 405
	call !!_R_SAU0_Create
	;***      406 : 	R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 406
	call !!_R_SAU1_Create
	;***      407 : 	R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 407
	call !!_R_UART1_Create
	;***      408 : 	R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 408
	call !!_R_UART2_Create
	;***      409 : 	R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 409
	call !!_R_UART3_Create
	;***      410 : 	R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 410
	call !!_R_RTC_Create
	;***      411 : 	R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 411
	call !!_R_PORT_Create_UserInit
	;***      412 : 	R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 412
	call !!_R_CSI01_Create
	;***      413 : 	R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 413
	call !!_R_CSI00_Create
	;***      414 : 
	;***      415 : 	R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 415
	call !!_R_TAU0_Channel0_Start
	;***      416 : 	R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 416
	call !!_R_UART3_Start
	;***      417 : 	R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 417
	call !!_R_UART1_Start
	;***      418 : 	R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 418
	call !!_R_UART2_Start
	;***      419 : 	R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 419
	call !!_R_CSI00_Start
	;***      420 : //    R_CSI01_Start();
	;***      421 : 
	;***      422 : 	R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 422
	call !!_R_ADC_Create
	;***      423 : 	R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 423
	call !!_R_ADC_Set_OperationOn
	;***      424 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 424
	call !!_R_ADC_Start
	;***      425 : 
	;***      426 : 	R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 426
	call !!_R_DAC_Create
	;***      427 : 	CVCC_Current_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 427
	clrb a
	call !!_R_DAC0_Set_ConversionValue
	;***      428 : 	Salt_Analog_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 428
	clrb a
	call !!_R_DAC1_Set_ConversionValue
	;***      429 : 	R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 429
	call !!_R_DAC0_Start
	;***      430 : 	R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 430
	br !!_R_DAC1_Start
	;***      431 : 	/* End user code. Do not edit comment generated here */
	;***      432 : }
	;***      433 : 
	;***      434 : /* Start user code for adding. Do not edit comment generated here */
	;***      435 : /* End user code. Do not edit comment generated here */
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
.STR@1683:
	.DS (1)
	.DB 0x01
	.DS (2)
	.DB 0x01
