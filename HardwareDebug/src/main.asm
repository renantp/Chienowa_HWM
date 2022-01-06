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
#@  compiled at Thu Jan 06 15:58:26 2022

	.EXTERN _rx_count
	.EXTERN _commnunication_flag
	.EXTERN _g_systemTime
	.EXTERN _g_uart3_sendend
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
	.PUBLIC _sendRS485
	.EXTERN _R_UART3_Send
	.PUBLIC _sendR485_7byte
	.PUBLIC _isThisCommand
	.PUBLIC _DrainageAcidAndAlkalineTankStart_nostop
	.PUBLIC _WaterSupplyStart_nostop
	.EXTERN _sendToRasPi_f
	.PUBLIC _Voltage1Check_waitReset
	.EXTERN _resetAlarm
	.EXTERN _stop_waitAlarmConfirm
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
	.EXTERN _RaspberryResponse_nostop
	.EXTERN _R_WDT_Restart
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
	.EXTERN _sendToRasPi_u32

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
	;***        8 : #include "main.h"
	;***        9 : 
	;***       10 : #include <iodefine.h>
	;***       11 : 
	;***       12 : #define VCC (24.0)
	;***       13 : 
	;***       14 : struct Timer_Setting_s g_timerSetting = { 1000, 15 };
	;***       15 : struct Number_Setting_s g_numberSetting;
	;***       16 : uint32_t g_neutralization_time_s;
	;***       17 : enum HS_COLOR g_color, g_pre_color;
	;***       18 : float g_flow_value;
	;***       19 : union Alarm_Flag_u g_alarm;
	;***       20 : struct Machine_State_u g_machine_state;
	;***       21 : union IO_Status_u g_io_status, g_mean_io_status, g_res_io_status;
	;***       22 : 
	;***       23 : struct Timer_Setting_s _settingTime;
	;***       24 : struct Number_Setting_s _settingNumber;
	;***       25 : 
	;***       26 : uint8_t g_machine_mode, g_machine_test_mode;
	;***       27 : union BytesToDouble {
	;***       28 : 	struct {
	;***       29 : 		uint8_t data[4];
	;***       30 : 	} refined;
	;***       31 : 	uint32_t raw;
	;***       32 : } btod;
	;***       33 : struct Tick_s g_Tick;
	;***       34 : 
	;***       35 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 35
	mov !LOWW(_g_color), a
	;***       36 : 	g_color = color;
	;***       37 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 37
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       38 : 		switch (color) {
	;***       39 : 		case RED:
	;***       40 : 			O_HS_ICL_PIN = 1;
	;***       41 : 			O_HS_IDA_PIN = 0;
	;***       42 : 			break;
	;***       43 : 		case BLUE:
	;***       44 : 			O_HS_ICL_PIN = 0;
	;***       45 : 			O_HS_IDA_PIN = 0;
	;***       46 : 			break;
	;***       47 : 		case WHITE:
	;***       48 : 			O_HS_ICL_PIN = 0;
	;***       49 : 			O_HS_IDA_PIN = 1;
	;***       50 : 			break;
	;***       51 : 		default:
	;***       52 : 			O_HS_ICL_PIN = 1;
	;***       53 : 			O_HS_IDA_PIN = 1;
	;***       54 : 			break;
	;***       55 : 		}
	;***       56 : 		g_pre_color = g_color;
	;***       57 : 	}
	;***       58 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 58
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 38
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 52
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 40
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 41
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 44
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 45
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 48
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 56
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_handSensorLEDBlink:
	.STACK _handSensorLEDBlink = 6
	;***       59 : void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 59
	push hl
	mov [sp+0x00], a
	;***       60 : 	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 60
	movw ax, #LOWW(_g_Tick+0x0000C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; return
	;***       61 : 		g_color = g_color == color ? BLACK : color;
	;***       62 : 		handSensorLED(g_color);
	;***       63 : 	}
	;***       64 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 64
	pop hl
	ret
.BB@LABEL@2_2:	; if_then_bb
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 61
	cmp a, !LOWW(_g_color)
	sknz
.BB@LABEL@2_3:	; if_then_bb.bb15_crit_edge
	clrb a
.BB@LABEL@2_4:	; bb15
	mov !LOWW(_g_color), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 62
	pop hl
	br $_handSensorLED
_setting_default:
	.STACK _setting_default = 4
	;***       65 : void setting_default(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	movw ax, #0x4086
	;***       66 : 	g_numberSetting.upperVoltage1 = 4.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x6666
	movw !LOWW(_g_numberSetting), ax
	movw ax, #0x4060
	;***       67 : 	g_numberSetting.upperVoltage2 = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	movw !LOWW(_g_numberSetting+0x00006), ax
	;***       68 : 	g_numberSetting.upperVoltage3 = 2.2;
	;***       69 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       70 : 	g_numberSetting.upperCurrent = 4.3;
	;***       71 : 	g_numberSetting.lowerCurrent = 0.2;
	;***       72 : 	g_numberSetting.upperFlow = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***       73 : 	g_numberSetting.lowerFlow = 0.4;
	;***       74 : 
	;***       75 : 	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       76 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       77 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       78 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       79 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***       80 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***       81 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***       82 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***       83 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***       84 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x0006A), ax
	;***       85 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x0006E), ax
	;***       86 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x00072), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_numberSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F00
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw ax, #0x4089
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_numberSetting+0x00016), ax
	mov x, #0xCC
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x00008), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_timerSetting+0x00028), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x00038), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x00030), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x00034), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00040), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00068), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x0006C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x00070), ax
	ret
_isAcidTankFull:
	.STACK _isAcidTankFull = 6
	;***       87 : }
	;***       88 : 
	;***       89 : /********************** Check Input *******************/
	;***       90 : //TODO: Check Input
	;***       91 : uint8_t isAcidTankFull(void) {
	;***       92 : 	if (I_ACID_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@4_5
.BB@LABEL@4_1:	; if_then_bb
	;***       93 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 93
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 104
	ret
.BB@LABEL@4_4:	; if_then_bb25
	;***       94 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***       95 : 				|| (g_mean_io_status.refined.AcidHighLevel == 1)) {
	;***       96 : 			g_mean_io_status.refined.AcidHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 96
	set1 !LOWW(_g_mean_io_status).5
	;***       97 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 97
	oneb a
	ret
.BB@LABEL@4_5:	; if_else_bb
	;***       98 : 		}
	;***       99 : 	} else {
	;***      100 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 100
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00062), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00060), ax
	;***      101 : 		g_mean_io_status.refined.AcidHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 101
	clr1 !LOWW(_g_mean_io_status).5
	br $.BB@LABEL@4_3
_isAcidTankAlmostFull:
	.STACK _isAcidTankAlmostFull = 6
	;***      102 : 	}
	;***      103 : 	return 0;
	;***      104 : }
	;***      105 : uint8_t isAcidTankAlmostFull(void) {
	;***      106 : 	if (I_ACID_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 106
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@5_5
.BB@LABEL@5_1:	; if_then_bb
	;***      107 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 107
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 118
	ret
.BB@LABEL@5_4:	; if_then_bb25
	;***      108 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      109 : 				|| (g_mean_io_status.refined.AcidLowLevel == 1)) {
	;***      110 : 			g_mean_io_status.refined.AcidLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 110
	set1 !LOWW(_g_mean_io_status).4
	;***      111 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 111
	oneb a
	ret
.BB@LABEL@5_5:	; if_else_bb
	;***      112 : 		}
	;***      113 : 	} else {
	;***      114 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 114
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00066), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00064), ax
	;***      115 : 		g_mean_io_status.refined.AcidLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 115
	clr1 !LOWW(_g_mean_io_status).4
	br $.BB@LABEL@5_3
_isAcidTankHasSomething:
	.STACK _isAcidTankHasSomething = 6
	;***      116 : 	}
	;***      117 : 	return 0;
	;***      118 : }
	;***      119 : uint8_t isAcidTankHasSomething(void) {
	;***      120 : 	if (I_ACID_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 120
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@6_5
.BB@LABEL@6_1:	; if_then_bb
	;***      121 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 121
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 132
	ret
.BB@LABEL@6_4:	; if_then_bb25
	;***      122 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      123 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 1)) {
	;***      124 : 			g_mean_io_status.refined.AcidEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 124
	set1 !LOWW(_g_mean_io_status).3
	;***      125 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 125
	oneb a
	ret
.BB@LABEL@6_5:	; if_else_bb
	;***      126 : 		}
	;***      127 : 	} else {
	;***      128 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00068), ax
	;***      129 : 		isAcidTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	call $!_isAcidTankEmpty
	br $.BB@LABEL@6_3
_isAcidTankEmpty:
	.STACK _isAcidTankEmpty = 6
	;***      130 : 	}
	;***      131 : 	return 0;
	;***      132 : }
	;***      133 : uint8_t isAcidTankEmpty(void) {
	;***      134 : 	if (I_ACID_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@7_2
.BB@LABEL@7_1:	; if_else_bb
	;***      135 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
	;***      136 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      137 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 0)) {
	;***      138 : 			g_mean_io_status.refined.AcidEmptyLevel = 0;
	;***      139 : 			return 1;
	;***      140 : 		}
	;***      141 : 	} else {
	;***      142 : 		g_Tick.tickAcidLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 142
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0006C), ax
	;***      143 : 		isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	call $!_isAcidTankHasSomething
	br $.BB@LABEL@7_4
.BB@LABEL@7_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 146
	ret
.BB@LABEL@7_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	clr1 !LOWW(_g_mean_io_status).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 139
	oneb a
	ret
_isAlkalineTankFull:
	.STACK _isAlkalineTankFull = 6
	;***      144 : 	}
	;***      145 : 	return 0;
	;***      146 : }
	;***      147 : uint8_t isAlkalineTankFull(void) {
	;***      148 : 	if (I_ALKALI_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@8_5
.BB@LABEL@8_1:	; if_then_bb
	;***      149 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	ret
.BB@LABEL@8_4:	; if_then_bb25
	;***      150 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***      151 : 				|| (g_mean_io_status.refined.AlkalineHighLevel == 1)) {
	;***      152 : 			g_mean_io_status.refined.AlkalineHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	set1 !LOWW(_g_mean_io_status).2
	;***      153 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	oneb a
	ret
.BB@LABEL@8_5:	; if_else_bb
	;***      154 : 		}
	;***      155 : 	} else {
	;***      156 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 156
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00072), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00070), ax
	;***      157 : 		g_mean_io_status.refined.AlkalineHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	clr1 !LOWW(_g_mean_io_status).2
	br $.BB@LABEL@8_3
_isAlkalineTankAlmostFull:
	.STACK _isAlkalineTankAlmostFull = 6
	;***      158 : 	}
	;***      159 : 	return 0;
	;***      160 : }
	;***      161 : uint8_t isAlkalineTankAlmostFull(void) {
	;***      162 : 	if (I_ALKALI_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@9_5
.BB@LABEL@9_1:	; if_then_bb
	;***      163 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 163
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	ret
.BB@LABEL@9_4:	; if_then_bb25
	;***      164 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      165 : 				|| (g_mean_io_status.refined.AlkalineLowLevel == 1)) {
	;***      166 : 			g_mean_io_status.refined.AlkalineLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	set1 !LOWW(_g_mean_io_status).1
	;***      167 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 167
	oneb a
	ret
.BB@LABEL@9_5:	; if_else_bb
	;***      168 : 		}
	;***      169 : 	} else {
	;***      170 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00076), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00074), ax
	;***      171 : 		g_mean_io_status.refined.AlkalineLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	clr1 !LOWW(_g_mean_io_status).1
	br $.BB@LABEL@9_3
_isAlkalineTankHasSomething:
	.STACK _isAlkalineTankHasSomething = 6
	;***      172 : 	}
	;***      173 : 	return 0;
	;***      174 : }
	;***      175 : uint8_t isAlkalineTankHasSomething(void) {
	;***      176 : 	if (I_ALKALI_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@10_5
.BB@LABEL@10_1:	; if_then_bb
	;***      177 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	ret
.BB@LABEL@10_4:	; if_then_bb25
	;***      178 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      179 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 1)) {
	;***      180 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	set1 !LOWW(_g_mean_io_status).0
	;***      181 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	oneb a
	ret
.BB@LABEL@10_5:	; if_else_bb
	;***      182 : 		}
	;***      183 : 	} else {
	;***      184 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00078), ax
	;***      185 : 		isAlkalineTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	call $!_isAlkalineTankEmpty
	br $.BB@LABEL@10_3
_isAlkalineTankEmpty:
	.STACK _isAlkalineTankEmpty = 6
	;***      186 : 	}
	;***      187 : 	return 0;
	;***      188 : }
	;***      189 : uint8_t isAlkalineTankEmpty(void) {
	;***      190 : 	if (I_ALKALI_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 190
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_else_bb
	;***      191 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
	;***      192 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      193 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 0)) {
	;***      194 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 0;
	;***      195 : 			return 1;
	;***      196 : 		}
	;***      197 : 	} else {
	;***      198 : 		g_Tick.tickAlkalineLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0007C), ax
	;***      199 : 		isAlkalineTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	call $!_isAlkalineTankHasSomething
	br $.BB@LABEL@11_4
.BB@LABEL@11_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	ret
.BB@LABEL@11_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	clr1 !LOWW(_g_mean_io_status).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	oneb a
	ret
_sendRS485:
	.STACK _sendRS485 = 6
	;***      200 : 	}
	;***      201 : 	return 0;
	;***      202 : }
	;***      203 : 
	;***      204 : struct UART3_Buffer_s {
	;***      205 : 	uint8_t busy;
	;***      206 : 	uint8_t head; // 1 byte
	;***      207 : 	uint8_t set_number; // 1 byte
	;***      208 : 	uint8_t set_value[4]; // 4 byte
	;***      209 : } water_solfner_buf;
	;***      210 : void sendRS485(uint8_t busy, uint8_t head, uint8_t type, uint32_t value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	push hl
	;***      211 : 	uint8_t state = g_uart3_sendend;
	;***      212 : 	btod.raw = value;
	;***      213 : 	water_solfner_buf.busy = busy;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
	mov !LOWW(_water_solfner_buf), a
	mov a, x
	;***      214 : 	water_solfner_buf.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	mov !LOWW(_water_solfner_buf+0x00001), a
	mov a, c
	;***      215 : 	water_solfner_buf.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	mov !LOWW(_water_solfner_buf+0x00002), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 211
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	movw ax, [sp+0x08]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	movw !LOWW(_btod+0x00002), ax
	movw ax, [sp+0x06]
	movw !LOWW(_btod), ax
	clrb a
.BB@LABEL@12_1:	; bb
	mov b, a
	;***      216 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      217 : 		water_solfner_buf.set_value[i] = btod.refined.data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 217
	mov a, LOWW(_btod)[b]
	mov LOWW(_water_solfner_buf+0x00003)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_2:	; bb25
	;***      218 : 	}
	;***      219 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	set1 0xFFF00.0
	;***      220 : 	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 220
	movw bc, #0x0007
	movw ax, #LOWW(_water_solfner_buf)
	call !!_R_UART3_Send
