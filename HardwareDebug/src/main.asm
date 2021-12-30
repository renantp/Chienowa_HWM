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
#@   -o src/main.obj
#@   ../src/main.c
#@  compiled at Thu Dec 30 14:35:54 2021

	.EXTERN _rx_count
	.EXTERN _g_control_buffer_f
	.EXTERN _g_control_buffer_u32
	.EXTERN _g_systemTime
	.EXTERN _g_uart2_sendend
	.EXTERN _g_uart3_sendend
	.EXTERN _g_rx_data
	.EXTERN _commnunication_flag
	.PUBLIC _g_timerSetting
	.PUBLIC _g_numberSetting
	.PUBLIC _g_color
	.PUBLIC _g_pre_color
	.PUBLIC _g_flow_value
	.PUBLIC _g_alarm
	.PUBLIC _g_machine_state
	.PUBLIC _g_io_status
	.PUBLIC _g_mean_io_status
	.PUBLIC __settingTime
	.PUBLIC __settingNumber
	.PUBLIC _g_machine_mode
	.PUBLIC _btod
	.PUBLIC _g_Tick
	.PUBLIC _water_solfner_buf
	.PUBLIC _time_setting_p
	.PUBLIC _number_setting_p
	.PUBLIC _test_control_buf
	.PUBLIC __pre_flow_state
	.PUBLIC __flow_pulse
	.PUBLIC _handSensorLED
	.PUBLIC _handSensorLEDBlink
	.EXTERN _ns_delay_ms
	.PUBLIC _setting_default
	.PUBLIC _isAcidTankFull
	.PUBLIC _isAcidTankAlmostFull
	.PUBLIC _isAcidTankHasSomething
	.PUBLIC _isAcidTankEmpty
	.PUBLIC _isAlkalineTankFull
	.PUBLIC _isAlkalineTankAlmostFull
	.PUBLIC _isAlkalineTankHasSomething
	.PUBLIC _isAlkalineTankEmpty
	.PUBLIC _sendToRasPi_f
	.EXTERN _R_UART2_Send
	.PUBLIC _sendToRasPi_u32
	.PUBLIC _sendRS485
	.EXTERN _R_UART3_Send
	.PUBLIC _sendR485_7byte
	.PUBLIC _isThisCommand
	.PUBLIC _RaspberryResponse_nostop
	.EXTERN _R_WDT_Restart
	.EXTERN _crc8_1
	.EXTERN _EE_SPI_Write
	.PUBLIC _InitialOperationModeStart_nostop
	.PUBLIC _WaterSupplyOperation_nostop
	.PUBLIC _stop_waitAlarmConfirm
	.PUBLIC _nostop_waitAlarmConfirm
	.PUBLIC _resetAlarm
	.PUBLIC _Voltage1Check_waitReset
	.PUBLIC _Voltage2Check_nostop
	.PUBLIC _Voltage3Check_waitReset
	.PUBLIC _LowVoltageCheck_waitReset
	.PUBLIC _OverCurrentCheck_waitReset
	.PUBLIC _ElectrolyticOperation_nostop
	.PUBLIC _solenoidCheck
	.EXTERN _delay_ms
	.PUBLIC _saltWaterTankFullCheck
	.PUBLIC _saltWaterTankEmptyCheck
	.PUBLIC _acidWaterTankSkipCheck
	.PUBLIC _alkalineWaterTankSkipCheck
	.PUBLIC _FilterReplacementCheck
	.PUBLIC _WaterWashingMode_nostop
	.PUBLIC _HandWashingMode_nostop
	.PUBLIC _AcidWaterMode_nostop
	.PUBLIC _AlkalineWaterMode_nostop
	.PUBLIC _main_init_20211111
	.PUBLIC _userAuthHandler_nostop
	.PUBLIC _ElectrolyzeWaterGeneration_nostop
	.PUBLIC _isSV1andSV2Off8h
	.PUBLIC _CallanCleaningMode_nostop
	.PUBLIC _DrainageMode_nostop
	.PUBLIC _NormalMode_nostop
	.PUBLIC _TestMode_nostop
	.PUBLIC _main_loop_20211111
	.PUBLIC _electrolyticOperationON
	.PUBLIC _isElectrolyticOperationOFF_nostop
	.PUBLIC _realTimeResponse
	.PUBLIC _measureFlowSensor
	.PUBLIC _measureFlowSensor_nostop
	.PUBLIC _UpdateMachineStatus

	.SECTION .textf,TEXTF
_handSensorLED:
	.STACK _handSensorLED = 4
	;***        1 : /*
	;***        2 :  * main.c
	;***        3 :  *
	;***        4 :  *  Created on: 29 Oct 2021
	;***        5 :  *      Author: Renan
	;***        6 :  */
	;***        7 : 
	;***        8 : #include "r_cg_macrodriver.h"
	;***        9 : #include "r_cg_userdefine.h"
	;***       10 : #include "usr_setting_sheet.h"
	;***       11 : #include "usr_timer.h"
	;***       12 : #include "r_cg_cgc.h"
	;***       13 : #include "r_cg_port.h"
	;***       14 : #include "r_cg_serial.h"
	;***       15 : #include "r_cg_adc.h"
	;***       16 : #include "r_cg_timer.h"
	;***       17 : #include "r_cg_wdt.h"
	;***       18 : #include "main.h"
	;***       19 : 
	;***       20 : #define VCC (24.0)
	;***       21 : 
	;***       22 : struct Timer_Setting_s g_timerSetting = { 1000, 15 };
	;***       23 : struct Number_Setting_s g_numberSetting;
	;***       24 : enum HS_COLOR g_color, g_pre_color;
	;***       25 : float g_flow_value;
	;***       26 : union Alarm_Flag_u g_alarm;
	;***       27 : struct Machine_State_u g_machine_state;
	;***       28 : union IO_Status_u g_io_status, g_mean_io_status;
	;***       29 : 
	;***       30 : struct Timer_Setting_s _settingTime;
	;***       31 : struct Number_Setting_s _settingNumber;
	;***       32 : uint8_t g_machine_mode;
	;***       33 : union BytesToDouble {
	;***       34 : 	struct {
	;***       35 : 		uint8_t data[4];
	;***       36 : 	} refined;
	;***       37 : 	uint32_t raw;
	;***       38 : } btod;
	;***       39 : struct Tick_s g_Tick;
	;***       40 : 
	;***       41 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 41
	mov !LOWW(_g_color), a
	;***       42 : 	g_color = color;
	;***       43 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 43
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       44 : 		switch (color) {
	;***       45 : 		case RED:
	;***       46 : 			O_HS_ICL_PIN = 1;
	;***       47 : 			O_HS_IDA_PIN = 0;
	;***       48 : 			break;
	;***       49 : 		case BLUE:
	;***       50 : 			O_HS_ICL_PIN = 0;
	;***       51 : 			O_HS_IDA_PIN = 0;
	;***       52 : 			break;
	;***       53 : 		case WHITE:
	;***       54 : 			O_HS_ICL_PIN = 0;
	;***       55 : 			O_HS_IDA_PIN = 1;
	;***       56 : 			break;
	;***       57 : 		default:
	;***       58 : 			O_HS_ICL_PIN = 1;
	;***       59 : 			O_HS_IDA_PIN = 1;
	;***       60 : 			break;
	;***       61 : 		}
	;***       62 : 		g_pre_color = g_color;
	;***       63 : 	}
	;***       64 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 64
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 44
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 58
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 46
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 47
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 50
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 51
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 54
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 62
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_handSensorLEDBlink:
	.STACK _handSensorLEDBlink = 6
	;***       65 : void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	push hl
	mov [sp+0x00], a
	;***       66 : 	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	movw ax, #LOWW(_g_Tick+0x0000C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; return
	;***       67 : 		g_color = g_color == color ? BLACK : color;
	;***       68 : 		handSensorLED(g_color);
	;***       69 : 	}
	;***       70 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	pop hl
	ret
.BB@LABEL@2_2:	; if_then_bb
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	cmp a, !LOWW(_g_color)
	sknz
.BB@LABEL@2_3:	; if_then_bb.bb15_crit_edge
	clrb a
.BB@LABEL@2_4:	; bb15
	mov !LOWW(_g_color), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	pop hl
	br $_handSensorLED
_setting_default:
	.STACK _setting_default = 4
	;***       71 : void setting_default(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw ax, #0x4086
	;***       72 : 	g_numberSetting.upperVoltage1 = 4.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x6666
	movw !LOWW(_g_numberSetting), ax
	movw ax, #0x4060
	;***       73 : 	g_numberSetting.upperVoltage2 = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x00006), ax
	;***       74 : 	g_numberSetting.upperVoltage3 = 2.2;
	;***       75 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       76 : 	g_numberSetting.upperCurrent = 4.3;
	;***       77 : 	g_numberSetting.lowerCurrent = 0.2;
	;***       78 : 	g_numberSetting.upperFlow = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***       79 : 	g_numberSetting.lowerFlow = 0.4;
	;***       80 : 
	;***       81 : 	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       82 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       83 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       84 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       85 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***       86 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***       87 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***       88 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***       89 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***       90 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x0006A), ax
	;***       91 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
	movw !LOWW(_g_timerSetting+0x0006E), ax
	;***       92 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	movw !LOWW(_g_timerSetting+0x00072), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_numberSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F00
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw ax, #0x4089
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_numberSetting+0x00016), ax
	mov x, #0xCC
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x00008), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00028), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x00038), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x00030), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x00034), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x00040), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x00068), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
	movw !LOWW(_g_timerSetting+0x0006C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	movw !LOWW(_g_timerSetting+0x00070), ax
	ret
_isAcidTankFull:
	.STACK _isAcidTankFull = 6
	;***       93 : }
	;***       94 : 
	;***       95 : uint8_t isAcidTankFull(void) {
	;***       96 : 	if (I_ACID_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 96
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@4_5
.BB@LABEL@4_1:	; if_then_bb
	;***       97 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 97
	movw ax, !LOWW(_g_timerSetting+0x00058)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@4_4
.BB@LABEL@4_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].5, $.BB@LABEL@4_4
.BB@LABEL@4_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 108
	ret
.BB@LABEL@4_4:	; if_then_bb25
	;***       98 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***       99 : 				|| (g_mean_io_status.refined.AcidHighLevel == 1)) {
	;***      100 : 			g_mean_io_status.refined.AcidHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 100
	set1 !LOWW(_g_mean_io_status).5
	;***      101 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 101
	oneb a
	ret
.BB@LABEL@4_5:	; if_else_bb
	;***      102 : 		}
	;***      103 : 	} else {
	;***      104 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 104
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	;***      105 : 		g_mean_io_status.refined.AcidHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 105
	clr1 !LOWW(_g_mean_io_status).5
	br $.BB@LABEL@4_3
_isAcidTankAlmostFull:
	.STACK _isAcidTankAlmostFull = 6
	;***      106 : 	}
	;***      107 : 	return 0;
	;***      108 : }
	;***      109 : uint8_t isAcidTankAlmostFull(void) {
	;***      110 : 	if (I_ACID_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 110
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@5_5
.BB@LABEL@5_1:	; if_then_bb
	;***      111 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 111
	movw ax, !LOWW(_g_timerSetting+0x00054)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00056)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00060)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@5_4
.BB@LABEL@5_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].4, $.BB@LABEL@5_4
.BB@LABEL@5_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 122
	ret
.BB@LABEL@5_4:	; if_then_bb25
	;***      112 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      113 : 				|| (g_mean_io_status.refined.AcidLowLevel == 1)) {
	;***      114 : 			g_mean_io_status.refined.AcidLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 114
	set1 !LOWW(_g_mean_io_status).4
	;***      115 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 115
	oneb a
	ret
.BB@LABEL@5_5:	; if_else_bb
	;***      116 : 		}
	;***      117 : 	} else {
	;***      118 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 118
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00062), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00060), ax
	;***      119 : 		g_mean_io_status.refined.AcidLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 119
	clr1 !LOWW(_g_mean_io_status).4
	br $.BB@LABEL@5_3
_isAcidTankHasSomething:
	.STACK _isAcidTankHasSomething = 6
	;***      120 : 	}
	;***      121 : 	return 0;
	;***      122 : }
	;***      123 : uint8_t isAcidTankHasSomething(void) {
	;***      124 : 	if (I_ACID_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 124
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@6_5
.BB@LABEL@6_1:	; if_then_bb
	;***      125 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 125
	movw ax, !LOWW(_g_timerSetting+0x00050)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00052)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00064)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@6_4
.BB@LABEL@6_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].3, $.BB@LABEL@6_4
.BB@LABEL@6_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 136
	ret
.BB@LABEL@6_4:	; if_then_bb25
	;***      126 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      127 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 1)) {
	;***      128 : 			g_mean_io_status.refined.AcidEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
	set1 !LOWW(_g_mean_io_status).3
	;***      129 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	oneb a
	ret
.BB@LABEL@6_5:	; if_else_bb
	;***      130 : 		}
	;***      131 : 	} else {
	;***      132 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 132
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00066), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00064), ax
	;***      133 : 		isAcidTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	call $!_isAcidTankEmpty
	br $.BB@LABEL@6_3
_isAcidTankEmpty:
	.STACK _isAcidTankEmpty = 6
	;***      134 : 	}
	;***      135 : 	return 0;
	;***      136 : }
	;***      137 : uint8_t isAcidTankEmpty(void) {
	;***      138 : 	if (I_ACID_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@7_2
.BB@LABEL@7_1:	; if_else_bb
	;***      139 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
	;***      140 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      141 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 0)) {
	;***      142 : 			g_mean_io_status.refined.AcidEmptyLevel = 0;
	;***      143 : 			return 1;
	;***      144 : 		}
	;***      145 : 	} else {
	;***      146 : 		g_Tick.tickAcidLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 146
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00068), ax
	;***      147 : 		isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	call $!_isAcidTankHasSomething
	br $.BB@LABEL@7_4
.BB@LABEL@7_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 139
	movw ax, !LOWW(_g_timerSetting+0x0005C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00068)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@7_5
.BB@LABEL@7_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].3, $.BB@LABEL@7_5
.BB@LABEL@7_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 150
	ret
.BB@LABEL@7_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 142
	clr1 !LOWW(_g_mean_io_status).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	oneb a
	ret
_isAlkalineTankFull:
	.STACK _isAlkalineTankFull = 6
	;***      148 : 	}
	;***      149 : 	return 0;
	;***      150 : }
	;***      151 : uint8_t isAlkalineTankFull(void) {
	;***      152 : 	if (I_ALKALI_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@8_5
.BB@LABEL@8_1:	; if_then_bb
	;***      153 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	movw ax, !LOWW(_g_timerSetting+0x00058)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0006C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].2, $.BB@LABEL@8_4
.BB@LABEL@8_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 164
	ret
.BB@LABEL@8_4:	; if_then_bb25
	;***      154 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***      155 : 				|| (g_mean_io_status.refined.AlkalineHighLevel == 1)) {
	;***      156 : 			g_mean_io_status.refined.AlkalineHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 156
	set1 !LOWW(_g_mean_io_status).2
	;***      157 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	oneb a
	ret
.BB@LABEL@8_5:	; if_else_bb
	;***      158 : 		}
	;***      159 : 	} else {
	;***      160 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0006C), ax
	;***      161 : 		g_mean_io_status.refined.AlkalineHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 161
	clr1 !LOWW(_g_mean_io_status).2
	br $.BB@LABEL@8_3
_isAlkalineTankAlmostFull:
	.STACK _isAlkalineTankAlmostFull = 6
	;***      162 : 	}
	;***      163 : 	return 0;
	;***      164 : }
	;***      165 : uint8_t isAlkalineTankAlmostFull(void) {
	;***      166 : 	if (I_ALKALI_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@9_5
.BB@LABEL@9_1:	; if_then_bb
	;***      167 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 167
	movw ax, !LOWW(_g_timerSetting+0x00054)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00056)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00070)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_4
.BB@LABEL@9_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].1, $.BB@LABEL@9_4
.BB@LABEL@9_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 178
	ret
.BB@LABEL@9_4:	; if_then_bb25
	;***      168 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      169 : 				|| (g_mean_io_status.refined.AlkalineLowLevel == 1)) {
	;***      170 : 			g_mean_io_status.refined.AlkalineLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
	set1 !LOWW(_g_mean_io_status).1
	;***      171 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	oneb a
	ret
.BB@LABEL@9_5:	; if_else_bb
	;***      172 : 		}
	;***      173 : 	} else {
	;***      174 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00072), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00070), ax
	;***      175 : 		g_mean_io_status.refined.AlkalineLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	clr1 !LOWW(_g_mean_io_status).1
	br $.BB@LABEL@9_3
