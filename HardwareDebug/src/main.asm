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
#@  compiled at Wed Jan 05 10:55:53 2022

	.EXTERN _rx_count
	.EXTERN _g_control_buffer_f
	.EXTERN _g_control_buffer_u32
	.EXTERN _commnunication_flag
	.EXTERN _g_systemTime
	.EXTERN _g_uart2_sendend
	.EXTERN _g_uart3_sendend
	.EXTERN _g_rx_data
	.PUBLIC _g_timerSetting
	.PUBLIC _g_numberSetting
	.PUBLIC _g_neutralization_time_s
	.PUBLIC _g_color
	.PUBLIC _g_pre_color
	.PUBLIC _g_flow_value
	.PUBLIC _g_alarm
	.PUBLIC _g_machine_state
	.PUBLIC _g_io_status
	.PUBLIC _g_mean_io_status
	.PUBLIC _g_res_io_status
	.PUBLIC __settingTime
	.PUBLIC __settingNumber
	.PUBLIC _g_machine_mode
	.PUBLIC _g_machine_test_mode
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
	.PUBLIC _TestPowerOn_nostop_keepstate
	.PUBLIC _FlowRateAdjustmentMode_nostop_keepstate
	.PUBLIC _CurrentAdjustmentMode_nostop_keepstate
	.PUBLIC _ElectrolyteAdjustmentOperation
	.PUBLIC _TestOperation_nostop
	.PUBLIC _NeutralizationTreatment
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
	;***       24 : uint32_t g_neutralization_time_s;
	;***       25 : enum HS_COLOR g_color, g_pre_color;
	;***       26 : float g_flow_value;
	;***       27 : union Alarm_Flag_u g_alarm;
	;***       28 : struct Machine_State_u g_machine_state;
	;***       29 : union IO_Status_u g_io_status, g_mean_io_status, g_res_io_status;
	;***       30 : 
	;***       31 : struct Timer_Setting_s _settingTime;
	;***       32 : struct Number_Setting_s _settingNumber;
	;***       33 : 
	;***       34 : uint8_t g_machine_mode, g_machine_test_mode;
	;***       35 : union BytesToDouble {
	;***       36 : 	struct {
	;***       37 : 		uint8_t data[4];
	;***       38 : 	} refined;
	;***       39 : 	uint32_t raw;
	;***       40 : } btod;
	;***       41 : struct Tick_s g_Tick;
	;***       42 : 
	;***       43 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 43
	mov !LOWW(_g_color), a
	;***       44 : 	g_color = color;
	;***       45 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 45
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       46 : 		switch (color) {
	;***       47 : 		case RED:
	;***       48 : 			O_HS_ICL_PIN = 1;
	;***       49 : 			O_HS_IDA_PIN = 0;
	;***       50 : 			break;
	;***       51 : 		case BLUE:
	;***       52 : 			O_HS_ICL_PIN = 0;
	;***       53 : 			O_HS_IDA_PIN = 0;
	;***       54 : 			break;
	;***       55 : 		case WHITE:
	;***       56 : 			O_HS_ICL_PIN = 0;
	;***       57 : 			O_HS_IDA_PIN = 1;
	;***       58 : 			break;
	;***       59 : 		default:
	;***       60 : 			O_HS_ICL_PIN = 1;
	;***       61 : 			O_HS_IDA_PIN = 1;
	;***       62 : 			break;
	;***       63 : 		}
	;***       64 : 		g_pre_color = g_color;
	;***       65 : 	}
	;***       66 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 46
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 60
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 48
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 49
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 52
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 53
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 56
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 64
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_handSensorLEDBlink:
	.STACK _handSensorLEDBlink = 6
	;***       67 : void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	push hl
	mov [sp+0x00], a
	;***       68 : 	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	movw ax, #LOWW(_g_Tick+0x0000C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; return
	;***       69 : 		g_color = g_color == color ? BLACK : color;
	;***       70 : 		handSensorLED(g_color);
	;***       71 : 	}
	;***       72 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	pop hl
	ret
.BB@LABEL@2_2:	; if_then_bb
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	cmp a, !LOWW(_g_color)
	sknz
.BB@LABEL@2_3:	; if_then_bb.bb15_crit_edge
	clrb a
.BB@LABEL@2_4:	; bb15
	mov !LOWW(_g_color), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	pop hl
	br $_handSensorLED
_setting_default:
	.STACK _setting_default = 4
	;***       73 : void setting_default(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw ax, #0x4086
	;***       74 : 	g_numberSetting.upperVoltage1 = 4.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x6666
	movw !LOWW(_g_numberSetting), ax
	movw ax, #0x4060
	;***       75 : 	g_numberSetting.upperVoltage2 = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_numberSetting+0x00006), ax
	;***       76 : 	g_numberSetting.upperVoltage3 = 2.2;
	;***       77 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       78 : 	g_numberSetting.upperCurrent = 4.3;
	;***       79 : 	g_numberSetting.lowerCurrent = 0.2;
	;***       80 : 	g_numberSetting.upperFlow = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***       81 : 	g_numberSetting.lowerFlow = 0.4;
	;***       82 : 
	;***       83 : 	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       84 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       85 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       86 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       87 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***       88 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***       89 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***       90 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***       91 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***       92 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	movw !LOWW(_g_timerSetting+0x0006A), ax
	;***       93 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 93
	movw !LOWW(_g_timerSetting+0x0006E), ax
	;***       94 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 94
	movw !LOWW(_g_timerSetting+0x00072), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_numberSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F00
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw ax, #0x4089
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_numberSetting+0x00016), ax
	mov x, #0xCC
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00008), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x00028), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x00038), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x00030), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x00034), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
	movw !LOWW(_g_timerSetting+0x00040), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	movw !LOWW(_g_timerSetting+0x00068), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 93
	movw !LOWW(_g_timerSetting+0x0006C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 94
	movw !LOWW(_g_timerSetting+0x00070), ax
	ret
_isAcidTankFull:
	.STACK _isAcidTankFull = 6
	;***       95 : }
	;***       96 : 
	;***       97 : uint8_t isAcidTankFull(void) {
	;***       98 : 	if (I_ACID_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 98
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@4_5
.BB@LABEL@4_1:	; if_then_bb
	;***       99 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 99
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
	movw ax, #LOWW(_g_Tick+0x00060)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@4_4
.BB@LABEL@4_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].5, $.BB@LABEL@4_4
.BB@LABEL@4_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 110
	ret
.BB@LABEL@4_4:	; if_then_bb25
	;***      100 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***      101 : 				|| (g_mean_io_status.refined.AcidHighLevel == 1)) {
	;***      102 : 			g_mean_io_status.refined.AcidHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 102
	set1 !LOWW(_g_mean_io_status).5
	;***      103 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 103
	oneb a
	ret
.BB@LABEL@4_5:	; if_else_bb
	;***      104 : 		}
	;***      105 : 	} else {
	;***      106 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 106
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00062), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00060), ax
	;***      107 : 		g_mean_io_status.refined.AcidHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 107
	clr1 !LOWW(_g_mean_io_status).5
	br $.BB@LABEL@4_3
_isAcidTankAlmostFull:
	.STACK _isAcidTankAlmostFull = 6
	;***      108 : 	}
	;***      109 : 	return 0;
	;***      110 : }
	;***      111 : uint8_t isAcidTankAlmostFull(void) {
	;***      112 : 	if (I_ACID_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 112
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@5_5
.BB@LABEL@5_1:	; if_then_bb
	;***      113 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 113
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
	movw ax, #LOWW(_g_Tick+0x00064)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@5_4
.BB@LABEL@5_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].4, $.BB@LABEL@5_4
.BB@LABEL@5_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 124
	ret
.BB@LABEL@5_4:	; if_then_bb25
	;***      114 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      115 : 				|| (g_mean_io_status.refined.AcidLowLevel == 1)) {
	;***      116 : 			g_mean_io_status.refined.AcidLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 116
	set1 !LOWW(_g_mean_io_status).4
	;***      117 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 117
	oneb a
	ret
.BB@LABEL@5_5:	; if_else_bb
	;***      118 : 		}
	;***      119 : 	} else {
	;***      120 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 120
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00066), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00064), ax
	;***      121 : 		g_mean_io_status.refined.AcidLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 121
	clr1 !LOWW(_g_mean_io_status).4
	br $.BB@LABEL@5_3
_isAcidTankHasSomething:
	.STACK _isAcidTankHasSomething = 6
	;***      122 : 	}
	;***      123 : 	return 0;
	;***      124 : }
	;***      125 : uint8_t isAcidTankHasSomething(void) {
	;***      126 : 	if (I_ACID_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 126
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@6_5
.BB@LABEL@6_1:	; if_then_bb
	;***      127 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 127
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
	movw ax, #LOWW(_g_Tick+0x00068)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@6_4
.BB@LABEL@6_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].3, $.BB@LABEL@6_4
.BB@LABEL@6_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	ret
.BB@LABEL@6_4:	; if_then_bb25
	;***      128 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      129 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 1)) {
	;***      130 : 			g_mean_io_status.refined.AcidEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	set1 !LOWW(_g_mean_io_status).3
	;***      131 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 131
	oneb a
	ret
.BB@LABEL@6_5:	; if_else_bb
	;***      132 : 		}
	;***      133 : 	} else {
	;***      134 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00068), ax
	;***      135 : 		isAcidTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
	call $!_isAcidTankEmpty
	br $.BB@LABEL@6_3
_isAcidTankEmpty:
	.STACK _isAcidTankEmpty = 6
	;***      136 : 	}
	;***      137 : 	return 0;
	;***      138 : }
	;***      139 : uint8_t isAcidTankEmpty(void) {
	;***      140 : 	if (I_ACID_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 140
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@7_2
.BB@LABEL@7_1:	; if_else_bb
	;***      141 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
	;***      142 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      143 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 0)) {
	;***      144 : 			g_mean_io_status.refined.AcidEmptyLevel = 0;
	;***      145 : 			return 1;
	;***      146 : 		}
	;***      147 : 	} else {
	;***      148 : 		g_Tick.tickAcidLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0006C), ax
	;***      149 : 		isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
	call $!_isAcidTankHasSomething
	br $.BB@LABEL@7_4
.BB@LABEL@7_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
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
	movw ax, #LOWW(_g_Tick+0x0006C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@7_5
.BB@LABEL@7_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].3, $.BB@LABEL@7_5
.BB@LABEL@7_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	ret
.BB@LABEL@7_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	clr1 !LOWW(_g_mean_io_status).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 145
	oneb a
	ret
_isAlkalineTankFull:
	.STACK _isAlkalineTankFull = 6
	;***      150 : 	}
	;***      151 : 	return 0;
	;***      152 : }
	;***      153 : uint8_t isAlkalineTankFull(void) {
	;***      154 : 	if (I_ALKALI_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 154
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@8_5
.BB@LABEL@8_1:	; if_then_bb
	;***      155 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 155
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
	movw ax, #LOWW(_g_Tick+0x00070)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].2, $.BB@LABEL@8_4
.BB@LABEL@8_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	ret
.BB@LABEL@8_4:	; if_then_bb25
	;***      156 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***      157 : 				|| (g_mean_io_status.refined.AlkalineHighLevel == 1)) {
	;***      158 : 			g_mean_io_status.refined.AlkalineHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	set1 !LOWW(_g_mean_io_status).2
	;***      159 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 159
	oneb a
	ret
.BB@LABEL@8_5:	; if_else_bb
	;***      160 : 		}
	;***      161 : 	} else {
	;***      162 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00072), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00070), ax
	;***      163 : 		g_mean_io_status.refined.AlkalineHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 163
	clr1 !LOWW(_g_mean_io_status).2
	br $.BB@LABEL@8_3
_isAlkalineTankAlmostFull:
	.STACK _isAlkalineTankAlmostFull = 6
	;***      164 : 	}
	;***      165 : 	return 0;
	;***      166 : }
	;***      167 : uint8_t isAlkalineTankAlmostFull(void) {
	;***      168 : 	if (I_ALKALI_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@9_5
.BB@LABEL@9_1:	; if_then_bb
	;***      169 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 169
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
	movw ax, #LOWW(_g_Tick+0x00074)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_4
.BB@LABEL@9_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].1, $.BB@LABEL@9_4
.BB@LABEL@9_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	ret
.BB@LABEL@9_4:	; if_then_bb25
	;***      170 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      171 : 				|| (g_mean_io_status.refined.AlkalineLowLevel == 1)) {
	;***      172 : 			g_mean_io_status.refined.AlkalineLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	set1 !LOWW(_g_mean_io_status).1
	;***      173 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 173
	oneb a
	ret
.BB@LABEL@9_5:	; if_else_bb
	;***      174 : 		}
	;***      175 : 	} else {
	;***      176 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00076), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00074), ax
	;***      177 : 		g_mean_io_status.refined.AlkalineLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
	clr1 !LOWW(_g_mean_io_status).1
	br $.BB@LABEL@9_3
_isAlkalineTankHasSomething:
	.STACK _isAlkalineTankHasSomething = 6
	;***      178 : 	}
	;***      179 : 	return 0;
	;***      180 : }
	;***      181 : uint8_t isAlkalineTankHasSomething(void) {
	;***      182 : 	if (I_ALKALI_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 182
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@10_5
.BB@LABEL@10_1:	; if_then_bb
	;***      183 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 183
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
	movw ax, #LOWW(_g_Tick+0x00078)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@10_4
.BB@LABEL@10_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].0, $.BB@LABEL@10_4
.BB@LABEL@10_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	ret
.BB@LABEL@10_4:	; if_then_bb25
	;***      184 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      185 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 1)) {
	;***      186 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 186
	set1 !LOWW(_g_mean_io_status).0
	;***      187 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 187
	oneb a
	ret
.BB@LABEL@10_5:	; if_else_bb
	;***      188 : 		}
	;***      189 : 	} else {
	;***      190 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 190
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00078), ax
	;***      191 : 		isAlkalineTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
	call $!_isAlkalineTankEmpty
	br $.BB@LABEL@10_3
_isAlkalineTankEmpty:
	.STACK _isAlkalineTankEmpty = 6
	;***      192 : 	}
	;***      193 : 	return 0;
	;***      194 : }
	;***      195 : uint8_t isAlkalineTankEmpty(void) {
	;***      196 : 	if (I_ALKALI_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_else_bb
	;***      197 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
	;***      198 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      199 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 0)) {
	;***      200 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 0;
	;***      201 : 			return 1;
	;***      202 : 		}
	;***      203 : 	} else {
	;***      204 : 		g_Tick.tickAlkalineLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0007C), ax
	;***      205 : 		isAlkalineTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 205
	call $!_isAlkalineTankHasSomething
	br $.BB@LABEL@11_4
.BB@LABEL@11_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
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
	movw ax, #LOWW(_g_Tick+0x0007C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@11_5
.BB@LABEL@11_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].0, $.BB@LABEL@11_5
.BB@LABEL@11_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 208
	ret
.BB@LABEL@11_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	clr1 !LOWW(_g_mean_io_status).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 201
	oneb a
	ret