.BB@LABEL@12_3:	; bb28
	mov a, [sp+0x00]
	;***      221 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@12_3
.BB@LABEL@12_4:	; return
	;***      222 : 		;
	;***      223 : 
	;***      224 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 224
	pop hl
	ret
_sendR485_7byte:
	.STACK _sendR485_7byte = 16
	;***      225 : void sendR485_7byte(uint8_t addr, uint8_t head, uint8_t *val5) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	subw sp, #0x0A
	mov h, a
	push bc
	pop de
	;***      226 : 	uint8_t buf[7] = { addr, head };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 226
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
	;***      227 : 	uint8_t state = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x07], a
.BB@LABEL@13_1:	; bb
	movw ax, sp
	movw [sp+0x08], ax
	mov a, b
	add a, #0x02
	mov c, a
	;***      228 : 	for (uint8_t i = 2; i < 7; i++) {
	;***      229 : 		buf[i] = val5[i - 2];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	shrw ax, 8+0x00000
	addw ax, de
	decw ax
	decw ax
	movw hl, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	inc b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	mov a, [hl]
	mov h, a
	movw ax, [sp+0x08]
	xchw ax, hl
	mov [hl+c], a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	cmp a, #0x05
	bnz $.BB@LABEL@13_1
.BB@LABEL@13_2:	; bb31
	;***      230 : 	}
	;***      231 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	set1 0xFFF00.0
	;***      232 : 	R_UART3_Send(buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 232
	movw bc, #0x0007
	movw ax, sp
	call !!_R_UART3_Send
.BB@LABEL@13_3:	; bb35
	mov a, [sp+0x07]
	;***      233 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 233
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@13_3
.BB@LABEL@13_4:	; return
	;***      234 : 		;
	;***      235 : 
	;***      236 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
	addw sp, #0x0A
	ret
_isThisCommand:
	.STACK _isThisCommand = 6
	;***      237 : uint8_t isThisCommand(uint8_t *input_buf, enum UART_header_e header,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	push hl
	movw hl, ax
	mov a, b
	mov [sp+0x00], a
	clrb a
	mov b, a
.BB@LABEL@14_1:	; bb
	;***      238 : 		enum Control_status control, uint32_t data) {
	;***      239 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      240 : 		btod.refined.data[i] = input_buf[2 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	shrw ax, 8+0x00000
	addw ax, hl
	incw ax
	incw ax
	movw de, ax
	mov a, [de]
	mov LOWW(_btod)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@14_1
.BB@LABEL@14_2:	; bb23
	mov a, c
	;***      241 : 	}
	;***      242 : 
	;***      243 : 	if ((input_buf[0] == header) && (input_buf[1] == control)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 243
	cmp a, [hl]
	bnz $.BB@LABEL@14_10
.BB@LABEL@14_3:	; bb32
	mov a, [sp+0x00]
	cmp a, [hl+0x01]
	bnz $.BB@LABEL@14_7
.BB@LABEL@14_4:	; bb47
	movw ax, [sp+0x08]
	cmpw ax, !LOWW(_btod+0x00002)
	movw ax, [sp+0x06]
	sknz
.BB@LABEL@14_5:	; bb47
	cmpw ax, !LOWW(_btod)
.BB@LABEL@14_6:	; bb47
	;***      244 : 			&& (btod.raw == data))
	;***      245 : 		return 2;
	;***      246 : 	else if ((input_buf[0] == header) && (input_buf[1] == control))
	;***      247 : 		return 1;
	;***      248 : 	else
	;***      249 : 		return 0;
	;***      250 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	mov a, #0x02
	bz $.BB@LABEL@14_9
.BB@LABEL@14_7:	; bb70
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	cmp a, [hl+0x01]
	oneb a
	skz
.BB@LABEL@14_8:	; bb70
	clrb a
.BB@LABEL@14_9:	; bb70
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	ret
.BB@LABEL@14_10:	; if_else_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	clrb a
	br $.BB@LABEL@14_9
_DrainageAcidAndAlkalineTankStart_nostop:
	.STACK _DrainageAcidAndAlkalineTankStart_nostop = 4
	;***      251 : 
	;***      252 : /**
	;***      253 :  * Drain Tank 1 and Tank 2 if there are any liquid left
	;***      254 :  * 13/12/2021: Checked!
	;***      255 :  * @return: 0 - Done; 1 - Not done
	;***      256 :  */
	;***      257 : uint8_t DrainageAcidAndAlkalineTankStart_nostop(void) {
	;***      258 : 	O_DRAIN_ACID_PIN_SV5 = isAcidTankEmpty() ? OFF : ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	call $!_isAcidTankEmpty
	cmp0 a
	clrb x
	sknz
.BB@LABEL@15_1:	; bb4
	mov x, #0x80
.BB@LABEL@15_2:	; bb5
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      259 : 	O_DRAIN_ALK_PIN_SV6 = isAlkalineTankEmpty() ? OFF : ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
	call $!_isAlkalineTankEmpty
	cmp0 a
	clrb x
	sknz
.BB@LABEL@15_3:	; bb18
	mov x, #0x40
.BB@LABEL@15_4:	; bb20
	mov a, #0xBF
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      260 : 	return !(O_DRAIN_ACID_PIN_SV5 == OFF && O_DRAIN_ALK_PIN_SV6 == OFF);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 260
	mov a, 0xFFF06
	bt a.7, $.BB@LABEL@15_6
.BB@LABEL@15_5:	; bb34
	mov a, 0xFFF06
	shr a, 0x06
	and a, #0x01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 261
	ret
.BB@LABEL@15_6:	; bb50
	oneb a
	ret
_WaterSupplyStart_nostop:
	.STACK _WaterSupplyStart_nostop = 14
	;***      261 : }
	;***      262 : 
	;***      263 : /*!
	;***      264 :  * Supply water to CVCC
	;***      265 :  * @return 0 - Done, 1 - Not done yet
	;***      266 :  */
	;***      267 : uint8_t WaterSupplyStart_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 267
	subw sp, #0x06
	;***      268 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      269 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      270 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
	mov b, !LOWW(_g_machine_state+0x00004)
	mov a, b
	mov [sp+0x02], a
	cmp0 b
	bz $.BB@LABEL@16_9
.BB@LABEL@16_1:	; entry
	mov a, b
	dec a
	bz $.BB@LABEL@16_10
.BB@LABEL@16_2:	; entry
	dec a
	bz $.BB@LABEL@16_12
.BB@LABEL@16_3:	; entry
	dec a
	.bz $!.BB@LABEL@16_14
.BB@LABEL@16_4:	; entry
	dec a
	.bz $!.BB@LABEL@16_18
.BB@LABEL@16_5:	; entry
	dec a
	.bz $!.BB@LABEL@16_19
.BB@LABEL@16_6:	; entry
	dec a
	bnz $.BB@LABEL@16_8
.BB@LABEL@16_7:	; switch_clause_bb72
	;***      271 : 	case 0:
	;***      272 : 		*tick = g_systemTime;
	;***      273 : 		(*state)++;
	;***      274 : 		break;
	;***      275 : 	case 1:
	;***      276 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      277 : 		if (ns_delay_ms(tick, 30000)) {
	;***      278 : 			(*state)++;
	;***      279 : 		}
	;***      280 : 		break;
	;***      281 : 	case 2:
	;***      282 : 		O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      283 : 		if (ns_delay_ms(tick, 500)) {
	;***      284 : 			(*state)++;
	;***      285 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      286 : 		}
	;***      287 : 		break;
	;***      288 : 	case 3:
	;***      289 : 		O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      290 : 		if (ns_delay_ms(tick, 15000)) {
	;***      291 : 			(*state)++;
	;***      292 : 			g_machine_state.flowSensor = 0;
	;***      293 : 		}
	;***      294 : 		measureFlowSensor_nostop();
	;***      295 : 		break;
	;***      296 : 	case 4:
	;***      297 : 		measureFlowSensor(&g_timerSetting.t3_flowSensorMonitorTime_s);
	;***      298 : 		(*state)++;
	;***      299 : 		break;
	;***      300 : 	case 5:
	;***      301 : 		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      302 : 				|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      303 : 			(*state) = 3;
	;***      304 : 			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      305 : 					g_io_status.refined.FlowValue);
	;***      306 : 		} else
	;***      307 : 			(*state)++;
	;***      308 : 		g_Tick.tickWaterSupply = g_systemTime;
	;***      309 : 		break;
	;***      310 : 	case 6:
	;***      311 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
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
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@16_17
.BB@LABEL@16_8:	; if_then_bb79
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@16_17
.BB@LABEL@16_9:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 272
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@16_17
.BB@LABEL@16_10:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	clrw ax
	movw de, ax
	movw bc, #0x7530
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@16_17
.BB@LABEL@16_11:	; if_then_bb
	inc !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@16_17
.BB@LABEL@16_12:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@16_17
.BB@LABEL@16_13:	; if_then_bb24
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00024), ax
	br $.BB@LABEL@16_17
.BB@LABEL@16_14:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@16_16
.BB@LABEL@16_15:	; if_then_bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
	clrb !LOWW(_g_machine_state+0x00005)
.BB@LABEL@16_16:	; if_break_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
	call $!_measureFlowSensor_nostop
.BB@LABEL@16_17:	; if_break_bb41
	br $.BB@LABEL@16_24
.BB@LABEL@16_18:	; switch_clause_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
	movw ax, #LOWW(_g_timerSetting+0x00008)
	call $!_measureFlowSensor
	br $.BB@LABEL@16_11
.BB@LABEL@16_19:	; switch_clause_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
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
	bnz $.BB@LABEL@16_22
.BB@LABEL@16_20:	; bb
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
	bnz $.BB@LABEL@16_22
.BB@LABEL@16_21:	; if_else_bb
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	inc a
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@16_23
.BB@LABEL@16_22:	; if_then_bb64
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	mov !LOWW(_g_machine_state+0x00004), #0x03
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	movw ax, #0x4104
	call !!_sendToRasPi_f
.BB@LABEL@16_23:	; if_break_bb70
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 308
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
.BB@LABEL@16_24:	; switch_break_bb
	;***      312 : 				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
	;***      313 : 			(*state) = 0;
	;***      314 : 		}
	;***      315 : 		break;
	;***      316 : 	default:
	;***      317 : 		(*state) = 0;
	;***      318 : 		break;
	;***      319 : 	}
	;***      320 : 	return (*state) == 0 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 320
	cmp0 !LOWW(_g_machine_state+0x00004)
	oneb a
	sknz
.BB@LABEL@16_25:	; switch_break_bb
	clrb a
.BB@LABEL@16_26:	; switch_break_bb
	addw sp, #0x06
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      321 : }
	;***      322 : 
	;***      323 : /**
	;***      324 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      325 :  * 30/11/2021: Checked by An
	;***      326 :  * @return 0 - OK; 1 - Error
	;***      327 :  */
	;***      328 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 328
	subw sp, #0x0A
	;***      329 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 329
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
.BB@LABEL@17_1:	; entry
	clrb a
.BB@LABEL@17_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@17_3:	; entry
	clrb x
.BB@LABEL@17_4:	; entry
	or x, a
	bnz $.BB@LABEL@17_11
.BB@LABEL@17_5:	; if_then_bb
	;***      330 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 330
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
	bnz $.BB@LABEL@17_8
.BB@LABEL@17_6:	; bb34
	clrb a
.BB@LABEL@17_7:	; bb34
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 344
	ret
.BB@LABEL@17_8:	; if_then_bb11
	;***      331 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      332 : 			resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 332
	call !!_resetAlarm
	;***      333 : 			sendToRasPi_f(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 333
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4105
	call !!_sendToRasPi_f
	;***      334 : 					g_io_status.refined.CVCCVoltage);
	;***      335 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 335
	set1 !LOWW(_g_alarm).0
	;***      336 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 336
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@17_9:	; if_then_bb11.bb23_crit_edge
	oneb a
.BB@LABEL@17_10:	; bb23
	mov !LOWW(_g_machine_state+0x00008), a
	;***      337 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 337
	movw ax, #0x0500
	call !!_stop_waitAlarmConfirm
	;***      338 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 338
	clr1 !LOWW(_g_alarm).0
	;***      339 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 339
	oneb a
	br $.BB@LABEL@17_7
.BB@LABEL@17_11:	; if_else_bb
	;***      340 : 		}
	;***      341 : 	} else
	;***      342 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 342
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	br $.BB@LABEL@17_6
_Voltage2Check_nostop:
	.STACK _Voltage2Check_nostop = 18
	;***      343 : 	return 0;
	;***      344 : }
	;***      345 : /**
	;***      346 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      347 :  * 16/12/2021: Checked by An
	;***      348 :  * @return 0 - OK
	;***      349 :  */
	;***      350 : void Voltage2Check_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 350
	subw sp, #0x0A
	;***      351 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 351
	movw ax, !LOWW(_g_numberSetting+0x00006)
	movw [sp+0x02], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00004)
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
.BB@LABEL@18_1:	; entry
	clrb a
.BB@LABEL@18_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@18_3:	; entry
	clrb x
.BB@LABEL@18_4:	; entry
	or x, a
	bnz $.BB@LABEL@18_8
.BB@LABEL@18_5:	; if_then_bb
	;***      352 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 352
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
	bz $.BB@LABEL@18_9
.BB@LABEL@18_6:	; if_then_bb10
	;***      353 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      354 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 354
	movw ax, !LOWW(_g_numberSetting+0x00002)
	push ax
	movw ax, !LOWW(_g_numberSetting)
	push ax
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@18_9
.BB@LABEL@18_7:	; if_then_bb20
	;***      355 : 					>= g_numberSetting.upperVoltage1)) {
	;***      356 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 356
	call !!_resetAlarm
	;***      357 : 				g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 357
	set1 !LOWW(_g_alarm).1
	;***      358 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 358
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4106
	addw sp, #0x0A
	br !!_sendToRasPi_f
.BB@LABEL@18_8:	; if_else_bb
	;***      359 : 						g_io_status.refined.CVCCVoltage);
	;***      360 : 			}
	;***      361 : 		}
	;***      362 : 	} else {
	;***      363 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 363
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      364 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 364
	clr1 !LOWW(_g_alarm).1
.BB@LABEL@18_9:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 366
	ret
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      365 : 	}
	;***      366 : }
	;***      367 : /**
	;***      368 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      369 :  * 16/12/2021: Checked by An
	;***      370 :  * @return 0 - OK; 1 - Error
	;***      371 :  */
	;***      372 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 372
	subw sp, #0x0A
	;***      373 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 373
	movw ax, !LOWW(_g_numberSetting+0x0000A)
	movw [sp+0x02], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00008)
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
.BB@LABEL@19_1:	; entry
	clrb a