_isAlkalineTankHasSomething:
	.STACK _isAlkalineTankHasSomething = 6
	;***      176 : 	}
	;***      177 : 	return 0;
	;***      178 : }
	;***      179 : uint8_t isAlkalineTankHasSomething(void) {
	;***      180 : 	if (I_ALKALI_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@10_5
.BB@LABEL@10_1:	; if_then_bb
	;***      181 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	movw ax, !LOWW(_g_timerSetting+0x00050)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00052)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00074)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@10_4
.BB@LABEL@10_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].0, $.BB@LABEL@10_4
.BB@LABEL@10_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 192
	ret
.BB@LABEL@10_4:	; if_then_bb25
	;***      182 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      183 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 1)) {
	;***      184 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	set1 !LOWW(_g_mean_io_status).0
	;***      185 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	oneb a
	ret
.BB@LABEL@10_5:	; if_else_bb
	;***      186 : 		}
	;***      187 : 	} else {
	;***      188 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00076), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00074), ax
	;***      189 : 		isAlkalineTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 189
	call $!_isAlkalineTankEmpty
	br $.BB@LABEL@10_3
_isAlkalineTankEmpty:
	.STACK _isAlkalineTankEmpty = 6
	;***      190 : 	}
	;***      191 : 	return 0;
	;***      192 : }
	;***      193 : uint8_t isAlkalineTankEmpty(void) {
	;***      194 : 	if (I_ALKALI_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_else_bb
	;***      195 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
	;***      196 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      197 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 0)) {
	;***      198 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 0;
	;***      199 : 			return 1;
	;***      200 : 		}
	;***      201 : 	} else {
	;***      202 : 		g_Tick.tickAlkalineLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00078), ax
	;***      203 : 		isAlkalineTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 203
	call $!_isAlkalineTankHasSomething
	br $.BB@LABEL@11_4
.BB@LABEL@11_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	movw ax, !LOWW(_g_timerSetting+0x0005C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0005E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00078)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@11_5
.BB@LABEL@11_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].0, $.BB@LABEL@11_5
.BB@LABEL@11_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 206
	ret
.BB@LABEL@11_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	clr1 !LOWW(_g_mean_io_status).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	oneb a
	ret
_sendToRasPi_f:
	.STACK _sendToRasPi_f = 6
	;***      204 : 	}
	;***      205 : 	return 0;
	;***      206 : }
	;***      207 : 
	;***      208 : //----------------------Begin code 11112021--------------------------------------
	;***      209 : void sendToRasPi_f(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 209
	push hl
	;***      210 : 		float value) {
	;***      211 : 	uint8_t state = g_uart2_sendend;
	;***      212 : 	g_control_buffer_f.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	mov !LOWW(_g_control_buffer_f), a
	mov a, x
	;***      213 : 	g_control_buffer_f.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
	mov !LOWW(_g_control_buffer_f+0x00001), a
	movw ax, bc
	;***      214 : 	g_control_buffer_f.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	movw !LOWW(_g_control_buffer_f+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_f+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 211
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      215 : 	R_UART2_Send((uint8_t*) &g_control_buffer_f, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_f)
	call !!_R_UART2_Send
.BB@LABEL@12_1:	; bb9
	mov a, [sp+0x00]
	;***      216 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@12_1
.BB@LABEL@12_2:	; return
	;***      217 : 		;
	;***      218 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	pop hl
	ret
_sendToRasPi_u32:
	.STACK _sendToRasPi_u32 = 6
	;***      219 : void sendToRasPi_u32(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	push hl
	;***      220 : 		uint32_t value) {
	;***      221 : 	uint8_t state = g_uart2_sendend;
	;***      222 : 	g_control_buffer_u32.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	mov !LOWW(_g_control_buffer_u32), a
	mov a, x
	;***      223 : 	g_control_buffer_u32.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	mov !LOWW(_g_control_buffer_u32+0x00001), a
	movw ax, bc
	;***      224 : 	g_control_buffer_u32.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 224
	movw !LOWW(_g_control_buffer_u32+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_u32+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      225 : 	R_UART2_Send((uint8_t*) &g_control_buffer_u32, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_u32)
	call !!_R_UART2_Send
.BB@LABEL@13_1:	; bb9
	mov a, [sp+0x00]
	;***      226 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 226
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@13_1
.BB@LABEL@13_2:	; return
	;***      227 : 		;
	;***      228 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	pop hl
	ret
_sendRS485:
	.STACK _sendRS485 = 6
	;***      229 : struct UART3_Buffer_s {
	;***      230 : 	uint8_t busy;
	;***      231 : 	uint8_t head; // 1 byte
	;***      232 : 	uint8_t set_number; // 1 byte
	;***      233 : 	uint8_t set_value[4]; // 4 byte
	;***      234 : } water_solfner_buf;
	;***      235 : void sendRS485(uint8_t busy, uint8_t head, uint8_t type, uint32_t value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 235
	push hl
	;***      236 : 	uint8_t state = g_uart3_sendend;
	;***      237 : 	btod.raw = value;
	;***      238 : 	water_solfner_buf.busy = busy;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 238
	mov !LOWW(_water_solfner_buf), a
	mov a, x
	;***      239 : 	water_solfner_buf.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
	mov !LOWW(_water_solfner_buf+0x00001), a
	mov a, c
	;***      240 : 	water_solfner_buf.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	mov !LOWW(_water_solfner_buf+0x00002), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	movw ax, [sp+0x08]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	movw !LOWW(_btod+0x00002), ax
	movw ax, [sp+0x06]
	movw !LOWW(_btod), ax
	clrb a
.BB@LABEL@14_1:	; bb
	mov b, a
	;***      241 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      242 : 		water_solfner_buf.set_value[i] = btod.refined.data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 242
	mov a, LOWW(_btod)[b]
	mov LOWW(_water_solfner_buf+0x00003)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@14_1
.BB@LABEL@14_2:	; bb25
	;***      243 : 	}
	;***      244 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	set1 0xFFF00.0
	;***      245 : 	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 245
	movw bc, #0x0007
	movw ax, #LOWW(_water_solfner_buf)
	call !!_R_UART3_Send
.BB@LABEL@14_3:	; bb28
	mov a, [sp+0x00]
	;***      246 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@14_3
.BB@LABEL@14_4:	; return
	;***      247 : 		;
	;***      248 : 
	;***      249 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	pop hl
	ret
_sendR485_7byte:
	.STACK _sendR485_7byte = 16
	;***      250 : void sendR485_7byte(uint8_t addr, uint8_t head, uint8_t *val5) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	subw sp, #0x0A
	mov h, a
	push bc
	pop de
	;***      251 : 	uint8_t buf[7] = { addr, head };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	mov [sp+0x06], #0x00
	mov [sp+0x05], #0x00
	mov [sp+0x04], #0x00
	mov [sp+0x03], #0x00
	mov [sp+0x02], #0x00
	mov [sp+0x01], #0x00
	mov [sp+0x00], #0x00
	mov a, h
	mov [sp+0x00], a
	mov a, x
	mov [sp+0x01], a
	clrb b
	;***      252 : 	uint8_t state = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 252
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x07], a
.BB@LABEL@15_1:	; bb
	movw ax, sp
	movw [sp+0x08], ax
	mov a, b
	add a, #0x02
	mov c, a
	;***      253 : 	for (uint8_t i = 2; i < 7; i++) {
	;***      254 : 		buf[i] = val5[i - 2];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	shrw ax, 8+0x00000
	addw ax, de
	decw ax
	decw ax
	movw hl, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	inc b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	mov a, [hl]
	mov h, a
	movw ax, [sp+0x08]
	xchw ax, hl
	mov [hl+c], a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	cmp a, #0x05
	bnz $.BB@LABEL@15_1
.BB@LABEL@15_2:	; bb31
	;***      255 : 	}
	;***      256 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	set1 0xFFF00.0
	;***      257 : 	R_UART3_Send(buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
	movw bc, #0x0007
	movw ax, sp
	call !!_R_UART3_Send
.BB@LABEL@15_3:	; bb35
	mov a, [sp+0x07]
	;***      258 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@15_3
.BB@LABEL@15_4:	; return
	;***      259 : 		;
	;***      260 : 
	;***      261 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 261
	addw sp, #0x0A
	ret
_isThisCommand:
	.STACK _isThisCommand = 6
	;***      262 : uint8_t isThisCommand(uint8_t *input_buf, enum UART_header_e header,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	push hl
	movw hl, ax
	mov a, b
	mov [sp+0x00], a
	clrb a
	mov b, a
.BB@LABEL@16_1:	; bb
	;***      263 : 		enum Control_status control, uint32_t data) {
	;***      264 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      265 : 		btod.refined.data[i] = input_buf[2 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	shrw ax, 8+0x00000
	addw ax, hl
	incw ax
	incw ax
	movw de, ax
	mov a, [de]
	mov LOWW(_btod)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@16_1
.BB@LABEL@16_2:	; bb23
	mov a, c
	;***      266 : 	}
	;***      267 : 
	;***      268 : 	if ((input_buf[0] == header) && (input_buf[1] == control)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 268
	cmp a, [hl]
	bnz $.BB@LABEL@16_10
.BB@LABEL@16_3:	; bb32
	mov a, [sp+0x00]
	cmp a, [hl+0x01]
	bnz $.BB@LABEL@16_7
.BB@LABEL@16_4:	; bb47
	movw ax, [sp+0x08]
	cmpw ax, !LOWW(_btod+0x00002)
	movw ax, [sp+0x06]
	sknz
.BB@LABEL@16_5:	; bb47
	cmpw ax, !LOWW(_btod)
.BB@LABEL@16_6:	; bb47
	;***      269 : 			&& (btod.raw == data))
	;***      270 : 		return 2;
	;***      271 : 	else if ((input_buf[0] == header) && (input_buf[1] == control))
	;***      272 : 		return 1;
	;***      273 : 	else
	;***      274 : 		return 0;
	;***      275 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	mov a, #0x02
	bz $.BB@LABEL@16_9
.BB@LABEL@16_7:	; bb70
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 271
	cmp a, [hl+0x01]
	oneb a
	skz
.BB@LABEL@16_8:	; bb70
	clrb a
.BB@LABEL@16_9:	; bb70
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	ret
.BB@LABEL@16_10:	; if_else_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 274
	clrb a
	br $.BB@LABEL@16_9
_RaspberryResponse_nostop:
	.STACK _RaspberryResponse_nostop = 10
	;***      276 : /**
	;***      277 :  * Handle all response to Raspberry command.
	;***      278 :  */
	;***      279 : uint8_t *const time_setting_p = (uint8_t*) &_settingTime;
	;***      280 : uint8_t *const number_setting_p = (uint8_t*) &_settingNumber;
	;***      281 : struct UART_Buffer_float_s test_control_buf = { H_READ, READ_TIME, 0x000000ff };
	;***      282 : void RaspberryResponse_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	push hl
	;***      283 : 	//TODO: I'm doing here
	;***      284 : 	if (commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	cmp0 !LOWW(_commnunication_flag)
	bz $.BB@LABEL@17_7
.BB@LABEL@17_1:	; if_then_bb
	;***      285 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      286 : 		if (g_machine_state.user == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 286
	cmp !LOWW(_g_machine_state+0x0000B), #0x02
	sknz
.BB@LABEL@17_2:	; if_then_bb20
	;***      287 : 			g_machine_state.user = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	oneb !LOWW(_g_machine_state+0x0000B)
.BB@LABEL@17_3:	; if_break_bb
	;***      288 : 		}
	;***      289 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@17_4:	; bb22
	mov a, [sp+0x00]
	;***      290 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_6
.BB@LABEL@17_5:	; bb
	;***      291 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_4
.BB@LABEL@17_6:	; bb30
	;***      292 : 		}
	;***      293 : 		commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	clrb !LOWW(_commnunication_flag)
.BB@LABEL@17_7:	; if_break_bb31
	;***      294 : 	}
	;***      295 : 	if (commnunication_flag.send_response_mode_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 295
	cmp !LOWW(_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@17_9
.BB@LABEL@17_8:	; if_then_bb37
	;***      296 : 		sendToRasPi_u32(H_READ, WASHING_MODE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
	mov a, !LOWW(_g_machine_mode)
	clrb x
	movw de, ax
	clrw bc
	movw ax, #0x5218
	call $!_sendToRasPi_u32
	;***      297 : 				(uint32_t) g_machine_mode << (8 * 3));
	;***      298 : //		sendToRasPi_u32(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
	;***      299 : 		commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	clrb !LOWW(_commnunication_flag+0x00006)
.BB@LABEL@17_9:	; if_break_bb41
	;***      300 : 	}
	;***      301 : 	if (commnunication_flag.send_respone_status_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
	cmp0 !LOWW(_commnunication_flag+0x00005)
	bz $.BB@LABEL@17_14
.BB@LABEL@17_10:	; if_then_bb47
	;***      302 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      303 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	movw bc, #0x0005
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@17_11:	; bb53
	mov a, [sp+0x00]
	;***      304 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_13
.BB@LABEL@17_12:	; bb52
	;***      305 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_11
.BB@LABEL@17_13:	; bb61
	;***      306 : 		}
	;***      307 : 		commnunication_flag.send_respone_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	clrb !LOWW(_commnunication_flag+0x00005)
.BB@LABEL@17_14:	; if_break_bb62
	;***      308 : 	}
	;***      309 : 	if (commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	cmp0 !LOWW(_commnunication_flag+0x00001)
	bz $.BB@LABEL@17_19
.BB@LABEL@17_15:	; if_then_bb68
	;***      310 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 310
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      311 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x0008C), a
	;***      312 : 				timeSettingSize - 1);
	;***      313 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	movw bc, #0x008D
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@17_16:	; bb79
	mov a, [sp+0x00]
	;***      314 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 314
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_18
.BB@LABEL@17_17:	; bb78
	;***      315 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_16
.BB@LABEL@17_18:	; bb87
	;***      316 : 		}
	;***      317 : 		commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 317
	clrb !LOWW(_commnunication_flag+0x00001)
.BB@LABEL@17_19:	; if_break_bb88
	;***      318 : 	}
	;***      319 : 	if (commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 319
	cmp0 !LOWW(_commnunication_flag+0x00002)
	bz $.BB@LABEL@17_24
.BB@LABEL@17_20:	; if_then_bb94
	;***      320 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 320
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      321 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 321
	mov c, #0x24
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00024), a
	;***      322 : 				numberSettingSize - 1);
	;***      323 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 323
	movw bc, #0x0025
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@17_21:	; bb105
	mov a, [sp+0x00]
	;***      324 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 324
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_23
.BB@LABEL@17_22:	; bb104
	;***      325 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_21
.BB@LABEL@17_23:	; bb113
	;***      326 : 		}
	;***      327 : 		commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 327
	clrb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@17_24:	; if_break_bb114
	;***      328 : 	}
	;***      329 : 	if (commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 329
	cmp !LOWW(_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@17_40
.BB@LABEL@17_25:	; if_break_bb114.bb171_crit_edge
	clrb a
	mov b, a
.BB@LABEL@17_26:	; bb171
	;***      330 : //		//Do not Edit this, must keep!!!!
	;***      331 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 331
	cmp a, #0x8C
	bnc $.BB@LABEL@17_36
.BB@LABEL@17_27:	; bb121
	;***      332 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 332
	and a, #0x03
	bz $.BB@LABEL@17_34
.BB@LABEL@17_28:	; bb121
	dec a
	bz $.BB@LABEL@17_33
.BB@LABEL@17_29:	; bb121
	dec a
	mov a, b
	bz $.BB@LABEL@17_32
.BB@LABEL@17_30:	; switch_clause_bb
	;***      333 : //			case 3:
	;***      334 : //				pointer0[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
	;***      335 : //				break;
	;***      336 : //			case 2:
	;***      337 : //				pointer0[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
	;***      338 : //				break;
	;***      339 : //			case 1:
	;***      340 : //				pointer0[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
	;***      341 : //				break;
	;***      342 : //			case 0:
	;***      343 : //				pointer0[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
	;***      344 : //				break;
	;***      345 : //			default:
	;***      346 : //				break;
	;***      347 : 			case 3:
	;***      348 : 				time_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 348
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFD)
.BB@LABEL@17_31:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@17_35
.BB@LABEL@17_32:	; switch_clause_bb135
	;***      349 : 				break;
	;***      350 : 			case 2:
	;***      351 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 351
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@17_31
.BB@LABEL@17_33:	; switch_clause_bb146
	;***      352 : 				break;
	;***      353 : 			case 1:
	;***      354 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 354
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@17_35
.BB@LABEL@17_34:	; switch_clause_bb157
	;***      355 : 				break;
	;***      356 : 			case 0:
	;***      357 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 357
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@17_35:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@17_26
.BB@LABEL@17_36:	; bb180
	;***      358 : 				break;
	;***      359 : 			default:
	;***      360 : 				break;
	;***      361 : 			}
	;***      362 : 		}
	;***      363 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 363
	mov a, !LOWW(_g_rx_data+0x0008C)
	mov [sp+0x00], a
	mov !LOWW(__settingTime+0x0008C), a
	;***      364 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 364
	mov c, #0x8C
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp x, a
	bnz $.BB@LABEL@17_38