_sendToRasPi_f:
	.STACK _sendToRasPi_f = 6
	;***      206 : 	}
	;***      207 : 	return 0;
	;***      208 : }
	;***      209 : 
	;***      210 : //----------------------Begin code 11112021--------------------------------------
	;***      211 : void sendToRasPi_f(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 211
	push hl
	;***      212 : 		float value) {
	;***      213 : 	uint8_t state = g_uart2_sendend;
	;***      214 : 	g_control_buffer_f.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	mov !LOWW(_g_control_buffer_f), a
	mov a, x
	;***      215 : 	g_control_buffer_f.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	mov !LOWW(_g_control_buffer_f+0x00001), a
	movw ax, bc
	;***      216 : 	g_control_buffer_f.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	movw !LOWW(_g_control_buffer_f+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_f+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      217 : 	R_UART2_Send((uint8_t*) &g_control_buffer_f, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 217
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_f)
	call !!_R_UART2_Send
.BB@LABEL@12_1:	; bb9
	mov a, [sp+0x00]
	;***      218 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@12_1
.BB@LABEL@12_2:	; return
	;***      219 : 		;
	;***      220 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 220
	pop hl
	ret
_sendToRasPi_u32:
	.STACK _sendToRasPi_u32 = 6
	;***      221 : void sendToRasPi_u32(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	push hl
	;***      222 : 		uint32_t value) {
	;***      223 : 	uint8_t state = g_uart2_sendend;
	;***      224 : 	g_control_buffer_u32.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 224
	mov !LOWW(_g_control_buffer_u32), a
	mov a, x
	;***      225 : 	g_control_buffer_u32.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	mov !LOWW(_g_control_buffer_u32+0x00001), a
	movw ax, bc
	;***      226 : 	g_control_buffer_u32.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 226
	movw !LOWW(_g_control_buffer_u32+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_u32+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      227 : 	R_UART2_Send((uint8_t*) &g_control_buffer_u32, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_u32)
	call !!_R_UART2_Send
.BB@LABEL@13_1:	; bb9
	mov a, [sp+0x00]
	;***      228 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@13_1
.BB@LABEL@13_2:	; return
	;***      229 : 		;
	;***      230 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	pop hl
	ret
_sendRS485:
	.STACK _sendRS485 = 6
	;***      231 : struct UART3_Buffer_s {
	;***      232 : 	uint8_t busy;
	;***      233 : 	uint8_t head; // 1 byte
	;***      234 : 	uint8_t set_number; // 1 byte
	;***      235 : 	uint8_t set_value[4]; // 4 byte
	;***      236 : } water_solfner_buf;
	;***      237 : void sendRS485(uint8_t busy, uint8_t head, uint8_t type, uint32_t value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	push hl
	;***      238 : 	uint8_t state = g_uart3_sendend;
	;***      239 : 	btod.raw = value;
	;***      240 : 	water_solfner_buf.busy = busy;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	mov !LOWW(_water_solfner_buf), a
	mov a, x
	;***      241 : 	water_solfner_buf.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	mov !LOWW(_water_solfner_buf+0x00001), a
	mov a, c
	;***      242 : 	water_solfner_buf.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 242
	mov !LOWW(_water_solfner_buf+0x00002), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 238
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	movw ax, [sp+0x08]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
	movw !LOWW(_btod+0x00002), ax
	movw ax, [sp+0x06]
	movw !LOWW(_btod), ax
	clrb a
.BB@LABEL@14_1:	; bb
	mov b, a
	;***      243 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      244 : 		water_solfner_buf.set_value[i] = btod.refined.data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	mov a, LOWW(_btod)[b]
	mov LOWW(_water_solfner_buf+0x00003)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 243
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@14_1
.BB@LABEL@14_2:	; bb25
	;***      245 : 	}
	;***      246 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	set1 0xFFF00.0
	;***      247 : 	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	movw bc, #0x0007
	movw ax, #LOWW(_water_solfner_buf)
	call !!_R_UART3_Send
.BB@LABEL@14_3:	; bb28
	mov a, [sp+0x00]
	;***      248 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 248
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@14_3
.BB@LABEL@14_4:	; return
	;***      249 : 		;
	;***      250 : 
	;***      251 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	pop hl
	ret
_sendR485_7byte:
	.STACK _sendR485_7byte = 16
	;***      252 : void sendR485_7byte(uint8_t addr, uint8_t head, uint8_t *val5) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 252
	subw sp, #0x0A
	mov h, a
	push bc
	pop de
	;***      253 : 	uint8_t buf[7] = { addr, head };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
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
	;***      254 : 	uint8_t state = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x07], a
.BB@LABEL@15_1:	; bb
	movw ax, sp
	movw [sp+0x08], ax
	mov a, b
	add a, #0x02
	mov c, a
	;***      255 : 	for (uint8_t i = 2; i < 7; i++) {
	;***      256 : 		buf[i] = val5[i - 2];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	shrw ax, 8+0x00000
	addw ax, de
	decw ax
	decw ax
	movw hl, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	inc b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	mov a, [hl]
	mov h, a
	movw ax, [sp+0x08]
	xchw ax, hl
	mov [hl+c], a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	cmp a, #0x05
	bnz $.BB@LABEL@15_1
.BB@LABEL@15_2:	; bb31
	;***      257 : 	}
	;***      258 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	set1 0xFFF00.0
	;***      259 : 	R_UART3_Send(buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
	movw bc, #0x0007
	movw ax, sp
	call !!_R_UART3_Send
.BB@LABEL@15_3:	; bb35
	mov a, [sp+0x07]
	;***      260 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 260
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@15_3
.BB@LABEL@15_4:	; return
	;***      261 : 		;
	;***      262 : 
	;***      263 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
	addw sp, #0x0A
	ret
_isThisCommand:
	.STACK _isThisCommand = 6
	;***      264 : uint8_t isThisCommand(uint8_t *input_buf, enum UART_header_e header,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	push hl
	movw hl, ax
	mov a, b
	mov [sp+0x00], a
	clrb a
	mov b, a
.BB@LABEL@16_1:	; bb
	;***      265 : 		enum Control_status control, uint32_t data) {
	;***      266 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      267 : 		btod.refined.data[i] = input_buf[2 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 267
	shrw ax, 8+0x00000
	addw ax, hl
	incw ax
	incw ax
	movw de, ax
	mov a, [de]
	mov LOWW(_btod)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@16_1
.BB@LABEL@16_2:	; bb23
	mov a, c
	;***      268 : 	}
	;***      269 : 
	;***      270 : 	if ((input_buf[0] == header) && (input_buf[1] == control)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
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
	;***      271 : 			&& (btod.raw == data))
	;***      272 : 		return 2;
	;***      273 : 	else if ((input_buf[0] == header) && (input_buf[1] == control))
	;***      274 : 		return 1;
	;***      275 : 	else
	;***      276 : 		return 0;
	;***      277 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	mov a, #0x02
	bz $.BB@LABEL@16_9
.BB@LABEL@16_7:	; bb70
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	cmp a, [hl+0x01]
	oneb a
	skz
.BB@LABEL@16_8:	; bb70
	clrb a
.BB@LABEL@16_9:	; bb70
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	ret
.BB@LABEL@16_10:	; if_else_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	clrb a
	br $.BB@LABEL@16_9
_RaspberryResponse_nostop:
	.STACK _RaspberryResponse_nostop = 10
	;***      278 : /**
	;***      279 :  * Handle all response to Raspberry command.
	;***      280 :  */
	;***      281 : uint8_t *const time_setting_p = (uint8_t*) &_settingTime;
	;***      282 : uint8_t *const number_setting_p = (uint8_t*) &_settingNumber;
	;***      283 : struct UART_Buffer_float_s test_control_buf = { H_READ, READ_TIME, 0x000000ff };
	;***      284 : void RaspberryResponse_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	push hl
	;***      285 : 	//TODO: I'm doing here
	;***      286 : 	if (commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 286
	cmp0 !LOWW(_commnunication_flag)
	bz $.BB@LABEL@17_7
.BB@LABEL@17_1:	; if_then_bb
	;***      287 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      288 : 		if (g_machine_state.user == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	cmp !LOWW(_g_machine_state+0x0000D), #0x02
	sknz
.BB@LABEL@17_2:	; if_then_bb25
	;***      289 : 			g_machine_state.user = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
	oneb !LOWW(_g_machine_state+0x0000D)
.BB@LABEL@17_3:	; if_break_bb
	;***      290 : 		}
	;***      291 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@17_4:	; bb27
	mov a, [sp+0x00]
	;***      292 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_6
.BB@LABEL@17_5:	; bb
	;***      293 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_4
.BB@LABEL@17_6:	; bb35
	;***      294 : 		}
	;***      295 : 		commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 295
	clrb !LOWW(_commnunication_flag)
.BB@LABEL@17_7:	; if_break_bb36
	;***      296 : 	}
	;***      297 : 	if (commnunication_flag.send_response_mode_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
	cmp !LOWW(_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@17_9
.BB@LABEL@17_8:	; if_then_bb42
	;***      298 : 		sendToRasPi_u32(H_READ, WASHING_MODE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 298
	mov a, !LOWW(_g_machine_mode)
	clrb x
	movw de, ax
	clrw bc
	movw ax, #0x5218
	call $!_sendToRasPi_u32
	;***      299 : 				(uint32_t) g_machine_mode << (8 * 3));
	;***      300 : //		sendToRasPi_u32(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
	;***      301 : 		commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
	clrb !LOWW(_commnunication_flag+0x00006)
.BB@LABEL@17_9:	; if_break_bb46
	;***      302 : 	}
	;***      303 : 	if (commnunication_flag.send_response_status_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	cmp0 !LOWW(_commnunication_flag+0x00005)
	bnz $.BB@LABEL@17_26
.BB@LABEL@17_10:	; if_else_bb
	;***      304 : 		uint8_t state = g_uart2_sendend;
	;***      305 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	;***      306 : 		while (state == g_uart2_sendend) {
	;***      307 : 			R_WDT_Restart();
	;***      308 : 		}
	;***      309 : 		commnunication_flag.send_response_status_flag = 0;
	;***      310 : 	}else if(commnunication_flag.recieve_status_flag == 2){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 310
	cmp !LOWW(_commnunication_flag+0x00008), #0x02
	bnz $.BB@LABEL@17_25
.BB@LABEL@17_11:	; if_else_bb.bb73_crit_edge
	clrb a
.BB@LABEL@17_12:	; bb73
	mov b, a
	;***      311 : 		uint8_t *const _io_p = (uint8_t *)&g_res_io_status;
	;***      312 : 		for(uint8_t i = 0; i < 5; i++){
	;***      313 : 			_io_p[i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(_g_res_io_status)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 312
	inc b
	mov a, b
	cmp a, #0x05
	bnz $.BB@LABEL@17_12
.BB@LABEL@17_13:	; bb73.bb141_crit_edge
	mov a, #0x05
	mov b, a
.BB@LABEL@17_14:	; bb141
	;***      314 : 		}
	;***      315 : 		for (uint8_t i = 5; i < io_statusSize - 1; i++){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	cmp a, #0x10
	bnc $.BB@LABEL@17_24
.BB@LABEL@17_15:	; bb91
	;***      316 : 
	;***      317 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 317
	and a, #0x03
	bz $.BB@LABEL@17_22
.BB@LABEL@17_16:	; bb91
	dec a
	bz $.BB@LABEL@17_21
.BB@LABEL@17_17:	; bb91
	dec a
	mov a, b
	bz $.BB@LABEL@17_20
.BB@LABEL@17_18:	; switch_clause_bb
	;***      318 : 			case 3:
	;***      319 : 				_io_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 319
	shrw ax, 8+0x00000
	addw ax, #LOWW(_g_res_io_status+0x0FFFD)
.BB@LABEL@17_19:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@17_23
.BB@LABEL@17_20:	; switch_clause_bb105
	;***      320 : 				break;
	;***      321 : 			case 2:
	;***      322 : 				_io_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 322
	shrw ax, 8+0x00000
	addw ax, #LOWW(_g_res_io_status+0x0FFFF)
	br $.BB@LABEL@17_19
.BB@LABEL@17_21:	; switch_clause_bb116
	;***      323 : 				break;
	;***      324 : 			case 1:
	;***      325 : 				_io_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(_g_res_io_status+0x00001)[b], a
	br $.BB@LABEL@17_23
.BB@LABEL@17_22:	; switch_clause_bb127
	;***      326 : 				break;
	;***      327 : 			case 0:
	;***      328 : 				_io_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 328
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(_g_res_io_status+0x00003)[b], a
.BB@LABEL@17_23:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@17_14
.BB@LABEL@17_24:	; bb150
	;***      329 : 				break;
	;***      330 : 			default:
	;***      331 : 				break;
	;***      332 : 			}
	;***      333 : 		}
	;***      334 : 		commnunication_flag.recieve_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 334
	clrb !LOWW(_commnunication_flag+0x00008)
.BB@LABEL@17_25:	; bb150
	br $.BB@LABEL@17_30
.BB@LABEL@17_26:	; if_then_bb52
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	movw bc, #0x0011
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@17_27:	; bb58
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 306
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_29
.BB@LABEL@17_28:	; bb57
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_27
.BB@LABEL@17_29:	; bb66
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	clrb !LOWW(_commnunication_flag+0x00005)
.BB@LABEL@17_30:	; if_break_bb152
	;***      335 : 	}
	;***      336 : 	if (commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 336
	cmp0 !LOWW(_commnunication_flag+0x00001)
	bz $.BB@LABEL@17_35
.BB@LABEL@17_31:	; if_then_bb158
	;***      337 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 337
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      338 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 338
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00094), a
	;***      339 : 				timeSettingSize - 1);
	;***      340 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 340
	movw bc, #0x0095
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@17_32:	; bb169
	mov a, [sp+0x00]
	;***      341 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 341
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_34
.BB@LABEL@17_33:	; bb168
	;***      342 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 342
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_32
.BB@LABEL@17_34:	; bb177
	;***      343 : 		}
	;***      344 : 		commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 344
	clrb !LOWW(_commnunication_flag+0x00001)
.BB@LABEL@17_35:	; if_break_bb178
	;***      345 : 	}
	;***      346 : 	if (commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 346
	cmp0 !LOWW(_commnunication_flag+0x00002)
	bz $.BB@LABEL@17_40
.BB@LABEL@17_36:	; if_then_bb184
	;***      347 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 347
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      348 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 348
	mov c, #0x24
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00024), a
	;***      349 : 				numberSettingSize - 1);
	;***      350 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 350
	movw bc, #0x0025
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@17_37:	; bb195
	mov a, [sp+0x00]
	;***      351 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 351
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_39
.BB@LABEL@17_38:	; bb194
	;***      352 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 352
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_37
.BB@LABEL@17_39:	; bb203
	;***      353 : 		}
	;***      354 : 		commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 354
	clrb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@17_40:	; if_break_bb204
	;***      355 : 	}
	;***      356 : 	if (commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 356
	cmp !LOWW(_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@17_56
.BB@LABEL@17_41:	; if_break_bb204.bb263_crit_edge
	clrb a
	mov b, a
.BB@LABEL@17_42:	; bb263
	;***      357 : //		//Do not Edit this, must keep!!!!
	;***      358 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 358
	cmp a, #0x94
	bnc $.BB@LABEL@17_52
.BB@LABEL@17_43:	; bb211
	;***      359 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 359
	and a, #0x03
	bz $.BB@LABEL@17_50
.BB@LABEL@17_44:	; bb211
	dec a
	bz $.BB@LABEL@17_49
.BB@LABEL@17_45:	; bb211
	dec a
	mov a, b
	bz $.BB@LABEL@17_48
.BB@LABEL@17_46:	; switch_clause_bb215
	;***      360 : //			case 3:
	;***      361 : //				pointer0[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
	;***      362 : //				break;
	;***      363 : //			case 2:
	;***      364 : //				pointer0[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
	;***      365 : //				break;
	;***      366 : //			case 1:
	;***      367 : //				pointer0[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
	;***      368 : //				break;
	;***      369 : //			case 0:
	;***      370 : //				pointer0[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
	;***      371 : //				break;
	;***      372 : //			default:
	;***      373 : //				break;
	;***      374 : 			case 3:
	;***      375 : 				time_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 375
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFD)
.BB@LABEL@17_47:	; switch_clause_bb215
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@17_51
.BB@LABEL@17_48:	; switch_clause_bb226
	;***      376 : 				break;
	;***      377 : 			case 2:
	;***      378 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 378
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@17_47
.BB@LABEL@17_49:	; switch_clause_bb237
	;***      379 : 				break;
	;***      380 : 			case 1:
	;***      381 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 381
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@17_51
.BB@LABEL@17_50:	; switch_clause_bb248
	;***      382 : 				break;
	;***      383 : 			case 0:
	;***      384 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 384
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@17_51:	; switch_break_bb260
	inc b
	mov a, b
	br $.BB@LABEL@17_42
.BB@LABEL@17_52:	; bb272
	;***      385 : 				break;
	;***      386 : 			default:
	;***      387 : 				break;
	;***      388 : 			}
	;***      389 : 		}
	;***      390 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 390
	mov a, !LOWW(_g_rx_data+0x00094)
	mov [sp+0x00], a
	mov !LOWW(__settingTime+0x00094), a
	;***      391 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 391
	mov c, #0x94
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp x, a
	bnz $.BB@LABEL@17_54
