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
#@  compiled at Thu May 05 16:34:09 2022

	.EXTERN _rx_count
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
	.EXTERN __settingTime
	.EXTERN __settingNumber
	.PUBLIC _time_setting_p
	.PUBLIC _number_setting_p
	.PUBLIC _test_control_buf
	.PUBLIC _g_io_response
	.PUBLIC _io_off
	.PUBLIC _g_test_control
	.PUBLIC _save_spec_ok
	.PUBLIC _AlarmResponse
	.PUBLIC _SaveComfirmResponse
	.PUBLIC _RaspberryCommunication_nostop
	.EXTERN _ns_delay_ms
	.EXTERN _R_UART2_Stop
	.EXTERN _R_UART2_Start
	.EXTERN _R_UART2_Receive
	.PUBLIC _sendToRasPi_f
	.EXTERN _R_UART2_Send
	.PUBLIC _sendToRasPi_u32
	.PUBLIC _sendToRasPi_Revert_i32
	.PUBLIC _waitAlarmConfirm_stop
	.EXTERN _realTimeResponse
	.PUBLIC _waitAlarmConfirm_nonstop
	.PUBLIC _resetAlarm
	.PUBLIC _ResponseHandler
	.PUBLIC _ResponseWashingMode
	.PUBLIC _ResponseNextAnimation
	.PUBLIC _MonitoringStatus
	.PUBLIC _TestIndividual
	.PUBLIC _TestControl
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
	;***       17 : union Control_u g_test_control;
	;***       18 : int8_t save_spec_ok = 0;
	;***       19 : 
	;***       20 : // ------------------ LOCAL FUNCTION -------------------------------
	;***       21 : uint8_t ResponseHandler(void);
	;***       22 : void ResponseWashingMode(void);
	;***       23 : uint8_t ResponseNextAnimation(void);
	;***       24 : void MonitoringStatus(void);
	;***       25 : uint8_t TestIndividual(void);
	;***       26 : void TestControl(void);
	;***       27 : uint8_t SendTimeSetting(void);
	;***       28 : uint8_t SendNumberSetting(void);
	;***       29 : uint8_t GetAndSaveTimeSetting(void);
	;***       30 : uint8_t GetAndSaveNumberSetting(void);
	;***       31 : uint8_t TestMode(void);
	;***       32 : 
	;***       33 : /**
	;***       34 :  * After send
	;***       35 :  */
	;***       36 : void AlarmResponse(void){
	;***       37 : 	if(g_commnunication_flag.alarm_response_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 37
	mov a, !LOWW(_g_commnunication_flag+0x00008)
	ret
_SaveComfirmResponse:
	.STACK _SaveComfirmResponse = 4
	;***       38 : 		//TODO: Send alarm data
	;***       39 : 	}
	;***       40 : }
	;***       41 : void SaveComfirmResponse(void){
	;***       42 : 	if(g_commnunication_flag.save_confirm_flag && save_spec_ok != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 42
	cmp0 !LOWW(_g_commnunication_flag+0x0000C)
	bz $.BB@LABEL@2_3
.BB@LABEL@2_1:	; bb
	mov a, !LOWW(_save_spec_ok)
	cmp0 a
	bz $.BB@LABEL@2_3
.BB@LABEL@2_2:	; if_then_bb
	;***       43 : 		sendToRasPi_Revert_i32(H_SET, OK_ALL, (int32_t)(save_spec_ok));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 43
	sarw ax, 8+0x00000
	movw bc, ax
	sarw ax, 0x0F
	movw de, ax
	movw ax, #0x5300
	call $!_sendToRasPi_Revert_i32
	;***       44 : 		save_spec_ok = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 44
	clrb !LOWW(_save_spec_ok)
	;***       45 : 		g_commnunication_flag.save_confirm_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 45
	clrb !LOWW(_g_commnunication_flag+0x0000C)
.BB@LABEL@2_3:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 47
	ret
_RaspberryCommunication_nostop:
	.STACK _RaspberryCommunication_nostop = 4
	;***       46 : 	}
	;***       47 : }
	;***       48 : 
	;***       49 : //------------------- EXTERNAL FUNCTION ----------------------------------
	;***       50 : void RaspberryCommunication_nostop(void) {
	;***       51 : 	if(ResponseHandler()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 51
	call $!_ResponseHandler
	;***       52 : 
	;***       53 : 	}else{
	;***       54 : 
	;***       55 : 	}
	;***       56 : 	SendTimeSetting();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 56
	call $!_SendTimeSetting
	;***       57 : 	SendNumberSetting();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 57
	call $!_SendNumberSetting
	;***       58 : 	ResponseWashingMode();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 58
	call $!_ResponseWashingMode
	;***       59 : 	ResponseNextAnimation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 59
	call $!_ResponseNextAnimation
	;***       60 : 	TestControl();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 60
	call $!_TestControl
	;***       61 : 	GetAndSaveTimeSetting();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 61
	call $!_GetAndSaveTimeSetting
	;***       62 : 	GetAndSaveNumberSetting();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 62
	call $!_GetAndSaveNumberSetting
	;***       63 : 	SaveComfirmResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 63
	call $!_SaveComfirmResponse
	;***       64 : 	TestIndividual();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 64
	call $!_TestIndividual
	;***       65 : 	MonitoringStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 65
	call $!_MonitoringStatus
	;***       66 : 	TestMode();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 66
	call $!_TestMode
	;***       67 : 	//Auto reset UART after 5s not get data
	;***       68 : 	if (ns_delay_ms(&g_Tick.tickUartTimeout, 5000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 68
	clrw ax
	movw de, ax
	movw bc, #0x1388
	movw ax, #LOWW(_g_Tick+0x000B8)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@3_5
.BB@LABEL@3_1:	; if_else_bb16
	;***       69 : 		R_UART2_Stop();
	;***       70 : 		g_animation_queue = 0;
	;***       71 : 	} else if (STMK2 == 1U && ns_delay_ms(&g_Tick.tickUartTimeout, 50)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 71
	mov a, 0xFFFE5
	bf a.0, $.BB@LABEL@3_4
.BB@LABEL@3_2:	; bb
	clrw ax
	movw de, ax
	mov c, #0x32
	movw ax, #LOWW(_g_Tick+0x000B8)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_4
.BB@LABEL@3_3:	; if_then_bb33
	;***       72 : 		R_UART2_Start();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 72
	call !!_R_UART2_Start
	;***       73 : 		R_UART2_Receive(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 73
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	br !!_R_UART2_Receive
.BB@LABEL@3_4:	; return
	;***       74 : 	}
	;***       75 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 75
	ret
.BB@LABEL@3_5:	; if_then_bb15
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 69
	call !!_R_UART2_Stop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 70
	clrb !LOWW(_g_animation_queue)
	ret
_sendToRasPi_f:
	.STACK _sendToRasPi_f = 6
	;***       76 : 
	;***       77 : void sendToRasPi_f(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 77
	push hl
	;***       78 : 		float value) {
	;***       79 : 	uint8_t state = g_uart2_sendend;
	;***       80 : 	g_control_buffer_f.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 80
	mov !LOWW(_g_control_buffer_f), a
	mov a, x
	;***       81 : 	g_control_buffer_f.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 81
	mov !LOWW(_g_control_buffer_f+0x00001), a
	movw ax, bc
	;***       82 : 	g_control_buffer_f.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 82
	movw !LOWW(_g_control_buffer_f+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_f+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 79
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***       83 : 	R_UART2_Send((uint8_t*) &g_control_buffer_f, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 83
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_f)
	call !!_R_UART2_Send
.BB@LABEL@4_1:	; bb9
	mov a, [sp+0x00]
	;***       84 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 84
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@4_1
.BB@LABEL@4_2:	; return
	;***       85 : 		;
	;***       86 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 86
	pop hl
	ret
_sendToRasPi_u32:
	.STACK _sendToRasPi_u32 = 6
	;***       87 : void sendToRasPi_u32(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 87
	push hl
	;***       88 : 		uint32_t value) {
	;***       89 : 	uint8_t state = g_uart2_sendend;
	;***       90 : 	g_control_buffer_u32.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 90
	mov !LOWW(_g_control_buffer_u32), a
	mov a, x
	;***       91 : 	g_control_buffer_u32.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 91
	mov !LOWW(_g_control_buffer_u32+0x00001), a
	movw ax, bc
	;***       92 : 	g_control_buffer_u32.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 92
	movw !LOWW(_g_control_buffer_u32+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_u32+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 89
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***       93 : 	R_UART2_Send((uint8_t*) &g_control_buffer_u32, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 93
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_u32)
	call !!_R_UART2_Send
.BB@LABEL@5_1:	; bb9
	mov a, [sp+0x00]
	;***       94 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 94
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@5_1
.BB@LABEL@5_2:	; return
	;***       95 : 		;
	;***       96 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 96
	pop hl
	ret
_sendToRasPi_Revert_i32:
	.STACK _sendToRasPi_Revert_i32 = 10
	;***       97 : union Revert_Byte {
	;***       98 : 	struct {
	;***       99 : 		int8_t byte[4];
	;***      100 : 	}refined;
	;***      101 : 	int32_t raw;
	;***      102 : };
	;***      103 : void sendToRasPi_Revert_i32(enum UART_header_e head, enum Control_status type, int32_t value){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 103
	subw sp, #0x06
	;***      104 : 	union Revert_Byte data;
	;***      105 : 	uint8_t state = g_uart2_sendend;
	;***      106 : 	data.refined.byte[3] = value;
	;***      107 : 	data.refined.byte[2] = value >> 8;
	;***      108 : 	data.refined.byte[1] = value >> 16;
	;***      109 : 	data.refined.byte[0] = value >> 24;
	;***      110 : 	g_control_buffer_i32.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 110
	mov !LOWW(_g_control_buffer_i32), a
	mov a, x
	;***      111 : 	g_control_buffer_i32.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 111
	mov !LOWW(_g_control_buffer_i32+0x00001), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 105
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 106
	mov a, c
	mov [sp+0x05], a
	movw ax, bc
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 107
	mov [sp+0x04], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 108
	mov a, e
	mov [sp+0x03], a
	movw ax, de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 109
	mov [sp+0x02], a
	;***      112 : 	g_control_buffer_i32.set_value = data.raw;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 112
	movw ax, [sp+0x04]
	movw !LOWW(_g_control_buffer_i32+0x00004), ax
	movw ax, [sp+0x02]
	movw !LOWW(_g_control_buffer_i32+0x00002), ax
	;***      113 : 	R_UART2_Send((uint8_t*) &g_control_buffer_i32, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 113
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_i32)
	call !!_R_UART2_Send
.BB@LABEL@6_1:	; bb42
	mov a, [sp+0x00]
	;***      114 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 114
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@6_1
.BB@LABEL@6_2:	; return
	;***      115 : 		;
	;***      116 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 116
	addw sp, #0x06
	ret
_waitAlarmConfirm_stop:
	.STACK _waitAlarmConfirm_stop = 12
	;***      117 : /**
	;***      118 :  * Wait for Raspberry Pi send {H_CLEAR, alarm, x}
	;***      119 :  * @param alarm
	;***      120 :  * @param timeout_s Timeout if timeout_s != 0
	;***      121 :  */
	;***      122 : void waitAlarmConfirm_stop(enum Control_status alarm, uint8_t timeout_s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 122
	subw sp, #0x04
	push ax
	;***      123 : 	uint32_t _tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 123
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@7_1:	; bb22
	mov a, [sp+0x01]
	;***      124 : 	while (g_commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 124
	cmp a, !LOWW(_g_commnunication_flag+0x00007)
	bz $.BB@LABEL@7_4
.BB@LABEL@7_2:	; bb
	;***      125 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 125
	call !!_realTimeResponse
	mov a, [sp+0x00]
	;***      126 : 		if ((ns_delay_ms(&_tick, (uint32_t) timeout_s * 1000))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 126
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
	bz $.BB@LABEL@7_1
.BB@LABEL@7_3:	; bb
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@7_1
.BB@LABEL@7_4:	; bb31
	;***      127 : 				&& (timeout_s != 0)) {
	;***      128 : 			break;
	;***      129 : 		}
	;***      130 : 	}
	;***      131 : 	g_commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 131
	clrb !LOWW(_g_commnunication_flag+0x00007)
	addw sp, #0x06
	ret
_waitAlarmConfirm_nonstop:
	.STACK _waitAlarmConfirm_nonstop = 4
	;***      132 : }
	;***      133 : /**
	;***      134 :  *
	;***      135 :  * @param alarm
	;***      136 :  * @return 0 - Done; 1 - Still wait
	;***      137 :  */
	;***      138 : uint8_t waitAlarmConfirm_nonstop(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 138
	cmp a, !LOWW(_g_commnunication_flag+0x00007)
	;***      139 : 	if (g_commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 139
	bnz $.BB@LABEL@8_2
.BB@LABEL@8_1:	; if_break_bb
	;***      140 : 		return 1;
	;***      141 : 	}
	;***      142 : 	g_commnunication_flag.alarm_clear_flag = OK_ALL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 142
	clrb !LOWW(_g_commnunication_flag+0x00007)
	;***      143 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 143
	clrb a
	ret
.BB@LABEL@8_2:	; bb9
	;***      144 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 144
	oneb a
	ret
_resetAlarm:
	.STACK _resetAlarm = 4
	;***      145 : void resetAlarm(void) {
	;***      146 : 	g_commnunication_flag.alarm_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 146
	oneb !LOWW(_g_commnunication_flag+0x00007)
	ret
_ResponseHandler:
	.STACK _ResponseHandler = 6
	;***      147 : }
	;***      148 : //------------------End of EXTERNAL FUNCTION -----------------------------
	;***      149 : //------------------ Internal Function------------------------------------
	;***      150 : /**
	;***      151 :  * Send response Command to Raspberry Pi
	;***      152 :  * @return 1 - Have a response, 0 - Not response
	;***      153 :  */
	;***      154 : uint8_t ResponseHandler(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 154
	push hl
	;***      155 : 	if (g_commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 155
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@10_2
.BB@LABEL@10_1:	; bb26
	;***      156 : 		uint8_t state = g_uart2_sendend;
	;***      157 : 		if (g_machine_state.user == 2) {
	;***      158 : 			g_machine_state.user = 1;
	;***      159 : 		}
	;***      160 : 		R_UART2_Send(g_rx_data, 6);
	;***      161 : 		while (state == g_uart2_sendend) {
	;***      162 : 		}
	;***      163 : 		g_commnunication_flag.send_response_flag = 0;
	;***      164 : 		return 1U;
	;***      165 : 	}
	;***      166 : 	return 0U;
	;***      167 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 167
	clrb a
	pop hl
	ret
.BB@LABEL@10_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 156
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 157
	cmp !LOWW(_g_machine_state+0x0000D), #0x02
	sknz
.BB@LABEL@10_3:	; if_then_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 158
	oneb !LOWW(_g_machine_state+0x0000D)
.BB@LABEL@10_4:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 160
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@10_5:	; bb14
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 161
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@10_5
.BB@LABEL@10_6:	; bb22
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 163
	clrb !LOWW(_g_commnunication_flag)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 164
	oneb a
	pop hl
	ret
_ResponseWashingMode:
	.STACK _ResponseWashingMode = 4
	;***      168 : void ResponseWashingMode(void) {
	;***      169 : 	if (g_commnunication_flag.send_response_mode_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 169
	cmp !LOWW(_g_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_then_bb
	;***      170 : 		sendToRasPi_u32(H_READ, WASHING_MODE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 170
	mov a, !LOWW(_g_machine_mode)
	clrb x
	movw de, ax
	clrw bc
	movw ax, #0x5218
	call $!_sendToRasPi_u32
	;***      171 : 				(uint32_t) g_machine_mode << (8 * 3));
	;***      172 : //		sendToRasPi_u32(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
	;***      173 : 		g_commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 173
	clrb !LOWW(_g_commnunication_flag+0x00006)
.BB@LABEL@11_2:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 175
	ret
_ResponseNextAnimation:
	.STACK _ResponseNextAnimation = 4
	;***      174 : 	}
	;***      175 : }
	;***      176 : uint8_t ResponseNextAnimation(void) {
	;***      177 : 	if (g_commnunication_flag.send_response_flag == 0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 177
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@12_3
.BB@LABEL@12_1:	; bb
	cmp !LOWW(_g_commnunication_flag+0x0000B), #0x01
	bnz $.BB@LABEL@12_3
.BB@LABEL@12_2:	; if_then_bb
	;***      178 : 			&& g_commnunication_flag.next_animation_flag == 1) {
	;***      179 : 		sendToRasPi_u32(H_READ, NEXT_ANIMATION, (uint32_t) g_animation_queue << (8 * 3));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 179
	mov a, !LOWW(_g_animation_queue)
	clrb x
	movw de, ax
	clrw bc
	movw ax, #0x5213
	call $!_sendToRasPi_u32
	;***      180 : 		g_animation_queue -= 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 180
	dec !LOWW(_g_animation_queue)
	;***      181 : 		g_commnunication_flag.next_animation_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 181
	clrb !LOWW(_g_commnunication_flag+0x0000B)
	;***      182 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 182
	oneb a
	ret
.BB@LABEL@12_3:	; bb24
	;***      183 : 	}
	;***      184 : 	return 0U;
	;***      185 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 185
	clrb a
	ret
_MonitoringStatus:
	.STACK _MonitoringStatus = 6
	;***      186 : void MonitoringStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 186
	push hl
	;***      187 : 	if (g_commnunication_flag.send_response_status_flag == 1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 187
	cmp !LOWW(_g_commnunication_flag+0x00005), #0x01
	bnz $.BB@LABEL@13_6
.BB@LABEL@13_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@13_6
.BB@LABEL@13_2:	; if_then_bb
	;***      188 : 			&& g_commnunication_flag.send_response_flag == 0) {
	;***      189 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 189
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      190 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 190
	movw bc, #0x0012
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@13_3:	; bb20
	mov a, [sp+0x00]
	;***      191 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 191
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@13_5
.BB@LABEL@13_4:	; bb19
	;***      192 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 192
	call !!_R_WDT_Restart
	br $.BB@LABEL@13_3
.BB@LABEL@13_5:	; bb28
	;***      193 : 		}
	;***      194 : 		g_commnunication_flag.send_response_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 194
	clrb !LOWW(_g_commnunication_flag+0x00005)
.BB@LABEL@13_6:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 196
	ret
_TestIndividual:
	.STACK _TestIndividual = 4
	;***      195 : 	}
	;***      196 : }
	;***      197 : uint8_t TestIndividual(void) {
	;***      198 : 	if (g_commnunication_flag.recieve_status_flag == 2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 198
	cmp !LOWW(_g_commnunication_flag+0x00009), #0x02
	bnz $.BB@LABEL@14_5
.BB@LABEL@14_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@14_5
.BB@LABEL@14_2:	; bb.bb17_crit_edge
	clrb a
.BB@LABEL@14_3:	; bb17
	mov b, a
	;***      199 : 			&& g_commnunication_flag.send_response_flag == 0) {
	;***      200 : 		uint8_t *const _io_p = (uint8_t*) &g_io_response.Valve;
	;***      201 : 		for (uint8_t i = 0; i < 4; i++) {
	;***      202 : 			_io_p[i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 202
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(_g_io_response+0x00001)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 201
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@14_3
.BB@LABEL@14_4:	; bb34
	;***      203 : 		}
	;***      204 : 		OutputIO(&g_io_response);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 204
	movw ax, #LOWW(_g_io_response)
	call !!_OutputIO
	;***      205 : 		g_commnunication_flag.recieve_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 205
	clrb !LOWW(_g_commnunication_flag+0x00009)
	;***      206 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 206
	oneb a
	ret
.BB@LABEL@14_5:	; bb37
	;***      207 : 	}
	;***      208 : 	return 0U;
	;***      209 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 209
	clrb a
	ret
_TestControl:
	.STACK _TestControl = 8
	;***      210 : 
	;***      211 : void TestControl(void) {
	;***      212 : 	if (g_commnunication_flag.control_test_flag != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 212
	cmp0 !LOWW(_g_commnunication_flag+0x00012)
	bz $.BB@LABEL@15_13
.BB@LABEL@15_1:	; if_then_bb
	;***      213 : 		switch (g_commnunication_flag.control_test_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 213
	mov a, !LOWW(_g_commnunication_flag+0x00012)
	add a, #0xD9
	bz $.BB@LABEL@15_7
.BB@LABEL@15_2:	; if_then_bb
	dec a
	bz $.BB@LABEL@15_10
.BB@LABEL@15_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@15_8
.BB@LABEL@15_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@15_9
.BB@LABEL@15_5:	; if_then_bb
	cmp a, #0x02
	bnz $.BB@LABEL@15_12
.BB@LABEL@15_6:	; switch_clause_bb29
	;***      214 : 		case DRAINAGE_MODE_SET:
	;***      215 : 			sendToRasPi_u32(H_READ, DRAINAGE_MODE_SET,
	;***      216 : 					(uint32_t) g_test_control.raw.drain << (8 * 3));
	;***      217 : 			break;
	;***      218 : 		case POWER_ON_TEST_SET:
	;***      219 : 			sendToRasPi_u32(H_READ, POWER_ON_TEST_SET,
	;***      220 : 					(uint32_t) g_test_control.raw.power_on << (8 * 3));
	;***      221 : 			break;
	;***      222 : 		case WATER_FILTER_SET:
	;***      223 : 			sendToRasPi_u32(H_READ, WATER_FILTER_SET,
	;***      224 : 					(uint32_t) g_test_control.raw.filter << (8 * 3));
	;***      225 : 			break;
	;***      226 : 		case BIOMECTRIC_SET:
	;***      227 : 			sendToRasPi_u32(H_READ, BIOMECTRIC_SET,
	;***      228 : 					(uint32_t) g_test_control.raw.biomectric << (8 * 3));
	;***      229 : 			break;
	;***      230 : 		case CONTROL_SETTING:
	;***      231 : 			sendToRasPi_u32(H_READ, CONTROL_SETTING,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 231
	mov a, !LOWW(_g_test_control)
	clrb x
	movw de, ax
	mov x, #0x2C
	br $.BB@LABEL@15_11
.BB@LABEL@15_7:	; switch_clause_bb
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 215
	and a, !LOWW(_g_test_control)
	clrb x
	movw de, ax
	mov x, #0x27
	br $.BB@LABEL@15_11
.BB@LABEL@15_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 219
	mov a, !LOWW(_g_test_control)
	shr a, 0x01
	and a, #0x01
	clrb x
	movw de, ax
	mov x, #0x29
	br $.BB@LABEL@15_11
.BB@LABEL@15_9:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 223
	mov a, !LOWW(_g_test_control)
	shr a, 0x02
	and a, #0x01
	clrb x
	movw de, ax
	mov x, #0x2A
	br $.BB@LABEL@15_11
.BB@LABEL@15_10:	; switch_clause_bb23
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 227
	mov a, !LOWW(_g_test_control)
	shr a, 0x03
	and a, #0x01
	clrb x
	movw de, ax
	mov x, #0x28
.BB@LABEL@15_11:	; switch_clause_bb23
	clrw bc
	mov a, #0x52
	call $!_sendToRasPi_u32
.BB@LABEL@15_12:	; switch_break_bb
	;***      232 : 					(uint32_t) g_test_control.data << (8 * 3));
	;***      233 : 			break;
	;***      234 : 		default:
	;***      235 : 			break;
	;***      236 : 		}
	;***      237 : 		g_commnunication_flag.control_test_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 237
	clrb !LOWW(_g_commnunication_flag+0x00012)
.BB@LABEL@15_13:	; if_break_bb
	;***      238 : 	}
	;***      239 : 
	;***      240 : 	if (g_commnunication_flag.control_test_save_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 240
	cmp !LOWW(_g_commnunication_flag+0x00013), #0x01
	bnz $.BB@LABEL@15_15
.BB@LABEL@15_14:	; if_then_bb39
	clrw ax
	;***      241 : 		EE_SPI_Write((uint8_t*) &g_test_control.data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 241
	push ax
	incw ax
	push ax
	movw bc, #0x0029
	movw ax, #LOWW(_g_test_control)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      242 : 		NUMBER_SETTING_ADDRESS + numberSettingSize,
	;***      243 : 				sizeof(g_test_control.data));
	;***      244 : 		g_commnunication_flag.control_test_save_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 244
	clrb !LOWW(_g_commnunication_flag+0x00013)
.BB@LABEL@15_15:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 248
	ret
_TestMode:
	.STACK _TestMode = 4
	;***      245 : 	}
	;***      246 : 
	;***      247 : 
	;***      248 : }
	;***      249 : uint8_t TestMode(void){
	;***      250 : 	if (g_commnunication_flag.test_flag == TESTING_MODE_START) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 250
	cmp !LOWW(_g_commnunication_flag+0x0000A), #0x1A
	bnz $.BB@LABEL@16_2
.BB@LABEL@16_1:	; if_then_bb
	;***      251 : 		g_machine_state.test = g_commnunication_flag.test_flag;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 251
	mov a, !LOWW(_g_commnunication_flag+0x0000A)
	mov !LOWW(_g_machine_state+0x0000B), a
	;***      252 : 		g_commnunication_flag.test_flag = 0U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 252
	clrb !LOWW(_g_commnunication_flag+0x0000A)
	;***      253 : 		sendToRasPi_u32(H_SET, TESTING_MODE_START, 0x0000);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 253
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x531A
	call $!_sendToRasPi_u32
	;***      254 : 		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 254
	inc !LOWW(_rx_count)
	;***      255 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 255
	oneb a
	ret
.BB@LABEL@16_2:	; if_else_bb
	;***      256 : 	} else if (g_commnunication_flag.test_flag == TESTING_MODE_STOP) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 256
	cmp !LOWW(_g_commnunication_flag+0x0000A), #0x1C
	bnz $.BB@LABEL@16_4
.BB@LABEL@16_3:	; if_then_bb13
	;***      257 : 		g_machine_state.test = g_commnunication_flag.test_flag = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 257
	clrb !LOWW(_g_commnunication_flag+0x0000A)
	mov a, !LOWW(_g_commnunication_flag+0x0000A)
	mov !LOWW(_g_machine_state+0x0000B), a
	;***      258 : 		OutputIO(&io_off);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 258
	movw ax, #LOWW(_io_off)
	call !!_OutputIO
.BB@LABEL@16_4:	; bb17
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 261
	ret
_SendTimeSetting:
	.STACK _SendTimeSetting = 6
	;***      259 : 	}
	;***      260 : 	return 0;
	;***      261 : }
	;***      262 : 
	;***      263 : uint8_t SendTimeSetting(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 263
	push hl
	;***      264 : 	if (g_commnunication_flag.send_response_time_flag
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 264
	cmp0 !LOWW(_g_commnunication_flag+0x00001)
	bz $.BB@LABEL@17_6
.BB@LABEL@17_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@17_6
.BB@LABEL@17_2:	; if_then_bb
	;***      265 : 			&& (g_commnunication_flag.send_response_flag == 0)) {
	;***      266 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 266
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      267 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 267
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00094), a
	;***      268 : 				timeSettingSize - 1);
	;***      269 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 269
	movw bc, #0x0095
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@17_3:	; bb26
	mov a, [sp+0x00]
	;***      270 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 270
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_5
.BB@LABEL@17_4:	; bb25
	;***      271 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 271
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_3
.BB@LABEL@17_5:	; bb34
	;***      272 : 		}
	;***      273 : 		g_commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 273
	clrb !LOWW(_g_commnunication_flag+0x00001)
	;***      274 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 274
	oneb a
	pop hl
	ret
.BB@LABEL@17_6:	; bb37
	;***      275 : 	}
	;***      276 : 	return 0U;
	;***      277 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 277
	clrb a
	pop hl
	ret
_SendNumberSetting:
	.STACK _SendNumberSetting = 6
	;***      278 : uint8_t SendNumberSetting(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 278
	push hl
	;***      279 : 	if (g_commnunication_flag.send_response_number_flag
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 279
	cmp0 !LOWW(_g_commnunication_flag+0x00002)
	bz $.BB@LABEL@18_6
.BB@LABEL@18_1:	; bb
	cmp0 !LOWW(_g_commnunication_flag)
	bnz $.BB@LABEL@18_6
.BB@LABEL@18_2:	; if_then_bb
	;***      280 : 			&& (g_commnunication_flag.send_response_flag == 0)) {
	;***      281 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 281
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      282 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 282
	mov c, #0x28
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00028), a
	;***      283 : 				numberSettingSize - 1);
	;***      284 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 284
	movw bc, #0x0029
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@18_3:	; bb26
	mov a, [sp+0x00]
	;***      285 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 285
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@18_5
.BB@LABEL@18_4:	; bb25
	;***      286 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 286
	call !!_R_WDT_Restart
	br $.BB@LABEL@18_3
.BB@LABEL@18_5:	; bb34
	;***      287 : 		}
	;***      288 : 		g_commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 288
	clrb !LOWW(_g_commnunication_flag+0x00002)
	;***      289 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 289
	oneb a
	pop hl
	ret
.BB@LABEL@18_6:	; bb37
	;***      290 : 	}
	;***      291 : 	return 0U;
	;***      292 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 292
	clrb a
	pop hl
	ret
_GetAndSaveTimeSetting:
	.STACK _GetAndSaveTimeSetting = 10
	;***      293 : uint8_t GetAndSaveTimeSetting(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 293
	push hl
	clrb a
	;***      294 : 	if (g_commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 294
	cmp !LOWW(_g_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@19_16
.BB@LABEL@19_1:	; entry.bb56_crit_edge
	mov b, a
.BB@LABEL@19_2:	; bb56
	;***      295 : 		//		//Do not Edit this, must keep!!!!
	;***      296 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 296
	cmp a, #0x94
	bnc $.BB@LABEL@19_12
.BB@LABEL@19_3:	; bb
	;***      297 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 297
	and a, #0x03
	bz $.BB@LABEL@19_10
.BB@LABEL@19_4:	; bb
	dec a
	bz $.BB@LABEL@19_9
.BB@LABEL@19_5:	; bb
	dec a
	mov a, b
	bz $.BB@LABEL@19_8
.BB@LABEL@19_6:	; switch_clause_bb
	;***      298 : 			case 3:
	;***      299 : 				time_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 299
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFD)
.BB@LABEL@19_7:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@19_11
.BB@LABEL@19_8:	; switch_clause_bb19
	;***      300 : 				break;
	;***      301 : 			case 2:
	;***      302 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 302
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@19_7
.BB@LABEL@19_9:	; switch_clause_bb31
	;***      303 : 				break;
	;***      304 : 			case 1:
	;***      305 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 305
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@19_11
.BB@LABEL@19_10:	; switch_clause_bb42
	;***      306 : 				break;
	;***      307 : 			case 0:
	;***      308 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 308
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@19_11:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@19_2
.BB@LABEL@19_12:	; bb65
	;***      309 : 				break;
	;***      310 : 			default:
	;***      311 : 				break;
	;***      312 : 			}
	;***      313 : 		}
	;***      314 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 314
	mov a, !LOWW(_g_rx_data+0x00094)
	mov [sp+0x00], a
	mov !LOWW(__settingTime+0x00094), a
	;***      315 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 315
	mov c, #0x94
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp x, a
	bnz $.BB@LABEL@19_14
.BB@LABEL@19_13:	; if_then_bb88
	;***      316 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
	;***      317 : 			save_spec_ok = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 317
	oneb !LOWW(_save_spec_ok)
	;***      318 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 318
	movw de, #0x0096
	movw bc, #LOWW(__settingTime)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	clrw ax
	;***      319 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 319
	push ax
	mov x, #0x95
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	br $.BB@LABEL@19_15
.BB@LABEL@19_14:	; if_else_bb
	;***      320 : 					timeSettingSize);
	;***      321 : 		} else {
	;***      322 : 			save_spec_ok = -1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 322
	mov !LOWW(_save_spec_ok), #0xFF
.BB@LABEL@19_15:	; if_break_bb
	;***      323 : 		}
	;***      324 : 		//		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      325 : 		g_commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 325
	clrb !LOWW(_g_commnunication_flag+0x00004)
	;***      326 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 326
	oneb a
.BB@LABEL@19_16:	; bb94
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 329
	ret
_GetAndSaveNumberSetting:
	.STACK _GetAndSaveNumberSetting = 14
	;***      327 : 	}
	;***      328 : 	return 0U;
	;***      329 : }
	;***      330 : uint8_t GetAndSaveNumberSetting(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 330
	subw sp, #0x06
	clrb a
	;***      331 : 	if (g_commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 331
	cmp !LOWW(_g_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@20_24
.BB@LABEL@20_1:	; entry.bb56_crit_edge
	mov b, a
.BB@LABEL@20_2:	; bb56
	;***      332 : 		//		//Do not Edit this, must keep!!!!
	;***      333 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 333
	cmp a, #0x28
	bnc $.BB@LABEL@20_12
.BB@LABEL@20_3:	; bb
	;***      334 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 334
	and a, #0x03
	bz $.BB@LABEL@20_10
.BB@LABEL@20_4:	; bb
	dec a
	bz $.BB@LABEL@20_9
.BB@LABEL@20_5:	; bb
	dec a
	mov a, b
	bz $.BB@LABEL@20_8
.BB@LABEL@20_6:	; switch_clause_bb
	;***      335 : 			case 3:
	;***      336 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 336
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@20_7:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@20_11
.BB@LABEL@20_8:	; switch_clause_bb19
	;***      337 : 				break;
	;***      338 : 			case 2:
	;***      339 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 339
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@20_7
.BB@LABEL@20_9:	; switch_clause_bb31
	;***      340 : 				break;
	;***      341 : 			case 1:
	;***      342 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 342
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@20_11
.BB@LABEL@20_10:	; switch_clause_bb42
	;***      343 : 				break;
	;***      344 : 			case 0:
	;***      345 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 345
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@20_11:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@20_2
.BB@LABEL@20_12:	; bb65
	;***      346 : 				break;
	;***      347 : 			default:
	;***      348 : 				break;
	;***      349 : 			}
	;***      350 : 		}
	;***      351 : 		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 351
	mov c, #0x28
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov !LOWW(__settingNumber+0x00028), a
	;***      352 : 				numberSettingSize - 1);
	;***      353 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 353
	mov a, !LOWW(_g_rx_data+0x00028)
	mov [sp+0x00], a
	mov c, #0x28
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp a, x
	.bnz $!.BB@LABEL@20_22
.BB@LABEL@20_13:	; if_then_bb87
	;***      354 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      355 : 			save_spec_ok = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 355
	oneb !LOWW(_save_spec_ok)
	;***      356 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 356
	movw de, #0x002A
	movw bc, #LOWW(__settingNumber)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	clrw ax
	;***      357 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 357
	push ax
	mov x, #0x29
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	movw ax, #0x409B
	;***      358 : 					numberSettingSize);
	;***      359 : 			if (g_numberSetting.saltPumpVoltage > SALT_PUMP_MAX_VOLTAGE)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 359
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
.BB@LABEL@20_14:	; if_then_bb87
	clrb a
.BB@LABEL@20_15:	; if_then_bb87
	cmp0 x
	oneb x
	sknz
.BB@LABEL@20_16:	; if_then_bb87
	clrb x
.BB@LABEL@20_17:	; if_then_bb87
	or x, a
	bnz $.BB@LABEL@20_19
.BB@LABEL@20_18:	; if_then_bb94
	movw ax, #0x409B
	;***      360 : 				g_numberSetting.saltPumpVoltage = SALT_PUMP_MAX_VOLTAGE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 360
	movw !LOWW(_g_numberSetting+0x00026), ax
	movw ax, #0x020C
	movw !LOWW(_g_numberSetting+0x00024), ax
.BB@LABEL@20_19:	; if_break_bb
	movw ax, #0x40A0
	;***      361 : 			if (g_numberSetting.cvccCurrent > CVCC_MAX_VOLTAGE)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 361
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
	bz $.BB@LABEL@20_21
.BB@LABEL@20_20:	; if_then_bb99
	movw ax, #0x40A0
	;***      362 : 				g_numberSetting.cvccCurrent = CVCC_MAX_VOLTAGE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 362
	movw !LOWW(_g_numberSetting+0x00022), ax
	clrw ax
	movw !LOWW(_g_numberSetting+0x00020), ax
	movw [sp+0x02], ax
	movw ax, #0x40A0
	movw [sp+0x00], ax
.BB@LABEL@20_21:	; if_break_bb100
	movw ax, #0x40A0
	;***      363 : 			R_DAC0_Set_ConversionValue(
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 363
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
	;***      364 : 					(uint8_t) (g_numberSetting.cvccCurrent / CVCC_MAX_VOLTAGE
	;***      365 : 							* 255));
	;***      366 : 			R_DAC1_Set_ConversionValue(
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 366
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
	br $.BB@LABEL@20_23
.BB@LABEL@20_22:	; if_else_bb
	;***      367 : 					(uint8_t) (g_numberSetting.saltPumpVoltage
	;***      368 : 							/ SALT_PUMP_MAX_VOLTAGE * 255));
	;***      369 : 		} else {
	;***      370 : 			save_spec_ok = -1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 370
	mov !LOWW(_save_spec_ok), #0xFF
.BB@LABEL@20_23:	; if_break_bb109
	;***      371 : 		}
	;***      372 : 		//		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      373 : 		g_commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 373
	clrb !LOWW(_g_commnunication_flag+0x00003)
	;***      374 : 		return 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 374
	oneb a
.BB@LABEL@20_24:	; bb113
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/hwm/raspberry_pi_interface.c", 377
	ret
	;***      375 : 	}
	;***      376 : 	return 0U;
	;***      377 : }
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
	.DS (5)
_io_off:
	.DS (5)
_g_test_control:
	.DS (1)
