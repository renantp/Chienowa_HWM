#CC-RL Compiler RL78 Assembler Source
#@  CC-RL Version : V1.10.00 [20 Nov 2020]
#@  Commmand :
#@   -cpu=S3
#@   -c
#@   -dev=D:/Chieniwa/E2_Studio/.eclipse/com.renesas.platform_1435879475/DebugComp/RL78/RL78/Common/DR5F104ML.DVF
#@   -MAKEUD=D:\Chieniwa\E2_Studio\ControlPCB_HWM\HardwareDebug\src\hwm
#@   -I C:\Program Files (x86)\Renesas Electronics\CS+\CC\CC-RL\V1.10.00\inc
#@   -I D:\Chieniwa\E2_Studio\ControlPCB_HWM\generate
#@   -character_set=utf8
#@   -lang=c99
#@   -g
#@   -asmopt=-prn_path=src/hwm
#@   -asm_path=src/hwm/
#@   -pass_source
#@   -o src/hwm/raspberry_pi_interface.obj
#@   ../src/hwm/raspberry_pi_interface.c
#@  compiled at Wed Apr 06 08:39:11 2022

	.EXTERN _rx_count
	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_io_status
	.EXTERN _g_machine_state
	.EXTERN _g_control_buffer_f
	.EXTERN _g_control_buffer_u32
	.EXTERN _g_commnunication_flag
	.EXTERN _g_machine_mode
	.EXTERN _g_systemTime
	.EXTERN _g_uart2_sendend
	.EXTERN _g_rx_data
	.EXTERN __settingTime
	.EXTERN __settingNumber
	.PUBLIC _time_setting_p
	.PUBLIC _number_setting_p
	.PUBLIC _test_control_buf
	.PUBLIC _g_io_response
	.PUBLIC _io_off
	.PUBLIC _g_test_control
	.PUBLIC _IO_Output
	.PUBLIC _RaspberryCommunication_nostop
	.PUBLIC _sendToRasPi_f
	.EXTERN _crc8_1
	.EXTERN _R_UART2_Send
	.EXTERN _R_WDT_Restart
	.EXTERN _EE_SPI_Write
	.EXTERN _R_DAC0_Set_ConversionValue
	.EXTERN _R_DAC1_Set_ConversionValue
	.PUBLIC _sendToRasPi_u32
	.PUBLIC _waitAlarmConfirm_stop
	.EXTERN _realTimeResponse
	.EXTERN _ns_delay_ms
	.PUBLIC _waitAlarmConfirm_nonstop
	.PUBLIC _resetAlarm
	.PUBLIC _ResponseHandler
	.PUBLIC _ResponseWashingMode
	.PUBLIC _MonitoringStatus
	.PUBLIC _TestIndividual
	.PUBLIC _TestControl

	.SECTION .textf,TEXTF