.BB@LABEL@17_53:	; if_then_bb295
	;***      392 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
	;***      393 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 393
	movw de, #0x0096
	movw bc, #LOWW(__settingTime)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	clrw ax
	;***      394 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 394
	push ax
	mov x, #0x95
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      395 : 					timeSettingSize);
	;***      396 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 396
	clrb x
	br $.BB@LABEL@17_55
.BB@LABEL@17_54:	; if_else_bb298
	;***      397 : 		} else {
	;***      398 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 398
	mov x, #0x16
.BB@LABEL@17_55:	; if_else_bb298
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi_f
	;***      399 : 		}
	;***      400 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      401 : 		commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 401
	clrb !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@17_56:	; if_break_bb300
	;***      402 : 	}
	;***      403 : 
	;***      404 : 	if (commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 404
	cmp !LOWW(_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@17_72
.BB@LABEL@17_57:	; if_break_bb300.bb359_crit_edge
	clrb a
	mov b, a
.BB@LABEL@17_58:	; bb359
	;***      405 : //		//Do not Edit this, must keep!!!!
	;***      406 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 406
	cmp a, #0x24
	bnc $.BB@LABEL@17_68
.BB@LABEL@17_59:	; bb307
	;***      407 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 407
	and a, #0x03
	bz $.BB@LABEL@17_66
.BB@LABEL@17_60:	; bb307
	dec a
	bz $.BB@LABEL@17_65
.BB@LABEL@17_61:	; bb307
	dec a
	mov a, b
	bz $.BB@LABEL@17_64
.BB@LABEL@17_62:	; switch_clause_bb311
	;***      408 : 			case 3:
	;***      409 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 409
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@17_63:	; switch_clause_bb311
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@17_67
.BB@LABEL@17_64:	; switch_clause_bb322
	;***      410 : 				break;
	;***      411 : 			case 2:
	;***      412 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 412
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@17_63
.BB@LABEL@17_65:	; switch_clause_bb333
	;***      413 : 				break;
	;***      414 : 			case 1:
	;***      415 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 415
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@17_67
.BB@LABEL@17_66:	; switch_clause_bb344
	;***      416 : 				break;
	;***      417 : 			case 0:
	;***      418 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 418
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@17_67:	; switch_break_bb356
	inc b
	mov a, b
	br $.BB@LABEL@17_58
.BB@LABEL@17_68:	; bb368
	;***      419 : 				break;
	;***      420 : 			default:
	;***      421 : 				break;
	;***      422 : 			}
	;***      423 : 		}
	;***      424 : 		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 424
	mov c, #0x24
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov !LOWW(__settingNumber+0x00024), a
	;***      425 : 				numberSettingSize - 1);
	;***      426 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 426
	mov a, !LOWW(_g_rx_data+0x00024)
	mov [sp+0x00], a
	mov c, #0x24
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp a, x
	bnz $.BB@LABEL@17_70
.BB@LABEL@17_69:	; if_then_bb390
	;***      427 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      428 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 428
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call $!_sendToRasPi_f
	;***      429 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 429
	movw de, #0x0026
	movw bc, #LOWW(__settingNumber)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	clrw ax
	;***      430 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 430
	push ax
	mov x, #0x25
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      431 : 					numberSettingSize);
	;***      432 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 432
	clrb x
	br $.BB@LABEL@17_71
.BB@LABEL@17_70:	; if_else_bb393
	;***      433 : 		} else {
	;***      434 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 434
	mov x, #0x16
.BB@LABEL@17_71:	; if_else_bb393
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi_f
	;***      435 : 		}
	;***      436 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      437 : 		commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 437
	clrb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@17_72:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 439
	ret
_InitialOperationModeStart_nostop:
	.STACK _InitialOperationModeStart_nostop = 4
	;***      438 : 	}
	;***      439 : }
	;***      440 : /**
	;***      441 :  * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
	;***      442 :  * 13/12/2021: Checked!
	;***      443 :  * @return: 0 - Done; 1 - Not done
	;***      444 :  */
	;***      445 : uint8_t InitialOperationModeStart_nostop(void) {
	;***      446 : //	O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7; // Turn on SV5 if ACID tank empty
	;***      447 : //	O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6; // Turn on SV6 if ALK tank empty
	;***      448 : 	O_DRAIN_ACID_PIN_SV5 = isAcidTankEmpty() ? OFF : ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 448
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
	;***      449 : 	O_DRAIN_ALK_PIN_SV6 = isAlkalineTankEmpty() ? OFF : ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 449
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
	;***      450 : //	return (!isAcidTankEmpty() || !isAcidTankEmpty());
	;***      451 : 	return !(O_DRAIN_ACID_PIN_SV5 == OFF && O_DRAIN_ALK_PIN_SV6 == OFF);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 451
	mov a, 0xFFF06
	bt a.7, $.BB@LABEL@18_6
.BB@LABEL@18_5:	; bb34
	mov a, 0xFFF06
	shr a, 0x06
	and a, #0x01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 452
	ret
.BB@LABEL@18_6:	; bb50
	oneb a
	ret
_WaterSupplyOperation_nostop:
	.STACK _WaterSupplyOperation_nostop = 14
	;***      452 : }
	;***      453 : ///**
	;***      454 : // * FlowSensorCheck
	;***      455 : // * 30/11/2021: Checked!
	;***      456 : // * @return 0 is Error, 1 is OK, 2 Still taking
	;***      457 : // */
	;***      458 : //uint8_t FlowSensorCheck(uint32_t *_time) {
	;***      459 : ////	g_flow_value = measureFlowSensor();
	;***      460 : //	if ((g_flow_value < g_numberSetting.upperFlow)
	;***      461 : //			& (g_flow_value > g_numberSetting.lowerFlow)) {
	;***      462 : //		return 1;
	;***      463 : //	} else {
	;***      464 : //		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      465 : //		return 0;
	;***      466 : //	}
	;***      467 : //}
	;***      468 : /**
	;***      469 :  * WaterSupplyOperation
	;***      470 :  * 30/11/2021: Checked by An
	;***      471 :  */
	;***      472 : uint8_t WaterSupplyOperation_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 472
	subw sp, #0x06
	;***      473 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      474 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      475 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 475
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
.BB@LABEL@19_7:	; switch_clause_bb84
	;***      476 : 	case 0:
	;***      477 : 		*tick = g_systemTime;
	;***      478 : 		(*state)++;
	;***      479 : 		break;
	;***      480 : 	case 1:
	;***      481 : 		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
	;***      482 : 		if (ns_delay_ms(tick, 30000)) {
	;***      483 : 			(*state)++;
	;***      484 : 		}
	;***      485 : 		break;
	;***      486 : 	case 2:
	;***      487 : 		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      488 : 		if (ns_delay_ms(tick, 500)) {
	;***      489 : 			(*state)++;
	;***      490 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      491 : 		}
	;***      492 : 		break;
	;***      493 : 	case 3:
	;***      494 : 		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      495 : 		if (ns_delay_ms(tick, 15000)) {
	;***      496 : 			(*state)++;
	;***      497 : 			g_machine_state.flowSensor = 0;
	;***      498 : 		}
	;***      499 : 		measureFlowSensor_nostop();
	;***      500 : 		break;
	;***      501 : 	case 4:
	;***      502 : 		measureFlowSensor(&g_timerSetting.t3_flowSensorMonitorTime_s);
	;***      503 : 		(*state)++;
	;***      504 : 		break;
	;***      505 : 	case 5:
	;***      506 : 		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      507 : 				|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      508 : 			(*state) = 3;
	;***      509 : 			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      510 : 					g_io_status.refined.FlowValue);
	;***      511 : 		} else
	;***      512 : 			(*state)++;
	;***      513 : 		g_Tick.tickWaterSupply = g_systemTime;
	;***      514 : 		break;
	;***      515 : 	case 6:
	;***      516 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply,
	;***      517 : 				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
	;***      518 : 			(*state)++;
	;***      519 : 		}
	;***      520 : 		break;
	;***      521 : 	default:
	;***      522 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 522
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@19_15
.BB@LABEL@19_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 477
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 478
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@19_15
.BB@LABEL@19_9:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 481
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 482
	clrw ax
	movw de, ax
	movw bc, #0x7530
	br $!.BB@LABEL@19_24
.BB@LABEL@19_10:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 487
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 488
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_15
.BB@LABEL@19_11:	; if_then_bb24
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 489
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 490
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00024), ax
	br $.BB@LABEL@19_15
.BB@LABEL@19_12:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 494
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 495
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_14
.BB@LABEL@19_13:	; if_then_bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 496
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 497
	clrb !LOWW(_g_machine_state+0x00005)
.BB@LABEL@19_14:	; if_break_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 499
	call $!_measureFlowSensor_nostop
.BB@LABEL@19_15:	; if_break_bb41
	br $.BB@LABEL@19_22
.BB@LABEL@19_16:	; switch_clause_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 502
	movw ax, #LOWW(_g_timerSetting+0x00008)
	call $!_measureFlowSensor
	br $.BB@LABEL@19_25
.BB@LABEL@19_17:	; switch_clause_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 506
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 512
	inc a
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@19_21
.BB@LABEL@19_20:	; if_then_bb64
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 508
	mov !LOWW(_g_machine_state+0x00004), #0x03
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	movw ax, #0x4104
	call $!_sendToRasPi_f
.BB@LABEL@19_21:	; if_break_bb70
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 513
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
.BB@LABEL@19_22:	; if_break_bb70
	br $.BB@LABEL@19_26
.BB@LABEL@19_23:	; switch_clause_bb72
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 516
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
.BB@LABEL@19_24:	; switch_clause_bb72
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@19_25:	; if_then_bb79
	inc !LOWW(_g_machine_state+0x00004)
.BB@LABEL@19_26:	; switch_break_bb
	;***      523 : 		break;
	;***      524 : 	}
	;***      525 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 525
	call !!_R_WDT_Restart
	;***      526 : //	if (*state == 6 + 1) {
	;***      527 : //		g_machine_state.flowSensor = 0;
	;***      528 : //		*state = 0;
	;***      529 : //		return 0;
	;***      530 : //	} else
	;***      531 : //		return 1;
	;***      532 : 	return (*state) == 0 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 532
	cmp0 !LOWW(_g_machine_state+0x00004)
	oneb a
	sknz
.BB@LABEL@19_27:	; switch_break_bb
	clrb a
.BB@LABEL@19_28:	; switch_break_bb
	addw sp, #0x06
	ret
_stop_waitAlarmConfirm:
	.STACK _stop_waitAlarmConfirm = 10
	;***      533 : }
	;***      534 : void stop_waitAlarmConfirm(enum Control_status alarm, uint8_t timeout_s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 534
	subw sp, #0x04
	push ax
	;***      535 : 	uint32_t _tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 535
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@20_1:	; bb23
	mov a, [sp+0x01]
	;***      536 : 	while (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 536
	cmp a, !LOWW(_commnunication_flag+0x00007)
	bz $.BB@LABEL@20_4
.BB@LABEL@20_2:	; bb
	;***      537 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 537
	call $!_realTimeResponse
	mov a, [sp+0x00]
	;***      538 : 		if ((ns_delay_ms(&_tick, timeout_s * 1000)) && (timeout_s != 0)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 538
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
	;***      539 : 			break;
	;***      540 : 		}
	;***      541 : 	}
	;***      542 : 	commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 542
	clrb !LOWW(_commnunication_flag+0x00007)
	addw sp, #0x06
	ret
_nostop_waitAlarmConfirm:
	.STACK _nostop_waitAlarmConfirm = 4
	;***      543 : }
	;***      544 : uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	cmp a, !LOWW(_commnunication_flag+0x00007)
	;***      545 : 	if (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 545
	bnz $.BB@LABEL@21_2
.BB@LABEL@21_1:	; if_break_bb
	;***      546 : 		return 1;
	;***      547 : 	}
	;***      548 : 	commnunication_flag.alarm_clear_flag = OK_ALL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 548
	clrb !LOWW(_commnunication_flag+0x00007)
	;***      549 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 549
	clrb a
	ret
.BB@LABEL@21_2:	; bb9
	;***      550 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 550
	oneb a
	ret
_resetAlarm:
	.STACK _resetAlarm = 4
	;***      551 : void resetAlarm(void) {
	;***      552 : 	commnunication_flag.alarm_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 552
	oneb !LOWW(_commnunication_flag+0x00007)
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      553 : }
	;***      554 : 
	;***      555 : /**
	;***      556 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      557 :  * 30/11/2021: Checked by An
	;***      558 :  * @return 0 - OK; 1 - Error
	;***      559 :  */
	;***      560 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 560
	subw sp, #0x0A
	;***      561 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 561
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
	;***      562 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 562
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 576
	ret
.BB@LABEL@23_8:	; if_then_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 552
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      563 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      564 : 			resetAlarm();
	;***      565 : 			sendToRasPi_f(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 565
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4105
	call $!_sendToRasPi_f
	;***      566 : 					g_io_status.refined.CVCCVoltage);
	;***      567 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 567
	set1 !LOWW(_g_alarm).0
	;***      568 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 568
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@23_9:	; if_then_bb11.bb23_crit_edge
	oneb a
.BB@LABEL@23_10:	; bb23
	mov !LOWW(_g_machine_state+0x00008), a
	;***      569 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 569
	movw ax, #0x0500
	call $!_stop_waitAlarmConfirm
	;***      570 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 570
	clr1 !LOWW(_g_alarm).0
	;***      571 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 571
	oneb a
	br $.BB@LABEL@23_7
