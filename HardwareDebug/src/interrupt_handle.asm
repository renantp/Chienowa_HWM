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
#@   -o src/interrupt_handle.obj
#@   ../src/interrupt_handle.c
#@  compiled at Thu Jun 30 14:37:21 2022

	.EXTERN _g_control_setting
	.EXTERN _g_io_status
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_commnunication_flag
	.EXTERN _g_machine_mode
	.EXTERN _g_systemTime
	.EXTERN _g_uart2_fault
	.EXTERN _g_uart2_receive
	.EXTERN _g_rx_data
	.PUBLIC _g_adc_value
	.PUBLIC _g_rasp_state
	.PUBLIC _flag_counter
	.PUBLIC _adc_int_handle
	.EXTERN _R_ADC_Get_Result
	.EXTERN _R_ADC_Start
	.PUBLIC _Raspberry_uart2_handle
	.PUBLIC _isCommandNeedResponse
	.EXTERN _R_UART2_Receive

	.SECTION .textf,TEXTF
_adc_int_handle:
	.STACK _adc_int_handle = 8
	;***        1 : /*
	;***        2 :  * interupt_handle.c
	;***        3 :  *
	;***        4 :  *  Created on: 11 Oct 2021
	;***        5 :  *      Author: Hung
	;***        6 :  *      This file with handle all interrupt. Include:
	;***        7 :  *      - UART 2: Set flag response Raspberry Pi.
	;***        8 :  *      - Timer 0: Timer counter
	;***        9 :  */
	;***       10 : 
	;***       11 : #include "r_cg_macrodriver.h"
	;***       12 : #include "r_cg_userdefine.h"
	;***       13 : #include "r_cg_adc.h"
	;***       14 : #include "r_cg_timer.h"
	;***       15 : uint16_t g_adc_value[2];
	;***       16 : struct Raspberry_state_s g_rasp_state;
	;***       17 : uint8_t isCommandNeedResponse(uint8_t *data);
	;***       18 : struct Flag_counter{
	;***       19 : 	uint8_t time_setting;
	;***       20 : 	uint8_t number_setting;
	;***       21 : 	uint8_t mode_setting;
	;***       22 : 	uint8_t alarm_setting;
	;***       23 : }flag_counter;
	;***       24 : 
	;***       25 : void adc_int_handle(void){
	;***       26 : 	//TODO: Change ratio to calculate ADC when change to new resistor.
	;***       27 : 	const float _max_voltage = 10.0;
	;***       28 : 	switch (ADS) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 28
	mov a, 0xFFF31
	cmp0 a
	bz $.BB@LABEL@1_3
.BB@LABEL@1_1:	; entry
	dec a
	bnz $.BB@LABEL@1_4
.BB@LABEL@1_2:	; switch_clause_bb8
	;***       29 : 		case _00_AD_INPUT_CHANNEL_0:
	;***       30 : 			R_ADC_Get_Result(&g_adc_value[0]);
	;***       31 : 			g_io_status.refined.CVCCCurrent = ((float)g_adc_value[0]/1024)*_max_voltage;
	;***       32 : //			g_io_status.refined.CVCCCurrent = 1.24f;
	;***       33 : 			ADS = _01_AD_INPUT_CHANNEL_1;
	;***       34 : 			break;
	;***       35 : 		case _01_AD_INPUT_CHANNEL_1:
	;***       36 : 			R_ADC_Get_Result(&g_adc_value[1]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 36
	movw ax, #LOWW(_g_adc_value+0x00002)
	call !!_R_ADC_Get_Result
	;***       37 : 			g_io_status.refined.CVCCVoltage = ((float)g_adc_value[1]/1024)*_max_voltage;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 37
	movw ax, !LOWW(_g_adc_value+0x00002)
	clrw bc
	call !!__COM_ultof
	movw de, ax
	movw ax, #0x3A80
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x4120
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	movw ax, bc
	addw sp, #0x04
	movw !LOWW(_g_io_status+0x0000A), ax
	movw ax, de
	movw !LOWW(_g_io_status+0x00008), ax
	;***       38 : //			g_io_status.refined.CVCCVoltage = 1.5f;
	;***       39 : 			ADS = _00_AD_INPUT_CHANNEL_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 39
	mov 0xFFF31, #0x00
	br $.BB@LABEL@1_4
.BB@LABEL@1_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 30
	movw ax, #LOWW(_g_adc_value)
	call !!_R_ADC_Get_Result
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 31
	movw ax, !LOWW(_g_adc_value)
	clrw bc
	call !!__COM_ultof
	movw de, ax
	movw ax, #0x3A80
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x4120
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	movw ax, bc
	addw sp, #0x04
	movw !LOWW(_g_io_status+0x0000E), ax
	movw ax, de
	movw !LOWW(_g_io_status+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 33
	mov 0xFFF31, #0x01
.BB@LABEL@1_4:	; switch_break_bb
	;***       40 : 			break;
	;***       41 : 		default:
	;***       42 : 			break;
	;***       43 : 	}
	;***       44 : 
	;***       45 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 45
	br !!_R_ADC_Start
_Raspberry_uart2_handle:
	.STACK _Raspberry_uart2_handle = 4
	;***       46 : }
	;***       47 : /*!
	;***       48 :  * Use in uart2 interrupt function
	;***       49 :  */
	;***       50 : void Raspberry_uart2_handle(void){
	;***       51 : 	g_Tick.tickUartTimeout = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 51
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x000C2), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x000C0), ax
	;***       52 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 52
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***       53 : 	g_commnunication_flag.recived_time_setting_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 53
	cmp !LOWW(_g_commnunication_flag+0x00004), #0x01
	mov a, #0x02
	skz