.BB@LABEL@17_37:	; if_then_bb203
	;***      365 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
	;***      366 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 366
	movw de, #0x008E
	movw bc, #LOWW(__settingTime)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	clrw ax
	;***      367 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 367
	push ax
	mov x, #0x8D
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      368 : 					timeSettingSize);
	;***      369 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 369
	clrb x
	br $.BB@LABEL@17_39
.BB@LABEL@17_38:	; if_else_bb
	;***      370 : 		} else {
	;***      371 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 371
	mov x, #0x16
.BB@LABEL@17_39:	; if_else_bb
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi_f
	;***      372 : 		}
	;***      373 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      374 : 		commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 374
	clrb !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@17_40:	; if_break_bb207
	;***      375 : 	}
	;***      376 : 
	;***      377 : 	if (commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 377
	cmp !LOWW(_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@17_56
.BB@LABEL@17_41:	; if_break_bb207.bb266_crit_edge
	clrb a
	mov b, a
.BB@LABEL@17_42:	; bb266
	;***      378 : //		//Do not Edit this, must keep!!!!
	;***      379 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 379
	cmp a, #0x24
	bnc $.BB@LABEL@17_52
.BB@LABEL@17_43:	; bb214
	;***      380 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 380
	and a, #0x03
	bz $.BB@LABEL@17_50
.BB@LABEL@17_44:	; bb214
	dec a
	bz $.BB@LABEL@17_49
.BB@LABEL@17_45:	; bb214
	dec a
	mov a, b
	bz $.BB@LABEL@17_48
.BB@LABEL@17_46:	; switch_clause_bb218
	;***      381 : 			case 3:
	;***      382 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 382
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@17_47:	; switch_clause_bb218
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@17_51
.BB@LABEL@17_48:	; switch_clause_bb229
	;***      383 : 				break;
	;***      384 : 			case 2:
	;***      385 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 385
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@17_47
.BB@LABEL@17_49:	; switch_clause_bb240
	;***      386 : 				break;
	;***      387 : 			case 1:
	;***      388 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 388
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@17_51
.BB@LABEL@17_50:	; switch_clause_bb251
	;***      389 : 				break;
	;***      390 : 			case 0:
	;***      391 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 391
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@17_51:	; switch_break_bb263
	inc b
	mov a, b
	br $.BB@LABEL@17_42
.BB@LABEL@17_52:	; bb275
	;***      392 : 				break;
	;***      393 : 			default:
	;***      394 : 				break;
	;***      395 : 			}
	;***      396 : 		}
	;***      397 : 		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 397
	mov c, #0x24
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov !LOWW(__settingNumber+0x00024), a
	;***      398 : 				numberSettingSize - 1);
	;***      399 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 399
	mov a, !LOWW(_g_rx_data+0x00024)
	mov [sp+0x00], a
	mov c, #0x24
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp a, x
	bnz $.BB@LABEL@17_54
.BB@LABEL@17_53:	; if_then_bb297
	;***      400 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      401 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 401
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call $!_sendToRasPi_f
	;***      402 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 402
	movw de, #0x0026
	movw bc, #LOWW(__settingNumber)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	clrw ax
	;***      403 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 403
	push ax
	mov x, #0x25
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      404 : 					numberSettingSize);
	;***      405 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 405
	clrb x
	br $.BB@LABEL@17_55
.BB@LABEL@17_54:	; if_else_bb300
	;***      406 : 		} else {
	;***      407 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 407
	mov x, #0x16
.BB@LABEL@17_55:	; if_else_bb300
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi_f
	;***      408 : 		}
	;***      409 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      410 : 		commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 410
	clrb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@17_56:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 412
	ret
_InitialOperationModeStart_nostop:
	.STACK _InitialOperationModeStart_nostop = 4
	;***      411 : 	}
	;***      412 : }
	;***      413 : /**
	;***      414 :  * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
	;***      415 :  * 13/12/2021: Checked!
	;***      416 :  * @return: 0 - Done; 1 - Not done
	;***      417 :  */
	;***      418 : uint8_t InitialOperationModeStart_nostop(void) {
	;***      419 : //	O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7; // Turn on SV5 if ACID tank empty
	;***      420 : //	O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6; // Turn on SV6 if ALK tank empty
	;***      421 : 	O_DRAIN_ACID_PIN_SV5 = isAcidTankEmpty() ? OFF : ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 421
	call $!_isAcidTankEmpty
	cmp0 a
	clrb x
	sknz
.BB@LABEL@18_1:	; bb4
	mov x, #0x80
.BB@LABEL@18_2:	; bb5
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      422 : 	O_DRAIN_ALK_PIN_SV6 = isAlkalineTankEmpty() ? OFF : ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 422
	call $!_isAlkalineTankEmpty
	cmp0 a
	clrb x
	sknz
.BB@LABEL@18_3:	; bb18
	mov x, #0x40
.BB@LABEL@18_4:	; bb20
	mov a, #0xBF
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      423 : //	return (!isAcidTankEmpty() || !isAcidTankEmpty());
	;***      424 : 	return !(O_DRAIN_ACID_PIN_SV5 == OFF && O_DRAIN_ALK_PIN_SV6 == OFF);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 424
	mov a, 0xFFF06
	bt a.7, $.BB@LABEL@18_6
.BB@LABEL@18_5:	; bb34
	mov a, 0xFFF06
	shr a, 0x06
	and a, #0x01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 425
	ret
.BB@LABEL@18_6:	; bb50
	oneb a
	ret
_WaterSupplyOperation_nostop:
	.STACK _WaterSupplyOperation_nostop = 14
	;***      425 : }
	;***      426 : ///**
	;***      427 : // * FlowSensorCheck
	;***      428 : // * 30/11/2021: Checked!
	;***      429 : // * @return 0 is Error, 1 is OK, 2 Still taking
	;***      430 : // */
	;***      431 : //uint8_t FlowSensorCheck(uint32_t *_time) {
	;***      432 : ////	g_flow_value = measureFlowSensor();
	;***      433 : //	if ((g_flow_value < g_numberSetting.upperFlow)
	;***      434 : //			& (g_flow_value > g_numberSetting.lowerFlow)) {
	;***      435 : //		return 1;
	;***      436 : //	} else {
	;***      437 : //		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      438 : //		return 0;
	;***      439 : //	}
	;***      440 : //}
	;***      441 : /**
	;***      442 :  * WaterSupplyOperation
	;***      443 :  * 30/11/2021: Checked by An
	;***      444 :  */
	;***      445 : uint8_t WaterSupplyOperation_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 445
	subw sp, #0x06
	;***      446 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      447 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      448 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 448
	mov b, !LOWW(_g_machine_state+0x00004)
	mov a, b
	mov [sp+0x02], a
	cmp0 b
	bz $.BB@LABEL@19_8
.BB@LABEL@19_1:	; entry
	mov a, b
	dec a
	bz $.BB@LABEL@19_9
.BB@LABEL@19_2:	; entry
	dec a
	bz $.BB@LABEL@19_10
.BB@LABEL@19_3:	; entry
	dec a
	bz $.BB@LABEL@19_12
.BB@LABEL@19_4:	; entry
	dec a
	bz $.BB@LABEL@19_16
.BB@LABEL@19_5:	; entry
	dec a
	bz $.BB@LABEL@19_17
.BB@LABEL@19_6:	; entry
	dec a
	.bz $!.BB@LABEL@19_23
.BB@LABEL@19_7:	; switch_clause_bb85
	;***      449 : 	case 0:
	;***      450 : 		*tick = g_systemTime;
	;***      451 : 		(*state)++;
	;***      452 : 		break;
	;***      453 : 	case 1:
	;***      454 : 		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
	;***      455 : 		if (ns_delay_ms(tick, 30000)) {
	;***      456 : 			(*state)++;
	;***      457 : 		}
	;***      458 : 		break;
	;***      459 : 	case 2:
	;***      460 : 		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      461 : 		if (ns_delay_ms(tick, 500)) {
	;***      462 : 			(*state)++;
	;***      463 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      464 : 		}
	;***      465 : 		break;
	;***      466 : 	case 3:
	;***      467 : 		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      468 : 		if (ns_delay_ms(tick, 15000)) {
	;***      469 : 			(*state)++;
	;***      470 : 			g_machine_state.flowSensor = 0;
	;***      471 : 		}
	;***      472 : 		measureFlowSensor_nostop();
	;***      473 : 		break;
	;***      474 : 	case 4:
	;***      475 : 		measureFlowSensor(&g_timerSetting.t3_flowSensorMonitorTime_s);
	;***      476 : 		(*state)++;
	;***      477 : 		break;
	;***      478 : 	case 5:
	;***      479 : 		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      480 : 				|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      481 : 			(*state) = 3;
	;***      482 : 			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      483 : 					g_io_status.refined.FlowValue);
	;***      484 : 		} else
	;***      485 : 			(*state)++;
	;***      486 : 		g_Tick.tickWaterSupply = g_systemTime;
	;***      487 : 		break;
	;***      488 : 	case 6:
	;***      489 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply,
	;***      490 : 				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
	;***      491 : 			(*state)++;
	;***      492 : 		}
	;***      493 : 		break;
	;***      494 : 	default:
	;***      495 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 495
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@19_15
.BB@LABEL@19_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 450
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 451
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@19_15
.BB@LABEL@19_9:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 454
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 455
	clrw ax
	movw de, ax
	movw bc, #0x7530
	br $!.BB@LABEL@19_24
.BB@LABEL@19_10:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 460
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 461
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_15
.BB@LABEL@19_11:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 462
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 463
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00024), ax
	br $.BB@LABEL@19_15
.BB@LABEL@19_12:	; switch_clause_bb31
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 467
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 468
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_14
.BB@LABEL@19_13:	; if_then_bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 469
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 470
	clrb !LOWW(_g_machine_state+0x00005)
.BB@LABEL@19_14:	; if_break_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 472
	call $!_measureFlowSensor_nostop
.BB@LABEL@19_15:	; if_break_bb41
	br $.BB@LABEL@19_22
.BB@LABEL@19_16:	; switch_clause_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 475
	movw ax, #LOWW(_g_timerSetting+0x00008)
	call $!_measureFlowSensor
	br $.BB@LABEL@19_25
.BB@LABEL@19_17:	; switch_clause_bb49
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 479
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
	push ax
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x00006)
	movw [sp+0x08], ax
	call !!__COM_flt
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@19_20
.BB@LABEL@19_18:	; bb
	movw ax, !LOWW(_g_numberSetting+0x0001A)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00018)
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_fgt
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@19_20
.BB@LABEL@19_19:	; if_else_bb
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 485
	inc a
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@19_21
.BB@LABEL@19_20:	; if_then_bb65
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 481
	mov !LOWW(_g_machine_state+0x00004), #0x03
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 482
	movw ax, #0x4104
	call $!_sendToRasPi_f
.BB@LABEL@19_21:	; if_break_bb71
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 486
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
.BB@LABEL@19_22:	; if_break_bb71
	br $.BB@LABEL@19_26
.BB@LABEL@19_23:	; switch_clause_bb73
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 489
	movw ax, !LOWW(_g_timerSetting+0x0000C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0000E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
.BB@LABEL@19_24:	; switch_clause_bb73
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@19_25:	; if_then_bb80
	inc !LOWW(_g_machine_state+0x00004)
.BB@LABEL@19_26:	; switch_break_bb
	;***      496 : 		break;
	;***      497 : 	}
	;***      498 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 498
	call !!_R_WDT_Restart
	;***      499 : 	if (*state == 6 + 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 499
	cmp !LOWW(_g_machine_state+0x00004), #0x07
	bnz $.BB@LABEL@19_28
.BB@LABEL@19_27:	; if_then_bb93
	;***      500 : 		g_machine_state.flowSensor = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 500
	clrb !LOWW(_g_machine_state+0x00005)
	;***      501 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 501
	clrb !LOWW(_g_machine_state+0x00004)
	;***      502 : 		return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 502
	clrb a
	br $.BB@LABEL@19_29
.BB@LABEL@19_28:	; bb99
	;***      503 : 	} else
	;***      504 : 		return 1;
	;***      505 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 505
	oneb a
.BB@LABEL@19_29:	; bb99
	addw sp, #0x06
	ret
_stop_waitAlarmConfirm:
	.STACK _stop_waitAlarmConfirm = 10
	;***      506 : void stop_waitAlarmConfirm(enum Control_status alarm, uint8_t timeout_s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 506
	subw sp, #0x04
	push ax
	;***      507 : 	uint32_t _tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 507
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@20_1:	; bb23
	mov a, [sp+0x01]
	;***      508 : 	while (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 508
	cmp a, !LOWW(_commnunication_flag+0x00007)
	bz $.BB@LABEL@20_4
.BB@LABEL@20_2:	; bb
	;***      509 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	call $!_realTimeResponse
	mov a, [sp+0x00]
	;***      510 : 		if ((ns_delay_ms(&_tick, timeout_s * 1000)) && (timeout_s != 0)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 510
	shrw ax, 8+0x00000
	movw bc, #0x03E8
	mulh
	movw bc, ax
	sarw ax, 0x0F
	movw de, ax
	movw ax, sp
	incw ax
	incw ax
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@20_1
.BB@LABEL@20_3:	; bb
	mov a, [sp+0x00]
	cmp0 a
	bz $.BB@LABEL@20_1
.BB@LABEL@20_4:	; bb32
	;***      511 : 			break;
	;***      512 : 		}
	;***      513 : 	}
	;***      514 : 	commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 514
	clrb !LOWW(_commnunication_flag+0x00007)
	addw sp, #0x06
	ret
_nostop_waitAlarmConfirm:
	.STACK _nostop_waitAlarmConfirm = 4
	;***      515 : }
	;***      516 : uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 516
	cmp a, !LOWW(_commnunication_flag+0x00007)
	;***      517 : 	if (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 517
	bnz $.BB@LABEL@21_2
.BB@LABEL@21_1:	; if_break_bb
	;***      518 : 		return 1;
	;***      519 : 	}
	;***      520 : 	commnunication_flag.alarm_clear_flag = OK_ALL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 520
	clrb !LOWW(_commnunication_flag+0x00007)
	;***      521 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 521
	clrb a
	ret
.BB@LABEL@21_2:	; bb9
	;***      522 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 522
	oneb a
	ret
_resetAlarm:
	.STACK _resetAlarm = 4
	;***      523 : void resetAlarm(void) {
	;***      524 : 	commnunication_flag.alarm_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
	oneb !LOWW(_commnunication_flag+0x00007)
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      525 : }
	;***      526 : 
	;***      527 : /**
	;***      528 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      529 :  * 30/11/2021: Checked by An
	;***      530 :  * @return 0 - OK; 1 - Error
	;***      531 :  */
	;***      532 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 532
	subw sp, #0x0A
	;***      533 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 533
	movw ax, !LOWW(_g_numberSetting+0x00002)
	movw [sp+0x02], ax
	push ax
	movw ax, !LOWW(_g_numberSetting)
	movw [sp+0x0A], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
	movw [sp+0x0A], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, [sp+0x02]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@23_1:	; entry
	clrb a
.BB@LABEL@23_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@23_3:	; entry
	clrb x
.BB@LABEL@23_4:	; entry
	or x, a
	bnz $.BB@LABEL@23_11
.BB@LABEL@23_5:	; if_then_bb
	;***      534 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 534
	movw ax, !LOWW(_g_timerSetting+0x00028)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0002A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0002C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@23_8
.BB@LABEL@23_6:	; bb34
	clrb a
.BB@LABEL@23_7:	; bb34
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 548
	ret