.BB@LABEL@23_11:	; if_else_bb
	;***      572 : 		}
	;***      573 : 	} else
	;***      574 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 574
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	br $.BB@LABEL@23_6
_Voltage2Check_nostop:
	.STACK _Voltage2Check_nostop = 18
	;***      575 : 	return 0;
	;***      576 : }
	;***      577 : /**
	;***      578 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      579 :  * 16/12/2021: Checked by An
	;***      580 :  * @return 0 - OK
	;***      581 :  */
	;***      582 : void Voltage2Check_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 582
	subw sp, #0x0A
	;***      583 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 583
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
	;***      584 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 584
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
	;***      585 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      586 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 586
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 552
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      587 : 					>= g_numberSetting.upperVoltage1)) {
	;***      588 : 				resetAlarm();
	;***      589 : 				g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 589
	set1 !LOWW(_g_alarm).1
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      590 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 590
	movw ax, #0x4106
	addw sp, #0x0A
	br $!_sendToRasPi_f
.BB@LABEL@24_8:	; if_else_bb
	;***      591 : 						g_io_status.refined.CVCCVoltage);
	;***      592 : 			}
	;***      593 : 		}
	;***      594 : 	} else {
	;***      595 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 595
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      596 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 596
	clr1 !LOWW(_g_alarm).1
.BB@LABEL@24_9:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 598
	ret
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      597 : 	}
	;***      598 : }
	;***      599 : /**
	;***      600 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      601 :  * 16/12/2021: Checked by An
	;***      602 :  * @return 0 - OK; 1 - Error
	;***      603 :  */
	;***      604 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 604
	subw sp, #0x0A
	;***      605 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 605
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
	;***      606 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 606
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
	;***      607 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      608 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 608
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 552
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      609 : 					>= g_numberSetting.upperVoltage2)) {
	;***      610 : 				resetAlarm();
	;***      611 : 				g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 611
	set1 !LOWW(_g_alarm).2
	;***      612 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 612
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      613 : //				g_machine_state.electrolyteOFF =
	;***      614 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      615 : //								1 : g_machine_state.electrolyteOFF;
	;***      616 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 616
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
	;***      617 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 617
	movw ax, #0x4107
	call $!_sendToRasPi_f
	;***      618 : 						g_io_status.refined.CVCCVoltage);
	;***      619 : 				stop_waitAlarmConfirm(OVER_VOLTAGE_3, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 619
	movw ax, #0x0700
	call $!_stop_waitAlarmConfirm
	;***      620 : 				g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 620
	clr1 !LOWW(_g_alarm).2
	;***      621 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 621
	oneb a
	br $.BB@LABEL@25_12
.BB@LABEL@25_10:	; if_else_bb
	;***      622 : 			}
	;***      623 : 		}
	;***      624 : 	} else {
	;***      625 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 625
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
.BB@LABEL@25_11:	; bb48
	clrb a
.BB@LABEL@25_12:	; bb48
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 628
	ret
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      626 : 	}
	;***      627 : 	return 0;
	;***      628 : }
	;***      629 : /**
	;***      630 :  * Checked 16/12/2021
	;***      631 :  * @return
	;***      632 :  */
	;***      633 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 633
	subw sp, #0x0A
	;***      634 : 	if ((g_systemTime - g_TimeKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 634
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
	;***      635 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      636 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 636
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
	;***      637 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 637
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 657
	ret
.BB@LABEL@26_13:	; if_then_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 552
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      638 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      639 : 				resetAlarm();
	;***      640 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 640
	set1 !LOWW(_g_alarm).5
	;***      641 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 641
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      642 : //				g_machine_state.electrolyteOFF =
	;***      643 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      644 : //								1 : g_machine_state.electrolyteOFF;
	;***      645 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 645
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@26_14:	; if_then_bb20.bb32_crit_edge
	oneb a
.BB@LABEL@26_15:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	;***      646 : 				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 646
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4108
	call $!_sendToRasPi_f
	;***      647 : 						g_io_status.refined.CVCCVoltage);
	;***      648 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 648
	movw ax, #0x0800
	call $!_stop_waitAlarmConfirm
	;***      649 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 649
	clr1 !LOWW(_g_alarm).5
	;***      650 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 650
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
	;***      651 : 			}
	;***      652 : 		} else
	;***      653 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      654 : 	} else
	;***      655 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      656 : 	return 0;
	;***      657 : }
	;***      658 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 658
	subw sp, #0x0E
	;***      659 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 659
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      660 : 	const uint16_t _max_time = 10000;
	;***      661 : 	if (g_systemTime - g_TimeKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 661
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
	;***      662 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 662
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
	;***      663 : 				|| (g_io_status.refined.CVCCCurrent
	;***      664 : 						>= g_numberSetting.upperCurrent)) {
	;***      665 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 665
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
	;***      666 : 					&& (g_alarm.refined.overCurrent == 0)
	;***      667 : 					&& (g_io_status.refined.CVCCCurrent
	;***      668 : 							<= g_numberSetting.lowerCurrent)) {
	;***      669 : 				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 669
	movw ax, #0x4109
	call $!_sendToRasPi_f
.BB@LABEL@27_18:	; if_break_bb
	;***      670 : 						g_io_status.refined.CVCCCurrent);
	;***      671 : 			}
	;***      672 : 			g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 672
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
	;***      673 : 					g_io_status.refined.CVCCCurrent
	;***      674 : 							<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      675 : 
	;***      676 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 676
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
	;***      677 : 					>= g_numberSetting.upperCurrent) {
	;***      678 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 678
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_34
.BB@LABEL@27_30:	; if_then_bb88
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 552
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      679 : 					resetAlarm();
	;***      680 : 					g_alarm.refined.overCurrent = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 680
	set1 !LOWW(_g_alarm).3
	;***      681 : 					g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 681
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      682 : //					g_machine_state.electrolyteOFF =
	;***      683 : //							g_machine_state.electrolyteOFF == 0 ?
	;***      684 : //									1 : g_machine_state.electrolyteOFF;
	;***      685 : 					electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 685
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@27_31:	; if_then_bb88.bb102_crit_edge
	oneb a
.BB@LABEL@27_32:	; bb102
	mov !LOWW(_g_machine_state+0x00008), a
	;***      686 : 					sendToRasPi_f(H_ALARM, OVER_CURRENT,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 686
	movw bc, !LOWW(_g_io_status+0x0000E)
	movw de, !LOWW(_g_io_status+0x00010)
	movw ax, #0x410A
	call $!_sendToRasPi_f
	;***      687 : 							g_io_status.refined.CVCCCurrent);
	;***      688 : 					stop_waitAlarmConfirm(OVER_CURRENT, 10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 688
	movw ax, #0x0A0A
	call $!_stop_waitAlarmConfirm
	;***      689 : 					g_alarm.refined.overCurrent = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 689
	clr1 !LOWW(_g_alarm).3
	;***      690 : 					return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 690
	oneb a
	br $.BB@LABEL@27_35
.BB@LABEL@27_33:	; if_else_bb
	;***      691 : 				}
	;***      692 : 			} else {
	;***      693 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 693
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@27_34:	; bb117
	clrb a
.BB@LABEL@27_35:	; bb117
	addw sp, #0x0E
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 698
	ret
_ElectrolyticOperation_nostop:
	.STACK _ElectrolyticOperation_nostop = 4
	;***      694 : 			}
	;***      695 : 		}
	;***      696 : 	}
	;***      697 : 	return 0;
	;***      698 : }
	;***      699 : uint8_t ElectrolyticOperation_nostop(void) {
	;***      700 : 	uint8_t *state = &g_machine_state.electrolyteOperation;
	;***      701 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 701
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
	;***      702 : 	case 0:
	;***      703 : 		(*state)++;
	;***      704 : 		break;
	;***      705 : 	case 1:
	;***      706 : 		electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 706
	call $!_electrolyticOperationON
	;***      707 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 707
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	;***      708 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 708
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      709 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 709
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
	;***      710 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 710
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	;***      711 : 		g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 711
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
	br $.BB@LABEL@28_17
.BB@LABEL@28_6:	; switch_clause_bb16
	;***      712 : 		(*state)++;
	;***      713 : 		break;
	;***      714 : 	case 2:
	;***      715 : 		Voltage2Check_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 715
	call $!_Voltage2Check_nostop
	;***      716 : 		if (Voltage1Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 716
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_7:	; if_else_bb
	;***      717 : 			(*state)--;
	;***      718 : 			break;
	;***      719 : 
	;***      720 : 		} else if (Voltage3Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 720
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_8:	; if_else_bb35
	;***      721 : 			(*state)--;
	;***      722 : 			break;
	;***      723 : 		} else if (LowVoltageCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 723
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_9:	; if_else_bb46
	;***      724 : 			(*state)--;
	;***      725 : 			break;
	;***      726 : 		} else if (OverCurrentCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 726
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_10:	; if_else_bb57
	;***      727 : 			(*state)--;
	;***      728 : 			break;
	;***      729 : 		} else if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 729
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@28_15
.BB@LABEL@28_11:	; if_then_bb65
	;***      730 : 			g_alarm.refined.cvcc = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 730
	set1 !LOWW(_g_alarm).7
	;***      731 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 731
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      732 : 			g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 732
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@28_12:	; if_then_bb65.bb78_crit_edge
	oneb a
.BB@LABEL@28_13:	; bb78
	mov !LOWW(_g_machine_state+0x00008), a
	;***      733 : 					g_machine_state.electrolyteOFF == 0 ?
	;***      734 : 							1 : g_machine_state.electrolyteOFF;
	;***      735 : 			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 735
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi_f
	;***      736 : 			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 736
	movw ax, #0x1200
	call $!_stop_waitAlarmConfirm
	;***      737 : 			g_alarm.refined.cvcc = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 737
	clr1 !LOWW(_g_alarm).7
.BB@LABEL@28_14:	; if_then_bb
	dec !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@28_22
.BB@LABEL@28_15:	; if_break_bb92
	;***      738 : 			(*state)--;
	;***      739 : 			break;
	;***      740 : 		}
	;***      741 : 		if (isAcidTankFull() && isAlkalineTankFull())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 741
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
	;***      742 : 			(*state)++;
	;***      743 : 		break;
	;***      744 : 	case 3:
	;***      745 : 		g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 745
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@28_19:	; switch_clause_bb115.bb125_crit_edge
	oneb a
.BB@LABEL@28_20:	; bb125
	mov !LOWW(_g_machine_state+0x00008), a
	br $!.BB@LABEL@28_4
.BB@LABEL@28_21:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 703
	inc a
	mov !LOWW(_g_machine_state+0x00007), a
.BB@LABEL@28_22:	; bb132
	;***      746 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      747 : 						1 : g_machine_state.electrolyteOFF;
	;***      748 : 		(*state) = 0;
	;***      749 : 		break;
	;***      750 : 	default:
	;***      751 : 		(*state) = 0;
	;***      752 : 		break;
	;***      753 : 	}
	;***      754 : 	return (*state) == 0 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 754
	cmp0 !LOWW(_g_machine_state+0x00007)
	oneb a
	skz
.BB@LABEL@28_23:	; bb132
	clrb a
.BB@LABEL@28_24:	; bb132
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      755 : //	WAIT_RESET: electrolyticOperationON();
	;***      756 : //	g_Tick.tickVoltage1Check = g_systemTime;
	;***      757 : //	g_Tick.tickVoltage2Check = g_systemTime;
	;***      758 : //	g_Tick.tickVoltage3Check = g_systemTime;
	;***      759 : //	g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      760 : //	g_Tick.tickCurrentCheck = g_systemTime;
	;***      761 : //	do {
	;***      762 : //		realTimeResponse();
	;***      763 : //		if (Voltage1Check_waitReset())
	;***      764 : //			goto WAIT_RESET;
	;***      765 : //		Voltage2Check_nostop();
	;***      766 : //		if (Voltage3Check_waitReset())
	;***      767 : //			goto WAIT_RESET;
	;***      768 : //		if (LowVoltageCheck_waitReset())
	;***      769 : //			goto WAIT_RESET;
	;***      770 : //		if (OverCurrentCheck_waitReset())
	;***      771 : //			goto WAIT_RESET;
	;***      772 : //		//----------CVCC Alarm Input-----------------
	;***      773 : //		if (I_CVCC_ALARM_IN == I_ON) {
	;***      774 : //			g_alarm.refined.cvcc = 1;
	;***      775 : //			g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      776 : //			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	;***      777 : //			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	;***      778 : //			g_alarm.refined.cvcc = 0;
	;***      779 : //			goto WAIT_RESET;
	;***      780 : //		}
	;***      781 : //		R_WDT_Restart();
	;***      782 : //	} while (!isAcidTankFull() || !isAlkalineTankFull());
	;***      783 : //	g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      784 : }
	;***      785 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 785
	subw sp, #0x04
	;***      786 : 	uint32_t _time_count = 0;
	;***      787 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 787
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
	;***      788 : 			& (_time_count
	;***      789 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      790 : 		_time_count++;
	;***      791 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 791
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@29_5:	; if_break_bb
	;***      792 : 	}
	;***      793 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 793
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
	;***      794 : 		sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 794
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi_f
.BB@LABEL@29_9:	; return
	;***      795 : 	}
	;***      796 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 796
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      797 : void saltWaterTankFullCheck(void) {
	;***      798 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 798
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@30_2
.BB@LABEL@30_1:	; return
	;***      799 : 		sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      800 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	;***      801 : 		g_machine_state.electrolyteOFF =
	;***      802 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      803 : 						1 : g_machine_state.electrolyteOFF;
	;***      804 : 	}
	;***      805 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 805
	ret
.BB@LABEL@30_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 799
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 800
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 801
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@30_3:	; if_then_bb.bb14_crit_edge
	oneb a
.BB@LABEL@30_4:	; bb14
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 805
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      806 : void saltWaterTankEmptyCheck(void) {
	;***      807 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 807
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@31_2
.BB@LABEL@31_1:	; if_then_bb
	;***      808 : 		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 808
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi_f
.BB@LABEL@31_2:	; return
	;***      809 : 	}
	;***      810 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 810
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      811 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 811
	movw de, #0xFF07
	;***      812 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 812
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
	;***      813 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      814 : 		sendToRasPi_f(H_ALARM, ACID_ERROR, 1);
	;***      815 : 
	;***      816 : 	}
	;***      817 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 817
	ret
.BB@LABEL@32_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 814
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi_f
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      818 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 818
	push hl
	;***      819 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 819
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
	;***      820 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      821 : 		sendToRasPi_f(H_ALARM, ALKALINE_ERROR, 1);
	;***      822 : 	}
	;***      823 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 823
	ret
