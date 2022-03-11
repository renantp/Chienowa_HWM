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
#@  compiled at Wed Mar 09 14:07:19 2022

	.EXTERN _g_test_control
	.EXTERN _g_io_status
	.EXTERN _g_machine_state
	.EXTERN _g_commnunication_flag
	.EXTERN _g_machine_mode
	.EXTERN _g_uart2_fault
	.EXTERN _g_uart2_receive
	.EXTERN _g_rx_data
	.PUBLIC _g_adc_value
	.PUBLIC _adc_int_handle
	.EXTERN _R_ADC_Get_Result
	.EXTERN _R_ADC_Start
	.PUBLIC _uart2_handle
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
	;***       38 : 	R_ADC_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 38
	br !!_R_ADC_Start
_uart2_handle:
	.STACK _uart2_handle = 4
	;***       39 : }
	;***       40 : /*!
	;***       41 :  * Use in uart2 interrupt function
	;***       42 :  */
	;***       43 : void uart2_handle(void){
	;***       44 : 	R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 44
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	;***       45 : 	g_commnunication_flag.recived_time_setting_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 45
	cmp !LOWW(_g_commnunication_flag+0x00004), #0x01
	mov a, #0x02
	skz
.BB@LABEL@2_1:	; bb5
	mov a, !LOWW(_g_commnunication_flag+0x00004)
.BB@LABEL@2_2:	; bb8
	mov !LOWW(_g_commnunication_flag+0x00004), a
	;***       46 : 			g_commnunication_flag.recived_time_setting_flag == 1 ?
	;***       47 : 					2 : g_commnunication_flag.recived_time_setting_flag;
	;***       48 : 	g_commnunication_flag.recived_number_setting_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 48
	cmp !LOWW(_g_commnunication_flag+0x00003), #0x01
	mov a, #0x02
	skz
.BB@LABEL@2_3:	; bb16
	mov a, !LOWW(_g_commnunication_flag+0x00003)
.BB@LABEL@2_4:	; bb20
	mov !LOWW(_g_commnunication_flag+0x00003), a
	;***       49 : 			g_commnunication_flag.recived_number_setting_flag == 1 ?
	;***       50 : 					2 : g_commnunication_flag.recived_number_setting_flag;
	;***       51 : 	g_commnunication_flag.recieve_status_flag =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 51
	cmp !LOWW(_g_commnunication_flag+0x00008), #0x01
	mov a, #0x02
	skz
.BB@LABEL@2_5:	; bb29
	mov a, !LOWW(_g_commnunication_flag+0x00008)
.BB@LABEL@2_6:	; bb33
	mov !LOWW(_g_commnunication_flag+0x00008), a
	;***       52 : 			g_commnunication_flag.recieve_status_flag == 1 ?
	;***       53 : 					2 : g_commnunication_flag.recieve_status_flag;
	;***       54 : 	if (isCommandNeedResponse(g_rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 54
	movw ax, #LOWW(_g_rx_data)
	call $!_isCommandNeedResponse
	cmp0 a
	.bz $!.BB@LABEL@2_75
.BB@LABEL@2_7:	; bb41
	cmp0 !LOWW(_g_commnunication_flag+0x00004)
	bnz $.BB@LABEL@2_10
.BB@LABEL@2_8:	; bb53
	cmp0 !LOWW(_g_commnunication_flag+0x00003)
	sknz
.BB@LABEL@2_9:	; bb65
	cmp0 !LOWW(_g_commnunication_flag+0x00008)
.BB@LABEL@2_10:	; bb65
	.bnz $!.BB@LABEL@2_75
.BB@LABEL@2_11:	; if_then_bb
	;***       55 : 			&& g_commnunication_flag.recived_time_setting_flag == 0
	;***       56 : 			&& g_commnunication_flag.recived_number_setting_flag == 0
	;***       57 : 			&& g_commnunication_flag.recieve_status_flag == 0) {
	;***       58 : 
	;***       59 : 		if(g_rx_data[0] == H_READ){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 59
	mov a, !LOWW(_g_rx_data)
	cmp a, #0x52
	bnz $.BB@LABEL@2_33
.BB@LABEL@2_12:	; if_then_bb83
	;***       60 : 			switch (g_rx_data[1]) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 60
	mov a, !LOWW(_g_rx_data+0x00001)
	add a, #0xFE
	bz $.BB@LABEL@2_23
.BB@LABEL@2_13:	; if_then_bb83
	dec a
	bz $.BB@LABEL@2_25
.BB@LABEL@2_14:	; if_then_bb83
	add a, #0xEC
	bz $.BB@LABEL@2_24
.BB@LABEL@2_15:	; if_then_bb83
	dec a
	bz $.BB@LABEL@2_26
.BB@LABEL@2_16:	; if_then_bb83
	add a, #0xFB
	bz $.BB@LABEL@2_27
.BB@LABEL@2_17:	; if_then_bb83
	add a, #0xF6
	bz $.BB@LABEL@2_28
.BB@LABEL@2_18:	; if_then_bb83
	dec a
	bz $.BB@LABEL@2_31
.BB@LABEL@2_19:	; if_then_bb83
	dec a
	bz $.BB@LABEL@2_29
.BB@LABEL@2_20:	; if_then_bb83
	dec a
	bz $.BB@LABEL@2_30
.BB@LABEL@2_21:	; if_then_bb83
	cmp a, #0x02
	bnz $.BB@LABEL@2_32
.BB@LABEL@2_22:	; switch_clause_bb95
	;***       61 : 				case READ_TIME:
	;***       62 : 					g_commnunication_flag.send_response_time_flag = 1;
	;***       63 : 					break;
	;***       64 : 				case MACHINE_IO_DATA:
	;***       65 : 					g_commnunication_flag.send_response_status_flag = 1;
	;***       66 : 					break;
	;***       67 : 				case READ_NUMBER:
	;***       68 : 					g_commnunication_flag.send_response_number_flag = 1;
	;***       69 : 					break;
	;***       70 : 				case WASHING_MODE:
	;***       71 : 					g_commnunication_flag.send_response_mode_flag = 1;
	;***       72 : 					break;
	;***       73 : 				case MID_NIGHT:
	;***       74 : 					g_machine_state.isMidNight = g_rx_data[5];
	;***       75 : 					break;
	;***       76 : 				case DRAINAGE_MODE_SET:
	;***       77 : 					g_commnunication_flag.control_test_flag = DRAINAGE_MODE_SET;
	;***       78 : 					break;
	;***       79 : 				case POWER_ON_TEST_SET:
	;***       80 : 					g_commnunication_flag.control_test_flag = POWER_ON_TEST_SET;
	;***       81 : 					break;
	;***       82 : 				case WATER_FILTER_SET:
	;***       83 : 					g_commnunication_flag.control_test_flag = WATER_FILTER_SET;
	;***       84 : 					break;
	;***       85 : 				case BIOMECTRIC_SET:
	;***       86 : 					g_commnunication_flag.control_test_flag = BIOMECTRIC_SET;
	;***       87 : 					break;
	;***       88 : 				case CONTROL_SETTING:
	;***       89 : 					g_commnunication_flag.control_test_flag = CONTROL_SETTING;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 89
	mov !LOWW(_g_commnunication_flag+0x0000F), #0x2C
	br $.BB@LABEL@2_32
.BB@LABEL@2_23:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 62
	oneb !LOWW(_g_commnunication_flag+0x00001)
	br $.BB@LABEL@2_32
.BB@LABEL@2_24:	; switch_clause_bb86
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 65
	oneb !LOWW(_g_commnunication_flag+0x00005)
	br $.BB@LABEL@2_32
.BB@LABEL@2_25:	; switch_clause_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 68
	oneb !LOWW(_g_commnunication_flag+0x00002)
	br $.BB@LABEL@2_32
.BB@LABEL@2_26:	; switch_clause_bb88
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 71
	oneb !LOWW(_g_commnunication_flag+0x00006)
	br $.BB@LABEL@2_32
.BB@LABEL@2_27:	; switch_clause_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 74
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_state+0x0000A), a
	br $.BB@LABEL@2_32
.BB@LABEL@2_28:	; switch_clause_bb91
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 77
	mov !LOWW(_g_commnunication_flag+0x0000F), #0x27
	br $.BB@LABEL@2_32
.BB@LABEL@2_29:	; switch_clause_bb92
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 80
	mov !LOWW(_g_commnunication_flag+0x0000F), #0x29
	br $.BB@LABEL@2_32
.BB@LABEL@2_30:	; switch_clause_bb93
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 83
	mov !LOWW(_g_commnunication_flag+0x0000F), #0x2A
	br $.BB@LABEL@2_51
.BB@LABEL@2_31:	; switch_clause_bb94
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 86
	mov !LOWW(_g_commnunication_flag+0x0000F), #0x28
.BB@LABEL@2_32:	; switch_clause_bb94
	br $.BB@LABEL@2_51
.BB@LABEL@2_33:	; if_else_bb
	;***       90 : 					break;
	;***       91 : 				default:
	;***       92 : 					break;
	;***       93 : 			}
	;***       94 : 		}else if(g_rx_data[0] == H_SET){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 94
	cmp a, #0x53
	.bnz $!.BB@LABEL@2_72
.BB@LABEL@2_34:	; if_then_bb102
	;***       95 : 			switch (g_rx_data[1]) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 95
	mov a, !LOWW(_g_rx_data+0x00001)
	dec a
	.bz $!.BB@LABEL@2_62
.BB@LABEL@2_35:	; if_then_bb102
	add a, #0xED
	bz $.BB@LABEL@2_52
.BB@LABEL@2_36:	; if_then_bb102
	dec a
	bz $.BB@LABEL@2_53
.BB@LABEL@2_37:	; if_then_bb102
	add a, #0xFD
	.bz $!.BB@LABEL@2_61
.BB@LABEL@2_38:	; if_then_bb102
	add a, #0xFE
	bz $.BB@LABEL@2_54
.BB@LABEL@2_39:	; if_then_bb102
	add a, #0xFE
	bz $.BB@LABEL@2_55
.BB@LABEL@2_40:	; if_then_bb102
	add a, #0xFE
	bz $.BB@LABEL@2_56
.BB@LABEL@2_41:	; if_then_bb102
	dec a
	bz $.BB@LABEL@2_57
.BB@LABEL@2_42:	; if_then_bb102
	dec a
	bz $.BB@LABEL@2_58
.BB@LABEL@2_43:	; if_then_bb102
	dec a
	bz $.BB@LABEL@2_59
.BB@LABEL@2_44:	; if_then_bb102
	dec a
	bz $.BB@LABEL@2_60
.BB@LABEL@2_45:	; if_then_bb102
	add a, #0xFB
	bz $.BB@LABEL@2_64
.BB@LABEL@2_46:	; if_then_bb102
	dec a
	.bz $!.BB@LABEL@2_70
.BB@LABEL@2_47:	; if_then_bb102
	dec a
	.bz $!.BB@LABEL@2_66
.BB@LABEL@2_48:	; if_then_bb102
	dec a
	.bz $!.BB@LABEL@2_68
.BB@LABEL@2_49:	; if_then_bb102
	dec a
	bnz $.BB@LABEL@2_63
.BB@LABEL@2_50:	; switch_clause_bb152
	;***       96 : 				case SAVE_TIME:
	;***       97 : 					R_UART2_Receive(g_rx_data, timeSettingSize);
	;***       98 : 					g_commnunication_flag.recived_time_setting_flag = 1;
	;***       99 : 					break;
	;***      100 : 				case SAVE_NUMBER:
	;***      101 : 					R_UART2_Receive(g_rx_data, numberSettingSize);
	;***      102 : 					g_commnunication_flag.recived_number_setting_flag = 1;
	;***      103 : 					break;
	;***      104 : 				case NEXT_ANIMATION:
	;***      105 : 
	;***      106 : 					break;
	;***      107 : 				case TESTING_MODE_START:
	;***      108 : 					g_commnunication_flag.test_flag = TESTING_MODE_START;
	;***      109 : 					break;
	;***      110 : 				case TESTING_MODE_STOP:
	;***      111 : 					g_commnunication_flag.test_flag = TESTING_MODE_STOP;
	;***      112 : 					break;
	;***      113 : 				case TEST_POWER_ON:
	;***      114 : 					g_commnunication_flag.test_flag = TEST_POWER_ON;
	;***      115 : 					break;
	;***      116 : 				case TEST_FLOW_RATE:
	;***      117 : 					g_commnunication_flag.test_flag = TEST_FLOW_RATE;
	;***      118 : 					break;
	;***      119 : 				case TEST_CURRENT:
	;***      120 : 					g_commnunication_flag.test_flag = TEST_CURRENT;
	;***      121 : 					break;
	;***      122 : 				case TEST_INDIVIDUAL:
	;***      123 : 					g_commnunication_flag.test_flag = TEST_INDIVIDUAL;
	;***      124 : 					g_commnunication_flag.recieve_status_flag = 1;
	;***      125 : 					R_UART2_Receive(g_rx_data, 4);
	;***      126 : 					break;
	;***      127 : 				case TEST_ELECTROLYTIC:
	;***      128 : 					g_commnunication_flag.test_flag = TEST_ELECTROLYTIC;
	;***      129 : 					break;
	;***      130 : 				case WASHING_MODE:
	;***      131 : 					g_machine_mode = g_rx_data[5];
	;***      132 : 					break;
	;***      133 : 				case OK_USER:
	;***      134 : 					g_machine_state.user = 2;
	;***      135 : 					break;
	;***      136 : 				case DRAINAGE_MODE_SET:
	;***      137 : 					g_commnunication_flag.control_test_save_flag = 1;
	;***      138 : 					g_test_control.raw.drain = g_rx_data[5];
	;***      139 : 					break;
	;***      140 : 				case POWER_ON_TEST_SET:
	;***      141 : 					g_commnunication_flag.control_test_save_flag = 1;
	;***      142 : 					g_test_control.raw.power_on = g_rx_data[5];
	;***      143 : 					break;
	;***      144 : 				case WATER_FILTER_SET:
	;***      145 : 					g_commnunication_flag.control_test_save_flag = 1;
	;***      146 : 					g_test_control.raw.filter = g_rx_data[5];
	;***      147 : 					break;
	;***      148 : 				case BIOMECTRIC_SET:
	;***      149 : 					g_commnunication_flag.control_test_save_flag = 1;
	;***      150 : 					g_test_control.raw.biomectric = g_rx_data[5];
	;***      151 : 					break;
	;***      152 : 				case START_WASHING:
	;***      153 : 					g_commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 153
	clrb !LOWW(_g_commnunication_flag)
.BB@LABEL@2_51:	; switch_clause_bb152
	br $.BB@LABEL@2_65
.BB@LABEL@2_52:	; switch_clause_bb105
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 97
	movw bc, #0x0095
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 98
	oneb !LOWW(_g_commnunication_flag+0x00004)
	br $.BB@LABEL@2_67
.BB@LABEL@2_53:	; switch_clause_bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 101
	movw bc, #0x0029
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 102
	oneb !LOWW(_g_commnunication_flag+0x00003)
	br $.BB@LABEL@2_69
.BB@LABEL@2_54:	; switch_clause_bb114
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 108
	mov !LOWW(_g_commnunication_flag+0x00009), #0x1A
	br $.BB@LABEL@2_69
.BB@LABEL@2_55:	; switch_clause_bb115
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 111
	mov !LOWW(_g_commnunication_flag+0x00009), #0x1C
	br $.BB@LABEL@2_71
.BB@LABEL@2_56:	; switch_clause_bb116
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 114
	mov !LOWW(_g_commnunication_flag+0x00009), #0x1E
	br $.BB@LABEL@2_71
.BB@LABEL@2_57:	; switch_clause_bb117
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 117
	mov !LOWW(_g_commnunication_flag+0x00009), #0x1F
	br $.BB@LABEL@2_74
.BB@LABEL@2_58:	; switch_clause_bb118
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 120
	mov !LOWW(_g_commnunication_flag+0x00009), #0x20
	br $.BB@LABEL@2_74
.BB@LABEL@2_59:	; switch_clause_bb119
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 123
	mov !LOWW(_g_commnunication_flag+0x00009), #0x21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 124
	oneb !LOWW(_g_commnunication_flag+0x00008)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 125
	movw bc, #0x0004
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Receive
	br $.BB@LABEL@2_78
.BB@LABEL@2_60:	; switch_clause_bb121
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 128
	mov !LOWW(_g_commnunication_flag+0x00009), #0x22
	br $.BB@LABEL@2_78
.BB@LABEL@2_61:	; switch_clause_bb122
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 131
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_mode), a
	br $.BB@LABEL@2_78
.BB@LABEL@2_62:	; switch_clause_bb124
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 134
	mov !LOWW(_g_machine_state+0x0000D), #0x02
.BB@LABEL@2_63:	; switch_clause_bb124
	br $.BB@LABEL@2_78
.BB@LABEL@2_64:	; switch_clause_bb125
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 138
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 137
	oneb !LOWW(_g_commnunication_flag+0x00010)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 138
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_test_control)
	mov1 [hl].0, CY