.BB@LABEL@19_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@19_3:	; entry
	clrb x
.BB@LABEL@19_4:	; entry
	or x, a
	bnz $.BB@LABEL@19_10
.BB@LABEL@19_5:	; if_then_bb
	;***      374 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 374
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
	bz $.BB@LABEL@19_11
.BB@LABEL@19_6:	; if_then_bb11
	;***      375 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      376 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 376
	movw ax, !LOWW(_g_numberSetting+0x00006)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00004)
	push ax
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@19_11
.BB@LABEL@19_7:	; if_then_bb21
	;***      377 : 					>= g_numberSetting.upperVoltage2)) {
	;***      378 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 378
	call !!_resetAlarm
	;***      379 : 				g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 379
	set1 !LOWW(_g_alarm).2
	;***      380 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 380
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      381 : //				g_machine_state.electrolyteOFF =
	;***      382 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      383 : //								1 : g_machine_state.electrolyteOFF;
	;***      384 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 384
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@19_8:	; if_then_bb21.bb35_crit_edge
	oneb a
.BB@LABEL@19_9:	; bb35
	mov !LOWW(_g_machine_state+0x00008), a
	;***      385 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 385
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4107
	call !!_sendToRasPi_f
	;***      386 : 						g_io_status.refined.CVCCVoltage);
	;***      387 : 				stop_waitAlarmConfirm(OVER_VOLTAGE_3, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 387
	movw ax, #0x0700
	call !!_stop_waitAlarmConfirm
	;***      388 : 				g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 388
	clr1 !LOWW(_g_alarm).2
	;***      389 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 389
	oneb a
	br $.BB@LABEL@19_12
.BB@LABEL@19_10:	; if_else_bb
	;***      390 : 			}
	;***      391 : 		}
	;***      392 : 	} else {
	;***      393 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 393
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
.BB@LABEL@19_11:	; bb48
	clrb a
.BB@LABEL@19_12:	; bb48
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 396
	ret
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      394 : 	}
	;***      395 : 	return 0;
	;***      396 : }
	;***      397 : /**
	;***      398 :  * Checked 16/12/2021
	;***      399 :  * @return
	;***      400 :  */
	;***      401 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 401
	subw sp, #0x0A
	;***      402 : 	if ((g_systemTime - g_TimeKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 402
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
.BB@LABEL@20_1:	; entry
	decw ax
.BB@LABEL@20_2:	; entry
	subw ax, !LOWW(_g_TimeKeeper@1+0x00004)
	cmpw ax, bc
	movw ax, hl
	sknz
.BB@LABEL@20_3:	; entry
	cmpw ax, de
.BB@LABEL@20_4:	; entry
	.bc $!.BB@LABEL@20_16
.BB@LABEL@20_5:	; if_then_bb
	;***      403 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      404 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 404
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
.BB@LABEL@20_6:	; if_then_bb
	clrb a
.BB@LABEL@20_7:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@20_8:	; if_then_bb
	clrb x
.BB@LABEL@20_9:	; if_then_bb
	or x, a
	bnz $.BB@LABEL@20_16
.BB@LABEL@20_10:	; if_then_bb13
	;***      405 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 405
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
	bnz $.BB@LABEL@20_13
.BB@LABEL@20_11:	; bb47
	clrb a
.BB@LABEL@20_12:	; bb47
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 425
	ret
.BB@LABEL@20_13:	; if_then_bb20
	;***      406 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      407 : 				resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 407
	call !!_resetAlarm
	;***      408 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 408
	set1 !LOWW(_g_alarm).5
	;***      409 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 409
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      410 : //				g_machine_state.electrolyteOFF =
	;***      411 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      412 : //								1 : g_machine_state.electrolyteOFF;
	;***      413 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 413
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@20_14:	; if_then_bb20.bb32_crit_edge
	oneb a
.BB@LABEL@20_15:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	;***      414 : 				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 414
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4108
	call !!_sendToRasPi_f
	;***      415 : 						g_io_status.refined.CVCCVoltage);
	;***      416 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 416
	movw ax, #0x0800
	call !!_stop_waitAlarmConfirm
	;***      417 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 417
	clr1 !LOWW(_g_alarm).5
	;***      418 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 418
	oneb a
	br $.BB@LABEL@20_12
.BB@LABEL@20_16:	; if_else_bb
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	br $.BB@LABEL@20_11
_OverCurrentCheck_waitReset:
	.STACK _OverCurrentCheck_waitReset = 22
	;***      419 : 			}
	;***      420 : 		} else
	;***      421 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      422 : 	} else
	;***      423 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      424 : 	return 0;
	;***      425 : }
	;***      426 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 426
	subw sp, #0x0E
	;***      427 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 427
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      428 : 	const uint16_t _max_time = 10000;
	;***      429 : 	if (g_systemTime - g_TimeKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 429
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TimeKeeper@1+0x00002)
	movw de, ax
	movw ax, bc
	sknc
.BB@LABEL@21_1:	; entry
	decw ax
.BB@LABEL@21_2:	; entry
	subw ax, !LOWW(_g_TimeKeeper@1+0x00004)
	clrw bc
	cmpw ax, bc
	movw ax, de
	sknz
.BB@LABEL@21_3:	; entry
	cmpw ax, #0x1388
.BB@LABEL@21_4:	; entry
	.bc $!.BB@LABEL@21_34
.BB@LABEL@21_5:	; if_then_bb
	;***      430 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 430
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
	bnz $.BB@LABEL@21_11
.BB@LABEL@21_6:	; bb
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
.BB@LABEL@21_7:	; bb
	clrb a
.BB@LABEL@21_8:	; bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@21_9:	; bb
	clrb x
.BB@LABEL@21_10:	; bb
	or x, a
	.bnz $!.BB@LABEL@21_34
.BB@LABEL@21_11:	; if_then_bb24
	mov a, #0x48
	;***      431 : 				|| (g_io_status.refined.CVCCCurrent
	;***      432 : 						>= g_numberSetting.upperCurrent)) {
	;***      433 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 433
	and a, !LOWW(_g_alarm)
	bnz $.BB@LABEL@21_18
.BB@LABEL@21_12:	; if_then_bb24
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
.BB@LABEL@21_13:	; if_then_bb24
	clrb a
.BB@LABEL@21_14:	; if_then_bb24
	cmp0 x
	oneb x
	sknz
.BB@LABEL@21_15:	; if_then_bb24
	clrb x
.BB@LABEL@21_16:	; if_then_bb24
	or x, a
	bnz $.BB@LABEL@21_18
.BB@LABEL@21_17:	; if_then_bb58
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      434 : 					&& (g_alarm.refined.overCurrent == 0)
	;***      435 : 					&& (g_io_status.refined.CVCCCurrent
	;***      436 : 							<= g_numberSetting.lowerCurrent)) {
	;***      437 : 				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 437
	movw ax, #0x4109
	call !!_sendToRasPi_f
.BB@LABEL@21_18:	; if_break_bb
	;***      438 : 						g_io_status.refined.CVCCCurrent);
	;***      439 : 			}
	;***      440 : 			g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 440
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
.BB@LABEL@21_19:	; if_break_bb
	clrb a
.BB@LABEL@21_20:	; if_break_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@21_21:	; if_break_bb
	clrb x
.BB@LABEL@21_22:	; if_break_bb
	or x, a
	mov x, #0x40
	skz
.BB@LABEL@21_23:	; bb65
	clrb x
.BB@LABEL@21_24:	; bb67
	mov a, #0xBF
	and a, !LOWW(_g_alarm)
	or a, x
	mov !LOWW(_g_alarm), a
	;***      441 : 					g_io_status.refined.CVCCCurrent
	;***      442 : 							<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      443 : 
	;***      444 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 444
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
.BB@LABEL@21_25:	; bb67
	clrb a
.BB@LABEL@21_26:	; bb67
	cmp0 x
	oneb x
	sknz
.BB@LABEL@21_27:	; bb67
	clrb x
.BB@LABEL@21_28:	; bb67
	or x, a
	bnz $.BB@LABEL@21_33
.BB@LABEL@21_29:	; if_then_bb81
	;***      445 : 					>= g_numberSetting.upperCurrent) {
	;***      446 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 446
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@21_34
.BB@LABEL@21_30:	; if_then_bb88
	;***      447 : 					resetAlarm();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 447
	call !!_resetAlarm
	;***      448 : 					g_alarm.refined.overCurrent = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 448
	set1 !LOWW(_g_alarm).3
	;***      449 : 					g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 449
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      450 : //					g_machine_state.electrolyteOFF =
	;***      451 : //							g_machine_state.electrolyteOFF == 0 ?
	;***      452 : //									1 : g_machine_state.electrolyteOFF;
	;***      453 : 					electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 453
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@21_31:	; if_then_bb88.bb102_crit_edge
	oneb a
.BB@LABEL@21_32:	; bb102
	mov !LOWW(_g_machine_state+0x00008), a
	;***      454 : 					sendToRasPi_f(H_ALARM, OVER_CURRENT,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 454
	movw bc, !LOWW(_g_io_status+0x0000E)
	movw de, !LOWW(_g_io_status+0x00010)
	movw ax, #0x410A
	call !!_sendToRasPi_f
	;***      455 : 							g_io_status.refined.CVCCCurrent);
	;***      456 : 					stop_waitAlarmConfirm(OVER_CURRENT, 10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 456
	movw ax, #0x0A0A
	call !!_stop_waitAlarmConfirm
	;***      457 : 					g_alarm.refined.overCurrent = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 457
	clr1 !LOWW(_g_alarm).3
	;***      458 : 					return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 458
	oneb a
	br $.BB@LABEL@21_35
.BB@LABEL@21_33:	; if_else_bb
	;***      459 : 				}
	;***      460 : 			} else {
	;***      461 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 461
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@21_34:	; bb117
	clrb a
.BB@LABEL@21_35:	; bb117
	addw sp, #0x0E
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 466
	ret
_ElectrolyticOperation_nostop:
	.STACK _ElectrolyticOperation_nostop = 4
	;***      462 : 			}
	;***      463 : 		}
	;***      464 : 	}
	;***      465 : 	return 0;
	;***      466 : }
	;***      467 : uint8_t ElectrolyticOperation_nostop(void) {
	;***      468 : 	uint8_t *state = &g_machine_state.electrolyteOperation;
	;***      469 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 469
	mov a, !LOWW(_g_machine_state+0x00007)
	cmp0 a
	.bz $!.BB@LABEL@22_21
.BB@LABEL@22_1:	; entry
	dec a
	bz $.BB@LABEL@22_5
.BB@LABEL@22_2:	; entry
	dec a
	bz $.BB@LABEL@22_6
.BB@LABEL@22_3:	; entry
	dec a
	.bz $!.BB@LABEL@22_18
.BB@LABEL@22_4:	; switch_clause_bb130
	clrb !LOWW(_g_machine_state+0x00007)
	br $!.BB@LABEL@22_22
.BB@LABEL@22_5:	; switch_clause_bb7
	;***      470 : 	case 0:
	;***      471 : 		(*state)++;
	;***      472 : 		break;
	;***      473 : 	case 1:
	;***      474 : 		electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 474
	call $!_electrolyticOperationON
	;***      475 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 475
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	;***      476 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 476
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      477 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 477
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
	;***      478 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 478
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	;***      479 : 		g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 479
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
	br $.BB@LABEL@22_17
.BB@LABEL@22_6:	; switch_clause_bb16
	;***      480 : 		(*state)++;
	;***      481 : 		break;
	;***      482 : 	case 2:
	;***      483 : 		Voltage2Check_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 483
	call $!_Voltage2Check_nostop
	;***      484 : 		if (Voltage1Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 484
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@22_14
.BB@LABEL@22_7:	; if_else_bb
	;***      485 : 			(*state)--;
	;***      486 : 			break;
	;***      487 : 
	;***      488 : 		} else if (Voltage3Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 488
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@22_14
.BB@LABEL@22_8:	; if_else_bb35
	;***      489 : 			(*state)--;
	;***      490 : 			break;
	;***      491 : 		} else if (LowVoltageCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 491
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@22_14
.BB@LABEL@22_9:	; if_else_bb46
	;***      492 : 			(*state)--;
	;***      493 : 			break;
	;***      494 : 		} else if (OverCurrentCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 494
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@22_14
.BB@LABEL@22_10:	; if_else_bb57
	;***      495 : 			(*state)--;
	;***      496 : 			break;
	;***      497 : 		} else if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 497
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@22_15
.BB@LABEL@22_11:	; if_then_bb65
	;***      498 : 			g_alarm.refined.cvcc = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 498
	set1 !LOWW(_g_alarm).7
	;***      499 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 499
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      500 : 			g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 500
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@22_12:	; if_then_bb65.bb78_crit_edge
	oneb a
.BB@LABEL@22_13:	; bb78
	mov !LOWW(_g_machine_state+0x00008), a
	;***      501 : 					g_machine_state.electrolyteOFF == 0 ?
	;***      502 : 							1 : g_machine_state.electrolyteOFF;
	;***      503 : 			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 503
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call !!_sendToRasPi_f
	;***      504 : 			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 504
	movw ax, #0x1200
	call !!_stop_waitAlarmConfirm
	;***      505 : 			g_alarm.refined.cvcc = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 505
	clr1 !LOWW(_g_alarm).7
.BB@LABEL@22_14:	; if_then_bb
	dec !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@22_22
.BB@LABEL@22_15:	; if_break_bb92
	;***      506 : 			(*state)--;
	;***      507 : 			break;
	;***      508 : 		}
	;***      509 : 		if (isAcidTankFull() && isAlkalineTankFull())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	call $!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@22_22
.BB@LABEL@22_16:	; bb97
	call $!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@22_22
.BB@LABEL@22_17:	; if_then_bb110
	inc !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@22_22
.BB@LABEL@22_18:	; switch_clause_bb115
	;***      510 : 			(*state)++;
	;***      511 : 		break;
	;***      512 : 	case 3:
	;***      513 : 		g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 513
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@22_19:	; switch_clause_bb115.bb125_crit_edge
	oneb a
.BB@LABEL@22_20:	; bb125
	mov !LOWW(_g_machine_state+0x00008), a
	br $!.BB@LABEL@22_4
.BB@LABEL@22_21:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 471
	inc a
	mov !LOWW(_g_machine_state+0x00007), a