.BB@LABEL@2_1:	; bb6
	mov a, !LOWW(_g_commnunication_flag+0x00004)
.BB@LABEL@2_2:	; bb9
	mov !LOWW(_g_commnunication_flag+0x00004), a
	;***       54 : 			g_commnunication_flag.recived_time_setting_flag == 1 ?
	;***       55 : 					2 : g_commnunication_flag.recived_time_setting_flag;
	;***       56 : 	g_commnunication_flag.recived_number_setting_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 56
	cmp !LOWW(_g_commnunication_flag+0x00003), #0x01
	mov a, #0x02
	skz
.BB@LABEL@2_3:	; bb17
	mov a, !LOWW(_g_commnunication_flag+0x00003)
.BB@LABEL@2_4:	; bb21
	mov !LOWW(_g_commnunication_flag+0x00003), a
	;***       57 : 			g_commnunication_flag.recived_number_setting_flag == 1 ?
	;***       58 : 					2 : g_commnunication_flag.recived_number_setting_flag;
	;***       59 : 	g_commnunication_flag.recieve_status_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 59
	cmp !LOWW(_g_commnunication_flag+0x00009), #0x01
	mov a, #0x02
	skz
.BB@LABEL@2_5:	; bb31
	mov a, !LOWW(_g_commnunication_flag+0x00009)
