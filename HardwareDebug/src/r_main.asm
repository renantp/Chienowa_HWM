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
#@  compiled at Thu Jun 30 14:37:29 2022

	.EXTERN _g_color
	.EXTERN _g_pre_color
	.EXTERN __settingTime
	.EXTERN __settingNumber
	.EXTERN _g_control_setting
	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_io_status
	.EXTERN _g_Tick
	.EXTERN _g_commnunication_flag
	.EXTERN _g_machine_mode
	.EXTERN _g_systemTime
	.EXTERN _g_csi_rev_end
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
	.PUBLIC _g_control_buffer_i32
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
	.PUBLIC _io_testsize
	.PUBLIC _nostop_checkHandSensor
	.EXTERN _ns_delay_ms
	.PUBLIC _readHS
	.EXTERN _delay_ms
	.PUBLIC _main
	.PUBLIC _R_MAIN_UserInit
	.EXTERN _EEPROM_Init
	.EXTERN _EE_SPI_Read
	.EXTERN ___fpclassifyf
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
	.EXTERN _R_UART2_Start
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
	;***       26 : * Creation Date: 19/04/2022
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
	;***       46 : #include "hwm/hwm_main.h"
	;***       47 : #include "r_cg_userdefine.h"
	;***       48 : #include <math.h>
	;***       49 : 
	;***       50 : /***********************************************************************************************************************
	;***       51 :  Pragma directive
	;***       52 :  ***********************************************************************************************************************/
	;***       53 : /* Start user code for pragma. Do not edit comment generated here */
	;***       54 : 
	;***       55 : //#define TESTING_FIRMWARE
	;***       56 : /* End user code. Do not edit comment generated here */
	;***       57 : #include "r_cg_userdefine.h"
	;***       58 : 
	;***       59 : /***********************************************************************************************************************
	;***       60 : Pragma directive
	;***       61 : ***********************************************************************************************************************/
	;***       62 : /* Start user code for pragma. Do not edit comment generated here */
	;***       63 : 
	;***       64 : //#define TESTING_FIRMWARE
	;***       65 : /* End user code. Do not edit comment generated here */
	;***       66 : 
	;***       67 : /***********************************************************************************************************************
	;***       68 : Global variables and functions
	;***       69 : ***********************************************************************************************************************/
	;***       70 : /* Start user code for global. Do not edit comment generated here */
	;***       71 : 
	;***       72 : volatile int g_adc_ch = 0;
	;***       73 : union EEPROM_status_u g_e_status;
	;***       74 : struct Number_Setting_s ret_number_setting;
	;***       75 : uint8_t led_st = 0xff;
	;***       76 : uint8_t flow_p, salt_h_p;
	;***       77 : uint8_t g_eeprom_wren;
	;***       78 : uint8_t send_data[2] = { 0x23, 0xab };
	;***       79 : uint8_t receive_data[2];
	;***       80 : struct Number_Setting_s receive_setting;
	;***       81 : union EEPROM_status_u set;
	;***       82 : uint32_t rx_data[3];
	;***       83 : float data_f;
	;***       84 : union byte_to_float data_f_test;
	;***       85 : struct UART_Buffer_float_s g_control_buffer_f;
	;***       86 : struct UART_Buffer_u32_s g_control_buffer_u32;
	;***       87 : struct UART_Buffer_i32_s g_control_buffer_i32;
	;***       88 : 
	;***       89 : union {
	;***       90 : 	struct {
	;***       91 : 		uint8_t up_signal;
	;***       92 : 	};
	;***       93 : 	uint8_t status;
	;***       94 : } handsensor_status;
	;***       95 : uint8_t g_handsensor_status[2];
	;***       96 : void nostop_checkHandSensor(void) {
	;***       97 : 	if (DETECT_U() == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 97
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_5
.BB@LABEL@1_1:	; if_then_bb
	;***       98 : 		if (ns_delay_ms(&g_Tick.tickHandSensor[0], 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 98
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00098)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@1_9
.BB@LABEL@1_2:	; if_then_bb16
	;***       99 : 			g_handsensor_status[0] = g_handsensor_status[0] == 0 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 99
	cmp0 !LOWW(_g_handsensor_status)
	oneb a
	skz
.BB@LABEL@1_3:	; bb22
	clrb a
.BB@LABEL@1_4:	; bb24
	mov !LOWW(_g_handsensor_status), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 108
	ret
.BB@LABEL@1_5:	; if_else_bb
	;***      100 : 		}
	;***      101 : 	} else if (DETECT_D() == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 101
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@1_7
.BB@LABEL@1_6:	; if_then_bb43
	;***      102 : 		g_handsensor_status[1] = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 102
	oneb !LOWW(_g_handsensor_status+0x00001)
	ret
.BB@LABEL@1_7:	; if_else_bb44
	;***      103 : 	} else if (DETECT_U() == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 103
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_9
.BB@LABEL@1_8:	; if_else_bb61
	;***      104 : 
	;***      105 : 	} else if (DETECT_D() == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 105
	mov a, 0xFFF07
.BB@LABEL@1_9:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 108
	ret
_readHS:
	.STACK _readHS = 4
	;***      106 : 
	;***      107 : 	}
	;***      108 : }
	;***      109 : uint8_t readHS(void) {
	;***      110 : 	if (DETECT_U()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 110
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@2_2
.BB@LABEL@2_1:	; bb33
	;***      111 : 		delay_ms(2);
	;***      112 : 		if (DETECT_U())
	;***      113 : 			return 1;
	;***      114 : 		return 0;
	;***      115 : 	} else
	;***      116 : 		return 0;
	;***      117 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 117
	clrb a
	ret
.BB@LABEL@2_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 111
	clrw bc
	onew ax
	incw ax
	call !!_delay_ms
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 112
	mov a, 0xFFF07
	shr a, 0x05
	and a, #0x01
	ret
_main:
	.STACK _main = 24
	;***      118 : 
	;***      119 : uint8_t this_size = sizeof(g_io_status);
	;***      120 : uint8_t this_size_2 = sizeof(union IO_Status_u);
	;***      121 : uint8_t send_buf[7] = { 8, 1, 2, 3, 4, 5, 6 };
	;***      122 : char g_crc[8];
	;***      123 : uint32_t g_crc_32[8];
	;***      124 : uint32_t data_crc[2] = { 30500, 60200 };
	;***      125 : uint8_t rx_count;
	;***      126 : uint8_t dac_out[2] = { 0xff, 0xff };
	;***      127 : uint8_t io_testsize;
	;***      128 : /* End user code. Do not edit comment generated here */
	;***      129 : void R_MAIN_UserInit(void);
	;***      130 : 
	;***      131 : /***********************************************************************************************************************
	;***      132 : * Function Name: main
	;***      133 : * Description  : This function implements main function.
	;***      134 : * Arguments    : None
	;***      135 : * Return Value : None
	;***      136 : ***********************************************************************************************************************/
	;***      137 : void main(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 137
	subw sp, #0x10
	;***      138 : {
	;***      139 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 139
	call $!_R_MAIN_UserInit
	;***      140 :     /* Start user code. Do not edit comment generated here */
	;***      141 : 
	;***      142 : 	//TODO: EEPROM Initialize and read Setting
	;***      143 : 	EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	clrw ax
	;***      144 : 	EE_SPI_Read((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 144
	push ax
	mov x, #0x29
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      145 : 			numberSettingSize);
	;***      146 : 	EE_SPI_Read((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 146
	push ax
	mov x, #0xA1
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      147 : 			timeSettingSize);
	;***      148 : 	EE_SPI_Read((uint8_t*) &g_control_setting.data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 148
	push ax
	incw ax
	push ax
	movw bc, #0x0029
	movw ax, #LOWW(_g_control_setting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	;***      149 : 	NUMBER_SETTING_ADDRESS + numberSettingSize, sizeof(g_control_setting.data));
	;***      150 : 	// Set to default valve
	;***      151 : //	g_timerSetting.t1_initialWaterDrainageOperation_s > 180
	;***      152 : 	io_testsize = sizeof(g_io_status);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 152
	mov !LOWW(_io_testsize), #0x10
	;***      153 : 	if (isnan(g_numberSetting.saltPumpVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 153
	movw bc, !LOWW(_g_numberSetting+0x00026)
	movw ax, !LOWW(_g_numberSetting+0x00024)
	call !!___fpclassifyf
	cmpw ax, #0x0002
	sknz
.BB@LABEL@3_1:	; if_then_bb
	;***      154 : 		manufactureReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 154
	call !!_manufactureReset
.BB@LABEL@3_2:	; if_break_bb
	;***      155 : 	}
	;***      156 : //	manufactureReset();
	;***      157 : 	_settingNumber = g_numberSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 157
	movw de, #0x002A
	movw bc, #LOWW(_g_numberSetting)
	movw ax, #LOWW(__settingNumber)
	call !!_memcpy
	;***      158 : 	_settingTime = g_timerSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 158
	movw de, #0x00A2
	movw bc, #LOWW(_g_timerSetting)
	movw ax, #LOWW(__settingTime)
	call !!_memcpy
	;***      159 : 	EEPROM_PROTECT_EN();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 159
	clr1 0xFFF0E.0
	;***      160 : 	//TODO: Start receive command from Raspberry Pi
	;***      161 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 161
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      162 : 
	;***      163 : 	//TODO: Start receive data from RS485
	;***      164 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 164
	set1 0xFFF00.0
	;***      165 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 165
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	clrw ax
	;***      166 : 	uint8_t wts, vpcb, vpcb_v = 1;
	;***      167 : 	sendRS485(0xff, 82, 2, 12);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 167
	push ax
	mov x, #0x0C
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      168 : 
	;***      169 : 	//TODO: Turn off Hand Sensor LED
	;***      170 : 	g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 170
	mov !LOWW(_g_pre_color), #0x03
	;***      171 : 	handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 171
	clrb a
	call !!_handSensorLED
	movw hl, #LOWW(_g_control_setting)
	;***      172 : 
	;***      173 : 	//TODO: Set default washing mode
	;***      174 : 	g_machine_mode = HAND_WASHING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 174
	oneb !LOWW(_g_machine_mode)
	bf [hl].1, $.BB@LABEL@3_4
.BB@LABEL@3_3:	; if_then_bb32
	;***      175 : //    sendToRasPi_f(H_SET, OK_ALL, 0x0);
	;***      176 : 
	;***      177 : //TODO: Run Initialize Operation
	;***      178 : 	if (g_control_setting.raw.power_on == ON) {
	;***      179 : 		main_init_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 179
	call !!_main_init_20211111
.BB@LABEL@3_4:	; if_break_bb33
	movw ax, #0x40A0
	;***      180 : 	}
	;***      181 : 	//TODO: Output CVCC and Salt pump voltage
	;***      182 : 	CVCC_Current_Set(
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 182
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
	;***      183 : 			(uint8_t) (g_numberSetting.cvccCurrent/CVCC_MAX_VOLTAGE*255));
	;***      184 : 	Salt_Analog_Set(
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 184
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
.BB@LABEL@3_5:	; bb244
	;***      185 : 			(uint8_t) (g_numberSetting.saltPumpVoltage/SALT_PUMP_MAX_VOLTAGE*255));
	;***      186 : 
	;***      187 : 	while (1U) {
	;***      188 : 
	;***      189 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 189
	call !!_realTimeResponse
	;***      190 : 		main_loop_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	call !!_main_loop_20211111
	;***      191 : 
	;***      192 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 192
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      193 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 193
	call !!_UpdateMachineStatus
	;***      194 : //		if (g_uart2_fault == 1) {
	;***      195 : //			R_UART2_Stop();
	;***      196 : //			delay_ms(10);
	;***      197 : //			R_UART2_Start();
	;***      198 : //			g_uart2_fault = 0;
	;***      199 : //		}
	;***      200 : 
	;***      201 : 		// Communication with WaterSoftener
	;***      202 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 202
	cmp0 !LOWW(_g_commnunication_flag+0x00011)
	bz $.BB@LABEL@3_7
.BB@LABEL@3_6:	; if_then_bb49
	clrw ax
	;***      203 : 			sendRS485(0xff, 82, 2, 5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 203
	push ax
	mov x, #0x05
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      204 : //    		rx_count++;
	;***      205 : 			wts = 1; //Test flag = 1
	;***      206 : 			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 206
	clrb !LOWW(_g_commnunication_flag+0x00011)
	oneb a
	mov [sp+0x00], a
.BB@LABEL@3_7:	; if_break_bb50
	;***      207 : 		}
	;***      208 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 208
	cmp !LOWW(_g_commnunication_flag+0x00012), #0x01
	bnz $.BB@LABEL@3_11
.BB@LABEL@3_8:	; if_then_bb56
	;***      209 : 			// Sand to Water softener SV state
	;***      210 : 			sendRS485(0xff, 82, 24,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 210
	movw hl, #LOWW(_g_io_status+0x00001)
	onew bc
	bt [hl].0, $.BB@LABEL@3_10
.BB@LABEL@3_9:	; bb64
	decw bc
.BB@LABEL@3_10:	; bb66
	clrw ax
	push ax
	push bc
	mov c, #0x18
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      211 : 					(uint32_t) g_io_status.refined.io.Valve.SV1 == 1 ? 1 : 0);
	;***      212 : 			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 212
	clrb !LOWW(_g_commnunication_flag+0x00012)
.BB@LABEL@3_11:	; if_break_bb70
	mov a, [sp+0x00]
	;***      213 : 		}
	;***      214 : 		// Test SV1 for Water Softener
	;***      215 : 		if (wts != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	cmp0 a
	bnz $.BB@LABEL@3_13
.BB@LABEL@3_12:	; if_else_bb90
	;***      216 : 			if (ns_delay_ms(&g_Tick.tickWaterSoftenerPCB, 5000)) {
	;***      217 : 				if (wts == 1) {
	;***      218 : 					O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      219 : //					sendRS485(1, 82, 24,(uint32_t) 1);
	;***      220 : //					sendRS485(0xff, 82, 24,(uint32_t) 1);
	;***      221 : 					wts = 2;
	;***      222 : 				} else {
	;***      223 : 					O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***      224 : //    				sendRS485(1, 82, 24,(uint32_t) 0);
	;***      225 : //					sendRS485(0xff, 82, 24,(uint32_t) 0);
	;***      226 : 					wts = 0;
	;***      227 : 				}
	;***      228 : 			}
	;***      229 : 		} else {
	;***      230 : 			g_Tick.tickWaterSoftenerPCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 230
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00050), ax
	br $.BB@LABEL@3_17
.BB@LABEL@3_13:	; if_then_bb76
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 216
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x00050)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_17
.BB@LABEL@3_14:	; if_then_bb81
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 217
	dec a
	bnz $.BB@LABEL@3_16
.BB@LABEL@3_15:	; if_then_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 218
	set1 0xFFF01.7
	mov [sp+0x00], #0x02
	br $.BB@LABEL@3_17
.BB@LABEL@3_16:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 223
	clr1 0xFFF01.7
	clrb a
	mov [sp+0x00], a
.BB@LABEL@3_17:	; if_break_bb92
	;***      231 : 		}
	;***      232 : 
	;***      233 : 		//---------------------------------Valve PCB------------------------------------
	;***      234 : 		if (g_commnunication_flag.rs485_send_to_valve_response_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 234
	cmp !LOWW(_g_commnunication_flag+0x00013), #0x01
	bnz $.BB@LABEL@3_19
.BB@LABEL@3_18:	; if_then_bb98
	movw ax, sp
	addw ax, #0x0006
	movw [sp+0x04], ax
	;***      235 : 			// 0xff, 12, {Mode, Valve 1, Valve 2, Valve 3, 1}
	;***      236 : 			// 0 - Stand alone 1 - Control Valve
	;***      237 : 			uint8_t _b[5] = { vpcb_v, g_uart3_sendend % 2, g_systemTime % 2, 0,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 237
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
	;***      238 : 					1 };
	;***      239 : 			sendR485_7byte(0xff, 12, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 239
	movw ax, #0xFF0C
	call !!_sendR485_7byte
	;***      240 : 			vpcb++;
	;***      241 : 			g_commnunication_flag.rs485_send_to_valve_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 241
	clrb !LOWW(_g_commnunication_flag+0x00013)
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 240
	inc a
	mov [sp+0x01], a
	br $.BB@LABEL@3_21
.BB@LABEL@3_19:	; if_else_bb116
	;***      242 : 		} else if (g_commnunication_flag.rs485_get_valve_gesture_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 242
	cmp !LOWW(_g_commnunication_flag+0x00014), #0x01
	bnz $.BB@LABEL@3_21
.BB@LABEL@3_20:	; if_then_bb122
	movw ax, sp
	addw ax, #0x000B
	movw [sp+0x04], ax
	;***      243 : 			uint8_t _b[5] = { 0, 1, 0, 0, 1 };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 243
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1730)
	call !!_memcpy
	movw ax, [sp+0x04]
	movw bc, ax
	;***      244 : 			sendR485_7byte(0xff, 1, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 244
	movw ax, #0xFF01
	call !!_sendR485_7byte
	;***      245 : 			g_commnunication_flag.rs485_get_valve_gesture_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 245
	clrb !LOWW(_g_commnunication_flag+0x00014)
.BB@LABEL@3_21:	; if_break_bb126
	mov a, [sp+0x01]
	;***      246 : 		}
	;***      247 : 
	;***      248 : 		if (vpcb != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 248
	cmp0 a
	bnz $.BB@LABEL@3_23
.BB@LABEL@3_22:	; if_else_bb150
	;***      249 : 			if (ns_delay_ms(&g_Tick.tickValvePCB, 5000)) {
	;***      250 : 				vpcb_v = vpcb_v == 1 ? 0 : 1;
	;***      251 : 				vpcb = 0;
	;***      252 : 			}
	;***      253 : 		} else {
	;***      254 : 			g_Tick.tickValvePCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 254
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	br $.BB@LABEL@3_26
.BB@LABEL@3_23:	; if_then_bb132
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 249
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x00054)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_26
.BB@LABEL@3_24:	; if_then_bb137
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 250
	dec a
	clrb a
	mov [sp+0x01], a
	bnz $.BB@LABEL@3_28
.BB@LABEL@3_25:	; if_then_bb137.if_break_bb152_crit_edge
	mov [sp+0x02], a
.BB@LABEL@3_26:	; if_break_bb152
	;***      255 : 		}
	;***      256 : 
	;***      257 : 		//RS485 fault check
	;***      258 : 		if (g_commnunication_flag.rs485_fault == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 258
	cmp !LOWW(_g_commnunication_flag+0x00015), #0x01
	bnz $.BB@LABEL@3_29
.BB@LABEL@3_27:	; if_then_bb158
	;***      259 : 			R_UART3_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 259
	call !!_R_UART3_Stop
	;***      260 : 			g_commnunication_flag.rs485_fault++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 260
	inc !LOWW(_g_commnunication_flag+0x00015)
	;***      261 : 			g_Tick.tickRS485 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 261
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
	br $.BB@LABEL@3_32
.BB@LABEL@3_28:	; bb143
	oneb a
	br $.BB@LABEL@3_25
.BB@LABEL@3_29:	; if_else_bb162
	;***      262 : 		} else if (g_commnunication_flag.rs485_fault == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 262
	cmp !LOWW(_g_commnunication_flag+0x00015), #0x02
	bnz $.BB@LABEL@3_32
.BB@LABEL@3_30:	; if_then_bb168
	;***      263 : 			if (ns_delay_ms(&g_Tick.tickRS485, 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 263
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_32
.BB@LABEL@3_31:	; if_then_bb173
	;***      264 : 				R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 264
	call !!_R_UART3_Start
	;***      265 : 				R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 265
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      266 : 				g_commnunication_flag.rs485_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 266
	clrb !LOWW(_g_commnunication_flag+0x00015)
.BB@LABEL@3_32:	; if_break_bb177
	;***      267 : 			}
	;***      268 : 		}
	;***      269 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      270 : 
	;***      271 : 		flow_p = I_FLOW_PLUSE_PIN == 1 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 271
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_33:	; bb185
	clrb a
.BB@LABEL@3_34:	; bb187
	mov !LOWW(_flow_p), a
	;***      272 : 		if (ns_delay_ms(&g_Tick.tickCustom[1], 60000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 272
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick+0x000A4)
	call !!_ns_delay_ms
	;***      273 : 
	;***      274 : 		}
	;***      275 : 
	;***      276 : 		if (ns_delay_ms(&g_Tick.tick1s, 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 276
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_38
.BB@LABEL@3_35:	; if_then_bb201
	;***      277 : //			rx_count++;
	;***      278 : //			O_PUMP_PRESS_PIN = ~O_PUMP_PRESS_PIN;
	;***      279 : 			led_st = led_st == 0 ? 0xff : 0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 279
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_36:	; bb207
	clrb a
.BB@LABEL@3_37:	; bb209
	mov !LOWW(_led_st), a
	;***      280 : 			uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 280
	mov a, !LOWW(_g_uart2_sendend)
	;***      281 : 			g_crc[6] = crc8_4((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 281
	mov c, #0xA0
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      282 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      283 : 			g_crc[7] = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 283
	mov c, #0xA0
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
.BB@LABEL@3_38:	; if_break_bb224
	;***      284 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      285 : //			}
	;***      286 : 			if (led_st == 0x00) {
	;***      287 : 
	;***      288 : 			} else {
	;***      289 : 
	;***      290 : 
	;***      291 : 			}
	;***      292 : 		}
	;***      293 : 
	;***      294 : //--------------------------------End testing code---------------------------------------------------------
	;***      295 : 		if ((g_machine_state.mode == WATER_WASHING)
	;***      296 : 				|| (g_machine_state.mode == INDIE)) {
	;***      297 : 
	;***      298 : 		}
	;***      299 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 299
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_5
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      300 : 	}
	;***      301 : 	/* End user code. Do not edit comment generated here */
	;***      302 : }
	;***      303 : 
	;***      304 : /***********************************************************************************************************************
	;***      305 : * Function Name: R_MAIN_UserInit
	;***      306 : * Description  : This function adds user code before implementing main function.
	;***      307 : * Arguments    : None
	;***      308 : * Return Value : None
	;***      309 : ***********************************************************************************************************************/
	;***      310 : void R_MAIN_UserInit(void)
	;***      311 : {
	;***      312 :     /* Start user code. Do not edit comment generated here */
	;***      313 : 	EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 313
	ei
	;***      314 : 	R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 314
	call !!_R_TAU0_Create
	;***      315 : 	R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 315
	call !!_R_SAU0_Create
	;***      316 : 	R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 316
	call !!_R_SAU1_Create
	;***      317 : 	R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 317
	call !!_R_UART1_Create
	;***      318 : 	R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 318
	call !!_R_UART2_Create
	;***      319 : 	R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 319
	call !!_R_UART3_Create
	;***      320 : 	R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 320
	call !!_R_RTC_Create
	;***      321 : 	R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 321
	call !!_R_PORT_Create_UserInit
	;***      322 : 	R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 322
	call !!_R_CSI01_Create
	;***      323 : 	R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 323
	call !!_R_CSI00_Create
	;***      324 : 
	;***      325 : 	R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 325
	call !!_R_TAU0_Channel0_Start
	;***      326 : 	R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 326
	call !!_R_UART3_Start
	;***      327 : 	R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 327
	call !!_R_UART1_Start
	;***      328 : 	R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 328
	call !!_R_UART2_Start
	;***      329 : 	R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 329
	call !!_R_CSI00_Start
	;***      330 : //    R_CSI01_Start();
	;***      331 : 
	;***      332 : 	R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 332
	call !!_R_ADC_Create
	;***      333 : 	R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 333
	call !!_R_ADC_Set_OperationOn
	;***      334 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 334
	call !!_R_ADC_Start
	;***      335 : 
	;***      336 : 	R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 336
	call !!_R_DAC_Create
	;***      337 : //	CVCC_Current_Set(0x0);
	;***      338 : //	Salt_Analog_Set(0x0);
	;***      339 : 	R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 339
	call !!_R_DAC0_Start
	;***      340 : 	R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 340
	br !!_R_DAC1_Start
	;***      341 : 	/* End user code. Do not edit comment generated here */
	;***      342 : }
	;***      343 : 
	;***      344 : /* Start user code for adding. Do not edit comment generated here */
	;***      345 : /* End user code. Do not edit comment generated here */
	.SECTION .data,DATA
	.ALIGN 2
_g_adc_ch:
	.DS (2)
_led_st:
	.DB 0xFF
_send_data:
	.DB 0x23,0xAB
_this_size:
	.DB 0x10
_this_size_2:
	.DB 0x10
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
	.ALIGN 2
_g_control_buffer_i32:
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
_io_testsize:
	.DS (1)
	.SECTION .const,CONST
.STR@1:
	.DS (4)
	.DB 0x01
.STR@1730:
	.DS (1)
	.DB 0x01
	.DS (2)
	.DB 0x01