.BB@LABEL@2_65:	; switch_clause_bb125
	br $.BB@LABEL@2_78
.BB@LABEL@2_66:	; switch_clause_bb131
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 142
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 141
	oneb !LOWW(_g_commnunication_flag+0x00010)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 142
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_test_control)
	mov1 [hl].1, CY
.BB@LABEL@2_67:	; switch_clause_bb131
	br $.BB@LABEL@2_78
.BB@LABEL@2_68:	; switch_clause_bb138
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 146
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 145
	oneb !LOWW(_g_commnunication_flag+0x00010)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 146
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_test_control)
	mov1 [hl].2, CY
.BB@LABEL@2_69:	; switch_clause_bb138
	br $.BB@LABEL@2_78
.BB@LABEL@2_70:	; switch_clause_bb145
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 150
	movw hl, #LOWW(_g_rx_data+0x00005)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 149
	oneb !LOWW(_g_commnunication_flag+0x00010)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 150
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_test_control)
	mov1 [hl].3, CY
.BB@LABEL@2_71:	; switch_clause_bb145
	br $.BB@LABEL@2_78
.BB@LABEL@2_72:	; if_else_bb155
	;***      154 : 					break;
	;***      155 : 				default:
	;***      156 : 					break;
	;***      157 : 			}
	;***      158 : 		}else if ((g_rx_data[0] == H_CLEAR)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 158
	cmp a, #0x43
	bnz $.BB@LABEL@2_78
.BB@LABEL@2_73:	; if_then_bb161
	;***      159 : 			g_commnunication_flag.alarm_clear_flag = g_rx_data[1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 159
	mov a, !LOWW(_g_rx_data+0x00001)
	mov !LOWW(_g_commnunication_flag+0x00007), a
.BB@LABEL@2_74:	; if_then_bb161
	br $.BB@LABEL@2_78
.BB@LABEL@2_75:	; if_else_bb165
	;***      160 : 		}
	;***      161 : 	} else if (g_commnunication_flag.recived_time_setting_flag != 0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 161
	cmp0 !LOWW(_g_commnunication_flag+0x00004)
	bnz $.BB@LABEL@2_78
.BB@LABEL@2_76:	; bb170
	cmp0 !LOWW(_g_commnunication_flag+0x00003)
	sknz
.BB@LABEL@2_77:	; if_else_bb184
	;***      162 : 			|| g_commnunication_flag.recived_number_setting_flag != 0) {
	;***      163 : //		R_UART2_Receive(g_rx_data, 6);
	;***      164 : 	} else {
	;***      165 : 		g_uart2_fault = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 165
	oneb !LOWW(_g_uart2_fault)
.BB@LABEL@2_78:	; if_break_bb186
	;***      166 : 	}
	;***      167 : 	g_uart2_receive++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 167
	inc !LOWW(_g_uart2_receive)
	ret
