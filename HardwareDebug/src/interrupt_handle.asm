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
#@  compiled at Thu May 05 15:52:55 2022

	.EXTERN _g_test_control
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
	;***       16 : 
	;***       17 : uint8_t isCommandNeedResponse(uint8_t *data);
	;***       18 : 
	;***       19 : void adc_int_handle(void){
	;***       20 : 	//TODO: Change ratio to calculate ADC when change to new resistor.
	;***       21 : 	const float _max_voltage = 10.0;
	;***       22 : 	switch (ADS) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 22
	mov a, 0xFFF31
	cmp0 a
	bz $.BB@LABEL@1_3
.BB@LABEL@1_1:	; entry
	dec a
	bnz $.BB@LABEL@1_4
.BB@LABEL@1_2:	; switch_clause_bb8
	;***       23 : 		case _00_AD_INPUT_CHANNEL_0:
	;***       24 : 			R_ADC_Get_Result(&g_adc_value[0]);
	;***       25 : 			g_io_status.refined.CVCCCurrent = ((float)g_adc_value[0]/1024)*_max_voltage;
	;***       26 : //			g_io_status.refined.CVCCCurrent = 1.24f;
	;***       27 : 			ADS = _01_AD_INPUT_CHANNEL_1;
	;***       28 : 			break;
	;***       29 : 		case _01_AD_INPUT_CHANNEL_1:
	;***       30 : 			R_ADC_Get_Result(&g_adc_value[1]);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 30
	movw ax, #LOWW(_g_adc_value+0x00002)
	call !!_R_ADC_Get_Result
	;***       31 : 			g_io_status.refined.CVCCVoltage = ((float)g_adc_value[1]/1024)*_max_voltage;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 31
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
	movw !LOWW(_g_io_status+0x0000C), ax
	movw ax, de
	movw !LOWW(_g_io_status+0x0000A), ax
	;***       32 : //			g_io_status.refined.CVCCVoltage = 1.5f;
	;***       33 : 			ADS = _00_AD_INPUT_CHANNEL_0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 33
	mov 0xFFF31, #0x00
	br $.BB@LABEL@1_4
.BB@LABEL@1_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 24
	movw ax, #LOWW(_g_adc_value)
	call !!_R_ADC_Get_Result
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 25
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
	movw !LOWW(_g_io_status+0x00010), ax
	movw ax, de
	movw !LOWW(_g_io_status+0x0000E), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 27
	mov 0xFFF31, #0x01
.BB@LABEL@1_4:	; switch_break_bb
	;***       34 : 			break;
	;***       35 : 		default:
	;***       36 : 			break;
	;***       37 : 	}
	;***       38 : 
	;***       39 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 39
	br !!_R_ADC_Start
_Raspberry_uart2_handle:
	.STACK _Raspberry_uart2_handle = 4
	;***       40 : }
	;***       41 : /*!
	;***       42 :  * Use in uart2 interrupt function
	;***       43 :  */
	;***       44 : void Raspberry_uart2_handle(void){
	;***       45 : 	g_Tick.tickUartTimeout = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 45
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x000BA), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x000B8), ax
	;***       46 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 46
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***       47 : 	g_commnunication_flag.recived_time_setting_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 47
	cmp !LOWW(_g_commnunication_flag+0x00004), #0x01
	mov a, #0x02
	skz
.BB@LABEL@2_1:	; bb6
	mov a, !LOWW(_g_commnunication_flag+0x00004)
.BB@LABEL@2_2:	; bb9
	mov !LOWW(_g_commnunication_flag+0x00004), a
	;***       48 : 			g_commnunication_flag.recived_time_setting_flag == 1 ?
	;***       49 : 					2 : g_commnunication_flag.recived_time_setting_flag;
	;***       50 : 	g_commnunication_flag.recived_number_setting_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 50
	cmp !LOWW(_g_commnunication_flag+0x00003), #0x01
	mov a, #0x02
	skz
.BB@LABEL@2_3:	; bb17
	mov a, !LOWW(_g_commnunication_flag+0x00003)