.BB@LABEL@2_6:	; bb35
	mov !LOWW(_g_commnunication_flag+0x00009), a
	;***       60 : 			g_commnunication_flag.recieve_status_flag == 1 ?
	;***       61 : 					2 : g_commnunication_flag.recieve_status_flag;
	;***       62 : 	if (isCommandNeedResponse(g_rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 62
	movw ax, #LOWW(_g_rx_data)
	call $!_isCommandNeedResponse
	cmp0 a
	.bz $!.BB@LABEL@2_88
.BB@LABEL@2_7:	; bb43
	cmp0 !LOWW(_g_commnunication_flag+0x00004)
	bnz $.BB@LABEL@2_10
.BB@LABEL@2_8:	; bb55
	cmp0 !LOWW(_g_commnunication_flag+0x00003)
	sknz
.BB@LABEL@2_9:	; bb67
	cmp0 !LOWW(_g_commnunication_flag+0x00009)
.BB@LABEL@2_10:	; bb67
	.bnz $!.BB@LABEL@2_88
.BB@LABEL@2_11:	; if_then_bb
	;***       63 : 			&& g_commnunication_flag.recived_time_setting_flag == 0
	;***       64 : 			&& g_commnunication_flag.recived_number_setting_flag == 0
	;***       65 : 			&& g_commnunication_flag.recieve_status_flag == 0) {
	;***       66 : 		if(g_rx_data[0] == H_READ){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 66
	mov a, !LOWW(_g_rx_data)
	cmp a, #0x52
	.bnz $!.BB@LABEL@2_38
.BB@LABEL@2_12:	; if_then_bb86
	;***       67 : 			switch (g_rx_data[1]) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 67
	mov a, !LOWW(_g_rx_data+0x00001)
	add a, #0xFE
	bz $.BB@LABEL@2_27
.BB@LABEL@2_13:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_29
.BB@LABEL@2_14:	; if_then_bb86
	add a, #0xF0
	bz $.BB@LABEL@2_26
.BB@LABEL@2_15:	; if_then_bb86
	add a, #0xFC
	bz $.BB@LABEL@2_28
.BB@LABEL@2_16:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_30
.BB@LABEL@2_17:	; if_then_bb86
	add a, #0xFB
	bz $.BB@LABEL@2_31
.BB@LABEL@2_18:	; if_then_bb86
	add a, #0xF6
	bz $.BB@LABEL@2_32
.BB@LABEL@2_19:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_35
.BB@LABEL@2_20:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_33
.BB@LABEL@2_21:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_34
.BB@LABEL@2_22:	; if_then_bb86
	add a, #0xFE
	bz $.BB@LABEL@2_37
.BB@LABEL@2_23:	; if_then_bb86
	dec a
	bnz $.BB@LABEL@2_25
.BB@LABEL@2_24:	; switch_clause_bb106
	;***       68 : 				case NEXT_ANIMATION:
	;***       69 : 					g_commnunication_flag.send_response_flag = 0;
	;***       70 : 					g_commnunication_flag.next_animation_flag = 1;
	;***       71 : 					break;
	;***       72 : 				case READ_TIME:
	;***       73 : 					flag_counter.time_setting++;
	;***       74 : 					g_commnunication_flag.send_response_time_flag = 1;
	;***       75 : 					break;
	;***       76 : 				case MACHINE_IO_DATA:
	;***       77 : 					g_commnunication_flag.send_response_status_flag = 1;
	;***       78 : 					break;
	;***       79 : 				case READ_NUMBER:
	;***       80 : 					flag_counter.number_setting++;
	;***       81 : 					g_commnunication_flag.send_response_number_flag = 1;
	;***       82 : 					break;
	;***       83 : 				case WASHING_MODE:
	;***       84 : 					flag_counter.mode_setting++;
	;***       85 : 					g_commnunication_flag.send_response_mode_flag = 1;
	;***       86 : 					g_commnunication_flag.send_response_flag = 0;
	;***       87 : 					break;
	;***       88 : 				case MID_NIGHT:
	;***       89 : 					g_machine_state.isMidNight = g_rx_data[5];
	;***       90 : 					break;
	;***       91 : 				case DRAINAGE_MODE_SET:
	;***       92 : 					g_commnunication_flag.control_setting_flag = DRAINAGE_MODE_SET;
	;***       93 : 					g_commnunication_flag.send_response_flag = 0U;
	;***       94 : 					break;
	;***       95 : 				case POWER_ON_TEST_SET:
	;***       96 : 					g_commnunication_flag.control_setting_flag = POWER_ON_TEST_SET;
	;***       97 : 					g_commnunication_flag.send_response_flag = 0U;
	;***       98 : 					break;
	;***       99 : 				case WATER_FILTER_SET:
	;***      100 : 					g_commnunication_flag.control_setting_flag = WATER_FILTER_SET;
	;***      101 : 					g_commnunication_flag.send_response_flag = 0U;
	;***      102 : 					break;
	;***      103 : 				case BIOMETRIC_SET:
	;***      104 : 					g_commnunication_flag.control_setting_flag = BIOMETRIC_SET;
	;***      105 : 					g_commnunication_flag.send_response_flag = 0U;
	;***      106 : 					break;
	;***      107 : 				case CONTROL_SETTING:
	;***      108 : 					g_commnunication_flag.control_setting_flag = CONTROL_SETTING;
	;***      109 : 					g_commnunication_flag.send_response_flag = 0;
	;***      110 : 					break;
	;***      111 : 				case ALARM_STATUS:
	;***      112 : 					flag_counter.alarm_setting++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 112
	inc !LOWW(_flag_counter+0x00003)
	;***      113 : 					g_commnunication_flag.alarm_response_flag = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 113
	oneb !LOWW(_g_commnunication_flag+0x00008)
.BB@LABEL@2_25:	; switch_break_bb
	;***      114 : 					break;
	;***      115 : 				default:
	;***      116 : 					break;
	;***      117 : 			}
	;***      118 : 			if(g_commnunication_flag.control_setting_flag != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 118
	cmp0 !LOWW(_g_commnunication_flag+0x00016)
	.bnz $!.BB@LABEL@2_82, $!.BB@LABEL@2_91
.BB@LABEL@2_26:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 69
	clrb !LOWW(_g_commnunication_flag)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 70
	oneb !LOWW(_g_commnunication_flag+0x0000E)
	br $.BB@LABEL@2_25
.BB@LABEL@2_27:	; switch_clause_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 73
	inc !LOWW(_flag_counter)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 74
	oneb !LOWW(_g_commnunication_flag+0x00001)
	br $.BB@LABEL@2_25
.BB@LABEL@2_28:	; switch_clause_bb92
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 77
	oneb !LOWW(_g_commnunication_flag+0x00005)
	br $.BB@LABEL@2_25
.BB@LABEL@2_29:	; switch_clause_bb93
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 80
	inc !LOWW(_flag_counter+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 81
	oneb !LOWW(_g_commnunication_flag+0x00002)
	br $.BB@LABEL@2_25
.BB@LABEL@2_30:	; switch_clause_bb96
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 84
	inc !LOWW(_flag_counter+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 85
	oneb !LOWW(_g_commnunication_flag+0x00006)
	br $.BB@LABEL@2_36
.BB@LABEL@2_31:	; switch_clause_bb99
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 89
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_state+0x0000A), a
	br $.BB@LABEL@2_25
.BB@LABEL@2_32:	; switch_clause_bb101
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 92
	mov !LOWW(_g_commnunication_flag+0x00016), #0x27
	br $.BB@LABEL@2_36
.BB@LABEL@2_33:	; switch_clause_bb102
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 96
	mov !LOWW(_g_commnunication_flag+0x00016), #0x29
	br $.BB@LABEL@2_36
.BB@LABEL@2_34:	; switch_clause_bb103
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 100
	mov !LOWW(_g_commnunication_flag+0x00016), #0x2A
	br $.BB@LABEL@2_36
.BB@LABEL@2_35:	; switch_clause_bb104
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 104
	mov !LOWW(_g_commnunication_flag+0x00016), #0x28
.BB@LABEL@2_36:	; switch_clause_bb104
	clrb !LOWW(_g_commnunication_flag)
	br $.BB@LABEL@2_25
.BB@LABEL@2_37:	; switch_clause_bb105
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 108
	mov !LOWW(_g_commnunication_flag+0x00016), #0x2C
	br $.BB@LABEL@2_36
.BB@LABEL@2_38:	; if_else_bb
	;***      119 : 				g_commnunication_flag.send_response_flag = 0;
	;***      120 : 			}
	;***      121 : 		}else if(g_rx_data[0] == H_SET){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 121
	cmp a, #0x53
	.bnz $!.BB@LABEL@2_86
.BB@LABEL@2_39:	; if_then_bb121
	;***      122 : 			switch (g_rx_data[1]) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 122
	mov a, !LOWW(_g_rx_data+0x00001)
	cmp0 a
	bz $.BB@LABEL@2_60
.BB@LABEL@2_40:	; if_then_bb121
	dec a
	.bz $!.BB@LABEL@2_75
.BB@LABEL@2_41:	; if_then_bb121
	add a, #0xEE
	.bz $!.BB@LABEL@2_63
.BB@LABEL@2_42:	; if_then_bb121
	dec a
	bz $.BB@LABEL@2_61
.BB@LABEL@2_43:	; if_then_bb121
	dec a
	bz $.BB@LABEL@2_62
.BB@LABEL@2_44:	; if_then_bb121
	add a, #0xFD
	.bz $!.BB@LABEL@2_73
.BB@LABEL@2_45:	; if_then_bb121
	add a, #0xFE
	.bz $!.BB@LABEL@2_64
.BB@LABEL@2_46:	; if_then_bb121
	add a, #0xFE
	.bz $!.BB@LABEL@2_65
.BB@LABEL@2_47:	; if_then_bb121
	add a, #0xFE
	.bz $!.BB@LABEL@2_67
.BB@LABEL@2_48:	; if_then_bb121
	dec a
	.bz $!.BB@LABEL@2_68
.BB@LABEL@2_49:	; if_then_bb121
	dec a
	.bz $!.BB@LABEL@2_69
.BB@LABEL@2_50:	; if_then_bb121
	dec a
	.bz $!.BB@LABEL@2_70
.BB@LABEL@2_51:	; if_then_bb121
	dec a
	.bz $!.BB@LABEL@2_71
.BB@LABEL@2_52:	; if_then_bb121
	add a, #0xFB
	.bz $!.BB@LABEL@2_76
.BB@LABEL@2_53:	; if_then_bb121
	dec a
	.bz $!.BB@LABEL@2_81
.BB@LABEL@2_54:	; if_then_bb121
	dec a
	.bz $!.BB@LABEL@2_77
.BB@LABEL@2_55:	; if_then_bb121
	dec a
	.bz $!.BB@LABEL@2_79
.BB@LABEL@2_56:	; if_then_bb121
	dec a
	bz $.BB@LABEL@2_66
.BB@LABEL@2_57:	; if_then_bb121
	add a, #0xFD
	.bz $!.BB@LABEL@2_84
.BB@LABEL@2_58:	; if_then_bb121
	dec a
	bnz $.BB@LABEL@2_72
.BB@LABEL@2_59:	; switch_clause_bb174
	;***      123 : 				case OK_ALL:
	;***      124 : 					g_commnunication_flag.send_response_flag = 0;
	;***      125 : 					g_commnunication_flag.save_confirm_flag = 1;
	;***      126 : 					break;
	;***      127 : 				case SAVE_TIME:
	;***      128 : 					R_UART2_Receive(g_rx_data, timeSettingSize);
	;***      129 : 					g_commnunication_flag.recived_time_setting_flag = 1;
	;***      130 : 					break;
	;***      131 : 				case SAVE_NUMBER:
	;***      132 : 					R_UART2_Receive(g_rx_data, numberSettingSize);
	;***      133 : 					g_commnunication_flag.recived_number_setting_flag = 1;
	;***      134 : 					break;
	;***      135 : 				case NEXT_ANIMATION:
	;***      136 : 					g_commnunication_flag.send_response_flag = 0;
	;***      137 : 					g_commnunication_flag.next_animation_flag = 1;
	;***      138 : 					break;
	;***      139 : 				case TESTING_MODE_START:
	;***      140 : 					g_commnunication_flag.test_flag = TESTING_MODE_START;
	;***      141 : 					g_commnunication_flag.test_enable_flag = 1U;
	;***      142 : 					g_commnunication_flag.send_response_flag = 0U;
	;***      143 : 					break;
	;***      144 : 				case TESTING_MODE_STOP:
	;***      145 : 					g_commnunication_flag.test_flag = TESTING_MODE_STOP;
	;***      146 : 					g_commnunication_flag.test_enable_flag = 0U;
	;***      147 : 					g_commnunication_flag.send_response_flag = 0U;
	;***      148 : 					break;
	;***      149 : 				case TEST_POWER_ON:
	;***      150 : 					g_commnunication_flag.test_flag = TEST_POWER_ON;
	;***      151 : 					break;
	;***      152 : 				case TEST_FLOW_RATE:
	;***      153 : 					g_commnunication_flag.test_flag = TEST_FLOW_RATE;
	;***      154 : 					break;
	;***      155 : 				case TEST_CURRENT:
	;***      156 : 					g_commnunication_flag.test_flag = TEST_CURRENT;
	;***      157 : 					break;
	;***      158 : 				case TEST_INDIVIDUAL:
	;***      159 : 					g_commnunication_flag.recieve_status_flag = 1;
	;***      160 : 					g_commnunication_flag.test_individual_flag = 1;
	;***      161 : 					R_UART2_Receive(g_rx_data, 3);
	;***      162 : 					break;
	;***      163 : 				case TEST_ELECTROLYTIC:
	;***      164 : 					g_commnunication_flag.test_flag = TEST_ELECTROLYTIC;
	;***      165 : 					break;
	;***      166 : 				case WASHING_MODE:
	;***      167 : 					g_machine_mode = g_rx_data[5];
	;***      168 : 					break;
	;***      169 : 				case OK_USER:
	;***      170 : 					g_machine_state.user = 2;
	;***      171 : 					g_commnunication_flag.send_response_flag = 0U;
	;***      172 : 					break;
	;***      173 : 				//----------------Control Setting--------------------
	;***      174 : 				case DRAINAGE_MODE_SET:
	;***      175 : 					g_commnunication_flag.control_setting_flag = DRAINAGE_MODE_SET;
	;***      176 : 					g_commnunication_flag.control_setting_save_flag = 1;
	;***      177 : 					g_control_setting.raw.drain = g_rx_data[5];
	;***      178 : 					g_commnunication_flag.send_response_flag = 0;
	;***      179 : 					break;
	;***      180 : 				case POWER_ON_TEST_SET:
	;***      181 : 					g_commnunication_flag.control_setting_flag = POWER_ON_TEST_SET;
	;***      182 : 					g_commnunication_flag.control_setting_save_flag = 1;
	;***      183 : 					g_control_setting.raw.power_on = g_rx_data[5];
	;***      184 : 					g_commnunication_flag.send_response_flag = 0;
	;***      185 : 					break;
	;***      186 : 				case WATER_FILTER_SET:
	;***      187 : 					g_commnunication_flag.control_setting_flag = WATER_FILTER_SET;
	;***      188 : 					g_commnunication_flag.control_setting_save_flag = 1;
	;***      189 : 					g_control_setting.raw.filter = g_rx_data[5];
	;***      190 : 					g_commnunication_flag.send_response_flag = 0;
	;***      191 : 					break;
	;***      192 : 				case BIOMETRIC_SET:
	;***      193 : 					g_commnunication_flag.control_setting_flag = BIOMETRIC_SET;
	;***      194 : 					g_commnunication_flag.control_setting_save_flag = 1;
	;***      195 : 					g_control_setting.raw.biomectric = g_rx_data[5];
	;***      196 : 					g_commnunication_flag.send_response_flag = 0;
	;***      197 : 					break;
	;***      198 : 				//----------------End Control Setting--------------------
	;***      199 : 				case START_WASHING:
	;***      200 : 					g_commnunication_flag.send_response_flag = 0;
	;***      201 : 					break;
	;***      202 : 				case MONITOR_START:
	;***      203 : 					g_rasp_state.isMonitorScreen = 1U;
	;***      204 : 					g_commnunication_flag.test_enable_flag = 0U;
	;***      205 : 					g_commnunication_flag.monitor_enable_flag = 1U;
	;***      206 : 					break;
	;***      207 : 				case MONITOR_STOP:
	;***      208 : 					g_rasp_state.isMonitorScreen = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 208
	clrb !LOWW(_g_rasp_state)
	;***      209 : 					g_commnunication_flag.monitor_enable_flag = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 209
	clrb !LOWW(_g_commnunication_flag+0x0000C)
	;***      210 : 					g_commnunication_flag.test_enable_flag = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 210
	clrb !LOWW(_g_commnunication_flag+0x0000D)
	br $.BB@LABEL@2_74
.BB@LABEL@2_60:	; switch_clause_bb124
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 124
	clrb !LOWW(_g_commnunication_flag)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 125
	oneb !LOWW(_g_commnunication_flag+0x0000F)
	br $.BB@LABEL@2_74
.BB@LABEL@2_61:	; switch_clause_bb125
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 128
	movw bc, #0x00A1
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 129
	oneb !LOWW(_g_commnunication_flag+0x00004)
	br $.BB@LABEL@2_74
.BB@LABEL@2_62:	; switch_clause_bb129
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 132
	movw bc, #0x0029
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 133
	oneb !LOWW(_g_commnunication_flag+0x00003)
	br $.BB@LABEL@2_74
.BB@LABEL@2_63:	; switch_clause_bb133
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 136
	clrb !LOWW(_g_commnunication_flag)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 137
	oneb !LOWW(_g_commnunication_flag+0x0000E)
	br $.BB@LABEL@2_74
.BB@LABEL@2_64:	; switch_clause_bb134
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 140
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x1A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 141
	oneb !LOWW(_g_commnunication_flag+0x0000D)
	br $.BB@LABEL@2_78
.BB@LABEL@2_65:	; switch_clause_bb135
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 145
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x1C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 146
	clrb !LOWW(_g_commnunication_flag+0x0000D)
.BB@LABEL@2_66:	; switch_clause_bb135
	br $.BB@LABEL@2_80
.BB@LABEL@2_67:	; switch_clause_bb136
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 150
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x1E
	br $.BB@LABEL@2_74
.BB@LABEL@2_68:	; switch_clause_bb137
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 153
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x1F
	br $.BB@LABEL@2_74
.BB@LABEL@2_69:	; switch_clause_bb138
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 156
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x20
	br $.BB@LABEL@2_83
.BB@LABEL@2_70:	; switch_clause_bb139
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 159
	oneb !LOWW(_g_commnunication_flag+0x00009)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 160
	oneb !LOWW(_g_commnunication_flag+0x0000B)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 161
	movw bc, #0x0003
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	br $.BB@LABEL@2_85
.BB@LABEL@2_71:	; switch_clause_bb141
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 164
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x22
.BB@LABEL@2_72:	; switch_clause_bb141
	br $.BB@LABEL@2_85
.BB@LABEL@2_73:	; switch_clause_bb142
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 167
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_mode), a
.BB@LABEL@2_74:	; switch_clause_bb142
	br $.BB@LABEL@2_85
.BB@LABEL@2_75:	; switch_clause_bb144
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 170
	mov !LOWW(_g_machine_state+0x0000E), #0x02
	br $.BB@LABEL@2_82
.BB@LABEL@2_76:	; switch_clause_bb145
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 177
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 175
	mov !LOWW(_g_commnunication_flag+0x00016), #0x27
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 176
	oneb !LOWW(_g_commnunication_flag+0x00017)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 177
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_control_setting)
	mov1 [hl].0, CY
	br $.BB@LABEL@2_82
.BB@LABEL@2_77:	; switch_clause_bb151
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 183
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 181
	mov !LOWW(_g_commnunication_flag+0x00016), #0x29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 182
	oneb !LOWW(_g_commnunication_flag+0x00017)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 183
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_control_setting)
	mov1 [hl].1, CY
