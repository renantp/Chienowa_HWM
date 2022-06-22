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
#@  compiled at Wed Jun 22 12:09:20 2022

	.EXTERN _g_timerSetting
	.EXTERN _g_numberSetting
	.EXTERN _g_io_status
	.EXTERN _g_Tick
	.EXTERN _g_machine_state
	.EXTERN _g_control_buffer_f
	.EXTERN _g_control_buffer_u32
	.EXTERN _g_control_buffer_i32
	.EXTERN _g_commnunication_flag
	.EXTERN _g_machine_mode
	.EXTERN _g_systemTime
	.EXTERN _g_uart2_sendend
	.EXTERN _g_rx_data
	.EXTERN _g_animation_queue
	.EXTERN _g_alarm
	.EXTERN __settingTime
	.EXTERN __settingNumber
	.PUBLIC _time_setting_p
	.PUBLIC _number_setting_p
	.PUBLIC _test_control_buf
	.PUBLIC _g_io_response
	.PUBLIC _io_off
	.PUBLIC _g_control_setting
	.PUBLIC _save_spec_ok
	.PUBLIC _flag_response
	.PUBLIC _AlarmResponse
	.EXTERN _R_UART2_Send
	.PUBLIC _SaveComfirmResponse
	.PUBLIC _HandsensorResponse
	.PUBLIC _RaspberryCommunication_nostop
	.EXTERN _ns_delay_ms
	.EXTERN _R_UART2_Stop
	.EXTERN _R_UART2_Start
	.EXTERN _R_UART2_Receive
	.PUBLIC _sendToRasPi_f
	.PUBLIC _sendToRasPi_u32
	.PUBLIC _sendToRasPi_Revert_i32
	.PUBLIC _waitAlarmConfirm_stop
	.EXTERN _realTimeResponse
	.PUBLIC _waitAlarmConfirm_nonstop
	.PUBLIC _resetAlarm
	.PUBLIC _ResponseHandler
	.PUBLIC _userAuthResponse
	.PUBLIC _ResponseWashingMode
	.PUBLIC _ResponseNextAnimation
	.PUBLIC _MonitoringStatus
	.PUBLIC _TestIndividual
	.PUBLIC _ControlSetttingReponse
	.PUBLIC _TestMode
	.PUBLIC _SendTimeSetting
	.PUBLIC _SendNumberSetting
	.PUBLIC _GetAndSaveTimeSetting
	.PUBLIC _GetAndSaveNumberSetting
	.EXTERN _R_WDT_Restart
	.EXTERN _OutputIO
	.EXTERN _EE_SPI_Write
	.EXTERN _crc8_1
	.EXTERN _R_DAC0_Set_ConversionValue
	.EXTERN _R_DAC1_Set_ConversionValue

	.SECTION .textf,TEXTF