.BB@LABEL@2_4:	; bb21
	mov !LOWW(_g_commnunication_flag+0x00003), a
	;***       51 : 			g_commnunication_flag.recived_number_setting_flag == 1 ?
	;***       52 : 					2 : g_commnunication_flag.recived_number_setting_flag;
	;***       53 : 	g_commnunication_flag.recieve_status_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 53
	cmp !LOWW(_g_commnunication_flag+0x00009), #0x01
	mov a, #0x02
	skz
.BB@LABEL@2_5:	; bb31
	mov a, !LOWW(_g_commnunication_flag+0x00009)
.BB@LABEL@2_6:	; bb35
	mov !LOWW(_g_commnunication_flag+0x00009), a
	;***       54 : 			g_commnunication_flag.recieve_status_flag == 1 ?
	;***       55 : 					2 : g_commnunication_flag.recieve_status_flag;
	;***       56 : 	if (isCommandNeedResponse(g_rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 56
	movw ax, #LOWW(_g_rx_data)
	call $!_isCommandNeedResponse
	cmp0 a
	.bz $!.BB@LABEL@2_82
.BB@LABEL@2_7:	; bb43
	cmp0 !LOWW(_g_commnunication_flag+0x00004)
	bnz $.BB@LABEL@2_10
.BB@LABEL@2_8:	; bb55
	cmp0 !LOWW(_g_commnunication_flag+0x00003)
	sknz
.BB@LABEL@2_9:	; bb67
	cmp0 !LOWW(_g_commnunication_flag+0x00009)
.BB@LABEL@2_10:	; bb67
	.bnz $!.BB@LABEL@2_82
.BB@LABEL@2_11:	; if_then_bb
	;***       57 : 			&& g_commnunication_flag.recived_time_setting_flag == 0
	;***       58 : 			&& g_commnunication_flag.recived_number_setting_flag == 0
	;***       59 : 			&& g_commnunication_flag.recieve_status_flag == 0) {
	;***       60 : 		if(g_rx_data[0] == H_READ){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 60
	mov a, !LOWW(_g_rx_data)
	cmp a, #0x52
	bnz $.BB@LABEL@2_35
.BB@LABEL@2_12:	; if_then_bb86
	;***       61 : 			switch (g_rx_data[1]) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 61
	mov a, !LOWW(_g_rx_data+0x00001)
	add a, #0xFE
	bz $.BB@LABEL@2_25
.BB@LABEL@2_13:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_27
.BB@LABEL@2_14:	; if_then_bb86
	add a, #0xF0
	bz $.BB@LABEL@2_24
.BB@LABEL@2_15:	; if_then_bb86
	add a, #0xFC
	bz $.BB@LABEL@2_26
.BB@LABEL@2_16:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_28
.BB@LABEL@2_17:	; if_then_bb86
	add a, #0xFB
	bz $.BB@LABEL@2_29
.BB@LABEL@2_18:	; if_then_bb86
	add a, #0xF6
	bz $.BB@LABEL@2_30
.BB@LABEL@2_19:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_33
.BB@LABEL@2_20:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_31
.BB@LABEL@2_21:	; if_then_bb86
	dec a
	bz $.BB@LABEL@2_32
.BB@LABEL@2_22:	; if_then_bb86
	cmp a, #0x02
	bnz $.BB@LABEL@2_34
.BB@LABEL@2_23:	; switch_clause_bb99
	;***       62 : 				case NEXT_ANIMATION:
	;***       63 : 					g_commnunication_flag.send_response_flag = 0;
	;***       64 : 					g_commnunication_flag.next_animation_flag = 1;
	;***       65 : 					break;
	;***       66 : 				case READ_TIME:
	;***       67 : 					g_commnunication_flag.send_response_time_flag = 1;
	;***       68 : 					break;
	;***       69 : 				case MACHINE_IO_DATA:
	;***       70 : 					g_commnunication_flag.send_response_status_flag = 1;
	;***       71 : 					break;
	;***       72 : 				case READ_NUMBER:
	;***       73 : 					g_commnunication_flag.send_response_number_flag = 1;
	;***       74 : 					break;
	;***       75 : 				case WASHING_MODE:
	;***       76 : 					g_commnunication_flag.send_response_mode_flag = 1;
	;***       77 : 					g_commnunication_flag.send_response_flag = 0;
	;***       78 : 					break;
	;***       79 : 				case MID_NIGHT:
	;***       80 : 					g_machine_state.isMidNight = g_rx_data[5];
	;***       81 : 					break;
	;***       82 : 				case DRAINAGE_MODE_SET:
	;***       83 : 					g_commnunication_flag.control_test_flag = DRAINAGE_MODE_SET;
	;***       84 : 					break;
	;***       85 : 				case POWER_ON_TEST_SET:
	;***       86 : 					g_commnunication_flag.control_test_flag = POWER_ON_TEST_SET;
	;***       87 : 					break;
	;***       88 : 				case WATER_FILTER_SET:
	;***       89 : 					g_commnunication_flag.control_test_flag = WATER_FILTER_SET;
	;***       90 : 					break;
	;***       91 : 				case BIOMECTRIC_SET:
	;***       92 : 					g_commnunication_flag.control_test_flag = BIOMECTRIC_SET;
	;***       93 : 					break;
	;***       94 : 				case CONTROL_SETTING:
	;***       95 : 					g_commnunication_flag.control_test_flag = CONTROL_SETTING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 95
	mov !LOWW(_g_commnunication_flag+0x00012), #0x2C
	br $.BB@LABEL@2_34
.BB@LABEL@2_24:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 63
	clrb !LOWW(_g_commnunication_flag)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 64
	oneb !LOWW(_g_commnunication_flag+0x0000B)
	br $.BB@LABEL@2_34
.BB@LABEL@2_25:	; switch_clause_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 67
	oneb !LOWW(_g_commnunication_flag+0x00001)
	br $.BB@LABEL@2_34
.BB@LABEL@2_26:	; switch_clause_bb90
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 70
	oneb !LOWW(_g_commnunication_flag+0x00005)
	br $.BB@LABEL@2_34
.BB@LABEL@2_27:	; switch_clause_bb91
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 73
	oneb !LOWW(_g_commnunication_flag+0x00002)
	br $.BB@LABEL@2_34
.BB@LABEL@2_28:	; switch_clause_bb92
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 76
	oneb !LOWW(_g_commnunication_flag+0x00006)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 77
	clrb !LOWW(_g_commnunication_flag)
	br $.BB@LABEL@2_34
.BB@LABEL@2_29:	; switch_clause_bb93
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 80
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_state+0x0000A), a
	br $.BB@LABEL@2_34
.BB@LABEL@2_30:	; switch_clause_bb95
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 83
	mov !LOWW(_g_commnunication_flag+0x00012), #0x27
	br $.BB@LABEL@2_34
.BB@LABEL@2_31:	; switch_clause_bb96
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 86
	mov !LOWW(_g_commnunication_flag+0x00012), #0x29
	br $.BB@LABEL@2_34
.BB@LABEL@2_32:	; switch_clause_bb97
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 89
	mov !LOWW(_g_commnunication_flag+0x00012), #0x2A
	br $.BB@LABEL@2_34
.BB@LABEL@2_33:	; switch_clause_bb98
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 92
	mov !LOWW(_g_commnunication_flag+0x00012), #0x28
.BB@LABEL@2_34:	; switch_break_bb
	;***       96 : 					break;
	;***       97 : 				default:
	;***       98 : 					break;
	;***       99 : 			}
	;***      100 : 			if(g_commnunication_flag.control_test_flag != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 100
	cmp0 !LOWW(_g_commnunication_flag+0x00012)
	bz $.BB@LABEL@2_54
	br $!.BB@LABEL@2_77
.BB@LABEL@2_35:	; if_else_bb
	;***      101 : 				g_commnunication_flag.send_response_flag = 0;
	;***      102 : 			}
	;***      103 : 		}else if(g_rx_data[0] == H_SET){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 103
	cmp a, #0x53
	.bnz $!.BB@LABEL@2_79
.BB@LABEL@2_36:	; if_then_bb112
	;***      104 : 			switch (g_rx_data[1]) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 104
	mov a, !LOWW(_g_rx_data+0x00001)
	cmp0 a
	bz $.BB@LABEL@2_55
.BB@LABEL@2_37:	; if_then_bb112
	dec a
	.bz $!.BB@LABEL@2_66
.BB@LABEL@2_38:	; if_then_bb112
	add a, #0xEE
	bz $.BB@LABEL@2_58
.BB@LABEL@2_39:	; if_then_bb112
	dec a
	bz $.BB@LABEL@2_56
.BB@LABEL@2_40:	; if_then_bb112
	dec a
	bz $.BB@LABEL@2_57
.BB@LABEL@2_41:	; if_then_bb112
	add a, #0xFD
	.bz $!.BB@LABEL@2_65
.BB@LABEL@2_42:	; if_then_bb112
	add a, #0xFE
	.bz $!.BB@LABEL@2_76
.BB@LABEL@2_43:	; if_then_bb112
	add a, #0xFE
	bz $.BB@LABEL@2_59
.BB@LABEL@2_44:	; if_then_bb112
	add a, #0xFE
	bz $.BB@LABEL@2_60
.BB@LABEL@2_45:	; if_then_bb112
	dec a
	bz $.BB@LABEL@2_61
.BB@LABEL@2_46:	; if_then_bb112
	dec a
	bz $.BB@LABEL@2_62
.BB@LABEL@2_47:	; if_then_bb112
	dec a
	bz $.BB@LABEL@2_63
.BB@LABEL@2_48:	; if_then_bb112
	dec a
	bz $.BB@LABEL@2_64
.BB@LABEL@2_49:	; if_then_bb112
	add a, #0xFB
	.bz $!.BB@LABEL@2_68
.BB@LABEL@2_50:	; if_then_bb112
	dec a
	.bz $!.BB@LABEL@2_74
.BB@LABEL@2_51:	; if_then_bb112
	dec a
	.bz $!.BB@LABEL@2_70
.BB@LABEL@2_52:	; if_then_bb112
	dec a
	.bz $!.BB@LABEL@2_72
.BB@LABEL@2_53:	; if_then_bb112
	dec a
	.bz $!.BB@LABEL@2_77
.BB@LABEL@2_54:	; if_then_bb112
	br $.BB@LABEL@2_67
.BB@LABEL@2_55:	; switch_clause_bb115
	;***      105 : 				case OK_ALL:
	;***      106 : 					g_commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 106
	clrb !LOWW(_g_commnunication_flag)
	;***      107 : 					g_commnunication_flag.save_confirm_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 107
	oneb !LOWW(_g_commnunication_flag+0x0000C)
	br $.BB@LABEL@2_69
.BB@LABEL@2_56:	; switch_clause_bb116
	;***      108 : 					break;
	;***      109 : 				case SAVE_TIME:
	;***      110 : 					R_UART2_Receive(g_rx_data, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 110
	movw bc, #0x0095
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      111 : 					g_commnunication_flag.recived_time_setting_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 111
	oneb !LOWW(_g_commnunication_flag+0x00004)
	br $.BB@LABEL@2_71
.BB@LABEL@2_57:	; switch_clause_bb120
	;***      112 : 					break;
	;***      113 : 				case SAVE_NUMBER:
	;***      114 : 					R_UART2_Receive(g_rx_data, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 114
	movw bc, #0x0029
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***      115 : 					g_commnunication_flag.recived_number_setting_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 115
	oneb !LOWW(_g_commnunication_flag+0x00003)
	br $.BB@LABEL@2_73
.BB@LABEL@2_58:	; switch_clause_bb124
	;***      116 : 					break;
	;***      117 : 				case NEXT_ANIMATION:
	;***      118 : 					g_commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 118
	clrb !LOWW(_g_commnunication_flag)
	;***      119 : 					g_commnunication_flag.next_animation_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 119
	oneb !LOWW(_g_commnunication_flag+0x0000B)
	br $.BB@LABEL@2_73
.BB@LABEL@2_59:	; switch_clause_bb126
	;***      120 : 					break;
	;***      121 : 				case TESTING_MODE_START:
	;***      122 : 					g_commnunication_flag.test_flag = TESTING_MODE_START;
	;***      123 : 					g_commnunication_flag.send_response_flag = 0;
	;***      124 : 					break;
	;***      125 : 				case TESTING_MODE_STOP:
	;***      126 : 					g_commnunication_flag.test_flag = TESTING_MODE_STOP;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 126
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x1C
	br $.BB@LABEL@2_75
.BB@LABEL@2_60:	; switch_clause_bb127
	;***      127 : 					break;
	;***      128 : 				case TEST_POWER_ON:
	;***      129 : 					g_commnunication_flag.test_flag = TEST_POWER_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 129
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x1E
	br $.BB@LABEL@2_75
.BB@LABEL@2_61:	; switch_clause_bb128
	;***      130 : 					break;
	;***      131 : 				case TEST_FLOW_RATE:
	;***      132 : 					g_commnunication_flag.test_flag = TEST_FLOW_RATE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 132
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x1F
	br $.BB@LABEL@2_78
.BB@LABEL@2_62:	; switch_clause_bb129
	;***      133 : 					break;
	;***      134 : 				case TEST_CURRENT:
	;***      135 : 					g_commnunication_flag.test_flag = TEST_CURRENT;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 135
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x20
	br $.BB@LABEL@2_78
.BB@LABEL@2_63:	; switch_clause_bb130
	;***      136 : 					break;
	;***      137 : 				case TEST_INDIVIDUAL:
	;***      138 : 					g_commnunication_flag.test_flag = TEST_INDIVIDUAL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 138
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x21
	;***      139 : 					g_commnunication_flag.recieve_status_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 139
	oneb !LOWW(_g_commnunication_flag+0x00009)
	;***      140 : 					R_UART2_Receive(g_rx_data, 4);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 140
	movw bc, #0x0004
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	br $.BB@LABEL@2_81
.BB@LABEL@2_64:	; switch_clause_bb132
	;***      141 : 					break;
	;***      142 : 				case TEST_ELECTROLYTIC:
	;***      143 : 					g_commnunication_flag.test_flag = TEST_ELECTROLYTIC;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 143
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x22
	br $.BB@LABEL@2_85
.BB@LABEL@2_65:	; switch_clause_bb133
	;***      144 : 					break;
	;***      145 : 				case WASHING_MODE:
	;***      146 : 					g_machine_mode = g_rx_data[5];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 146
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_mode), a
	br $.BB@LABEL@2_85
.BB@LABEL@2_66:	; switch_clause_bb135
	;***      147 : 					break;
	;***      148 : 				case OK_USER:
	;***      149 : 					g_machine_state.user = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 149
	mov !LOWW(_g_machine_state+0x0000D), #0x02
.BB@LABEL@2_67:	; switch_clause_bb135
	br $.BB@LABEL@2_85
.BB@LABEL@2_68:	; switch_clause_bb136
	;***      150 : 					break;
	;***      151 : 				case DRAINAGE_MODE_SET:
	;***      152 : 					g_commnunication_flag.control_test_save_flag = 1;
	;***      153 : 					g_test_control.raw.drain = g_rx_data[5];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 153
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 152
	oneb !LOWW(_g_commnunication_flag+0x00013)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 153
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_test_control)
	mov1 [hl].0, CY
.BB@LABEL@2_69:	; switch_clause_bb136
	br $.BB@LABEL@2_85
.BB@LABEL@2_70:	; switch_clause_bb142
	;***      154 : 					break;
	;***      155 : 				case POWER_ON_TEST_SET:
	;***      156 : 					g_commnunication_flag.control_test_save_flag = 1;
	;***      157 : 					g_test_control.raw.power_on = g_rx_data[5];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 157
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 156
	oneb !LOWW(_g_commnunication_flag+0x00013)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 157
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_test_control)
	mov1 [hl].1, CY
