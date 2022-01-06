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
#@  compiled at Thu Jan 06 15:40:38 2022

	.EXTERN __settingTime
	.EXTERN __settingNumber
	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_io_status
	.EXTERN _g_Tick
	.EXTERN _commnunication_flag
	.EXTERN _g_machine_mode
	.EXTERN _g_systemTime
	.EXTERN _g_csi_rev_end
	.EXTERN _g_uart2_fault
	.EXTERN _g_uart2_sendend
	.EXTERN _g_uart3_sendend
	.EXTERN _g_rx_data
	.EXTERN _g_uart3_rx_data
	.EXTERN _g_color
	.EXTERN _g_pre_color
	.PUBLIC _g_error
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
	.EXTERN _R_DAC0_Set_ConversionValue
	.EXTERN _R_DAC1_Set_ConversionValue
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
	.EXTERN _R_DAC0_Start
	.EXTERN _R_DAC1_Start

	.SECTION .textf,TEXTF
_nostop_checkHandSensor:
	.STACK _nostop_checkHandSensor = 4
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
	;***       46 : #include "main.h"
	;***       47 : /* End user code. Do not edit comment generated here */
	;***       48 : #include "r_cg_userdefine.h"
	;***       49 : 
	;***       50 : /***********************************************************************************************************************
	;***       51 : Pragma directive
	;***       52 : ***********************************************************************************************************************/
	;***       53 : /* Start user code for pragma. Do not edit comment generated here */
	;***       54 : #define CVCC_Current_Set(a) R_DAC0_Set_ConversionValue(a)
	;***       55 : #define Salt_Analog_Set(a) R_DAC1_Set_ConversionValue(a)
	;***       56 : /* End user code. Do not edit comment generated here */
	;***       57 : 
	;***       58 : /***********************************************************************************************************************
	;***       59 : Global variables and functions
	;***       60 : ***********************************************************************************************************************/
	;***       61 : /* Start user code for global. Do not edit comment generated here */
	;***       62 : volatile int g_error = 0;
	;***       63 : volatile int g_adc_ch = 0;
	;***       64 : union EEPROM_status_u g_e_status;
	;***       65 : struct Number_Setting_s ret_number_setting;
	;***       66 : uint8_t led_st = 0xff;
	;***       67 : uint8_t flow_p, salt_h_p;
	;***       68 : uint8_t g_eeprom_wren;
	;***       69 : uint8_t send_data[2] = { 0x23, 0xab};
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
	;***       80 : 	struct{
	;***       81 : 		uint8_t up_signal;
	;***       82 : 	};
	;***       83 : 	uint8_t status;
	;***       84 : }handsensor_status;
	;***       85 : uint8_t g_handsensor_status[2];
	;***       86 : void nostop_checkHandSensor(void){
	;***       87 : 	if(DETECT_U == I_ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 87
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_5
.BB@LABEL@1_1:	; if_then_bb
	;***       88 : 		if(ns_delay_ms(&g_Tick.tickHandSensor[0], 500)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 88
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00080)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@1_9
.BB@LABEL@1_2:	; if_then_bb10
	;***       89 : 			g_handsensor_status[0] = g_handsensor_status[0] == 0? 1:0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 89
	cmp0 !LOWW(_g_handsensor_status)
	oneb a
	skz
.BB@LABEL@1_3:	; bb15
	clrb a
.BB@LABEL@1_4:	; bb16
	mov !LOWW(_g_handsensor_status), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 98
	ret
.BB@LABEL@1_5:	; if_else_bb
	;***       90 : 		}
	;***       91 : 	}else if(DETECT_D == I_ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 91
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@1_7
.BB@LABEL@1_6:	; if_then_bb27
	;***       92 : 		g_handsensor_status[1] = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 92
	oneb !LOWW(_g_handsensor_status+0x00001)
	ret
.BB@LABEL@1_7:	; if_else_bb28
	;***       93 : 	}else if(DETECT_U == I_OFF){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 93
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_9
.BB@LABEL@1_8:	; if_else_bb37
	;***       94 : 
	;***       95 : 	}else if(DETECT_D == I_OFF){
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
	;***       99 : uint8_t readHS(void){
	;***      100 :    if(DETECT_U){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 100
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@2_2
.BB@LABEL@2_1:	; bb18
	;***      101 : 	  delay_ms(2);
	;***      102 :       if(DETECT_U) return 1;return 0;
	;***      103 :    }else return 0;
	;***      104 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 104
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
	;***      105 : uint8_t this_size = sizeof(g_io_status);
	;***      106 : uint8_t this_size_2 = sizeof(union IO_Status_u);
	;***      107 : uint8_t send_buf[7] = {8,1,2,3,4,5,6};
	;***      108 : char g_crc[8];
	;***      109 : uint32_t g_crc_32[8];
	;***      110 : uint32_t data_crc[2] = {30500, 60200};
	;***      111 : uint8_t rx_count;
	;***      112 : uint8_t dac_out[2] = {0xff, 0xff};
	;***      113 : /* End user code. Do not edit comment generated here */
	;***      114 : 
	;***      115 : void R_MAIN_UserInit(void);
	;***      116 : 
	;***      117 : /***********************************************************************************************************************
	;***      118 : * Function Name: main
	;***      119 : * Description  : This function implements main function.
	;***      120 : * Arguments    : None
	;***      121 : * Return Value : None
	;***      122 : ***********************************************************************************************************************/
	;***      123 : void main(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 123
	subw sp, #0x10
	;***      124 : {
	;***      125 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 125
	call $!_R_MAIN_UserInit
	;***      126 :     /* Start user code. Do not edit comment generated here */
	;***      127 : 
	;***      128 :     //TODO: EEPROM Initialize and read Setting
	;***      129 :     EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 129
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	clrw ax
	;***      130 :     EE_SPI_Read((uint8_t *)&g_numberSetting, NUMBER_SETTING_ADDRESS, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 130
	push ax
	mov x, #0x25
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      131 :     EE_SPI_Read((uint8_t *)&g_timerSetting, TIME_SETTING_ADDRESS, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 131
	push ax
	mov x, #0x95
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	;***      132 :     _settingNumber = g_numberSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 132
	movw de, #0x0026
	movw bc, #LOWW(_g_numberSetting)
	movw ax, #LOWW(__settingNumber)
	call !!_memcpy
	;***      133 :     _settingTime = g_timerSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 133
	movw de, #0x0096
	movw bc, #LOWW(_g_timerSetting)
	movw ax, #LOWW(__settingTime)
	call !!_memcpy
	;***      134 :     EEPROM_PROTECT_EN();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 134
	clr1 0xFFF0E.0
	;***      135 : 
	;***      136 :     //TODO: Start receive command from Raspberry Pi
	;***      137 :     R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 137
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      138 : 
	;***      139 :     //TODO: Start receive data from RS485
	;***      140 :     O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 140
	clr1 0xFFF00.0
	;***      141 :     R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 141
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	clrw ax
	;***      142 :     uint8_t wts, vpcb, vpcb_v = 1;
	;***      143 :     sendRS485(0xff, 82, 2, 12);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	push ax
	mov x, #0x0C
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      144 : 
	;***      145 :     //TODO: Turn off Hand Sensor LED
	;***      146 :     g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 146
	mov !LOWW(_g_pre_color), #0x03
	;***      147 :     handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	clrb a
	call !!_handSensorLED
	;***      148 : 
	;***      149 :     //TODO: Set default washing mode
	;***      150 :     g_machine_mode = HAND_WASHING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 150
	oneb !LOWW(_g_machine_mode)
	oneb a
	mov [sp+0x02], a
	mov [sp+0x01], a
	mov [sp+0x00], a
.BB@LABEL@3_1:	; bb222
	;***      151 : //    sendToRasPi_f(H_SET, OK_ALL, 0x0);
	;***      152 : 
	;***      153 :     //TODO: Run Initialize Operation
	;***      154 : //    main_init_20211111();
	;***      155 :     while (1U)
	;***      156 :     {
	;***      157 :     	realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 157
	call !!_realTimeResponse
	;***      158 :     	main_loop_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 158
	call !!_main_loop_20211111
	;***      159 : 
	;***      160 :     	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 160
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      161 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 161
	call !!_UpdateMachineStatus
	;***      162 :     	if(g_uart2_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 162
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@3_3
.BB@LABEL@3_2:	; if_then_bb
	;***      163 :     		R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 163
	call !!_R_UART2_Stop
	;***      164 :     		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 164
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      165 :     		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 165
	call !!_R_UART2_Start
	;***      166 :     		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 166
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@3_3:	; if_break_bb
	;***      167 :     	}
	;***      168 : 
	;***      169 :     	// Communication with WaterSoftener
	;***      170 :     	if(commnunication_flag.rs485_send_to_watersolfner_response_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 170
	cmp0 !LOWW(_commnunication_flag+0x0000A)
	bz $.BB@LABEL@3_5
.BB@LABEL@3_4:	; if_then_bb23
	clrw ax
	;***      171 :     		sendRS485(0xff, 82, 2, 5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 171
	push ax
	mov x, #0x05
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      172 : //    		rx_count++;
	;***      173 :     		wts = 1; //Test flag = 1
	;***      174 : 			commnunication_flag.rs485_send_to_watersolfner_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 174
	clrb !LOWW(_commnunication_flag+0x0000A)
	oneb a
	mov [sp+0x00], a
.BB@LABEL@3_5:	; if_break_bb24
	;***      175 :     	}
	;***      176 : 		if(commnunication_flag.rs485_send_to_watersolfner_SV1_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 176
	cmp !LOWW(_commnunication_flag+0x0000B), #0x01
	bnz $.BB@LABEL@3_9
.BB@LABEL@3_6:	; if_then_bb30
	;***      177 :     		// Sand to Water softener SV state
	;***      178 :     		sendRS485(0xff, 82, 24,(uint32_t) g_io_status.refined.Valve.SV1 == 1?1:0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 178
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
	;***      179 :     		commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 179
	clrb !LOWW(_commnunication_flag+0x0000B)
.BB@LABEL@3_9:	; if_break_bb43
	mov a, [sp+0x00]
	;***      180 :     	}
	;***      181 : 		// Test SV1 for Water Softener
	;***      182 :     	if(wts != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 182
	cmp0 a
	bnz $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_else_bb63
	;***      183 :     		if(ns_delay_ms(&g_Tick.tickWaterSoftenerPCB, 5000)){
	;***      184 :     			if(wts == 1){
	;***      185 :     				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      186 : //					sendRS485(1, 82, 24,(uint32_t) 1);
	;***      187 : //					sendRS485(0xff, 82, 24,(uint32_t) 1);
	;***      188 : 					wts = 2;
	;***      189 :     			}else{
	;***      190 :     				O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***      191 : //    				sendRS485(1, 82, 24,(uint32_t) 0);
	;***      192 : //					sendRS485(0xff, 82, 24,(uint32_t) 0);
	;***      193 : 					wts = 0;
	;***      194 :     			}
	;***      195 :     		}
	;***      196 :     	}else{
	;***      197 :     		g_Tick.tickWaterSoftenerPCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 197
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00048), ax
	br $.BB@LABEL@3_15
.BB@LABEL@3_11:	; if_then_bb49
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 183
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x00048)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_15
.BB@LABEL@3_12:	; if_then_bb54
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 184
	dec a
	bnz $.BB@LABEL@3_14
.BB@LABEL@3_13:	; if_then_bb60
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 185
	set1 0xFFF01.7
	mov [sp+0x00], #0x02
	br $.BB@LABEL@3_15
.BB@LABEL@3_14:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	clr1 0xFFF01.7
	clrb a
	mov [sp+0x00], a
.BB@LABEL@3_15:	; if_break_bb65
	;***      198 :     	}
	;***      199 : 
	;***      200 :     	//Valve PCB
	;***      201 :     	if(commnunication_flag.rs485_send_to_valve_response_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 201
	cmp !LOWW(_commnunication_flag+0x0000C), #0x01
	bnz $.BB@LABEL@3_17
.BB@LABEL@3_16:	; if_then_bb71
	movw ax, sp
	addw ax, #0x0006
	movw [sp+0x04], ax
	;***      202 :     		// 0xff, 12, {Mode, Valve 1, Valve 2, Valve 3, 1}
	;***      203 :     		// 0 - Stand alone 1 - Control Valve
	;***      204 :     		uint8_t _b[5] = {vpcb_v, g_uart3_sendend%2,g_systemTime%2,0,1};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 204
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
	;***      205 :     		sendR485_7byte(0xff, 12, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 205
	movw ax, #0xFF0C
	call !!_sendR485_7byte
	;***      206 :     		vpcb++;
	;***      207 :     		commnunication_flag.rs485_send_to_valve_response_flag  = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 207
	clrb !LOWW(_commnunication_flag+0x0000C)
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 206
	inc a
	mov [sp+0x01], a
	br $.BB@LABEL@3_19
.BB@LABEL@3_17:	; if_else_bb89
	;***      208 :     	}else if(commnunication_flag.rs485_get_valve_gesture_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 208
	cmp !LOWW(_commnunication_flag+0x0000D), #0x01
	bnz $.BB@LABEL@3_19
.BB@LABEL@3_18:	; if_then_bb95
	movw ax, sp
	addw ax, #0x000B
	movw [sp+0x04], ax
	;***      209 :     		uint8_t _b[5] = {0,1,0,0,1};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 209
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1635)
	call !!_memcpy
	movw ax, [sp+0x04]
	movw bc, ax
	;***      210 :     		sendR485_7byte(0xff, 1, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 210
	movw ax, #0xFF01
	call !!_sendR485_7byte
	;***      211 :     		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 211
	inc !LOWW(_rx_count)
	;***      212 :     		commnunication_flag.rs485_get_valve_gesture_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 212
	clrb !LOWW(_commnunication_flag+0x0000D)
.BB@LABEL@3_19:	; if_break_bb101
	mov a, [sp+0x01]
	;***      213 :     	}
	;***      214 : 
	;***      215 :     	if(vpcb != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	cmp0 a
	bnz $.BB@LABEL@3_21
.BB@LABEL@3_20:	; if_else_bb125
	;***      216 :     		if(ns_delay_ms(&g_Tick.tickValvePCB, 5000)){
	;***      217 :     			vpcb_v = vpcb_v == 1 ? 0 : 1;
	;***      218 :     			vpcb = 0;
	;***      219 :     		}
	;***      220 :     	}else{
	;***      221 :     		g_Tick.tickValvePCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 221
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	br $.BB@LABEL@3_24
.BB@LABEL@3_21:	; if_then_bb107
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 216
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x0004C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_24
.BB@LABEL@3_22:	; if_then_bb112
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 217
	dec a
	clrb a
	mov [sp+0x01], a
	bnz $.BB@LABEL@3_26
.BB@LABEL@3_23:	; if_then_bb112.if_break_bb127_crit_edge
	mov [sp+0x02], a
.BB@LABEL@3_24:	; if_break_bb127
	;***      222 :     	}
	;***      223 : 
	;***      224 :     	//RS485 fault check
	;***      225 :     	if(commnunication_flag.rs485_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 225
	cmp !LOWW(_commnunication_flag+0x0000E), #0x01
	bnz $.BB@LABEL@3_27
.BB@LABEL@3_25:	; if_then_bb133
	;***      226 :     		R_UART3_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 226
	call !!_R_UART3_Stop
	;***      227 :     		commnunication_flag.rs485_fault++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 227
	inc !LOWW(_commnunication_flag+0x0000E)
	;***      228 :     		g_Tick.tickRS485 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 228
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00050), ax
	br $.BB@LABEL@3_30
.BB@LABEL@3_26:	; bb118
	oneb a
	br $.BB@LABEL@3_23
.BB@LABEL@3_27:	; if_else_bb137
	;***      229 :     	}else if(commnunication_flag.rs485_fault == 2){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 229
	cmp !LOWW(_commnunication_flag+0x0000E), #0x02
	bnz $.BB@LABEL@3_30
.BB@LABEL@3_28:	; if_then_bb143
	;***      230 :     		if(ns_delay_ms(&g_Tick.tickRS485, 500)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 230
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00050)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_30
.BB@LABEL@3_29:	; if_then_bb148
	;***      231 : 				R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 231
	call !!_R_UART3_Start
	;***      232 : 				R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 232
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      233 : 				commnunication_flag.rs485_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 233
	clrb !LOWW(_commnunication_flag+0x0000E)
.BB@LABEL@3_30:	; if_break_bb152
	;***      234 :     		}
	;***      235 :     	}
	;***      236 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      237 : //    	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	;***      238 : //    		P6_bit.no3 = ~P6_bit.no3;
	;***      239 : //    		O_SUPPLY_WATER_PIN_SV1 = ~O_SUPPLY_WATER_PIN_SV1;
	;***      240 : //    	}
	;***      241 : //    	if(g_machine_state.user == 1){
	;***      242 : //    		HandWashingMode_nostop();
	;***      243 : //    	}else{
	;***      244 : //    		g_Tick.tickCustom[1] = g_systemTime;
	;***      245 : //    	}
	;***      246 : 
	;***      247 :     	// Check
	;***      248 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 248
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_31:	; bb160
	clrb a
.BB@LABEL@3_32:	; bb162
	mov !LOWW(_flow_p), a
	;***      249 :     	if(ns_delay_ms(&g_Tick.tickCustom[1], 60000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 249
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick+0x0008C)
	call !!_ns_delay_ms
	;***      250 : //    		if(O_SUPPLY_WATER_PIN_SV1 == ON){
	;***      251 : //				g_TickKeeper.SV1_ON_minutes++;
	;***      252 : //				g_TickKeeper.SV1_OFF_minutes = 0;
	;***      253 : //			}else{
	;***      254 : //				g_TickKeeper.SV1_OFF_minutes++;
	;***      255 : //				g_TickKeeper.SV1_ON_minutes = 0;
	;***      256 : //			}
	;***      257 : //			if(O_SPOUT_WATER_PIN_SV2 == ON){
	;***      258 : //				g_TickKeeper.SV2_ON_minutes++;
	;***      259 : //				g_TickKeeper.SV2_OFF_minutes = 0;
	;***      260 : //			}else{
	;***      261 : //				g_TickKeeper.SV2_OFF_minutes++;
	;***      262 : //				g_TickKeeper.SV2_ON_minutes = 0;
	;***      263 : //			}
	;***      264 :     	}
	;***      265 :     	if(ns_delay_ms(&g_Tick.tickCustom[2], 15000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 265
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00090)
	call !!_ns_delay_ms
	;***      266 : //    		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      267 : //					|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      268 : //				sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      269 : //						g_io_status.refined.FlowValue);
	;***      270 : //			}
	;***      271 :     	}
	;***      272 :     	if(ns_delay_ms(&g_Tick.tick1s, 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 272
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_36
.BB@LABEL@3_33:	; if_then_bb182
	;***      273 : 
	;***      274 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 274
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_34:	; bb188
	clrb a
.BB@LABEL@3_35:	; bb190
	mov !LOWW(_led_st), a
	;***      275 :     	    uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 275
	mov a, !LOWW(_g_uart2_sendend)
	;***      276 :     	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 276
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      277 :     	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 277
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
	;***      278 : //    	    switch (g_color) {
	;***      279 : //				case BLACK:
	;***      280 : //					g_color = RED;
	;***      281 : //					break;
	;***      282 : //				case RED:
	;***      283 : //					g_color = BLUE;
	;***      284 : //					break;
	;***      285 : //				case BLUE:
	;***      286 : //					g_color = WHITE;
	;***      287 : //					break;
	;***      288 : //				default:
	;***      289 : //					g_color = BLACK;
	;***      290 : //					break;
	;***      291 : //			}
	;***      292 : //    	    dac_out[0]+= 10;
	;***      293 : 			CVCC_Current_Set(dac_out[0]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 293
	mov a, !LOWW(_dac_out)
	call !!_R_DAC0_Set_ConversionValue
	;***      294 : //			dac_out[1]+= 10;
	;***      295 : 			Salt_Analog_Set(dac_out[1]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 295
	mov a, !LOWW(_dac_out+0x00001)
	call !!_R_DAC1_Set_ConversionValue
.BB@LABEL@3_36:	; if_break_bb207
	;***      296 :     		if(led_st == 0x00){
	;***      297 : 
	;***      298 : //    			O_CVCC_ON_PIN = ON;
	;***      299 : //    			O_HS_ICL_PIN = 0;
	;***      300 : //    			O_HS_IDA_PIN = 1;
	;***      301 : //    			handSensorLED(RED);
	;***      302 : //    			O_CVCC_ALARM_RS = 1;
	;***      303 : //    			O_PUMP_SALT_PIN = ON;
	;***      304 : //    			electrolyticOperationON();
	;***      305 : //    			g_io_status.refined.Valve.SV4 = 1;
	;***      306 : //				g_io_status.refined.Pump2 = 1;
	;***      307 : //				g_io_status.refined.Valve.SV5 = 0;
	;***      308 : //				g_io_status.refined.Pump1 = 0;
	;***      309 : //				g_io_status.refined.SaltLowLevel = 1;
	;***      310 : //    			e_send[0]++;
	;***      311 : //    			g_numberSetting.upperVoltage1++;
	;***      312 : //    			g_numberSetting.crc--;
	;***      313 : //    			g_numberSetting.crc2++;
	;***      314 : //    			g_numberSetting.lowerFlow++;
	;***      315 : //    			g_numberSetting.hello++;
	;***      316 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
	;***      317 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting.crc, 0x800, 6);
	;***      318 : //    			EE_SPI_Write((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
	;***      319 :     		}else{
	;***      320 : //    			O_CVCC_ON_PIN = OFF;
	;***      321 : //    			O_HS_ICL_PIN = 1;
	;***      322 : //				O_HS_IDA_PIN = 0;
	;***      323 : //    			handSensorLED(WHITE);
	;***      324 : //    			O_CVCC_ALARM_RS = 0;
	;***      325 : //    			O_PUMP_SALT_PIN = OFF;
	;***      326 : //    			electrolyticOperationOFF();
	;***      327 : //    			g_io_status.refined.Valve.SV4 = 0;
	;***      328 : //				g_io_status.refined.Pump2 = 0;
	;***      329 : //				g_io_status.refined.Valve.SV5 = 1;
	;***      330 : //				g_io_status.refined.Pump1 = 1;
	;***      331 : //				g_io_status.refined.SaltLowLevel = 0;
	;***      332 : //    			EE_SPI_Read((uint8_t *)&ret_number_setting, 0x000, sizeof(g_numberSetting));
	;***      333 : 
	;***      334 :     		}
	;***      335 :     	}
	;***      336 : 
	;***      337 : 
	;***      338 : //--------------------------------End testing code---------------------------------------------------------
	;***      339 : //    	if(g_machine_state.mode == BUSY){
	;***      340 : //    		g_machine_state.user = 0;
	;***      341 : //    		if(ns_delay_ms(&g_Tick.tickDebouceHandSensor, g_timerSetting.t55_waterDischargeDelay_s*1000)){
	;***      342 : //    			g_machine_state.mode = INDIE;
	;***      343 : //    		}
	;***      344 : //    	}else{
	;***      345 : //    		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      346 : //    	}
	;***      347 : 
	;***      348 : 		if((g_machine_state.mode == WATER_WASHING)|(g_machine_state.mode == INDIE)){
	;***      349 : //			nostop_WaterWashingMode();
	;***      350 : 		}
	;***      351 : //    	InitialOperationModeStart();
	;***      352 : 
	;***      353 : //    	if(g_color != g_pre_color){
	;***      354 : //			O_RS485_MODE_PIN = 1U;
	;***      355 : //			uint8_t _uart3 = g_uart3_sendend;
	;***      356 : //			send_buf[3]++;
	;***      357 : //			R_UART3_Send(send_buf, 7);
	;***      358 : //			while(_uart3 == g_uart3_sendend);
	;***      359 : //			O_RS485_MODE_PIN = 0U;
	;***      360 : //    	}
	;***      361 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 361
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      362 :     }
	;***      363 :     /* End user code. Do not edit comment generated here */
	;***      364 : }
	;***      365 : 
	;***      366 : /***********************************************************************************************************************
	;***      367 : * Function Name: R_MAIN_UserInit
	;***      368 : * Description  : This function adds user code before implementing main function.
	;***      369 : * Arguments    : None
	;***      370 : * Return Value : None
	;***      371 : ***********************************************************************************************************************/
	;***      372 : void R_MAIN_UserInit(void)
	;***      373 : {
	;***      374 :     /* Start user code. Do not edit comment generated here */
	;***      375 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 375
	ei
	;***      376 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 376
	call !!_R_TAU0_Create
	;***      377 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 377
	call !!_R_SAU0_Create
	;***      378 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 378
	call !!_R_SAU1_Create
	;***      379 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 379
	call !!_R_UART1_Create
	;***      380 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 380
	call !!_R_UART2_Create
	;***      381 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 381
	call !!_R_UART3_Create
	;***      382 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 382
	call !!_R_RTC_Create
	;***      383 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 383
	call !!_R_PORT_Create_UserInit
	;***      384 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 384
	call !!_R_CSI01_Create
	;***      385 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 385
	call !!_R_CSI00_Create
	;***      386 : 
	;***      387 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 387
	call !!_R_TAU0_Channel0_Start
	;***      388 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 388
	call !!_R_UART3_Start
	;***      389 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 389
	call !!_R_UART1_Start
	;***      390 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 390
	call !!_R_UART2_Start
	;***      391 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 391
	call !!_R_CSI00_Start
	;***      392 : //    R_CSI01_Start();
	;***      393 : 
	;***      394 : 
	;***      395 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 395
	call !!_R_ADC_Create
	;***      396 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 396
	call !!_R_ADC_Set_OperationOn
	;***      397 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 397
	call !!_R_ADC_Start
	;***      398 : 
	;***      399 :     R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 399
	call !!_R_DAC_Create
	;***      400 : 	CVCC_Current_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 400
	clrb a
	call !!_R_DAC0_Set_ConversionValue
	;***      401 : 	Salt_Analog_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 401
	clrb a
	call !!_R_DAC1_Set_ConversionValue
	;***      402 :     R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 402
	call !!_R_DAC0_Start
	;***      403 :     R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 403
	br !!_R_DAC1_Start
	;***      404 :     /* End user code. Do not edit comment generated here */
	;***      405 : }
	;***      406 : 
	;***      407 : /* Start user code for adding. Do not edit comment generated here */
	;***      408 : /* End user code. Do not edit comment generated here */
	.SECTION .data,DATA
	.ALIGN 2
_g_error:
	.DS (2)
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
.STR@1635:
	.DS (1)
	.DB 0x01
	.DS (2)
	.DB 0x01