.BB@LABEL@23_8:	; if_then_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      535 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      536 : 			resetAlarm();
	;***      537 : 			sendToRasPi_f(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 537
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4105
	call $!_sendToRasPi_f
	;***      538 : 					g_io_status.refined.CVCCVoltage);
	;***      539 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 539
	set1 !LOWW(_g_alarm).0
	;***      540 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 540
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@23_9:	; if_then_bb11.bb23_crit_edge
	oneb a
.BB@LABEL@23_10:	; bb23
	mov !LOWW(_g_machine_state+0x00008), a
	;***      541 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 541
	movw ax, #0x0500
	call $!_stop_waitAlarmConfirm
	;***      542 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 542
	clr1 !LOWW(_g_alarm).0
	;***      543 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 543
	oneb a
	br $.BB@LABEL@23_7
.BB@LABEL@23_11:	; if_else_bb
	;***      544 : 		}
	;***      545 : 	} else
	;***      546 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 546
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	br $.BB@LABEL@23_6
_Voltage2Check_nostop:
	.STACK _Voltage2Check_nostop = 18
	;***      547 : 	return 0;
	;***      548 : }
	;***      549 : /**
	;***      550 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      551 :  * 16/12/2021: Checked by An
	;***      552 :  * @return 0 - OK
	;***      553 :  */
	;***      554 : void Voltage2Check_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 554
	subw sp, #0x0A
	;***      555 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 555
	movw ax, !LOWW(_g_numberSetting+0x00006)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00004)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
	movw [sp+0x08], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x06]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@24_1:	; entry
	clrb a
.BB@LABEL@24_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@24_3:	; entry
	clrb x
.BB@LABEL@24_4:	; entry
	or x, a
	bnz $.BB@LABEL@24_8
.BB@LABEL@24_5:	; if_then_bb
	;***      556 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 556
	movw ax, !LOWW(_g_timerSetting+0x0002C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0002E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00030)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@24_9
.BB@LABEL@24_6:	; if_then_bb10
	;***      557 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      558 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 558
	movw ax, !LOWW(_g_numberSetting+0x00002)
	push ax
	movw ax, !LOWW(_g_numberSetting)
	push ax
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
	movw [sp+0x06], ax
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@24_9
.BB@LABEL@24_7:	; if_then_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      559 : 					>= g_numberSetting.upperVoltage1)) {
	;***      560 : 				resetAlarm();
	;***      561 : 				g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 561
	set1 !LOWW(_g_alarm).1
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      562 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 562
	movw ax, #0x4106
	addw sp, #0x0A
	br $!_sendToRasPi_f
.BB@LABEL@24_8:	; if_else_bb
	;***      563 : 						g_io_status.refined.CVCCVoltage);
	;***      564 : 			}
	;***      565 : 		}
	;***      566 : 	} else {
	;***      567 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 567
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      568 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 568
	clr1 !LOWW(_g_alarm).1
.BB@LABEL@24_9:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 570
	ret
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      569 : 	}
	;***      570 : }
	;***      571 : /**
	;***      572 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      573 :  * 16/12/2021: Checked by An
	;***      574 :  * @return 0 - OK; 1 - Error
	;***      575 :  */
	;***      576 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 576
	subw sp, #0x0A
	;***      577 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 577
	movw ax, !LOWW(_g_numberSetting+0x0000A)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00008)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
	movw [sp+0x08], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x06]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@25_1:	; entry
	clrb a
.BB@LABEL@25_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@25_3:	; entry
	clrb x
.BB@LABEL@25_4:	; entry
	or x, a
	bnz $.BB@LABEL@25_10
.BB@LABEL@25_5:	; if_then_bb
	;***      578 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 578
	movw ax, !LOWW(_g_timerSetting+0x00030)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00032)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00034)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@25_11
.BB@LABEL@25_6:	; if_then_bb11
	;***      579 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      580 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 580
	movw ax, !LOWW(_g_numberSetting+0x00006)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00004)
	push ax
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
	movw [sp+0x06], ax
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@25_11
.BB@LABEL@25_7:	; if_then_bb21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      581 : 					>= g_numberSetting.upperVoltage2)) {
	;***      582 : 				resetAlarm();
	;***      583 : 				g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 583
	set1 !LOWW(_g_alarm).2
	;***      584 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 584
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      585 : //				g_machine_state.electrolyteOFF =
	;***      586 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      587 : //								1 : g_machine_state.electrolyteOFF;
	;***      588 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 588
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@25_8:	; if_then_bb21.bb35_crit_edge
	oneb a
.BB@LABEL@25_9:	; bb35
	mov !LOWW(_g_machine_state+0x00008), a
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      589 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 589
	movw ax, #0x4107
	call $!_sendToRasPi_f
	;***      590 : 						g_io_status.refined.CVCCVoltage);
	;***      591 : 				stop_waitAlarmConfirm(OVER_VOLTAGE_3, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 591
	movw ax, #0x0700
	call $!_stop_waitAlarmConfirm
	;***      592 : 				g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 592
	clr1 !LOWW(_g_alarm).2
	;***      593 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 593
	oneb a
	br $.BB@LABEL@25_12
.BB@LABEL@25_10:	; if_else_bb
	;***      594 : 			}
	;***      595 : 		}
	;***      596 : 	} else {
	;***      597 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 597
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
.BB@LABEL@25_11:	; bb48
	clrb a
.BB@LABEL@25_12:	; bb48
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 600
	ret
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      598 : 	}
	;***      599 : 	return 0;
	;***      600 : }
	;***      601 : /**
	;***      602 :  * Checked 16/12/2021
	;***      603 :  * @return
	;***      604 :  */
	;***      605 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 605
	subw sp, #0x0A
	;***      606 : 	if ((g_systemTime - g_TimeKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 606
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x00], ax
	movw ax, !LOWW(_g_timerSetting+0x00034)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00036)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	movw bc, ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TimeKeeper@1+0x00002)
	movw hl, ax
	movw ax, [sp+0x00]
	sknc
.BB@LABEL@26_1:	; entry
	decw ax
.BB@LABEL@26_2:	; entry
	subw ax, !LOWW(_g_TimeKeeper@1+0x00004)
	cmpw ax, bc
	movw ax, hl
	sknz
.BB@LABEL@26_3:	; entry
	cmpw ax, de
.BB@LABEL@26_4:	; entry
	.bc $!.BB@LABEL@26_16
.BB@LABEL@26_5:	; if_then_bb
	;***      607 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      608 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 608
	movw ax, !LOWW(_g_numberSetting+0x0000E)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0000C)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_io_status+0x0000A)
	movw [sp+0x08], ax
	call !!__COM_funordered
	mov [sp+0x04], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x06]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x00]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@26_6:	; if_then_bb
	clrb a
.BB@LABEL@26_7:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@26_8:	; if_then_bb
	clrb x
.BB@LABEL@26_9:	; if_then_bb
	or x, a
	bnz $.BB@LABEL@26_16
.BB@LABEL@26_10:	; if_then_bb13
	;***      609 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 609
	movw ax, !LOWW(_g_timerSetting+0x00038)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0003A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00038)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@26_13
.BB@LABEL@26_11:	; bb47
	clrb a
.BB@LABEL@26_12:	; bb47
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 629
	ret
.BB@LABEL@26_13:	; if_then_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      610 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      611 : 				resetAlarm();
	;***      612 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 612
	set1 !LOWW(_g_alarm).5
	;***      613 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 613
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      614 : //				g_machine_state.electrolyteOFF =
	;***      615 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      616 : //								1 : g_machine_state.electrolyteOFF;
	;***      617 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 617
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@26_14:	; if_then_bb20.bb32_crit_edge
	oneb a
.BB@LABEL@26_15:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	;***      618 : 				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 618
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4108
	call $!_sendToRasPi_f
	;***      619 : 						g_io_status.refined.CVCCVoltage);
	;***      620 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 620
	movw ax, #0x0800
	call $!_stop_waitAlarmConfirm
	;***      621 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 621
	clr1 !LOWW(_g_alarm).5
	;***      622 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 622
	oneb a
	br $.BB@LABEL@26_12
.BB@LABEL@26_16:	; if_else_bb
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	br $.BB@LABEL@26_11
_OverCurrentCheck_waitReset:
	.STACK _OverCurrentCheck_waitReset = 22
	;***      623 : 			}
	;***      624 : 		} else
	;***      625 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      626 : 	} else
	;***      627 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      628 : 	return 0;
	;***      629 : }
	;***      630 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 630
	subw sp, #0x0E
	;***      631 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 631
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      632 : 	const uint16_t _max_time = 10000;
	;***      633 : 	if (g_systemTime - g_TimeKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 633
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TimeKeeper@1+0x00002)
	movw de, ax
	movw ax, bc
	sknc
.BB@LABEL@27_1:	; entry
	decw ax
.BB@LABEL@27_2:	; entry
	subw ax, !LOWW(_g_TimeKeeper@1+0x00004)
	clrw bc
	cmpw ax, bc
	movw ax, de
	sknz
.BB@LABEL@27_3:	; entry
	cmpw ax, #0x1388
.BB@LABEL@27_4:	; entry
	.bc $!.BB@LABEL@27_34
.BB@LABEL@27_5:	; if_then_bb
	;***      634 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 634
	movw ax, !LOWW(_g_numberSetting+0x00016)
	movw [sp+0x06], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x0A], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000E)
	movw [sp+0x06], ax
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@27_11
.BB@LABEL@27_6:	; bb
	movw ax, !LOWW(_g_numberSetting+0x00012)
	movw [sp+0x0C], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	movw [sp+0x0C], ax
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_funordered
	mov [sp+0x08], a
	addw sp, #0x04
	movw ax, [sp+0x0C]
	push ax
	movw ax, [sp+0x0C]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@27_7:	; bb
	clrb a
.BB@LABEL@27_8:	; bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@27_9:	; bb
	clrb x
.BB@LABEL@27_10:	; bb
	or x, a
	.bnz $!.BB@LABEL@27_34
.BB@LABEL@27_11:	; if_then_bb24
	mov a, #0x48
	;***      635 : 				|| (g_io_status.refined.CVCCCurrent
	;***      636 : 						>= g_numberSetting.upperCurrent)) {
	;***      637 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 637
	and a, !LOWW(_g_alarm)
	bnz $.BB@LABEL@27_18
.BB@LABEL@27_12:	; if_then_bb24
	movw ax, [sp+0x06]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_funordered
	mov [sp+0x08], a
	addw sp, #0x04
	movw ax, [sp+0x06]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@27_13:	; if_then_bb24
	clrb a
.BB@LABEL@27_14:	; if_then_bb24
	cmp0 x
	oneb x
	sknz
.BB@LABEL@27_15:	; if_then_bb24
	clrb x
.BB@LABEL@27_16:	; if_then_bb24
	or x, a
	bnz $.BB@LABEL@27_18
.BB@LABEL@27_17:	; if_then_bb58
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      638 : 					&& (g_alarm.refined.overCurrent == 0)
	;***      639 : 					&& (g_io_status.refined.CVCCCurrent
	;***      640 : 							<= g_numberSetting.lowerCurrent)) {
	;***      641 : 				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 641
	movw ax, #0x4109
	call $!_sendToRasPi_f
.BB@LABEL@27_18:	; if_break_bb
	;***      642 : 						g_io_status.refined.CVCCCurrent);
	;***      643 : 			}
	;***      644 : 			g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 644
	movw ax, !LOWW(_g_numberSetting+0x00016)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000E)
	movw [sp+0x08], ax
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@27_19:	; if_break_bb
	clrb a
.BB@LABEL@27_20:	; if_break_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@27_21:	; if_break_bb
	clrb x
.BB@LABEL@27_22:	; if_break_bb
	or x, a
	mov x, #0x40
	skz
.BB@LABEL@27_23:	; bb65
	clrb x
.BB@LABEL@27_24:	; bb67
	mov a, #0xBF
	and a, !LOWW(_g_alarm)
	or a, x
	mov !LOWW(_g_alarm), a
	;***      645 : 					g_io_status.refined.CVCCCurrent
	;***      646 : 							<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      647 : 
	;***      648 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 648
	movw ax, !LOWW(_g_numberSetting+0x00012)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	movw [sp+0x08], ax
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@27_25:	; bb67
	clrb a
.BB@LABEL@27_26:	; bb67
	cmp0 x
	oneb x
	sknz
.BB@LABEL@27_27:	; bb67
	clrb x
.BB@LABEL@27_28:	; bb67
	or x, a
	bnz $.BB@LABEL@27_33
.BB@LABEL@27_29:	; if_then_bb81
	;***      649 : 					>= g_numberSetting.upperCurrent) {
	;***      650 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 650
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_34
.BB@LABEL@27_30:	; if_then_bb88
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      651 : 					resetAlarm();
	;***      652 : 					g_alarm.refined.overCurrent = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 652
	set1 !LOWW(_g_alarm).3
	;***      653 : 					g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 653
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      654 : //					g_machine_state.electrolyteOFF =
	;***      655 : //							g_machine_state.electrolyteOFF == 0 ?
	;***      656 : //									1 : g_machine_state.electrolyteOFF;
	;***      657 : 					electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 657
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@27_31:	; if_then_bb88.bb102_crit_edge
	oneb a
.BB@LABEL@27_32:	; bb102
	mov !LOWW(_g_machine_state+0x00008), a
	;***      658 : 					sendToRasPi_f(H_ALARM, OVER_CURRENT,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 658
	movw bc, !LOWW(_g_io_status+0x0000E)
	movw de, !LOWW(_g_io_status+0x00010)
	movw ax, #0x410A
	call $!_sendToRasPi_f
	;***      659 : 							g_io_status.refined.CVCCCurrent);
	;***      660 : 					stop_waitAlarmConfirm(OVER_CURRENT, 10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 660
	movw ax, #0x0A0A
	call $!_stop_waitAlarmConfirm
	;***      661 : 					g_alarm.refined.overCurrent = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 661
	clr1 !LOWW(_g_alarm).3
	;***      662 : 					return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 662
	oneb a
	br $.BB@LABEL@27_35
.BB@LABEL@27_33:	; if_else_bb
	;***      663 : 				}
	;***      664 : 			} else {
	;***      665 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 665
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@27_34:	; bb117
	clrb a
.BB@LABEL@27_35:	; bb117
	addw sp, #0x0E
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 670
	ret
_ElectrolyticOperation_nostop:
	.STACK _ElectrolyticOperation_nostop = 4
	;***      666 : 			}
	;***      667 : 		}
	;***      668 : 	}
	;***      669 : 	return 0;
	;***      670 : }
	;***      671 : uint8_t ElectrolyticOperation_nostop(void) {
	;***      672 : 	uint8_t *state = &g_machine_state.electrolyteOperation;
	;***      673 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 673
	mov a, !LOWW(_g_machine_state+0x00007)
	cmp0 a
	.bz $!.BB@LABEL@28_21
.BB@LABEL@28_1:	; entry
	dec a
	bz $.BB@LABEL@28_5
.BB@LABEL@28_2:	; entry
	dec a
	bz $.BB@LABEL@28_6
.BB@LABEL@28_3:	; entry
	dec a
	.bz $!.BB@LABEL@28_18
.BB@LABEL@28_4:	; switch_clause_bb130
	clrb !LOWW(_g_machine_state+0x00007)
	br $!.BB@LABEL@28_22
.BB@LABEL@28_5:	; switch_clause_bb7
	;***      674 : 	case 0:
	;***      675 : 		(*state)++;
	;***      676 : 		break;
	;***      677 : 	case 1:
	;***      678 : 		electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 678
	call $!_electrolyticOperationON
	;***      679 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 679
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	;***      680 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 680
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      681 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 681
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
	;***      682 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 682
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	;***      683 : 		g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 683
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
	br $.BB@LABEL@28_17
.BB@LABEL@28_6:	; switch_clause_bb16
	;***      684 : 		(*state)++;
	;***      685 : 		break;
	;***      686 : 	case 2:
	;***      687 : 		Voltage2Check_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 687
	call $!_Voltage2Check_nostop
	;***      688 : 		if (Voltage1Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 688
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_7:	; if_else_bb
	;***      689 : 			(*state)--;
	;***      690 : 			break;
	;***      691 : 
	;***      692 : 		} else if (Voltage3Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 692
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_8:	; if_else_bb35
	;***      693 : 			(*state)--;
	;***      694 : 			break;
	;***      695 : 		} else if (LowVoltageCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 695
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_9:	; if_else_bb46
	;***      696 : 			(*state)--;
	;***      697 : 			break;
	;***      698 : 		} else if (OverCurrentCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 698
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_10:	; if_else_bb57
	;***      699 : 			(*state)--;
	;***      700 : 			break;
	;***      701 : 		} else if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 701
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@28_15
.BB@LABEL@28_11:	; if_then_bb65
	;***      702 : 			g_alarm.refined.cvcc = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 702
	set1 !LOWW(_g_alarm).7
	;***      703 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 703
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      704 : 			g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 704
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@28_12:	; if_then_bb65.bb78_crit_edge
	oneb a
.BB@LABEL@28_13:	; bb78
	mov !LOWW(_g_machine_state+0x00008), a
	;***      705 : 					g_machine_state.electrolyteOFF == 0 ?
	;***      706 : 							1 : g_machine_state.electrolyteOFF;
	;***      707 : 			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 707
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi_f
	;***      708 : 			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 708
	movw ax, #0x1200
	call $!_stop_waitAlarmConfirm
	;***      709 : 			g_alarm.refined.cvcc = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 709
	clr1 !LOWW(_g_alarm).7
.BB@LABEL@28_14:	; if_then_bb
	dec !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@28_22
.BB@LABEL@28_15:	; if_break_bb92
	;***      710 : 			(*state)--;
	;***      711 : 			break;
	;***      712 : 		}
	;***      713 : 		if (isAcidTankFull() && isAlkalineTankFull())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 713
	call $!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@28_22
