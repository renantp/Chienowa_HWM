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
#@  compiled at Thu Dec 30 14:35:53 2021

	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_io_status
	.EXTERN _g_Tick
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
	.EXTERN _commnunication_flag
	.EXTERN __settingTime
	.EXTERN __settingNumber
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
	.EXTERN _handSensorLED
	.EXTERN _sendToRasPi_f
	.EXTERN _main_init_20211111
	.EXTERN _sendRS485
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
	movw ax, #LOWW(_g_Tick+0x0007C)
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
	;***      128 :     EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 128
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	clrw ax
	;***      129 :     EE_SPI_Read((uint8_t *)&g_numberSetting, NUMBER_SETTING_ADDRESS, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 129
	push ax
	mov x, #0x25
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      130 :     EE_SPI_Read((uint8_t *)&g_timerSetting, TIME_SETTING_ADDRESS, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 130
	push ax
	mov x, #0x8D
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	;***      131 :     _settingNumber = g_numberSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 131
	movw de, #0x0026
	movw bc, #LOWW(_g_numberSetting)
	movw ax, #LOWW(__settingNumber)
	call !!_memcpy
	;***      132 :     _settingTime = g_timerSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 132
	movw de, #0x008E
	movw bc, #LOWW(_g_timerSetting)
	movw ax, #LOWW(__settingTime)
	call !!_memcpy
	;***      133 :     R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 133
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      134 :     O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 134
	clr1 0xFFF00.0
	;***      135 :     R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 135
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      136 : //    Test gui
	;***      137 : //    O_RS485_MODE_PIN = 1U;
	;***      138 : //    R_UART3_Send(send_buf, 7);
	;***      139 :     EEPROM_PROTECT_EN();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 139
	clr1 0xFFF0E.0
	;***      140 : 
	;***      141 :     g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 141
	mov !LOWW(_g_pre_color), #0x03
	;***      142 :     handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 142
	clrb a
	call !!_handSensorLED
	;***      143 : //    g_machine_state.mode = INDIE; // Set as indie-mode
	;***      144 : //    g_timerSetting.t26_onDelayEmptyLevel_s = g_timerSetting.t26_onDelayEmptyLevel_s = 2;
	;***      145 : //    g_timerSetting.t55_waterDischargeDelay_s = 10;
	;***      146 : //    g_timerSetting.t26_onDelayEmptyLevel_s = 2;
	;***      147 : //    g_timerSetting.t4_electrolysisOperationStart_s = 5;
	;***      148 : //    g_timerSetting.t2_flowSensorStartTime_s = 1;
	;***      149 : //    g_timerSetting.t3_flowSensorMonitorTime_s = 5;
	;***      150 :     g_machine_mode = HAND_WASHING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 150
	oneb !LOWW(_g_machine_mode)
	;***      151 :     sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 151
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call !!_sendToRasPi_f
	;***      152 :     main_init_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 152
	call !!_main_init_20211111
	clrw ax
	;***      153 :     //Test
	;***      154 : //    g_timerSetting.t53_washingWaterSpoutingTime_s = 4;
	;***      155 : //    g_timerSetting.t51_alkalineWaterSpoutingTime_s = 5;
	;***      156 : //    g_timerSetting.t52_acidWaterSpoutingTime_s = 6;
	;***      157 :     uint8_t wts, vpcb, vpcb_v = 1;
	;***      158 :     sendRS485(0xff, 82, 2, 12);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 158
	push ax
	mov x, #0x0C
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	oneb a
	mov [sp+0x02], a
	mov [sp+0x01], a
	mov [sp+0x00], a
.BB@LABEL@3_1:	; bb222
	;***      159 :     while (1U)
	;***      160 :     {
	;***      161 :     	realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 161
	call !!_realTimeResponse
	;***      162 :     	main_loop_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 162
	call !!_main_loop_20211111
	;***      163 : 
	;***      164 :     	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 164
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      165 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 165
	call !!_UpdateMachineStatus
	;***      166 :     	if(g_uart2_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 166
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@3_3
.BB@LABEL@3_2:	; if_then_bb
	;***      167 :     		R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 167
	call !!_R_UART2_Stop
	;***      168 :     		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 168
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      169 :     		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 169
	call !!_R_UART2_Start
	;***      170 :     		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 170
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@3_3:	; if_break_bb
	;***      171 :     	}
	;***      172 : 
	;***      173 :     	// Communication with WaterSoftener
	;***      174 :     	if(commnunication_flag.rs485_send_to_watersolfner_response_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 174
	cmp0 !LOWW(_commnunication_flag+0x00008)
	bz $.BB@LABEL@3_5
.BB@LABEL@3_4:	; if_then_bb23
	clrw ax
	;***      175 :     		sendRS485(0xff, 82, 2, 5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 175
	push ax
	mov x, #0x05
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      176 : //    		rx_count++;
	;***      177 :     		wts = 1; //Test flag = 1
	;***      178 : 			commnunication_flag.rs485_send_to_watersolfner_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 178
	clrb !LOWW(_commnunication_flag+0x00008)
	oneb a
	mov [sp+0x00], a
.BB@LABEL@3_5:	; if_break_bb24
	;***      179 :     	}
	;***      180 : 		if(commnunication_flag.rs485_send_to_watersolfner_SV1_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 180
	cmp !LOWW(_commnunication_flag+0x00009), #0x01
	bnz $.BB@LABEL@3_9
.BB@LABEL@3_6:	; if_then_bb30
	;***      181 :     		// Sand to Water softener SV state
	;***      182 :     		sendRS485(0xff, 82, 24,(uint32_t) g_io_status.refined.Valve.SV1 == 1?1:0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 182
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
	;***      183 :     		commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 183
	clrb !LOWW(_commnunication_flag+0x00009)
.BB@LABEL@3_9:	; if_break_bb43
	mov a, [sp+0x00]
	;***      184 :     	}
	;***      185 : 		// Test SV1 for Water Softener
	;***      186 :     	if(wts != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 186
	cmp0 a
	bnz $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_else_bb63
	;***      187 :     		if(ns_delay_ms(&g_Tick.tickWaterSoftenerPCB, 5000)){
	;***      188 :     			if(wts == 1){
	;***      189 :     				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      190 : //					sendRS485(1, 82, 24,(uint32_t) 1);
	;***      191 : //					sendRS485(0xff, 82, 24,(uint32_t) 1);
	;***      192 : 					wts = 2;
	;***      193 :     			}else{
	;***      194 :     				O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***      195 : //    				sendRS485(1, 82, 24,(uint32_t) 0);
	;***      196 : //					sendRS485(0xff, 82, 24,(uint32_t) 0);
	;***      197 : 					wts = 0;
	;***      198 :     			}
	;***      199 :     		}
	;***      200 :     	}else{
	;***      201 :     		g_Tick.tickWaterSoftenerPCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 201
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00048), ax
	br $.BB@LABEL@3_15
.BB@LABEL@3_11:	; if_then_bb49
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 187
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 188
	dec a
	bnz $.BB@LABEL@3_14
.BB@LABEL@3_13:	; if_then_bb60
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 189
	set1 0xFFF01.7
	mov [sp+0x00], #0x02
	br $.BB@LABEL@3_15
.BB@LABEL@3_14:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 194
	clr1 0xFFF01.7
	clrb a
	mov [sp+0x00], a
.BB@LABEL@3_15:	; if_break_bb65
	;***      202 :     	}
	;***      203 : 
	;***      204 :     	//Valve PCB
	;***      205 :     	if(commnunication_flag.rs485_send_to_valve_response_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 205
	cmp !LOWW(_commnunication_flag+0x0000A), #0x01
	bnz $.BB@LABEL@3_17
.BB@LABEL@3_16:	; if_then_bb71
	movw ax, sp
	addw ax, #0x0006
	movw [sp+0x04], ax
	;***      206 :     		// 0xff, 12, {Mode, Valve 1, Valve 2, Valve 3, 1}
	;***      207 :     		// 0 - Stand alone 1 - Control Valve
	;***      208 :     		uint8_t _b[5] = {vpcb_v, g_uart3_sendend%2,g_systemTime%2,0,1};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 208
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
	;***      209 :     		sendR485_7byte(0xff, 12, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 209
	movw ax, #0xFF0C
	call !!_sendR485_7byte
	;***      210 :     		vpcb++;
	;***      211 :     		commnunication_flag.rs485_send_to_valve_response_flag  = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 211
	clrb !LOWW(_commnunication_flag+0x0000A)
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 210
	inc a
	mov [sp+0x01], a
	br $.BB@LABEL@3_19
.BB@LABEL@3_17:	; if_else_bb89
	;***      212 :     	}else if(commnunication_flag.rs485_get_valve_gesture_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 212
	cmp !LOWW(_commnunication_flag+0x0000B), #0x01
	bnz $.BB@LABEL@3_19
.BB@LABEL@3_18:	; if_then_bb95
	movw ax, sp
	addw ax, #0x000B
	movw [sp+0x04], ax
	;***      213 :     		uint8_t _b[5] = {0,1,0,0,1};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 213
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1619)
	call !!_memcpy
	movw ax, [sp+0x04]
	movw bc, ax
	;***      214 :     		sendR485_7byte(0xff, 1, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 214
	movw ax, #0xFF01
	call !!_sendR485_7byte
	;***      215 :     		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	inc !LOWW(_rx_count)
	;***      216 :     		commnunication_flag.rs485_get_valve_gesture_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 216
	clrb !LOWW(_commnunication_flag+0x0000B)
.BB@LABEL@3_19:	; if_break_bb101
	mov a, [sp+0x01]
	;***      217 :     	}
	;***      218 : 
	;***      219 :     	if(vpcb != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 219
	cmp0 a
	bnz $.BB@LABEL@3_21
.BB@LABEL@3_20:	; if_else_bb125
	;***      220 :     		if(ns_delay_ms(&g_Tick.tickValvePCB, 5000)){
	;***      221 :     			vpcb_v = vpcb_v == 1 ? 0 : 1;
	;***      222 :     			vpcb = 0;
	;***      223 :     		}
	;***      224 :     	}else{
	;***      225 :     		g_Tick.tickValvePCB = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 225
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
	br $.BB@LABEL@3_24
.BB@LABEL@3_21:	; if_then_bb107
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 220
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 221
	dec a
	clrb a
	mov [sp+0x01], a
	bnz $.BB@LABEL@3_26
.BB@LABEL@3_23:	; if_then_bb112.if_break_bb127_crit_edge
	mov [sp+0x02], a
.BB@LABEL@3_24:	; if_break_bb127
	;***      226 :     	}
	;***      227 : 
	;***      228 :     	//RS485 fault check
	;***      229 :     	if(commnunication_flag.rs485_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 229
	cmp !LOWW(_commnunication_flag+0x0000C), #0x01
	bnz $.BB@LABEL@3_27
.BB@LABEL@3_25:	; if_then_bb133
	;***      230 :     		R_UART3_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 230
	call !!_R_UART3_Stop
	;***      231 :     		commnunication_flag.rs485_fault++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 231
	inc !LOWW(_commnunication_flag+0x0000C)
	;***      232 :     		g_Tick.tickRS485 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 232
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00050), ax
	br $.BB@LABEL@3_30
.BB@LABEL@3_26:	; bb118
	oneb a
	br $.BB@LABEL@3_23
.BB@LABEL@3_27:	; if_else_bb137
	;***      233 :     	}else if(commnunication_flag.rs485_fault == 2){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 233
	cmp !LOWW(_commnunication_flag+0x0000C), #0x02
	bnz $.BB@LABEL@3_30
.BB@LABEL@3_28:	; if_then_bb143
	;***      234 :     		if(ns_delay_ms(&g_Tick.tickRS485, 500)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 234
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00050)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_30
.BB@LABEL@3_29:	; if_then_bb148
	;***      235 : 				R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 235
	call !!_R_UART3_Start
	;***      236 : 				R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 236
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      237 : 				commnunication_flag.rs485_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 237
	clrb !LOWW(_commnunication_flag+0x0000C)
.BB@LABEL@3_30:	; if_break_bb152
	;***      238 :     		}
	;***      239 :     	}
	;***      240 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      241 : //    	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	;***      242 : //    		P6_bit.no3 = ~P6_bit.no3;
	;***      243 : //    		O_SUPPLY_WATER_PIN_SV1 = ~O_SUPPLY_WATER_PIN_SV1;
	;***      244 : //    	}
	;***      245 : //    	if(g_machine_state.user == 1){
	;***      246 : //    		HandWashingMode_nostop();
	;***      247 : //    	}else{
	;***      248 : //    		g_Tick.tickCustom[1] = g_systemTime;
	;***      249 : //    	}
	;***      250 : 
	;***      251 :     	// Check
	;***      252 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 252
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_31:	; bb160
	clrb a
.BB@LABEL@3_32:	; bb162
	mov !LOWW(_flow_p), a
	;***      253 :     	if(ns_delay_ms(&g_Tick.tickCustom[1], 60000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 253
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick+0x00088)
	call !!_ns_delay_ms
	;***      254 : //    		if(O_SUPPLY_WATER_PIN_SV1 == ON){
	;***      255 : //				g_TickKeeper.SV1_ON_minutes++;
	;***      256 : //				g_TickKeeper.SV1_OFF_minutes = 0;
	;***      257 : //			}else{
	;***      258 : //				g_TickKeeper.SV1_OFF_minutes++;
	;***      259 : //				g_TickKeeper.SV1_ON_minutes = 0;
	;***      260 : //			}
	;***      261 : //			if(O_SPOUT_WATER_PIN_SV2 == ON){
	;***      262 : //				g_TickKeeper.SV2_ON_minutes++;
	;***      263 : //				g_TickKeeper.SV2_OFF_minutes = 0;
	;***      264 : //			}else{
	;***      265 : //				g_TickKeeper.SV2_OFF_minutes++;
	;***      266 : //				g_TickKeeper.SV2_ON_minutes = 0;
	;***      267 : //			}
	;***      268 :     	}
	;***      269 :     	if(ns_delay_ms(&g_Tick.tickCustom[2], 15000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 269
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x0008C)
	call !!_ns_delay_ms
	;***      270 : //    		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      271 : //					|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      272 : //				sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      273 : //						g_io_status.refined.FlowValue);
	;***      274 : //			}
	;***      275 :     	}
	;***      276 :     	if(ns_delay_ms(&g_Tick.tick1s, 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 276
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_36
.BB@LABEL@3_33:	; if_then_bb182
	;***      277 : 
	;***      278 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 278
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_34:	; bb188
	clrb a
.BB@LABEL@3_35:	; bb190
	mov !LOWW(_led_st), a
	;***      279 :     	    uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 279
	mov a, !LOWW(_g_uart2_sendend)
	;***      280 :     	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 280
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      281 :     	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 281
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
	;***      282 : //    	    switch (g_color) {
	;***      283 : //				case BLACK:
	;***      284 : //					g_color = RED;
	;***      285 : //					break;
	;***      286 : //				case RED:
	;***      287 : //					g_color = BLUE;
	;***      288 : //					break;
	;***      289 : //				case BLUE:
	;***      290 : //					g_color = WHITE;
	;***      291 : //					break;
	;***      292 : //				default:
	;***      293 : //					g_color = BLACK;
	;***      294 : //					break;
	;***      295 : //			}
	;***      296 : //    	    dac_out[0]+= 10;
	;***      297 : 			CVCC_Current_Set(dac_out[0]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 297
	mov a, !LOWW(_dac_out)
	call !!_R_DAC0_Set_ConversionValue
	;***      298 : //			dac_out[1]+= 10;
	;***      299 : 			Salt_Analog_Set(dac_out[1]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 299
	mov a, !LOWW(_dac_out+0x00001)
	call !!_R_DAC1_Set_ConversionValue
.BB@LABEL@3_36:	; if_break_bb207
	;***      300 :     		if(led_st == 0x00){
	;***      301 : 
	;***      302 : //    			O_CVCC_ON_PIN = ON;
	;***      303 : //    			O_HS_ICL_PIN = 0;
	;***      304 : //    			O_HS_IDA_PIN = 1;
	;***      305 : //    			handSensorLED(RED);
	;***      306 : //    			O_CVCC_ALARM_RS = 1;
	;***      307 : //    			O_PUMP_SALT_PIN = ON;
	;***      308 : //    			electrolyticOperationON();
	;***      309 : //    			g_io_status.refined.Valve.SV4 = 1;
	;***      310 : //				g_io_status.refined.Pump2 = 1;
	;***      311 : //				g_io_status.refined.Valve.SV5 = 0;
	;***      312 : //				g_io_status.refined.Pump1 = 0;
	;***      313 : //				g_io_status.refined.SaltLowLevel = 1;
	;***      314 : //    			e_send[0]++;
	;***      315 : //    			g_numberSetting.upperVoltage1++;
	;***      316 : //    			g_numberSetting.crc--;
	;***      317 : //    			g_numberSetting.crc2++;
	;***      318 : //    			g_numberSetting.lowerFlow++;
	;***      319 : //    			g_numberSetting.hello++;
	;***      320 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
	;***      321 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting.crc, 0x800, 6);
	;***      322 : //    			EE_SPI_Write((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
	;***      323 :     		}else{
	;***      324 : //    			O_CVCC_ON_PIN = OFF;
	;***      325 : //    			O_HS_ICL_PIN = 1;
	;***      326 : //				O_HS_IDA_PIN = 0;
	;***      327 : //    			handSensorLED(WHITE);
	;***      328 : //    			O_CVCC_ALARM_RS = 0;
	;***      329 : //    			O_PUMP_SALT_PIN = OFF;
	;***      330 : //    			electrolyticOperationOFF();
	;***      331 : //    			g_io_status.refined.Valve.SV4 = 0;
	;***      332 : //				g_io_status.refined.Pump2 = 0;
	;***      333 : //				g_io_status.refined.Valve.SV5 = 1;
	;***      334 : //				g_io_status.refined.Pump1 = 1;
	;***      335 : //				g_io_status.refined.SaltLowLevel = 0;
	;***      336 : //    			EE_SPI_Read((uint8_t *)&ret_number_setting, 0x000, sizeof(g_numberSetting));
	;***      337 : 
	;***      338 :     		}
	;***      339 :     	}
	;***      340 : 
	;***      341 : 
	;***      342 : //--------------------------------End testing code---------------------------------------------------------
	;***      343 : //    	if(g_machine_state.mode == BUSY){
	;***      344 : //    		g_machine_state.user = 0;
	;***      345 : //    		if(ns_delay_ms(&g_Tick.tickDebouceHandSensor, g_timerSetting.t55_waterDischargeDelay_s*1000)){
	;***      346 : //    			g_machine_state.mode = INDIE;
	;***      347 : //    		}
	;***      348 : //    	}else{
	;***      349 : //    		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      350 : //    	}
	;***      351 : 
	;***      352 : 		if((g_machine_state.mode == WATER_WASHING)|(g_machine_state.mode == INDIE)){
	;***      353 : //			nostop_WaterWashingMode();
	;***      354 : 		}
	;***      355 : //    	InitialOperationModeStart();
	;***      356 : 
	;***      357 : //    	if(g_color != g_pre_color){
	;***      358 : //			O_RS485_MODE_PIN = 1U;
	;***      359 : //			uint8_t _uart3 = g_uart3_sendend;
	;***      360 : //			send_buf[3]++;
	;***      361 : //			R_UART3_Send(send_buf, 7);
	;***      362 : //			while(_uart3 == g_uart3_sendend);
	;***      363 : //			O_RS485_MODE_PIN = 0U;
	;***      364 : //    	}
	;***      365 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 365
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      366 :     }
	;***      367 :     /* End user code. Do not edit comment generated here */
	;***      368 : }
	;***      369 : 
	;***      370 : /***********************************************************************************************************************
	;***      371 : * Function Name: R_MAIN_UserInit
	;***      372 : * Description  : This function adds user code before implementing main function.
	;***      373 : * Arguments    : None
	;***      374 : * Return Value : None
	;***      375 : ***********************************************************************************************************************/
	;***      376 : void R_MAIN_UserInit(void)
	;***      377 : {
	;***      378 :     /* Start user code. Do not edit comment generated here */
	;***      379 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 379
	ei
	;***      380 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 380
	call !!_R_TAU0_Create
	;***      381 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 381
	call !!_R_SAU0_Create
	;***      382 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 382
	call !!_R_SAU1_Create
	;***      383 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 383
	call !!_R_UART1_Create
	;***      384 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 384
	call !!_R_UART2_Create
	;***      385 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 385
	call !!_R_UART3_Create
	;***      386 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 386
	call !!_R_RTC_Create
	;***      387 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 387
	call !!_R_PORT_Create_UserInit
	;***      388 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 388
	call !!_R_CSI01_Create
	;***      389 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 389
	call !!_R_CSI00_Create
	;***      390 : 
	;***      391 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 391
	call !!_R_TAU0_Channel0_Start
	;***      392 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 392
	call !!_R_UART3_Start
	;***      393 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 393
	call !!_R_UART1_Start
	;***      394 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 394
	call !!_R_UART2_Start
	;***      395 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 395
	call !!_R_CSI00_Start
	;***      396 : //    R_CSI01_Start();
	;***      397 : 
	;***      398 : 
	;***      399 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 399
	call !!_R_ADC_Create
	;***      400 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 400
	call !!_R_ADC_Set_OperationOn
	;***      401 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 401
	call !!_R_ADC_Start
	;***      402 : 
	;***      403 :     R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 403
	call !!_R_DAC_Create
	;***      404 : 	CVCC_Current_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 404
	clrb a
	call !!_R_DAC0_Set_ConversionValue
	;***      405 : 	Salt_Analog_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 405
	clrb a
	call !!_R_DAC1_Set_ConversionValue
	;***      406 :     R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 406
	call !!_R_DAC0_Start
	;***      407 :     R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 407
	br !!_R_DAC1_Start
	;***      408 :     /* End user code. Do not edit comment generated here */
	;***      409 : }
	;***      410 : 
	;***      411 : /* Start user code for adding. Do not edit comment generated here */
	;***      412 : /* End user code. Do not edit comment generated here */
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
.STR@1619:
	.DS (1)
	.DB 0x01
	.DS (2)
	.DB 0x01