_IO_Output:
	.STACK _IO_Output = 4
	;***        1 : /*
	;***        2 :  * raspberry_pi_interface.c
	;***        3 :  *
	;***        4 :  *  Created on: 6 Jan 2022
	;***        5 :  *      Author: Renan
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "rasberry_pi_interface.h"
	;***        9 : 
	;***       10 : /**
	;***       11 :  * Handle all response to Raspberry command.
	;***       12 :  */
	;***       13 : uint8_t *const time_setting_p = (uint8_t*) &_settingTime;
	;***       14 : uint8_t *const number_setting_p = (uint8_t*) &_settingNumber;
	;***       15 : struct UART_Buffer_float_s test_control_buf = { H_READ, READ_TIME, 0x000000ff };
	;***       16 : struct IO_Struct g_io_response, io_off;
	;***       17 : union Control_u g_test_control;
	;***       18 : 
	;***       19 : // ------------------ LOCAL FUNCTION -------------------------------
	;***       20 : inline void ResponseHandler(void);
	;***       21 : inline void ResponseWashingMode(void);
	;***       22 : inline void MonitoringStatus(void);
	;***       23 : inline void TestIndividual(void);
	;***       24 : inline void TestControl(void);
	;***       25 : 
	;***       26 : void IO_Output(struct IO_Struct *io) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 26
	movw de, ax
	movw hl, #0xFF06
	;***       27 : 	O_SUPPLY_WATER_PIN_SV1 = io->Valve.SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 27
	mov a, [de+0x01]
	mov1 CY, a.0
	mov a, 0xFFF01
	mov1 a.7, CY
	mov 0xFFF01, a
	;***       28 : 	O_SPOUT_WATER_PIN_SV2 = io->Valve.SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 28
	mov a, [de+0x01]
	mov1 CY, a.1
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	;***       29 : 	O_SPOUT_ACID_PIN_SV3 = io->Valve.SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 29
	mov a, [de+0x01]
	mov1 CY, a.2
	mov a, 0xFFF07
	mov1 a.6, CY
	mov 0xFFF07, a
	;***       30 : 	O_SPOUT_ALK_PIN_SV4 = io->Valve.SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 30
	mov a, [de+0x01]
	mov1 CY, a.3
	mov a, 0xFFF07
	mov1 a.7, CY
	mov 0xFFF07, a
	;***       31 : 	O_DRAIN_ACID_PIN_SV5 = io->Valve.SV5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 31
	mov a, [de+0x01]
	mov1 CY, a.4
	mov a, [hl]
	mov1 a.7, CY
	mov [hl], a
	;***       32 : 	O_DRAIN_ALK_PIN_SV6 = io->Valve.SV6;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 32
	mov a, [de+0x01]
	mov1 CY, a.5
	mov a, [hl]
	mov1 a.6, CY
	mov [hl], a
	;***       33 : 	O_NEUTRALIZE_PIN_SV7 = io->Valve.SV7;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 33
	mov a, [de+0x01]
	mov1 CY, a.6
	mov a, [hl]
	mov1 a.5, CY
	mov [hl], a
	;***       34 : 	O_OPTION_2_PIN_SV8 = io->Valve.SV8;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 34
	mov a, [de+0x01]
	mov1 CY, a.7
	mov a, 0xFFF0B
	mov1 a.1, CY
	mov 0xFFF0B, a
	;***       35 : 	O_OPTION_3_PIN_SV9 = io->Valve.SV9;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 35
	mov a, [de+0x02]
	mov1 CY, a.0
	mov a, 0xFFF0E
	mov1 a.6, CY
	mov 0xFFF0E, a
	;***       36 : 
	;***       37 : 	O_ACID_PUMP_PIN_P1 = io->Pump1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 37
	mov a, [de+0x03]
	mov1 CY, a.0
	mov a, [hl]
	mov1 a.2, CY
	mov [hl], a
	;***       38 : 	O_ALK_PUMP_PIN_P2 = io->Pump2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 38
	mov a, [de+0x03]
	mov1 CY, a.1
	mov a, [hl]
	mov1 a.1, CY
	mov [hl], a
	;***       39 : 	O_PUMP_SALT_PIN_SP1 = io->SaltPump;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 39
	mov a, [de+0x03]
	mov1 CY, a.2
	mov a, [hl]
	mov1 a.0, CY
	mov [hl], a
	;***       40 : 	O_CVCC_ON_PIN = io->CVCC_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 40
	mov a, [de+0x03]
	mov1 CY, a.3
	mov a, 0xFFF0E
	mov1 a.2, CY
	mov 0xFFF0E, a
	ret
_RaspberryCommunication_nostop:
	.STACK _RaspberryCommunication_nostop = 14
	;***       41 : }
	;***       42 : 
	;***       43 : //------------------- EXTERNAL FUNCTION ----------------------------------
	;***       44 : void RaspberryCommunication_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 44
	subw sp, #0x06
	;***       45 : 
	;***       46 : 	ResponseHandler();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 46
	call $!_ResponseHandler
	;***       47 : 	ResponseWashingMode();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 47
	call $!_ResponseWashingMode
	;***       48 : 	MonitoringStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 48
	call $!_MonitoringStatus
	;***       49 : 	TestIndividual();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 49
	call $!_TestIndividual
	;***       50 : 	TestControl();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 50
	call $!_TestControl
	;***       51 : 	if (g_commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 51
	cmp0 !LOWW(_g_commnunication_flag+0x00001)
	bz $.BB@LABEL@2_5
.BB@LABEL@2_1:	; if_then_bb
	;***       52 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 52
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***       53 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 53
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00094), a
	;***       54 : 				timeSettingSize - 1);
	;***       55 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 55
	movw bc, #0x0095
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@2_2:	; bb19
	mov a, [sp+0x00]
	;***       56 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 56
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@2_4
.BB@LABEL@2_3:	; bb
	;***       57 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 57
	call !!_R_WDT_Restart
	br $.BB@LABEL@2_2