.BB@LABEL@2_71:	; switch_clause_bb142
	br $.BB@LABEL@2_85
.BB@LABEL@2_72:	; switch_clause_bb149
	;***      158 : 					break;
	;***      159 : 				case WATER_FILTER_SET:
	;***      160 : 					g_commnunication_flag.control_test_save_flag = 1;
	;***      161 : 					g_test_control.raw.filter = g_rx_data[5];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 161
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 160
	oneb !LOWW(_g_commnunication_flag+0x00013)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 161
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_test_control)
	mov1 [hl].2, CY
.BB@LABEL@2_73:	; switch_clause_bb149
	br $.BB@LABEL@2_85
.BB@LABEL@2_74:	; switch_clause_bb156
	;***      162 : 					break;
	;***      163 : 				case BIOMECTRIC_SET:
	;***      164 : 					g_commnunication_flag.control_test_save_flag = 1;
	;***      165 : 					g_test_control.raw.biomectric = g_rx_data[5];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 165
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 164
	oneb !LOWW(_g_commnunication_flag+0x00013)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 165
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_test_control)
	mov1 [hl].3, CY
.BB@LABEL@2_75:	; switch_clause_bb156
	br $.BB@LABEL@2_85
.BB@LABEL@2_76:	; switch_clause_bb125
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 122
	mov !LOWW(_g_commnunication_flag+0x0000A), #0x1A