.BB@LABEL@33_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 821
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi_f
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      824 : 
	;***      825 : uint8_t FilterReplacementCheck(void) {
	;***      826 : 
	;***      827 : 	return 0;
	;***      828 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 828
	clrb a
	ret
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      829 : 
	;***      830 : /**
	;***      831 :  * Tested: 10/12/2021 by Mr.An
	;***      832 :  */
	;***      833 : void WaterWashingMode_nostop(void) {
	;***      834 : 	uint8_t *state = &g_machine_state.water;
	;***      835 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      836 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 836
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
	;***      837 : 	case 0:
	;***      838 : 		g_machine_state.mode = WATER_WASHING;
	;***      839 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      840 : 		g_color = WHITE;
	;***      841 : 		*tick = g_systemTime;
	;***      842 : 		(*state)++;
	;***      843 : 		handSensorLED(g_color);
	;***      844 : 		break;
	;***      845 : 	case 1:
	;***      846 : 		if (ns_delay_ms(tick, 50)) {
	;***      847 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      848 : 			(*state)++;
	;***      849 : 		}
	;***      850 : 		break;
	;***      851 : 	case 2:
	;***      852 : 		if (DETECT_U == I_ON) {
	;***      853 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      854 : 			g_color = BLACK;
	;***      855 : 			(*state) = 0;
	;***      856 : 			g_machine_state.mode = BUSY;
	;***      857 : 			handSensorLED(g_color);
	;***      858 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      859 : 		}
	;***      860 : 		break;
	;***      861 : 	default:
	;***      862 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 862
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@35_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 838
	mov !LOWW(_g_machine_state+0x0000E), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 839
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 840
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 841
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 842
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 843
	mov a, #0x02
	br $!_handSensorLED
.BB@LABEL@35_5:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 846
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00018)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@35_9
.BB@LABEL@35_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 847
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call $!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 848
	inc !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@35_7:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 852
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@35_9
.BB@LABEL@35_8:	; if_then_bb27
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 853
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 854
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 855
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 856
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 857
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 858
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@35_9:	; return
	;***      863 : 		break;
	;***      864 : 	}
	;***      865 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 865
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***      866 : 
	;***      867 : /**
	;***      868 :  * Tested: 24/12/2021 by Mr.An
	;***      869 :  */
	;***      870 : void HandWashingMode_nostop(void) {
	;***      871 : 	uint8_t *state = &g_machine_state.handwash;
	;***      872 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      873 : 	const uint32_t delayPump_ms = 50;
	;***      874 : 	if ((*state) == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 874
	mov a, !LOWW(_g_machine_state+0x00003)
	mov d, a
	cmp0 a
	bnz $.BB@LABEL@36_10
.BB@LABEL@36_1:	; if_then_bb
	;***      875 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 875
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
	;***      876 : 				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***      877 : 						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***      878 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 878
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
	;***      879 : 				g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***      880 : 						1000 : g_timerSetting.t54_overLapTime_ms;
	;***      881 : 	} else {
	;***      882 : //		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
	;***      883 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      884 : //		}
	;***      885 : 	}
	;***      886 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 886
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
	;***      887 : 	case 0:
	;***      888 : 		*state = 1;
	;***      889 : 		*tick = g_systemTime;
	;***      890 : 		break;
	;***      891 : 	case 1:
	;***      892 : 		g_machine_state.mode = HAND_WASHING;
	;***      893 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      894 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      895 : 			O_PUMP_ALK_PIN = ON;
	;***      896 : 			handSensorLED(BLUE);
	;***      897 : 			(*state)++;
	;***      898 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      899 : //			g_Tick.tickAnimation = g_systemTime;
	;***      900 : //			g_machine_state.waitAnimationRes = 1;
	;***      901 : 		}
	;***      902 : 		break;
	;***      903 : 	case 2:
	;***      904 : 		if (ns_delay_ms(tick,
	;***      905 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      906 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      907 : 			O_PUMP_ALK_PIN = OFF;
	;***      908 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      909 : 			(*state)++;
	;***      910 : 		}
	;***      911 : 		break;
	;***      912 : 	case 3:
	;***      913 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      914 : 			O_PUMP_ACID_PIN = ON;
	;***      915 : 			handSensorLED(RED);
	;***      916 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      917 : 			(*state)++;
	;***      918 : 		}
	;***      919 : 		break;
	;***      920 : 	case 4:
	;***      921 : 		if (ns_delay_ms(tick,
	;***      922 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      923 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      924 : 			(*state)++;
	;***      925 : 		}
	;***      926 : 		break;
	;***      927 : 	case 5:
	;***      928 : 		if (ns_delay_ms(tick,
	;***      929 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      930 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      931 : 			O_PUMP_ACID_PIN = OFF;
	;***      932 : 			handSensorLED(WHITE);
	;***      933 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      934 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      935 : 			(*state)++;
	;***      936 : 		}
	;***      937 : 		break;
	;***      938 : 	case 6:
	;***      939 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      940 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      941 : 			(*state)++;
	;***      942 : 		}
	;***      943 : 		break;
	;***      944 : 	case 7:
	;***      945 : 		if (ns_delay_ms(tick,
	;***      946 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      947 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      948 : 			handSensorLED(BLACK);
	;***      949 : 			(*state) = 0;
	;***      950 : 			g_machine_state.mode = BUSY;
	;***      951 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      952 : 		}
	;***      953 : 		break;
	;***      954 : 	default:
	;***      955 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 955
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@36_19:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 888
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 889
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	ret
.BB@LABEL@36_20:	; switch_clause_bb34
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 892
	oneb !LOWW(_g_machine_state+0x0000E)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 893
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 894
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_28
.BB@LABEL@36_21:	; if_then_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 895
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 896
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 897
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@36_22:	; if_then_bb41
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@36_23:	; switch_clause_bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 904
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 907
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 908
	set1 0xFFF07.6
	br $.BB@LABEL@36_36
.BB@LABEL@36_27:	; switch_clause_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 913
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 914
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 915
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 921
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 923
	clr1 0xFFF07.7
.BB@LABEL@36_36:	; if_then_bb82
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 959
	ret
.BB@LABEL@36_37:	; switch_clause_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 928
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 931
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 932
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 933
	set1 0xFFF05.5
	br $.BB@LABEL@36_30
.BB@LABEL@36_42:	; switch_clause_bb102
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 939
	movw bc, !LOWW(_g_timerSetting+0x00074)
	movw de, !LOWW(_g_timerSetting+0x00076)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@36_43:	; switch_clause_bb102
	bz $.BB@LABEL@36_47
.BB@LABEL@36_44:	; if_then_bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 940
	clr1 0xFFF07.6
	br $.BB@LABEL@36_36
.BB@LABEL@36_45:	; switch_clause_bb114
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 945
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 947
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 948
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 949
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 950
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	br $!.BB@LABEL@36_22
.BB@LABEL@36_47:	; return
	;***      956 : 		break;
	;***      957 : 	}
	;***      958 : 
	;***      959 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 959
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      960 : /**
	;***      961 :  * Tested: 24/12/2021 by Mr.An
	;***      962 :  */
	;***      963 : void AcidWaterMode_nostop(void) {
	;***      964 : 	uint8_t *state = &g_machine_state.acid;
	;***      965 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      966 : 	const uint32_t delayPump_ms = 50;
	;***      967 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 967
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
	;***      968 : 	case 0:
	;***      969 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      970 : 		g_machine_state.mode = ACID_WASHING;
	;***      971 : 		*state = 1;
	;***      972 : 		*tick = g_systemTime;
	;***      973 : 		break;
	;***      974 : 	case 1:
	;***      975 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      976 : 		g_color = RED;
	;***      977 : 		handSensorLED(g_color);
	;***      978 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      979 : 			O_PUMP_ACID_PIN = ON;
	;***      980 : 			(*state)++;
	;***      981 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      982 : 		}
	;***      983 : 		break;
	;***      984 : 	case 2:
	;***      985 : 		//TODO: Change turn OFF signal here
	;***      986 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      987 : 				|| (DETECT_U == I_ON)) {
	;***      988 : 			O_PUMP_ACID_PIN = OFF;
	;***      989 : 			(*state)++;
	;***      990 : 		}
	;***      991 : 		break;
	;***      992 : 	case 3:
	;***      993 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      994 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      995 : 			g_color = BLACK;
	;***      996 : 			handSensorLED(g_color);
	;***      997 : 			(*state)++;
	;***      998 : 		}
	;***      999 : 		break;
	;***     1000 : 	default:
	;***     1001 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1001
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***     1002 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1002
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi_f
	;***     1003 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1003
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@37_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 970
	mov !LOWW(_g_machine_state+0x0000E), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 971
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 972
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@37_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 975
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 976
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 977
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 978
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@37_14
.BB@LABEL@37_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 979
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 980
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 981
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@37_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 986
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 988
	clr1 0xFFF06.2
.BB@LABEL@37_11:	; if_then_bb39
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1006
	ret
.BB@LABEL@37_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 993
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@37_14
.BB@LABEL@37_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 994
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 995
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 996
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@37_11
.BB@LABEL@37_14:	; return
	;***     1004 : 		break;
	;***     1005 : 	}
	;***     1006 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1006
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***     1007 : /**
	;***     1008 :  * Tested: 24/12/2021 by Mr.An
	;***     1009 :  */
	;***     1010 : void AlkalineWaterMode_nostop(void) {
	;***     1011 : 	uint8_t *state = &g_machine_state.akaline;
	;***     1012 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***     1013 : 	const uint32_t delayPump_ms = 50;
	;***     1014 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1014
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
	;***     1015 : 	case 0:
	;***     1016 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***     1017 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***     1018 : 		*state = 1;
	;***     1019 : 		*tick = g_systemTime;
	;***     1020 : 		break;
	;***     1021 : 	case 1:
	;***     1022 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***     1023 : 		g_color = BLUE;
	;***     1024 : 		handSensorLED(g_color);
	;***     1025 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***     1026 : 			O_PUMP_ALK_PIN = ON;
	;***     1027 : 			(*state)++;
	;***     1028 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***     1029 : 		}
	;***     1030 : 		break;
	;***     1031 : 	case 2:
	;***     1032 : 		//TODO: Change turn OFF signal here
	;***     1033 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***     1034 : 				|| (DETECT_U == I_ON)) {
	;***     1035 : 			O_PUMP_ALK_PIN = OFF;
	;***     1036 : 			(*state)++;
	;***     1037 : 		}
	;***     1038 : 		break;
	;***     1039 : 	case 3:
	;***     1040 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***     1041 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***     1042 : 			g_color = BLACK;
	;***     1043 : 			handSensorLED(g_color);
	;***     1044 : 			(*state)++;
	;***     1045 : 		}
	;***     1046 : 		break;
	;***     1047 : 	default:
	;***     1048 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1048
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***     1049 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1049
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi_f
	;***     1050 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1050
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@38_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1017
	mov !LOWW(_g_machine_state+0x0000E), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1018
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1019
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@38_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1022
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1023
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1024
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1025
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_14
.BB@LABEL@38_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1026
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1027
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1028
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@38_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1033
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1035
	clr1 0xFFF06.1
.BB@LABEL@38_11:	; if_then_bb39
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1053
	ret
.BB@LABEL@38_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1040
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_14
.BB@LABEL@38_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1041
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1042
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1043
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@38_11
.BB@LABEL@38_14:	; return
	;***     1051 : 		break;
	;***     1052 : 	}
	;***     1053 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1053
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***     1054 : 
	;***     1055 : // Newest
	;***     1056 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1056
	subw sp, #0x0A
	;***     1057 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1057
	call $!_UpdateMachineStatus
.BB@LABEL@39_1:	; bb1
	;***     1058 : 	while (InitialOperationModeStart_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1058
	call $!_InitialOperationModeStart_nostop
	cmp0 a
	bz $.BB@LABEL@39_3
.BB@LABEL@39_2:	; bb
	;***     1059 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1059
	call $!_RaspberryResponse_nostop
	;***     1060 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1060
	call $!_UpdateMachineStatus
	;***     1061 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1061
	call !!_R_WDT_Restart
	br $.BB@LABEL@39_1
.BB@LABEL@39_3:	; bb5
	;***     1062 : 	}
	;***     1063 : 
	;***     1064 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1064
	call $!_UpdateMachineStatus
.BB@LABEL@39_4:	; bb7
	;***     1065 : 	while (WaterSupplyOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1065
	call $!_WaterSupplyOperation_nostop
	cmp0 a
	bz $.BB@LABEL@39_6
.BB@LABEL@39_5:	; bb6
	;***     1066 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1066
	call $!_realTimeResponse
	br $.BB@LABEL@39_4
.BB@LABEL@39_6:	; bb13
	;***     1067 : 	}
	;***     1068 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1068
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
	;***     1069 : 		sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1069
	movw ax, #0x4104
	call $!_sendToRasPi_f
.BB@LABEL@39_12:	; bb21
	;***     1070 : 				g_io_status.refined.FlowValue);
	;***     1071 : 	}
	;***     1072 : 	while (!ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1072
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@39_14
.BB@LABEL@39_13:	; bb20
	;***     1073 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1073
	call $!_realTimeResponse
	br $.BB@LABEL@39_12
.BB@LABEL@39_14:	; return
	;***     1074 : 	}
	;***     1075 : 
	;***     1076 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1076
	addw sp, #0x0A
	ret
_userAuthHandler_nostop:
	.STACK _userAuthHandler_nostop = 4
	;***     1077 : 
	;***     1078 : void userAuthHandler_nostop(void) {
	;***     1079 : 	if (g_machine_state.user == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1079
	cmp !LOWW(_g_machine_state+0x0000D), #0x01
	bnz $.BB@LABEL@40_9
.BB@LABEL@40_1:	; if_then_bb
	;***     1080 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1080
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
	;***     1081 : 		case HAND_WASHING:
	;***     1082 : 			HandWashingMode_nostop();
	;***     1083 : 			break;
	;***     1084 : 		case WATER_WASHING:
	;***     1085 : 			WaterWashingMode_nostop();
	;***     1086 : 			break;
	;***     1087 : 		case ACID_WASHING:
	;***     1088 : 			AcidWaterMode_nostop();
	;***     1089 : 			break;
	;***     1090 : 		case ALKALINE_WASHING:
	;***     1091 : 			AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1091
	br $!_AlkalineWaterMode_nostop
.BB@LABEL@40_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1082
	br $!_HandWashingMode_nostop
.BB@LABEL@40_7:	; switch_clause_bb6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1085
	br $!_WaterWashingMode_nostop
.BB@LABEL@40_8:	; switch_clause_bb7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1088
	br $!_AcidWaterMode_nostop
.BB@LABEL@40_9:	; return
	;***     1092 : 			break;
	;***     1093 : 		default:
	;***     1094 : 			break;
	;***     1095 : 		}
	;***     1096 : 	}
	;***     1097 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1097
	ret
