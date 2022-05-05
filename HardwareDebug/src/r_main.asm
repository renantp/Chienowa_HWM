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
#@  compiled at Thu May 05 10:01:43 2022

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
	movw ax, #LOWW(_g_Tick+0x00090)
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
	;***      127 : /* End user code. Do not edit comment generated here */
	;***      128 : void R_MAIN_UserInit(void);
	;***      129 : 
	;***      130 : /***********************************************************************************************************************
	;***      131 : * Function Name: main
	;***      132 : * Description  : This function implements main function.
	;***      133 : * Arguments    : None
	;***      134 : * Return Value : None
	;***      135 : ***********************************************************************************************************************/
	;***      136 : void main(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 136
	subw sp, #0x10
	;***      137 : {
	;***      138 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 138
	call $!_R_MAIN_UserInit
	;***      139 :     /* Start user code. Do not edit comment generated here */
	;***      140 : 
	;***      141 : 	//TODO: EEPROM Initialize and read Setting
	;***      142 : 	EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 142
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	clrw ax
	;***      143 : 	EE_SPI_Read((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	push ax
	mov x, #0x29
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      144 : 			numberSettingSize);
	;***      145 : 	EE_SPI_Read((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	push ax
	mov x, #0x95
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      146 : 			timeSettingSize);
	;***      147 : 	EE_SPI_Read((uint8_t*) &g_test_control.data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	push ax
	incw ax
	push ax
	movw bc, #0x0029
	movw ax, #LOWW(_g_test_control)
	call !!_EE_SPI_Read
	addw sp, #0x04
	;***      148 : 	NUMBER_SETTING_ADDRESS + numberSettingSize, sizeof(g_test_control.data));
	;***      149 : 	// Set to default valve
	;***      150 : //	g_timerSetting.t1_initialWaterDrainageOperation_s > 180
	;***      151 : 	if (isnan(g_numberSetting.upperVoltage1)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 151
	movw bc, !LOWW(_g_numberSetting+0x00002)
	movw ax, !LOWW(_g_numberSetting)
	call !!___fpclassifyf
	cmpw ax, #0x0002
	sknz
.BB@LABEL@3_1:	; if_then_bb
	;***      152 : 		manufactureReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 152
	call !!_manufactureReset
.BB@LABEL@3_2:	; if_break_bb
	;***      153 : 	}
	;***      154 : 	_settingNumber = g_numberSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 154
	movw de, #0x002A
	movw bc, #LOWW(_g_numberSetting)
	movw ax, #LOWW(__settingNumber)
	call !!_memcpy
	;***      155 : 	_settingTime = g_timerSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 155
	movw de, #0x0096
	movw bc, #LOWW(_g_timerSetting)
	movw ax, #LOWW(__settingTime)
	call !!_memcpy
	;***      156 : 	EEPROM_PROTECT_EN();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 156
	clr1 0xFFF0E.0
	;***      157 : 	//TODO: Start receive command from Raspberry Pi
	;***      158 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 158
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      159 : 
	;***      160 : 	//TODO: Start receive data from RS485
	;***      161 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 161
	set1 0xFFF00.0
	;***      162 : 	R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 162
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	clrw ax
	;***      163 : 	uint8_t wts, vpcb, vpcb_v = 1;
	;***      164 : 	sendRS485(0xff, 82, 2, 12);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 164
	push ax
	mov x, #0x0C
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      165 : 
	;***      166 : 	//TODO: Turn off Hand Sensor LED
	;***      167 : 	g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 167
	mov !LOWW(_g_pre_color), #0x03
	;***      168 : 	handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 168
	clrb a
	call !!_handSensorLED
	movw hl, #LOWW(_g_test_control)
	;***      169 : 
	;***      170 : 	//TODO: Set default washing mode
	;***      171 : 	g_machine_mode = HAND_WASHING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 171
	oneb !LOWW(_g_machine_mode)
	bf [hl].1, $.BB@LABEL@3_4
.BB@LABEL@3_3:	; if_then_bb32
	;***      172 : //    sendToRasPi_f(H_SET, OK_ALL, 0x0);
	;***      173 : 
	;***      174 : //TODO: Run Initialize Operation
	;***      175 : 	if (g_test_control.raw.power_on == ON) {
	;***      176 : 		main_init_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 176
	call !!_main_init_20211111
.BB@LABEL@3_4:	; if_break_bb33
	movw ax, #0x40A0
	;***      177 : 	}
	;***      178 : 	//TODO: Output CVCC and Salt pump voltage
	;***      179 : 	CVCC_Current_Set(
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 179
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
	;***      180 : 			(uint8_t) (g_numberSetting.cvccCurrent/CVCC_MAX_VOLTAGE*255));
	;***      181 : 	Salt_Analog_Set(
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 181
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
	;***      182 : 			(uint8_t) (g_numberSetting.saltPumpVoltage/SALT_PUMP_MAX_VOLTAGE*255));
	;***      183 : 
	;***      184 : 	while (1U) {
	;***      185 : 
	;***      186 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 186
	call !!_realTimeResponse
	;***      187 : 		main_loop_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 187
	call !!_main_loop_20211111
	;***      188 : 
	;***      189 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 189
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      190 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	call !!_UpdateMachineStatus
	;***      191 : //		if (g_uart2_fault == 1) {
	;***      192 : //			R_UART2_Stop();
	;***      193 : //			delay_ms(10);
	;***      194 : //			R_UART2_Start();
	;***      195 : //			g_uart2_fault = 0;
	;***      196 : //		}
	;***      197 : 
	;***      198 : 		// Communication with WaterSoftener
	;***      199 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 199
	cmp0 !LOWW(_g_commnunication_flag+0x0000D)
	bz $.BB@LABEL@3_7
.BB@LABEL@3_6:	; if_then_bb49
	clrw ax
	;***      200 : 			sendRS485(0xff, 82, 2, 5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 200
	push ax
	mov x, #0x05
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      201 : //    		rx_count++;
	;***      202 : 			wts = 1; //Test flag = 1
	;***      203 : 			g_commnunication_flag.rs485_send_to_watersolfner_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 203
	clrb !LOWW(_g_commnunication_flag+0x0000D)
	oneb a
	mov [sp+0x00], a
.BB@LABEL@3_7:	; if_break_bb50
	;***      204 : 		}
	;***      205 : 		if (g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 205
	cmp !LOWW(_g_commnunication_flag+0x0000E), #0x01
	bnz $.BB@LABEL@3_11
.BB@LABEL@3_8:	; if_then_bb56
	;***      206 : 			// Sand to Water softener SV state
	;***      207 : 			sendRS485(0xff, 82, 24,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 207
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
	;***      208 : 					(uint32_t) g_io_status.refined.io.Valve.SV1 == 1 ? 1 : 0);
	;***      209 : 			g_commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 209
	clrb !LOWW(_g_commnunication_flag+0x0000E)
.BB@LABEL@3_11:	; if_break_bb70
	mov a, [sp+0x00]
	;***      210 : 		}
	;***      211 : 		// Test SV1 for Water Softener
	;***      212 : 		if (wts != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 212
	cmp0 a
	bnz $.BB@LABEL@3_13
.BB@LABEL@3_12:	; if_else_bb90
	;***      213 : 			if (ns_delay_ms(&g_Tick.tickWaterSoftenerPCB, 5000)) {
	;***      214 : 				if (wts == 1) {
	;***      215 : 					O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      216 : //					sendRS485(1, 82, 24,(uint32_t) 1);
	;***      217 : //					sendRS485(0xff, 82, 24,(uint32_t) 1);
	;***      218 : 					wts = 2;
	;***      219 : 				} else {
	;***      220 : 					O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***      221 : //    				sendRS485(1, 82, 24,(uint32_t) 0);
	;***      222 : //					sendRS485(0xff, 82, 24,(uint32_t) 0);
	;***      223 : 					wts = 0;
	;***      224 : 				}
	;***      225 : 			}
	;***      226 : 		} else {
	;***      227 : 			g_Tick.tickWaterSoftenerPCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 227
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00050), ax
	br $.BB@LABEL@3_17
.BB@LABEL@3_13:	; if_then_bb76
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 213
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 214
	dec a
	bnz $.BB@LABEL@3_16
.BB@LABEL@3_15:	; if_then_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	set1 0xFFF01.7
	mov [sp+0x00], #0x02
	br $.BB@LABEL@3_17
.BB@LABEL@3_16:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 220
	clr1 0xFFF01.7
	clrb a
	mov [sp+0x00], a
.BB@LABEL@3_17:	; if_break_bb92
	;***      228 : 		}
	;***      229 : 
	;***      230 : 		//---------------------------------Valve PCB------------------------------------
	;***      231 : 		if (g_commnunication_flag.rs485_send_to_valve_response_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 231
	cmp !LOWW(_g_commnunication_flag+0x0000F), #0x01
	bnz $.BB@LABEL@3_19
.BB@LABEL@3_18:	; if_then_bb98
	movw ax, sp
	addw ax, #0x0006
	movw [sp+0x04], ax
	;***      232 : 			// 0xff, 12, {Mode, Valve 1, Valve 2, Valve 3, 1}
	;***      233 : 			// 0 - Stand alone 1 - Control Valve
	;***      234 : 			uint8_t _b[5] = { vpcb_v, g_uart3_sendend % 2, g_systemTime % 2, 0,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 234
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
	;***      235 : 					1 };
	;***      236 : 			sendR485_7byte(0xff, 12, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 236
	movw ax, #0xFF0C
	call !!_sendR485_7byte
	;***      237 : 			vpcb++;
	;***      238 : 			g_commnunication_flag.rs485_send_to_valve_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 238
	clrb !LOWW(_g_commnunication_flag+0x0000F)
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 237
	inc a
	mov [sp+0x01], a
	br $.BB@LABEL@3_21
.BB@LABEL@3_19:	; if_else_bb116
	;***      239 : 		} else if (g_commnunication_flag.rs485_get_valve_gesture_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 239
	cmp !LOWW(_g_commnunication_flag+0x00010), #0x01
	bnz $.BB@LABEL@3_21
.BB@LABEL@3_20:	; if_then_bb122
	movw ax, sp
	addw ax, #0x000B
	movw [sp+0x04], ax
	;***      240 : 			uint8_t _b[5] = { 0, 1, 0, 0, 1 };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 240
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1707)
	call !!_memcpy
	movw ax, [sp+0x04]
	movw bc, ax
	;***      241 : 			sendR485_7byte(0xff, 1, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 241
	movw ax, #0xFF01
	call !!_sendR485_7byte
	;***      242 : 			g_commnunication_flag.rs485_get_valve_gesture_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 242
	clrb !LOWW(_g_commnunication_flag+0x00010)
.BB@LABEL@3_21:	; if_break_bb126
	mov a, [sp+0x01]
	;***      243 : 		}
	;***      244 : 
	;***      245 : 		if (vpcb != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 245
	cmp0 a
	bnz $.BB@LABEL@3_23
.BB@LABEL@3_22:	; if_else_bb150
	;***      246 : 			if (ns_delay_ms(&g_Tick.tickValvePCB, 5000)) {
	;***      247 : 				vpcb_v = vpcb_v == 1 ? 0 : 1;
	;***      248 : 				vpcb = 0;
	;***      249 : 			}
	;***      250 : 		} else {
	;***      251 : 			g_Tick.tickValvePCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 251
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	br $.BB@LABEL@3_26
.BB@LABEL@3_23:	; if_then_bb132
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 246
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 247
	dec a
	clrb a
	mov [sp+0x01], a
	bnz $.BB@LABEL@3_28
.BB@LABEL@3_25:	; if_then_bb137.if_break_bb152_crit_edge
	mov [sp+0x02], a
.BB@LABEL@3_26:	; if_break_bb152
	;***      252 : 		}
	;***      253 : 
	;***      254 : 		//RS485 fault check
	;***      255 : 		if (g_commnunication_flag.rs485_fault == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 255
	cmp !LOWW(_g_commnunication_flag+0x00011), #0x01
	bnz $.BB@LABEL@3_29
.BB@LABEL@3_27:	; if_then_bb158
	;***      256 : 			R_UART3_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 256
	call !!_R_UART3_Stop
	;***      257 : 			g_commnunication_flag.rs485_fault++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 257
	inc !LOWW(_g_commnunication_flag+0x00011)
	;***      258 : 			g_Tick.tickRS485 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 258
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
	br $.BB@LABEL@3_32
.BB@LABEL@3_28:	; bb143
	oneb a
	br $.BB@LABEL@3_25
.BB@LABEL@3_29:	; if_else_bb162
	;***      259 : 		} else if (g_commnunication_flag.rs485_fault == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 259
	cmp !LOWW(_g_commnunication_flag+0x00011), #0x02
	bnz $.BB@LABEL@3_32
.BB@LABEL@3_30:	; if_then_bb168
	;***      260 : 			if (ns_delay_ms(&g_Tick.tickRS485, 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 260
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_32
.BB@LABEL@3_31:	; if_then_bb173
	;***      261 : 				R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 261
	call !!_R_UART3_Start
	;***      262 : 				R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 262
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      263 : 				g_commnunication_flag.rs485_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 263
	clrb !LOWW(_g_commnunication_flag+0x00011)
.BB@LABEL@3_32:	; if_break_bb177
	;***      264 : 			}
	;***      265 : 		}
	;***      266 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      267 : 
	;***      268 : 		flow_p = I_FLOW_PLUSE_PIN == 1 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 268
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_33:	; bb185
	clrb a
.BB@LABEL@3_34:	; bb187
	mov !LOWW(_flow_p), a
	;***      269 : 		if (ns_delay_ms(&g_Tick.tickCustom[1], 60000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 269
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick+0x0009C)
	call !!_ns_delay_ms
	;***      270 : 
	;***      271 : 		}
	;***      272 : 
	;***      273 : 		if (ns_delay_ms(&g_Tick.tick1s, 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 273
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_38
.BB@LABEL@3_35:	; if_then_bb201
	;***      274 : //			rx_count++;
	;***      275 : //			O_PUMP_PRESS_PIN = ~O_PUMP_PRESS_PIN;
	;***      276 : 			led_st = led_st == 0 ? 0xff : 0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 276
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_36:	; bb207
	clrb a
.BB@LABEL@3_37:	; bb209
	mov !LOWW(_led_st), a
	;***      277 : 			uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 277
	mov a, !LOWW(_g_uart2_sendend)
	;***      278 : 			g_crc[6] = crc8_4((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 278
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      279 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      280 : 			g_crc[7] = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 280
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
.BB@LABEL@3_38:	; if_break_bb224
	;***      281 : 					sizeof(struct Timer_Setting_s) - 2);
	;***      282 : //			}
	;***      283 : 			if (led_st == 0x00) {
	;***      284 : 
	;***      285 : 			} else {
	;***      286 : 
	;***      287 : 
	;***      288 : 			}
	;***      289 : 		}
	;***      290 : 
	;***      291 : //--------------------------------End testing code---------------------------------------------------------
	;***      292 : 		if ((g_machine_state.mode == WATER_WASHING)
	;***      293 : 				|| (g_machine_state.mode == INDIE)) {
	;***      294 : 
	;***      295 : 		}
	;***      296 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 296
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_5
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      297 : 	}
	;***      298 : 	/* End user code. Do not edit comment generated here */
	;***      299 : }
	;***      300 : 
	;***      301 : /***********************************************************************************************************************
	;***      302 : * Function Name: R_MAIN_UserInit
	;***      303 : * Description  : This function adds user code before implementing main function.
	;***      304 : * Arguments    : None
	;***      305 : * Return Value : None
	;***      306 : ***********************************************************************************************************************/
	;***      307 : void R_MAIN_UserInit(void)
	;***      308 : {
	;***      309 :     /* Start user code. Do not edit comment generated here */
	;***      310 : 	EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 310
	ei
	;***      311 : 	R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 311
	call !!_R_TAU0_Create
	;***      312 : 	R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 312
	call !!_R_SAU0_Create
	;***      313 : 	R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 313
	call !!_R_SAU1_Create
	;***      314 : 	R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 314
	call !!_R_UART1_Create
	;***      315 : 	R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 315
	call !!_R_UART2_Create
	;***      316 : 	R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 316
	call !!_R_UART3_Create
	;***      317 : 	R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 317
	call !!_R_RTC_Create
	;***      318 : 	R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 318
	call !!_R_PORT_Create_UserInit
	;***      319 : 	R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 319
	call !!_R_CSI01_Create
	;***      320 : 	R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 320
	call !!_R_CSI00_Create
	;***      321 : 
	;***      322 : 	R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 322
	call !!_R_TAU0_Channel0_Start
	;***      323 : 	R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 323
	call !!_R_UART3_Start
	;***      324 : 	R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 324
	call !!_R_UART1_Start
	;***      325 : 	R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 325
	call !!_R_UART2_Start
	;***      326 : 	R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 326
	call !!_R_CSI00_Start
	;***      327 : //    R_CSI01_Start();
	;***      328 : 
	;***      329 : 	R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 329
	call !!_R_ADC_Create
	;***      330 : 	R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 330
	call !!_R_ADC_Set_OperationOn
	;***      331 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 331
	call !!_R_ADC_Start
	;***      332 : 
	;***      333 : 	R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 333
	call !!_R_DAC_Create
	;***      334 : //	CVCC_Current_Set(0x0);
	;***      335 : //	Salt_Analog_Set(0x0);
	;***      336 : 	R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 336
	call !!_R_DAC0_Start
	;***      337 : 	R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 337
	br !!_R_DAC1_Start
	;***      338 : 	/* End user code. Do not edit comment generated here */
	;***      339 : }
	;***      340 : 
	;***      341 : /* Start user code for adding. Do not edit comment generated here */
	;***      342 : /* End user code. Do not edit comment generated here */
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
	.SECTION .const,CONST
.STR@1:
	.DS (4)
	.DB 0x01
.STR@1707:
	.DS (1)
	.DB 0x01
	.DS (2)
	.DB 0x01