.BB@LABEL@2_77:	; switch_clause_bb163
	clrb !LOWW(_g_commnunication_flag)
.BB@LABEL@2_78:	; switch_clause_bb163
	br $.BB@LABEL@2_85
.BB@LABEL@2_79:	; if_else_bb166
	;***      166 : 					break;
	;***      167 : 				case START_WASHING:
	;***      168 : 					g_commnunication_flag.send_response_flag = 0;
	;***      169 : 					break;
	;***      170 : 				default:
	;***      171 : 					break;
	;***      172 : 			}
	;***      173 : 		}else if ((g_rx_data[0] == H_CLEAR)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 173
	cmp a, #0x43
	bnz $.BB@LABEL@2_85
.BB@LABEL@2_80:	; if_then_bb172
	;***      174 : 			g_commnunication_flag.alarm_clear_flag = g_rx_data[1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 174
	mov a, !LOWW(_g_rx_data+0x00001)
	mov !LOWW(_g_commnunication_flag+0x00007), a
.BB@LABEL@2_81:	; if_then_bb172
	br $.BB@LABEL@2_85
.BB@LABEL@2_82:	; if_else_bb177
	;***      175 : 		}
	;***      176 : 	} else if (g_commnunication_flag.recived_time_setting_flag != 0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 176
	cmp0 !LOWW(_g_commnunication_flag+0x00004)
	bnz $.BB@LABEL@2_85
.BB@LABEL@2_83:	; bb182
	cmp0 !LOWW(_g_commnunication_flag+0x00003)
	sknz
.BB@LABEL@2_84:	; if_else_bb196
	;***      177 : 			|| g_commnunication_flag.recived_number_setting_flag != 0) {
	;***      178 : //		R_UART2_Receive(g_rx_data, 6);
	;***      179 : 	} else {
	;***      180 : 		g_uart2_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 180
	oneb !LOWW(_g_uart2_fault)
.BB@LABEL@2_85:	; if_break_bb198
	;***      181 : 	}
	;***      182 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 182
	inc !LOWW(_g_uart2_receive)
	ret