.BB@LABEL@2_4:	; bb27
	;***       58 : 		}
	;***       59 : 		g_commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 59
	clrb !LOWW(_g_commnunication_flag+0x00001)
.BB@LABEL@2_5:	; if_break_bb
	;***       60 : 	}
	;***       61 : 	if (g_commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 61
	cmp0 !LOWW(_g_commnunication_flag+0x00002)
	bz $.BB@LABEL@2_10
.BB@LABEL@2_6:	; if_then_bb33
	;***       62 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 62
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***       63 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 63
	mov c, #0x28
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00028), a
	;***       64 : 				numberSettingSize - 1);
	;***       65 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 65
	movw bc, #0x0029
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@2_7:	; bb44
	mov a, [sp+0x00]
	;***       66 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 66
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@2_9
.BB@LABEL@2_8:	; bb43
	;***       67 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 67
	call !!_R_WDT_Restart
	br $.BB@LABEL@2_7
.BB@LABEL@2_9:	; bb52
	;***       68 : 		}
	;***       69 : 		g_commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 69
	clrb !LOWW(_g_commnunication_flag+0x00002)
.BB@LABEL@2_10:	; if_break_bb53
	;***       70 : 	}
	;***       71 : 	if (g_commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 71
	cmp !LOWW(_g_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@2_26
.BB@LABEL@2_11:	; if_break_bb53.bb110_crit_edge
	clrb a
	mov b, a
.BB@LABEL@2_12:	; bb110
	;***       72 : //		//Do not Edit this, must keep!!!!
	;***       73 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 73
	cmp a, #0x94
	bnc $.BB@LABEL@2_22
.BB@LABEL@2_13:	; bb60
	;***       74 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 74
	and a, #0x03
	bz $.BB@LABEL@2_20
.BB@LABEL@2_14:	; bb60
	dec a
	bz $.BB@LABEL@2_19
.BB@LABEL@2_15:	; bb60
	dec a
	mov a, b
	bz $.BB@LABEL@2_18
.BB@LABEL@2_16:	; switch_clause_bb
	;***       75 : //			case 3:
	;***       76 : //				pointer0[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
	;***       77 : //				break;
	;***       78 : //			case 2:
	;***       79 : //				pointer0[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
	;***       80 : //				break;
	;***       81 : //			case 1:
	;***       82 : //				pointer0[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
	;***       83 : //				break;
	;***       84 : //			case 0:
	;***       85 : //				pointer0[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
	;***       86 : //				break;
	;***       87 : //			default:
	;***       88 : //				break;
	;***       89 : 			case 3:
	;***       90 : 				time_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 90
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFD)
.BB@LABEL@2_17:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@2_21
.BB@LABEL@2_18:	; switch_clause_bb74
	;***       91 : 				break;
	;***       92 : 			case 2:
	;***       93 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 93
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@2_17
.BB@LABEL@2_19:	; switch_clause_bb85
	;***       94 : 				break;
	;***       95 : 			case 1:
	;***       96 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 96
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@2_21
.BB@LABEL@2_20:	; switch_clause_bb96
	;***       97 : 				break;
	;***       98 : 			case 0:
	;***       99 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 99
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@2_21:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@2_12
.BB@LABEL@2_22:	; bb119
	;***      100 : 				break;
	;***      101 : 			default:
	;***      102 : 				break;
	;***      103 : 			}
	;***      104 : 		}
	;***      105 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 105
	mov a, !LOWW(_g_rx_data+0x00094)
	mov [sp+0x00], a
	mov !LOWW(__settingTime+0x00094), a
	;***      106 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 106
	mov c, #0x94
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp x, a
	bnz $.BB@LABEL@2_24
.BB@LABEL@2_23:	; if_then_bb142
	;***      107 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
	;***      108 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 108
	movw de, #0x0096
	movw bc, #LOWW(__settingTime)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	clrw ax
	;***      109 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 109
	push ax
	mov x, #0x95
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      110 : 					timeSettingSize);
	;***      111 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 111
	clrb x
	br $.BB@LABEL@2_25
.BB@LABEL@2_24:	; if_else_bb
	;***      112 : 		} else {
	;***      113 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 113
	mov x, #0x16
.BB@LABEL@2_25:	; if_else_bb
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi_f
	;***      114 : 		}
	;***      115 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      116 : 		g_commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 116
	clrb !LOWW(_g_commnunication_flag+0x00004)
