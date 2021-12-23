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
#@  compiled at Thu Dec 23 17:35:22 2021

	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_io_status
	.EXTERN _g_pre_io_status
	.EXTERN _g_machine_mode
	.EXTERN _g_systemTime
	.EXTERN _g_csi_rev_end
	.EXTERN _g_uart2_fault
	.EXTERN _g_uart2_sendend
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
	.EXTERN _RaspberryResponse_nostop
	.EXTERN _main_loop_20211111
	.EXTERN _UpdateMachineStatus
	.EXTERN _R_UART2_Stop
	.EXTERN _R_UART2_Start
	.EXTERN _sendToWaterSolfner
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
	.EXTERN _R_UART3_Start
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
	movw ax, #LOWW(_g_Tick@1+0x0005C)
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
	.STACK _main = 14
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
	subw sp, #0x06
	;***      123 : {
	;***      124 :     R_MAIN_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 124
	call $!_R_MAIN_UserInit
	clrb a
	mov [sp+0x00], a
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
	;***      143 :     g_timerSetting.t26_onDelayEmptyLevel_s = g_timerSetting.t26_onDelayEmptyLevel_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 143
	movw !LOWW(_g_timerSetting+0x00052), ax
	movw ax, #0x07D0
	movw !LOWW(_g_timerSetting+0x00050), ax
	clrw ax
	;***      144 :     g_timerSetting.t55_waterDischargeDelay_s = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 144
	movw !LOWW(_g_timerSetting+0x0007A), ax
	mov x, #0x0A
	movw !LOWW(_g_timerSetting+0x00078), ax
	;***      145 :     g_machine_mode = HAND_WASHING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	oneb !LOWW(_g_machine_mode)
	;***      146 :     sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 146
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call !!_sendToRasPi
	clrw ax
	;***      147 : //    main_init_20211111();
	;***      148 : 
	;***      149 :     //Test
	;***      150 :     g_timerSetting.t53_washingWaterSpoutingTime_s = 4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 150
	movw !LOWW(_g_timerSetting+0x00072), ax
	mov x, #0x04
	movw !LOWW(_g_timerSetting+0x00070), ax
	clrb x
	;***      151 :     g_timerSetting.t51_alkalineWaterSpoutingTime_s = 5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 151
	movw !LOWW(_g_timerSetting+0x0006A), ax
	mov x, #0x05
	movw !LOWW(_g_timerSetting+0x00068), ax
	clrb x
	;***      152 :     g_timerSetting.t52_acidWaterSpoutingTime_s = 6;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 152
	movw !LOWW(_g_timerSetting+0x0006E), ax
	mov x, #0x06
	movw !LOWW(_g_timerSetting+0x0006C), ax
.BB@LABEL@3_1:	; bb177
	;***      153 :     uint8_t wts = 0;
	;***      154 :     uint32_t my_tick;
	;***      155 :     while (1U)
	;***      156 :     {
	;***      157 :     	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 157
	call !!_RaspberryResponse_nostop
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
	;***      168 :     	if(commnunication_flag.rs485_send_watersolfner_response_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 168
	cmp0 !LOWW(_commnunication_flag+0x00007)
	bz $.BB@LABEL@3_5
.BB@LABEL@3_4:	; if_then_bb20
	clrw ax
	;***      169 :     		sendToWaterSolfner(0xff, 82, 2, 12);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 169
	push ax
	mov x, #0x0C
	push ax
	mov c, #0x02
	movw ax, #0xFF52
	call !!_sendToWaterSolfner
	addw sp, #0x04
	;***      170 :     		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 170
	inc !LOWW(_rx_count)
	clrw ax
	;***      171 :     		sendToWaterSolfner(1, 82, 24,(uint32_t) 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 171
	push ax
	incw ax
	push ax
	movw ax, #0x0152
	mov [sp+0x04], a
	mov c, #0x18
	oneb a
	call !!_sendToWaterSolfner
	addw sp, #0x04
	;***      172 : 			rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 172
	inc !LOWW(_rx_count)
	clrw ax
	;***      173 : 			sendToWaterSolfner(0xff, 82, 24,(uint32_t) 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 173
	push ax
	incw ax
	push ax
	mov c, #0x18
	movw ax, #0xFF52
	call !!_sendToWaterSolfner
	addw sp, #0x04
	;***      174 : 			rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 174
	inc !LOWW(_rx_count)
	;***      175 :     		wts = 1;
	;***      176 : 			commnunication_flag.rs485_send_watersolfner_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 176
	clrb !LOWW(_commnunication_flag+0x00007)
.BB@LABEL@3_5:	; if_break_bb27
	;***      177 :     	}
	;***      178 :     	if((g_io_status.refined.Valve.SV1 != g_pre_io_status.refined.Valve.SV1) && (g_io_status.refined.Valve.SV1 == ON)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 178
	movw hl, #LOWW(_g_pre_io_status+0x00001)
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_io_status+0x00001)
	xor1 CY, [hl].0
	bnc $.BB@LABEL@3_8
.BB@LABEL@3_6:	; bb38
	bf [hl].0, $.BB@LABEL@3_8
.BB@LABEL@3_7:	; bb62
	clrw ax
	push ax
	incw ax
	push ax
	mov c, #0x18
	movw ax, #0x0152
	call !!_sendToWaterSolfner
	addw sp, #0x04
.BB@LABEL@3_8:	; if_break_bb66
	mov a, [sp+0x00]
	;***      179 :     		sendToWaterSolfner(1, 82, 24, g_io_status.refined.Valve.SV1 == 1? 0x01:0x00);
	;***      180 : 		}
	;***      181 :     	if(wts == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 181
	dec a
	bnz $.BB@LABEL@3_11
.BB@LABEL@3_9:	; if_then_bb72
	;***      182 :     		if(ns_delay_ms(&my_tick, 5000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 182
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, sp
	incw ax
	incw ax
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_12
.BB@LABEL@3_10:	; if_then_bb77
	clrb a
	mov [sp+0x00], a
	br $.BB@LABEL@3_12
.BB@LABEL@3_11:	; if_else_bb
	;***      183 :     			wts = 0;
	;***      184 :     		}
	;***      185 :     	}else{
	;***      186 :     		my_tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 186
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@3_12:	; if_break_bb80
	;***      187 :     	}
	;***      188 :     	g_io_status = g_pre_io_status;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 188
	movw de, #0x0012
	movw bc, #LOWW(_g_pre_io_status)
	movw ax, #LOWW(_g_io_status)
	call !!_memcpy
	;***      189 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      190 :     	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick@1+0x00064)
	call !!_ns_delay_ms
	;***      191 : //    		P6_bit.no3 = ~P6_bit.no3;
	;***      192 : //    		O_SUPPLY_WATER_PIN_SV1 = ~O_SUPPLY_WATER_PIN_SV1;
	;***      193 :     	}
	;***      194 : //    	if(g_machine_state.user == 1){
	;***      195 : //    		HandWashingMode_nostop();
	;***      196 : //    	}else{
	;***      197 : //    		g_Tick.tickCustom[1] = g_systemTime;
	;***      198 : //    	}
	;***      199 : 
	;***      200 :     	// Check
	;***      201 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 201
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_13:	; bb94
	clrb a
.BB@LABEL@3_14:	; bb96
	mov !LOWW(_flow_p), a
	;***      202 :     	if(ns_delay_ms(&g_Tick.tickCustom[1], 60000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 202
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick@1+0x00068)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_26
.BB@LABEL@3_15:	; if_then_bb104
	;***      203 :     		if(O_SUPPLY_WATER_PIN_SV1 == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 203
	mov a, 0xFFF01
	mov1 CY, a.7
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@3_19
.BB@LABEL@3_16:	; if_else_bb114
	;***      204 : 				g_TickKeeper.SV1_ON_minutes++;
	;***      205 : 				g_TickKeeper.SV1_OFF_minutes = 0;
	;***      206 : 			}else{
	;***      207 : 				g_TickKeeper.SV1_OFF_minutes++;
	;***      208 : 				g_TickKeeper.SV1_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 208
	movw !LOWW(_g_TickKeeper@2+0x00002), ax
	movw !LOWW(_g_TickKeeper@2), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 207
	addw ax, !LOWW(_g_TickKeeper@2+0x00004)
	movw !LOWW(_g_TickKeeper@2+0x00004), ax
	movw ax, bc
	sknc
.BB@LABEL@3_17:	; if_else_bb114
	incw ax
.BB@LABEL@3_18:	; if_else_bb114
	addw ax, !LOWW(_g_TickKeeper@2+0x00006)
	movw !LOWW(_g_TickKeeper@2+0x00006), ax
	br $.BB@LABEL@3_22
.BB@LABEL@3_19:	; if_then_bb111
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 205
	movw !LOWW(_g_TickKeeper@2+0x00006), ax
	movw !LOWW(_g_TickKeeper@2+0x00004), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 204
	addw ax, !LOWW(_g_TickKeeper@2)
	movw !LOWW(_g_TickKeeper@2), ax
	movw ax, bc
	sknc
.BB@LABEL@3_20:	; if_then_bb111
	incw ax
.BB@LABEL@3_21:	; if_then_bb111
	addw ax, !LOWW(_g_TickKeeper@2+0x00002)
	movw !LOWW(_g_TickKeeper@2+0x00002), ax
.BB@LABEL@3_22:	; if_break_bb117
	;***      209 : 			}
	;***      210 : 			if(O_SPOUT_WATER_PIN_SV2 == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 210
	mov a, 0xFFF05
	mov1 CY, a.5
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@3_27
.BB@LABEL@3_23:	; if_else_bb128
	;***      211 : 				g_TickKeeper.SV2_ON_minutes++;
	;***      212 : 				g_TickKeeper.SV2_OFF_minutes = 0;
	;***      213 : 			}else{
	;***      214 : 				g_TickKeeper.SV2_OFF_minutes++;
	;***      215 : 				g_TickKeeper.SV2_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 215
	movw !LOWW(_g_TickKeeper@2+0x0000A), ax
	movw !LOWW(_g_TickKeeper@2+0x00008), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 214
	addw ax, !LOWW(_g_TickKeeper@2+0x0000C)
	movw !LOWW(_g_TickKeeper@2+0x0000C), ax
	movw ax, bc
	sknc
.BB@LABEL@3_24:	; if_else_bb128
	incw ax
.BB@LABEL@3_25:	; if_else_bb128
	addw ax, !LOWW(_g_TickKeeper@2+0x0000E)
	movw !LOWW(_g_TickKeeper@2+0x0000E), ax
.BB@LABEL@3_26:	; if_else_bb128
	br $.BB@LABEL@3_30
.BB@LABEL@3_27:	; if_then_bb125
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 212
	movw !LOWW(_g_TickKeeper@2+0x0000E), ax
	movw !LOWW(_g_TickKeeper@2+0x0000C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 211
	addw ax, !LOWW(_g_TickKeeper@2+0x00008)
	movw !LOWW(_g_TickKeeper@2+0x00008), ax
	movw ax, bc
	sknc
.BB@LABEL@3_28:	; if_then_bb125
	incw ax
.BB@LABEL@3_29:	; if_then_bb125
	addw ax, !LOWW(_g_TickKeeper@2+0x0000A)
	movw !LOWW(_g_TickKeeper@2+0x0000A), ax
.BB@LABEL@3_30:	; if_break_bb132
	;***      216 : 			}
	;***      217 :     	}
	;***      218 :     	if(ns_delay_ms(&g_Tick.tick1s, 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 218
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick@1+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_34
.BB@LABEL@3_31:	; if_then_bb137
	;***      219 : 
	;***      220 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 220
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_32:	; bb143
	clrb a
.BB@LABEL@3_33:	; bb145
	mov !LOWW(_led_st), a
	;***      221 :     	    uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 221
	mov a, !LOWW(_g_uart2_sendend)
	;***      222 :     	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 222
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      223 :     	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 223
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
	;***      224 : //    	    switch (g_color) {
	;***      225 : //				case BLACK:
	;***      226 : //					g_color = RED;
	;***      227 : //					break;
	;***      228 : //				case RED:
	;***      229 : //					g_color = BLUE;
	;***      230 : //					break;
	;***      231 : //				case BLUE:
	;***      232 : //					g_color = WHITE;
	;***      233 : //					break;
	;***      234 : //				default:
	;***      235 : //					g_color = BLACK;
	;***      236 : //					break;
	;***      237 : //			}
	;***      238 : //    	    dac_out[0]+= 10;
	;***      239 : 			CVCC_Current_Set(dac_out[0]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 239
	mov a, !LOWW(_dac_out)
	call !!_R_DAC0_Set_ConversionValue
	;***      240 : //			dac_out[1]+= 10;
	;***      241 : 			Salt_Analog_Set(dac_out[1]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 241
	mov a, !LOWW(_dac_out+0x00001)
	call !!_R_DAC1_Set_ConversionValue
.BB@LABEL@3_34:	; if_break_bb162
	;***      242 :     		if(led_st == 0x00){
	;***      243 : 
	;***      244 : //    			O_CVCC_ON_PIN = ON;
	;***      245 : //    			O_HS_ICL_PIN = 0;
	;***      246 : //    			O_HS_IDA_PIN = 1;
	;***      247 : //    			handSensorLED(RED);
	;***      248 : //    			O_CVCC_ALARM_RS = 1;
	;***      249 : //    			O_PUMP_SALT_PIN = ON;
	;***      250 : //    			electrolyticOperationON();
	;***      251 : //    			g_io_status.refined.Valve.SV4 = 1;
	;***      252 : //				g_io_status.refined.Pump2 = 1;
	;***      253 : //				g_io_status.refined.Valve.SV5 = 0;
	;***      254 : //				g_io_status.refined.Pump1 = 0;
	;***      255 : //				g_io_status.refined.SaltLowLevel = 1;
	;***      256 : //    			e_send[0]++;
	;***      257 : //    			g_numberSetting.upperVoltage1++;
	;***      258 : //    			g_numberSetting.crc--;
	;***      259 : //    			g_numberSetting.crc2++;
	;***      260 : //    			g_numberSetting.lowerFlow++;
	;***      261 : //    			g_numberSetting.hello++;
	;***      262 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
	;***      263 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting.crc, 0x800, 6);
	;***      264 : //    			EE_SPI_Write((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
	;***      265 :     		}else{
	;***      266 : //    			O_CVCC_ON_PIN = OFF;
	;***      267 : //    			O_HS_ICL_PIN = 1;
	;***      268 : //				O_HS_IDA_PIN = 0;
	;***      269 : //    			handSensorLED(WHITE);
	;***      270 : //    			O_CVCC_ALARM_RS = 0;
	;***      271 : //    			O_PUMP_SALT_PIN = OFF;
	;***      272 : //    			electrolyticOperationOFF();
	;***      273 : //    			g_io_status.refined.Valve.SV4 = 0;
	;***      274 : //				g_io_status.refined.Pump2 = 0;
	;***      275 : //				g_io_status.refined.Valve.SV5 = 1;
	;***      276 : //				g_io_status.refined.Pump1 = 1;
	;***      277 : //				g_io_status.refined.SaltLowLevel = 0;
	;***      278 : //    			EE_SPI_Read((uint8_t *)&ret_number_setting, 0x000, sizeof(g_numberSetting));
	;***      279 : 
	;***      280 :     		}
	;***      281 :     	}
	;***      282 : //--------------------------------End testing code---------------------------------------------------------
	;***      283 : //    	if(g_machine_state.mode == BUSY){
	;***      284 : //    		g_machine_state.user = 0;
	;***      285 : //    		if(ns_delay_ms(&g_Tick.tickDebouceHandSensor, g_timerSetting.t55_waterDischargeDelay_s*1000)){
	;***      286 : //    			g_machine_state.mode = INDIE;
	;***      287 : //    		}
	;***      288 : //    	}else{
	;***      289 : //    		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      290 : //    	}
	;***      291 : 
	;***      292 : 		if((g_machine_state.mode == WATER_WASHING)|(g_machine_state.mode == INDIE)){
	;***      293 : //			nostop_WaterWashingMode();
	;***      294 : 		}
	;***      295 : //    	InitialOperationModeStart();
	;***      296 : 
	;***      297 : //    	if(g_color != g_pre_color){
	;***      298 : //			O_RS485_MODE_PIN = 1U;
	;***      299 : //			uint8_t _uart3 = g_uart3_sendend;
	;***      300 : //			send_buf[3]++;
	;***      301 : //			R_UART3_Send(send_buf, 7);
	;***      302 : //			while(_uart3 == g_uart3_sendend);
	;***      303 : //			O_RS485_MODE_PIN = 0U;
	;***      304 : //    	}
	;***      305 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 305
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      306 :     }
	;***      307 :     /* End user code. Do not edit comment generated here */
	;***      308 : }
	;***      309 : 
	;***      310 : /***********************************************************************************************************************
	;***      311 : * Function Name: R_MAIN_UserInit
	;***      312 : * Description  : This function adds user code before implementing main function.
	;***      313 : * Arguments    : None
	;***      314 : * Return Value : None
	;***      315 : ***********************************************************************************************************************/
	;***      316 : void R_MAIN_UserInit(void)
	;***      317 : {
	;***      318 :     /* Start user code. Do not edit comment generated here */
	;***      319 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 319
	ei
	;***      320 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 320
	call !!_R_TAU0_Create
	;***      321 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 321
	call !!_R_SAU0_Create
	;***      322 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 322
	call !!_R_SAU1_Create
	;***      323 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 323
	call !!_R_UART1_Create
	;***      324 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 324
	call !!_R_UART2_Create
	;***      325 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 325
	call !!_R_UART3_Create
	;***      326 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 326
	call !!_R_RTC_Create
	;***      327 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 327
	call !!_R_PORT_Create_UserInit
	;***      328 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 328
	call !!_R_CSI01_Create
	;***      329 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 329
	call !!_R_CSI00_Create
	;***      330 : 
	;***      331 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 331
	call !!_R_TAU0_Channel0_Start
	;***      332 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 332
	call !!_R_UART3_Start
	;***      333 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 333
	call !!_R_UART1_Start
	;***      334 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 334
	call !!_R_UART2_Start
	;***      335 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 335
	call !!_R_CSI00_Start
	;***      336 : //    R_CSI01_Start();
	;***      337 : 
	;***      338 : 
	;***      339 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 339
	call !!_R_ADC_Create
	;***      340 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 340
	call !!_R_ADC_Set_OperationOn
	;***      341 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 341
	call !!_R_ADC_Start
	;***      342 : 
	;***      343 :     R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 343
	call !!_R_DAC_Create
	;***      344 : 	CVCC_Current_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 344
	clrb a
	call !!_R_DAC0_Set_ConversionValue
	;***      345 : 	Salt_Analog_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 345
	clrb a
	call !!_R_DAC1_Set_ConversionValue
	;***      346 :     R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 346
	call !!_R_DAC0_Start
	;***      347 :     R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 347
	br !!_R_DAC1_Start
	;***      348 :     /* End user code. Do not edit comment generated here */
	;***      349 : }
	;***      350 : 
	;***      351 : /* Start user code for adding. Do not edit comment generated here */
	;***      352 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
	.ALIGN 2
_g_Tick@1:
	.DS (132)
	.ALIGN 2
_g_TickKeeper@2:
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