.BB@LABEL@2_78:	; switch_clause_bb151
	br $.BB@LABEL@2_82
.BB@LABEL@2_79:	; switch_clause_bb158
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 189
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 187
	mov !LOWW(_g_commnunication_flag+0x00016), #0x2A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 188
	oneb !LOWW(_g_commnunication_flag+0x00017)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 189
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_control_setting)
	mov1 [hl].2, CY
.BB@LABEL@2_80:	; switch_clause_bb158
	br $.BB@LABEL@2_82
.BB@LABEL@2_81:	; switch_clause_bb165
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 195
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 193
	mov !LOWW(_g_commnunication_flag+0x00016), #0x28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 194
	oneb !LOWW(_g_commnunication_flag+0x00017)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 195
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_control_setting)
	mov1 [hl].3, CY
.BB@LABEL@2_82:	; switch_clause_bb172
	clrb !LOWW(_g_commnunication_flag)
.BB@LABEL@2_83:	; switch_clause_bb172
	br $.BB@LABEL@2_91
.BB@LABEL@2_84:	; switch_clause_bb173
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 203
	oneb !LOWW(_g_rasp_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 204
	clrb !LOWW(_g_commnunication_flag+0x0000D)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 205
	oneb !LOWW(_g_commnunication_flag+0x0000C)
.BB@LABEL@2_85:	; switch_clause_bb173
	br $.BB@LABEL@2_91
.BB@LABEL@2_86:	; if_else_bb177
	;***      211 : 					break;
	;***      212 : 				default:
	;***      213 : 					break;
	;***      214 : 			}
	;***      215 : 		}else if ((g_rx_data[0] == H_CLEAR)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 215
	cmp a, #0x43
	bnz $.BB@LABEL@2_91
.BB@LABEL@2_87:	; if_then_bb183
	;***      216 : 			g_commnunication_flag.alarm_clear_flag = g_rx_data[1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 216
	mov a, !LOWW(_g_rx_data+0x00001)
	mov !LOWW(_g_commnunication_flag+0x00007), a
	br $.BB@LABEL@2_82
.BB@LABEL@2_88:	; if_else_bb188
	;***      217 : 			g_commnunication_flag.send_response_flag = 0;
	;***      218 : 		}
	;***      219 : 	} else if (g_commnunication_flag.recived_time_setting_flag != 0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 219
	cmp0 !LOWW(_g_commnunication_flag+0x00004)
	bnz $.BB@LABEL@2_91
.BB@LABEL@2_89:	; bb193
	cmp0 !LOWW(_g_commnunication_flag+0x00003)
	sknz
.BB@LABEL@2_90:	; if_else_bb207
	;***      220 : 			|| g_commnunication_flag.recived_number_setting_flag != 0) {
	;***      221 : //		R_UART2_Receive(g_rx_data, 6);
	;***      222 : 	} else {
	;***      223 : 		g_uart2_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 223
	oneb !LOWW(_g_uart2_fault)
.BB@LABEL@2_91:	; if_break_bb209
	;***      224 : 	}
	;***      225 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 225
	inc !LOWW(_g_uart2_receive)
	ret
