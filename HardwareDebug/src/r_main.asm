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
#@  compiled at Mon Dec 27 18:07:13 2021

	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_io_status
	.EXTERN _g_pre_io_status
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
	.PUBLIC _g_control_buffer
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
	.EXTERN _sendToRasPi
	.EXTERN _sendRS485
	.EXTERN _RaspberryResponse_nostop
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
	;***       76 : struct UART_Buffer_s g_control_buffer;
	;***       77 : 
	;***       78 : union {
	;***       79 : 	struct{
	;***       80 : 		uint8_t up_signal;
	;***       81 : 	};
	;***       82 : 	uint8_t status;
	;***       83 : }handsensor_status;
	;***       84 : uint8_t g_handsensor_status[2];
	;***       85 : void nostop_checkHandSensor(void){
	;***       86 : 	if(DETECT_U == I_ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 86
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_5
.BB@LABEL@1_1:	; if_then_bb
	;***       87 : 		if(ns_delay_ms(&g_Tick.tickHandSensor[0], 500)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 87
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@1_9
.BB@LABEL@1_2:	; if_then_bb10
	;***       88 : 			g_handsensor_status[0] = g_handsensor_status[0] == 0? 1:0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 88
	cmp0 !LOWW(_g_handsensor_status)
	oneb a
	skz
.BB@LABEL@1_3:	; bb15
	clrb a
.BB@LABEL@1_4:	; bb16
	mov !LOWW(_g_handsensor_status), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 97
	ret
.BB@LABEL@1_5:	; if_else_bb
	;***       89 : 		}
	;***       90 : 	}else if(DETECT_D == I_ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 90
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@1_7
.BB@LABEL@1_6:	; if_then_bb27
	;***       91 : 		g_handsensor_status[1] = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 91
	oneb !LOWW(_g_handsensor_status+0x00001)
	ret
.BB@LABEL@1_7:	; if_else_bb28
	;***       92 : 	}else if(DETECT_U == I_OFF){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 92
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@1_9
.BB@LABEL@1_8:	; if_else_bb37
	;***       93 : 
	;***       94 : 	}else if(DETECT_D == I_OFF){
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
	;***       98 : uint8_t readHS(void){
	;***       99 :    if(DETECT_U){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 99
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@2_2
.BB@LABEL@2_1:	; bb18
	;***      100 : 	  delay_ms(2);
	;***      101 :       if(DETECT_U) return 1;return 0;
	;***      102 :    }else return 0;
	;***      103 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 103
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
	.STACK _main = 36
	;***      104 : uint8_t this_size = sizeof(g_io_status);
	;***      105 : uint8_t this_size_2 = sizeof(union IO_Status_u);
	;***      106 : uint8_t send_buf[7] = {8,1,2,3,4,5,6};
	;***      107 : char g_crc[8];
	;***      108 : uint32_t g_crc_32[8];
	;***      109 : uint32_t data_crc[2] = {30500, 60200};
	;***      110 : uint8_t rx_count;
	;***      111 : uint8_t dac_out[2] = {0xff, 0xff};
	;***      112 : /* End user code. Do not edit comment generated here */
	;***      113 : 
	;***      114 : void R_MAIN_UserInit(void);
	;***      115 : 
	;***      116 : /***********************************************************************************************************************
	;***      117 : * Function Name: main
	;***      118 : * Description  : This function implements main function.
	;***      119 : * Arguments    : None
	;***      120 : * Return Value : None
	;***      121 : ***********************************************************************************************************************/
	;***      122 : void main(void)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 122
	subw sp, #0x1C
	;***      123 : {
	;***      124 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 124
	call $!_R_MAIN_UserInit
	;***      125 :     /* Start user code. Do not edit comment generated here */
	;***      126 : 
	;***      127 :     EEPROM_Init(&g_csi_rev_end, NONE_BLOCK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 127
	clrb c
	movw ax, #LOWW(_g_csi_rev_end)
	call !!_EEPROM_Init
	clrw ax
	;***      128 :     EE_SPI_Read((uint8_t *)&g_numberSetting, NUMBER_SETTING_ADDRESS, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 128
	push ax
	mov x, #0x21
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	clrw ax
	;***      129 :     EE_SPI_Read((uint8_t *)&g_timerSetting, TIME_SETTING_ADDRESS, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 129
	push ax
	mov x, #0x8D
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Read
	addw sp, #0x04
	;***      130 :     _settingNumber = g_numberSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 130
	movw de, #0x0026
	movw bc, #LOWW(_g_numberSetting)
	movw ax, #LOWW(__settingNumber)
	call !!_memcpy
	;***      131 :     _settingTime = g_timerSetting;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 131
	movw de, #0x008E
	movw bc, #LOWW(_g_timerSetting)
	movw ax, #LOWW(__settingTime)
	call !!_memcpy
	;***      132 :     R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 132
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      133 :     O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 133
	clr1 0xFFF00.0
	;***      134 :     R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 134
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      135 : //    Test gui
	;***      136 : //    O_RS485_MODE_PIN = 1U;
	;***      137 : //    R_UART3_Send(send_buf, 7);
	;***      138 :     EEPROM_PROTECT_EN();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 138
	clr1 0xFFF0E.0
	;***      139 : 
	;***      140 :     g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 140
	mov !LOWW(_g_pre_color), #0x03
	;***      141 :     handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 141
	clrb a
	call !!_handSensorLED
	clrw ax
	;***      142 : //    g_machine_state.mode = INDIE; // Set as indie-mode
	;***      143 : //    g_timerSetting.t26_onDelayEmptyLevel_s = g_timerSetting.t26_onDelayEmptyLevel_s = 2;
	;***      144 : //    g_timerSetting.t55_waterDischargeDelay_s = 10;
	;***      145 :     g_timerSetting.t26_onDelayEmptyLevel_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	movw !LOWW(_g_timerSetting+0x00052), ax
	mov x, #0x02
	movw !LOWW(_g_timerSetting+0x00050), ax
	clrb x
	;***      146 :     g_timerSetting.t4_electrolysisOperationStart_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 146
	movw !LOWW(_g_timerSetting+0x0000E), ax
	mov x, #0x05
	movw !LOWW(_g_timerSetting+0x0000C), ax
	;***      147 :     g_timerSetting.t2_flowSensorStartTime_s = 1;
	;***      148 :     g_timerSetting.t3_flowSensorMonitorTime_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 148
	movw !LOWW(_g_timerSetting+0x00008), ax
	clrb x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	movw !LOWW(_g_timerSetting+0x00006), ax
	incw ax
	movw !LOWW(_g_timerSetting+0x00004), ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 148
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***      149 :     g_machine_mode = HAND_WASHING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 149
	oneb !LOWW(_g_machine_mode)
	;***      150 :     sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 150
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call !!_sendToRasPi
	clrw ax
	;***      151 : //    main_init_20211111();
	;***      152 : 
	;***      153 :     //Test
	;***      154 : //    g_timerSetting.t53_washingWaterSpoutingTime_s = 4;
	;***      155 : //    g_timerSetting.t51_alkalineWaterSpoutingTime_s = 5;
	;***      156 : //    g_timerSetting.t52_acidWaterSpoutingTime_s = 6;
	;***      157 :     uint8_t wts, vpcb, vpcb_v = 1;
	;***      158 :     uint32_t my_tick, my_tick2, rs485_tick;
	;***      159 :     sendRS485(0xff, 82, 2, 12);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 159
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
.BB@LABEL@3_1:	; bb250
	;***      160 :     while (1U)
	;***      161 :     {
	;***      162 :     	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 162
	call !!_RaspberryResponse_nostop
	;***      163 :     	main_loop_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 163
	call !!_main_loop_20211111
	;***      164 : 
	;***      165 :     	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 165
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      166 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 166
	call !!_UpdateMachineStatus
	;***      167 :     	if(g_uart2_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 167
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@3_3
.BB@LABEL@3_2:	; if_then_bb
	;***      168 :     		R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 168
	call !!_R_UART2_Stop
	;***      169 :     		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 169
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      170 :     		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 170
	call !!_R_UART2_Start
	;***      171 :     		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 171
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@3_3:	; if_break_bb
	;***      172 :     	}
	;***      173 : 
	;***      174 :     	// Communication with WaterSoftener
	;***      175 :     	if(commnunication_flag.rs485_send_to_watersolfner_response_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 175
	cmp0 !LOWW(_commnunication_flag+0x00008)
	bz $.BB@LABEL@3_5
.BB@LABEL@3_4:	; if_then_bb26
	clrw ax
	;***      176 :     		sendRS485(0xff, 82, 2, 5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 176
	push ax
	mov x, #0x05
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      177 : //    		rx_count++;
	;***      178 :     		wts = 1; //Test flag = 1
	;***      179 : 			commnunication_flag.rs485_send_to_watersolfner_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 179
	clrb !LOWW(_commnunication_flag+0x00008)
	oneb a
	mov [sp+0x00], a
.BB@LABEL@3_5:	; if_break_bb27
	;***      180 :     	}
	;***      181 : 		if(commnunication_flag.rs485_send_to_watersolfner_SV1_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 181
	cmp !LOWW(_commnunication_flag+0x00009), #0x01
	bnz $.BB@LABEL@3_9
.BB@LABEL@3_6:	; if_then_bb33
	;***      182 :     		// Sand to Water softener SV state
	;***      183 :     		sendRS485(0xff, 82, 24,(uint32_t) g_io_status.refined.Valve.SV1 == 1?1:0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 183
	movw hl, #LOWW(_g_io_status+0x00001)
	onew bc
	bt [hl].0, $.BB@LABEL@3_8
.BB@LABEL@3_7:	; bb41
	decw bc
.BB@LABEL@3_8:	; bb42
	clrw ax
	push ax
	push bc
	mov c, #0x18
	movw ax, #0xFF52
	call !!_sendRS485
	addw sp, #0x04
	;***      184 :     		commnunication_flag.rs485_send_to_watersolfner_SV1_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 184
	clrb !LOWW(_commnunication_flag+0x00009)
.BB@LABEL@3_9:	; if_break_bb46
	mov a, [sp+0x00]
	;***      185 :     	}
	;***      186 : 		// Test SV1 for Water Softener
	;***      187 :     	if(wts != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 187
	cmp0 a
	bnz $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_else_bb66
	;***      188 :     		if(ns_delay_ms(&my_tick, 5000)){
	;***      189 :     			if(wts == 1){
	;***      190 :     				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      191 : //					sendRS485(1, 82, 24,(uint32_t) 1);
	;***      192 : //					sendRS485(0xff, 82, 24,(uint32_t) 1);
	;***      193 : 					wts = 2;
	;***      194 :     			}else{
	;***      195 :     				O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***      196 : //    				sendRS485(1, 82, 24,(uint32_t) 0);
	;***      197 : //					sendRS485(0xff, 82, 24,(uint32_t) 0);
	;***      198 : 					wts = 0;
	;***      199 :     			}
	;***      200 :     		}
	;***      201 :     	}else{
	;***      202 :     		my_tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 202
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x10], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x0E], ax
	br $.BB@LABEL@3_15
.BB@LABEL@3_11:	; if_then_bb52
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 188
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, sp
	addw ax, #0x000E
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_15
.BB@LABEL@3_12:	; if_then_bb57
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 189
	dec a
	bnz $.BB@LABEL@3_14
.BB@LABEL@3_13:	; if_then_bb63
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	set1 0xFFF01.7
	mov [sp+0x00], #0x02
	br $.BB@LABEL@3_15
.BB@LABEL@3_14:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 195
	clr1 0xFFF01.7
	clrb a
	mov [sp+0x00], a
.BB@LABEL@3_15:	; if_break_bb68
	;***      203 :     	}
	;***      204 : 
	;***      205 :     	//Valve PCB
	;***      206 :     	if(commnunication_flag.rs485_send_to_valve_response_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 206
	cmp !LOWW(_commnunication_flag+0x0000A), #0x01
	bnz $.BB@LABEL@3_17
.BB@LABEL@3_16:	; if_then_bb74
	movw ax, sp
	addw ax, #0x0012
	movw [sp+0x04], ax
	;***      207 : //    		sendRS485(0xff, 11, 24, 0x01000000);
	;***      208 :     		//Send when change in valve
	;***      209 :     		uint8_t _b[5] = {g_uart3_sendend%2,g_systemTime%2,0,0,1};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 209
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1)
	call !!_memcpy
	oneb a
	and a, !LOWW(_g_uart3_sendend)
	mov [sp+0x12], a
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	mov a, x
	and a, #0x01
	mov [sp+0x13], a
	movw ax, [sp+0x04]
	movw bc, ax
	mov a, [sp+0x02]
	mov x, a
	;***      210 :     		// 0 - Stand alone 1 - Control Valve
	;***      211 :     		sendR485_7byte(0xff, vpcb_v, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 211
	mov a, #0xFF
	call !!_sendR485_7byte
	;***      212 :     		vpcb++;
	;***      213 : //    		sendR485_7byte(0xff, 1, _b);
	;***      214 :     		commnunication_flag.rs485_send_to_valve_response_flag  = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 214
	clrb !LOWW(_commnunication_flag+0x0000A)
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 212
	inc a
	mov [sp+0x01], a
	br $.BB@LABEL@3_19
.BB@LABEL@3_17:	; if_else_bb90
	;***      215 :     	}else if(commnunication_flag.rs485_get_valve_gesture_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	cmp !LOWW(_commnunication_flag+0x0000B), #0x01
	bnz $.BB@LABEL@3_19
.BB@LABEL@3_18:	; if_then_bb96
	movw ax, sp
	addw ax, #0x0017
	movw [sp+0x04], ax
	;***      216 :     		uint8_t _b[5] = {0,1,0,0,1};
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 216
	movw de, #0x0005
	movw bc, #SMRLW(.STR@1617)
	call !!_memcpy
	movw ax, [sp+0x04]
	movw bc, ax
	;***      217 :     		sendR485_7byte(0xff, 1, _b);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 217
	movw ax, #0xFF01
	call !!_sendR485_7byte
	;***      218 :     		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 218
	inc !LOWW(_rx_count)
	;***      219 :     		commnunication_flag.rs485_get_valve_gesture_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 219
	clrb !LOWW(_commnunication_flag+0x0000B)
.BB@LABEL@3_19:	; if_break_bb102
	mov a, [sp+0x01]
	;***      220 :     	}
	;***      221 : 
	;***      222 :     	if(vpcb != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 222
	cmp0 a
	bnz $.BB@LABEL@3_21
.BB@LABEL@3_20:	; if_else_bb126
	;***      223 :     		if(ns_delay_ms(&my_tick2, 5000)){
	;***      224 :     			vpcb_v = vpcb_v == 1 ? 0 : 1;
	;***      225 :     			vpcb = 0;
	;***      226 :     		}
	;***      227 :     	}else{
	;***      228 :     		my_tick2 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 228
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x0C], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x0A], ax
	br $.BB@LABEL@3_24
.BB@LABEL@3_21:	; if_then_bb108
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 223
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, sp
	addw ax, #0x000A
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_24
.BB@LABEL@3_22:	; if_then_bb113
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 224
	dec a
	clrb a
	mov [sp+0x01], a
	bnz $.BB@LABEL@3_26
.BB@LABEL@3_23:	; if_then_bb113.if_break_bb128_crit_edge
	mov [sp+0x02], a
.BB@LABEL@3_24:	; if_break_bb128
	;***      229 :     	}
	;***      230 : 
	;***      231 :     	//RS485 fault check
	;***      232 :     	if(commnunication_flag.rs485_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 232
	cmp !LOWW(_commnunication_flag+0x0000C), #0x01
	bnz $.BB@LABEL@3_27
.BB@LABEL@3_25:	; if_then_bb134
	;***      233 :     		R_UART3_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 233
	call !!_R_UART3_Stop
	;***      234 :     		commnunication_flag.rs485_fault++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 234
	inc !LOWW(_commnunication_flag+0x0000C)
	;***      235 :     		rs485_tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 235
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x06], ax
	br $.BB@LABEL@3_30
.BB@LABEL@3_26:	; bb119
	oneb a
	br $.BB@LABEL@3_23
.BB@LABEL@3_27:	; if_else_bb138
	;***      236 :     	}else if(commnunication_flag.rs485_fault == 2){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 236
	cmp !LOWW(_commnunication_flag+0x0000C), #0x02
	bnz $.BB@LABEL@3_30
.BB@LABEL@3_28:	; if_then_bb144
	;***      237 :     		if(ns_delay_ms(&rs485_tick, 500)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 237
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, sp
	addw ax, #0x0006
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_30
.BB@LABEL@3_29:	; if_then_bb149
	;***      238 : 				R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 238
	call !!_R_UART3_Start
	;***      239 : 				R_UART3_Receive(g_uart3_rx_data, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 239
	movw bc, #0x0007
	movw ax, #LOWW(_g_uart3_rx_data)
	call !!_R_UART3_Receive
	;***      240 : 				commnunication_flag.rs485_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 240
	clrb !LOWW(_commnunication_flag+0x0000C)
.BB@LABEL@3_30:	; if_break_bb153
	;***      241 :     		}
	;***      242 :     	}
	;***      243 :     	g_pre_io_status = g_io_status;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 243
	movw de, #0x0012
	movw bc, #LOWW(_g_io_status)
	movw ax, #LOWW(_g_pre_io_status)
	call !!_memcpy
	;***      244 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      245 :     	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 245
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick+0x00064)
	call !!_ns_delay_ms
	;***      246 : //    		P6_bit.no3 = ~P6_bit.no3;
	;***      247 : //    		O_SUPPLY_WATER_PIN_SV1 = ~O_SUPPLY_WATER_PIN_SV1;
	;***      248 :     	}
	;***      249 : //    	if(g_machine_state.user == 1){
	;***      250 : //    		HandWashingMode_nostop();
	;***      251 : //    	}else{
	;***      252 : //    		g_Tick.tickCustom[1] = g_systemTime;
	;***      253 : //    	}
	;***      254 : 
	;***      255 :     	// Check
	;***      256 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 256
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_31:	; bb167
	clrb a
.BB@LABEL@3_32:	; bb169
	mov !LOWW(_flow_p), a
	;***      257 :     	if(ns_delay_ms(&g_Tick.tickCustom[1], 60000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 257
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick+0x00068)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_44
.BB@LABEL@3_33:	; if_then_bb177
	;***      258 :     		if(O_SUPPLY_WATER_PIN_SV1 == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 258
	mov a, 0xFFF01
	mov1 CY, a.7
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@3_37
.BB@LABEL@3_34:	; if_else_bb187
	;***      259 : 				g_TickKeeper.SV1_ON_minutes++;
	;***      260 : 				g_TickKeeper.SV1_OFF_minutes = 0;
	;***      261 : 			}else{
	;***      262 : 				g_TickKeeper.SV1_OFF_minutes++;
	;***      263 : 				g_TickKeeper.SV1_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 263
	movw !LOWW(_g_TickKeeper@1+0x00002), ax
	movw !LOWW(_g_TickKeeper@1), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 262
	addw ax, !LOWW(_g_TickKeeper@1+0x00004)
	movw !LOWW(_g_TickKeeper@1+0x00004), ax
	movw ax, bc
	sknc
.BB@LABEL@3_35:	; if_else_bb187
	incw ax
.BB@LABEL@3_36:	; if_else_bb187
	addw ax, !LOWW(_g_TickKeeper@1+0x00006)
	movw !LOWW(_g_TickKeeper@1+0x00006), ax
	br $.BB@LABEL@3_40
.BB@LABEL@3_37:	; if_then_bb184
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 260
	movw !LOWW(_g_TickKeeper@1+0x00006), ax
	movw !LOWW(_g_TickKeeper@1+0x00004), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 259
	addw ax, !LOWW(_g_TickKeeper@1)
	movw !LOWW(_g_TickKeeper@1), ax
	movw ax, bc
	sknc
.BB@LABEL@3_38:	; if_then_bb184
	incw ax
.BB@LABEL@3_39:	; if_then_bb184
	addw ax, !LOWW(_g_TickKeeper@1+0x00002)
	movw !LOWW(_g_TickKeeper@1+0x00002), ax
.BB@LABEL@3_40:	; if_break_bb190
	;***      264 : 			}
	;***      265 : 			if(O_SPOUT_WATER_PIN_SV2 == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 265
	mov a, 0xFFF05
	mov1 CY, a.5
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@3_45
.BB@LABEL@3_41:	; if_else_bb201
	;***      266 : 				g_TickKeeper.SV2_ON_minutes++;
	;***      267 : 				g_TickKeeper.SV2_OFF_minutes = 0;
	;***      268 : 			}else{
	;***      269 : 				g_TickKeeper.SV2_OFF_minutes++;
	;***      270 : 				g_TickKeeper.SV2_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 270
	movw !LOWW(_g_TickKeeper@1+0x0000A), ax
	movw !LOWW(_g_TickKeeper@1+0x00008), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 269
	addw ax, !LOWW(_g_TickKeeper@1+0x0000C)
	movw !LOWW(_g_TickKeeper@1+0x0000C), ax
	movw ax, bc
	sknc
.BB@LABEL@3_42:	; if_else_bb201
	incw ax
.BB@LABEL@3_43:	; if_else_bb201
	addw ax, !LOWW(_g_TickKeeper@1+0x0000E)
	movw !LOWW(_g_TickKeeper@1+0x0000E), ax
.BB@LABEL@3_44:	; if_else_bb201
	br $.BB@LABEL@3_48
.BB@LABEL@3_45:	; if_then_bb198
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 267
	movw !LOWW(_g_TickKeeper@1+0x0000E), ax
	movw !LOWW(_g_TickKeeper@1+0x0000C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 266
	addw ax, !LOWW(_g_TickKeeper@1+0x00008)
	movw !LOWW(_g_TickKeeper@1+0x00008), ax
	movw ax, bc
	sknc
.BB@LABEL@3_46:	; if_then_bb198
	incw ax
.BB@LABEL@3_47:	; if_then_bb198
	addw ax, !LOWW(_g_TickKeeper@1+0x0000A)
	movw !LOWW(_g_TickKeeper@1+0x0000A), ax
.BB@LABEL@3_48:	; if_break_bb205
	;***      271 : 			}
	;***      272 :     	}
	;***      273 :     	if(ns_delay_ms(&g_Tick.tick1s, 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 273
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_52
.BB@LABEL@3_49:	; if_then_bb210
	;***      274 : 
	;***      275 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 275
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_50:	; bb216
	clrb a
.BB@LABEL@3_51:	; bb218
	mov !LOWW(_led_st), a
	;***      276 :     	    uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 276
	mov a, !LOWW(_g_uart2_sendend)
	;***      277 :     	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 277
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      278 :     	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 278
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
	;***      279 : //    	    switch (g_color) {
	;***      280 : //				case BLACK:
	;***      281 : //					g_color = RED;
	;***      282 : //					break;
	;***      283 : //				case RED:
	;***      284 : //					g_color = BLUE;
	;***      285 : //					break;
	;***      286 : //				case BLUE:
	;***      287 : //					g_color = WHITE;
	;***      288 : //					break;
	;***      289 : //				default:
	;***      290 : //					g_color = BLACK;
	;***      291 : //					break;
	;***      292 : //			}
	;***      293 : //    	    dac_out[0]+= 10;
	;***      294 : 			CVCC_Current_Set(dac_out[0]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 294
	mov a, !LOWW(_dac_out)
	call !!_R_DAC0_Set_ConversionValue
	;***      295 : //			dac_out[1]+= 10;
	;***      296 : 			Salt_Analog_Set(dac_out[1]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 296
	mov a, !LOWW(_dac_out+0x00001)
	call !!_R_DAC1_Set_ConversionValue
.BB@LABEL@3_52:	; if_break_bb235
	;***      297 :     		if(led_st == 0x00){
	;***      298 : 
	;***      299 : //    			O_CVCC_ON_PIN = ON;
	;***      300 : //    			O_HS_ICL_PIN = 0;
	;***      301 : //    			O_HS_IDA_PIN = 1;
	;***      302 : //    			handSensorLED(RED);
	;***      303 : //    			O_CVCC_ALARM_RS = 1;
	;***      304 : //    			O_PUMP_SALT_PIN = ON;
	;***      305 : //    			electrolyticOperationON();
	;***      306 : //    			g_io_status.refined.Valve.SV4 = 1;
	;***      307 : //				g_io_status.refined.Pump2 = 1;
	;***      308 : //				g_io_status.refined.Valve.SV5 = 0;
	;***      309 : //				g_io_status.refined.Pump1 = 0;
	;***      310 : //				g_io_status.refined.SaltLowLevel = 1;
	;***      311 : //    			e_send[0]++;
	;***      312 : //    			g_numberSetting.upperVoltage1++;
	;***      313 : //    			g_numberSetting.crc--;
	;***      314 : //    			g_numberSetting.crc2++;
	;***      315 : //    			g_numberSetting.lowerFlow++;
	;***      316 : //    			g_numberSetting.hello++;
	;***      317 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
	;***      318 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting.crc, 0x800, 6);
	;***      319 : //    			EE_SPI_Write((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
	;***      320 :     		}else{
	;***      321 : //    			O_CVCC_ON_PIN = OFF;
	;***      322 : //    			O_HS_ICL_PIN = 1;
	;***      323 : //				O_HS_IDA_PIN = 0;
	;***      324 : //    			handSensorLED(WHITE);
	;***      325 : //    			O_CVCC_ALARM_RS = 0;
	;***      326 : //    			O_PUMP_SALT_PIN = OFF;
	;***      327 : //    			electrolyticOperationOFF();
	;***      328 : //    			g_io_status.refined.Valve.SV4 = 0;
	;***      329 : //				g_io_status.refined.Pump2 = 0;
	;***      330 : //				g_io_status.refined.Valve.SV5 = 1;
	;***      331 : //				g_io_status.refined.Pump1 = 1;
	;***      332 : //				g_io_status.refined.SaltLowLevel = 0;
	;***      333 : //    			EE_SPI_Read((uint8_t *)&ret_number_setting, 0x000, sizeof(g_numberSetting));
	;***      334 : 
	;***      335 :     		}
	;***      336 :     	}
	;***      337 : //--------------------------------End testing code---------------------------------------------------------
	;***      338 : //    	if(g_machine_state.mode == BUSY){
	;***      339 : //    		g_machine_state.user = 0;
	;***      340 : //    		if(ns_delay_ms(&g_Tick.tickDebouceHandSensor, g_timerSetting.t55_waterDischargeDelay_s*1000)){
	;***      341 : //    			g_machine_state.mode = INDIE;
	;***      342 : //    		}
	;***      343 : //    	}else{
	;***      344 : //    		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      345 : //    	}
	;***      346 : 
	;***      347 : 		if((g_machine_state.mode == WATER_WASHING)|(g_machine_state.mode == INDIE)){
	;***      348 : //			nostop_WaterWashingMode();
	;***      349 : 		}
	;***      350 : //    	InitialOperationModeStart();
	;***      351 : 
	;***      352 : //    	if(g_color != g_pre_color){
	;***      353 : //			O_RS485_MODE_PIN = 1U;
	;***      354 : //			uint8_t _uart3 = g_uart3_sendend;
	;***      355 : //			send_buf[3]++;
	;***      356 : //			R_UART3_Send(send_buf, 7);
	;***      357 : //			while(_uart3 == g_uart3_sendend);
	;***      358 : //			O_RS485_MODE_PIN = 0U;
	;***      359 : //    	}
	;***      360 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 360
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      361 :     }
	;***      362 :     /* End user code. Do not edit comment generated here */
	;***      363 : }
	;***      364 : 
	;***      365 : /***********************************************************************************************************************
	;***      366 : * Function Name: R_MAIN_UserInit
	;***      367 : * Description  : This function adds user code before implementing main function.
	;***      368 : * Arguments    : None
	;***      369 : * Return Value : None
	;***      370 : ***********************************************************************************************************************/
	;***      371 : void R_MAIN_UserInit(void)
	;***      372 : {
	;***      373 :     /* Start user code. Do not edit comment generated here */
	;***      374 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 374
	ei
	;***      375 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 375
	call !!_R_TAU0_Create
	;***      376 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 376
	call !!_R_SAU0_Create
	;***      377 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 377
	call !!_R_SAU1_Create
	;***      378 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 378
	call !!_R_UART1_Create
	;***      379 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 379
	call !!_R_UART2_Create
	;***      380 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 380
	call !!_R_UART3_Create
	;***      381 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 381
	call !!_R_RTC_Create
	;***      382 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 382
	call !!_R_PORT_Create_UserInit
	;***      383 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 383
	call !!_R_CSI01_Create
	;***      384 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 384
	call !!_R_CSI00_Create
	;***      385 : 
	;***      386 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 386
	call !!_R_TAU0_Channel0_Start
	;***      387 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 387
	call !!_R_UART3_Start
	;***      388 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 388
	call !!_R_UART1_Start
	;***      389 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 389
	call !!_R_UART2_Start
	;***      390 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 390
	call !!_R_CSI00_Start
	;***      391 : //    R_CSI01_Start();
	;***      392 : 
	;***      393 : 
	;***      394 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 394
	call !!_R_ADC_Create
	;***      395 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 395
	call !!_R_ADC_Set_OperationOn
	;***      396 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 396
	call !!_R_ADC_Start
	;***      397 : 
	;***      398 :     R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 398
	call !!_R_DAC_Create
	;***      399 : 	CVCC_Current_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 399
	clrb a
	call !!_R_DAC0_Set_ConversionValue
	;***      400 : 	Salt_Analog_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 400
	clrb a
	call !!_R_DAC1_Set_ConversionValue
	;***      401 :     R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 401
	call !!_R_DAC0_Start
	;***      402 :     R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 402
	br !!_R_DAC1_Start
	;***      403 :     /* End user code. Do not edit comment generated here */
	;***      404 : }
	;***      405 : 
	;***      406 : /* Start user code for adding. Do not edit comment generated here */
	;***      407 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
	.ALIGN 2
_g_TickKeeper@1:
	.DS (20)
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
_g_control_buffer:
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
	.SECTION .const,CONST
.STR@1:
	.DS (4)
	.DB 0x01
.STR@1617:
	.DS (1)
	.DB 0x01
	.DS (2)
	.DB 0x01