.BB@LABEL@28_16:	; bb97
	call $!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@28_22
.BB@LABEL@28_17:	; if_then_bb110
	inc !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@28_22
.BB@LABEL@28_18:	; switch_clause_bb115
	;***      714 : 			(*state)++;
	;***      715 : 		break;
	;***      716 : 	case 3:
	;***      717 : 		g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 717
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@28_19:	; switch_clause_bb115.bb125_crit_edge
	oneb a
.BB@LABEL@28_20:	; bb125
	mov !LOWW(_g_machine_state+0x00008), a
	br $!.BB@LABEL@28_4
.BB@LABEL@28_21:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 675
	inc a
	mov !LOWW(_g_machine_state+0x00007), a
.BB@LABEL@28_22:	; bb132
	;***      718 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      719 : 						1 : g_machine_state.electrolyteOFF;
	;***      720 : 		(*state) = 0;
	;***      721 : 		break;
	;***      722 : 	default:
	;***      723 : 		(*state) = 0;
	;***      724 : 		break;
	;***      725 : 	}
	;***      726 : 	return (*state) == 0 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 726
	cmp0 !LOWW(_g_machine_state+0x00007)
	oneb a
	skz
.BB@LABEL@28_23:	; bb132
	clrb a
.BB@LABEL@28_24:	; bb132
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      727 : //	WAIT_RESET: electrolyticOperationON();
	;***      728 : //	g_Tick.tickVoltage1Check = g_systemTime;
	;***      729 : //	g_Tick.tickVoltage2Check = g_systemTime;
	;***      730 : //	g_Tick.tickVoltage3Check = g_systemTime;
	;***      731 : //	g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      732 : //	g_Tick.tickCurrentCheck = g_systemTime;
	;***      733 : //	do {
	;***      734 : //		realTimeResponse();
	;***      735 : //		if (Voltage1Check_waitReset())
	;***      736 : //			goto WAIT_RESET;
	;***      737 : //		Voltage2Check_nostop();
	;***      738 : //		if (Voltage3Check_waitReset())
	;***      739 : //			goto WAIT_RESET;
	;***      740 : //		if (LowVoltageCheck_waitReset())
	;***      741 : //			goto WAIT_RESET;
	;***      742 : //		if (OverCurrentCheck_waitReset())
	;***      743 : //			goto WAIT_RESET;
	;***      744 : //		//----------CVCC Alarm Input-----------------
	;***      745 : //		if (I_CVCC_ALARM_IN == I_ON) {
	;***      746 : //			g_alarm.refined.cvcc = 1;
	;***      747 : //			g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      748 : //			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	;***      749 : //			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	;***      750 : //			g_alarm.refined.cvcc = 0;
	;***      751 : //			goto WAIT_RESET;
	;***      752 : //		}
	;***      753 : //		R_WDT_Restart();
	;***      754 : //	} while (!isAcidTankFull() || !isAlkalineTankFull());
	;***      755 : //	g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      756 : }
	;***      757 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 757
	subw sp, #0x04
	;***      758 : 	uint32_t _time_count = 0;
	;***      759 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 759
	movw ax, !LOWW(_g_timerSetting+0x00040)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00042)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	addw ax, de
	movw bc, !LOWW(_g_flow_value+0x00002)
	movw de, !LOWW(_g_flow_value)
	bnz $.BB@LABEL@29_3
.BB@LABEL@29_1:	; entry
	bc $.BB@LABEL@29_3
.BB@LABEL@29_2:	; entry
	movw ax, #0x3DCC
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, de
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@29_4
.BB@LABEL@29_3:	; entry.if_break_bb_crit_edge
	clrw ax
	movw [sp+0x02], ax
	movw [sp+0x00], ax
	br $.BB@LABEL@29_5
.BB@LABEL@29_4:	; if_then_bb
	onew ax
	movw [sp+0x02], ax
	decw ax
	movw [sp+0x00], ax
	;***      760 : 			& (_time_count
	;***      761 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      762 : 		_time_count++;
	;***      763 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 763
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@29_5:	; if_break_bb
	;***      764 : 	}
	;***      765 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 765
	movw ax, !LOWW(_g_timerSetting+0x00040)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00042)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	movw bc, ax
	movw ax, [sp+0x00]
	cmpw ax, bc
	movw ax, [sp+0x02]
	sknz
.BB@LABEL@29_6:	; if_break_bb
	cmpw ax, de
.BB@LABEL@29_7:	; if_break_bb
	addw sp, #0x04
	bnz $.BB@LABEL@29_9
.BB@LABEL@29_8:	; if_then_bb20
	;***      766 : 		sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 766
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi_f
.BB@LABEL@29_9:	; return
	;***      767 : 	}
	;***      768 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 768
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      769 : void saltWaterTankFullCheck(void) {
	;***      770 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 770
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@30_2
.BB@LABEL@30_1:	; return
	;***      771 : 		sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      772 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	;***      773 : 		g_machine_state.electrolyteOFF =
	;***      774 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      775 : 						1 : g_machine_state.electrolyteOFF;
	;***      776 : 	}
	;***      777 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 777
	ret
.BB@LABEL@30_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 771
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 772
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 773
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@30_3:	; if_then_bb.bb14_crit_edge
	oneb a
.BB@LABEL@30_4:	; bb14
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 777
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      778 : void saltWaterTankEmptyCheck(void) {
	;***      779 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 779
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@31_2
.BB@LABEL@31_1:	; if_then_bb
	;***      780 : 		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 780
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi_f
.BB@LABEL@31_2:	; return
	;***      781 : 	}
	;***      782 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 782
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      783 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 783
	movw de, #0xFF07
	;***      784 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 784
	mov a, [de]
	mov c, a
	mov a, [de]
	shr a, 0x02
	mov b, a
	mov a, [de]
	shr a, 0x03
	mov x, a
	mov a, b
	or x, a
	mov a, c
	shr a, 0x01
	and a, #0x01
	xor a, #0x01
	and a, x
	mov b, a
	mov a, [de]
	mov1 CY, a.2
	oneb a
	subc a, #0x00
	mov x, a
	mov a, [de]
	mov1 CY, a.3
	clrb a
	addc a, #0x00
	and a, x
	or a, b
	shrw ax, 8+0x00000
	clrw bc
	cmpw ax, bc
	sknz
.BB@LABEL@32_1:	; return
	;***      785 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      786 : 		sendToRasPi_f(H_ALARM, ACID_ERROR, 1);
	;***      787 : 
	;***      788 : 	}
	;***      789 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 789
	ret
.BB@LABEL@32_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 786
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi_f
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      790 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 790
	push hl
	;***      791 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 791
	mov x, 0xFFF00
	mov a, 0xFFF00
	shr a, 0x06
	or a, 0xFFF07
	mov b, a
	mov a, x
	shr a, 0x05
	and a, #0x01
	xor a, #0x01
	mov x, a
	mov a, b
	and x, a
	mov a, x
	mov [sp+0x00], a
	mov a, 0xFFF00
	mov1 CY, a.6
	oneb a
	subc a, #0x00
	mov x, a
	mov a, 0xFFF07
	mov1 CY, a.0
	clrb a
	addc a, #0x00
	and a, x
	mov x, a
	mov a, [sp+0x00]
	or a, x
	shrw ax, 8+0x00000
	clrw bc
	pop hl
	cmpw ax, bc
	sknz
.BB@LABEL@33_1:	; return
	;***      792 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      793 : 		sendToRasPi_f(H_ALARM, ALKALINE_ERROR, 1);
	;***      794 : 	}
	;***      795 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 795
	ret
.BB@LABEL@33_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 793
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi_f
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      796 : 
	;***      797 : uint8_t FilterReplacementCheck(void) {
	;***      798 : 
	;***      799 : 	return 0;
	;***      800 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 800
	clrb a
	ret
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      801 : 
	;***      802 : /**
	;***      803 :  * Tested: 10/12/2021 by Mr.An
	;***      804 :  */
	;***      805 : void WaterWashingMode_nostop(void) {
	;***      806 : 	uint8_t *state = &g_machine_state.water;
	;***      807 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      808 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 808
	mov a, !LOWW(_g_machine_state+0x00002)
	cmp0 a
	bz $.BB@LABEL@35_4
.BB@LABEL@35_1:	; entry
	dec a
	bz $.BB@LABEL@35_5
.BB@LABEL@35_2:	; entry
	dec a
	bz $.BB@LABEL@35_7
.BB@LABEL@35_3:	; switch_clause_bb31
	;***      809 : 	case 0:
	;***      810 : 		g_machine_state.mode = WATER_WASHING;
	;***      811 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      812 : 		g_color = WHITE;
	;***      813 : 		*tick = g_systemTime;
	;***      814 : 		(*state)++;
	;***      815 : 		handSensorLED(g_color);
	;***      816 : 		break;
	;***      817 : 	case 1:
	;***      818 : 		if (ns_delay_ms(tick, 50)) {
	;***      819 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      820 : 			(*state)++;
	;***      821 : 		}
	;***      822 : 		break;
	;***      823 : 	case 2:
	;***      824 : 		if (DETECT_U == I_ON) {
	;***      825 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      826 : 			g_color = BLACK;
	;***      827 : 			(*state) = 0;
	;***      828 : 			g_machine_state.mode = BUSY;
	;***      829 : 			handSensorLED(g_color);
	;***      830 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      831 : 		}
	;***      832 : 		break;
	;***      833 : 	default:
	;***      834 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 834
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@35_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 810
	mov !LOWW(_g_machine_state+0x0000C), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 811
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 812
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 813
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 814
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 815
	mov a, #0x02
	br $!_handSensorLED
.BB@LABEL@35_5:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 818
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00018)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@35_9
.BB@LABEL@35_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 819
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call $!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 820
	inc !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@35_7:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 824
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@35_9
.BB@LABEL@35_8:	; if_then_bb27
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 825
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 826
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 827
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 828
	mov !LOWW(_g_machine_state+0x0000C), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 829
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 830
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@35_9:	; return
	;***      835 : 		break;
	;***      836 : 	}
	;***      837 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 837
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***      838 : 
	;***      839 : /**
	;***      840 :  * Tested: 24/12/2021 by Mr.An
	;***      841 :  */
	;***      842 : void HandWashingMode_nostop(void) {
	;***      843 : 	uint8_t *state = &g_machine_state.handwash;
	;***      844 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      845 : 	const uint32_t delayPump_ms = 50;
	;***      846 : 	if ((*state) == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 846
	mov a, !LOWW(_g_machine_state+0x00003)
	mov d, a
	cmp0 a
	bnz $.BB@LABEL@36_10
.BB@LABEL@36_1:	; if_then_bb
	;***      847 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 847
	movw ax, !LOWW(_g_timerSetting+0x00076)
	movw bc, ax
	cmpw ax, #0x0000
	movw ax, !LOWW(_g_timerSetting+0x00074)
	movw hl, ax
	sknz
.BB@LABEL@36_2:	; if_then_bb
	cmpw ax, #0x0032
.BB@LABEL@36_3:	; if_then_bb
	bnc $.BB@LABEL@36_5
.BB@LABEL@36_4:	; if_then_bb.bb22_crit_edge
	clrw bc
	movw ax, #0x0032
	br $.BB@LABEL@36_9
.BB@LABEL@36_5:	; bb15
	movw ax, bc
	;***      848 : 				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***      849 : 						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***      850 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 850
	cmpw ax, #0x0000
	movw ax, hl
	sknz
.BB@LABEL@36_6:	; bb15
	cmpw ax, #0x03E9
.BB@LABEL@36_7:	; bb15
	bc $.BB@LABEL@36_9
.BB@LABEL@36_8:	; bb15.bb25_crit_edge
	clrw bc
	movw ax, #0x03E8
.BB@LABEL@36_9:	; bb25
	movw !LOWW(_g_timerSetting+0x00074), ax
	movw ax, bc
	movw !LOWW(_g_timerSetting+0x00076), ax
.BB@LABEL@36_10:	; if_break_bb
	mov a, d
	;***      851 : 				g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***      852 : 						1000 : g_timerSetting.t54_overLapTime_ms;
	;***      853 : 	} else {
	;***      854 : //		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
	;***      855 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      856 : //		}
	;***      857 : 	}
	;***      858 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 858
	cmp0 a
	bz $.BB@LABEL@36_19
.BB@LABEL@36_11:	; if_break_bb
	dec a
	bz $.BB@LABEL@36_20
.BB@LABEL@36_12:	; if_break_bb
	dec a
	bz $.BB@LABEL@36_23
.BB@LABEL@36_13:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@36_27
.BB@LABEL@36_14:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@36_31
.BB@LABEL@36_15:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@36_37
.BB@LABEL@36_16:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@36_42
.BB@LABEL@36_17:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@36_45
.BB@LABEL@36_18:	; switch_clause_bb125
	;***      859 : 	case 0:
	;***      860 : 		*state = 1;
	;***      861 : 		*tick = g_systemTime;
	;***      862 : 		break;
	;***      863 : 	case 1:
	;***      864 : 		g_machine_state.mode = HAND_WASHING;
	;***      865 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      866 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      867 : 			O_PUMP_ALK_PIN = ON;
	;***      868 : 			handSensorLED(BLUE);
	;***      869 : 			(*state)++;
	;***      870 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      871 : //			g_Tick.tickAnimation = g_systemTime;
	;***      872 : //			g_machine_state.waitAnimationRes = 1;
	;***      873 : 		}
	;***      874 : 		break;
	;***      875 : 	case 2:
	;***      876 : 		if (ns_delay_ms(tick,
	;***      877 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      878 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      879 : 			O_PUMP_ALK_PIN = OFF;
	;***      880 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      881 : 			(*state)++;
	;***      882 : 		}
	;***      883 : 		break;
	;***      884 : 	case 3:
	;***      885 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      886 : 			O_PUMP_ACID_PIN = ON;
	;***      887 : 			handSensorLED(RED);
	;***      888 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      889 : 			(*state)++;
	;***      890 : 		}
	;***      891 : 		break;
	;***      892 : 	case 4:
	;***      893 : 		if (ns_delay_ms(tick,
	;***      894 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      895 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      896 : 			(*state)++;
	;***      897 : 		}
	;***      898 : 		break;
	;***      899 : 	case 5:
	;***      900 : 		if (ns_delay_ms(tick,
	;***      901 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      902 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      903 : 			O_PUMP_ACID_PIN = OFF;
	;***      904 : 			handSensorLED(WHITE);
	;***      905 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      906 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      907 : 			(*state)++;
	;***      908 : 		}
	;***      909 : 		break;
	;***      910 : 	case 6:
	;***      911 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      912 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      913 : 			(*state)++;
	;***      914 : 		}
	;***      915 : 		break;
	;***      916 : 	case 7:
	;***      917 : 		if (ns_delay_ms(tick,
	;***      918 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      919 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      920 : 			handSensorLED(BLACK);
	;***      921 : 			(*state) = 0;
	;***      922 : 			g_machine_state.mode = BUSY;
	;***      923 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      924 : 		}
	;***      925 : 		break;
	;***      926 : 	default:
	;***      927 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 927
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@36_19:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 860
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 861
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	ret
.BB@LABEL@36_20:	; switch_clause_bb34
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 864
	oneb !LOWW(_g_machine_state+0x0000C)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 865
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 866
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_28
.BB@LABEL@36_21:	; if_then_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 867
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 868
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 869
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@36_22:	; if_then_bb41
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@36_23:	; switch_clause_bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 876
	movw ax, !LOWW(_g_timerSetting+0x00068)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0006A)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x00074)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@36_24:	; switch_clause_bb46
	decw ax