.BB@LABEL@22_22:	; bb132
	;***      514 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      515 : 						1 : g_machine_state.electrolyteOFF;
	;***      516 : 		(*state) = 0;
	;***      517 : 		break;
	;***      518 : 	default:
	;***      519 : 		(*state) = 0;
	;***      520 : 		break;
	;***      521 : 	}
	;***      522 : 	return (*state) == 0 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 522
	cmp0 !LOWW(_g_machine_state+0x00007)
	oneb a
	skz
.BB@LABEL@22_23:	; bb132
	clrb a
.BB@LABEL@22_24:	; bb132
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      523 : //	WAIT_RESET: electrolyticOperationON();
	;***      524 : //	g_Tick.tickVoltage1Check = g_systemTime;
	;***      525 : //	g_Tick.tickVoltage2Check = g_systemTime;
	;***      526 : //	g_Tick.tickVoltage3Check = g_systemTime;
	;***      527 : //	g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      528 : //	g_Tick.tickCurrentCheck = g_systemTime;
	;***      529 : //	do {
	;***      530 : //		realTimeResponse();
	;***      531 : //		if (Voltage1Check_waitReset())
	;***      532 : //			goto WAIT_RESET;
	;***      533 : //		Voltage2Check_nostop();
	;***      534 : //		if (Voltage3Check_waitReset())
	;***      535 : //			goto WAIT_RESET;
	;***      536 : //		if (LowVoltageCheck_waitReset())
	;***      537 : //			goto WAIT_RESET;
	;***      538 : //		if (OverCurrentCheck_waitReset())
	;***      539 : //			goto WAIT_RESET;
	;***      540 : //		//----------CVCC Alarm Input-----------------
	;***      541 : //		if (I_CVCC_ALARM_IN == I_ON) {
	;***      542 : //			g_alarm.refined.cvcc = 1;
	;***      543 : //			g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      544 : //			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	;***      545 : //			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	;***      546 : //			g_alarm.refined.cvcc = 0;
	;***      547 : //			goto WAIT_RESET;
	;***      548 : //		}
	;***      549 : //		R_WDT_Restart();
	;***      550 : //	} while (!isAcidTankFull() || !isAlkalineTankFull());
	;***      551 : //	g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      552 : }
	;***      553 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 553
	subw sp, #0x04
	;***      554 : 	uint32_t _time_count = 0;
	;***      555 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 555
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
	bnz $.BB@LABEL@23_3
.BB@LABEL@23_1:	; entry
	bc $.BB@LABEL@23_3
.BB@LABEL@23_2:	; entry
	movw ax, #0x3DCC
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, de
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@23_4
.BB@LABEL@23_3:	; entry.if_break_bb_crit_edge
	clrw ax
	movw [sp+0x02], ax
	movw [sp+0x00], ax
	br $.BB@LABEL@23_5
.BB@LABEL@23_4:	; if_then_bb
	onew ax
	movw [sp+0x02], ax
	decw ax
	movw [sp+0x00], ax
	;***      556 : 			& (_time_count
	;***      557 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      558 : 		_time_count++;
	;***      559 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 559
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@23_5:	; if_break_bb
	;***      560 : 	}
	;***      561 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 561
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
.BB@LABEL@23_6:	; if_break_bb
	cmpw ax, de
.BB@LABEL@23_7:	; if_break_bb
	addw sp, #0x04
	bnz $.BB@LABEL@23_9
.BB@LABEL@23_8:	; if_then_bb20
	;***      562 : 		sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 562
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br !!_sendToRasPi_f
.BB@LABEL@23_9:	; return
	;***      563 : 	}
	;***      564 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 564
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      565 : void saltWaterTankFullCheck(void) {
	;***      566 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 566
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@24_2
.BB@LABEL@24_1:	; return
	;***      567 : 		sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      568 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	;***      569 : 		g_machine_state.electrolyteOFF =
	;***      570 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      571 : 						1 : g_machine_state.electrolyteOFF;
	;***      572 : 	}
	;***      573 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 573
	ret
.BB@LABEL@24_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 567
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 568
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 569
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@24_3:	; if_then_bb.bb14_crit_edge
	oneb a
.BB@LABEL@24_4:	; bb14
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 573
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      574 : void saltWaterTankEmptyCheck(void) {
	;***      575 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 575
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@25_2
.BB@LABEL@25_1:	; if_then_bb
	;***      576 : 		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 576
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br !!_sendToRasPi_f
.BB@LABEL@25_2:	; return
	;***      577 : 	}
	;***      578 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 578
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      579 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 579
	movw de, #0xFF07
	;***      580 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 580
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
.BB@LABEL@26_1:	; return
	;***      581 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      582 : 		sendToRasPi_f(H_ALARM, ACID_ERROR, 1);
	;***      583 : 
	;***      584 : 	}
	;***      585 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 585
	ret
.BB@LABEL@26_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 582
	movw de, #0x3F80
	movw ax, #0x410E
	br !!_sendToRasPi_f
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      586 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 586
	push hl
	;***      587 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 587
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
.BB@LABEL@27_1:	; return
	;***      588 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      589 : 		sendToRasPi_f(H_ALARM, ALKALINE_ERROR, 1);
	;***      590 : 	}
	;***      591 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 591
	ret
.BB@LABEL@27_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 589
	movw de, #0x3F80
	movw ax, #0x410F
	br !!_sendToRasPi_f
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      592 : 
	;***      593 : uint8_t FilterReplacementCheck(void) {
	;***      594 : 
	;***      595 : 	return 0;
	;***      596 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 596
	clrb a
	ret
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      597 : 
	;***      598 : /**
	;***      599 :  * Tested: 10/12/2021 by Mr.An
	;***      600 :  */
	;***      601 : void WaterWashingMode_nostop(void) {
	;***      602 : 	uint8_t *state = &g_machine_state.water;
	;***      603 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      604 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 604
	mov a, !LOWW(_g_machine_state+0x00002)
	cmp0 a
	bz $.BB@LABEL@29_4
.BB@LABEL@29_1:	; entry
	dec a
	bz $.BB@LABEL@29_5
.BB@LABEL@29_2:	; entry
	dec a
	bz $.BB@LABEL@29_7
.BB@LABEL@29_3:	; switch_clause_bb31
	;***      605 : 	case 0:
	;***      606 : 		g_machine_state.mode = WATER_WASHING;
	;***      607 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      608 : 		g_color = WHITE;
	;***      609 : 		*tick = g_systemTime;
	;***      610 : 		(*state)++;
	;***      611 : 		handSensorLED(g_color);
	;***      612 : 		break;
	;***      613 : 	case 1:
	;***      614 : 		if (ns_delay_ms(tick, 50)) {
	;***      615 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      616 : 			(*state)++;
	;***      617 : 		}
	;***      618 : 		break;
	;***      619 : 	case 2:
	;***      620 : 		if (DETECT_U == I_ON) {
	;***      621 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      622 : 			g_color = BLACK;
	;***      623 : 			(*state) = 0;
	;***      624 : 			g_machine_state.mode = BUSY;
	;***      625 : 			handSensorLED(g_color);
	;***      626 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      627 : 		}
	;***      628 : 		break;
	;***      629 : 	default:
	;***      630 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 630
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@29_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 606
	mov !LOWW(_g_machine_state+0x0000E), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 607
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 608
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 609
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 610
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 611
	mov a, #0x02
	br $!_handSensorLED
.BB@LABEL@29_5:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 614
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00018)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@29_9
.BB@LABEL@29_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 615
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call !!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 616
	inc !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@29_7:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 620
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@29_9
.BB@LABEL@29_8:	; if_then_bb27
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 621
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 622
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 623
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 624
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 625
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 626
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br !!_sendToRasPi_f
.BB@LABEL@29_9:	; return
	;***      631 : 		break;
	;***      632 : 	}
	;***      633 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 633
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***      634 : 
	;***      635 : /**
	;***      636 :  * Tested: 24/12/2021 by Mr.An
	;***      637 :  */
	;***      638 : void HandWashingMode_nostop(void) {
	;***      639 : 	uint8_t *state = &g_machine_state.handwash;
	;***      640 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      641 : 	const uint32_t delayPump_ms = 50;
	;***      642 : 	if ((*state) == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 642
	mov a, !LOWW(_g_machine_state+0x00003)
	mov d, a
	cmp0 a
	bnz $.BB@LABEL@30_10
.BB@LABEL@30_1:	; if_then_bb
	;***      643 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 643
	movw ax, !LOWW(_g_timerSetting+0x00076)
	movw bc, ax
	cmpw ax, #0x0000
	movw ax, !LOWW(_g_timerSetting+0x00074)
	movw hl, ax
	sknz
.BB@LABEL@30_2:	; if_then_bb
	cmpw ax, #0x0032
.BB@LABEL@30_3:	; if_then_bb
	bnc $.BB@LABEL@30_5
.BB@LABEL@30_4:	; if_then_bb.bb22_crit_edge
	clrw bc
	movw ax, #0x0032
	br $.BB@LABEL@30_9
.BB@LABEL@30_5:	; bb15
	movw ax, bc
	;***      644 : 				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***      645 : 						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***      646 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 646
	cmpw ax, #0x0000
	movw ax, hl
	sknz
.BB@LABEL@30_6:	; bb15
	cmpw ax, #0x03E9
.BB@LABEL@30_7:	; bb15
	bc $.BB@LABEL@30_9
.BB@LABEL@30_8:	; bb15.bb25_crit_edge
	clrw bc
	movw ax, #0x03E8
.BB@LABEL@30_9:	; bb25
	movw !LOWW(_g_timerSetting+0x00074), ax
	movw ax, bc
	movw !LOWW(_g_timerSetting+0x00076), ax
.BB@LABEL@30_10:	; if_break_bb
	mov a, d
	;***      647 : 				g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***      648 : 						1000 : g_timerSetting.t54_overLapTime_ms;
	;***      649 : 	} else {
	;***      650 : //		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
	;***      651 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      652 : //		}
	;***      653 : 	}
	;***      654 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 654
	cmp0 a
	bz $.BB@LABEL@30_19
.BB@LABEL@30_11:	; if_break_bb
	dec a
	bz $.BB@LABEL@30_20
.BB@LABEL@30_12:	; if_break_bb
	dec a
	bz $.BB@LABEL@30_23
.BB@LABEL@30_13:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@30_27
.BB@LABEL@30_14:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@30_31
.BB@LABEL@30_15:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@30_37
.BB@LABEL@30_16:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@30_42
.BB@LABEL@30_17:	; if_break_bb
	dec a
	.bz $!.BB@LABEL@30_45
.BB@LABEL@30_18:	; switch_clause_bb125
	;***      655 : 	case 0:
	;***      656 : 		*state = 1;
	;***      657 : 		*tick = g_systemTime;
	;***      658 : 		break;
	;***      659 : 	case 1:
	;***      660 : 		g_machine_state.mode = HAND_WASHING;
	;***      661 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      662 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      663 : 			O_PUMP_ALK_PIN = ON;
	;***      664 : 			handSensorLED(BLUE);
	;***      665 : 			(*state)++;
	;***      666 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      667 : //			g_Tick.tickAnimation = g_systemTime;
	;***      668 : //			g_machine_state.waitAnimationRes = 1;
	;***      669 : 		}
	;***      670 : 		break;
	;***      671 : 	case 2:
	;***      672 : 		if (ns_delay_ms(tick,
	;***      673 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      674 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      675 : 			O_PUMP_ALK_PIN = OFF;
	;***      676 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      677 : 			(*state)++;
	;***      678 : 		}
	;***      679 : 		break;
	;***      680 : 	case 3:
	;***      681 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      682 : 			O_PUMP_ACID_PIN = ON;
	;***      683 : 			handSensorLED(RED);
	;***      684 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      685 : 			(*state)++;
	;***      686 : 		}
	;***      687 : 		break;
	;***      688 : 	case 4:
	;***      689 : 		if (ns_delay_ms(tick,
	;***      690 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      691 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      692 : 			(*state)++;
	;***      693 : 		}
	;***      694 : 		break;
	;***      695 : 	case 5:
	;***      696 : 		if (ns_delay_ms(tick,
	;***      697 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      698 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      699 : 			O_PUMP_ACID_PIN = OFF;
	;***      700 : 			handSensorLED(WHITE);
	;***      701 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      702 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      703 : 			(*state)++;
	;***      704 : 		}
	;***      705 : 		break;
	;***      706 : 	case 6:
	;***      707 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      708 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      709 : 			(*state)++;
	;***      710 : 		}
	;***      711 : 		break;
	;***      712 : 	case 7:
	;***      713 : 		if (ns_delay_ms(tick,
	;***      714 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      715 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      716 : 			handSensorLED(BLACK);
	;***      717 : 			(*state) = 0;
	;***      718 : 			g_machine_state.mode = BUSY;
	;***      719 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      720 : 		}
	;***      721 : 		break;
	;***      722 : 	default:
	;***      723 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 723
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@30_19:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 656
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 657
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	ret
.BB@LABEL@30_20:	; switch_clause_bb34
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 660
	oneb !LOWW(_g_machine_state+0x0000E)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 661
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 662
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@30_28
.BB@LABEL@30_21:	; if_then_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 663
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 664
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 665
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@30_22:	; if_then_bb41
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br !!_sendToRasPi_f
.BB@LABEL@30_23:	; switch_clause_bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 672
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
.BB@LABEL@30_24:	; switch_clause_bb46
	decw ax
.BB@LABEL@30_25:	; switch_clause_bb46
	subw ax, !LOWW(_g_timerSetting+0x00076)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@30_34
.BB@LABEL@30_26:	; if_then_bb56
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 675
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 676
	set1 0xFFF07.6
	br $.BB@LABEL@30_36
.BB@LABEL@30_27:	; switch_clause_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 681
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@30_28:	; switch_clause_bb61
	bz $.BB@LABEL@30_40
.BB@LABEL@30_29:	; if_then_bb68
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 682
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 683
	oneb a
	call $!_handSensorLED
.BB@LABEL@30_30:	; if_then_bb68
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call !!_sendToRasPi_f
	br $.BB@LABEL@30_36
.BB@LABEL@30_31:	; switch_clause_bb73
	movw ax, #0xFFCE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 689
	addw ax, !LOWW(_g_timerSetting+0x00074)
	movw bc, ax
	clrw ax
	decw ax
	sknc
.BB@LABEL@30_32:	; switch_clause_bb73
	incw ax
.BB@LABEL@30_33:	; switch_clause_bb73
	addw ax, !LOWW(_g_timerSetting+0x00076)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@30_34:	; switch_clause_bb73
	bz $.BB@LABEL@30_43
.BB@LABEL@30_35:	; if_then_bb82
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 691
	clr1 0xFFF07.7
.BB@LABEL@30_36:	; if_then_bb82
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 727
	ret
.BB@LABEL@30_37:	; switch_clause_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 696
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
.BB@LABEL@30_38:	; switch_clause_bb87
	decw ax
.BB@LABEL@30_39:	; switch_clause_bb87
	subw ax, !LOWW(_g_timerSetting+0x00076)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@30_40:	; switch_clause_bb87
	bz $.BB@LABEL@30_47
.BB@LABEL@30_41:	; if_then_bb97
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 699
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 700
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 701
	set1 0xFFF05.5
	br $.BB@LABEL@30_30
.BB@LABEL@30_42:	; switch_clause_bb102
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 707
	movw bc, !LOWW(_g_timerSetting+0x00074)
	movw de, !LOWW(_g_timerSetting+0x00076)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@30_43:	; switch_clause_bb102
	bz $.BB@LABEL@30_47
.BB@LABEL@30_44:	; if_then_bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 708
	clr1 0xFFF07.6
	br $.BB@LABEL@30_36
.BB@LABEL@30_45:	; switch_clause_bb114
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 713
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
	bz $.BB@LABEL@30_47
.BB@LABEL@30_46:	; if_then_bb122
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 715
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 716
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 717
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 718
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	br $!.BB@LABEL@30_22
.BB@LABEL@30_47:	; return
	;***      724 : 		break;
	;***      725 : 	}
	;***      726 : 
	;***      727 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 727
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      728 : /**
	;***      729 :  * Tested: 24/12/2021 by Mr.An
	;***      730 :  */
	;***      731 : void AcidWaterMode_nostop(void) {
	;***      732 : 	uint8_t *state = &g_machine_state.acid;
	;***      733 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      734 : 	const uint32_t delayPump_ms = 50;
	;***      735 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 735
	mov a, !LOWW(_g_machine_state+0x00001)
	cmp0 a
	bz $.BB@LABEL@31_5
.BB@LABEL@31_1:	; entry
	dec a
	bz $.BB@LABEL@31_6
.BB@LABEL@31_2:	; entry
	dec a
	bz $.BB@LABEL@31_8
.BB@LABEL@31_3:	; entry
	movw de, #0x0000
	dec a
	bz $.BB@LABEL@31_12
.BB@LABEL@31_4:	; switch_clause_bb57
	;***      736 : 	case 0:
	;***      737 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      738 : 		g_machine_state.mode = ACID_WASHING;
	;***      739 : 		*state = 1;
	;***      740 : 		*tick = g_systemTime;
	;***      741 : 		break;
	;***      742 : 	case 1:
	;***      743 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      744 : 		g_color = RED;
	;***      745 : 		handSensorLED(g_color);
	;***      746 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      747 : 			O_PUMP_ACID_PIN = ON;
	;***      748 : 			(*state)++;
	;***      749 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      750 : 		}
	;***      751 : 		break;
	;***      752 : 	case 2:
	;***      753 : 		//TODO: Change turn OFF signal here
	;***      754 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      755 : 				|| (DETECT_U == I_ON)) {
	;***      756 : 			O_PUMP_ACID_PIN = OFF;
	;***      757 : 			(*state)++;
	;***      758 : 		}
	;***      759 : 		break;
	;***      760 : 	case 3:
	;***      761 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      762 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      763 : 			g_color = BLACK;
	;***      764 : 			handSensorLED(g_color);
	;***      765 : 			(*state)++;
	;***      766 : 		}
	;***      767 : 		break;
	;***      768 : 	default:
	;***      769 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 769
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      770 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 770
	clrw bc
	movw ax, #0x5313
	call !!_sendToRasPi_f
	;***      771 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 771
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@31_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 738
	mov !LOWW(_g_machine_state+0x0000E), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 739
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 740
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@31_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 743
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 744
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 745
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 746
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@31_14
.BB@LABEL@31_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 747
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 748
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 749
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br !!_sendToRasPi_f
.BB@LABEL@31_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 754
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
	bnz $.BB@LABEL@31_10