_ElectrolyzeWaterGeneration_nostop:
	.STACK _ElectrolyzeWaterGeneration_nostop = 4
	;***     1098 : /*!
	;***     1099 :  * Tested!
	;***     1100 :  */
	;***     1101 : void ElectrolyzeWaterGeneration_nostop(void) {
	;***     1102 : 	if ((g_machine_state.mode != ELECTROLYTIC_GENERATION)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1102
	mov a, !LOWW(_g_machine_state+0x0000E)
	cmp0 a
	bnz $.BB@LABEL@41_4
.BB@LABEL@41_1:	; if_then_bb
	;***     1103 : 			&& (g_machine_state.mode == INDIE)) {
	;***     1104 : 		if (isAcidTankEmpty() || isAlkalineTankEmpty()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1104
	call $!_isAcidTankEmpty
	cmp0 a
	bnz $.BB@LABEL@41_3
.BB@LABEL@41_2:	; bb18
	call $!_isAlkalineTankEmpty
	cmp0 a
	bz $.BB@LABEL@41_12
.BB@LABEL@41_3:	; if_then_bb31
	;***     1105 : 			// Start Electrolyte
	;***     1106 : 			g_machine_state.mode = ELECTROLYTIC_GENERATION;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1106
	mov !LOWW(_g_machine_state+0x0000E), #0x08
	;***     1107 : 			//Stop what ever operation is happening
	;***     1108 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1108
	clrb !LOWW(_g_machine_state+0x0000D)
	;***     1109 : 			g_machine_state.handwash = g_machine_state.water =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1109
	clrb !LOWW(_g_machine_state)
	clrb !LOWW(_g_machine_state+0x00001)
	clrb !LOWW(_g_machine_state+0x00002)
	clrb !LOWW(_g_machine_state+0x00003)
	movw hl, #0xFF06
	movw ax, hl
	movw de, ax
	;***     1110 : 					g_machine_state.acid = g_machine_state.akaline = 0;
	;***     1111 : 			O_PUMP_ACID_PIN = O_PUMP_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1111
	clr1 [hl].1
	mov a, [de]
	mov1 CY, a.1
	mov a, [de]
	mov1 a.2, CY
	mov [de], a
	;***     1112 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1112
	clr1 0xFFF05.5
	ret
.BB@LABEL@41_4:	; if_else_bb
	;***     1113 : 
	;***     1114 : 		}
	;***     1115 : 	} else if (g_machine_state.mode == ELECTROLYTIC_GENERATION) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1115
	cmp a, #0x08
	bnz $.BB@LABEL@41_12
.BB@LABEL@41_5:	; if_then_bb49
	;***     1116 : 		// Start Loop Electrolyte
	;***     1117 : 		if (ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1117
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@41_13
.BB@LABEL@41_6:	; if_else_bb63
	;***     1118 : 			O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
	;***     1119 : 			g_machine_state.mode = INDIE;
	;***     1120 : 			g_machine_state.user = 0;
	;***     1121 : 			handSensorLED(BLACK);
	;***     1122 : 			// Start Electrolyte Operation Off time keeper
	;***     1123 : 		} else if (!isAcidTankFull() && !isAlkalineTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1123
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@41_8
.BB@LABEL@41_7:	; bb74
	call $!_isAlkalineTankFull
	cmp0 a
	;***     1124 : 			handSensorLEDBlink(WHITE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1124
	mov a, #0x02
	bz $.BB@LABEL@41_10
.BB@LABEL@41_8:	; if_else_bb94
	;***     1125 : 		} else if (!isAcidTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1125
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@41_11
.BB@LABEL@41_9:	; if_then_bb106
	;***     1126 : 			handSensorLEDBlink(RED, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1126
	oneb a
.BB@LABEL@41_10:	; if_then_bb106
	movw de, #0x0000
	movw bc, #0x0064
	br $!_handSensorLEDBlink
.BB@LABEL@41_11:	; if_else_bb107
	;***     1127 : 		} else if (!isAlkalineTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1127
	call $!_isAlkalineTankFull
	cmp0 a
	;***     1128 : 			handSensorLEDBlink(BLUE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1128
	mov a, #0x03
	bz $.BB@LABEL@41_10
.BB@LABEL@41_12:	; return
	;***     1129 : 		}
	;***     1130 : 	}
	;***     1131 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1131
	ret
.BB@LABEL@41_13:	; if_then_bb55
	movw hl, #0xFF07
	movw ax, hl
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1118
	clr1 [hl].7
	mov a, [de]
	mov1 CY, a.7
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1119
	clrb !LOWW(_g_machine_state+0x0000E)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1120
	clrb !LOWW(_g_machine_state+0x0000D)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1121
	clrb a
	br $!_handSensorLED
_isSV1andSV2Off8h:
	.STACK _isSV1andSV2Off8h = 8
	;***     1132 : /*!
	;***     1133 :  * Tested!
	;***     1134 :  */
	;***     1135 : uint8_t isSV1andSV2Off8h(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1135
	push hl
	;***     1136 : 	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1136
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@42_5
.BB@LABEL@42_1:	; bb
	mov a, 0xFFF05
	bt a.5, $.BB@LABEL@42_5
.BB@LABEL@42_2:	; if_then_bb
	;***     1137 : 		if (ns_delay_ms(&g_Tick.tickSV1SV2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1137
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1146
	ret
.BB@LABEL@42_5:	; if_else_bb
	;***     1138 : 				(uint32_t) g_timerSetting.t61_curranCleaningIntervalTime_h * 60
	;***     1139 : 						* 60 * 1000)) {
	;***     1140 : 			return 1;
	;***     1141 : 		}
	;***     1142 : 	} else {
	;***     1143 : 		g_Tick.tickSV1SV2 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1143
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
	clrb a
	br $.BB@LABEL@42_4
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***     1144 : 	}
	;***     1145 : 	return 0;
	;***     1146 : }
	;***     1147 : /*!
	;***     1148 :  * Tested!
	;***     1149 :  */
	;***     1150 : void CallanCleaningMode_nostop(void) {
	;***     1151 : 	uint8_t *state = &g_machine_state.callan;
	;***     1152 : 	uint32_t *tick = &g_Tick.tickCallan;
	;***     1153 : 	if (isSV1andSV2Off8h() || (*state) != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1153
	call $!_isSV1andSV2Off8h
	cmp0 a
	bnz $.BB@LABEL@43_2
.BB@LABEL@43_1:	; bb
	cmp0 !LOWW(_g_machine_state+0x00006)
	bz $.BB@LABEL@43_8
.BB@LABEL@43_2:	; if_then_bb
	;***     1154 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1154
	mov a, !LOWW(_g_machine_state+0x00006)
	cmp0 a
	bz $.BB@LABEL@43_5
.BB@LABEL@43_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@43_6
.BB@LABEL@43_4:	; switch_clause_bb37
	;***     1155 : 		case 0:
	;***     1156 : 			(*state)++;
	;***     1157 : 			*tick = g_systemTime;
	;***     1158 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***     1159 : 			g_machine_state.mode = CALLAN_MODE;
	;***     1160 : 			break;
	;***     1161 : 		case 1:
	;***     1162 : 			handSensorLEDBlink(WHITE, 500);
	;***     1163 : 			if (ns_delay_ms(tick,
	;***     1164 : 					g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***     1165 : 				(*state)++;
	;***     1166 : 				O_SPOUT_WATER_PIN_SV2 = OFF;
	;***     1167 : 				handSensorLED(BLACK);
	;***     1168 : 			}
	;***     1169 : 			break;
	;***     1170 : 		default:
	;***     1171 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1171
	clrb !LOWW(_g_machine_state+0x00006)
	ret
.BB@LABEL@43_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1156
	inc a
	mov !LOWW(_g_machine_state+0x00006), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1157
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1158
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1159
	mov !LOWW(_g_machine_state+0x0000E), #0x09
	ret
.BB@LABEL@43_6:	; switch_clause_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1162
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	mov a, #0x02
	call $!_handSensorLEDBlink
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1163
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1165
	inc !LOWW(_g_machine_state+0x00006)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1166
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1167
	clrb a
	br $!_handSensorLED
.BB@LABEL@43_8:	; return
	;***     1172 : 			break;
	;***     1173 : 		}
	;***     1174 : 	}
	;***     1175 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1175
	ret
_DrainageMode_nostop:
	.STACK _DrainageMode_nostop = 14
	;***     1176 : /*!
	;***     1177 :  * Tested!
	;***     1178 :  */
	;***     1179 : void DrainageMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1179
	subw sp, #0x06
	;***     1180 : 	uint8_t *state = &g_machine_state.drainage;
	;***     1181 : 	uint32_t *tick = &g_Tick.tickDrainage;
	;***     1182 : 	if (g_machine_state.mode == DRAINAGE_MODE) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1182
	mov a, !LOWW(_g_machine_state+0x0000E)
	mov b, a
	cmp a, #0x0A
	.bnz $!.BB@LABEL@44_25
.BB@LABEL@44_1:	; if_then_bb
	;***     1183 : 		// Start Drainage Loop
	;***     1184 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1184
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
	;***     1185 : 		case 0:
	;***     1186 : 			if (InitialOperationModeStart_nostop() == 0) {
	;***     1187 : 				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***     1188 : 				(*state)++;
	;***     1189 : 			}
	;***     1190 : 			break;
	;***     1191 : 		case 1:
	;***     1192 : 			if (ns_delay_ms(tick, 15 * 1000)) {
	;***     1193 : 				(*state)++;
	;***     1194 : 			}
	;***     1195 : 			break;
	;***     1196 : 		case 2:
	;***     1197 : 			if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***     1198 : 					|| (g_io_status.refined.FlowValue
	;***     1199 : 							> g_numberSetting.upperFlow)) {
	;***     1200 : 				(*state)--;
	;***     1201 : 				rx_count++;
	;***     1202 : 			} else {
	;***     1203 : 				(*state)++;
	;***     1204 : 			}
	;***     1205 : 			(*tick) = g_systemTime;
	;***     1206 : 			break;
	;***     1207 : 		case 3:
	;***     1208 : 			if (ns_delay_ms(tick, 10 * 1000)) {
	;***     1209 : 				electrolyticOperationON();
	;***     1210 : 				(*state)++;
	;***     1211 : 			}
	;***     1212 : 			break;
	;***     1213 : 		case 4:
	;***     1214 : 			if (isAcidTankFull() && isAlkalineTankFull()) {
	;***     1215 : 				electrolyticOperationOFF();
	;***     1216 : 				(*state)++;
	;***     1217 : 			}
	;***     1218 : 			break;
	;***     1219 : 		default:
	;***     1220 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1220
	clrb !LOWW(_g_machine_state+0x00009)
	;***     1221 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1221
	clrb !LOWW(_g_machine_state+0x0000E)
	br $.BB@LABEL@44_16
.BB@LABEL@44_7:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1186
	call $!_InitialOperationModeStart_nostop
	cmp0 a
	bnz $.BB@LABEL@44_16
.BB@LABEL@44_8:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1187
	set1 0xFFF01.7
	br $.BB@LABEL@44_10
.BB@LABEL@44_9:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1192
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1197
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1203
	inc a
	mov !LOWW(_g_machine_state+0x00009), a
	br $.BB@LABEL@44_15
.BB@LABEL@44_14:	; bb40
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1200
	dec a
	mov !LOWW(_g_machine_state+0x00009), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1201
	inc !LOWW(_rx_count)
.BB@LABEL@44_15:	; if_break_bb54
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
.BB@LABEL@44_16:	; return
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1231
	ret
.BB@LABEL@44_17:	; switch_clause_bb57
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1208
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@44_16
.BB@LABEL@44_18:	; if_then_bb63
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1209
	call $!_electrolyticOperationON
.BB@LABEL@44_19:	; if_then_bb63
	br $.BB@LABEL@44_10
.BB@LABEL@44_20:	; switch_clause_bb68
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1214
	call $!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@44_16
.BB@LABEL@44_21:	; bb73
	call $!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@44_16
.BB@LABEL@44_22:	; if_then_bb86
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1215
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@44_23:	; if_then_bb86.bb96_crit_edge
	oneb a
.BB@LABEL@44_24:	; bb96
	mov !LOWW(_g_machine_state+0x00008), a
	br $.BB@LABEL@44_19
.BB@LABEL@44_25:	; if_else_bb106
	;***     1222 : 			break;
	;***     1223 : 		}
	;***     1224 : 	} else if ((g_TimeKeeper.electrolyteOff_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1224
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
	;***     1225 : 			>= g_timerSetting.t6_drainageOffTime_h)
	;***     1226 : 			&& (g_machine_state.isMidNight != 0)
	;***     1227 : 			&& (g_machine_state.mode == INDIE)) {
	;***     1228 : 		g_machine_state.mode = DRAINAGE_MODE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1228
	mov !LOWW(_g_machine_state+0x0000E), #0x0A
	br $.BB@LABEL@44_15
_NormalMode_nostop:
	.STACK _NormalMode_nostop = 6
	;***     1229 : 		(*tick) = g_systemTime;
	;***     1230 : 	}
	;***     1231 : }
	;***     1232 : /*!
	;***     1233 :  * Tested!
	;***     1234 :  */
	;***     1235 : void NormalMode_nostop(void) {
	;***     1236 : 	if ((g_machine_state.mode != BUSY)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1236
	mov a, !LOWW(_g_machine_state+0x0000E)
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
	;***     1237 : 			&& (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1238 : 			&& (g_machine_state.mode != CALLAN_MODE)
	;***     1239 : 			&& (g_machine_state.mode != DRAINAGE_MODE)) {
	;***     1240 : 		userAuthHandler_nostop();
	;***     1241 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***     1242 : 	} else if (g_machine_state.mode == BUSY) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1242
	cmp a, #0x07
	bnz $.BB@LABEL@45_6
.BB@LABEL@45_4:	; if_then_bb44
	;***     1243 : 		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1243
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
	;***     1244 : 				g_timerSetting.t55_waterDischargeDelay_s * 1000)) {
	;***     1245 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1245
	clrb !LOWW(_g_machine_state+0x0000E)
	;***     1246 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1246
	clrb !LOWW(_g_machine_state+0x0000D)
.BB@LABEL@45_6:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1249
	ret
.BB@LABEL@45_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1240
	call $!_userAuthHandler_nostop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1241
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00028), ax
	ret
_TestPowerOn_nostop_keepstate:
	.STACK _TestPowerOn_nostop_keepstate = 8
	;***     1247 : 		}
	;***     1248 : 	}
	;***     1249 : }
	;***     1250 : /*!
	;***     1251 :  * Power ON test mode, state 0 - 1, end at 2
	;***     1252 :  * @param state: Machine state
	;***     1253 :  * @param tick: Tick for no stop delay
	;***     1254 :  * @return 0 when done
	;***     1255 :  */
	;***     1256 : uint8_t TestPowerOn_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1256
	push ax
	movw hl, ax
	push bc
	pop de
	;***     1257 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1257
	mov a, [hl]
	cmp0 a
	bz $.BB@LABEL@46_5
.BB@LABEL@46_1:	; entry
	dec a
	bnz $.BB@LABEL@46_4
.BB@LABEL@46_2:	; switch_clause_bb69
	;***     1258 : 	case 0:
	;***     1259 : 		O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 = O_SPOUT_ACID_PIN_SV3 =
	;***     1260 : 		O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 = O_DRAIN_ALK_PIN_SV6 =
	;***     1261 : 		O_DRAIN_ALK_PIN_SV6 = OPTION_1_PIN_SV8 = OPTION_2_PIN_SV9 = ON;
	;***     1262 : 		O_PUMP_SALT_PIN_SP1 = ON;
	;***     1263 : 		(*tick) = g_systemTime;
	;***     1264 : 		break;
	;***     1265 : 	case 1:
	;***     1266 : 		if (ns_delay_ms(tick, 30 * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1266
	movw ax, de
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@46_4
.BB@LABEL@46_3:	; if_then_bb
	movw de, #0xFF06
	;***     1267 : 			O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1267
	clr1 0xFFF0B.1
	mov a, 0xFFF0B
	mov1 CY, a.1
	mov a, 0xFFF0B
	mov1 a.0, CY
	mov 0xFFF0B, a
	mov a, 0xFFF0B
	mov1 CY, a.0
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	mov a, [de]
	mov1 CY, a.6
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	mov a, [de]
	mov1 CY, a.6
	mov a, [de]
	mov1 a.7, CY
	mov [de], a
	mov a, [de]
	mov1 CY, a.7
	movw hl, #0xFF06
	mov a, 0xFFF07
	mov1 a.7, CY
	mov 0xFFF07, a
	mov a, 0xFFF07
	mov1 CY, a.7
	mov a, 0xFFF07
	mov1 a.6, CY
	mov 0xFFF07, a
	mov a, 0xFFF07
	mov1 CY, a.6
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	mov a, 0xFFF05
	mov1 CY, a.5
	mov a, 0xFFF01
	mov1 a.7, CY
	mov 0xFFF01, a
	;***     1268 : 					O_SPOUT_ACID_PIN_SV3 =
	;***     1269 : 					O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 =
	;***     1270 : 							O_DRAIN_ALK_PIN_SV6 =
	;***     1271 : 							O_DRAIN_ALK_PIN_SV6 = OPTION_1_PIN_SV8 =
	;***     1272 : 									OPTION_2_PIN_SV9 = OFF;
	;***     1273 : 			O_PUMP_SALT_PIN_SP1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1273
	clr1 [hl].0
	pop hl
	push hl
	;***     1274 : 			(*state)++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1274
	inc [hl+0x00]
.BB@LABEL@46_4:	; if_then_bb
	br $.BB@LABEL@46_6
.BB@LABEL@46_5:	; switch_clause_bb
	movw hl, #0xFF06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1259
	set1 0xFFF0B.1
	mov a, 0xFFF0B
	mov1 CY, a.1
	mov a, 0xFFF0B
	mov1 a.0, CY
	mov 0xFFF0B, a
	mov a, 0xFFF0B
	mov1 CY, a.0
	mov a, [hl]
	mov1 a.6, CY
	mov [hl], a
	mov a, [hl]
	mov1 CY, a.6
	mov a, [hl]
	mov1 a.6, CY
	mov [hl], a
	mov a, [hl]
	mov1 CY, a.6
	mov a, [hl]
	mov1 a.7, CY
	mov [hl], a
	mov a, [hl]
	mov1 CY, a.7
	mov a, 0xFFF07
	mov1 a.7, CY
	mov 0xFFF07, a
	mov a, 0xFFF07
	mov1 CY, a.7
	mov a, 0xFFF07
	mov1 a.6, CY
	mov 0xFFF07, a
	mov a, 0xFFF07
	mov1 CY, a.6
	mov a, 0xFFF05
	mov1 a.5, CY
	mov 0xFFF05, a
	mov a, 0xFFF05
	mov1 CY, a.5
	mov a, 0xFFF01
	mov1 a.7, CY
	mov 0xFFF01, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1262
	set1 [hl].0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1263
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@46_6:	; switch_break_bb
	pop de
	push de
	;***     1275 : 		}
	;***     1276 : 		break;
	;***     1277 : 	default:
	;***     1278 : 		break;
	;***     1279 : 	}
	;***     1280 : 	return (*state) == 2? 1:0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1280
	mov a, [de]
	cmp a, #0x02
	oneb a
	skz