_isCommandNeedResponse:
	.STACK _isCommandNeedResponse = 4
	;***      226 : 
	;***      227 : }
	;***      228 : uint8_t isCommandNeedResponse(uint8_t *data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 228
	movw de, ax
	;***      229 : 	if ((data[0] == H_SET) && (data[1] == NEXT_ANIMATION)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 229
	mov a, [de]
	mov x, a
	cmp a, #0x53
	bnz $.BB@LABEL@3_2
.BB@LABEL@3_1:	; bb
	mov a, [de+0x01]
	cmp a, #0x13
	bz $.BB@LABEL@3_7
.BB@LABEL@3_2:	; if_break_bb
	mov a, x
	;***      230 : 		return 0;
	;***      231 : 	}
	;***      232 : 	switch ((enum UART_header_e) *data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 232
	add a, #0xBD
	bz $.BB@LABEL@3_6
.BB@LABEL@3_3:	; if_break_bb
	add a, #0xFE
	bz $.BB@LABEL@3_6
.BB@LABEL@3_4:	; if_break_bb
	add a, #0xF3
	bz $.BB@LABEL@3_6
.BB@LABEL@3_5:	; if_break_bb
	dec a
	bnz $.BB@LABEL@3_7
.BB@LABEL@3_6:	; switch_clause_bb26
	oneb !LOWW(_g_commnunication_flag)
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 252
	ret
.BB@LABEL@3_7:	; bb30
	;***      233 : //		case H_ALARM:
	;***      234 : //			commnunication_flag.send_response_flag = 1;
	;***      235 : //			break;
	;***      236 : 	case H_CLEAR:
	;***      237 : 		g_commnunication_flag.send_response_flag = 1;
	;***      238 : 		break;
	;***      239 : 	case H_ERROR:
	;***      240 : 		g_commnunication_flag.send_response_flag = 1;
	;***      241 : 		break;
	;***      242 : 	case H_READ:
	;***      243 : 		g_commnunication_flag.send_response_flag = 1;
	;***      244 : 		break;
	;***      245 : 	case H_SET:
	;***      246 : 		g_commnunication_flag.send_response_flag = 1;
	;***      247 : 		break;
	;***      248 : 	default:
	;***      249 : 		return 0;
	;***      250 : 	}
	;***      251 : 	return 1;
	;***      252 : }
	clrb a
	ret
	.SECTION .bss,BSS
	.ALIGN 2
_g_adc_value:
	.DS (4)
_g_rasp_state:
	.DS (1)
_flag_counter:
	.DS (4)