.BB@LABEL@31_9:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@31_14
.BB@LABEL@31_10:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 756
	clr1 0xFFF06.2
.BB@LABEL@31_11:	; if_then_bb39
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 774
	ret
.BB@LABEL@31_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 761
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@31_14
.BB@LABEL@31_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 762
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 763
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 764
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@31_11
.BB@LABEL@31_14:	; return
	;***      772 : 		break;
	;***      773 : 	}
	;***      774 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 774
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      775 : /**
	;***      776 :  * Tested: 24/12/2021 by Mr.An
	;***      777 :  */
	;***      778 : void AlkalineWaterMode_nostop(void) {
	;***      779 : 	uint8_t *state = &g_machine_state.akaline;
	;***      780 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      781 : 	const uint32_t delayPump_ms = 50;
	;***      782 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 782
	mov a, !LOWW(_g_machine_state)
	cmp0 a
	bz $.BB@LABEL@32_5
.BB@LABEL@32_1:	; entry
	dec a
	bz $.BB@LABEL@32_6
.BB@LABEL@32_2:	; entry
	dec a
	bz $.BB@LABEL@32_8
.BB@LABEL@32_3:	; entry
	movw de, #0x0000
	dec a
	bz $.BB@LABEL@32_12
.BB@LABEL@32_4:	; switch_clause_bb57
	;***      783 : 	case 0:
	;***      784 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      785 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      786 : 		*state = 1;
	;***      787 : 		*tick = g_systemTime;
	;***      788 : 		break;
	;***      789 : 	case 1:
	;***      790 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      791 : 		g_color = BLUE;
	;***      792 : 		handSensorLED(g_color);
	;***      793 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      794 : 			O_PUMP_ALK_PIN = ON;
	;***      795 : 			(*state)++;
	;***      796 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      797 : 		}
	;***      798 : 		break;
	;***      799 : 	case 2:
	;***      800 : 		//TODO: Change turn OFF signal here
	;***      801 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***      802 : 				|| (DETECT_U == I_ON)) {
	;***      803 : 			O_PUMP_ALK_PIN = OFF;
	;***      804 : 			(*state)++;
	;***      805 : 		}
	;***      806 : 		break;
	;***      807 : 	case 3:
	;***      808 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      809 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      810 : 			g_color = BLACK;
	;***      811 : 			handSensorLED(g_color);
	;***      812 : 			(*state)++;
	;***      813 : 		}
	;***      814 : 		break;
	;***      815 : 	default:
	;***      816 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 816
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      817 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 817
	clrw bc
	movw ax, #0x5313
	call !!_sendToRasPi_f
	;***      818 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 818
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@32_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 785
	mov !LOWW(_g_machine_state+0x0000E), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 786
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 787
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@32_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 790
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 791
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 792
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 793
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@32_14
.BB@LABEL@32_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 794
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 795
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 796
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br !!_sendToRasPi_f
.BB@LABEL@32_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 801
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
	bnz $.BB@LABEL@32_10
.BB@LABEL@32_9:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@32_14
.BB@LABEL@32_10:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 803
	clr1 0xFFF06.1
.BB@LABEL@32_11:	; if_then_bb39
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 821
	ret
.BB@LABEL@32_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 808
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@32_14
.BB@LABEL@32_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 809
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 810
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 811
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@32_11
.BB@LABEL@32_14:	; return
	;***      819 : 		break;
	;***      820 : 	}
	;***      821 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 821
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***      822 : 
	;***      823 : // Newest
	;***      824 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 824
	subw sp, #0x0A
	;***      825 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 825
	call $!_UpdateMachineStatus
.BB@LABEL@33_1:	; bb1
	;***      826 : 	while (DrainageAcidAndAlkalineTankStart_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 826
	call $!_DrainageAcidAndAlkalineTankStart_nostop
	cmp0 a
	bz $.BB@LABEL@33_3
.BB@LABEL@33_2:	; bb
	;***      827 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 827
	call !!_RaspberryResponse_nostop
	;***      828 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 828
	call $!_UpdateMachineStatus
	;***      829 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 829
	call !!_R_WDT_Restart
	br $.BB@LABEL@33_1
.BB@LABEL@33_3:	; bb5
	;***      830 : 	}
	;***      831 : 
	;***      832 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 832
	call $!_UpdateMachineStatus
.BB@LABEL@33_4:	; bb7
	;***      833 : 	while (WaterSupplyStart_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 833
	call $!_WaterSupplyStart_nostop
	cmp0 a
	bz $.BB@LABEL@33_6
.BB@LABEL@33_5:	; bb6
	;***      834 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 834
	call $!_realTimeResponse
	br $.BB@LABEL@33_4
.BB@LABEL@33_6:	; bb13
	;***      835 : 	}
	;***      836 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 836
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
.BB@LABEL@33_7:	; bb13
	clrb a
.BB@LABEL@33_8:	; bb13
	cmp0 x
	oneb x
	sknz
.BB@LABEL@33_9:	; bb13
	clrb x
.BB@LABEL@33_10:	; bb13
	or x, a
	bnz $.BB@LABEL@33_12
.BB@LABEL@33_11:	; if_then_bb
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	;***      837 : 		sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 837
	movw ax, #0x4104
	call !!_sendToRasPi_f
.BB@LABEL@33_12:	; bb21
	;***      838 : 				g_io_status.refined.FlowValue);
	;***      839 : 	}
	;***      840 : 	while (!ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 840
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@33_14
.BB@LABEL@33_13:	; bb20
	;***      841 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 841
	call $!_realTimeResponse
	br $.BB@LABEL@33_12
.BB@LABEL@33_14:	; return
	;***      842 : 	}
	;***      843 : 
	;***      844 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 844
	addw sp, #0x0A
	ret
_userAuthHandler_nostop:
	.STACK _userAuthHandler_nostop = 4
	;***      845 : 
	;***      846 : void userAuthHandler_nostop(void) {
	;***      847 : 	if (g_machine_state.user == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 847
	cmp !LOWW(_g_machine_state+0x0000D), #0x01
	bnz $.BB@LABEL@34_9
.BB@LABEL@34_1:	; if_then_bb
	;***      848 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 848
	mov a, !LOWW(_g_machine_mode)
	dec a
	bz $.BB@LABEL@34_6
.BB@LABEL@34_2:	; if_then_bb
	dec a
	bz $.BB@LABEL@34_7
.BB@LABEL@34_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@34_8
.BB@LABEL@34_4:	; if_then_bb
	dec a
	bnz $.BB@LABEL@34_9
.BB@LABEL@34_5:	; switch_clause_bb8
	;***      849 : 		case HAND_WASHING:
	;***      850 : 			HandWashingMode_nostop();
	;***      851 : 			break;
	;***      852 : 		case WATER_WASHING:
	;***      853 : 			WaterWashingMode_nostop();
	;***      854 : 			break;
	;***      855 : 		case ACID_WASHING:
	;***      856 : 			AcidWaterMode_nostop();
	;***      857 : 			break;
	;***      858 : 		case ALKALINE_WASHING:
	;***      859 : 			AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 859
	br $!_AlkalineWaterMode_nostop
.BB@LABEL@34_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 850
	br $!_HandWashingMode_nostop
.BB@LABEL@34_7:	; switch_clause_bb6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 853
	br $!_WaterWashingMode_nostop
.BB@LABEL@34_8:	; switch_clause_bb7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 856
	br $!_AcidWaterMode_nostop
.BB@LABEL@34_9:	; return
	;***      860 : 			break;
	;***      861 : 		default:
	;***      862 : 			break;
	;***      863 : 		}
	;***      864 : 	}
	;***      865 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 865
	ret