.BB@LABEL@46_7:	; switch_break_bb
	clrb a
.BB@LABEL@46_8:	; switch_break_bb
	pop hl
	ret
_FlowRateAdjustmentMode_nostop_keepstate:
	.STACK _FlowRateAdjustmentMode_nostop_keepstate = 8
	;***     1281 : }
	;***     1282 : uint8_t FlowRateAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1282
	push bc
	push ax
	;***     1283 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1283
	call $!_measureFlowSensor_nostop
	pop de
	push de
	;***     1284 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1284
	mov a, [de]
	add a, #0xFE
	bz $.BB@LABEL@47_6
.BB@LABEL@47_1:	; entry
	dec a
	bz $.BB@LABEL@47_7
.BB@LABEL@47_2:	; entry
	dec a
	bz $.BB@LABEL@47_9
.BB@LABEL@47_3:	; entry
	dec a
	bnz $.BB@LABEL@47_11
.BB@LABEL@47_4:	; switch_clause_bb30
	movw ax, [sp+0x02]
	;***     1285 : 		case 2:
	;***     1286 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***     1287 : 			(*state)++;
	;***     1288 : 			(*tick) = g_systemTime;
	;***     1289 : 			break;
	;***     1290 : 		case 3:
	;***     1291 : 			if(ns_delay_ms(tick, 30*1000)){
	;***     1292 : 				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***     1293 : 				(*state)++;
	;***     1294 : 			}
	;***     1295 : 			break;
	;***     1296 : 		case 4:
	;***     1297 : 			if(ns_delay_ms(tick, 500)){
	;***     1298 : 				(*state)++;
	;***     1299 : 				O_SPOUT_WATER_PIN_SV2 = OFF;
	;***     1300 : 			}
	;***     1301 : 			break;
	;***     1302 : 		case 5:
	;***     1303 : 			if(ns_delay_ms(tick, (uint32_t)15*1000 + (uint32_t)10*60*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1303
	movw de, #0x0009
	movw bc, #0x6258
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@47_11
.BB@LABEL@47_5:	; if_then_bb36
	pop hl
	push hl
	inc [hl+0x00]
	br $.BB@LABEL@47_11
.BB@LABEL@47_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1286
	set1 0xFFF05.5
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1287
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1288
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
	br $.BB@LABEL@47_11
.BB@LABEL@47_7:	; switch_clause_bb11
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1291
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@47_11
.BB@LABEL@47_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1292
	set1 0xFFF01.7
	br $.BB@LABEL@47_5
.BB@LABEL@47_9:	; switch_clause_bb19
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1297
	movw de, #0x0000
	movw bc, #0x01F4
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@47_11
.BB@LABEL@47_10:	; if_then_bb25
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1298
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1299
	clr1 0xFFF05.5
.BB@LABEL@47_11:	; switch_break_bb
	pop de
	push de
	;***     1304 : 				(*state)++;
	;***     1305 : 			}
	;***     1306 : 			break;
	;***     1307 : 		default:
	;***     1308 : 			break;
	;***     1309 : 	}
	;***     1310 : 	return (*state) == 6 ? 1:0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1310
	mov a, [de]
	cmp a, #0x06
	oneb a
	skz
.BB@LABEL@47_12:	; switch_break_bb
	clrb a
.BB@LABEL@47_13:	; switch_break_bb
	addw sp, #0x04
	ret
_CurrentAdjustmentMode_nostop_keepstate:
	.STACK _CurrentAdjustmentMode_nostop_keepstate = 8
	;***     1311 : }
	;***     1312 : uint8_t CurrentAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1312
	movw de, ax
	push bc
	push ax
	;***     1313 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1313
	mov a, [de]
	add a, #0xFA
	bz $.BB@LABEL@48_5
.BB@LABEL@48_1:	; entry
	dec a
	bz $.BB@LABEL@48_6
.BB@LABEL@48_2:	; entry
	dec a
	bnz $.BB@LABEL@48_8
.BB@LABEL@48_3:	; switch_clause_bb18
	movw ax, [sp+0x02]
	;***     1314 : 		case 6:
	;***     1315 : 			electrolyticOperationON();
	;***     1316 : 			(*state)++;
	;***     1317 : 			break;
	;***     1318 : 		case 7:
	;***     1319 : 			if(ElectrolyticOperation_nostop()){
	;***     1320 : 				(*state)++;
	;***     1321 : 				(*tick) = g_systemTime;
	;***     1322 : 			}
	;***     1323 : 			break;
	;***     1324 : 		case 8:
	;***     1325 : 			if(ns_delay_ms(tick, (uint32_t)15*1000 + (uint32_t)10*60*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1325
	movw de, #0x0009
	movw bc, #0x6258
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@48_8
.BB@LABEL@48_4:	; if_then_bb24
	pop hl
	push hl
	inc [hl+0x00]
	br $.BB@LABEL@48_8
.BB@LABEL@48_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1315
	call $!_electrolyticOperationON
	br $.BB@LABEL@48_4
.BB@LABEL@48_6:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1319
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bz $.BB@LABEL@48_8
.BB@LABEL@48_7:	; if_then_bb
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1320
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1321
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@48_8:	; switch_break_bb
	pop de
	push de
	;***     1326 : 				(*state)++;
	;***     1327 : 			}
	;***     1328 : 			break;
	;***     1329 : 		default:
	;***     1330 : 			break;
	;***     1331 : 	}
	;***     1332 : 	return (*state) == 9 ? 1:0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1332
	mov a, [de]
	cmp a, #0x09
	oneb a
	skz
.BB@LABEL@48_9:	; switch_break_bb
	clrb a
.BB@LABEL@48_10:	; switch_break_bb
	addw sp, #0x04
	ret
_ElectrolyteAdjustmentOperation:
	.STACK _ElectrolyteAdjustmentOperation = 8
	;***     1333 : }
	;***     1334 : uint8_t ElectrolyteAdjustmentOperation(uint8_t *state, uint32_t *tick){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1334
	movw de, ax
	push ax
	push bc
	;***     1335 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1335
	mov a, [de]
	add a, #0xF7
	bz $.BB@LABEL@49_4
.BB@LABEL@49_1:	; entry
	dec a
	bz $.BB@LABEL@49_5
.BB@LABEL@49_2:	; entry
	dec a
	bnz $.BB@LABEL@49_11
.BB@LABEL@49_3:	; switch_clause_bb42
	movw ax, [sp+0x00]
	;***     1336 : 		case 9:
	;***     1337 : 			electrolyticOperationON();
	;***     1338 : 			(*state)++;
	;***     1339 : 			break;
	;***     1340 : 		case 10:
	;***     1341 : 			if(isAcidTankFull() && isAlkalineTankFull()){
	;***     1342 : 				electrolyticOperationOFF();
	;***     1343 : 				(*tick) = g_systemTime;
	;***     1344 : 				(*state)++;
	;***     1345 : 			}
	;***     1346 : 			break;
	;***     1347 : 		case 11:
	;***     1348 : 			if(ns_delay_ms(tick, (uint32_t)10*60*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1348
	movw de, #0x0009
	movw bc, #0x27C0
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@49_10
	br $.BB@LABEL@49_11
.BB@LABEL@49_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1337
	call $!_electrolyticOperationON
	br $.BB@LABEL@49_10
.BB@LABEL@49_5:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1341
	call $!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@49_11
.BB@LABEL@49_6:	; bb
	call $!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@49_11
.BB@LABEL@49_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1342
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@49_8:	; if_then_bb.bb32_crit_edge
	oneb a
.BB@LABEL@49_9:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1343
	movw bc, !LOWW(_g_systemTime+0x00002)
	pop de
	push de
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@49_10:	; switch_break_bb.PartialDrain
	movw ax, [sp+0x02]
	movw hl, ax
	inc [hl+0x00]
.BB@LABEL@49_11:	; switch_break_bb
	movw ax, [sp+0x02]
	movw de, ax
	;***     1349 : 				(*state)++;
	;***     1350 : 			}
	;***     1351 : 			break;
	;***     1352 : 		default:
	;***     1353 : 			break;
	;***     1354 : 	}
	;***     1355 : 	return (*state);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1355
	mov a, [de]
	;***     1356 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1356
	addw sp, #0x04
	ret
_TestOperation_nostop:
	.STACK _TestOperation_nostop = 4
	;***     1357 : void TestOperation_nostop(void) {
	;***     1358 : 	uint8_t *state = &g_machine_state.test;
	;***     1359 : 	uint32_t *tick = &g_Tick.tickTestOperation;
	;***     1360 : 	switch (commnunication_flag.test_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1360
	mov a, !LOWW(_commnunication_flag+0x00009)
	add a, #0xE3
	bz $.BB@LABEL@50_5
.BB@LABEL@50_1:	; entry
	dec a
	bz $.BB@LABEL@50_6
.BB@LABEL@50_2:	; entry
	dec a
	bz $.BB@LABEL@50_7
.BB@LABEL@50_3:	; entry
	cmp a, #0x02
	bnz $.BB@LABEL@50_10
.BB@LABEL@50_4:	; switch_clause_bb33
	;***     1361 : 		case TEST_POWER_ON:
	;***     1362 : 			if(TestPowerOn_nostop_keepstate(state, &g_Tick.tickTestOperation)){
	;***     1363 : 				commnunication_flag.test_flag = 0;
	;***     1364 : 				*state = 0;
	;***     1365 : 			}
	;***     1366 : 			break;
	;***     1367 : 		case TEST_FLOW_RATE:
	;***     1368 : 			if(FlowRateAdjustmentMode_nostop_keepstate(state, tick)){
	;***     1369 : 				commnunication_flag.test_flag = 0;
	;***     1370 : 				*state = 0;
	;***     1371 : 			}
	;***     1372 : 			break;
	;***     1373 : 		case TEST_CURRENT:
	;***     1374 : 			if(CurrentAdjustmentMode_nostop_keepstate(state, tick)){
	;***     1375 : 				commnunication_flag.test_flag = 0;
	;***     1376 : 				*state = 0;
	;***     1377 : 			}
	;***     1378 : 			break;
	;***     1379 : 		case TEST_INDIVIDUAL:
	;***     1380 : 
	;***     1381 : 			break;
	;***     1382 : 		case TEST_ELECTROLYTIC:
	;***     1383 : 			if(ElectrolyteAdjustmentOperation(state, tick)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1383
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_ElectrolyteAdjustmentOperation
	br $.BB@LABEL@50_8
.BB@LABEL@50_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1362
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_TestPowerOn_nostop_keepstate
	br $.BB@LABEL@50_8
.BB@LABEL@50_6:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1368
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_FlowRateAdjustmentMode_nostop_keepstate
	br $.BB@LABEL@50_8
.BB@LABEL@50_7:	; switch_clause_bb21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1374
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_CurrentAdjustmentMode_nostop_keepstate
.BB@LABEL@50_8:	; switch_clause_bb21
	cmp0 a
	bz $.BB@LABEL@50_10
.BB@LABEL@50_9:	; if_then_bb41
	clrb !LOWW(_commnunication_flag+0x00009)
	clrb !LOWW(_g_machine_state+0x0000B)
.BB@LABEL@50_10:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1391
	ret
_NeutralizationTreatment:
	.STACK _NeutralizationTreatment = 10
	;***     1384 : 				commnunication_flag.test_flag = 0;
	;***     1385 : 				*state = 0;
	;***     1386 : 			}
	;***     1387 : 			break;
	;***     1388 : 		default:
	;***     1389 : 			break;
	;***     1390 : 	}
	;***     1391 : }
	;***     1392 : void NeutralizationTreatment(uint32_t *tick){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1392
	subw sp, #0x04
	movw hl, ax
	;***     1393 : 	if(g_neutralization_time_s >= g_timerSetting.t33_t63_neutralizationStartTime_h*60*60){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1393
	movw ax, !LOWW(_g_timerSetting+0x0008C)
	movw bc, #0x0E10
	mulhu
	movw [sp+0x00], ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0008E)
	movw bc, #0x0E10
	mulh
	addw ax, de
	cmpw ax, !LOWW(_g_neutralization_time_s+0x00002)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@51_1:	; entry
	cmpw ax, !LOWW(_g_neutralization_time_s)
.BB@LABEL@51_2:	; entry
	bh $.BB@LABEL@51_4
.BB@LABEL@51_3:	; if_then_bb
	;***     1394 : 		g_machine_state.neutrlization = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1394
	oneb !LOWW(_g_machine_state+0x0000C)
	;***     1395 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1395
	set1 0xFFF06.5
	clrw ax
	;***     1396 : 		g_neutralization_time_s = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1396
	movw !LOWW(_g_neutralization_time_s+0x00002), ax
	movw !LOWW(_g_neutralization_time_s), ax
.BB@LABEL@51_4:	; if_break_bb
	;***     1397 : 	}
	;***     1398 : 	if(ns_delay_ms(tick, g_timerSetting.t34_t64_neutralizationOpenTime_s*1000) && (g_machine_state.neutrlization != 0)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1398
	movw ax, !LOWW(_g_timerSetting+0x00090)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, bc
	movw [sp+0x02], ax
	movw ax, !LOWW(_g_timerSetting+0x00092)
	movw bc, #0x03E8
	mulh
	movw [sp+0x00], ax
	push de
	pop bc
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, [sp+0x00]
	addw ax, de
	movw de, ax
	movw ax, hl
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@51_7
.BB@LABEL@51_5:	; bb
	cmp0 !LOWW(_g_machine_state+0x0000C)
	bz $.BB@LABEL@51_7
.BB@LABEL@51_6:	; if_then_bb24
	;***     1399 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1399
	set1 0xFFF06.5
	;***     1400 : 		g_machine_state.neutrlization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1400
	clrb !LOWW(_g_machine_state+0x0000C)
.BB@LABEL@51_7:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1403
	ret
_main_loop_20211111:
	.STACK _main_loop_20211111 = 4
	;***     1401 : 	}
	;***     1402 : 
	;***     1403 : }
	;***     1404 : void main_loop_20211111(void) {
	;***     1405 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1405
	call $!_measureFlowSensor_nostop
	;***     1406 : 	DrainageMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1406
	call $!_DrainageMode_nostop
	;***     1407 : 	ElectrolyzeWaterGeneration_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1407
	call $!_ElectrolyzeWaterGeneration_nostop
	;***     1408 : 	CallanCleaningMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1408
	call $!_CallanCleaningMode_nostop
	;***     1409 : 	NormalMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1409
	br $!_NormalMode_nostop
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***     1410 : }
	;***     1411 : 
	;***     1412 : /**
	;***     1413 :  * 30/11/2021: Checked by An
	;***     1414 :  */
	;***     1415 : void electrolyticOperationON(void) {
	;***     1416 : 	//Electrolytic operation ON
	;***     1417 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1417
	set1 0xFFF01.7
	;***     1418 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1418
	set1 0xFFF0E.2
	;***     1419 : 	O_PUMP_SALT_PIN_SP1 = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1419
	set1 0xFFF06.0
	;***     1420 : 	g_machine_state.electrolyteOperation = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1420
	oneb !LOWW(_g_machine_state+0x00007)
	;***     1421 : 	g_TimeKeeper.electrolyteOff_h = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1421
	clrb !LOWW(_g_TimeKeeper@1)
	;***     1422 : 	g_TimeKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1422
	movw bc, !LOWW(_g_TimeKeeper@1+0x00004)
	movw ax, !LOWW(_g_TimeKeeper@1+0x00002)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@53_3
.BB@LABEL@53_1:	; entry
	bc $.BB@LABEL@53_3
.BB@LABEL@53_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@53_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TimeKeeper@1+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_TimeKeeper@1+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1425
	ret
_isElectrolyticOperationOFF_nostop:
	.STACK _isElectrolyticOperationOFF_nostop = 6
	;***     1423 : 			g_TimeKeeper.neutralization == 0 ?
	;***     1424 : 					g_systemTime : g_TimeKeeper.neutralization;
	;***     1425 : }
	;***     1426 : void isElectrolyticOperationOFF_nostop(void) {
	;***     1427 : 	uint8_t *state = &g_machine_state.electrolyteOFF;
	;***     1428 : 	uint32_t *tick = &g_Tick.tickElectrolyticOff;
	;***     1429 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1429
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	bz $.BB@LABEL@54_6
.BB@LABEL@54_1:	; entry
	dec a
	.bz $!.BB@LABEL@54_15
.BB@LABEL@54_2:	; entry
	dec a
	bnz $.BB@LABEL@54_5
.BB@LABEL@54_3:	; switch_clause_bb43
	;***     1430 : 	case 0:
	;***     1431 : 		// Set g_machine_state.electrolyteOFF = 1 to start OFF
	;***     1432 : 		// This case run when electrolyte is ON or already OFF
	;***     1433 : 		if (ns_delay_ms(tick, (uint32_t) 60000 * 60)
	;***     1434 : 				&& g_machine_state.electrolyteOperation == 0) {
	;***     1435 : 			sendToRasPi_u32(H_READ, MID_NIGHT, 0x00);
	;***     1436 : 			g_TimeKeeper.electrolyteOff_h++;
	;***     1437 : 		} else if (g_machine_state.electrolyteOperation == 1) {
	;***     1438 : 			if(ns_delay_ms(&g_TimeKeeper.neutralization, 1000)){
	;***     1439 : 				g_neutralization_time_s++;
	;***     1440 : 			}
	;***     1441 : 			(*tick) = g_systemTime;
	;***     1442 : 		}
	;***     1443 : 		break;
	;***     1444 : 	case 1:
	;***     1445 : 		g_TimeKeeper.neutralization = 0;
	;***     1446 : 		O_CVCC_ON_PIN = OFF;
	;***     1447 : 		O_PUMP_SALT_PIN_SP1 = OFF; //SP1
	;***     1448 : 		(*state)++;
	;***     1449 : 		break;
	;***     1450 : 	case 2:
	;***     1451 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1451
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
	bz $.BB@LABEL@54_5
.BB@LABEL@54_4:	; if_then_bb51
	;***     1452 : 				g_timerSetting.t5_electrolysisStopDelay_s * 1000)) {
	;***     1453 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1453
	clrb !LOWW(_g_machine_state+0x00008)
	;***     1454 : 			O_SUPPLY_WATER_PIN_SV1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1454
	clr1 0xFFF01.7
	;***     1455 : 			g_machine_state.electrolyteOperation = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1455
	clrb !LOWW(_g_machine_state+0x00007)
.BB@LABEL@54_5:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1462
	ret
.BB@LABEL@54_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1433
	movw de, #0x0036
	movw bc, #0xEE80
	movw ax, #LOWW(_g_Tick+0x00044)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@54_9
.BB@LABEL@54_7:	; bb
	cmp0 !LOWW(_g_machine_state+0x00007)
	bnz $.BB@LABEL@54_9
.BB@LABEL@54_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1435
	clrw ax
	movw de, ax
	movw ax, #0x521C
	call $!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1436
	inc !LOWW(_g_TimeKeeper@1)
	ret
.BB@LABEL@54_9:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1437
	cmp !LOWW(_g_machine_state+0x00007), #0x01
	bnz $.BB@LABEL@54_5
.BB@LABEL@54_10:	; if_then_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1438
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_TimeKeeper@1+0x00002)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@54_14
.BB@LABEL@54_11:	; if_then_bb31
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1439
	addw ax, !LOWW(_g_neutralization_time_s)
	movw !LOWW(_g_neutralization_time_s), ax
	clrw ax
	sknc