.BB@LABEL@36_25:	; switch_clause_bb46
	subw ax, !LOWW(_g_timerSetting+0x00076)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_34
.BB@LABEL@36_26:	; if_then_bb56
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 879
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 880
	set1 0xFFF07.6
	br $.BB@LABEL@36_36
.BB@LABEL@36_27:	; switch_clause_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 885
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@36_28:	; switch_clause_bb61
	bz $.BB@LABEL@36_40
.BB@LABEL@36_29:	; if_then_bb68
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 886
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 887
	oneb a
	call $!_handSensorLED
.BB@LABEL@36_30:	; if_then_bb68
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi_f
	br $.BB@LABEL@36_36
.BB@LABEL@36_31:	; switch_clause_bb73
	movw ax, #0xFFCE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 893
	addw ax, !LOWW(_g_timerSetting+0x00074)
	movw bc, ax
	clrw ax
	decw ax
	sknc
.BB@LABEL@36_32:	; switch_clause_bb73
	incw ax
.BB@LABEL@36_33:	; switch_clause_bb73
	addw ax, !LOWW(_g_timerSetting+0x00076)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@36_34:	; switch_clause_bb73
	bz $.BB@LABEL@36_43
.BB@LABEL@36_35:	; if_then_bb82
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 895
	clr1 0xFFF07.7
.BB@LABEL@36_36:	; if_then_bb82
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 931
	ret
.BB@LABEL@36_37:	; switch_clause_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 900
	movw ax, !LOWW(_g_timerSetting+0x0006C)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0006E)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x00074)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@36_38:	; switch_clause_bb87
	decw ax
.BB@LABEL@36_39:	; switch_clause_bb87
	subw ax, !LOWW(_g_timerSetting+0x00076)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@36_40:	; switch_clause_bb87
	bz $.BB@LABEL@36_47
.BB@LABEL@36_41:	; if_then_bb97
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 903
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 904
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 905
	set1 0xFFF05.5
	br $.BB@LABEL@36_30
.BB@LABEL@36_42:	; switch_clause_bb102
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 911
	movw bc, !LOWW(_g_timerSetting+0x00074)
	movw de, !LOWW(_g_timerSetting+0x00076)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@36_43:	; switch_clause_bb102
	bz $.BB@LABEL@36_47
.BB@LABEL@36_44:	; if_then_bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 912
	clr1 0xFFF07.6
	br $.BB@LABEL@36_36
.BB@LABEL@36_45:	; switch_clause_bb114
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 917
	movw ax, !LOWW(_g_timerSetting+0x00070)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00072)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_47
.BB@LABEL@36_46:	; if_then_bb122
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 919
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 920
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 921
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 922
	mov !LOWW(_g_machine_state+0x0000C), #0x07
	br $!.BB@LABEL@36_22
.BB@LABEL@36_47:	; return
	;***      928 : 		break;
	;***      929 : 	}
	;***      930 : 
	;***      931 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 931
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      932 : /**
	;***      933 :  * Tested: 24/12/2021 by Mr.An
	;***      934 :  */
	;***      935 : void AcidWaterMode_nostop(void) {
	;***      936 : 	uint8_t *state = &g_machine_state.acid;
	;***      937 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      938 : 	const uint32_t delayPump_ms = 50;
	;***      939 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 939
	mov a, !LOWW(_g_machine_state+0x00001)
	cmp0 a
	bz $.BB@LABEL@37_5
.BB@LABEL@37_1:	; entry
	dec a
	bz $.BB@LABEL@37_6
.BB@LABEL@37_2:	; entry
	dec a
	bz $.BB@LABEL@37_8
.BB@LABEL@37_3:	; entry
	movw de, #0x0000
	dec a
	bz $.BB@LABEL@37_12
.BB@LABEL@37_4:	; switch_clause_bb57
	;***      940 : 	case 0:
	;***      941 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      942 : 		g_machine_state.mode = ACID_WASHING;
	;***      943 : 		*state = 1;
	;***      944 : 		*tick = g_systemTime;
	;***      945 : 		break;
	;***      946 : 	case 1:
	;***      947 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      948 : 		g_color = RED;
	;***      949 : 		handSensorLED(g_color);
	;***      950 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      951 : 			O_PUMP_ACID_PIN = ON;
	;***      952 : 			(*state)++;
	;***      953 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      954 : 		}
	;***      955 : 		break;
	;***      956 : 	case 2:
	;***      957 : 		//TODO: Change turn OFF signal here
	;***      958 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      959 : 				|| (DETECT_U == I_ON)) {
	;***      960 : 			O_PUMP_ACID_PIN = OFF;
	;***      961 : 			(*state)++;
	;***      962 : 		}
	;***      963 : 		break;
	;***      964 : 	case 3:
	;***      965 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      966 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      967 : 			g_color = BLACK;
	;***      968 : 			handSensorLED(g_color);
	;***      969 : 			(*state)++;
	;***      970 : 		}
	;***      971 : 		break;
	;***      972 : 	default:
	;***      973 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 973
	mov !LOWW(_g_machine_state+0x0000C), #0x07
	;***      974 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 974
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi_f
	;***      975 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 975
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@37_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 942
	mov !LOWW(_g_machine_state+0x0000C), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 943
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 944
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@37_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 947
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 948
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 949
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 950
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@37_14
.BB@LABEL@37_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 951
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 952
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 953
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@37_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 958
	movw ax, !LOWW(_g_timerSetting+0x0007C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0007E)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@37_10
.BB@LABEL@37_9:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@37_14
.BB@LABEL@37_10:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 960
	clr1 0xFFF06.2
.BB@LABEL@37_11:	; if_then_bb39
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 978
	ret
.BB@LABEL@37_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 965
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@37_14
.BB@LABEL@37_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 966
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 967
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 968
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@37_11
.BB@LABEL@37_14:	; return
	;***      976 : 		break;
	;***      977 : 	}
	;***      978 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 978
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      979 : /**
	;***      980 :  * Tested: 24/12/2021 by Mr.An
	;***      981 :  */
	;***      982 : void AlkalineWaterMode_nostop(void) {
	;***      983 : 	uint8_t *state = &g_machine_state.akaline;
	;***      984 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      985 : 	const uint32_t delayPump_ms = 50;
	;***      986 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 986
	mov a, !LOWW(_g_machine_state)
	cmp0 a
	bz $.BB@LABEL@38_5
.BB@LABEL@38_1:	; entry
	dec a
	bz $.BB@LABEL@38_6
.BB@LABEL@38_2:	; entry
	dec a
	bz $.BB@LABEL@38_8
.BB@LABEL@38_3:	; entry
	movw de, #0x0000
	dec a
	bz $.BB@LABEL@38_12
.BB@LABEL@38_4:	; switch_clause_bb57
	;***      987 : 	case 0:
	;***      988 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      989 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      990 : 		*state = 1;
	;***      991 : 		*tick = g_systemTime;
	;***      992 : 		break;
	;***      993 : 	case 1:
	;***      994 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      995 : 		g_color = BLUE;
	;***      996 : 		handSensorLED(g_color);
	;***      997 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      998 : 			O_PUMP_ALK_PIN = ON;
	;***      999 : 			(*state)++;
	;***     1000 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***     1001 : 		}
	;***     1002 : 		break;
	;***     1003 : 	case 2:
	;***     1004 : 		//TODO: Change turn OFF signal here
	;***     1005 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***     1006 : 				|| (DETECT_U == I_ON)) {
	;***     1007 : 			O_PUMP_ALK_PIN = OFF;
	;***     1008 : 			(*state)++;
	;***     1009 : 		}
	;***     1010 : 		break;
	;***     1011 : 	case 3:
	;***     1012 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***     1013 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***     1014 : 			g_color = BLACK;
	;***     1015 : 			handSensorLED(g_color);
	;***     1016 : 			(*state)++;
	;***     1017 : 		}
	;***     1018 : 		break;
	;***     1019 : 	default:
	;***     1020 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1020
	mov !LOWW(_g_machine_state+0x0000C), #0x07
	;***     1021 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1021
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi_f
	;***     1022 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1022
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@38_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 989
	mov !LOWW(_g_machine_state+0x0000C), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 990
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 991
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@38_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 994
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 995
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 996
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 997
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_14
.BB@LABEL@38_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 998
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 999
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1000
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@38_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1005
	movw ax, !LOWW(_g_timerSetting+0x00080)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00082)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@38_10
.BB@LABEL@38_9:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@38_14
.BB@LABEL@38_10:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1007
	clr1 0xFFF06.1
.BB@LABEL@38_11:	; if_then_bb39
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1025
	ret
.BB@LABEL@38_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1012
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_14
.BB@LABEL@38_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1013
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1014
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1015
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@38_11
.BB@LABEL@38_14:	; return
	;***     1023 : 		break;
	;***     1024 : 	}
	;***     1025 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1025
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***     1026 : 
	;***     1027 : // Newest
	;***     1028 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1028
	subw sp, #0x0A
	;***     1029 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1029
	call $!_UpdateMachineStatus
.BB@LABEL@39_1:	; bb1
	;***     1030 : 	while (InitialOperationModeStart_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1030
	call $!_InitialOperationModeStart_nostop
	cmp0 a
	bz $.BB@LABEL@39_3
.BB@LABEL@39_2:	; bb
	;***     1031 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1031
	call $!_RaspberryResponse_nostop
	;***     1032 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1032
	call $!_UpdateMachineStatus
	;***     1033 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1033
	call !!_R_WDT_Restart
	br $.BB@LABEL@39_1
.BB@LABEL@39_3:	; bb5
	;***     1034 : 	}
	;***     1035 : 
	;***     1036 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1036
	call $!_UpdateMachineStatus
.BB@LABEL@39_4:	; bb7
	;***     1037 : 	while (WaterSupplyOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1037
	call $!_WaterSupplyOperation_nostop
	cmp0 a
	bz $.BB@LABEL@39_6
.BB@LABEL@39_5:	; bb6
	;***     1038 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1038
	call $!_realTimeResponse
	br $.BB@LABEL@39_4
.BB@LABEL@39_6:	; bb13
	;***     1039 : 	}
	;***     1040 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1040
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x00006)
	movw [sp+0x08], ax
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_fge
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@39_7:	; bb13
	clrb a
.BB@LABEL@39_8:	; bb13
	cmp0 x
	oneb x
	sknz
.BB@LABEL@39_9:	; bb13
	clrb x
.BB@LABEL@39_10:	; bb13
	or x, a
	bnz $.BB@LABEL@39_12
.BB@LABEL@39_11:	; if_then_bb
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	;***     1041 : 		sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1041
	movw ax, #0x4104
	call $!_sendToRasPi_f
.BB@LABEL@39_12:	; bb21
	;***     1042 : 				g_io_status.refined.FlowValue);
	;***     1043 : 	}
	;***     1044 : 	while (!ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1044
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@39_14
.BB@LABEL@39_13:	; bb20
	;***     1045 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1045
	call $!_realTimeResponse
	br $.BB@LABEL@39_12
.BB@LABEL@39_14:	; return
	;***     1046 : 	}
	;***     1047 : 
	;***     1048 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1048
	addw sp, #0x0A
	ret
_userAuthHandler_nostop:
	.STACK _userAuthHandler_nostop = 4
	;***     1049 : 
	;***     1050 : void userAuthHandler_nostop(void) {
	;***     1051 : 	if (g_machine_state.user == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1051
	cmp !LOWW(_g_machine_state+0x0000B), #0x01
	bnz $.BB@LABEL@40_9
.BB@LABEL@40_1:	; if_then_bb
	;***     1052 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1052
	mov a, !LOWW(_g_machine_mode)
	dec a
	bz $.BB@LABEL@40_6
.BB@LABEL@40_2:	; if_then_bb
	dec a
	bz $.BB@LABEL@40_7
.BB@LABEL@40_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@40_8
.BB@LABEL@40_4:	; if_then_bb
	dec a
	bnz $.BB@LABEL@40_9
.BB@LABEL@40_5:	; switch_clause_bb8
	;***     1053 : 		case HAND_WASHING:
	;***     1054 : 			HandWashingMode_nostop();
	;***     1055 : 			break;
	;***     1056 : 		case WATER_WASHING:
	;***     1057 : 			WaterWashingMode_nostop();
	;***     1058 : 			break;
	;***     1059 : 		case ACID_WASHING:
	;***     1060 : 			AcidWaterMode_nostop();
	;***     1061 : 			break;
	;***     1062 : 		case ALKALINE_WASHING:
	;***     1063 : 			AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1063
	br $!_AlkalineWaterMode_nostop
.BB@LABEL@40_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1054
	br $!_HandWashingMode_nostop
.BB@LABEL@40_7:	; switch_clause_bb6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1057
	br $!_WaterWashingMode_nostop
.BB@LABEL@40_8:	; switch_clause_bb7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1060
	br $!_AcidWaterMode_nostop
.BB@LABEL@40_9:	; return
	;***     1064 : 			break;
	;***     1065 : 		default:
	;***     1066 : 			break;
	;***     1067 : 		}
	;***     1068 : 	}
	;***     1069 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1069
	ret