.BB@LABEL@2_26:	; if_break_bb146
	;***      117 : 	}
	;***      118 : 
	;***      119 : 	if (g_commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 119
	cmp !LOWW(_g_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@2_50
.BB@LABEL@2_27:	; if_break_bb146.bb205_crit_edge
	clrb a
	mov b, a
.BB@LABEL@2_28:	; bb205
	;***      120 : //		//Do not Edit this, must keep!!!!
	;***      121 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 121
	cmp a, #0x28
	bnc $.BB@LABEL@2_38
.BB@LABEL@2_29:	; bb153
	;***      122 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 122
	and a, #0x03
	bz $.BB@LABEL@2_36
.BB@LABEL@2_30:	; bb153
	dec a
	bz $.BB@LABEL@2_35
.BB@LABEL@2_31:	; bb153
	dec a
	mov a, b
	bz $.BB@LABEL@2_34
.BB@LABEL@2_32:	; switch_clause_bb157
	;***      123 : 			case 3:
	;***      124 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 124
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@2_33:	; switch_clause_bb157
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@2_37
.BB@LABEL@2_34:	; switch_clause_bb168
	;***      125 : 				break;
	;***      126 : 			case 2:
	;***      127 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 127
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@2_33
.BB@LABEL@2_35:	; switch_clause_bb179
	;***      128 : 				break;
	;***      129 : 			case 1:
	;***      130 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 130
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@2_37
.BB@LABEL@2_36:	; switch_clause_bb190
	;***      131 : 				break;
	;***      132 : 			case 0:
	;***      133 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 133
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@2_37:	; switch_break_bb202
	inc b
	mov a, b
	br $.BB@LABEL@2_28
.BB@LABEL@2_38:	; bb214
	;***      134 : 				break;
	;***      135 : 			default:
	;***      136 : 				break;
	;***      137 : 			}
	;***      138 : 		}
	;***      139 : 		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 139
	mov c, #0x28
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov !LOWW(__settingNumber+0x00028), a
	;***      140 : 				numberSettingSize - 1);
	;***      141 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 141
	mov a, !LOWW(_g_rx_data+0x00028)
	mov [sp+0x00], a
	mov c, #0x28
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	movw de, #0x0000
	clrw bc
	cmp a, x
	mov a, #0x53
	.bnz $!.BB@LABEL@2_48
.BB@LABEL@2_39:	; if_then_bb236
	;***      142 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      143 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 143
	clrb x
	call $!_sendToRasPi_f
	;***      144 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 144
	movw de, #0x002A
	movw bc, #LOWW(__settingNumber)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	clrw ax
	;***      145 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 145
	push ax
	mov x, #0x29
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      146 : 					numberSettingSize);
	;***      147 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 147
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call $!_sendToRasPi_f
	movw ax, #0x409B
	;***      148 : 			if(g_numberSetting.saltPumpVoltage > SALT_PUMP_MAX_VOLTAGE)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 148
	push ax
	movw ax, #0x020C
	push ax
	movw bc, !LOWW(_g_numberSetting+0x00026)
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_numberSetting+0x00024)
	movw [sp+0x08], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, #0x409B
	push ax
	movw ax, #0x020C
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
.BB@LABEL@2_40:	; if_then_bb236
	clrb a
.BB@LABEL@2_41:	; if_then_bb236
	cmp0 x
	oneb x
	sknz
.BB@LABEL@2_42:	; if_then_bb236
	clrb x
.BB@LABEL@2_43:	; if_then_bb236
	or x, a
	bnz $.BB@LABEL@2_45
.BB@LABEL@2_44:	; if_then_bb243
	movw ax, #0x409B
	;***      149 : 				g_numberSetting.saltPumpVoltage = SALT_PUMP_MAX_VOLTAGE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 149
	movw !LOWW(_g_numberSetting+0x00026), ax
	movw ax, #0x020C
	movw !LOWW(_g_numberSetting+0x00024), ax
.BB@LABEL@2_45:	; if_break_bb244
	movw ax, #0x40A0
	;***      150 : 			if(g_numberSetting.cvccCurrent > CVCC_MAX_VOLTAGE)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 150
	push ax
	clrw ax
	push ax
	movw bc, !LOWW(_g_numberSetting+0x00022)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_numberSetting+0x00020)
	movw [sp+0x06], ax
	call !!__COM_fgt
	addw sp, #0x04
	cmp0 a
	bz $.BB@LABEL@2_47