_isCommandNeedResponse:
	.STACK _isCommandNeedResponse = 4
	;***      168 : }
	;***      169 : uint8_t isCommandNeedResponse(uint8_t *data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 169
	movw de, ax
	;***      170 : 	if ((data[0] == H_SET) && (data[1] == NEXT_ANIMATION)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 170
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
	;***      171 : 		return 0;
	;***      172 : 	}
	;***      173 : 	switch ((enum UART_header_e) *data) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 173
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/interrupt_handle.c", 193
	ret
.BB@LABEL@3_7:	; bb30
	;***      174 : //		case H_ALARM:
	;***      175 : //			commnunication_flag.send_response_flag = 1;
	;***      176 : //			break;
	;***      177 : 	case H_CLEAR:
	;***      178 : 		g_commnunication_flag.send_response_flag = 1;
	;***      179 : 		break;
	;***      180 : 	case H_ERROR:
	;***      181 : 		g_commnunication_flag.send_response_flag = 1;
	;***      182 : 		break;
	;***      183 : 	case H_READ:
	;***      184 : 		g_commnunication_flag.send_response_flag = 1;
	;***      185 : 		break;
	;***      186 : 	case H_SET:
	;***      187 : 		g_commnunication_flag.send_response_flag = 1;
	;***      188 : 		break;
	;***      189 : 	default:
	;***      190 : 		return 0;
	;***      191 : 	}
	;***      192 : 	return 1;
	;***      193 : }
	clrb a
	ret
	.SECTION .bss,BSS
	.ALIGN 2
_g_adc_value:
	.DS (4)