_ElectrolyzeWaterGeneration_nostop:
	.STACK _ElectrolyzeWaterGeneration_nostop = 4
	;***      866 : /*!
	;***      867 :  * Tested!
	;***      868 :  */
	;***      869 : void ElectrolyzeWaterGeneration_nostop(void) {
	;***      870 : 	if ((g_machine_state.mode != ELECTROLYTIC_GENERATION)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 870
	mov a, !LOWW(_g_machine_state+0x0000E)
	cmp0 a
	bnz $.BB@LABEL@35_4
.BB@LABEL@35_1:	; if_then_bb
	;***      871 : 			&& (g_machine_state.mode == INDIE)) {
	;***      872 : 		if (isAcidTankEmpty() || isAlkalineTankEmpty()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 872
	call $!_isAcidTankEmpty
	cmp0 a
	bnz $.BB@LABEL@35_3
.BB@LABEL@35_2:	; bb18
	call $!_isAlkalineTankEmpty
	cmp0 a
	bz $.BB@LABEL@35_12
.BB@LABEL@35_3:	; if_then_bb31
	;***      873 : 			// Start Electrolyte
	;***      874 : 			g_machine_state.mode = ELECTROLYTIC_GENERATION;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 874
	mov !LOWW(_g_machine_state+0x0000E), #0x08
	;***      875 : 			//Stop what ever operation is happening
	;***      876 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 876
	clrb !LOWW(_g_machine_state+0x0000D)
	;***      877 : 			g_machine_state.handwash = g_machine_state.water =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 877
	clrb !LOWW(_g_machine_state)
	clrb !LOWW(_g_machine_state+0x00001)
	clrb !LOWW(_g_machine_state+0x00002)
	clrb !LOWW(_g_machine_state+0x00003)
	movw hl, #0xFF06
	movw ax, hl
	movw de, ax
	;***      878 : 					g_machine_state.acid = g_machine_state.akaline = 0;
	;***      879 : 			O_PUMP_ACID_PIN = O_PUMP_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 879
	clr1 [hl].1
	mov a, [de]
	mov1 CY, a.1
	mov a, [de]
	mov1 a.2, CY
	mov [de], a
	;***      880 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 880
	clr1 0xFFF05.5
	ret
.BB@LABEL@35_4:	; if_else_bb
	;***      881 : 
	;***      882 : 		}
	;***      883 : 	} else if (g_machine_state.mode == ELECTROLYTIC_GENERATION) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 883
	cmp a, #0x08
	bnz $.BB@LABEL@35_12
.BB@LABEL@35_5:	; if_then_bb49
	;***      884 : 		// Start Loop Electrolyte
	;***      885 : 		if (ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 885
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@35_13
.BB@LABEL@35_6:	; if_else_bb63
	;***      886 : 			O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      887 : 			g_machine_state.mode = INDIE;
	;***      888 : 			g_machine_state.user = 0;
	;***      889 : 			handSensorLED(BLACK);
	;***      890 : 			// Start Electrolyte Operation Off time keeper
	;***      891 : 		} else if (!isAcidTankFull() && !isAlkalineTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 891
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@35_8
.BB@LABEL@35_7:	; bb74
	call $!_isAlkalineTankFull
	cmp0 a
	;***      892 : 			handSensorLEDBlink(WHITE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 892
	mov a, #0x02
	bz $.BB@LABEL@35_10
.BB@LABEL@35_8:	; if_else_bb94
	;***      893 : 		} else if (!isAcidTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 893
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@35_11
.BB@LABEL@35_9:	; if_then_bb106
	;***      894 : 			handSensorLEDBlink(RED, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 894
	oneb a
.BB@LABEL@35_10:	; if_then_bb106
	movw de, #0x0000
	movw bc, #0x0064
	br $!_handSensorLEDBlink
.BB@LABEL@35_11:	; if_else_bb107
	;***      895 : 		} else if (!isAlkalineTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 895
	call $!_isAlkalineTankFull
	cmp0 a
	;***      896 : 			handSensorLEDBlink(BLUE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 896
	mov a, #0x03
	bz $.BB@LABEL@35_10
.BB@LABEL@35_12:	; return
	;***      897 : 		}
	;***      898 : 	}
	;***      899 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 899
	ret
.BB@LABEL@35_13:	; if_then_bb55
	movw hl, #0xFF07
	movw ax, hl
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 886
	clr1 [hl].7
	mov a, [de]
	mov1 CY, a.7
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 887
	clrb !LOWW(_g_machine_state+0x0000E)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 888
	clrb !LOWW(_g_machine_state+0x0000D)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 889
	clrb a
	br $!_handSensorLED
_isSV1andSV2Off8h:
	.STACK _isSV1andSV2Off8h = 8
	;***      900 : /*!
	;***      901 :  * Tested!
	;***      902 :  */
	;***      903 : uint8_t isSV1andSV2Off8h(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 903
	push hl
	;***      904 : 	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 904
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@36_5
.BB@LABEL@36_1:	; bb
	mov a, 0xFFF05
	bt a.5, $.BB@LABEL@36_5
.BB@LABEL@36_2:	; if_then_bb
	;***      905 : 		if (ns_delay_ms(&g_Tick.tickSV1SV2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 905
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
.BB@LABEL@36_3:	; if_then_bb
	clrb a
.BB@LABEL@36_4:	; if_then_bb
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 914
	ret
.BB@LABEL@36_5:	; if_else_bb
	;***      906 : 				(uint32_t) g_timerSetting.t61_curranCleaningIntervalTime_h * 60
	;***      907 : 						* 60 * 1000)) {
	;***      908 : 			return 1;
	;***      909 : 		}
	;***      910 : 	} else {
	;***      911 : 		g_Tick.tickSV1SV2 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 911
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
	clrb a
	br $.BB@LABEL@36_4
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***      912 : 	}
	;***      913 : 	return 0;
	;***      914 : }
	;***      915 : /*!
	;***      916 :  * Tested!
	;***      917 :  */
	;***      918 : void CallanCleaningMode_nostop(void) {
	;***      919 : 	uint8_t *state = &g_machine_state.callan;
	;***      920 : 	uint32_t *tick = &g_Tick.tickCallan;
	;***      921 : 	if (isSV1andSV2Off8h() || (*state) != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 921
	call $!_isSV1andSV2Off8h
	cmp0 a
	bnz $.BB@LABEL@37_2
.BB@LABEL@37_1:	; bb
	cmp0 !LOWW(_g_machine_state+0x00006)
	bz $.BB@LABEL@37_8
.BB@LABEL@37_2:	; if_then_bb
	;***      922 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 922
	mov a, !LOWW(_g_machine_state+0x00006)
	cmp0 a
	bz $.BB@LABEL@37_5
.BB@LABEL@37_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@37_6
.BB@LABEL@37_4:	; switch_clause_bb37
	;***      923 : 		case 0:
	;***      924 : 			(*state)++;
	;***      925 : 			*tick = g_systemTime;
	;***      926 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      927 : 			g_machine_state.mode = CALLAN_MODE;
	;***      928 : 			break;
	;***      929 : 		case 1:
	;***      930 : 			handSensorLEDBlink(WHITE, 500);
	;***      931 : 			if (ns_delay_ms(tick,
	;***      932 : 					g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***      933 : 				(*state)++;
	;***      934 : 				O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      935 : 				handSensorLED(BLACK);
	;***      936 : 			}
	;***      937 : 			break;
	;***      938 : 		default:
	;***      939 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 939
	clrb !LOWW(_g_machine_state+0x00006)
	ret
.BB@LABEL@37_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 924
	inc a
	mov !LOWW(_g_machine_state+0x00006), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 925
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 926
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 927
	mov !LOWW(_g_machine_state+0x0000E), #0x09
	ret
.BB@LABEL@37_6:	; switch_clause_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 930
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	mov a, #0x02
	call $!_handSensorLEDBlink
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 931
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
	bz $.BB@LABEL@37_8
.BB@LABEL@37_7:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 933
	inc !LOWW(_g_machine_state+0x00006)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 934
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 935
	clrb a
	br $!_handSensorLED
.BB@LABEL@37_8:	; return
	;***      940 : 			break;
	;***      941 : 		}
	;***      942 : 	}
	;***      943 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 943
	ret
_DrainageMode_nostop:
	.STACK _DrainageMode_nostop = 14
	;***      944 : /*!
	;***      945 :  * Tested!
	;***      946 :  */
	;***      947 : void DrainageMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 947
	subw sp, #0x06
	;***      948 : 	uint8_t *state = &g_machine_state.drainage;
	;***      949 : 	uint32_t *tick = &g_Tick.tickDrainage;
	;***      950 : 	if (g_machine_state.mode == DRAINAGE_MODE) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 950
	mov a, !LOWW(_g_machine_state+0x0000E)
	mov b, a
	cmp a, #0x0A
	.bnz $!.BB@LABEL@38_25
.BB@LABEL@38_1:	; if_then_bb
	;***      951 : 		// Start Drainage Loop
	;***      952 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 952
	mov a, !LOWW(_g_machine_state+0x00009)
	mov [sp+0x00], a
	cmp0 a
	bz $.BB@LABEL@38_7
.BB@LABEL@38_2:	; if_then_bb
	dec a
	bz $.BB@LABEL@38_9
.BB@LABEL@38_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@38_11
.BB@LABEL@38_4:	; if_then_bb
	dec a
	.bz $!.BB@LABEL@38_17
.BB@LABEL@38_5:	; if_then_bb
	dec a
	.bz $!.BB@LABEL@38_20
.BB@LABEL@38_6:	; switch_clause_bb104
	;***      953 : 		case 0:
	;***      954 : 			if (DrainageAcidAndAlkalineTankStart_nostop() == 0) {
	;***      955 : 				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***      956 : 				(*state)++;
	;***      957 : 			}
	;***      958 : 			break;
	;***      959 : 		case 1:
	;***      960 : 			if (ns_delay_ms(tick, 15 * 1000)) {
	;***      961 : 				(*state)++;
	;***      962 : 			}
	;***      963 : 			break;
	;***      964 : 		case 2:
	;***      965 : 			if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      966 : 					|| (g_io_status.refined.FlowValue
	;***      967 : 							> g_numberSetting.upperFlow)) {
	;***      968 : 				(*state)--;
	;***      969 : 				rx_count++;
	;***      970 : 			} else {
	;***      971 : 				(*state)++;
	;***      972 : 			}
	;***      973 : 			(*tick) = g_systemTime;
	;***      974 : 			break;
	;***      975 : 		case 3:
	;***      976 : 			if (ns_delay_ms(tick, 10 * 1000)) {
	;***      977 : 				electrolyticOperationON();
	;***      978 : 				(*state)++;
	;***      979 : 			}
	;***      980 : 			break;
	;***      981 : 		case 4:
	;***      982 : 			if (isAcidTankFull() && isAlkalineTankFull()) {
	;***      983 : 				electrolyticOperationOFF();
	;***      984 : 				(*state)++;
	;***      985 : 			}
	;***      986 : 			break;
	;***      987 : 		default:
	;***      988 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 988
	clrb !LOWW(_g_machine_state+0x00009)
	;***      989 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 989
	clrb !LOWW(_g_machine_state+0x0000E)
	br $.BB@LABEL@38_16
.BB@LABEL@38_7:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 954
	call $!_DrainageAcidAndAlkalineTankStart_nostop
	cmp0 a
	bnz $.BB@LABEL@38_16
.BB@LABEL@38_8:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 955
	set1 0xFFF01.7
	br $.BB@LABEL@38_10
.BB@LABEL@38_9:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 960
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_16
.BB@LABEL@38_10:	; if_then_bb24
	inc !LOWW(_g_machine_state+0x00009)
	br $.BB@LABEL@38_16
.BB@LABEL@38_11:	; switch_clause_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 965
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
	bnz $.BB@LABEL@38_14
.BB@LABEL@38_12:	; bb
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
	bnz $.BB@LABEL@38_14
.BB@LABEL@38_13:	; bb40.thread
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 971
	inc a
	mov !LOWW(_g_machine_state+0x00009), a
	br $.BB@LABEL@38_15
.BB@LABEL@38_14:	; bb40
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 968
	dec a
	mov !LOWW(_g_machine_state+0x00009), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 969
	inc !LOWW(_rx_count)
.BB@LABEL@38_15:	; if_break_bb54
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
.BB@LABEL@38_16:	; return
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 999
	ret
.BB@LABEL@38_17:	; switch_clause_bb57
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 976
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_16
.BB@LABEL@38_18:	; if_then_bb63
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 977
	call $!_electrolyticOperationON
.BB@LABEL@38_19:	; if_then_bb63
	br $.BB@LABEL@38_10
.BB@LABEL@38_20:	; switch_clause_bb68
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 982
	call $!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@38_16
.BB@LABEL@38_21:	; bb73
	call $!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@38_16
.BB@LABEL@38_22:	; if_then_bb86
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 983
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@38_23:	; if_then_bb86.bb96_crit_edge
	oneb a
.BB@LABEL@38_24:	; bb96
	mov !LOWW(_g_machine_state+0x00008), a
	br $.BB@LABEL@38_19
.BB@LABEL@38_25:	; if_else_bb106
	;***      990 : 			break;
	;***      991 : 		}
	;***      992 : 	} else if ((g_TimeKeeper.electrolyteOff_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 992
	mov a, !LOWW(_g_TimeKeeper@1)
	shrw ax, 8+0x00000
	movw de, ax
	clrw ax
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, de
	sknz
.BB@LABEL@38_26:	; if_else_bb106
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@38_27:	; if_else_bb106
	bc $.BB@LABEL@38_16
.BB@LABEL@38_28:	; bb112
	cmp0 !LOWW(_g_machine_state+0x0000A)
	bz $.BB@LABEL@38_16
.BB@LABEL@38_29:	; bb112
	cmp0 b
	bnz $.BB@LABEL@38_16
.BB@LABEL@38_30:	; if_then_bb137
	;***      993 : 			>= g_timerSetting.t6_drainageOffTime_h)
	;***      994 : 			&& (g_machine_state.isMidNight != 0)
	;***      995 : 			&& (g_machine_state.mode == INDIE)) {
	;***      996 : 		g_machine_state.mode = DRAINAGE_MODE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 996
	mov !LOWW(_g_machine_state+0x0000E), #0x0A
	br $.BB@LABEL@38_15
_NormalMode_nostop:
	.STACK _NormalMode_nostop = 6
	;***      997 : 		(*tick) = g_systemTime;
	;***      998 : 	}
	;***      999 : }
	;***     1000 : /*!
	;***     1001 :  * Tested!
	;***     1002 :  */
	;***     1003 : void NormalMode_nostop(void) {
	;***     1004 : 	if ((g_machine_state.mode != BUSY)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1004
	mov a, !LOWW(_g_machine_state+0x0000E)
	mov x, a
	add a, #0xF9
	cmp a, #0x02
	bc $.BB@LABEL@39_3
.BB@LABEL@39_1:	; entry
	mov a, x
	cmp a, #0x09
	bz $.BB@LABEL@39_3
.BB@LABEL@39_2:	; entry
	cmp a, #0x0A
	bnz $.BB@LABEL@39_7
.BB@LABEL@39_3:	; if_else_bb
	mov a, x
	;***     1005 : 			&& (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1006 : 			&& (g_machine_state.mode != CALLAN_MODE)
	;***     1007 : 			&& (g_machine_state.mode != DRAINAGE_MODE)) {
	;***     1008 : 		userAuthHandler_nostop();
	;***     1009 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***     1010 : 	} else if (g_machine_state.mode == BUSY) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1010
	cmp a, #0x07
	bnz $.BB@LABEL@39_6
.BB@LABEL@39_4:	; if_then_bb44
	;***     1011 : 		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1011
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
	bz $.BB@LABEL@39_6
.BB@LABEL@39_5:	; if_then_bb52
	;***     1012 : 				g_timerSetting.t55_waterDischargeDelay_s * 1000)) {
	;***     1013 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1013
	clrb !LOWW(_g_machine_state+0x0000E)
	;***     1014 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1014
	clrb !LOWW(_g_machine_state+0x0000D)
.BB@LABEL@39_6:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1017
	ret
.BB@LABEL@39_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1008
	call $!_userAuthHandler_nostop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1009
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00028), ax
	ret
_TestPowerOn_nostop_keepstate:
	.STACK _TestPowerOn_nostop_keepstate = 8
	;***     1015 : 		}
	;***     1016 : 	}
	;***     1017 : }
	;***     1018 : /*!
	;***     1019 :  * Power ON test mode, state 0 - 1, end at 2
	;***     1020 :  * @param state: Machine state
	;***     1021 :  * @param tick: Tick for no stop delay
	;***     1022 :  * @return 0 when done
	;***     1023 :  */
	;***     1024 : uint8_t TestPowerOn_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1024
	push ax
	movw hl, ax
	push bc
	pop de
	;***     1025 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1025
	mov a, [hl]
	cmp0 a
	bz $.BB@LABEL@40_5
.BB@LABEL@40_1:	; entry
	dec a
	bnz $.BB@LABEL@40_4
.BB@LABEL@40_2:	; switch_clause_bb69
	;***     1026 : 	case 0:
	;***     1027 : 		O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 = O_SPOUT_ACID_PIN_SV3 =
	;***     1028 : 		O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 = O_DRAIN_ALK_PIN_SV6 =
	;***     1029 : 		O_DRAIN_ALK_PIN_SV6 = OPTION_1_PIN_SV8 = OPTION_2_PIN_SV9 = ON;
	;***     1030 : 		O_PUMP_SALT_PIN_SP1 = ON;
	;***     1031 : 		(*tick) = g_systemTime;
	;***     1032 : 		break;
	;***     1033 : 	case 1:
	;***     1034 : 		if (ns_delay_ms(tick, 30 * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1034
	movw ax, de
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@40_4
.BB@LABEL@40_3:	; if_then_bb
	movw de, #0xFF06
	;***     1035 : 			O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1035
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
	;***     1036 : 			O_SPOUT_ACID_PIN_SV3 =
	;***     1037 : 			O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 =
	;***     1038 : 			O_DRAIN_ALK_PIN_SV6 =
	;***     1039 : 			O_DRAIN_ALK_PIN_SV6 = OPTION_1_PIN_SV8 =
	;***     1040 : 			OPTION_2_PIN_SV9 = OFF;
	;***     1041 : 			O_PUMP_SALT_PIN_SP1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1041
	clr1 [hl].0
	pop hl
	push hl
	;***     1042 : 			(*state)++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1042
	inc [hl+0x00]
.BB@LABEL@40_4:	; if_then_bb
	br $.BB@LABEL@40_6
.BB@LABEL@40_5:	; switch_clause_bb
	movw hl, #0xFF06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1027
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1030
	set1 [hl].0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1031
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@40_6:	; switch_break_bb
	pop de
	push de
	;***     1043 : 		}
	;***     1044 : 		break;
	;***     1045 : 	default:
	;***     1046 : 		break;
	;***     1047 : 	}
	;***     1048 : 	return (*state) == 2 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1048
	mov a, [de]
	cmp a, #0x02
	oneb a
	skz