.BB@LABEL@2_46:	; if_then_bb249
	movw ax, #0x40A0
	;***      151 : 				g_numberSetting.cvccCurrent = CVCC_MAX_VOLTAGE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 151
	movw !LOWW(_g_numberSetting+0x00022), ax
	clrw ax
	movw !LOWW(_g_numberSetting+0x00020), ax
	movw [sp+0x02], ax
	movw ax, #0x40A0
	movw [sp+0x00], ax
.BB@LABEL@2_47:	; if_break_bb250
	movw ax, #0x40A0
	;***      152 : 			R_DAC0_Set_ConversionValue((uint8_t)(g_numberSetting.cvccCurrent/CVCC_MAX_VOLTAGE*255));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 152
	push ax
	clrw ax
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
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
	;***      153 : 			R_DAC1_Set_ConversionValue((uint8_t)(g_numberSetting.saltPumpVoltage/SALT_PUMP_MAX_VOLTAGE*255));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 153
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
	br $.BB@LABEL@2_49
.BB@LABEL@2_48:	; if_else_bb259
	;***      154 : 		} else {
	;***      155 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 155
	mov x, #0x16
	call $!_sendToRasPi_f
.BB@LABEL@2_49:	; if_break_bb260
	;***      156 : 		}
	;***      157 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      158 : 		g_commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 158
	clrb !LOWW(_g_commnunication_flag+0x00003)
.BB@LABEL@2_50:	; if_break_bb261
	;***      159 : 	}
	;***      160 : 	if (g_commnunication_flag.test_flag == TESTING_MODE_START) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 160
	cmp !LOWW(_g_commnunication_flag+0x00009), #0x1A
	bnz $.BB@LABEL@2_53
.BB@LABEL@2_51:	; if_then_bb267
	;***      161 : 		g_machine_state.test = g_commnunication_flag.test_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 161
	mov a, !LOWW(_g_commnunication_flag+0x00009)
	mov !LOWW(_g_machine_state+0x0000B), a
.BB@LABEL@2_52:	; return
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 166
	ret
.BB@LABEL@2_53:	; if_else_bb269
	;***      162 : 	} else if (g_commnunication_flag.test_flag == TESTING_MODE_STOP) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 162
	cmp !LOWW(_g_commnunication_flag+0x00009), #0x1C
	bnz $.BB@LABEL@2_52
.BB@LABEL@2_54:	; if_then_bb275
	;***      163 : 		g_machine_state.test = g_commnunication_flag.test_flag = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 163
	clrb !LOWW(_g_commnunication_flag+0x00009)
	mov a, !LOWW(_g_commnunication_flag+0x00009)
	mov !LOWW(_g_machine_state+0x0000B), a
	;***      164 : 		IO_Output(&io_off);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 164
	movw ax, #LOWW(_io_off)
	addw sp, #0x06
	br $!_IO_Output