_ElectrolyzeWaterGeneration_nostop:
	.STACK _ElectrolyzeWaterGeneration_nostop = 4
	;***     1070 : /*!
	;***     1071 :  * Tested!
	;***     1072 :  */
	;***     1073 : void ElectrolyzeWaterGeneration_nostop(void) {
	;***     1074 : 	if ((g_machine_state.mode != ELECTROLYTIC_GENERATION) &&(g_machine_state.mode == INDIE)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1074
	mov a, !LOWW(_g_machine_state+0x0000C)
	cmp0 a
	bnz $.BB@LABEL@41_4
.BB@LABEL@41_1:	; if_then_bb
	;***     1075 : 		if (isAcidTankEmpty() || isAlkalineTankEmpty()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1075
	call $!_isAcidTankEmpty
	cmp0 a
	bnz $.BB@LABEL@41_3
.BB@LABEL@41_2:	; bb18
	call $!_isAlkalineTankEmpty
	cmp0 a
	bz $.BB@LABEL@41_12
.BB@LABEL@41_3:	; if_then_bb31
	;***     1076 : 			// Start Electrolyte
	;***     1077 : 			g_machine_state.mode = ELECTROLYTIC_GENERATION;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1077
	mov !LOWW(_g_machine_state+0x0000C), #0x08
	;***     1078 : 			//Stop what ever operation is happening
	;***     1079 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1079
	clrb !LOWW(_g_machine_state+0x0000B)
	;***     1080 : 			g_machine_state.handwash = g_machine_state.water =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1080
	clrb !LOWW(_g_machine_state)
	clrb !LOWW(_g_machine_state+0x00001)
	clrb !LOWW(_g_machine_state+0x00002)
	clrb !LOWW(_g_machine_state+0x00003)
	movw hl, #0xFF06
	movw ax, hl
	movw de, ax
	;***     1081 : 					g_machine_state.acid = g_machine_state.akaline = 0;
	;***     1082 : 			O_PUMP_ACID_PIN = O_PUMP_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1082
	clr1 [hl].1
	mov a, [de]
	mov1 CY, a.1
	mov a, [de]
	mov1 a.2, CY
	mov [de], a
	;***     1083 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1083
	clr1 0xFFF05.5
	ret
.BB@LABEL@41_4:	; if_else_bb
	;***     1084 : 
	;***     1085 : 		}
	;***     1086 : 	} else if (g_machine_state.mode == ELECTROLYTIC_GENERATION) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1086
	cmp a, #0x08
	bnz $.BB@LABEL@41_12
.BB@LABEL@41_5:	; if_then_bb49
	;***     1087 : 		// Start Loop Electrolyte
	;***     1088 : 		if (ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1088
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@41_13
.BB@LABEL@41_6:	; if_else_bb63
	;***     1089 : 			O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
	;***     1090 : 			g_machine_state.mode = INDIE;
	;***     1091 : 			g_machine_state.user = 0;
	;***     1092 : 			handSensorLED(BLACK);
	;***     1093 : 			// Start Electrolyte Operation Off time keeper
	;***     1094 : 		} else if (!isAcidTankFull() && !isAlkalineTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1094
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@41_8
.BB@LABEL@41_7:	; bb74
	call $!_isAlkalineTankFull
	cmp0 a
	;***     1095 : 			handSensorLEDBlink(WHITE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1095
	mov a, #0x02
	bz $.BB@LABEL@41_10
.BB@LABEL@41_8:	; if_else_bb94
	;***     1096 : 		} else if (!isAcidTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1096
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@41_11
.BB@LABEL@41_9:	; if_then_bb106
	;***     1097 : 			handSensorLEDBlink(RED, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1097
	oneb a
.BB@LABEL@41_10:	; if_then_bb106
	movw de, #0x0000
	movw bc, #0x0064
	br $!_handSensorLEDBlink
.BB@LABEL@41_11:	; if_else_bb107
	;***     1098 : 		} else if (!isAlkalineTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1098
	call $!_isAlkalineTankFull
	cmp0 a
	;***     1099 : 			handSensorLEDBlink(BLUE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1099
	mov a, #0x03
	bz $.BB@LABEL@41_10
.BB@LABEL@41_12:	; return
	;***     1100 : 		}
	;***     1101 : 	}
	;***     1102 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1102
	ret
.BB@LABEL@41_13:	; if_then_bb55
	movw hl, #0xFF07
	movw ax, hl
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1089
	clr1 [hl].7
	mov a, [de]
	mov1 CY, a.7
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1090
	clrb !LOWW(_g_machine_state+0x0000C)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1091
	clrb !LOWW(_g_machine_state+0x0000B)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1092
	clrb a
	br $!_handSensorLED
_isSV1andSV2Off8h:
	.STACK _isSV1andSV2Off8h = 8
	;***     1103 : /*!
	;***     1104 :  * Tested!
	;***     1105 :  */
	;***     1106 : uint8_t isSV1andSV2Off8h(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1106
	push hl
	;***     1107 : 	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1107
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@42_5
.BB@LABEL@42_1:	; bb
	mov a, 0xFFF05
	bt a.5, $.BB@LABEL@42_5
.BB@LABEL@42_2:	; if_then_bb
	;***     1108 : 		if (ns_delay_ms(&g_Tick.tickSV1SV2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1108
	movw ax, !LOWW(_g_timerSetting+0x00084)
	movw hl, ax
	movw bc, #0x0036
	mulh
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00086)
	movw bc, #0xEE80
	mulh
	movw [sp+0x00], ax
	movw ax, hl
	movw bc, #0xEE80
	mulhu
	push bc
	pop hl
	movw bc, ax
	movw ax, [sp+0x00]
	addw ax, de
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00040)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	oneb a
	sknz
.BB@LABEL@42_3:	; if_then_bb
	clrb a
.BB@LABEL@42_4:	; if_then_bb
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1117
	ret
.BB@LABEL@42_5:	; if_else_bb
	;***     1109 : 				(uint32_t) g_timerSetting.t61_curranCleaningIntervalTime_h * 60
	;***     1110 : 						* 60 * 1000)) {
	;***     1111 : 			return 1;
	;***     1112 : 		}
	;***     1113 : 	} else {
	;***     1114 : 		g_Tick.tickSV1SV2 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1114
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
	clrb a
	br $.BB@LABEL@42_4
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***     1115 : 	}
	;***     1116 : 	return 0;
	;***     1117 : }
	;***     1118 : /*!
	;***     1119 :  * Tested!
	;***     1120 :  */
	;***     1121 : void CallanCleaningMode_nostop(void) {
	;***     1122 : 	uint8_t *state = &g_machine_state.callan;
	;***     1123 : 	uint32_t *tick = &g_Tick.tickCallan;
	;***     1124 : 	if (isSV1andSV2Off8h() || (*state) != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1124
	call $!_isSV1andSV2Off8h
	cmp0 a
	bnz $.BB@LABEL@43_2
.BB@LABEL@43_1:	; bb
	cmp0 !LOWW(_g_machine_state+0x00006)
	bz $.BB@LABEL@43_8
.BB@LABEL@43_2:	; if_then_bb
	;***     1125 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1125
	mov a, !LOWW(_g_machine_state+0x00006)
	cmp0 a
	bz $.BB@LABEL@43_5
.BB@LABEL@43_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@43_6
.BB@LABEL@43_4:	; switch_clause_bb37
	;***     1126 : 		case 0:
	;***     1127 : 			(*state)++;
	;***     1128 : 			*tick = g_systemTime;
	;***     1129 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***     1130 : 			g_machine_state.mode = CALLAN_MODE;
	;***     1131 : 			break;
	;***     1132 : 		case 1:
	;***     1133 : 			handSensorLEDBlink(WHITE, 500);
	;***     1134 : 			if (ns_delay_ms(tick,
	;***     1135 : 					g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***     1136 : 				(*state)++;
	;***     1137 : 				O_SPOUT_WATER_PIN_SV2 = OFF;
	;***     1138 : 				handSensorLED(BLACK);
	;***     1139 : 			}
	;***     1140 : 			break;
	;***     1141 : 		default:
	;***     1142 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1142
	clrb !LOWW(_g_machine_state+0x00006)
	ret
.BB@LABEL@43_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1127
	inc a
	mov !LOWW(_g_machine_state+0x00006), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1128
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1129
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1130
	mov !LOWW(_g_machine_state+0x0000C), #0x09
	ret
.BB@LABEL@43_6:	; switch_clause_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1133
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	mov a, #0x02
	call $!_handSensorLEDBlink
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1134
	movw ax, !LOWW(_g_timerSetting+0x00088)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0008A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00054)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@43_8
.BB@LABEL@43_7:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1136
	inc !LOWW(_g_machine_state+0x00006)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1137
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1138
	clrb a
	br $!_handSensorLED
.BB@LABEL@43_8:	; return
	;***     1143 : 			break;
	;***     1144 : 		}
	;***     1145 : 	}
	;***     1146 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1146
	ret
_DrainageMode_nostop:
	.STACK _DrainageMode_nostop = 14
	;***     1147 : void DrainageMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1147
	subw sp, #0x06
	;***     1148 : 	uint8_t *state = &g_machine_state.drainage;
	;***     1149 : 	uint32_t *tick = &g_Tick.tickDrainage;
	;***     1150 : 	if (g_machine_state.mode == DRAINAGE_MODE) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1150
	mov a, !LOWW(_g_machine_state+0x0000C)
	mov b, a
	cmp a, #0x0A
	.bnz $!.BB@LABEL@44_25
.BB@LABEL@44_1:	; if_then_bb
	;***     1151 : 		// Start Drainage Loop
	;***     1152 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1152
	mov a, !LOWW(_g_machine_state+0x00009)
	mov [sp+0x00], a
	cmp0 a
	bz $.BB@LABEL@44_7
.BB@LABEL@44_2:	; if_then_bb
	dec a
	bz $.BB@LABEL@44_9
.BB@LABEL@44_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@44_11
.BB@LABEL@44_4:	; if_then_bb
	dec a
	.bz $!.BB@LABEL@44_17
.BB@LABEL@44_5:	; if_then_bb
	dec a
	.bz $!.BB@LABEL@44_20
.BB@LABEL@44_6:	; switch_clause_bb104
	;***     1153 : 		case 0:
	;***     1154 : 			if (InitialOperationModeStart_nostop() == 0) {
	;***     1155 : 				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***     1156 : 				(*state)++;
	;***     1157 : 			}
	;***     1158 : 			break;
	;***     1159 : 		case 1:
	;***     1160 : 			if (ns_delay_ms(tick, 15 * 1000)) {
	;***     1161 : 				(*state)++;
	;***     1162 : 			}
	;***     1163 : 			break;
	;***     1164 : 		case 2:
	;***     1165 : 			if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***     1166 : 					|| (g_io_status.refined.FlowValue
	;***     1167 : 							> g_numberSetting.upperFlow)) {
	;***     1168 : 				(*state)--;
	;***     1169 : 				rx_count++;
	;***     1170 : 			} else {
	;***     1171 : 				(*state)++;
	;***     1172 : 			}
	;***     1173 : 			(*tick) = g_systemTime;
	;***     1174 : 			break;
	;***     1175 : 		case 3:
	;***     1176 : 			if (ns_delay_ms(tick, 10 * 1000)) {
	;***     1177 : 				electrolyticOperationON();
	;***     1178 : 				(*state)++;
	;***     1179 : 			}
	;***     1180 : 			break;
	;***     1181 : 		case 4:
	;***     1182 : 			if (isAcidTankFull() && isAlkalineTankFull()) {
	;***     1183 : 				electrolyticOperationOFF();
	;***     1184 : 				(*state)++;
	;***     1185 : 			}
	;***     1186 : 			break;
	;***     1187 : 		default:
	;***     1188 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1188
	clrb !LOWW(_g_machine_state+0x00009)
	;***     1189 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1189
	clrb !LOWW(_g_machine_state+0x0000C)
	br $.BB@LABEL@44_16
.BB@LABEL@44_7:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1154
	call $!_InitialOperationModeStart_nostop
	cmp0 a
	bnz $.BB@LABEL@44_16
.BB@LABEL@44_8:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1155
	set1 0xFFF01.7
	br $.BB@LABEL@44_10
.BB@LABEL@44_9:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1160
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@44_16
.BB@LABEL@44_10:	; if_then_bb24
	inc !LOWW(_g_machine_state+0x00009)
	br $.BB@LABEL@44_16
.BB@LABEL@44_11:	; switch_clause_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1165
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
	push ax
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_io_status+0x00006)
	movw [sp+0x06], ax
	call !!__COM_flt
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@44_14
.BB@LABEL@44_12:	; bb
	movw ax, !LOWW(_g_numberSetting+0x0001A)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00018)
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fgt
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@44_14
.BB@LABEL@44_13:	; bb40.thread
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1171
	inc a
	mov !LOWW(_g_machine_state+0x00009), a
	br $.BB@LABEL@44_15
.BB@LABEL@44_14:	; bb40
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1168
	dec a
	mov !LOWW(_g_machine_state+0x00009), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1169
	inc !LOWW(_rx_count)
.BB@LABEL@44_15:	; if_break_bb54
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
.BB@LABEL@44_16:	; return
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1199
	ret
.BB@LABEL@44_17:	; switch_clause_bb57
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1176
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@44_16
.BB@LABEL@44_18:	; if_then_bb63
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1177
	call $!_electrolyticOperationON
.BB@LABEL@44_19:	; if_then_bb63
	br $.BB@LABEL@44_10
.BB@LABEL@44_20:	; switch_clause_bb68
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1182
	call $!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@44_16
.BB@LABEL@44_21:	; bb73
	call $!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@44_16
.BB@LABEL@44_22:	; if_then_bb86
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1183
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@44_23:	; if_then_bb86.bb96_crit_edge
	oneb a
.BB@LABEL@44_24:	; bb96
	mov !LOWW(_g_machine_state+0x00008), a
	br $.BB@LABEL@44_19
.BB@LABEL@44_25:	; if_else_bb106
	;***     1190 : 			break;
	;***     1191 : 		}
	;***     1192 : 	} else if ((g_TimeKeeper.electrolyteOff_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1192
	mov a, !LOWW(_g_TimeKeeper@1)
	shrw ax, 8+0x00000
	movw de, ax
	clrw ax
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, de
	sknz
.BB@LABEL@44_26:	; if_else_bb106
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@44_27:	; if_else_bb106
	bc $.BB@LABEL@44_16
.BB@LABEL@44_28:	; bb112
	cmp0 !LOWW(_g_machine_state+0x0000A)
	bz $.BB@LABEL@44_16
.BB@LABEL@44_29:	; bb112
	cmp0 b
	bnz $.BB@LABEL@44_16
.BB@LABEL@44_30:	; if_then_bb137
	;***     1193 : 			>= g_timerSetting.t6_drainageOffTime_h)
	;***     1194 : 			&& (g_machine_state.isMidNight != 0)
	;***     1195 : 			&& (g_machine_state.mode == INDIE)) {
	;***     1196 : 		g_machine_state.mode = DRAINAGE_MODE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1196
	mov !LOWW(_g_machine_state+0x0000C), #0x0A
	br $.BB@LABEL@44_15
_NormalMode_nostop:
	.STACK _NormalMode_nostop = 6
	;***     1197 : 		(*tick) = g_systemTime;
	;***     1198 : 	}
	;***     1199 : }
	;***     1200 : /*!
	;***     1201 :  * Tested!
	;***     1202 :  */
	;***     1203 : void NormalMode_nostop(void) {
	;***     1204 : 	if ((g_machine_state.mode != BUSY)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1204
	mov a, !LOWW(_g_machine_state+0x0000C)
	mov x, a
	add a, #0xF9
	cmp a, #0x02
	bc $.BB@LABEL@45_3
.BB@LABEL@45_1:	; entry
	mov a, x
	cmp a, #0x09
	bz $.BB@LABEL@45_3
.BB@LABEL@45_2:	; entry
	cmp a, #0x0A
	bnz $.BB@LABEL@45_7
.BB@LABEL@45_3:	; if_else_bb
	mov a, x
	;***     1205 : 			&& (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1206 : 			&& (g_machine_state.mode != CALLAN_MODE)
	;***     1207 : 			&& (g_machine_state.mode != DRAINAGE_MODE)) {
	;***     1208 : 		userAuthHandler_nostop();
	;***     1209 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***     1210 : 	} else if (g_machine_state.mode == BUSY) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1210
	cmp a, #0x07
	bnz $.BB@LABEL@45_6
.BB@LABEL@45_4:	; if_then_bb44
	;***     1211 : 		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1211
	movw ax, !LOWW(_g_timerSetting+0x00078)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0007A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00028)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@45_6
.BB@LABEL@45_5:	; if_then_bb52
	;***     1212 : 				g_timerSetting.t55_waterDischargeDelay_s * 1000)) {
	;***     1213 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1213
	clrb !LOWW(_g_machine_state+0x0000C)
	;***     1214 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1214
	clrb !LOWW(_g_machine_state+0x0000B)
.BB@LABEL@45_6:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1217
	ret
.BB@LABEL@45_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1208
	call $!_userAuthHandler_nostop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1209
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00028), ax
	ret
_TestMode_nostop:
	.STACK _TestMode_nostop = 4
	;***     1215 : 		}
	;***     1216 : 	}
	;***     1217 : }
	;***     1218 : void TestMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1218
	ret
_main_loop_20211111:
	.STACK _main_loop_20211111 = 4
	;***     1219 : 
	;***     1220 : }
	;***     1221 : void main_loop_20211111(void) {
	;***     1222 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1222
	call $!_measureFlowSensor_nostop
	;***     1223 : 	DrainageMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1223
	call $!_DrainageMode_nostop
	;***     1224 : 	ElectrolyzeWaterGeneration_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1224
	call $!_ElectrolyzeWaterGeneration_nostop
	;***     1225 : 	CallanCleaningMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1225
	call $!_CallanCleaningMode_nostop
	;***     1226 : 	NormalMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1226
	br $_NormalMode_nostop
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***     1227 : }
	;***     1228 : 
	;***     1229 : /**
	;***     1230 :  * 30/11/2021: Checked by An
	;***     1231 :  */
	;***     1232 : void electrolyticOperationON(void) {
	;***     1233 : 	//Electrolytic operation ON
	;***     1234 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1234
	set1 0xFFF01.7
	;***     1235 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1235
	set1 0xFFF0E.2
	;***     1236 : 	O_PUMP_SALT_PIN_SP1 = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1236
	set1 0xFFF06.0
	;***     1237 : 	g_machine_state.electrolyteOperation = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1237
	oneb !LOWW(_g_machine_state+0x00007)
	;***     1238 : 	g_TimeKeeper.electrolyteOff_h = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1238
	clrb !LOWW(_g_TimeKeeper@1)
	;***     1239 : 	g_TimeKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1239
	movw bc, !LOWW(_g_TimeKeeper@1+0x00004)
	movw ax, !LOWW(_g_TimeKeeper@1+0x00002)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@48_3
.BB@LABEL@48_1:	; entry
	bc $.BB@LABEL@48_3
.BB@LABEL@48_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@48_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TimeKeeper@1+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_TimeKeeper@1+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1242
	ret
_isElectrolyticOperationOFF_nostop:
	.STACK _isElectrolyticOperationOFF_nostop = 6
	;***     1240 : 			g_TimeKeeper.neutralization == 0 ?
	;***     1241 : 					g_systemTime : g_TimeKeeper.neutralization;
	;***     1242 : }
	;***     1243 : void isElectrolyticOperationOFF_nostop(void) {
	;***     1244 : 	uint8_t *state = &g_machine_state.electrolyteOFF;
	;***     1245 : 	uint32_t *tick = &g_Tick.tickElectrolyticOff;
	;***     1246 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1246
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	bz $.BB@LABEL@49_6
.BB@LABEL@49_1:	; entry
	dec a
	bz $.BB@LABEL@49_11
.BB@LABEL@49_2:	; entry
	dec a
	bnz $.BB@LABEL@49_5
.BB@LABEL@49_3:	; switch_clause_bb34
	;***     1247 : 	case 0:
	;***     1248 : 		// Set g_machine_state.electrolyteOFF = 1 to start OFF
	;***     1249 : 		// This case run when electrolyte is ON or already OFF
	;***     1250 : 		if (ns_delay_ms(tick, (uint32_t) 60000 * 60)
	;***     1251 : 				&& g_machine_state.electrolyteOperation == 0) {
	;***     1252 : 			sendToRasPi_u32(H_READ, MID_NIGHT, 0x00);
	;***     1253 : 			g_TimeKeeper.electrolyteOff_h++;
	;***     1254 : 		} else if (g_machine_state.electrolyteOperation == 1) {
	;***     1255 : 			(*tick) = g_systemTime;
	;***     1256 : 		}
	;***     1257 : 		break;
	;***     1258 : 	case 1:
	;***     1259 : 		g_TimeKeeper.neutralization = 0;
	;***     1260 : 		O_CVCC_ON_PIN = OFF;
	;***     1261 : 		O_PUMP_SALT_PIN_SP1 = OFF; //SP1
	;***     1262 : 		(*state)++;
	;***     1263 : 		break;
	;***     1264 : 	case 2:
	;***     1265 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1265
	movw ax, !LOWW(_g_timerSetting+0x00010)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00012)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00044)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@49_5
