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
#@  compiled at Mon Dec 20 15:45:31 2021

	.EXTERN _g_rtc
	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_machine_state
	.EXTERN _g_systemTime
	.EXTERN _g_csi_rev_end
	.EXTERN _g_uart2_fault
	.EXTERN _g_uart2_sendend
	.EXTERN _g_rx_data
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
	.PUBLIC _g_control_buffer
	.PUBLIC _handsensor_status
	.PUBLIC _g_handsensor_status
	.PUBLIC _this_size
	.PUBLIC _this_size_2
	.PUBLIC _rec_buf
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
	.EXTERN _R_RTC_Set_CounterValue
	.EXTERN _R_RTC_Start
	.EXTERN _R_UART2_Receive
	.EXTERN _R_UART3_Receive
	.EXTERN _handSensorLED
	.EXTERN _main_init_20211111
	.EXTERN _RaspberryResponse_nostop
	.EXTERN _UpdateMachineStatus
	.EXTERN _HandWashingMode_nostop
	.EXTERN _R_UART2_Stop
	.EXTERN _R_UART2_Start
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
	movw ax, #LOWW(_g_Tick@1+0x00040)
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
	.STACK _main = 12
	;***      104 : uint8_t this_size = sizeof(g_io_status);
	;***      105 : uint8_t this_size_2 = sizeof(union IO_Status_u);
	;***      106 : uint8_t rec_buf[12];
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
	;***      129 : //    setting_default();
	;***      130 :     EE_SPI_Read((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 130
	movw de, #0x0026
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Read
	;***      131 :     EE_SPI_Read((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 131
	movw de, #0x0062
	movw bc, #0x0040
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Read
	;***      132 :     g_rtc.hour = 10;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 132
	mov !LOWW(_g_rtc+0x00002), #0x0A
	;***      133 :     g_rtc.sec = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 133
	mov !LOWW(_g_rtc), #0x02
	;***      134 :     R_RTC_Set_CounterValue(g_rtc);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 134
	subw sp, #0x08
	movw ax, sp
	movw de, #0x0007
	movw bc, #LOWW(_g_rtc)
	call !!_memcpy
	call !!_R_RTC_Set_CounterValue
	addw sp, #0x08
	;***      135 :     R_RTC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 135
	call !!_R_RTC_Start
	;***      136 :     R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 136
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      137 : //    Test nhan
	;***      138 :     O_RS485_MODE_PIN = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 138
	clr1 0xFFF00.0
	;***      139 :     R_UART3_Receive(rec_buf, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 139
	movw bc, #0x0006
	movw ax, #LOWW(_rec_buf)
	call !!_R_UART3_Receive
	;***      140 : 
	;***      141 : //    Test gui
	;***      142 : //    O_RS485_MODE_PIN = 1U;
	;***      143 : //    delay_ms(10);
	;***      144 : //    R_UART3_Send(send_buf, 7);
	;***      145 :     EEPROM_PROTECT_EN();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 145
	clr1 0xFFF0E.0
	;***      146 : 
	;***      147 :     g_pre_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 147
	mov !LOWW(_g_pre_color), #0x03
	;***      148 :     handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 148
	clrb a
	call !!_handSensorLED
	;***      149 : //    g_machine_state.mode = INDIE; // Set as indie-mode
	;***      150 : 
	;***      151 :     main_init_20211111();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 151
	call !!_main_init_20211111
.BB@LABEL@3_1:	; bb151
	;***      152 : 
	;***      153 :     while (1U)
	;***      154 :     {
	;***      155 :     	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 155
	call !!_RaspberryResponse_nostop
	;***      156 : 
	;***      157 : 
	;***      158 : 
	;***      159 :     	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 159
	mov a, !LOWW(_g_color)
	call !!_handSensorLED
	;***      160 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 160
	call !!_UpdateMachineStatus
	;***      161 : //--------------------------------- Testing code---------------------------------------------------------------
	;***      162 :     	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 162
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick@1+0x00048)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_3
.BB@LABEL@3_2:	; if_then_bb
	;***      163 :     		P6_bit.no3 = ~P6_bit.no3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 163
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
.BB@LABEL@3_3:	; if_break_bb
	;***      164 :     	}
	;***      165 :     	if((g_rx_data[0] == H_SET)&(g_rx_data[1] == OK_USER)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 165
	cmp !LOWW(_g_rx_data+0x00001), #0x01
	mov a, !LOWW(_g_rx_data)
	bnz $.BB@LABEL@3_6
.BB@LABEL@3_4:	; if_break_bb
	cmp a, #0x53
	sknz
.BB@LABEL@3_5:	; if_then_bb30
	;***      166 :     		g_machine_state.user = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 166
	oneb !LOWW(_g_machine_state+0x00006)
.BB@LABEL@3_6:	; if_break_bb31
	;***      167 :     	}
	;***      168 :     	if(g_machine_state.user == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 168
	cmp !LOWW(_g_machine_state+0x00006), #0x01
	bnz $.BB@LABEL@3_8
.BB@LABEL@3_7:	; if_then_bb37
	;***      169 :     		HandWashingMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 169
	call !!_HandWashingMode_nostop
	br $.BB@LABEL@3_9
.BB@LABEL@3_8:	; if_else_bb
	;***      170 :     	}else{
	;***      171 :     		g_Tick.tickCustom[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 171
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0004C), ax
.BB@LABEL@3_9:	; if_break_bb39
	;***      172 :     	}
	;***      173 : 
	;***      174 :     	// Check
	;***      175 :     	if(g_uart2_fault == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 175
	cmp !LOWW(_g_uart2_fault), #0x01
	bnz $.BB@LABEL@3_11
.BB@LABEL@3_10:	; if_then_bb45
	;***      176 :     		R_UART2_Stop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 176
	call !!_R_UART2_Stop
	;***      177 :     		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 177
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      178 :     		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 178
	call !!_R_UART2_Start
	;***      179 :     		g_uart2_fault = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 179
	clrb !LOWW(_g_uart2_fault)
.BB@LABEL@3_11:	; if_break_bb46
	;***      180 :     	}
	;***      181 :     	flow_p = I_FLOW_PLUSE_PIN == 1? 1: 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 181
	mov a, 0xFFF00
	mov1 CY, a.1
	oneb a
	skc
.BB@LABEL@3_12:	; bb54
	clrb a
.BB@LABEL@3_13:	; bb55
	mov !LOWW(_flow_p), a
	;***      182 :     	if(ns_delay_ms(&g_Tick.tickCustom[1], 60000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 182
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick@1+0x0004C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_25
.BB@LABEL@3_14:	; if_then_bb63
	;***      183 :     		if(O_SUPPLY_WATER_PIN == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 183
	mov a, 0xFFF01
	mov1 CY, a.7
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@3_18
.BB@LABEL@3_15:	; if_else_bb73
	;***      184 : 				g_TickKeeper.SV1_ON_minutes++;
	;***      185 : 				g_TickKeeper.SV1_OFF_minutes = 0;
	;***      186 : 			}else{
	;***      187 : 				g_TickKeeper.SV1_OFF_minutes++;
	;***      188 : 				g_TickKeeper.SV1_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 188
	movw !LOWW(_g_TickKeeper@2+0x00002), ax
	movw !LOWW(_g_TickKeeper@2), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 187
	addw ax, !LOWW(_g_TickKeeper@2+0x00004)
	movw !LOWW(_g_TickKeeper@2+0x00004), ax
	movw ax, bc
	sknc
.BB@LABEL@3_16:	; if_else_bb73
	incw ax
.BB@LABEL@3_17:	; if_else_bb73
	addw ax, !LOWW(_g_TickKeeper@2+0x00006)
	movw !LOWW(_g_TickKeeper@2+0x00006), ax
	br $.BB@LABEL@3_21
.BB@LABEL@3_18:	; if_then_bb70
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 185
	movw !LOWW(_g_TickKeeper@2+0x00006), ax
	movw !LOWW(_g_TickKeeper@2+0x00004), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 184
	addw ax, !LOWW(_g_TickKeeper@2)
	movw !LOWW(_g_TickKeeper@2), ax
	movw ax, bc
	sknc
.BB@LABEL@3_19:	; if_then_bb70
	incw ax
.BB@LABEL@3_20:	; if_then_bb70
	addw ax, !LOWW(_g_TickKeeper@2+0x00002)
	movw !LOWW(_g_TickKeeper@2+0x00002), ax
.BB@LABEL@3_21:	; if_break_bb76
	;***      189 : 			}
	;***      190 : 			if(O_SPOUT_WATER_PIN == ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 190
	mov a, 0xFFF05
	mov1 CY, a.5
	clrw ax
	movw bc, ax
	bc $.BB@LABEL@3_26
.BB@LABEL@3_22:	; if_else_bb87
	;***      191 : 				g_TickKeeper.SV2_ON_minutes++;
	;***      192 : 				g_TickKeeper.SV2_OFF_minutes = 0;
	;***      193 : 			}else{
	;***      194 : 				g_TickKeeper.SV2_OFF_minutes++;
	;***      195 : 				g_TickKeeper.SV2_ON_minutes = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 195
	movw !LOWW(_g_TickKeeper@2+0x0000A), ax
	movw !LOWW(_g_TickKeeper@2+0x00008), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 194
	addw ax, !LOWW(_g_TickKeeper@2+0x0000C)
	movw !LOWW(_g_TickKeeper@2+0x0000C), ax
	movw ax, bc
	sknc
.BB@LABEL@3_23:	; if_else_bb87
	incw ax
.BB@LABEL@3_24:	; if_else_bb87
	addw ax, !LOWW(_g_TickKeeper@2+0x0000E)
	movw !LOWW(_g_TickKeeper@2+0x0000E), ax
.BB@LABEL@3_25:	; if_else_bb87
	br $.BB@LABEL@3_29
.BB@LABEL@3_26:	; if_then_bb84
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 192
	movw !LOWW(_g_TickKeeper@2+0x0000E), ax
	movw !LOWW(_g_TickKeeper@2+0x0000C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 191
	addw ax, !LOWW(_g_TickKeeper@2+0x00008)
	movw !LOWW(_g_TickKeeper@2+0x00008), ax
	movw ax, bc
	sknc
.BB@LABEL@3_27:	; if_then_bb84
	incw ax
.BB@LABEL@3_28:	; if_then_bb84
	addw ax, !LOWW(_g_TickKeeper@2+0x0000A)
	movw !LOWW(_g_TickKeeper@2+0x0000A), ax
.BB@LABEL@3_29:	; if_break_bb91
	;***      196 : 			}
	;***      197 :     	}
	;***      198 :     	if(ns_delay_ms(&g_Tick.tick1s, 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 198
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick@1+0x00004)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_33
.BB@LABEL@3_30:	; if_then_bb96
	;***      199 : 
	;***      200 : //    		send_buf[1]++;
	;***      201 : //    		R_UART3_Send(send_buf, 7);
	;***      202 : //    		R_UART3_Receive(rec_buf, 7);
	;***      203 : //    		O_CTRL_OUT_PIN = led_st&0x01;
	;***      204 : //    		O_SPOUT_WATER_PIN = led_st&0x01;
	;***      205 : 
	;***      206 :     		led_st = led_st == 0?0xff:0x00;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 206
	cmp0 !LOWW(_led_st)
	mov a, #0xFF
	skz
.BB@LABEL@3_31:	; bb102
	clrb a
.BB@LABEL@3_32:	; bb104
	mov !LOWW(_led_st), a
	;***      207 :     	    uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 207
	mov a, !LOWW(_g_uart2_sendend)
	;***      208 :     	    g_crc[6] = crc8_4((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 208
	mov c, #0x60
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_4
	mov !LOWW(_g_crc+0x00006), a
	;***      209 :     	    g_crc[7] = crc8_1((uint8_t *)&g_timerSetting, sizeof(struct Timer_Setting_s) - 2);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 209
	mov c, #0x60
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_crc+0x00007), a
	;***      210 : //    	    switch (g_color) {
	;***      211 : //				case BLACK:
	;***      212 : //					g_color = RED;
	;***      213 : //					break;
	;***      214 : //				case RED:
	;***      215 : //					g_color = BLUE;
	;***      216 : //					break;
	;***      217 : //				case BLUE:
	;***      218 : //					g_color = WHITE;
	;***      219 : //					break;
	;***      220 : //				default:
	;***      221 : //					g_color = BLACK;
	;***      222 : //					break;
	;***      223 : //			}
	;***      224 : //    	    dac_out[0]+= 10;
	;***      225 : 			CVCC_Current_Set(dac_out[0]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 225
	mov a, !LOWW(_dac_out)
	call !!_R_DAC0_Set_ConversionValue
	;***      226 : //			dac_out[1]+= 10;
	;***      227 : 			Salt_Analog_Set(dac_out[1]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 227
	mov a, !LOWW(_dac_out+0x00001)
	call !!_R_DAC1_Set_ConversionValue
.BB@LABEL@3_33:	; if_break_bb121
	;***      228 :     		if(led_st == 0x00){
	;***      229 : 
	;***      230 : //    			O_CVCC_ON_PIN = ON;
	;***      231 : //    			O_HS_ICL_PIN = 0;
	;***      232 : //    			O_HS_IDA_PIN = 1;
	;***      233 : //    			handSensorLED(RED);
	;***      234 : //    			O_CVCC_ALARM_RS = 1;
	;***      235 : //    			O_PUMP_SALT_PIN = ON;
	;***      236 : //    			electrolyticOperationON();
	;***      237 : //    			g_io_status.refined.Valve.SV4 = 1;
	;***      238 : //				g_io_status.refined.Pump2 = 1;
	;***      239 : //				g_io_status.refined.Valve.SV5 = 0;
	;***      240 : //				g_io_status.refined.Pump1 = 0;
	;***      241 : //				g_io_status.refined.SaltLowLevel = 1;
	;***      242 : //    			e_send[0]++;
	;***      243 : //    			g_numberSetting.upperVoltage1++;
	;***      244 : //    			g_numberSetting.crc--;
	;***      245 : //    			g_numberSetting.crc2++;
	;***      246 : //    			g_numberSetting.lowerFlow++;
	;***      247 : //    			g_numberSetting.hello++;
	;***      248 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting, 0x000, sizeof(g_numberSetting));
	;***      249 : //    			EE_SPI_Write((uint8_t *)&g_numberSetting.crc, 0x800, 6);
	;***      250 : //    			EE_SPI_Write((uint8_t *)&g_timerSetting, 0x040, sizeof(g_timerSetting));
	;***      251 :     		}else{
	;***      252 : //    			O_CVCC_ON_PIN = OFF;
	;***      253 : //    			O_HS_ICL_PIN = 1;
	;***      254 : //				O_HS_IDA_PIN = 0;
	;***      255 : //    			handSensorLED(WHITE);
	;***      256 : //    			O_CVCC_ALARM_RS = 0;
	;***      257 : //    			O_PUMP_SALT_PIN = OFF;
	;***      258 : //    			electrolyticOperationOFF();
	;***      259 : //    			g_io_status.refined.Valve.SV4 = 0;
	;***      260 : //				g_io_status.refined.Pump2 = 0;
	;***      261 : //				g_io_status.refined.Valve.SV5 = 1;
	;***      262 : //				g_io_status.refined.Pump1 = 1;
	;***      263 : //				g_io_status.refined.SaltLowLevel = 0;
	;***      264 : //    			EE_SPI_Read((uint8_t *)&ret_number_setting, 0x000, sizeof(g_numberSetting));
	;***      265 : 
	;***      266 :     		}
	;***      267 :     	}
	;***      268 : //--------------------------------End testing code---------------------------------------------------------
	;***      269 :     	if(g_machine_state.mode == BUSY){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 269
	cmp !LOWW(_g_machine_state+0x00007), #0x07
	bnz $.BB@LABEL@3_36
.BB@LABEL@3_34:	; if_then_bb127
	;***      270 :     		g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 270
	clrb !LOWW(_g_machine_state+0x00006)
	;***      271 :     		if(ns_delay_ms(&g_Tick.tickDebouceHandSensor, 800)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 271
	clrw ax
	movw de, ax
	movw bc, #0x0320
	movw ax, #LOWW(_g_Tick@1+0x00028)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_37
.BB@LABEL@3_35:	; if_then_bb132
	;***      272 :     			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 272
	clrb !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@3_37
.BB@LABEL@3_36:	; if_else_bb134
	;***      273 :     		}
	;***      274 :     	}else{
	;***      275 :     		g_Tick.tickDebouceHandSensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 275
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00028), ax
.BB@LABEL@3_37:	; if_break_bb136
	;***      276 :     	}
	;***      277 : 		if((g_machine_state.mode == WATER_WASHING)|(g_machine_state.mode == INDIE)){
	;***      278 : //			nostop_WaterWashingMode();
	;***      279 : 		}
	;***      280 : //    	InitialOperationModeStart();
	;***      281 : 
	;***      282 : //    	if(g_color != g_pre_color){
	;***      283 : //			O_RS485_MODE_PIN = 1U;
	;***      284 : //			uint8_t _uart3 = g_uart3_sendend;
	;***      285 : //			send_buf[3]++;
	;***      286 : //			R_UART3_Send(send_buf, 7);
	;***      287 : //			while(_uart3 == g_uart3_sendend);
	;***      288 : //			O_RS485_MODE_PIN = 0U;
	;***      289 : //    	}
	;***      290 :     	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 290
	call !!_R_WDT_Restart
	br $!.BB@LABEL@3_1
_R_MAIN_UserInit:
	.STACK _R_MAIN_UserInit = 4
	;***      291 :     }
	;***      292 :     /* End user code. Do not edit comment generated here */
	;***      293 : }
	;***      294 : 
	;***      295 : /***********************************************************************************************************************
	;***      296 : * Function Name: R_MAIN_UserInit
	;***      297 : * Description  : This function adds user code before implementing main function.
	;***      298 : * Arguments    : None
	;***      299 : * Return Value : None
	;***      300 : ***********************************************************************************************************************/
	;***      301 : void R_MAIN_UserInit(void)
	;***      302 : {
	;***      303 :     /* Start user code. Do not edit comment generated here */
	;***      304 :     EI();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 304
	ei
	;***      305 :     R_TAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 305
	call !!_R_TAU0_Create
	;***      306 :     R_SAU0_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 306
	call !!_R_SAU0_Create
	;***      307 :     R_SAU1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 307
	call !!_R_SAU1_Create
	;***      308 :     R_UART1_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 308
	call !!_R_UART1_Create
	;***      309 :     R_UART2_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 309
	call !!_R_UART2_Create
	;***      310 :     R_UART3_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 310
	call !!_R_UART3_Create
	;***      311 :     R_RTC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 311
	call !!_R_RTC_Create
	;***      312 :     R_PORT_Create_UserInit();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 312
	call !!_R_PORT_Create_UserInit
	;***      313 :     R_CSI01_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 313
	call !!_R_CSI01_Create
	;***      314 :     R_CSI00_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 314
	call !!_R_CSI00_Create
	;***      315 : 
	;***      316 :     R_TAU0_Channel0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 316
	call !!_R_TAU0_Channel0_Start
	;***      317 :     R_UART3_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 317
	call !!_R_UART3_Start
	;***      318 :     R_UART1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 318
	call !!_R_UART1_Start
	;***      319 :     R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 319
	call !!_R_UART2_Start
	;***      320 :     R_CSI00_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 320
	call !!_R_CSI00_Start
	;***      321 : //    R_CSI01_Start();
	;***      322 : 
	;***      323 : 
	;***      324 :     R_ADC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 324
	call !!_R_ADC_Create
	;***      325 :     R_ADC_Set_OperationOn();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 325
	call !!_R_ADC_Set_OperationOn
	;***      326 :     R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 326
	call !!_R_ADC_Start
	;***      327 : 
	;***      328 :     R_DAC_Create();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 328
	call !!_R_DAC_Create
	;***      329 : 	CVCC_Current_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 329
	clrb a
	call !!_R_DAC0_Set_ConversionValue
	;***      330 : 	Salt_Analog_Set(0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 330
	clrb a
	call !!_R_DAC1_Set_ConversionValue
	;***      331 :     R_DAC0_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 331
	call !!_R_DAC0_Start
	;***      332 :     R_DAC1_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/r_main.c", 332
	br !!_R_DAC1_Start
	;***      333 :     /* End user code. Do not edit comment generated here */
	;***      334 : }
	;***      335 : 
	;***      336 : /* Start user code for adding. Do not edit comment generated here */
	;***      337 : /* End user code. Do not edit comment generated here */
	.SECTION .bss,BSS
	.ALIGN 2
_g_Tick@1:
	.DS (104)
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