_sendToRasPi_f:
	.STACK _sendToRasPi_f = 6
	;***      165 : 	}
	;***      166 : }
	;***      167 : void sendToRasPi_f(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 167
	push hl
	;***      168 : 		float value) {
	;***      169 : 	uint8_t state = g_uart2_sendend;
	;***      170 : 	g_control_buffer_f.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 170
	mov !LOWW(_g_control_buffer_f), a
	mov a, x
	;***      171 : 	g_control_buffer_f.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 171
	mov !LOWW(_g_control_buffer_f+0x00001), a
	movw ax, bc
	;***      172 : 	g_control_buffer_f.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 172
	movw !LOWW(_g_control_buffer_f+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_f+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 169
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      173 : 	R_UART2_Send((uint8_t*) &g_control_buffer_f, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 173
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_f)
	call !!_R_UART2_Send
.BB@LABEL@3_1:	; bb9
	mov a, [sp+0x00]
	;***      174 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 174
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@3_1
.BB@LABEL@3_2:	; return
	;***      175 : 		;
	;***      176 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 176
	pop hl
	ret
_sendToRasPi_u32:
	.STACK _sendToRasPi_u32 = 6
	;***      177 : void sendToRasPi_u32(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 177
	push hl
	;***      178 : 		uint32_t value) {
	;***      179 : 	uint8_t state = g_uart2_sendend;
	;***      180 : 	g_control_buffer_u32.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 180
	mov !LOWW(_g_control_buffer_u32), a
	mov a, x
	;***      181 : 	g_control_buffer_u32.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 181
	mov !LOWW(_g_control_buffer_u32+0x00001), a
	movw ax, bc
	;***      182 : 	g_control_buffer_u32.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 182
	movw !LOWW(_g_control_buffer_u32+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_u32+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 179
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      183 : 	R_UART2_Send((uint8_t*) &g_control_buffer_u32, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 183
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_u32)
	call !!_R_UART2_Send
.BB@LABEL@4_1:	; bb9
	mov a, [sp+0x00]
	;***      184 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 184
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@4_1
.BB@LABEL@4_2:	; return
	;***      185 : 		;
	;***      186 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 186
	pop hl
	ret
_waitAlarmConfirm_stop:
	.STACK _waitAlarmConfirm_stop = 12
	;***      187 : /**
	;***      188 :  * Wait for Raspberry Pi send {H_CLEAR, alarm, x}
	;***      189 :  * @param alarm
	;***      190 :  * @param timeout_s Timeout if timeout_s != 0
	;***      191 :  */
	;***      192 : void waitAlarmConfirm_stop(enum Control_status alarm, uint8_t timeout_s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 192
	subw sp, #0x04
	push ax
	;***      193 : 	uint32_t _tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 193
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@5_1:	; bb22
	mov a, [sp+0x01]
	;***      194 : 	while (g_commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 194
	cmp a, !LOWW(_g_commnunication_flag+0x00007)
	bz $.BB@LABEL@5_4
.BB@LABEL@5_2:	; bb
	;***      195 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 195
	call !!_realTimeResponse
	mov a, [sp+0x00]
	;***      196 : 		if ((ns_delay_ms(&_tick, (uint32_t) timeout_s * 1000))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 196
	shrw ax, 8+0x00000
	movw bc, #0x03E8
	mulhu
	push bc
	pop de
	movw bc, ax
	movw ax, sp
	incw ax
	incw ax
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@5_1
.BB@LABEL@5_3:	; bb
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@5_1
.BB@LABEL@5_4:	; bb31
	;***      197 : 				&& (timeout_s != 0)) {
	;***      198 : 			break;
	;***      199 : 		}
	;***      200 : 	}
	;***      201 : 	g_commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 201
	clrb !LOWW(_g_commnunication_flag+0x00007)
	addw sp, #0x06
	ret
_waitAlarmConfirm_nonstop:
	.STACK _waitAlarmConfirm_nonstop = 4
	;***      202 : }
	;***      203 : /**
	;***      204 :  *
	;***      205 :  * @param alarm
	;***      206 :  * @return 0 - Done; 1 - Still wait
	;***      207 :  */
	;***      208 : uint8_t waitAlarmConfirm_nonstop(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 208
	cmp a, !LOWW(_g_commnunication_flag+0x00007)
	;***      209 : 	if (g_commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 209
	bnz $.BB@LABEL@6_2
.BB@LABEL@6_1:	; if_break_bb
	;***      210 : 		return 1;
	;***      211 : 	}
	;***      212 : 	g_commnunication_flag.alarm_clear_flag = OK_ALL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 212
	clrb !LOWW(_g_commnunication_flag+0x00007)
	;***      213 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 213
	clrb a
	ret
.BB@LABEL@6_2:	; bb9
	;***      214 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 214
	oneb a
	ret
_resetAlarm:
	.STACK _resetAlarm = 4
	;***      215 : void resetAlarm(void) {
	;***      216 : 	g_commnunication_flag.alarm_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 216
	oneb !LOWW(_g_commnunication_flag+0x00007)
	ret
_ResponseHandler:
	.STACK _ResponseHandler = 6
	;***      217 : }
	;***      218 : void ResponseHandler(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 218
	push hl
	;***      219 : 	if (g_commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 219
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@8_2
.BB@LABEL@8_1:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 230
	ret
.BB@LABEL@8_2:	; if_then_bb
	;***      220 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 220
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      221 : 		if (g_machine_state.user == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 221
	cmp !LOWW(_g_machine_state+0x0000D), #0x02
	sknz
.BB@LABEL@8_3:	; if_then_bb11
	;***      222 : 			g_machine_state.user = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 222
	oneb !LOWW(_g_machine_state+0x0000D)
.BB@LABEL@8_4:	; if_break_bb
	;***      223 : 		}
	;***      224 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 224
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@8_5:	; bb13
	mov a, [sp+0x00]
	;***      225 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 225
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@8_7
.BB@LABEL@8_6:	; bb
	;***      226 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 226
	call !!_R_WDT_Restart
	br $.BB@LABEL@8_5
.BB@LABEL@8_7:	; bb21
	;***      227 : 		}
	;***      228 : 		g_commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 228
	clrb !LOWW(_g_commnunication_flag)
	br $.BB@LABEL@8_1
_ResponseWashingMode:
	.STACK _ResponseWashingMode = 4
	;***      229 : 	}
	;***      230 : }
	;***      231 : void ResponseWashingMode(void) {
	;***      232 : 	if (g_commnunication_flag.send_response_mode_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 232
	cmp !LOWW(_g_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@9_2
.BB@LABEL@9_1:	; if_then_bb
	;***      233 : 		sendToRasPi_u32(H_READ, WASHING_MODE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 233
	mov a, !LOWW(_g_machine_mode)
	clrb x
	movw de, ax
	clrw bc
	movw ax, #0x5218
	call $!_sendToRasPi_u32
	;***      234 : 				(uint32_t) g_machine_mode << (8 * 3));
	;***      235 : //		sendToRasPi_u32(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
	;***      236 : 		g_commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 236
	clrb !LOWW(_g_commnunication_flag+0x00006)
.BB@LABEL@9_2:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 238
	ret
_MonitoringStatus:
	.STACK _MonitoringStatus = 6
	;***      237 : 	}
	;***      238 : }
	;***      239 : void MonitoringStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 239
	push hl
	;***      240 : 	if (g_commnunication_flag.send_response_status_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 240
	cmp !LOWW(_g_commnunication_flag+0x00005), #0x01
	bnz $.BB@LABEL@10_5
.BB@LABEL@10_1:	; if_then_bb
	;***      241 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 241
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      242 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 242
	movw bc, #0x0012
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@10_2:	; bb9
	mov a, [sp+0x00]
	;***      243 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 243
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@10_4
.BB@LABEL@10_3:	; bb
	;***      244 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 244
	call !!_R_WDT_Restart
	br $.BB@LABEL@10_2
.BB@LABEL@10_4:	; bb17
	;***      245 : 		}
	;***      246 : 		g_commnunication_flag.send_response_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 246
	clrb !LOWW(_g_commnunication_flag+0x00005)
.BB@LABEL@10_5:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 248
	ret
_TestIndividual:
	.STACK _TestIndividual = 4
	;***      247 : 	}
	;***      248 : }
	;***      249 : void TestIndividual(void) {
	;***      250 : 	if (g_commnunication_flag.recieve_status_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 250
	cmp !LOWW(_g_commnunication_flag+0x00008), #0x02
	bnz $.BB@LABEL@11_4
.BB@LABEL@11_1:	; entry.bb_crit_edge
	clrb a
.BB@LABEL@11_2:	; bb
	mov b, a
	;***      251 : 		uint8_t *const _io_p = (uint8_t*) &g_io_response.Valve;
	;***      252 : 		for (uint8_t i = 0; i < 4; i++) {
	;***      253 : 			_io_p[i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 253
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(_g_io_response+0x00001)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 252
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@11_2
.BB@LABEL@11_3:	; bb22
	;***      254 : 		}
	;***      255 : 		IO_Output(&g_io_response);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 255
	movw ax, #LOWW(_g_io_response)
	call $!_IO_Output
	;***      256 : 		g_commnunication_flag.recieve_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 256
	clrb !LOWW(_g_commnunication_flag+0x00008)
.BB@LABEL@11_4:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 258
	ret
_TestControl:
	.STACK _TestControl = 8
	;***      257 : 	}
	;***      258 : }
	;***      259 : 
	;***      260 : void TestControl(void) {
	;***      261 : 	if (g_commnunication_flag.control_test_flag != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 261
	cmp0 !LOWW(_g_commnunication_flag+0x0000F)
	bz $.BB@LABEL@12_13
.BB@LABEL@12_1:	; if_then_bb
	;***      262 : 		switch (g_commnunication_flag.control_test_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 262
	mov a, !LOWW(_g_commnunication_flag+0x0000F)
	add a, #0xD9
	bz $.BB@LABEL@12_7
.BB@LABEL@12_2:	; if_then_bb
	dec a
	bz $.BB@LABEL@12_10
.BB@LABEL@12_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@12_8
.BB@LABEL@12_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@12_9
.BB@LABEL@12_5:	; if_then_bb
	cmp a, #0x02
	bnz $.BB@LABEL@12_12
.BB@LABEL@12_6:	; switch_clause_bb29
	;***      263 : 		case DRAINAGE_MODE_SET:
	;***      264 : 			sendToRasPi_u32(H_READ, DRAINAGE_MODE_SET,
	;***      265 : 					(uint32_t) g_test_control.raw.drain << (8 * 3));
	;***      266 : 			break;
	;***      267 : 		case POWER_ON_TEST_SET:
	;***      268 : 			sendToRasPi_u32(H_READ, POWER_ON_TEST_SET,
	;***      269 : 					(uint32_t) g_test_control.raw.power_on << (8 * 3));
	;***      270 : 			break;
	;***      271 : 		case WATER_FILTER_SET:
	;***      272 : 			sendToRasPi_u32(H_READ, WATER_FILTER_SET,
	;***      273 : 					(uint32_t) g_test_control.raw.filter << (8 * 3));
	;***      274 : 			break;
	;***      275 : 		case BIOMECTRIC_SET:
	;***      276 : 			sendToRasPi_u32(H_READ, BIOMECTRIC_SET,
	;***      277 : 					(uint32_t) g_test_control.raw.biomectric << (8 * 3));
	;***      278 : 			break;
	;***      279 : 		case CONTROL_SETTING:
	;***      280 : 			rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 280
	inc !LOWW(_rx_count)
	;***      281 : 			sendToRasPi_u32(H_READ, CONTROL_SETTING, (uint32_t) g_test_control.data << (8 * 3));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 281
	mov a, !LOWW(_g_test_control)
	clrb x
	movw de, ax
	mov x, #0x2C
	br $.BB@LABEL@12_11
.BB@LABEL@12_7:	; switch_clause_bb
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 264
	and a, !LOWW(_g_test_control)
	clrb x
	movw de, ax
	mov x, #0x27
	br $.BB@LABEL@12_11
.BB@LABEL@12_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 268
	mov a, !LOWW(_g_test_control)
	shr a, 0x01
	and a, #0x01
	clrb x
	movw de, ax
	mov x, #0x29
	br $.BB@LABEL@12_11
.BB@LABEL@12_9:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 272
	mov a, !LOWW(_g_test_control)
	shr a, 0x02
	and a, #0x01
	clrb x
	movw de, ax
	mov x, #0x2A
	br $.BB@LABEL@12_11
.BB@LABEL@12_10:	; switch_clause_bb23
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 276
	mov a, !LOWW(_g_test_control)
	shr a, 0x03
	and a, #0x01
	clrb x
	movw de, ax
	mov x, #0x28
.BB@LABEL@12_11:	; switch_clause_bb23
	clrw bc
	mov a, #0x52
	call $!_sendToRasPi_u32
.BB@LABEL@12_12:	; switch_break_bb
	;***      282 : 			break;
	;***      283 : 		default:
	;***      284 : 			break;
	;***      285 : 		}
	;***      286 : 		g_commnunication_flag.control_test_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 286
	clrb !LOWW(_g_commnunication_flag+0x0000F)
.BB@LABEL@12_13:	; if_break_bb
	;***      287 : 	}
	;***      288 : 	if(g_commnunication_flag.control_test_save_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 288
	cmp !LOWW(_g_commnunication_flag+0x00010), #0x01
	bnz $.BB@LABEL@12_15
.BB@LABEL@12_14:	; if_then_bb41
	clrw ax
	;***      289 : 		EE_SPI_Write((uint8_t *)&g_test_control.data, NUMBER_SETTING_ADDRESS + numberSettingSize, sizeof(g_test_control.data));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 289
	push ax
	incw ax
	push ax
	movw bc, #0x0029
	movw ax, #LOWW(_g_test_control)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      290 : 		g_commnunication_flag.control_test_save_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 290
	clrb !LOWW(_g_commnunication_flag+0x00010)
.BB@LABEL@12_15:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 292
	ret
	;***      291 : 	}
	;***      292 : }
	.SECTION .const,CONST
	.ALIGN 2
_time_setting_p:
	.DB2 LOWW(__settingTime)
	.ALIGN 2
_number_setting_p:
	.DB2 LOWW(__settingNumber)
	.SECTION .data,DATA
	.ALIGN 2
_test_control_buf:
	.DB 0x52
	.DB 0x02
	.DB4 0x437F0000	; float value: 255
	.SECTION .bss,BSS
_g_io_response:
	.DS (5)
_io_off:
	.DS (5)
_g_test_control:
	.DS (1)