.BB@LABEL@49_4:	; if_then_bb42
	;***     1266 : 				g_timerSetting.t5_electrolysisStopDelay_s * 1000)) {
	;***     1267 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1267
	clrb !LOWW(_g_machine_state+0x00008)
	;***     1268 : 			O_SUPPLY_WATER_PIN_SV1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1268
	clr1 0xFFF01.7
	;***     1269 : 			g_machine_state.electrolyteOperation = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1269
	clrb !LOWW(_g_machine_state+0x00007)
.BB@LABEL@49_5:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1276
	ret
.BB@LABEL@49_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1250
	movw de, #0x0036
	movw bc, #0xEE80
	movw ax, #LOWW(_g_Tick+0x00044)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@49_9
.BB@LABEL@49_7:	; bb
	cmp0 !LOWW(_g_machine_state+0x00007)
	bnz $.BB@LABEL@49_9
.BB@LABEL@49_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1252
	clrw ax
	movw de, ax
	movw ax, #0x521C
	call $!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1253
	inc !LOWW(_g_TimeKeeper@1)
	ret
.BB@LABEL@49_9:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1254
	cmp !LOWW(_g_machine_state+0x00007), #0x01
	bnz $.BB@LABEL@49_5
.BB@LABEL@49_10:	; if_then_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1255
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	ret
.BB@LABEL@49_11:	; switch_clause_bb30
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1259
	movw !LOWW(_g_TimeKeeper@1+0x00004), ax
	movw !LOWW(_g_TimeKeeper@1+0x00002), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1260
	clr1 0xFFF0E.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1261
	clr1 0xFFF06.0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1262
	inc !LOWW(_g_machine_state+0x00008)
	ret
_realTimeResponse:
	.STACK _realTimeResponse = 4
	;***     1270 : 		}
	;***     1271 : 		break;
	;***     1272 : 	default:
	;***     1273 : 		break;
	;***     1274 : 	}
	;***     1275 : 
	;***     1276 : }
	;***     1277 : void realTimeResponse(void) {
	;***     1278 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1278
	call $!_UpdateMachineStatus
	;***     1279 : 	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1279
	call $!_RaspberryResponse_nostop
	;***     1280 : 	isElectrolyticOperationOFF_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1280
	call $!_isElectrolyticOperationOFF_nostop
	;***     1281 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1281
	call !!_R_WDT_Restart
	;***     1282 : 	if (ns_delay_ms(&g_Tick.tickCustom[0], 200)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1282
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick+0x00084)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	sknz
.BB@LABEL@50_1:	; return
	;***     1283 : 		P6_bit.no3 = ~P6_bit.no3;
	;***     1284 : 
	;***     1285 : 	}
	;***     1286 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1286
	ret
.BB@LABEL@50_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1283
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***     1287 : float measureFlowSensor(uint32_t *s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1287
	push ax
	subw sp, #0x0C
	;***     1288 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1288
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x0A], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x08], ax
	clrw ax
	movw [sp+0x00], ax
	oneb a
	mov [sp+0x02], a
	clrw ax
	movw [sp+0x04], ax
.BB@LABEL@51_1:	; bb27
	movw ax, [sp+0x0C]
	movw de, ax
	;***     1289 : 	float flow_pluse = 0.0;
	;***     1290 : 	uint8_t flow_pulse_state = I_OFF;
	;***     1291 : 	while (!ns_delay_ms(&stamp_flow_sensor, (*s) * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1291
	movw bc, #0x03E8
	movw ax, [de]
	mulhu
	movw hl, ax
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, [de+0x02]
	movw bc, #0x03E8
	mulh
	movw de, ax
	push hl
	pop bc
	movw ax, [sp+0x06]
	addw ax, de
	movw de, ax
	movw ax, sp
	addw ax, #0x0008
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@51_7
.BB@LABEL@51_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***     1292 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1292
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@51_6
.BB@LABEL@51_3:	; if_then_bb
	;***     1293 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1293
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@51_5
.BB@LABEL@51_4:	; if_then_bb20
	movw ax, #0x3F80
	;***     1294 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1294
	push ax
	clrw ax
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x04]
	call !!__COM_fadd
	movw [sp+0x04], ax
	movw ax, bc
	movw [sp+0x08], ax
	addw sp, #0x04
.BB@LABEL@51_5:	; if_break_bb
	;***     1295 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1295
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@51_6:	; if_break_bb26
	;***     1296 : 		}
	;***     1297 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1297
	call !!_R_WDT_Restart
	br $.BB@LABEL@51_1
.BB@LABEL@51_7:	; bb40
	movw ax, #0x3F33
	;***     1298 : 	}
	;***     1299 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1299
	push ax
	mov a, #0x33
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x04]
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x4270
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x447A
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fdiv
	movw [sp+0x06], ax
	movw ax, bc
	movw [sp+0x04], ax
	addw sp, #0x04
	movw ax, [sp+0x0C]
	movw de, ax
	movw ax, [de+0x02]
	movw bc, ax
	movw ax, [de]
	call !!__COM_ultof
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fdiv
	movw de, ax
	movw !LOWW(_g_io_status+0x00006), ax
	movw ax, bc
	movw !LOWW(_g_io_status+0x00008), ax
	addw sp, #0x04
	;***     1300 : 	return g_io_status.refined.FlowValue;
	;***     1301 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1301
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***     1302 : 
	;***     1303 : uint8_t _pre_flow_state = I_OFF;
	;***     1304 : float _flow_pulse;
	;***     1305 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1305
	subw sp, #0x04
	;***     1306 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***     1307 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***     1308 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1308
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@52_4
.BB@LABEL@52_1:	; entry
	dec a
	bz $.BB@LABEL@52_5
.BB@LABEL@52_2:	; entry
	dec a
	bz $.BB@LABEL@52_12
.BB@LABEL@52_3:	; switch_clause_bb61
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@52_11
.BB@LABEL@52_4:	; switch_clause_bb
	;***     1309 : 	case 0:
	;***     1310 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1310
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@52_9
.BB@LABEL@52_5:	; switch_clause_bb14
	;***     1311 : 			(*state)++;
	;***     1312 : 		}
	;***     1313 : 		break;
	;***     1314 : 	case 1:
	;***     1315 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1315
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@52_8
.BB@LABEL@52_6:	; if_then_bb24
	;***     1316 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1316
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***     1317 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1317
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@52_8
.BB@LABEL@52_7:	; if_then_bb35
	movw ax, #0x3F80
	;***     1318 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1318
	push ax
	clrw ax
	push ax
	movw bc, !LOWW(__flow_pulse+0x00002)
	movw ax, !LOWW(__flow_pulse)
	call !!__COM_fadd
	movw !LOWW(__flow_pulse), ax
	movw ax, bc
	movw !LOWW(__flow_pulse+0x00002), ax
	addw sp, #0x04
.BB@LABEL@52_8:	; if_break_bb39
	;***     1319 : 			}
	;***     1320 : 		}
	;***     1321 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1321
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0000A)
.BB@LABEL@52_9:	; if_break_bb39
	push bc
	pop hl
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x00024)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@52_10:	; if_then_bb47
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@52_11:	; switch_break_bb
	;***     1322 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***     1323 : 			(*state)++;
	;***     1324 : 		}
	;***     1325 : 		break;
	;***     1326 : 	case 2:
	;***     1327 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***     1328 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***     1329 : 		_flow_pulse = 0;
	;***     1330 : 		(*state) = 0;
	;***     1331 : 		break;
	;***     1332 : 	default:
	;***     1333 : 		(*state) = 0;
	;***     1334 : 		break;
	;***     1335 : 	}
	;***     1336 : 	return g_io_status.refined.FlowValue;
	;***     1337 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1337
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@52_12:	; switch_clause_bb52
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1327
	push ax
	mov a, #0x33
	push ax
	movw bc, !LOWW(__flow_pulse+0x00002)
	movw ax, !LOWW(__flow_pulse)
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x4270
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fmul
	movw de, ax
	addw sp, #0x04
	movw ax, #0x447A
	push ax
	clrw ax
	push ax
	movw ax, de
	call !!__COM_fdiv
	movw [sp+0x06], ax
	movw ax, bc
	movw [sp+0x04], ax
	addw sp, #0x04
	movw bc, !LOWW(_g_timerSetting+0x0000A)
	movw ax, !LOWW(_g_timerSetting+0x00008)
	call !!__COM_ultof
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fdiv
	movw de, ax
	movw ax, bc
	addw sp, #0x04
	movw !LOWW(_g_io_status+0x00008), ax
	movw ax, de
	movw !LOWW(_g_io_status+0x00006), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1329
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@52_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***     1338 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1338
	push hl
	;***     1339 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1340 : 		pre_machine_washing_mode = g_machine_state.mode;
	;***     1341 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1341
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@53_2
.BB@LABEL@53_1:	; bb11
	clrb x
.BB@LABEL@53_2:	; bb12
	;***     1342 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1342
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@53_4
.BB@LABEL@53_3:	; bb28
	clrb c
.BB@LABEL@53_4:	; bb30
	;***     1343 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1343
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@53_6
.BB@LABEL@53_5:	; bb46
	clrb b
.BB@LABEL@53_6:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***     1344 : 	g_mean_io_status.refined.AcidLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1344
	mov a, 0xFFF07
	mov1 CY, a.2
	clrb a
	bc $.BB@LABEL@53_8
.BB@LABEL@53_7:	; bb63
	mov a, #0x10
	and a, !LOWW(_g_mean_io_status)
.BB@LABEL@53_8:	; bb70
	mov x, a
	mov a, #0xEF
	and a, !LOWW(_g_mean_io_status)
	or a, x
	mov c, a
	;***     1345 : 	I_ACID_M_PIN == I_ON ? g_mean_io_status.refined.AcidLowLevel : 0;
	;***     1346 : 	g_mean_io_status.refined.AcidHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1346
	mov a, 0xFFF07
	clrb x
	bt a.3, $.BB@LABEL@53_10
.BB@LABEL@53_9:	; bb86
	mov a, c
	and a, #0x20
	mov x, a
.BB@LABEL@53_10:	; bb93
	mov a, c
	clr1 a.5
	or a, x
	mov d, a
	;***     1347 : 	I_ACID_H_PIN == I_ON ? g_mean_io_status.refined.AcidHighLevel : 0;
	;***     1348 : 
	;***     1349 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1349
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@53_12
.BB@LABEL@53_11:	; bb109
	clrb x
.BB@LABEL@53_12:	; bb111
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***     1350 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1350
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@53_14
.BB@LABEL@53_13:	; bb126
	clrb b
.BB@LABEL@53_14:	; bb128
	mov a, c
	or a, x
	mov e, a
	;***     1351 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1351
	mov a, 0xFFF07
	mov c, #0x04
	bf a.0, $.BB@LABEL@53_16
.BB@LABEL@53_15:	; bb144
	clrb c
.BB@LABEL@53_16:	; bb146
	mov a, e
	or a, b
	mov e, a
	;***     1352 : 	g_mean_io_status.refined.AlkalineLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1352
	mov a, 0xFFF00
	clrb x
	bt a.6, $.BB@LABEL@53_18
.BB@LABEL@53_17:	; bb161
	mov a, d
	and a, #0x02
	mov x, a
.BB@LABEL@53_18:	; bb168
	mov a, d
	clr1 a.1
	or a, x
	mov b, a
	;***     1353 : 	I_ALKALI_M_PIN == I_ON ? g_mean_io_status.refined.AlkalineLowLevel : 0;
	;***     1354 : 	g_mean_io_status.refined.AlkalineHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1354
	mov a, 0xFFF07
	clrb x
	bt a.0, $.BB@LABEL@53_20
.BB@LABEL@53_19:	; bb183
	mov a, b
	and a, #0x04
	mov x, a
.BB@LABEL@53_20:	; bb190
	mov a, b
	clr1 a.2
	or a, x
	mov !LOWW(_g_mean_io_status), a
	;***     1355 : 	I_ALKALI_H_PIN == I_ON ? g_mean_io_status.refined.AlkalineHighLevel : 0;
	;***     1356 : 
	;***     1357 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1357
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@53_22
.BB@LABEL@53_21:	; bb206
	clrb b
.BB@LABEL@53_22:	; bb208
	mov a, e
	or a, c
	mov c, a
	;***     1358 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1358
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@53_24
.BB@LABEL@53_23:	; bb224
	clrb x
.BB@LABEL@53_24:	; bb226
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***     1359 : 
	;***     1360 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1360
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***     1361 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1361
	mov x, 0xFFF05
	;***     1362 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1362
	mov c, 0xFFF07
	;***     1363 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1363
	mov a, 0xFFF07
	mov h, a
	;***     1364 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1364
	mov a, [de]
	mov l, a
	;***     1365 : 	O_DRAIN_ACID_PIN_SV5;
	;***     1366 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1366
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1360
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1361
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1362
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1363
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1364
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***     1367 : 	O_DRAIN_ALK_PIN_SV6;
	;***     1368 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1368
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1364
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1368
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1366
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1368
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***     1369 : 
	;***     1370 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1370
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***     1371 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1371
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***     1372 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN_SP1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1372
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***     1373 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TimeKeeper@1:
	.DS (6)
	.ALIGN 2
_g_numberSetting:
	.DS (38)
_g_color:
	.DS (1)
_g_pre_color:
	.DS (1)
	.ALIGN 2
_g_flow_value:
	.DS (4)
_g_alarm:
	.DS (2)
_g_machine_state:
	.DS (13)
	.ALIGN 2
_g_io_status:
	.DS (18)
	.ALIGN 2
_g_mean_io_status:
	.DS (18)
	.ALIGN 2
__settingTime:
	.DS (142)
	.ALIGN 2
__settingNumber:
	.DS (38)
_g_machine_mode:
	.DS (1)
	.ALIGN 2
_btod:
	.DS (4)
	.ALIGN 2
_g_Tick:
	.DS (164)
_water_solfner_buf:
	.DS (7)
	.ALIGN 2
__flow_pulse:
	.DS (4)
	.SECTION .data,DATA
	.ALIGN 2
_g_timerSetting:
	.DB4 0x000003E8
	.DB4 0x0000000F
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (1)
	.DS (1)
	.ALIGN 2
_test_control_buf:
	.DB 0x52
	.DB 0x02
	.DB4 0x437F0000	; float value: 255
__pre_flow_state:
	.DB 0x01
	.SECTION .const,CONST
	.ALIGN 2
_time_setting_p:
	.DB2 LOWW(__settingTime)
	.ALIGN 2
_number_setting_p:
	.DB2 LOWW(__settingNumber)