.BB@LABEL@40_7:	; switch_break_bb
	clrb a
.BB@LABEL@40_8:	; switch_break_bb
	pop hl
	ret
_FlowRateAdjustmentMode_nostop_keepstate:
	.STACK _FlowRateAdjustmentMode_nostop_keepstate = 8
	;***     1049 : }
	;***     1050 : uint8_t FlowRateAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1050
	push bc
	push ax
	;***     1051 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1051
	call $!_measureFlowSensor_nostop
	pop de
	push de
	;***     1052 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1052
	mov a, [de]
	add a, #0xFE
	bz $.BB@LABEL@41_6
.BB@LABEL@41_1:	; entry
	dec a
	bz $.BB@LABEL@41_7
.BB@LABEL@41_2:	; entry
	dec a
	bz $.BB@LABEL@41_9
.BB@LABEL@41_3:	; entry
	dec a
	bnz $.BB@LABEL@41_11
.BB@LABEL@41_4:	; switch_clause_bb30
	movw ax, [sp+0x02]
	;***     1053 : 	case 2:
	;***     1054 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***     1055 : 		(*state)++;
	;***     1056 : 		(*tick) = g_systemTime;
	;***     1057 : 		break;
	;***     1058 : 	case 3:
	;***     1059 : 		if (ns_delay_ms(tick, 30 * 1000)) {
	;***     1060 : 			O_SUPPLY_WATER_PIN_SV1 = ON;
	;***     1061 : 			(*state)++;
	;***     1062 : 		}
	;***     1063 : 		break;
	;***     1064 : 	case 4:
	;***     1065 : 		if (ns_delay_ms(tick, 500)) {
	;***     1066 : 			(*state)++;
	;***     1067 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***     1068 : 		}
	;***     1069 : 		break;
	;***     1070 : 	case 5:
	;***     1071 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1071
	movw de, #0x0009
	movw bc, #0x6258
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@41_11
.BB@LABEL@41_5:	; if_then_bb36
	pop hl
	push hl
	inc [hl+0x00]
	br $.BB@LABEL@41_11
.BB@LABEL@41_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1054
	set1 0xFFF05.5
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1055
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1056
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
	br $.BB@LABEL@41_11
.BB@LABEL@41_7:	; switch_clause_bb11
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1059
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@41_11
.BB@LABEL@41_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1060
	set1 0xFFF01.7
	br $.BB@LABEL@41_5
.BB@LABEL@41_9:	; switch_clause_bb19
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1065
	movw de, #0x0000
	movw bc, #0x01F4
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@41_11
.BB@LABEL@41_10:	; if_then_bb25
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1066
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1067
	clr1 0xFFF05.5
.BB@LABEL@41_11:	; switch_break_bb
	pop de
	push de
	;***     1072 : 				(uint32_t) 15 * 1000 + (uint32_t) 10 * 60 * 1000)) {
	;***     1073 : 			(*state)++;
	;***     1074 : 		}
	;***     1075 : 		break;
	;***     1076 : 	default:
	;***     1077 : 		break;
	;***     1078 : 	}
	;***     1079 : 	return (*state) == 6 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1079
	mov a, [de]
	cmp a, #0x06
	oneb a
	skz
.BB@LABEL@41_12:	; switch_break_bb
	clrb a
.BB@LABEL@41_13:	; switch_break_bb
	addw sp, #0x04
	ret
_CurrentAdjustmentMode_nostop_keepstate:
	.STACK _CurrentAdjustmentMode_nostop_keepstate = 8
	;***     1080 : }
	;***     1081 : uint8_t CurrentAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1081
	movw de, ax
	push bc
	push ax
	;***     1082 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1082
	mov a, [de]
	add a, #0xFA
	bz $.BB@LABEL@42_5
.BB@LABEL@42_1:	; entry
	dec a
	bz $.BB@LABEL@42_6
.BB@LABEL@42_2:	; entry
	dec a
	bnz $.BB@LABEL@42_8
.BB@LABEL@42_3:	; switch_clause_bb18
	movw ax, [sp+0x02]
	;***     1083 : 	case 6:
	;***     1084 : 		electrolyticOperationON();
	;***     1085 : 		(*state)++;
	;***     1086 : 		break;
	;***     1087 : 	case 7:
	;***     1088 : 		if (ElectrolyticOperation_nostop()) {
	;***     1089 : 			(*state)++;
	;***     1090 : 			(*tick) = g_systemTime;
	;***     1091 : 		}
	;***     1092 : 		break;
	;***     1093 : 	case 8:
	;***     1094 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1094
	movw de, #0x0009
	movw bc, #0x6258
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@42_8
.BB@LABEL@42_4:	; if_then_bb24
	pop hl
	push hl
	inc [hl+0x00]
	br $.BB@LABEL@42_8
.BB@LABEL@42_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1084
	call $!_electrolyticOperationON
	br $.BB@LABEL@42_4
.BB@LABEL@42_6:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1088
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bz $.BB@LABEL@42_8
.BB@LABEL@42_7:	; if_then_bb
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1089
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1090
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@42_8:	; switch_break_bb
	pop de
	push de
	;***     1095 : 				(uint32_t) 15 * 1000 + (uint32_t) 10 * 60 * 1000)) {
	;***     1096 : 			(*state)++;
	;***     1097 : 		}
	;***     1098 : 		break;
	;***     1099 : 	default:
	;***     1100 : 		break;
	;***     1101 : 	}
	;***     1102 : 	return (*state) == 9 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1102
	mov a, [de]
	cmp a, #0x09
	oneb a
	skz
.BB@LABEL@42_9:	; switch_break_bb
	clrb a
.BB@LABEL@42_10:	; switch_break_bb
	addw sp, #0x04
	ret
_ElectrolyteAdjustmentOperation:
	.STACK _ElectrolyteAdjustmentOperation = 8
	;***     1103 : }
	;***     1104 : uint8_t ElectrolyteAdjustmentOperation(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1104
	movw de, ax
	push ax
	push bc
	;***     1105 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1105
	mov a, [de]
	add a, #0xF7
	bz $.BB@LABEL@43_4
.BB@LABEL@43_1:	; entry
	dec a
	bz $.BB@LABEL@43_5
.BB@LABEL@43_2:	; entry
	dec a
	bnz $.BB@LABEL@43_11
.BB@LABEL@43_3:	; switch_clause_bb42
	movw ax, [sp+0x00]
	;***     1106 : 	case 9:
	;***     1107 : 		electrolyticOperationON();
	;***     1108 : 		(*state)++;
	;***     1109 : 		break;
	;***     1110 : 	case 10:
	;***     1111 : 		if (isAcidTankFull() && isAlkalineTankFull()) {
	;***     1112 : 			electrolyticOperationOFF();
	;***     1113 : 			(*tick) = g_systemTime;
	;***     1114 : 			(*state)++;
	;***     1115 : 		}
	;***     1116 : 		break;
	;***     1117 : 	case 11:
	;***     1118 : 		if (ns_delay_ms(tick, (uint32_t) 10 * 60 * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1118
	movw de, #0x0009
	movw bc, #0x27C0
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@43_10
	br $.BB@LABEL@43_11
.BB@LABEL@43_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1107
	call $!_electrolyticOperationON
	br $.BB@LABEL@43_10
.BB@LABEL@43_5:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1111
	call $!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@43_11
.BB@LABEL@43_6:	; bb
	call $!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@43_11
.BB@LABEL@43_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1112
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@43_8:	; if_then_bb.bb32_crit_edge
	oneb a
.BB@LABEL@43_9:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1113
	movw bc, !LOWW(_g_systemTime+0x00002)
	pop de
	push de
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@43_10:	; switch_break_bb.PartialDrain
	movw ax, [sp+0x02]
	movw hl, ax
	inc [hl+0x00]
.BB@LABEL@43_11:	; switch_break_bb
	movw ax, [sp+0x02]
	movw de, ax
	;***     1119 : 			(*state)++;
	;***     1120 : 		}
	;***     1121 : 		break;
	;***     1122 : 	default:
	;***     1123 : 		break;
	;***     1124 : 	}
	;***     1125 : 	return (*state);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1125
	mov a, [de]
	;***     1126 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1126
	addw sp, #0x04
	ret
_TestOperation_nostop:
	.STACK _TestOperation_nostop = 4
	;***     1127 : void TestOperation_nostop(void) {
	;***     1128 : 	uint8_t *state = &g_machine_state.test;
	;***     1129 : 	uint32_t *tick = &g_Tick.tickTestOperation;
	;***     1130 : 	switch (commnunication_flag.test_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1130
	mov a, !LOWW(_commnunication_flag+0x00009)
	add a, #0xE3
	bz $.BB@LABEL@44_5
.BB@LABEL@44_1:	; entry
	dec a
	bz $.BB@LABEL@44_6
.BB@LABEL@44_2:	; entry
	dec a
	bz $.BB@LABEL@44_7
.BB@LABEL@44_3:	; entry
	cmp a, #0x02
	bnz $.BB@LABEL@44_10
.BB@LABEL@44_4:	; switch_clause_bb33
	;***     1131 : 	case TEST_POWER_ON:
	;***     1132 : 		if (TestPowerOn_nostop_keepstate(state, &g_Tick.tickTestOperation)) {
	;***     1133 : 			commnunication_flag.test_flag = 0;
	;***     1134 : 			*state = 0;
	;***     1135 : 		}
	;***     1136 : 		break;
	;***     1137 : 	case TEST_FLOW_RATE:
	;***     1138 : 		if (FlowRateAdjustmentMode_nostop_keepstate(state, tick)) {
	;***     1139 : 			commnunication_flag.test_flag = 0;
	;***     1140 : 			*state = 0;
	;***     1141 : 		}
	;***     1142 : 		break;
	;***     1143 : 	case TEST_CURRENT:
	;***     1144 : 		if (CurrentAdjustmentMode_nostop_keepstate(state, tick)) {
	;***     1145 : 			commnunication_flag.test_flag = 0;
	;***     1146 : 			*state = 0;
	;***     1147 : 		}
	;***     1148 : 		break;
	;***     1149 : 	case TEST_INDIVIDUAL:
	;***     1150 : 
	;***     1151 : 		break;
	;***     1152 : 	case TEST_ELECTROLYTIC:
	;***     1153 : 		if (ElectrolyteAdjustmentOperation(state, tick)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1153
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_ElectrolyteAdjustmentOperation
	br $.BB@LABEL@44_8
.BB@LABEL@44_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1132
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_TestPowerOn_nostop_keepstate
	br $.BB@LABEL@44_8
.BB@LABEL@44_6:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1138
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_FlowRateAdjustmentMode_nostop_keepstate
	br $.BB@LABEL@44_8
.BB@LABEL@44_7:	; switch_clause_bb21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1144
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_CurrentAdjustmentMode_nostop_keepstate
.BB@LABEL@44_8:	; switch_clause_bb21
	cmp0 a
	bz $.BB@LABEL@44_10
.BB@LABEL@44_9:	; if_then_bb41
	clrb !LOWW(_commnunication_flag+0x00009)
	clrb !LOWW(_g_machine_state+0x0000B)
.BB@LABEL@44_10:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1161
	ret
_NeutralizationTreatment:
	.STACK _NeutralizationTreatment = 10
	;***     1154 : 			commnunication_flag.test_flag = 0;
	;***     1155 : 			*state = 0;
	;***     1156 : 		}
	;***     1157 : 		break;
	;***     1158 : 	default:
	;***     1159 : 		break;
	;***     1160 : 	}
	;***     1161 : }
	;***     1162 : void NeutralizationTreatment(uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1162
	subw sp, #0x04
	movw hl, ax
	;***     1163 : 	if (g_neutralization_time_s
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1163
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
.BB@LABEL@45_1:	; entry
	cmpw ax, !LOWW(_g_neutralization_time_s)
.BB@LABEL@45_2:	; entry
	bh $.BB@LABEL@45_4
.BB@LABEL@45_3:	; if_then_bb
	;***     1164 : 			>= g_timerSetting.t33_t63_neutralizationStartTime_h * 60 * 60) {
	;***     1165 : 		g_machine_state.neutrlization = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1165
	oneb !LOWW(_g_machine_state+0x0000C)
	;***     1166 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1166
	set1 0xFFF06.5
	clrw ax
	;***     1167 : 		g_neutralization_time_s = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1167
	movw !LOWW(_g_neutralization_time_s+0x00002), ax
	movw !LOWW(_g_neutralization_time_s), ax
.BB@LABEL@45_4:	; if_break_bb
	;***     1168 : 	}
	;***     1169 : 	if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1169
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
	bz $.BB@LABEL@45_7
.BB@LABEL@45_5:	; bb
	cmp0 !LOWW(_g_machine_state+0x0000C)
	bz $.BB@LABEL@45_7
.BB@LABEL@45_6:	; if_then_bb24
	;***     1170 : 			g_timerSetting.t34_t64_neutralizationOpenTime_s * 1000)
	;***     1171 : 			&& (g_machine_state.neutrlization != 0)) {
	;***     1172 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1172
	set1 0xFFF06.5
	;***     1173 : 		g_machine_state.neutrlization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1173
	clrb !LOWW(_g_machine_state+0x0000C)
.BB@LABEL@45_7:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1176
	ret
_main_loop_20211111:
	.STACK _main_loop_20211111 = 4
	;***     1174 : 	}
	;***     1175 : 
	;***     1176 : }
	;***     1177 : void main_loop_20211111(void) {
	;***     1178 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1178
	call $!_measureFlowSensor_nostop
	;***     1179 : 	DrainageMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1179
	call $!_DrainageMode_nostop
	;***     1180 : 	ElectrolyzeWaterGeneration_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1180
	call $!_ElectrolyzeWaterGeneration_nostop
	;***     1181 : 	CallanCleaningMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1181
	call $!_CallanCleaningMode_nostop
	;***     1182 : 	NormalMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1182
	br $!_NormalMode_nostop
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***     1183 : }
	;***     1184 : 
	;***     1185 : /**
	;***     1186 :  * 30/11/2021: Checked by An
	;***     1187 :  */
	;***     1188 : void electrolyticOperationON(void) {
	;***     1189 : 	//Electrolytic operation ON
	;***     1190 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1190
	set1 0xFFF01.7
	;***     1191 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1191
	set1 0xFFF0E.2
	;***     1192 : 	O_PUMP_SALT_PIN_SP1 = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1192
	set1 0xFFF06.0
	;***     1193 : 	g_machine_state.electrolyteOperation = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1193
	oneb !LOWW(_g_machine_state+0x00007)
	;***     1194 : 	g_TimeKeeper.electrolyteOff_h = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1194
	clrb !LOWW(_g_TimeKeeper@1)
	;***     1195 : 	g_TimeKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1195
	movw bc, !LOWW(_g_TimeKeeper@1+0x00004)
	movw ax, !LOWW(_g_TimeKeeper@1+0x00002)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@47_3
.BB@LABEL@47_1:	; entry
	bc $.BB@LABEL@47_3
.BB@LABEL@47_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@47_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TimeKeeper@1+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_TimeKeeper@1+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1198
	ret
_isElectrolyticOperationOFF_nostop:
	.STACK _isElectrolyticOperationOFF_nostop = 6
	;***     1196 : 			g_TimeKeeper.neutralization == 0 ?
	;***     1197 : 					g_systemTime : g_TimeKeeper.neutralization;
	;***     1198 : }
	;***     1199 : void isElectrolyticOperationOFF_nostop(void) {
	;***     1200 : 	uint8_t *state = &g_machine_state.electrolyteOFF;
	;***     1201 : 	uint32_t *tick = &g_Tick.tickElectrolyticOff;
	;***     1202 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1202
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	bz $.BB@LABEL@48_6
.BB@LABEL@48_1:	; entry
	dec a
	.bz $!.BB@LABEL@48_15
.BB@LABEL@48_2:	; entry
	dec a
	bnz $.BB@LABEL@48_5
.BB@LABEL@48_3:	; switch_clause_bb43
	;***     1203 : 	case 0:
	;***     1204 : 		// Set g_machine_state.electrolyteOFF = 1 to start OFF
	;***     1205 : 		// This case run when electrolyte is ON or already OFF
	;***     1206 : 		if (ns_delay_ms(tick, (uint32_t) 60000 * 60)
	;***     1207 : 				&& g_machine_state.electrolyteOperation == 0) {
	;***     1208 : 			sendToRasPi_u32(H_READ, MID_NIGHT, 0x00);
	;***     1209 : 			g_TimeKeeper.electrolyteOff_h++;
	;***     1210 : 		} else if (g_machine_state.electrolyteOperation == 1) {
	;***     1211 : 			if (ns_delay_ms(&g_TimeKeeper.neutralization, 1000)) {
	;***     1212 : 				g_neutralization_time_s++;
	;***     1213 : 			}
	;***     1214 : 			(*tick) = g_systemTime;
	;***     1215 : 		}
	;***     1216 : 		break;
	;***     1217 : 	case 1:
	;***     1218 : 		g_TimeKeeper.neutralization = 0;
	;***     1219 : 		O_CVCC_ON_PIN = OFF;
	;***     1220 : 		O_PUMP_SALT_PIN_SP1 = OFF; //SP1
	;***     1221 : 		(*state)++;
	;***     1222 : 		break;
	;***     1223 : 	case 2:
	;***     1224 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1224
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
	bz $.BB@LABEL@48_5
.BB@LABEL@48_4:	; if_then_bb51
	;***     1225 : 				g_timerSetting.t5_electrolysisStopDelay_s * 1000)) {
	;***     1226 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1226
	clrb !LOWW(_g_machine_state+0x00008)
	;***     1227 : 			O_SUPPLY_WATER_PIN_SV1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1227
	clr1 0xFFF01.7
	;***     1228 : 			g_machine_state.electrolyteOperation = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1228
	clrb !LOWW(_g_machine_state+0x00007)
.BB@LABEL@48_5:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1235
	ret
.BB@LABEL@48_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1206
	movw de, #0x0036
	movw bc, #0xEE80
	movw ax, #LOWW(_g_Tick+0x00044)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@48_9
.BB@LABEL@48_7:	; bb
	cmp0 !LOWW(_g_machine_state+0x00007)
	bnz $.BB@LABEL@48_9
.BB@LABEL@48_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1208
	clrw ax
	movw de, ax
	movw ax, #0x521C
	call !!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1209
	inc !LOWW(_g_TimeKeeper@1)
	ret
.BB@LABEL@48_9:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1210
	cmp !LOWW(_g_machine_state+0x00007), #0x01
	bnz $.BB@LABEL@48_5
.BB@LABEL@48_10:	; if_then_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1211
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_TimeKeeper@1+0x00002)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@48_14
.BB@LABEL@48_11:	; if_then_bb31
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1212
	addw ax, !LOWW(_g_neutralization_time_s)
	movw !LOWW(_g_neutralization_time_s), ax
	clrw ax
	sknc