_AlarmResponse:
	.STACK _AlarmResponse = 4
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
	;***       17 : union Control_u g_control_setting;
	;***       18 : int8_t save_spec_ok = 0;
	;***       19 : 
	;***       20 : // ------------------ LOCAL FUNCTION -------------------------------
	;***       21 : uint8_t ResponseHandler(void);
	;***       22 : uint8_t userAuthResponse(void);
	;***       23 : void ResponseWashingMode(void);
	;***       24 : uint8_t ResponseNextAnimation(void);
	;***       25 : void MonitoringStatus(void);
	;***       26 : uint8_t TestIndividual(void);
	;***       27 : void ControlSetttingReponse(void);
	;***       28 : uint8_t SendTimeSetting(void);
	;***       29 : uint8_t SendNumberSetting(void);
	;***       30 : uint8_t GetAndSaveTimeSetting(void);
	;***       31 : uint8_t GetAndSaveNumberSetting(void);
	;***       32 : uint8_t TestMode(void);
	;***       33 : struct Flag_response {
	;***       34 : 	uint8_t time;
	;***       35 : 	uint8_t number;
	;***       36 : 	uint8_t mode;
	;***       37 : 	uint8_t alarm;
	;***       38 : } flag_response;
	;***       39 : /**
	;***       40 :  * After send
	;***       41 :  */
	;***       42 : void AlarmResponse(void) {
	;***       43 : 	if (g_commnunication_flag.alarm_response_flag == 1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 43
	cmp !LOWW(_g_commnunication_flag+0x00008), #0x01
	bnz $.BB@LABEL@1_3
.BB@LABEL@1_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@1_3
.BB@LABEL@1_2:	; if_then_bb
	;***       44 : 			&& g_commnunication_flag.send_response_flag == 0) {
	;***       45 : 		//TODO: Send alarm data
	;***       46 : 		R_UART2_Send((uint8_t*) &g_alarm, 3);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 46
	movw bc, #0x0003
	movw ax, #LOWW(_g_alarm)
	call !!_R_UART2_Send
	;***       47 : 		flag_response.alarm++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 47
	inc !LOWW(_flag_response+0x00003)
	;***       48 : 		g_commnunication_flag.alarm_response_flag = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 48
	clrb !LOWW(_g_commnunication_flag+0x00008)
.BB@LABEL@1_3:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 50
	ret
_SaveComfirmResponse:
	.STACK _SaveComfirmResponse = 4
	;***       49 : 	}
	;***       50 : }
	;***       51 : void SaveComfirmResponse(void) {
	;***       52 : 	if (g_commnunication_flag.save_confirm_flag && save_spec_ok != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 52
	cmp0 !LOWW(_g_commnunication_flag+0x0000F)
	bz $.BB@LABEL@2_3
.BB@LABEL@2_1:	; bb
	mov a, !LOWW(_save_spec_ok)
	cmp0 a
	bz $.BB@LABEL@2_3
.BB@LABEL@2_2:	; if_then_bb
	;***       53 : 		sendToRasPi_Revert_i32(H_SET, OK_ALL, (int32_t) (save_spec_ok));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 53
	sarw ax, 8+0x00000
	movw bc, ax
	sarw ax, 0x0F
	movw de, ax
	movw ax, #0x5300
	call $!_sendToRasPi_Revert_i32
	;***       54 : 		save_spec_ok = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 54
	clrb !LOWW(_save_spec_ok)
	;***       55 : 		g_commnunication_flag.save_confirm_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 55
	clrb !LOWW(_g_commnunication_flag+0x0000F)
.BB@LABEL@2_3:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 57
	ret
_HandsensorResponse:
	.STACK _HandsensorResponse = 4
	;***       56 : 	}
	;***       57 : }
	;***       58 : void HandsensorResponse(void) {
	;***       59 : 	if (g_commnunication_flag.send_handsensor_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 59
	cmp !LOWW(_g_commnunication_flag+0x00010), #0x01
	bnz $.BB@LABEL@3_2
.BB@LABEL@3_1:	; if_then_bb
	;***       60 : 		sendToRasPi_u32(H_READ, START_WASHING, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 60
	clrw ax
	movw de, ax
	onew bc
	movw ax, #0x522B
	call $!_sendToRasPi_u32
	;***       61 : 		g_commnunication_flag.send_handsensor_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 61
	clrb !LOWW(_g_commnunication_flag+0x00010)
.BB@LABEL@3_2:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 63
	ret
_RaspberryCommunication_nostop:
	.STACK _RaspberryCommunication_nostop = 4
	;***       62 : 	}
	;***       63 : }
	;***       64 : 
	;***       65 : //------------------- EXTERNAL FUNCTION ----------------------------------
	;***       66 : void RaspberryCommunication_nostop(void) {
	;***       67 : 	if (ResponseHandler()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 67
	call $!_ResponseHandler
	;***       68 : 
	;***       69 : 	} else {
	;***       70 : 
	;***       71 : 	}
	;***       72 : 	userAuthResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 72
	call $!_userAuthResponse
	;***       73 : 	SendTimeSetting();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 73
	call $!_SendTimeSetting
	;***       74 : 	SendNumberSetting();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 74
	call $!_SendNumberSetting
	;***       75 : 	ResponseWashingMode();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 75
	call $!_ResponseWashingMode
	;***       76 : 	ResponseNextAnimation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 76
	call $!_ResponseNextAnimation
	;***       77 : 	ControlSetttingReponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 77
	call $!_ControlSetttingReponse
	;***       78 : 	GetAndSaveTimeSetting();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 78
	call $!_GetAndSaveTimeSetting
	;***       79 : 	GetAndSaveNumberSetting();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 79
	call $!_GetAndSaveNumberSetting
	;***       80 : 	SaveComfirmResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 80
	call $!_SaveComfirmResponse
	;***       81 : 	TestIndividual();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 81
	call $!_TestIndividual
	;***       82 : 	MonitoringStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 82
	call $!_MonitoringStatus
	;***       83 : 	TestMode();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 83
	call $!_TestMode
	;***       84 : 	AlarmResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 84
	call $!_AlarmResponse
	;***       85 : 	//Auto reset UART after 5s not get data
	;***       86 : 	if (ns_delay_ms(&g_Tick.tickUartTimeout, 2000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 86
	clrw ax
	movw de, ax
	movw bc, #0x07D0
	movw ax, #LOWW(_g_Tick+0x000C0)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@4_5
.BB@LABEL@4_1:	; if_else_bb17
	;***       87 : 		R_UART2_Stop();
	;***       88 : 		g_animation_queue = 0;
	;***       89 : 	} else if (STMK2 == 1U && ns_delay_ms(&g_Tick.tickUartTimeout, 50)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 89
	mov a, 0xFFFE5
	bf a.0, $.BB@LABEL@4_4
.BB@LABEL@4_2:	; bb
	clrw ax
	movw de, ax
	mov c, #0x32
	movw ax, #LOWW(_g_Tick+0x000C0)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_4
.BB@LABEL@4_3:	; if_then_bb34
	;***       90 : 		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 90
	call !!_R_UART2_Start
	;***       91 : 		R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 91
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	br !!_R_UART2_Receive
.BB@LABEL@4_4:	; return
	;***       92 : 	}
	;***       93 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 93
	ret
.BB@LABEL@4_5:	; if_then_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 87
	call !!_R_UART2_Stop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 88
	clrb !LOWW(_g_animation_queue)
	ret
_sendToRasPi_f:
	.STACK _sendToRasPi_f = 6
	;***       94 : 
	;***       95 : void sendToRasPi_f(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 95
	push hl
	;***       96 : 		float value) {
	;***       97 : 	uint8_t state = g_uart2_sendend;
	;***       98 : 	g_control_buffer_f.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 98
	mov !LOWW(_g_control_buffer_f), a
	mov a, x
	;***       99 : 	g_control_buffer_f.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 99
	mov !LOWW(_g_control_buffer_f+0x00001), a
	movw ax, bc
	;***      100 : 	g_control_buffer_f.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 100
	movw !LOWW(_g_control_buffer_f+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_f+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 97
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      101 : 	R_UART2_Send((uint8_t*) &g_control_buffer_f, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 101
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_f)
	call !!_R_UART2_Send
.BB@LABEL@5_1:	; bb9
	mov a, [sp+0x00]
	;***      102 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 102
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@5_1
.BB@LABEL@5_2:	; return
	;***      103 : 		;
	;***      104 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 104
	pop hl
	ret
_sendToRasPi_u32:
	.STACK _sendToRasPi_u32 = 6
	;***      105 : void sendToRasPi_u32(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 105
	push hl
	;***      106 : 		uint32_t value) {
	;***      107 : 	uint8_t state = g_uart2_sendend;
	;***      108 : 	g_control_buffer_u32.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 108
	mov !LOWW(_g_control_buffer_u32), a
	mov a, x
	;***      109 : 	g_control_buffer_u32.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 109
	mov !LOWW(_g_control_buffer_u32+0x00001), a
	movw ax, bc
	;***      110 : 	g_control_buffer_u32.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 110
	movw !LOWW(_g_control_buffer_u32+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_u32+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 107
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      111 : 	R_UART2_Send((uint8_t*) &g_control_buffer_u32, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 111
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_u32)
	call !!_R_UART2_Send
.BB@LABEL@6_1:	; bb9
	mov a, [sp+0x00]
	;***      112 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 112
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@6_1
.BB@LABEL@6_2:	; return
	;***      113 : 		;
	;***      114 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 114
	pop hl
	ret
_sendToRasPi_Revert_i32:
	.STACK _sendToRasPi_Revert_i32 = 10
	;***      115 : union Revert_Byte {
	;***      116 : 	struct {
	;***      117 : 		int8_t byte[4];
	;***      118 : 	} refined;
	;***      119 : 	int32_t raw;
	;***      120 : };
	;***      121 : void sendToRasPi_Revert_i32(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 121
	subw sp, #0x06
	;***      122 : 		int32_t value) {
	;***      123 : 	union Revert_Byte data;
	;***      124 : 	uint8_t state = g_uart2_sendend;
	;***      125 : 	data.refined.byte[3] = value;
	;***      126 : 	data.refined.byte[2] = value >> 8;
	;***      127 : 	data.refined.byte[1] = value >> 16;
	;***      128 : 	data.refined.byte[0] = value >> 24;
	;***      129 : 	g_control_buffer_i32.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 129
	mov !LOWW(_g_control_buffer_i32), a
	mov a, x
	;***      130 : 	g_control_buffer_i32.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 130
	mov !LOWW(_g_control_buffer_i32+0x00001), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 124
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 125
	mov a, c
	mov [sp+0x05], a
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 126
	mov [sp+0x04], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 127
	mov a, e
	mov [sp+0x03], a
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 128
	mov [sp+0x02], a
	;***      131 : 	g_control_buffer_i32.set_value = data.raw;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 131
	movw ax, [sp+0x04]
	movw !LOWW(_g_control_buffer_i32+0x00004), ax
	movw ax, [sp+0x02]
	movw !LOWW(_g_control_buffer_i32+0x00002), ax
	;***      132 : 	R_UART2_Send((uint8_t*) &g_control_buffer_i32, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 132
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_i32)
	call !!_R_UART2_Send
.BB@LABEL@7_1:	; bb42
	mov a, [sp+0x00]
	;***      133 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 133
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@7_1
.BB@LABEL@7_2:	; return
	;***      134 : 		;
	;***      135 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 135
	addw sp, #0x06
	ret
_waitAlarmConfirm_stop:
	.STACK _waitAlarmConfirm_stop = 14
	;***      136 : /**
	;***      137 :  * Wait for Raspberry Pi send {H_CLEAR, alarm, x}
	;***      138 :  * @param alarm
	;***      139 :  * @param timeout_s Timeout if timeout_s != 0
	;***      140 :  */
	;***      141 : void waitAlarmConfirm_stop(enum Control_status alarm, uint8_t timeout_s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 141
	push ax
	subw sp, #0x06
	mov [sp+0x00], a
	;***      142 : 	uint32_t _tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 142
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@8_1:	; bb22
	mov a, [sp+0x00]
	;***      143 : 	while (g_commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 143
	cmp a, !LOWW(_g_commnunication_flag+0x00007)
	bz $.BB@LABEL@8_4
.BB@LABEL@8_2:	; bb
	;***      144 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 144
	call !!_realTimeResponse
	mov a, [sp+0x06]
	;***      145 : 		if ((timeout_s != 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 145
	cmp0 a
	bz $.BB@LABEL@8_1
.BB@LABEL@8_3:	; bb8
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
	bz $.BB@LABEL@8_1
.BB@LABEL@8_4:	; bb31
	pop ax
	push ax
	;***      146 : 				&& (ns_delay_ms(&_tick, (uint32_t) timeout_s * 1000))) {
	;***      147 : 			break;
	;***      148 : 		}
	;***      149 : 	}
	;***      150 : 	sendToRasPi_u32(H_CLEAR, alarm, (uint32_t) 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 150
	movw de, #0x0000
	clrw bc
	mov a, #0x43
	call $!_sendToRasPi_u32
	;***      151 : 	g_commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 151
	clrb !LOWW(_g_commnunication_flag+0x00007)
	addw sp, #0x08
	ret
_waitAlarmConfirm_nonstop:
	.STACK _waitAlarmConfirm_nonstop = 4
	;***      152 : }
	;***      153 : /**
	;***      154 :  *
	;***      155 :  * @param alarm
	;***      156 :  * @return 0 - Done; 1 - Still wait
	;***      157 :  */
	;***      158 : uint8_t waitAlarmConfirm_nonstop(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 158
	cmp a, !LOWW(_g_commnunication_flag+0x00007)
	;***      159 : 	if (g_commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 159
	bnz $.BB@LABEL@9_2
.BB@LABEL@9_1:	; if_break_bb
	;***      160 : 		return 1;
	;***      161 : 	}
	;***      162 : 	g_commnunication_flag.alarm_clear_flag = OK_ALL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 162
	clrb !LOWW(_g_commnunication_flag+0x00007)
	;***      163 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 163
	clrb a
	ret
.BB@LABEL@9_2:	; bb9
	;***      164 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 164
	oneb a
	ret
_resetAlarm:
	.STACK _resetAlarm = 4
	;***      165 : void resetAlarm(void) {
	;***      166 : 	g_commnunication_flag.alarm_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 166
	oneb !LOWW(_g_commnunication_flag+0x00007)
	ret
_ResponseHandler:
	.STACK _ResponseHandler = 6
	;***      167 : }
	;***      168 : //------------------End of EXTERNAL FUNCTION -----------------------------
	;***      169 : //------------------ Internal Function------------------------------------
	;***      170 : /**
	;***      171 :  * Send response Command to Raspberry Pi
	;***      172 :  * @return 1 - Have a response, 0 - Not response
	;***      173 :  */
	;***      174 : uint8_t ResponseHandler(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 174
	push hl
	;***      175 : 	if (g_commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 175
	cmp0 !LOWW(_g_commnunication_flag)
	clrb a
	bz $.BB@LABEL@11_4
.BB@LABEL@11_1:	; if_then_bb
	;***      176 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 176
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      177 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 177
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
	;***      178 : 		g_commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 178
	clrb !LOWW(_g_commnunication_flag)
.BB@LABEL@11_2:	; bb8
	mov a, [sp+0x00]
	;***      179 : 
	;***      180 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 180
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@11_2
.BB@LABEL@11_3:	; bb8.bb19_crit_edge
	oneb a
.BB@LABEL@11_4:	; bb19
	;***      181 : 		}
	;***      182 : 		return 1U;
	;***      183 : 	}
	;***      184 : 	return 0U;
	;***      185 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 185
	pop hl
	ret
_userAuthResponse:
	.STACK _userAuthResponse = 4
	;***      186 : 
	;***      187 : uint8_t userAuthResponse(void) {
	;***      188 : 	if (g_machine_state.user == 2 && g_commnunication_flag.send_response_flag == 0U) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 188
	cmp !LOWW(_g_machine_state+0x0000D), #0x02
	bnz $.BB@LABEL@12_6
.BB@LABEL@12_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@12_6
.BB@LABEL@12_2:	; if_then_bb
	;***      189 : //		if(g_commnunication_flag.send_response_flag == 0U &&
	;***      190 : //				g_machine_state.mode != ELECTROLYTIC_GENERATION
	;***      191 : //				&& g_machine_state.mode != WASHING_MODE){
	;***      192 : 
	;***      193 : //		if (g_commnunication_flag.send_response_flag == 0U
	;***      194 : //				&& g_machine_state.mode == INDIE) {
	;***      195 : //			g_machine_state.user = 1;
	;***      196 : //			sendToRasPi_u32(H_SET, OK_USER, (uint32_t) 0x01 << (8 * 3));
	;***      197 : //		} else {
	;***      198 : //			g_machine_state.user = 0;
	;***      199 : //			sendToRasPi_u32(H_SET, OK_USER, (uint32_t) 0x00 << (8 * 3));
	;***      200 : //		}
	;***      201 : 
	;***      202 : 		if (g_machine_state.mode != WASHING_MODE){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 202
	cmp !LOWW(_g_machine_state+0x0000E), #0x18
	bnz $.BB@LABEL@12_5
.BB@LABEL@12_3:	; if_else_bb
	;***      203 : 			g_machine_state.user = 1;
	;***      204 : 			sendToRasPi_u32(H_SET, OK_USER, (uint32_t) 0x01 << (8 * 3));
	;***      205 : 		}else{
	;***      206 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 206
	clrb !LOWW(_g_machine_state+0x0000D)
	;***      207 : 			sendToRasPi_u32(H_SET, OK_USER, (uint32_t) 0x00 << (8 * 3));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 207
	clrw ax
	movw de, ax
.BB@LABEL@12_4:	; if_else_bb
	clrw bc
	movw ax, #0x5301
	call $!_sendToRasPi_u32
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 212
	ret
.BB@LABEL@12_5:	; if_then_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 203
	oneb !LOWW(_g_machine_state+0x0000D)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 204
	movw de, #0x0100
	br $.BB@LABEL@12_4
.BB@LABEL@12_6:	; bb24
	;***      208 : 		}
	;***      209 : 		return 1;
	;***      210 : 	}
	;***      211 : 	return 0;
	;***      212 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 212
	clrb a
	ret
_ResponseWashingMode:
	.STACK _ResponseWashingMode = 4
	;***      213 : void ResponseWashingMode(void) {
	;***      214 : 	if (g_commnunication_flag.send_response_mode_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 214
	cmp !LOWW(_g_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@13_2
.BB@LABEL@13_1:	; if_then_bb
	;***      215 : 		sendToRasPi_u32(H_READ, WASHING_MODE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 215
	mov a, !LOWW(_g_machine_mode)
	clrb x
	movw de, ax
	clrw bc
	movw ax, #0x5218
	call $!_sendToRasPi_u32
	;***      216 : 				(uint32_t) g_machine_mode << (8 * 3));
	;***      217 : 		g_commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 217
	clrb !LOWW(_g_commnunication_flag+0x00006)
.BB@LABEL@13_2:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 219
	ret
_ResponseNextAnimation:
	.STACK _ResponseNextAnimation = 4
	;***      218 : 	}
	;***      219 : }
	;***      220 : uint8_t ResponseNextAnimation(void) {
	;***      221 : 	if (g_commnunication_flag.send_response_flag == 0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 221
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@14_5
.BB@LABEL@14_1:	; bb
	cmp !LOWW(_g_commnunication_flag+0x0000E), #0x01
	bnz $.BB@LABEL@14_5
.BB@LABEL@14_2:	; if_then_bb
	;***      222 : 			&& g_commnunication_flag.next_animation_flag == 1) {
	;***      223 : 		sendToRasPi_u32(H_READ, NEXT_ANIMATION,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 223
	mov a, !LOWW(_g_animation_queue)
	clrb x
	movw de, ax
	clrw bc
	movw ax, #0x5213
	call $!_sendToRasPi_u32
	;***      224 : 				(uint32_t) g_animation_queue << (8 * 3));
	;***      225 : 		g_animation_queue =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 225
	mov a, !LOWW(_g_animation_queue)
	cmp0 a
	skz
.BB@LABEL@14_3:	; bb22
	dec a
.BB@LABEL@14_4:	; bb30
	mov !LOWW(_g_animation_queue), a
	;***      226 : 				g_animation_queue > 0 ?
	;***      227 : 						g_animation_queue - 1 : g_animation_queue;
	;***      228 : 		g_commnunication_flag.next_animation_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 228
	clrb !LOWW(_g_commnunication_flag+0x0000E)
	;***      229 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 229
	oneb a
	ret
.BB@LABEL@14_5:	; bb36
	;***      230 : 	}
	;***      231 : 	return 0U;
	;***      232 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 232
	clrb a
	ret
_MonitoringStatus:
	.STACK _MonitoringStatus = 6
	;***      233 : void MonitoringStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 233
	push hl
	;***      234 : 	if (g_commnunication_flag.send_response_status_flag == 1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 234
	cmp !LOWW(_g_commnunication_flag+0x00005), #0x01
	bnz $.BB@LABEL@15_6
.BB@LABEL@15_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@15_6
.BB@LABEL@15_2:	; if_then_bb
	;***      235 : 			&& g_commnunication_flag.send_response_flag == 0) {
	;***      236 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 236
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      237 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 237
	movw bc, #0x0010
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@15_3:	; bb20
	mov a, [sp+0x00]
	;***      238 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 238
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@15_5
.BB@LABEL@15_4:	; bb19
	;***      239 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 239
	call !!_R_WDT_Restart
	br $.BB@LABEL@15_3
.BB@LABEL@15_5:	; bb28
	;***      240 : 		}
	;***      241 : 		g_commnunication_flag.send_response_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 241
	clrb !LOWW(_g_commnunication_flag+0x00005)
.BB@LABEL@15_6:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 243
	ret
_TestIndividual:
	.STACK _TestIndividual = 4
	;***      242 : 	}
	;***      243 : }
	;***      244 : uint8_t TestIndividual(void) {
	;***      245 : 	if (g_commnunication_flag.recieve_status_flag == 2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 245
	cmp !LOWW(_g_commnunication_flag+0x00009), #0x02
	bnz $.BB@LABEL@16_7
.BB@LABEL@16_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@16_7
.BB@LABEL@16_2:	; if_then_bb
	;***      246 : 			&& g_commnunication_flag.send_response_flag == 0) {
	;***      247 : 		if (g_commnunication_flag.test_enable_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 247
	cmp !LOWW(_g_commnunication_flag+0x0000D), #0x01
	bnz $.BB@LABEL@16_6
.BB@LABEL@16_3:	; if_then_bb.bb23_crit_edge
	clrb a
.BB@LABEL@16_4:	; bb23
	mov b, a
	;***      248 : 			uint8_t *const _io_p = (uint8_t*) &g_io_response.Valve;
	;***      249 : 			for (uint8_t i = 0; i < 3; i++) {
	;***      250 : 				_io_p[i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 250
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(_g_io_response+0x00001)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 249
	inc b
	mov a, b
	cmp a, #0x03
	bnz $.BB@LABEL@16_4
.BB@LABEL@16_5:	; bb40
	;***      251 : 			}
	;***      252 : 			OutputIO(&g_io_response);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 252
	movw ax, #LOWW(_g_io_response)
	call !!_OutputIO
.BB@LABEL@16_6:	; if_break_bb
	;***      253 : 		}
	;***      254 : 		g_commnunication_flag.recieve_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 254
	clrb !LOWW(_g_commnunication_flag+0x00009)
	;***      255 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 255
	oneb a
	ret
.BB@LABEL@16_7:	; bb44
	;***      256 : 	}
	;***      257 : 	return 0U;
	;***      258 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 258
	clrb a
	ret
_ControlSetttingReponse:
	.STACK _ControlSetttingReponse = 8
	;***      259 : 
	;***      260 : void ControlSetttingReponse(void) {
	;***      261 : 	const enum UART_header_e header =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 261
	cmp !LOWW(_g_commnunication_flag+0x00017), #0x01
	mov b, #0x53
	skz
.BB@LABEL@17_1:	; bb5
	mov b, #0x52
.BB@LABEL@17_2:	; bb6
	;***      262 : 			g_commnunication_flag.control_setting_save_flag == 1 ?
	;***      263 : 					H_SET : H_READ;
	;***      264 : 	if (g_commnunication_flag.control_setting_flag != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 264
	cmp0 !LOWW(_g_commnunication_flag+0x00016)
	bz $.BB@LABEL@17_10
.BB@LABEL@17_3:	; if_then_bb
	;***      265 : 		switch (g_commnunication_flag.control_setting_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 265
	mov a, !LOWW(_g_commnunication_flag+0x00016)
	add a, #0xD9
	bz $.BB@LABEL@17_13
.BB@LABEL@17_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@17_17
.BB@LABEL@17_5:	; if_then_bb
	dec a
	bz $.BB@LABEL@17_14
.BB@LABEL@17_6:	; if_then_bb
	dec a
	bz $.BB@LABEL@17_15
.BB@LABEL@17_7:	; if_then_bb
	cmp a, #0x02
	bnz $.BB@LABEL@17_9
.BB@LABEL@17_8:	; switch_clause_bb43
	;***      266 : 		case DRAINAGE_MODE_SET:
	;***      267 : 			sendToRasPi_u32(header, DRAINAGE_MODE_SET,
	;***      268 : 					(uint32_t) g_control_setting.raw.drain << (8 * 3));
	;***      269 : 			break;
	;***      270 : 		case POWER_ON_TEST_SET:
	;***      271 : 			sendToRasPi_u32(header, POWER_ON_TEST_SET,
	;***      272 : 					(uint32_t) g_control_setting.raw.power_on << (8 * 3));
	;***      273 : 			break;
	;***      274 : 		case WATER_FILTER_SET:
	;***      275 : 			sendToRasPi_u32(header, WATER_FILTER_SET,
	;***      276 : 					(uint32_t) g_control_setting.raw.filter << (8 * 3));
	;***      277 : 			break;
	;***      278 : 		case BIOMETRIC_SET:
	;***      279 : 			sendToRasPi_u32(header, BIOMETRIC_SET,
	;***      280 : 					(uint32_t) g_control_setting.raw.biomectric << (8 * 3));
	;***      281 : 			break;
	;***      282 : 		case CONTROL_SETTING:
	;***      283 : 			sendToRasPi_Revert_i32(H_READ, CONTROL_SETTING,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 283
	mov a, !LOWW(_g_control_setting)
	shrw ax, 8+0x00000
	movw bc, ax
	clrw ax
	movw de, ax
	movw ax, #0x522C
	call $!_sendToRasPi_Revert_i32
.BB@LABEL@17_9:	; switch_break_bb
	;***      284 : 					(int32_t) g_control_setting.data);
	;***      285 : 			break;
	;***      286 : 		default:
	;***      287 : 			break;
	;***      288 : 		}
	;***      289 : 		g_commnunication_flag.control_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 289
	clrb !LOWW(_g_commnunication_flag+0x00016)
.BB@LABEL@17_10:	; if_break_bb
	;***      290 : 	}
	;***      291 : 
	;***      292 : 	if (g_commnunication_flag.control_setting_save_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 292
	cmp !LOWW(_g_commnunication_flag+0x00017), #0x01
	bnz $.BB@LABEL@17_12
.BB@LABEL@17_11:	; if_then_bb52
	clrw ax
	;***      293 : 		EE_SPI_Write((uint8_t*) &g_control_setting.data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 293
	push ax
	incw ax
	push ax
	movw bc, #0x0029
	movw ax, #LOWW(_g_control_setting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      294 : 		NUMBER_SETTING_ADDRESS + numberSettingSize,
	;***      295 : 				sizeof(g_control_setting.data));
	;***      296 : 		g_commnunication_flag.control_setting_save_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 296
	clrb !LOWW(_g_commnunication_flag+0x00017)
.BB@LABEL@17_12:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 299
	ret
.BB@LABEL@17_13:	; switch_clause_bb
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 267
	and a, !LOWW(_g_control_setting)
	clrb x
	movw de, ax
	mov x, #0x27
	br $.BB@LABEL@17_16
.BB@LABEL@17_14:	; switch_clause_bb22
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 271
	mov a, !LOWW(_g_control_setting)
	shr a, 0x01
	and a, #0x01
	clrb x
	movw de, ax
	mov x, #0x29
	br $.BB@LABEL@17_16
.BB@LABEL@17_15:	; switch_clause_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 275
	mov a, !LOWW(_g_control_setting)
	shr a, 0x02
	and a, #0x01
	clrb x
	movw de, ax
	mov x, #0x2A
.BB@LABEL@17_16:	; switch_clause_bb29
	mov a, b
	clrw bc
	call $!_sendToRasPi_u32
	br $.BB@LABEL@17_9
.BB@LABEL@17_17:	; switch_clause_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 279
	mov a, !LOWW(_g_control_setting)
	shr a, 0x03
	and a, #0x01
	clrb x
	movw de, ax
	mov x, #0x28
	br $.BB@LABEL@17_16
_TestMode:
	.STACK _TestMode = 4
	;***      297 : 	}
	;***      298 : 
	;***      299 : }
	;***      300 : uint8_t TestMode(void) {
	;***      301 : 	if (g_commnunication_flag.test_flag == TESTING_MODE_START) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 301
	cmp !LOWW(_g_commnunication_flag+0x0000A), #0x1A
	bnz $.BB@LABEL@18_2
.BB@LABEL@18_1:	; if_then_bb
	;***      302 : 		g_commnunication_flag.test_flag = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 302
	clrb !LOWW(_g_commnunication_flag+0x0000A)
	;***      303 : 		sendToRasPi_u32(H_SET, TESTING_MODE_START, 0x0000);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 303
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x531A
	call $!_sendToRasPi_u32
	;***      304 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 304
	oneb a
	ret
.BB@LABEL@18_2:	; if_else_bb
	;***      305 : 	} else if (g_commnunication_flag.test_flag == TESTING_MODE_STOP) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 305
	cmp !LOWW(_g_commnunication_flag+0x0000A), #0x1C
	bnz $.BB@LABEL@18_4
.BB@LABEL@18_3:	; if_then_bb10
	;***      306 : 		g_commnunication_flag.test_flag = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 306
	clrb !LOWW(_g_commnunication_flag+0x0000A)
	;***      307 : 		sendToRasPi_u32(H_SET, TESTING_MODE_STOP, 0x0000);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 307
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x531C
	call $!_sendToRasPi_u32
	;***      308 : 		OutputIO(&io_off);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 308
	movw ax, #LOWW(_io_off)
	call !!_OutputIO
.BB@LABEL@18_4:	; bb13
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 311
	ret
_SendTimeSetting:
	.STACK _SendTimeSetting = 6
	;***      309 : 	}
	;***      310 : 	return 0;
	;***      311 : }
	;***      312 : 
	;***      313 : uint8_t SendTimeSetting(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 313
	push hl
	;***      314 : 	if (g_commnunication_flag.send_response_time_flag
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 314
	cmp0 !LOWW(_g_commnunication_flag+0x00001)
	bz $.BB@LABEL@19_6
.BB@LABEL@19_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@19_6
.BB@LABEL@19_2:	; if_then_bb
	;***      315 : 			&& (g_commnunication_flag.send_response_flag == 0)) {
	;***      316 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 316
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      317 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 317
	mov c, #0xA0
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x000A0), a
	;***      318 : 				timeSettingSize - 1);
	;***      319 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 319
	movw bc, #0x00A1
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
	;***      320 : 		flag_response.time++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 320
	inc !LOWW(_flag_response)
.BB@LABEL@19_3:	; bb28
	mov a, [sp+0x00]
	;***      321 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 321
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@19_5
.BB@LABEL@19_4:	; bb27
	;***      322 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 322
	call !!_R_WDT_Restart
	br $.BB@LABEL@19_3
.BB@LABEL@19_5:	; bb36
	;***      323 : 		}
	;***      324 : 		g_commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 324
	clrb !LOWW(_g_commnunication_flag+0x00001)
	;***      325 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 325
	oneb a
	pop hl
	ret
.BB@LABEL@19_6:	; bb39
	;***      326 : 	}
	;***      327 : 	return 0U;
	;***      328 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 328
	clrb a
	pop hl
	ret
_SendNumberSetting:
	.STACK _SendNumberSetting = 6
	;***      329 : uint8_t SendNumberSetting(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 329
	push hl
	;***      330 : 	if (g_commnunication_flag.send_response_number_flag
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 330
	cmp0 !LOWW(_g_commnunication_flag+0x00002)
	bz $.BB@LABEL@20_6
.BB@LABEL@20_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@20_6
.BB@LABEL@20_2:	; if_then_bb
	;***      331 : 			&& (g_commnunication_flag.send_response_flag == 0)) {
	;***      332 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 332
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      333 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 333
	mov c, #0x28
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00028), a
	;***      334 : 				numberSettingSize - 1);
	;***      335 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 335
	movw bc, #0x0029
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
	;***      336 : 		flag_response.number++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 336
	inc !LOWW(_flag_response+0x00001)
.BB@LABEL@20_3:	; bb28
	mov a, [sp+0x00]
	;***      337 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 337
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@20_5
.BB@LABEL@20_4:	; bb27
	;***      338 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 338
	call !!_R_WDT_Restart
	br $.BB@LABEL@20_3
.BB@LABEL@20_5:	; bb36
	;***      339 : 		}
	;***      340 : 		g_commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 340
	clrb !LOWW(_g_commnunication_flag+0x00002)
	;***      341 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 341
	oneb a
	pop hl
	ret
.BB@LABEL@20_6:	; bb39
	;***      342 : 	}
	;***      343 : 	return 0U;
	;***      344 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 344
	clrb a
	pop hl
	ret
_GetAndSaveTimeSetting:
	.STACK _GetAndSaveTimeSetting = 10
	;***      345 : uint8_t GetAndSaveTimeSetting(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 345
	push hl
	clrb a
	;***      346 : 	if (g_commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 346
	cmp !LOWW(_g_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@21_16
.BB@LABEL@21_1:	; entry.bb56_crit_edge
	mov b, a
.BB@LABEL@21_2:	; bb56
	;***      347 : 		//		//Do not Edit this, must keep!!!!
	;***      348 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 348
	cmp a, #0xA0
	bnc $.BB@LABEL@21_12
.BB@LABEL@21_3:	; bb
	;***      349 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 349
	and a, #0x03
	bz $.BB@LABEL@21_10
.BB@LABEL@21_4:	; bb
	dec a
	bz $.BB@LABEL@21_9
.BB@LABEL@21_5:	; bb
	dec a
	mov a, b
	bz $.BB@LABEL@21_8
.BB@LABEL@21_6:	; switch_clause_bb
	;***      350 : 			case 3:
	;***      351 : 				time_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 351
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFD)
.BB@LABEL@21_7:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@21_11
.BB@LABEL@21_8:	; switch_clause_bb19
	;***      352 : 				break;
	;***      353 : 			case 2:
	;***      354 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 354
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@21_7
.BB@LABEL@21_9:	; switch_clause_bb31
	;***      355 : 				break;
	;***      356 : 			case 1:
	;***      357 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 357
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@21_11
.BB@LABEL@21_10:	; switch_clause_bb42
	;***      358 : 				break;
	;***      359 : 			case 0:
	;***      360 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 360
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@21_11:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@21_2
.BB@LABEL@21_12:	; bb65
	;***      361 : 				break;
	;***      362 : 			default:
	;***      363 : 				break;
	;***      364 : 			}
	;***      365 : 		}
	;***      366 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 366
	mov a, !LOWW(_g_rx_data+0x000A0)
	mov [sp+0x00], a
	mov !LOWW(__settingTime+0x000A0), a
	;***      367 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 367
	mov c, #0xA0
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp x, a
	bnz $.BB@LABEL@21_14
.BB@LABEL@21_13:	; if_then_bb88
	;***      368 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
	;***      369 : 			save_spec_ok = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 369
	oneb !LOWW(_save_spec_ok)
	;***      370 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 370
	movw de, #0x00A2
	movw bc, #LOWW(__settingTime)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	clrw ax
	;***      371 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 371
	push ax
	mov x, #0xA1
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	br $.BB@LABEL@21_15
.BB@LABEL@21_14:	; if_else_bb
	;***      372 : 					timeSettingSize);
	;***      373 : 		} else {
	;***      374 : 			save_spec_ok = -1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 374
	mov !LOWW(_save_spec_ok), #0xFF
.BB@LABEL@21_15:	; if_break_bb
	;***      375 : 		}
	;***      376 : 		//		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      377 : 		g_commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 377
	clrb !LOWW(_g_commnunication_flag+0x00004)
	;***      378 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 378
	oneb a
.BB@LABEL@21_16:	; bb94
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 381
	ret
_GetAndSaveNumberSetting:
	.STACK _GetAndSaveNumberSetting = 14
	;***      379 : 	}
	;***      380 : 	return 0U;
	;***      381 : }
	;***      382 : uint8_t GetAndSaveNumberSetting(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 382
	subw sp, #0x06
	clrb a
	;***      383 : 	if (g_commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 383
	cmp !LOWW(_g_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@22_24
.BB@LABEL@22_1:	; entry.bb56_crit_edge
	mov b, a
.BB@LABEL@22_2:	; bb56
	;***      384 : 		//		//Do not Edit this, must keep!!!!
	;***      385 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 385
	cmp a, #0x28
	bnc $.BB@LABEL@22_12
.BB@LABEL@22_3:	; bb
	;***      386 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 386
	and a, #0x03
	bz $.BB@LABEL@22_10
.BB@LABEL@22_4:	; bb
	dec a
	bz $.BB@LABEL@22_9
.BB@LABEL@22_5:	; bb
	dec a
	mov a, b
	bz $.BB@LABEL@22_8
.BB@LABEL@22_6:	; switch_clause_bb
	;***      387 : 			case 3:
	;***      388 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 388
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@22_7:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@22_11
.BB@LABEL@22_8:	; switch_clause_bb19
	;***      389 : 				break;
	;***      390 : 			case 2:
	;***      391 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 391
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@22_7
.BB@LABEL@22_9:	; switch_clause_bb31
	;***      392 : 				break;
	;***      393 : 			case 1:
	;***      394 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 394
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@22_11
.BB@LABEL@22_10:	; switch_clause_bb42
	;***      395 : 				break;
	;***      396 : 			case 0:
	;***      397 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 397
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@22_11:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@22_2
.BB@LABEL@22_12:	; bb65
	;***      398 : 				break;
	;***      399 : 			default:
	;***      400 : 				break;
	;***      401 : 			}
	;***      402 : 		}
	;***      403 : 		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 403
	mov c, #0x28
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov !LOWW(__settingNumber+0x00028), a
	;***      404 : 				numberSettingSize - 1);
	;***      405 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 405
	mov a, !LOWW(_g_rx_data+0x00028)
	mov [sp+0x00], a
	mov c, #0x28
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp a, x
	.bnz $!.BB@LABEL@22_22
.BB@LABEL@22_13:	; if_then_bb87
	;***      406 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      407 : 			save_spec_ok = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 407
	oneb !LOWW(_save_spec_ok)
	;***      408 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 408
	movw de, #0x002A
	movw bc, #LOWW(__settingNumber)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	clrw ax
	;***      409 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 409
	push ax
	mov x, #0x29
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	movw ax, #0x409B
	;***      410 : 					numberSettingSize);
	;***      411 : 			if (g_numberSetting.saltPumpVoltage > SALT_PUMP_MAX_VOLTAGE)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 411
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
.BB@LABEL@22_14:	; if_then_bb87
	clrb a
.BB@LABEL@22_15:	; if_then_bb87
	cmp0 x
	oneb x
	sknz
.BB@LABEL@22_16:	; if_then_bb87
	clrb x
.BB@LABEL@22_17:	; if_then_bb87
	or x, a
	bnz $.BB@LABEL@22_19
.BB@LABEL@22_18:	; if_then_bb94
	movw ax, #0x409B
	;***      412 : 				g_numberSetting.saltPumpVoltage = SALT_PUMP_MAX_VOLTAGE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 412
	movw !LOWW(_g_numberSetting+0x00026), ax
	movw ax, #0x020C
	movw !LOWW(_g_numberSetting+0x00024), ax
.BB@LABEL@22_19:	; if_break_bb
	movw ax, #0x40A0
	;***      413 : 			if (g_numberSetting.cvccCurrent > CVCC_MAX_VOLTAGE)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 413
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
	bz $.BB@LABEL@22_21
.BB@LABEL@22_20:	; if_then_bb99
	movw ax, #0x40A0
	;***      414 : 				g_numberSetting.cvccCurrent = CVCC_MAX_VOLTAGE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 414
	movw !LOWW(_g_numberSetting+0x00022), ax
	clrw ax
	movw !LOWW(_g_numberSetting+0x00020), ax
	movw [sp+0x02], ax
	movw ax, #0x40A0
	movw [sp+0x00], ax
.BB@LABEL@22_21:	; if_break_bb100
	movw ax, #0x40A0
	;***      415 : 			R_DAC0_Set_ConversionValue(
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 415
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
	;***      416 : 					(uint8_t) (g_numberSetting.cvccCurrent / CVCC_MAX_VOLTAGE
	;***      417 : 							* 255));
	;***      418 : 			R_DAC1_Set_ConversionValue(
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 418
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
	br $.BB@LABEL@22_23
.BB@LABEL@22_22:	; if_else_bb
	;***      419 : 					(uint8_t) (g_numberSetting.saltPumpVoltage
	;***      420 : 							/ SALT_PUMP_MAX_VOLTAGE * 255));
	;***      421 : 		} else {
	;***      422 : 			save_spec_ok = -1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 422
	mov !LOWW(_save_spec_ok), #0xFF
.BB@LABEL@22_23:	; if_break_bb109
	;***      423 : 		}
	;***      424 : 		//		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      425 : 		g_commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 425
	clrb !LOWW(_g_commnunication_flag+0x00003)
	;***      426 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 426
	oneb a
.BB@LABEL@22_24:	; bb113
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 429
	ret
	;***      427 : 	}
	;***      428 : 	return 0U;
	;***      429 : }
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
_save_spec_ok:
	.DS (1)
	.SECTION .bss,BSS
_g_io_response:
	.DS (4)
_io_off:
	.DS (4)
_g_control_setting:
	.DS (1)
_flag_response:
	.DS (4)
