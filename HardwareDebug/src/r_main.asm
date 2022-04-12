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
#@  compiled at Tue Apr 12 13:31:57 2022

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
	.EXTERN _manufactureReset
	.EXTERN _R_UART2_Receive
	.EXTERN _R_UART3_Receive
	.EXTERN _sendRS485
	.EXTERN _handSensorLED
	.EXTERN _main_init_20211111
	.EXTERN _R_DAC0_Set_ConversionValue
	.EXTERN _R_DAC1_Set_ConversionValue
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
	;***       46 : #include "hwm/hwm_main.h"
	;***       47 : #include "r_cg_userdefine.h"
	;***       48 : 
	;***       49 : /***********************************************************************************************************************
	;***       50 :  Pragma directive
	;***       51 :  ***********************************************************************************************************************/
	;***       52 : /* Start user code for pragma. Do not edit comment generated here */
	;***       53 : 
	;***       54 : //#define TESTING_FIRMWARE
	;***       55 : /* End user code. Do not edit comment generated here */
	;***       56 : 
	;***       57 : /***********************************************************************************************************************
	;***       58 :  Global variables and functions
	;***       59 :  ***********************************************************************************************************************/
	;***       60 : /* Start user code for global. Do not edit comment generated here */
	;***       61 : 
	;***       62 : volatile int g_adc_ch = 0;
	;***       63 : union EEPROM_status_u g_e_status;
	;***       64 : struct Number_Setting_s ret_number_setting;
	;***       65 : uint8_t led_st = 0xff;
	;***       66 : uint8_t flow_p, salt_h_p;
	;***       67 : uint8_t g_eeprom_wren;
	;***       68 : uint8_t send_data[2] = { 0x23, 0xab };
	;***       69 : uint8_t receive_data[2];
	;***       70 : struct Number_Setting_s receive_setting;
	;***       71 : union EEPROM_status_u set;
	;***       72 : uint32_t rx_data[3];
	;***       73 : float data_f;
	;***       74 : union byte_to_float data_f_test;
	;***       75 : struct UART_Buffer_float_s g_control_buffer_f;
	;***       76 : struct UART_Buffer_u32_s g_control_buffer_u32;
	;***       77 : 
	;***       78 : union {
	;***       79 : 	struct {
	;***       80 : 		uint8_t up_signal;
	;***       81 : 	};
	;***       82 : 	uint8_t status;
	;***       83 : } handsensor_status;
	;***       84 : uint8_t g_handsensor_status[2];
	;***       85 : void nostop_checkHandSensor(void) {
	;***       86 : 	if (DETECT_U() == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 86
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_5
.BB@LABEL@1_1:	; if_then_bb
	;***       87 : 		if (ns_delay_ms(&g_Tick.tickHandSensor[0], 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 87
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00090)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@1_9
.BB@LABEL@1_2:	; if_then_bb16
	;***       88 : 			g_handsensor_status[0] = g_handsensor_status[0] == 0 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 88
	cmp0 !LOWW(_g_handsensor_status)
	oneb a
	skz
.BB@LABEL@1_3:	; bb22
	clrb a
.BB@LABEL@1_4:	; bb24
	mov !LOWW(_g_handsensor_status), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 97
	ret
.BB@LABEL@1_5:	; if_else_bb
	;***       89 : 		}
	;***       90 : 	} else if (DETECT_D() == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 90
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@1_7
.BB@LABEL@1_6:	; if_then_bb43
	;***       91 : 		g_handsensor_status[1] = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 91
	oneb !LOWW(_g_handsensor_status+0x00001)
	ret
.BB@LABEL@1_7:	; if_else_bb44
	;***       92 : 	} else if (DETECT_U() == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 92
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_9
.BB@LABEL@1_8:	; if_else_bb61
	;***       93 : 
	;***       94 : 	} else if (DETECT_D() == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 94
	mov a, 0xFFF07
.BB@LABEL@1_9:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 97
	ret
_readHS:
	.STACK _readHS = 4
	;***       95 : 
	;***       96 : 	}
	;***       97 : }
	;***       98 : uint8_t readHS(void) {
	;***       99 : 	if (DETECT_U()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 99
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@2_2
.BB@LABEL@2_1:	; bb33
	;***      100 : 		delay_ms(2);
	;***      101 : 		if (DETECT_U())
	;***      102 : 			return 1;
	;***      103 : 		return 0;
	;***      104 : 	} else
	;***      105 : 		return 0;
	;***      106 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 106
	clrb a
	ret
.BB@LABEL@2_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 100
	clrw bc
	onew ax
	incw ax
	call !!_delay_ms
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 101
	mov a, 0xFFF07
	shr a, 0x05
	and a, #0x01
	ret
_main:
	.STACK _main = 24
	;***      107 : uint8_t this_size = sizeof(g_io_status);
	;***      108 : uint8_t this_size_2 = sizeof(union IO_Status_u);
	;***      109 : uint8_t send_buf[7] = { 8, 1, 2, 3, 4, 5, 6 };
	;***      110 : char g_crc[8];
	;***      111 : uint32_t g_crc_32[8];
	;***      112 : uint32_t data_crc[2] = { 30500, 60200 };
	;***      113 : uint8_t rx_count;
	;***      114 : uint8_t dac_out[2] = { 0xff, 0xff };
	;***      115 : /* End user code. Do not edit comment generated here */
	;***      116 : 
	;***      117 : void R_MAIN_UserInit(void);
	;***      118 : 
	;***      119 : /***********************************************************************************************************************
	;***      120 :  * Function Name: main
	;***      121 :  * Description  : This function implements main function.
	;***      122 :  * Arguments    : None
	;***      123 :  * Return Value : None
	;***      124 :  ***********************************************************************************************************************/
	;***      125 : void main(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 125
	subw sp, #0x10
	;***      126 : 	R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 126
	call $!_R_MAIN_UserInit
	;***      127 : 	/* Start user code. Do not edit comment generated here */
	;***      128 : 
	;***      129 : 	//TODO: EEPROM Initialize and read Setting
	;***      130 : 	EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 130
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	clrw ax
	;***      131 : 	EE_SPI_Read((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 131
	push ax
	mov x, #0x29
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      132 : 			numberSettingSize);
	;***      133 : 	EE_SPI_Read((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 133
	push ax
	mov x, #0x95
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      134 : 			timeSettingSize);
	;***      135 : 	EE_SPI_Read((uint8_t*) &g_test_control.data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 135
	push ax
	incw ax
	push ax
	movw bc, #0x0029
	movw ax, #LOWW(_g_test_control)
	call !!_EE_SPI_Read
	addw sp, #0x04
	;***      136 : 			NUMBER_SETTING_ADDRESS + numberSettingSize, sizeof(g_test_control.data));
	;***      137 : 	// Set to default valve
	;***      138 : 	if(g_timerSetting.t1_initialWaterDrainageOperation_s > 180 && g_numberSetting.upperVoltage1 > 100.0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 138
	movw ax, !LOWW(_g_timerSetting+0x00002)
	clrw bc
	cmpw ax, bc
	movw ax, !LOWW(_g_timerSetting)
	sknz
.BB@LABEL@3_1:	; entry
	cmpw ax, #0x00B5
.BB@LABEL@3_2:	; entry
	bc $.BB@LABEL@3_9
.BB@LABEL@3_3:	; bb
	movw ax, #0x42C8
	push ax
	clrw ax
	push ax
	movw bc, !LOWW(_g_numberSetting+0x00002)
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_numberSetting)
	movw [sp+0x08], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, #0x42C8
	push ax
	clrw ax
	push ax
	movw ax, [sp+0x06]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_fle
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@3_4:	; bb
	clrb a
.BB@LABEL@3_5:	; bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@3_6:	; bb
	clrb x
.BB@LABEL@3_7:	; bb
	or x, a
	sknz
.BB@LABEL@3_8:	; if_then_bb
	;***      139 : 		manufactureReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 139
	call !!_manufactureReset
.BB@LABEL@3_9:	; if_break_bb
	;***      140 : 	}
	;***      141 : 	_settingNumber = g_numberSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 141
	movw de, #0x002A
	movw bc, #LOWW(_g_numberSetting)
	movw ax, #LOWW(__settingNumber)
	call !!_memcpy
	;***      142 : 	_settingTime = g_timerSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 142
	movw de, #0x0096
	movw bc, #LOWW(_g_timerSetting)
	movw ax, #LOWW(__settingTime)
	call !!_memcpy
	;***      143 : 	EEPROM_PROTECT_EN();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	clr1 0xFFF0E.0
	;***      144 : 	//TODO: Start receive command from Raspberry Pi
	;***      145 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      146 : 
	;***      147 : 	//TODO: Start receive data from RS485
	;***      148 : 	O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 148
	clr1 0xFFF00.0
	;***      149 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 149
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	clrw ax
	;***      150 : 	uint8_t wts, vpcb, vpcb_v = 1;
	;***      151 : 	sendRS485(0xff, 82, 2, 12);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 151
	push ax
	mov x, #0x0C
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      152 : 
	;***      153 : 	//TODO: Turn off Hand Sensor LED
	;***      154 : 	g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 154
	mov !LOWW(_g_pre_color), #0x03
	;***      155 : 	handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 155
	clrb a
	call !!_handSensorLED
	movw hl, #LOWW(_g_test_control)
	;***      156 : 
	;***      157 : 	//TODO: Set default washing mode
	;***      158 : 	g_machine_mode = HAND_WASHING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 158
	oneb !LOWW(_g_machine_mode)
	bf [hl].1, $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_then_bb35
	;***      159 : //    sendToRasPi_f(H_SET, OK_ALL, 0x0);
	;***      160 : 
	;***      161 : 	//TODO: Run Initialize Operation
	;***      162 : 	if(g_test_control.raw.power_on == ON){
	;***      163 : 		main_init_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 163
	call !!_main_init_20211111
.BB@LABEL@3_11:	; if_break_bb36
	movw ax, #0x40A0
	;***      164 : 	}
	;***      165 : 	//TODO: Output CVCC and Salt pump voltage
	;***      166 : 	CVCC_Current_Set((uint8_t) (g_numberSetting.cvccCurrent/CVCC_MAX_VOLTAGE*255));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 166
	push ax
	clrw ax
	push ax
	movw bc, !LOWW(_g_numberSetting+0x00022)
	movw ax, !LOWW(_g_numberSetting+0x00020)
	call !!__COM_fdiv
	movw de, ax
	addw sp, #0x04
	movw ax, #0x437F
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	mov a, x
	call !!_R_DAC0_Set_ConversionValue
	movw ax, #0x409B
	;***      167 : 	Salt_Analog_Set((uint8_t) (g_numberSetting.saltPumpVoltage/SALT_PUMP_MAX_VOLTAGE*255));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 167
	push ax
	movw ax, #0x020C
	push ax
	movw bc, !LOWW(_g_numberSetting+0x00026)
	movw ax, !LOWW(_g_numberSetting+0x00024)
	call !!__COM_fdiv
	movw de, ax
	addw sp, #0x04
	movw ax, #0x437F
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	mov a, x
	call !!_R_DAC1_Set_ConversionValue
	oneb a
	mov [sp+0x02], a
	mov [sp+0x01], a
	mov [sp+0x00], a
.BB@LABEL@3_12:	; bb254
	;***      168 : 	while (1U) {
	;***      169 : 
	;***      170 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 170
	call !!_realTimeResponse
	;***      171 : 		main_loop_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 171
	call !!_main_loop_20211111
	;***      172 : 
	;***      173 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 173
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      174 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 174
	call !!_UpdateMachineStatus
	;***      175 : 		if (g_uart2_fault == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 175
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@3_14
.BB@LABEL@3_13:	; if_then_bb52
	;***      176 : 			R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 176
	call !!_R_UART2_Stop
	;***      177 : 			delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 177
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      178 : 			R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 178
	call !!_R_UART2_Start
	;***      179 : 			g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 179
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@3_14:	; if_break_bb53
	;***      180 : 		}
	;***      181 : 
	;***      182 : 		// Communication with WaterSoftener
	;***      183 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 183
	cmp0 !LOWW(_g_commnunication_flag+0x0000A)
	bz $.BB@LABEL@3_16
.BB@LABEL@3_15:	; if_then_bb59
	clrw ax
	;***      184 : 			sendRS485(0xff, 82, 2, 5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 184
	push ax
	mov x, #0x05
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      185 : //    		rx_count++;
	;***      186 : 			wts = 1; //Test flag = 1
	;***      187 : 			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 187
	clrb !LOWW(_g_commnunication_flag+0x0000A)
	oneb a
	mov [sp+0x00], a
.BB@LABEL@3_16:	; if_break_bb60
	;***      188 : 		}
	;***      189 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 189
	cmp !LOWW(_g_commnunication_flag+0x0000B), #0x01
	bnz $.BB@LABEL@3_20
.BB@LABEL@3_17:	; if_then_bb66
	;***      190 : 			// Sand to Water softener SV state
	;***      191 : 			sendRS485(0xff, 82, 24,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 191
	movw hl, #LOWW(_g_io_status+0x00001)
	onew bc
	bt [hl].0, $.BB@LABEL@3_19
.BB@LABEL@3_18:	; bb74
	decw bc
.BB@LABEL@3_19:	; bb76
	clrw ax
	push ax
	push bc
	mov c, #0x18
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      192 : 					(uint32_t) g_io_status.refined.io.Valve.SV1 == 1 ? 1 : 0);
	;***      193 : 			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 193
	clrb !LOWW(_g_commnunication_flag+0x0000B)
.BB@LABEL@3_20:	; if_break_bb80
	mov a, [sp+0x00]
	;***      194 : 		}
	;***      195 : 		// Test SV1 for Water Softener
	;***      196 : 		if (wts != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 196
	cmp0 a
	bnz $.BB@LABEL@3_22
.BB@LABEL@3_21:	; if_else_bb100
	;***      197 : 			if (ns_delay_ms(&g_Tick.tickWaterSoftenerPCB, 5000)) {
	;***      198 : 				if (wts == 1) {
	;***      199 : 					O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      200 : //					sendRS485(1, 82, 24,(uint32_t) 1);
	;***      201 : //					sendRS485(0xff, 82, 24,(uint32_t) 1);
	;***      202 : 					wts = 2;
	;***      203 : 				} else {
	;***      204 : 					O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***      205 : //    				sendRS485(1, 82, 24,(uint32_t) 0);
	;***      206 : //					sendRS485(0xff, 82, 24,(uint32_t) 0);
	;***      207 : 					wts = 0;
	;***      208 : 				}
	;***      209 : 			}
	;***      210 : 		} else {
	;***      211 : 			g_Tick.tickWaterSoftenerPCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 211
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00050), ax
	br $.BB@LABEL@3_26
.BB@LABEL@3_22:	; if_then_bb86
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 197
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x00050)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_26
.BB@LABEL@3_23:	; if_then_bb91
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 198
	dec a
	bnz $.BB@LABEL@3_25
.BB@LABEL@3_24:	; if_then_bb97
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 199
	set1 0xFFF01.7
	mov [sp+0x00], #0x02
	br $.BB@LABEL@3_26
.BB@LABEL@3_25:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 204
	clr1 0xFFF01.7
	clrb a
	mov [sp+0x00], a
.BB@LABEL@3_26:	; if_break_bb102
	;***      212 : 		}
	;***      213 : 
	;***      214 : 		//---------------------------------Valve PCB------------------------------------
	;***      215 : 		if (g_commnunication_flag.rs485_send_to_valve_response_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	cmp !LOWW(_g_commnunication_flag+0x0000C), #0x01
	bnz $.BB@LABEL@3_28
.BB@LABEL@3_27:	; if_then_bb108
	movw ax, sp
	addw ax, #0x0006
	movw [sp+0x04], ax
	;***      216 : 			// 0xff, 12, {Mode, Valve 1, Valve 2, Valve 3, 1}
	;***      217 : 			// 0 - Stand alone 1 - Control Valve
	;***      218 : 			uint8_t _b[5] = { vpcb_v, g_uart3_sendend % 2, g_systemTime % 2, 0,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 218
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
	;***      219 : 					1 };
	;***      220 : 			sendR485_7byte(0xff, 12, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 220
	movw ax, #0xFF0C
	call !!_sendR485_7byte
	;***      221 : 			vpcb++;
	;***      222 : 			g_commnunication_flag.rs485_send_to_valve_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 222
	clrb !LOWW(_g_commnunication_flag+0x0000C)
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 221
	inc a
	mov [sp+0x01], a
	br $.BB@LABEL@3_30
.BB@LABEL@3_28:	; if_else_bb126
	;***      223 : 		} else if (g_commnunication_flag.rs485_get_valve_gesture_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 223
	cmp !LOWW(_g_commnunication_flag+0x0000D), #0x01
	bnz $.BB@LABEL@3_30
.BB@LABEL@3_29:	; if_then_bb132
	movw ax, sp
	addw ax, #0x000B
	movw [sp+0x04], ax
	;***      224 : 			uint8_t _b[5] = { 0, 1, 0, 0, 1 };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 224
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1685)
	call !!_memcpy
	movw ax, [sp+0x04]
	movw bc, ax
	;***      225 : 			sendR485_7byte(0xff, 1, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 225
	movw ax, #0xFF01
	call !!_sendR485_7byte
	;***      226 : 			g_commnunication_flag.rs485_get_valve_gesture_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 226
	clrb !LOWW(_g_commnunication_flag+0x0000D)
.BB@LABEL@3_30:	; if_break_bb136
	mov a, [sp+0x01]
	;***      227 : 		}
	;***      228 : 
	;***      229 : 		if (vpcb != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 229
	cmp0 a
	bnz $.BB@LABEL@3_32
.BB@LABEL@3_31:	; if_else_bb160
	;***      230 : 			if (ns_delay_ms(&g_Tick.tickValvePCB, 5000)) {
	;***      231 : 				vpcb_v = vpcb_v == 1 ? 0 : 1;
	;***      232 : 				vpcb = 0;
	;***      233 : 			}
	;***      234 : 		} else {
	;***      235 : 			g_Tick.tickValvePCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 235
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	br $.BB@LABEL@3_35
.BB@LABEL@3_32:	; if_then_bb142
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 230
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x00054)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_35
.BB@LABEL@3_33:	; if_then_bb147
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 231
	dec a
	clrb a
	mov [sp+0x01], a
	bnz $.BB@LABEL@3_37
.BB@LABEL@3_34:	; if_then_bb147.if_break_bb162_crit_edge
	mov [sp+0x02], a
.BB@LABEL@3_35:	; if_break_bb162
	;***      236 : 		}
	;***      237 : 
	;***      238 : 		//RS485 fault check
	;***      239 : 		if (g_commnunication_flag.rs485_fault == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 239
	cmp !LOWW(_g_commnunication_flag+0x0000E), #0x01
	bnz $.BB@LABEL@3_38
.BB@LABEL@3_36:	; if_then_bb168
	;***      240 : 			R_UART3_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 240
	call !!_R_UART3_Stop
	;***      241 : 			g_commnunication_flag.rs485_fault++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 241
	inc !LOWW(_g_commnunication_flag+0x0000E)
	;***      242 : 			g_Tick.tickRS485 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 242
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
	br $.BB@LABEL@3_41
.BB@LABEL@3_37:	; bb153
	oneb a
	br $.BB@LABEL@3_34
.BB@LABEL@3_38:	; if_else_bb172
	;***      243 : 		} else if (g_commnunication_flag.rs485_fault == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 243
	cmp !LOWW(_g_commnunication_flag+0x0000E), #0x02
	bnz $.BB@LABEL@3_41
.BB@LABEL@3_39:	; if_then_bb178
	;***      244 : 			if (ns_delay_ms(&g_Tick.tickRS485, 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 244
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_41
.BB@LABEL@3_40:	; if_then_bb183
	;***      245 : 				R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 245
	call !!_R_UART3_Start
	;***      246 : 				R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 246
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      247 : 				g_commnunication_flag.rs485_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 247
	clrb !LOWW(_g_commnunication_flag+0x0000E)
.BB@LABEL@3_41:	; if_break_bb187
	;***      248 : 			}
	;***      249 : 		}
	;***      250 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      251 : 
	;***      252 : 		flow_p = I_FLOW_PLUSE_PIN == 1 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 252
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_42:	; bb195
	clrb a
.BB@LABEL@3_43:	; bb197
	mov !LOWW(_flow_p), a
	;***      253 : 		if (ns_delay_ms(&g_Tick.tickCustom[1], 60000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 253
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick+0x0009C)
	call !!_ns_delay_ms
	;***      254 : 
	;***      255 : 		}
	;***      256 : 
	;***      257 : 		if (ns_delay_ms(&g_Tick.tick1s, 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 257
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_47
.BB@LABEL@3_44:	; if_then_bb211
	;***      258 : 
	;***      259 : 			led_st = led_st == 0 ? 0xff : 0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 259
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_45:	; bb217
	clrb a
.BB@LABEL@3_46:	; bb219
	mov !LOWW(_led_st), a
	;***      260 : 			uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 260
	mov a, !LOWW(_g_uart2_sendend)
	;***      261 : 			g_crc[6] = crc8_4((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 261
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      262 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      263 : 			g_crc[7] = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 263
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
.BB@LABEL@3_47:	; if_break_bb234
	;***      264 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      265 : //			}
	;***      266 : 			if (led_st == 0x00) {
	;***      267 : 
	;***      268 : 			} else {
	;***      269 : 
	;***      270 : 			}
	;***      271 : 		}
	;***      272 : 
	;***      273 : //--------------------------------End testing code---------------------------------------------------------
	;***      274 : 		if ((g_machine_state.mode == WATER_WASHING)
	;***      275 : 				|| (g_machine_state.mode == INDIE)) {
	;***      276 : 
	;***      277 : 		}
	;***      278 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 278
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_12
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      279 : 	}
	;***      280 : 	/* End user code. Do not edit comment generated here */
	;***      281 : }
	;***      282 : 
	;***      283 : /***********************************************************************************************************************
	;***      284 :  * Function Name: R_MAIN_UserInit
	;***      285 :  * Description  : This function adds user code before implementing main function.
	;***      286 :  * Arguments    : None
	;***      287 :  * Return Value : None
	;***      288 :  ***********************************************************************************************************************/
	;***      289 : void R_MAIN_UserInit(void) {
	;***      290 : 	/* Start user code. Do not edit comment generated here */
	;***      291 : 	EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 291
	ei
	;***      292 : 	R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 292
	call !!_R_TAU0_Create
	;***      293 : 	R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 293
	call !!_R_SAU0_Create
	;***      294 : 	R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 294
	call !!_R_SAU1_Create
	;***      295 : 	R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 295
	call !!_R_UART1_Create
	;***      296 : 	R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 296
	call !!_R_UART2_Create
	;***      297 : 	R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 297
	call !!_R_UART3_Create
	;***      298 : 	R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 298
	call !!_R_RTC_Create
	;***      299 : 	R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 299
	call !!_R_PORT_Create_UserInit
	;***      300 : 	R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 300
	call !!_R_CSI01_Create
	;***      301 : 	R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 301
	call !!_R_CSI00_Create
	;***      302 : 
	;***      303 : 	R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 303
	call !!_R_TAU0_Channel0_Start
	;***      304 : 	R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 304
	call !!_R_UART3_Start
	;***      305 : 	R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 305
	call !!_R_UART1_Start
	;***      306 : 	R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 306
	call !!_R_UART2_Start
	;***      307 : 	R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 307
	call !!_R_CSI00_Start
	;***      308 : //    R_CSI01_Start();
	;***      309 : 
	;***      310 : 	R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 310
	call !!_R_ADC_Create
	;***      311 : 	R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 311
	call !!_R_ADC_Set_OperationOn
	;***      312 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 312
	call !!_R_ADC_Start
	;***      313 : 
	;***      314 : 	R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 314
	call !!_R_DAC_Create
	;***      315 : //	CVCC_Current_Set(0x0);
	;***      316 : //	Salt_Analog_Set(0x0);
	;***      317 : 	R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 317
	call !!_R_DAC0_Start
	;***      318 : 	R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 318
	br !!_R_DAC1_Start
	;***      319 : 	/* End user code. Do not edit comment generated here */
	;***      320 : }
	;***      321 : 
	;***      322 : /* Start user code for adding. Do not edit comment generated here */
	;***      323 : /* End user code. Do not edit comment generated here */
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
	.DS (42)
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
	.DS (42)
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
.STR@1685:
	.DS (1)
	.DB 0x01
	.DS (2)
	.DB 0x01