.BB@LABEL@48_12:	; if_then_bb31
	incw ax
.BB@LABEL@48_13:	; if_then_bb31
	addw ax, !LOWW(_g_neutralization_time_s+0x00002)
	movw !LOWW(_g_neutralization_time_s+0x00002), ax
.BB@LABEL@48_14:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1214
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	ret
.BB@LABEL@48_15:	; switch_clause_bb39
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1218
	movw !LOWW(_g_TimeKeeper@1+0x00004), ax
	movw !LOWW(_g_TimeKeeper@1+0x00002), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1219
	clr1 0xFFF0E.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1220
	clr1 0xFFF06.0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1221
	inc !LOWW(_g_machine_state+0x00008)
	ret
_realTimeResponse:
	.STACK _realTimeResponse = 4
	;***     1229 : 		}
	;***     1230 : 		break;
	;***     1231 : 	default:
	;***     1232 : 		break;
	;***     1233 : 	}
	;***     1234 : 
	;***     1235 : }
	;***     1236 : void realTimeResponse(void) {
	;***     1237 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1237
	call $!_UpdateMachineStatus
	;***     1238 : 	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1238
	call !!_RaspberryResponse_nostop
	;***     1239 : 	isElectrolyticOperationOFF_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1239
	call $!_isElectrolyticOperationOFF_nostop
	;***     1240 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1240
	call !!_R_WDT_Restart
	;***     1241 : 	if (ns_delay_ms(&g_Tick.tickCustom[0], 200)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1241
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick+0x00088)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	sknz
.BB@LABEL@49_1:	; return
	;***     1242 : 		P6_bit.no3 = ~P6_bit.no3;
	;***     1243 : 
	;***     1244 : 	}
	;***     1245 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1245
	ret
.BB@LABEL@49_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1242
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***     1246 : float measureFlowSensor(uint32_t *s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1246
	push ax
	subw sp, #0x0C
	;***     1247 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1247
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
.BB@LABEL@50_1:	; bb27
	movw ax, [sp+0x0C]
	movw de, ax
	;***     1248 : 	float flow_pluse = 0.0;
	;***     1249 : 	uint8_t flow_pulse_state = I_OFF;
	;***     1250 : 	while (!ns_delay_ms(&stamp_flow_sensor, (*s) * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1250
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
	bnz $.BB@LABEL@50_7
.BB@LABEL@50_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***     1251 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1251
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@50_6
.BB@LABEL@50_3:	; if_then_bb
	;***     1252 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1252
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@50_5
.BB@LABEL@50_4:	; if_then_bb20
	movw ax, #0x3F80
	;***     1253 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1253
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
.BB@LABEL@50_5:	; if_break_bb
	;***     1254 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1254
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@50_6:	; if_break_bb26
	;***     1255 : 		}
	;***     1256 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1256
	call !!_R_WDT_Restart
	br $.BB@LABEL@50_1
.BB@LABEL@50_7:	; bb40
	movw ax, #0x3F33
	;***     1257 : 	}
	;***     1258 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1258
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
	;***     1259 : 	return g_io_status.refined.FlowValue;
	;***     1260 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1260
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***     1261 : 
	;***     1262 : uint8_t _pre_flow_state = I_OFF;
	;***     1263 : float _flow_pulse;
	;***     1264 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1264
	subw sp, #0x04
	;***     1265 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***     1266 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***     1267 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1267
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@51_4
.BB@LABEL@51_1:	; entry
	dec a
	bz $.BB@LABEL@51_5
.BB@LABEL@51_2:	; entry
	dec a
	bz $.BB@LABEL@51_12
.BB@LABEL@51_3:	; switch_clause_bb61
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@51_11
.BB@LABEL@51_4:	; switch_clause_bb
	;***     1268 : 	case 0:
	;***     1269 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1269
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@51_9
.BB@LABEL@51_5:	; switch_clause_bb14
	;***     1270 : 			(*state)++;
	;***     1271 : 		}
	;***     1272 : 		break;
	;***     1273 : 	case 1:
	;***     1274 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1274
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@51_8
.BB@LABEL@51_6:	; if_then_bb24
	;***     1275 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1275
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***     1276 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1276
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@51_8
.BB@LABEL@51_7:	; if_then_bb35
	movw ax, #0x3F80
	;***     1277 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1277
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
.BB@LABEL@51_8:	; if_break_bb39
	;***     1278 : 			}
	;***     1279 : 		}
	;***     1280 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1280
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0000A)
.BB@LABEL@51_9:	; if_break_bb39
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
.BB@LABEL@51_10:	; if_then_bb47
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@51_11:	; switch_break_bb
	;***     1281 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***     1282 : 			(*state)++;
	;***     1283 : 		}
	;***     1284 : 		break;
	;***     1285 : 	case 2:
	;***     1286 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***     1287 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***     1288 : 		_flow_pulse = 0;
	;***     1289 : 		(*state) = 0;
	;***     1290 : 		break;
	;***     1291 : 	default:
	;***     1292 : 		(*state) = 0;
	;***     1293 : 		break;
	;***     1294 : 	}
	;***     1295 : 	return g_io_status.refined.FlowValue;
	;***     1296 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1296
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@51_12:	; switch_clause_bb52
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1286
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1288
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@51_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***     1297 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1297
	push hl
	;***     1298 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1299 : 		pre_machine_washing_mode = g_machine_state.mode;
	;***     1300 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1300
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@52_2
.BB@LABEL@52_1:	; bb11
	clrb x
.BB@LABEL@52_2:	; bb12
	;***     1301 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1301
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@52_4
.BB@LABEL@52_3:	; bb28
	clrb c
.BB@LABEL@52_4:	; bb30
	;***     1302 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1302
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@52_6
.BB@LABEL@52_5:	; bb46
	clrb b
.BB@LABEL@52_6:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***     1303 : 	g_mean_io_status.refined.AcidLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1303
	mov a, 0xFFF07
	mov1 CY, a.2
	clrb a
	bc $.BB@LABEL@52_8
.BB@LABEL@52_7:	; bb63
	mov a, #0x10
	and a, !LOWW(_g_mean_io_status)
.BB@LABEL@52_8:	; bb70
	mov x, a
	mov a, #0xEF
	and a, !LOWW(_g_mean_io_status)
	or a, x
	mov c, a
	;***     1304 : 	I_ACID_M_PIN == I_ON ? g_mean_io_status.refined.AcidLowLevel : 0;
	;***     1305 : 	g_mean_io_status.refined.AcidHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1305
	mov a, 0xFFF07
	clrb x
	bt a.3, $.BB@LABEL@52_10
.BB@LABEL@52_9:	; bb86
	mov a, c
	and a, #0x20
	mov x, a
.BB@LABEL@52_10:	; bb93
	mov a, c
	clr1 a.5
	or a, x
	mov d, a
	;***     1306 : 	I_ACID_H_PIN == I_ON ? g_mean_io_status.refined.AcidHighLevel : 0;
	;***     1307 : 
	;***     1308 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1308
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@52_12
.BB@LABEL@52_11:	; bb109
	clrb x
.BB@LABEL@52_12:	; bb111
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***     1309 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1309
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@52_14
.BB@LABEL@52_13:	; bb126
	clrb b
.BB@LABEL@52_14:	; bb128
	mov a, c
	or a, x
	mov e, a
	;***     1310 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1310
	mov a, 0xFFF07
	mov c, #0x04
	bf a.0, $.BB@LABEL@52_16
.BB@LABEL@52_15:	; bb144
	clrb c
.BB@LABEL@52_16:	; bb146
	mov a, e
	or a, b
	mov e, a
	;***     1311 : 	g_mean_io_status.refined.AlkalineLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1311
	mov a, 0xFFF00
	clrb x
	bt a.6, $.BB@LABEL@52_18
.BB@LABEL@52_17:	; bb161
	mov a, d
	and a, #0x02
	mov x, a
.BB@LABEL@52_18:	; bb168
	mov a, d
	clr1 a.1
	or a, x
	mov b, a
	;***     1312 : 	I_ALKALI_M_PIN == I_ON ? g_mean_io_status.refined.AlkalineLowLevel : 0;
	;***     1313 : 	g_mean_io_status.refined.AlkalineHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1313
	mov a, 0xFFF07
	clrb x
	bt a.0, $.BB@LABEL@52_20
.BB@LABEL@52_19:	; bb183
	mov a, b
	and a, #0x04
	mov x, a
.BB@LABEL@52_20:	; bb190
	mov a, b
	clr1 a.2
	or a, x
	mov !LOWW(_g_mean_io_status), a
	;***     1314 : 	I_ALKALI_H_PIN == I_ON ? g_mean_io_status.refined.AlkalineHighLevel : 0;
	;***     1315 : 
	;***     1316 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1316
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@52_22
.BB@LABEL@52_21:	; bb206
	clrb b
.BB@LABEL@52_22:	; bb208
	mov a, e
	or a, c
	mov c, a
	;***     1317 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1317
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@52_24
.BB@LABEL@52_23:	; bb224
	clrb x
.BB@LABEL@52_24:	; bb226
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***     1318 : 
	;***     1319 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1319
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***     1320 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1320
	mov x, 0xFFF05
	;***     1321 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1321
	mov c, 0xFFF07
	;***     1322 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1322
	mov a, 0xFFF07
	mov h, a
	;***     1323 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1323
	mov a, [de]
	mov l, a
	;***     1324 : 	O_DRAIN_ACID_PIN_SV5;
	;***     1325 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1325
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1319
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1320
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1321
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1322
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1323
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***     1326 : 	O_DRAIN_ALK_PIN_SV6;
	;***     1327 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN_SV7;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1327
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1323
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1327
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1325
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1327
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***     1328 : 
	;***     1329 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1329
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***     1330 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1330
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***     1331 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN_SP1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1331
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***     1332 : }
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
__pre_flow_state:
	.DB 0x01