_isCommandNeedResponse:
	.STACK _isCommandNeedResponse = 4
	;***      183 : 
	;***      184 : }
	;***      185 : uint8_t isCommandNeedResponse(uint8_t *data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 185
	movw de, ax
	;***      186 : 	if ((data[0] == H_SET) && (data[1] == NEXT_ANIMATION)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 186
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
	;***      187 : 		return 0;
	;***      188 : 	}
	;***      189 : 	switch ((enum UART_header_e) *data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 189
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 209
	ret
.BB@LABEL@3_7:	; bb30
	;***      190 : //		case H_ALARM:
	;***      191 : //			commnunication_flag.send_response_flag = 1;
	;***      192 : //			break;
	;***      193 : 	case H_CLEAR:
	;***      194 : 		g_commnunication_flag.send_response_flag = 1;
	;***      195 : 		break;
	;***      196 : 	case H_ERROR:
	;***      197 : 		g_commnunication_flag.send_response_flag = 1;
	;***      198 : 		break;
	;***      199 : 	case H_READ:
	;***      200 : 		g_commnunication_flag.send_response_flag = 1;
	;***      201 : 		break;
	;***      202 : 	case H_SET:
	;***      203 : 		g_commnunication_flag.send_response_flag = 1;
	;***      204 : 		break;
	;***      205 : 	default:
	;***      206 : 		return 0;
	;***      207 : 	}
	;***      208 : 	return 1;
	;***      209 : }
	clrb a
	ret
	.SECTION .bss,BSS
	.ALIGN 2
_g_adc_value:
	.DS (4)