.BB@LABEL@54_12:	; if_then_bb31
	incw ax
.BB@LABEL@54_13:	; if_then_bb31
	addw ax, !LOWW(_g_neutralization_time_s+0x00002)
	movw !LOWW(_g_neutralization_time_s+0x00002), ax
.BB@LABEL@54_14:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1441
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	ret
.BB@LABEL@54_15:	; switch_clause_bb39
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1445
	movw !LOWW(_g_TimeKeeper@1+0x00004), ax
	movw !LOWW(_g_TimeKeeper@1+0x00002), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1446
	clr1 0xFFF0E.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1447
	clr1 0xFFF06.0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1448
	inc !LOWW(_g_machine_state+0x00008)
	ret
_realTimeResponse:
	.STACK _realTimeResponse = 4
	;***     1456 : 		}
	;***     1457 : 		break;
	;***     1458 : 	default:
	;***     1459 : 		break;
	;***     1460 : 	}
	;***     1461 : 
	;***     1462 : }
	;***     1463 : void realTimeResponse(void) {
	;***     1464 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1464
	call $!_UpdateMachineStatus
	;***     1465 : 	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1465
	call $!_RaspberryResponse_nostop
	;***     1466 : 	isElectrolyticOperationOFF_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1466
	call $!_isElectrolyticOperationOFF_nostop
	;***     1467 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1467
	call !!_R_WDT_Restart
	;***     1468 : 	if (ns_delay_ms(&g_Tick.tickCustom[0], 200)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1468
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick+0x00088)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	sknz
.BB@LABEL@55_1:	; return
	;***     1469 : 		P6_bit.no3 = ~P6_bit.no3;
	;***     1470 : 
	;***     1471 : 	}
	;***     1472 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1472
	ret
.BB@LABEL@55_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1469
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***     1473 : float measureFlowSensor(uint32_t *s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1473
	push ax
	subw sp, #0x0C
	;***     1474 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1474
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
.BB@LABEL@56_1:	; bb27
	movw ax, [sp+0x0C]
	movw de, ax
	;***     1475 : 	float flow_pluse = 0.0;
	;***     1476 : 	uint8_t flow_pulse_state = I_OFF;
	;***     1477 : 	while (!ns_delay_ms(&stamp_flow_sensor, (*s) * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1477
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
	bnz $.BB@LABEL@56_7
.BB@LABEL@56_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***     1478 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1478
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@56_6
.BB@LABEL@56_3:	; if_then_bb
	;***     1479 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1479
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@56_5
.BB@LABEL@56_4:	; if_then_bb20
	movw ax, #0x3F80
	;***     1480 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1480
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
.BB@LABEL@56_5:	; if_break_bb
	;***     1481 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1481
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@56_6:	; if_break_bb26
	;***     1482 : 		}
	;***     1483 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1483
	call !!_R_WDT_Restart
	br $.BB@LABEL@56_1
.BB@LABEL@56_7:	; bb40
	movw ax, #0x3F33
	;***     1484 : 	}
	;***     1485 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1485
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
	;***     1486 : 	return g_io_status.refined.FlowValue;
	;***     1487 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1487
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***     1488 : 
	;***     1489 : uint8_t _pre_flow_state = I_OFF;
	;***     1490 : float _flow_pulse;
	;***     1491 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1491
	subw sp, #0x04
	;***     1492 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***     1493 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***     1494 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1494
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@57_4
.BB@LABEL@57_1:	; entry
	dec a
	bz $.BB@LABEL@57_5
.BB@LABEL@57_2:	; entry
	dec a
	bz $.BB@LABEL@57_12
.BB@LABEL@57_3:	; switch_clause_bb61
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@57_11
.BB@LABEL@57_4:	; switch_clause_bb
	;***     1495 : 	case 0:
	;***     1496 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1496
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@57_9
.BB@LABEL@57_5:	; switch_clause_bb14
	;***     1497 : 			(*state)++;
	;***     1498 : 		}
	;***     1499 : 		break;
	;***     1500 : 	case 1:
	;***     1501 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1501
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@57_8
.BB@LABEL@57_6:	; if_then_bb24
	;***     1502 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1502
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***     1503 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1503
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@57_8
.BB@LABEL@57_7:	; if_then_bb35
	movw ax, #0x3F80
	;***     1504 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1504
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
.BB@LABEL@57_8:	; if_break_bb39
	;***     1505 : 			}
	;***     1506 : 		}
	;***     1507 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1507
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0000A)
.BB@LABEL@57_9:	; if_break_bb39
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
.BB@LABEL@57_10:	; if_then_bb47
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@57_11:	; switch_break_bb
	;***     1508 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***     1509 : 			(*state)++;
	;***     1510 : 		}
	;***     1511 : 		break;
	;***     1512 : 	case 2:
	;***     1513 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***     1514 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***     1515 : 		_flow_pulse = 0;
	;***     1516 : 		(*state) = 0;
	;***     1517 : 		break;
	;***     1518 : 	default:
	;***     1519 : 		(*state) = 0;
	;***     1520 : 		break;
	;***     1521 : 	}
	;***     1522 : 	return g_io_status.refined.FlowValue;
	;***     1523 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1523
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@57_12:	; switch_clause_bb52
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1513
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1515
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@57_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***     1524 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1524
	push hl
	;***     1525 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1526 : 		pre_machine_washing_mode = g_machine_state.mode;
	;***     1527 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1527
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@58_2
.BB@LABEL@58_1:	; bb11
	clrb x
.BB@LABEL@58_2:	; bb12
	;***     1528 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1528
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@58_4
.BB@LABEL@58_3:	; bb28
	clrb c
.BB@LABEL@58_4:	; bb30
	;***     1529 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1529
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@58_6
.BB@LABEL@58_5:	; bb46
	clrb b
.BB@LABEL@58_6:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***     1530 : 	g_mean_io_status.refined.AcidLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1530
	mov a, 0xFFF07
	mov1 CY, a.2
	clrb a
	bc $.BB@LABEL@58_8
.BB@LABEL@58_7:	; bb63
	mov a, #0x10
	and a, !LOWW(_g_mean_io_status)
.BB@LABEL@58_8:	; bb70
	mov x, a
	mov a, #0xEF
	and a, !LOWW(_g_mean_io_status)
	or a, x
	mov c, a
	;***     1531 : 	I_ACID_M_PIN == I_ON ? g_mean_io_status.refined.AcidLowLevel : 0;
	;***     1532 : 	g_mean_io_status.refined.AcidHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1532
	mov a, 0xFFF07
	clrb x
	bt a.3, $.BB@LABEL@58_10
.BB@LABEL@58_9:	; bb86
	mov a, c
	and a, #0x20
	mov x, a
.BB@LABEL@58_10:	; bb93
	mov a, c
	clr1 a.5
	or a, x
	mov d, a
	;***     1533 : 	I_ACID_H_PIN == I_ON ? g_mean_io_status.refined.AcidHighLevel : 0;
	;***     1534 : 
	;***     1535 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1535
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@58_12
.BB@LABEL@58_11:	; bb109
	clrb x
.BB@LABEL@58_12:	; bb111
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***     1536 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1536
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@58_14
.BB@LABEL@58_13:	; bb126
	clrb b
.BB@LABEL@58_14:	; bb128
	mov a, c
	or a, x
	mov e, a
	;***     1537 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1537
	mov a, 0xFFF07
	mov c, #0x04
	bf a.0, $.BB@LABEL@58_16
.BB@LABEL@58_15:	; bb144
	clrb c
.BB@LABEL@58_16:	; bb146
	mov a, e
	or a, b
	mov e, a
	;***     1538 : 	g_mean_io_status.refined.AlkalineLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1538
	mov a, 0xFFF00
	clrb x
	bt a.6, $.BB@LABEL@58_18
.BB@LABEL@58_17:	; bb161
	mov a, d
	and a, #0x02
	mov x, a
.BB@LABEL@58_18:	; bb168
	mov a, d
	clr1 a.1
	or a, x
	mov b, a
	;***     1539 : 	I_ALKALI_M_PIN == I_ON ? g_mean_io_status.refined.AlkalineLowLevel : 0;
	;***     1540 : 	g_mean_io_status.refined.AlkalineHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1540
	mov a, 0xFFF07
	clrb x
	bt a.0, $.BB@LABEL@58_20
.BB@LABEL@58_19:	; bb183
	mov a, b
	and a, #0x04
	mov x, a
.BB@LABEL@58_20:	; bb190
	mov a, b
	clr1 a.2
	or a, x
	mov !LOWW(_g_mean_io_status), a
	;***     1541 : 	I_ALKALI_H_PIN == I_ON ? g_mean_io_status.refined.AlkalineHighLevel : 0;
	;***     1542 : 
	;***     1543 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1543
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@58_22
.BB@LABEL@58_21:	; bb206
	clrb b
.BB@LABEL@58_22:	; bb208
	mov a, e
	or a, c
	mov c, a
	;***     1544 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1544
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@58_24
.BB@LABEL@58_23:	; bb224
	clrb x
.BB@LABEL@58_24:	; bb226
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***     1545 : 
	;***     1546 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1546
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***     1547 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1547
	mov x, 0xFFF05
	;***     1548 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1548
	mov c, 0xFFF07
	;***     1549 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1549
	mov a, 0xFFF07
	mov h, a
	;***     1550 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1550
	mov a, [de]
	mov l, a
	;***     1551 : 	O_DRAIN_ACID_PIN_SV5;
	;***     1552 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1552
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1546
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1547
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1548
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1549
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1550
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***     1553 : 	O_DRAIN_ALK_PIN_SV6;
	;***     1554 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN_SV7;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1554
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1550
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1554
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1552
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1554
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***     1555 : 
	;***     1556 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1556
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***     1557 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1557
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***     1558 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN_SP1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1558
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***     1559 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TimeKeeper@1:
	.DS (6)
	.ALIGN 2
_g_numberSetting:
	.DS (38)
	.ALIGN 2
_g_neutralization_time_s:
	.DS (4)
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
	.DS (15)
	.ALIGN 2
_g_io_status:
	.DS (18)
	.ALIGN 2
_g_mean_io_status:
	.DS (18)
	.ALIGN 2
_g_res_io_status:
	.DS (18)
	.ALIGN 2
__settingTime:
	.DS (150)
	.ALIGN 2
__settingNumber:
	.DS (38)
_g_machine_mode:
	.DS (1)
_g_machine_test_mode:
	.DS (1)
	.ALIGN 2
_btod:
	.DS (4)
	.ALIGN 2
_g_Tick:
	.DS (168)
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
