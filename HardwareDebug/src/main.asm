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
#@  compiled at Tue Jan 04 16:29:03 2022

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
	;***       29 : union IO_Status_u g_io_status, g_mean_io_status;
	;***       30 : 
	;***       31 : struct Timer_Setting_s _settingTime;
	;***       32 : struct Number_Setting_s _settingNumber;
	;***       33 : uint8_t g_machine_mode, g_machine_test_mode;
	;***       34 : union BytesToDouble {
	;***       35 : 	struct {
	;***       36 : 		uint8_t data[4];
	;***       37 : 	} refined;
	;***       38 : 	uint32_t raw;
	;***       39 : } btod;
	;***       40 : struct Tick_s g_Tick;
	;***       41 : 
	;***       42 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 42
	mov !LOWW(_g_color), a
	;***       43 : 	g_color = color;
	;***       44 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 44
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       45 : 		switch (color) {
	;***       46 : 		case RED:
	;***       47 : 			O_HS_ICL_PIN = 1;
	;***       48 : 			O_HS_IDA_PIN = 0;
	;***       49 : 			break;
	;***       50 : 		case BLUE:
	;***       51 : 			O_HS_ICL_PIN = 0;
	;***       52 : 			O_HS_IDA_PIN = 0;
	;***       53 : 			break;
	;***       54 : 		case WHITE:
	;***       55 : 			O_HS_ICL_PIN = 0;
	;***       56 : 			O_HS_IDA_PIN = 1;
	;***       57 : 			break;
	;***       58 : 		default:
	;***       59 : 			O_HS_ICL_PIN = 1;
	;***       60 : 			O_HS_IDA_PIN = 1;
	;***       61 : 			break;
	;***       62 : 		}
	;***       63 : 		g_pre_color = g_color;
	;***       64 : 	}
	;***       65 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 45
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 59
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 47
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 48
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 51
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 52
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 55
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 63
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_handSensorLEDBlink:
	.STACK _handSensorLEDBlink = 6
	;***       66 : void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	push hl
	mov [sp+0x00], a
	;***       67 : 	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	movw ax, #LOWW(_g_Tick+0x0000C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; return
	;***       68 : 		g_color = g_color == color ? BLACK : color;
	;***       69 : 		handSensorLED(g_color);
	;***       70 : 	}
	;***       71 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	pop hl
	ret
.BB@LABEL@2_2:	; if_then_bb
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	cmp a, !LOWW(_g_color)
	sknz
.BB@LABEL@2_3:	; if_then_bb.bb15_crit_edge
	clrb a
.BB@LABEL@2_4:	; bb15
	mov !LOWW(_g_color), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	pop hl
	br $_handSensorLED
_setting_default:
	.STACK _setting_default = 4
	;***       72 : void setting_default(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw ax, #0x4086
	;***       73 : 	g_numberSetting.upperVoltage1 = 4.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x6666
	movw !LOWW(_g_numberSetting), ax
	movw ax, #0x4060
	;***       74 : 	g_numberSetting.upperVoltage2 = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_numberSetting+0x00006), ax
	;***       75 : 	g_numberSetting.upperVoltage3 = 2.2;
	;***       76 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       77 : 	g_numberSetting.upperCurrent = 4.3;
	;***       78 : 	g_numberSetting.lowerCurrent = 0.2;
	;***       79 : 	g_numberSetting.upperFlow = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***       80 : 	g_numberSetting.lowerFlow = 0.4;
	;***       81 : 
	;***       82 : 	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       83 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       84 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       85 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       86 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***       87 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***       88 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***       89 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***       90 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***       91 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
	movw !LOWW(_g_timerSetting+0x00072), ax
	;***       92 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	movw !LOWW(_g_timerSetting+0x00076), ax
	;***       93 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 93
	movw !LOWW(_g_timerSetting+0x0007A), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_numberSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F00
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw ax, #0x4089
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_numberSetting+0x00016), ax
	mov x, #0xCC
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00008), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00028), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x00038), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x00030), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x00034), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x00040), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
	movw !LOWW(_g_timerSetting+0x00070), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	movw !LOWW(_g_timerSetting+0x00074), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 93
	movw !LOWW(_g_timerSetting+0x00078), ax
	ret
_isAcidTankFull:
	.STACK _isAcidTankFull = 6
	;***       94 : }
	;***       95 : 
	;***       96 : uint8_t isAcidTankFull(void) {
	;***       97 : 	if (I_ACID_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 97
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@4_5
.BB@LABEL@4_1:	; if_then_bb
	;***       98 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 98
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 109
	ret
.BB@LABEL@4_4:	; if_then_bb25
	;***       99 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***      100 : 				|| (g_mean_io_status.refined.AcidHighLevel == 1)) {
	;***      101 : 			g_mean_io_status.refined.AcidHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 101
	set1 !LOWW(_g_mean_io_status).5
	;***      102 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 102
	oneb a
	ret
.BB@LABEL@4_5:	; if_else_bb
	;***      103 : 		}
	;***      104 : 	} else {
	;***      105 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 105
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00062), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00060), ax
	;***      106 : 		g_mean_io_status.refined.AcidHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 106
	clr1 !LOWW(_g_mean_io_status).5
	br $.BB@LABEL@4_3
_isAcidTankAlmostFull:
	.STACK _isAcidTankAlmostFull = 6
	;***      107 : 	}
	;***      108 : 	return 0;
	;***      109 : }
	;***      110 : uint8_t isAcidTankAlmostFull(void) {
	;***      111 : 	if (I_ACID_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 111
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@5_5
.BB@LABEL@5_1:	; if_then_bb
	;***      112 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 112
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 123
	ret
.BB@LABEL@5_4:	; if_then_bb25
	;***      113 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      114 : 				|| (g_mean_io_status.refined.AcidLowLevel == 1)) {
	;***      115 : 			g_mean_io_status.refined.AcidLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 115
	set1 !LOWW(_g_mean_io_status).4
	;***      116 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 116
	oneb a
	ret
.BB@LABEL@5_5:	; if_else_bb
	;***      117 : 		}
	;***      118 : 	} else {
	;***      119 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 119
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00066), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00064), ax
	;***      120 : 		g_mean_io_status.refined.AcidLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 120
	clr1 !LOWW(_g_mean_io_status).4
	br $.BB@LABEL@5_3
_isAcidTankHasSomething:
	.STACK _isAcidTankHasSomething = 6
	;***      121 : 	}
	;***      122 : 	return 0;
	;***      123 : }
	;***      124 : uint8_t isAcidTankHasSomething(void) {
	;***      125 : 	if (I_ACID_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 125
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@6_5
.BB@LABEL@6_1:	; if_then_bb
	;***      126 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 126
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 137
	ret
.BB@LABEL@6_4:	; if_then_bb25
	;***      127 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      128 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 1)) {
	;***      129 : 			g_mean_io_status.refined.AcidEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	set1 !LOWW(_g_mean_io_status).3
	;***      130 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	oneb a
	ret
.BB@LABEL@6_5:	; if_else_bb
	;***      131 : 		}
	;***      132 : 	} else {
	;***      133 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00068), ax
	;***      134 : 		isAcidTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	call $!_isAcidTankEmpty
	br $.BB@LABEL@6_3
_isAcidTankEmpty:
	.STACK _isAcidTankEmpty = 6
	;***      135 : 	}
	;***      136 : 	return 0;
	;***      137 : }
	;***      138 : uint8_t isAcidTankEmpty(void) {
	;***      139 : 	if (I_ACID_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 139
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@7_2
.BB@LABEL@7_1:	; if_else_bb
	;***      140 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
	;***      141 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      142 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 0)) {
	;***      143 : 			g_mean_io_status.refined.AcidEmptyLevel = 0;
	;***      144 : 			return 1;
	;***      145 : 		}
	;***      146 : 	} else {
	;***      147 : 		g_Tick.tickAcidLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0006C), ax
	;***      148 : 		isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	call $!_isAcidTankHasSomething
	br $.BB@LABEL@7_4
.BB@LABEL@7_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 140
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 151
	ret
.BB@LABEL@7_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	clr1 !LOWW(_g_mean_io_status).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	oneb a
	ret
_isAlkalineTankFull:
	.STACK _isAlkalineTankFull = 6
	;***      149 : 	}
	;***      150 : 	return 0;
	;***      151 : }
	;***      152 : uint8_t isAlkalineTankFull(void) {
	;***      153 : 	if (I_ALKALI_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@8_5
.BB@LABEL@8_1:	; if_then_bb
	;***      154 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 154
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 165
	ret
.BB@LABEL@8_4:	; if_then_bb25
	;***      155 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***      156 : 				|| (g_mean_io_status.refined.AlkalineHighLevel == 1)) {
	;***      157 : 			g_mean_io_status.refined.AlkalineHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	set1 !LOWW(_g_mean_io_status).2
	;***      158 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	oneb a
	ret
.BB@LABEL@8_5:	; if_else_bb
	;***      159 : 		}
	;***      160 : 	} else {
	;***      161 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 161
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00072), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00070), ax
	;***      162 : 		g_mean_io_status.refined.AlkalineHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	clr1 !LOWW(_g_mean_io_status).2
	br $.BB@LABEL@8_3
_isAlkalineTankAlmostFull:
	.STACK _isAlkalineTankAlmostFull = 6
	;***      163 : 	}
	;***      164 : 	return 0;
	;***      165 : }
	;***      166 : uint8_t isAlkalineTankAlmostFull(void) {
	;***      167 : 	if (I_ALKALI_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 167
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@9_5
.BB@LABEL@9_1:	; if_then_bb
	;***      168 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
	ret
.BB@LABEL@9_4:	; if_then_bb25
	;***      169 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      170 : 				|| (g_mean_io_status.refined.AlkalineLowLevel == 1)) {
	;***      171 : 			g_mean_io_status.refined.AlkalineLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	set1 !LOWW(_g_mean_io_status).1
	;***      172 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	oneb a
	ret
.BB@LABEL@9_5:	; if_else_bb
	;***      173 : 		}
	;***      174 : 	} else {
	;***      175 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00076), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00074), ax
	;***      176 : 		g_mean_io_status.refined.AlkalineLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
	clr1 !LOWW(_g_mean_io_status).1
	br $.BB@LABEL@9_3
_isAlkalineTankHasSomething:
	.STACK _isAlkalineTankHasSomething = 6
	;***      177 : 	}
	;***      178 : 	return 0;
	;***      179 : }
	;***      180 : uint8_t isAlkalineTankHasSomething(void) {
	;***      181 : 	if (I_ALKALI_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@10_5
.BB@LABEL@10_1:	; if_then_bb
	;***      182 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 182
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 193
	ret
.BB@LABEL@10_4:	; if_then_bb25
	;***      183 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      184 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 1)) {
	;***      185 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	set1 !LOWW(_g_mean_io_status).0
	;***      186 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 186
	oneb a
	ret
.BB@LABEL@10_5:	; if_else_bb
	;***      187 : 		}
	;***      188 : 	} else {
	;***      189 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 189
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00078), ax
	;***      190 : 		isAlkalineTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 190
	call $!_isAlkalineTankEmpty
	br $.BB@LABEL@10_3
_isAlkalineTankEmpty:
	.STACK _isAlkalineTankEmpty = 6
	;***      191 : 	}
	;***      192 : 	return 0;
	;***      193 : }
	;***      194 : uint8_t isAlkalineTankEmpty(void) {
	;***      195 : 	if (I_ALKALI_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_else_bb
	;***      196 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
	;***      197 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      198 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 0)) {
	;***      199 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 0;
	;***      200 : 			return 1;
	;***      201 : 		}
	;***      202 : 	} else {
	;***      203 : 		g_Tick.tickAlkalineLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 203
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0007E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0007C), ax
	;***      204 : 		isAlkalineTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	call $!_isAlkalineTankHasSomething
	br $.BB@LABEL@11_4
.BB@LABEL@11_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 207
	ret
.BB@LABEL@11_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	clr1 !LOWW(_g_mean_io_status).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	oneb a
	ret
_sendToRasPi_f:
	.STACK _sendToRasPi_f = 6
	;***      205 : 	}
	;***      206 : 	return 0;
	;***      207 : }
	;***      208 : 
	;***      209 : //----------------------Begin code 11112021--------------------------------------
	;***      210 : void sendToRasPi_f(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	push hl
	;***      211 : 		float value) {
	;***      212 : 	uint8_t state = g_uart2_sendend;
	;***      213 : 	g_control_buffer_f.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
	mov !LOWW(_g_control_buffer_f), a
	mov a, x
	;***      214 : 	g_control_buffer_f.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	mov !LOWW(_g_control_buffer_f+0x00001), a
	movw ax, bc
	;***      215 : 	g_control_buffer_f.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	movw !LOWW(_g_control_buffer_f+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_f+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      216 : 	R_UART2_Send((uint8_t*) &g_control_buffer_f, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_f)
	call !!_R_UART2_Send
.BB@LABEL@12_1:	; bb9
	mov a, [sp+0x00]
	;***      217 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 217
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@12_1
.BB@LABEL@12_2:	; return
	;***      218 : 		;
	;***      219 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	pop hl
	ret
_sendToRasPi_u32:
	.STACK _sendToRasPi_u32 = 6
	;***      220 : void sendToRasPi_u32(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 220
	push hl
	;***      221 : 		uint32_t value) {
	;***      222 : 	uint8_t state = g_uart2_sendend;
	;***      223 : 	g_control_buffer_u32.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	mov !LOWW(_g_control_buffer_u32), a
	mov a, x
	;***      224 : 	g_control_buffer_u32.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 224
	mov !LOWW(_g_control_buffer_u32+0x00001), a
	movw ax, bc
	;***      225 : 	g_control_buffer_u32.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	movw !LOWW(_g_control_buffer_u32+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_u32+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      226 : 	R_UART2_Send((uint8_t*) &g_control_buffer_u32, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 226
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_u32)
	call !!_R_UART2_Send
.BB@LABEL@13_1:	; bb9
	mov a, [sp+0x00]
	;***      227 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@13_1
.BB@LABEL@13_2:	; return
	;***      228 : 		;
	;***      229 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	pop hl
	ret
_sendRS485:
	.STACK _sendRS485 = 6
	;***      230 : struct UART3_Buffer_s {
	;***      231 : 	uint8_t busy;
	;***      232 : 	uint8_t head; // 1 byte
	;***      233 : 	uint8_t set_number; // 1 byte
	;***      234 : 	uint8_t set_value[4]; // 4 byte
	;***      235 : } water_solfner_buf;
	;***      236 : void sendRS485(uint8_t busy, uint8_t head, uint8_t type, uint32_t value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
	push hl
	;***      237 : 	uint8_t state = g_uart3_sendend;
	;***      238 : 	btod.raw = value;
	;***      239 : 	water_solfner_buf.busy = busy;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
	mov !LOWW(_water_solfner_buf), a
	mov a, x
	;***      240 : 	water_solfner_buf.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	mov !LOWW(_water_solfner_buf+0x00001), a
	mov a, c
	;***      241 : 	water_solfner_buf.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	mov !LOWW(_water_solfner_buf+0x00002), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	movw ax, [sp+0x08]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 238
	movw !LOWW(_btod+0x00002), ax
	movw ax, [sp+0x06]
	movw !LOWW(_btod), ax
	clrb a
.BB@LABEL@14_1:	; bb
	mov b, a
	;***      242 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      243 : 		water_solfner_buf.set_value[i] = btod.refined.data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 243
	mov a, LOWW(_btod)[b]
	mov LOWW(_water_solfner_buf+0x00003)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 242
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@14_1
.BB@LABEL@14_2:	; bb25
	;***      244 : 	}
	;***      245 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 245
	set1 0xFFF00.0
	;***      246 : 	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	movw bc, #0x0007
	movw ax, #LOWW(_water_solfner_buf)
	call !!_R_UART3_Send
.BB@LABEL@14_3:	; bb28
	mov a, [sp+0x00]
	;***      247 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@14_3
.BB@LABEL@14_4:	; return
	;***      248 : 		;
	;***      249 : 
	;***      250 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	pop hl
	ret
_sendR485_7byte:
	.STACK _sendR485_7byte = 16
	;***      251 : void sendR485_7byte(uint8_t addr, uint8_t head, uint8_t *val5) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	subw sp, #0x0A
	mov h, a
	push bc
	pop de
	;***      252 : 	uint8_t buf[7] = { addr, head };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 252
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
	;***      253 : 	uint8_t state = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x07], a
.BB@LABEL@15_1:	; bb
	movw ax, sp
	movw [sp+0x08], ax
	mov a, b
	add a, #0x02
	mov c, a
	;***      254 : 	for (uint8_t i = 2; i < 7; i++) {
	;***      255 : 		buf[i] = val5[i - 2];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	shrw ax, 8+0x00000
	addw ax, de
	decw ax
	decw ax
	movw hl, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	inc b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	mov a, [hl]
	mov h, a
	movw ax, [sp+0x08]
	xchw ax, hl
	mov [hl+c], a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	cmp a, #0x05
	bnz $.BB@LABEL@15_1
.BB@LABEL@15_2:	; bb31
	;***      256 : 	}
	;***      257 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
	set1 0xFFF00.0
	;***      258 : 	R_UART3_Send(buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	movw bc, #0x0007
	movw ax, sp
	call !!_R_UART3_Send
.BB@LABEL@15_3:	; bb35
	mov a, [sp+0x07]
	;***      259 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@15_3
.BB@LABEL@15_4:	; return
	;***      260 : 		;
	;***      261 : 
	;***      262 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	addw sp, #0x0A
	ret
_isThisCommand:
	.STACK _isThisCommand = 6
	;***      263 : uint8_t isThisCommand(uint8_t *input_buf, enum UART_header_e header,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
	push hl
	movw hl, ax
	mov a, b
	mov [sp+0x00], a
	clrb a
	mov b, a
.BB@LABEL@16_1:	; bb
	;***      264 : 		enum Control_status control, uint32_t data) {
	;***      265 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      266 : 		btod.refined.data[i] = input_buf[2 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	shrw ax, 8+0x00000
	addw ax, hl
	incw ax
	incw ax
	movw de, ax
	mov a, [de]
	mov LOWW(_btod)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@16_1
.BB@LABEL@16_2:	; bb23
	mov a, c
	;***      267 : 	}
	;***      268 : 
	;***      269 : 	if ((input_buf[0] == header) && (input_buf[1] == control)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 269
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
	;***      270 : 			&& (btod.raw == data))
	;***      271 : 		return 2;
	;***      272 : 	else if ((input_buf[0] == header) && (input_buf[1] == control))
	;***      273 : 		return 1;
	;***      274 : 	else
	;***      275 : 		return 0;
	;***      276 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	mov a, #0x02
	bz $.BB@LABEL@16_9
.BB@LABEL@16_7:	; bb70
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 272
	cmp a, [hl+0x01]
	oneb a
	skz
.BB@LABEL@16_8:	; bb70
	clrb a
.BB@LABEL@16_9:	; bb70
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	ret
.BB@LABEL@16_10:	; if_else_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	clrb a
	br $.BB@LABEL@16_9
_RaspberryResponse_nostop:
	.STACK _RaspberryResponse_nostop = 10
	;***      277 : /**
	;***      278 :  * Handle all response to Raspberry command.
	;***      279 :  */
	;***      280 : uint8_t *const time_setting_p = (uint8_t*) &_settingTime;
	;***      281 : uint8_t *const number_setting_p = (uint8_t*) &_settingNumber;
	;***      282 : struct UART_Buffer_float_s test_control_buf = { H_READ, READ_TIME, 0x000000ff };
	;***      283 : void RaspberryResponse_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	push hl
	;***      284 : 	//TODO: I'm doing here
	;***      285 : 	if (commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	cmp0 !LOWW(_commnunication_flag)
	bz $.BB@LABEL@17_7
.BB@LABEL@17_1:	; if_then_bb
	;***      286 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 286
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      287 : 		if (g_machine_state.user == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	cmp !LOWW(_g_machine_state+0x0000D), #0x02
	sknz
.BB@LABEL@17_2:	; if_then_bb20
	;***      288 : 			g_machine_state.user = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	oneb !LOWW(_g_machine_state+0x0000D)
.BB@LABEL@17_3:	; if_break_bb
	;***      289 : 		}
	;***      290 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@17_4:	; bb22
	mov a, [sp+0x00]
	;***      291 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_6
.BB@LABEL@17_5:	; bb
	;***      292 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_4
.BB@LABEL@17_6:	; bb30
	;***      293 : 		}
	;***      294 : 		commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
	clrb !LOWW(_commnunication_flag)
.BB@LABEL@17_7:	; if_break_bb31
	;***      295 : 	}
	;***      296 : 	if (commnunication_flag.send_response_mode_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
	cmp !LOWW(_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@17_9
.BB@LABEL@17_8:	; if_then_bb37
	;***      297 : 		sendToRasPi_u32(H_READ, WASHING_MODE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
	mov a, !LOWW(_g_machine_mode)
	clrb x
	movw de, ax
	clrw bc
	movw ax, #0x5218
	call $!_sendToRasPi_u32
	;***      298 : 				(uint32_t) g_machine_mode << (8 * 3));
	;***      299 : //		sendToRasPi_u32(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
	;***      300 : 		commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 300
	clrb !LOWW(_commnunication_flag+0x00006)
.BB@LABEL@17_9:	; if_break_bb41
	;***      301 : 	}
	;***      302 : 	if (commnunication_flag.send_respone_status_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
	cmp0 !LOWW(_commnunication_flag+0x00005)
	bz $.BB@LABEL@17_14
.BB@LABEL@17_10:	; if_then_bb47
	;***      303 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      304 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	movw bc, #0x0011
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@17_11:	; bb53
	mov a, [sp+0x00]
	;***      305 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_13
.BB@LABEL@17_12:	; bb52
	;***      306 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 306
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_11
.BB@LABEL@17_13:	; bb61
	;***      307 : 		}
	;***      308 : 		commnunication_flag.send_respone_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 308
	clrb !LOWW(_commnunication_flag+0x00005)
.BB@LABEL@17_14:	; if_break_bb62
	;***      309 : 	}
	;***      310 : 	if (commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 310
	cmp0 !LOWW(_commnunication_flag+0x00001)
	bz $.BB@LABEL@17_19
.BB@LABEL@17_15:	; if_then_bb68
	;***      311 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      312 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 312
	mov c, #0x94
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00094), a
	;***      313 : 				timeSettingSize - 1);
	;***      314 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 314
	movw bc, #0x0095
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@17_16:	; bb79
	mov a, [sp+0x00]
	;***      315 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_18
.BB@LABEL@17_17:	; bb78
	;***      316 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 316
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_16
.BB@LABEL@17_18:	; bb87
	;***      317 : 		}
	;***      318 : 		commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 318
	clrb !LOWW(_commnunication_flag+0x00001)
.BB@LABEL@17_19:	; if_break_bb88
	;***      319 : 	}
	;***      320 : 	if (commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 320
	cmp0 !LOWW(_commnunication_flag+0x00002)
	bz $.BB@LABEL@17_24
.BB@LABEL@17_20:	; if_then_bb94
	;***      321 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 321
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      322 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 322
	mov c, #0x24
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00024), a
	;***      323 : 				numberSettingSize - 1);
	;***      324 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 324
	movw bc, #0x0025
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@17_21:	; bb105
	mov a, [sp+0x00]
	;***      325 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_23
.BB@LABEL@17_22:	; bb104
	;***      326 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 326
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_21
.BB@LABEL@17_23:	; bb113
	;***      327 : 		}
	;***      328 : 		commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 328
	clrb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@17_24:	; if_break_bb114
	;***      329 : 	}
	;***      330 : 	if (commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 330
	cmp !LOWW(_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@17_40
.BB@LABEL@17_25:	; if_break_bb114.bb171_crit_edge
	clrb a
	mov b, a
.BB@LABEL@17_26:	; bb171
	;***      331 : //		//Do not Edit this, must keep!!!!
	;***      332 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 332
	cmp a, #0x94
	bnc $.BB@LABEL@17_36
.BB@LABEL@17_27:	; bb121
	;***      333 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 333
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
	;***      334 : //			case 3:
	;***      335 : //				pointer0[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
	;***      336 : //				break;
	;***      337 : //			case 2:
	;***      338 : //				pointer0[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
	;***      339 : //				break;
	;***      340 : //			case 1:
	;***      341 : //				pointer0[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
	;***      342 : //				break;
	;***      343 : //			case 0:
	;***      344 : //				pointer0[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
	;***      345 : //				break;
	;***      346 : //			default:
	;***      347 : //				break;
	;***      348 : 			case 3:
	;***      349 : 				time_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 349
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFD)
.BB@LABEL@17_31:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@17_35
.BB@LABEL@17_32:	; switch_clause_bb135
	;***      350 : 				break;
	;***      351 : 			case 2:
	;***      352 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 352
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@17_31
.BB@LABEL@17_33:	; switch_clause_bb146
	;***      353 : 				break;
	;***      354 : 			case 1:
	;***      355 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 355
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@17_35
.BB@LABEL@17_34:	; switch_clause_bb157
	;***      356 : 				break;
	;***      357 : 			case 0:
	;***      358 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 358
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@17_35:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@17_26
.BB@LABEL@17_36:	; bb180
	;***      359 : 				break;
	;***      360 : 			default:
	;***      361 : 				break;
	;***      362 : 			}
	;***      363 : 		}
	;***      364 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 364
	mov a, !LOWW(_g_rx_data+0x00094)
	mov [sp+0x00], a
	mov !LOWW(__settingTime+0x00094), a
	;***      365 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 365
	mov c, #0x94
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp x, a
	bnz $.BB@LABEL@17_38
.BB@LABEL@17_37:	; if_then_bb203
	;***      366 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
	;***      367 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 367
	movw de, #0x0096
	movw bc, #LOWW(__settingTime)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	clrw ax
	;***      368 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 368
	push ax
	mov x, #0x95
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      369 : 					timeSettingSize);
	;***      370 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 370
	clrb x
	br $.BB@LABEL@17_39
.BB@LABEL@17_38:	; if_else_bb
	;***      371 : 		} else {
	;***      372 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 372
	mov x, #0x16
.BB@LABEL@17_39:	; if_else_bb
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi_f
	;***      373 : 		}
	;***      374 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      375 : 		commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 375
	clrb !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@17_40:	; if_break_bb207
	;***      376 : 	}
	;***      377 : 
	;***      378 : 	if (commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 378
	cmp !LOWW(_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@17_56
.BB@LABEL@17_41:	; if_break_bb207.bb266_crit_edge
	clrb a
	mov b, a
.BB@LABEL@17_42:	; bb266
	;***      379 : //		//Do not Edit this, must keep!!!!
	;***      380 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 380
	cmp a, #0x24
	bnc $.BB@LABEL@17_52
.BB@LABEL@17_43:	; bb214
	;***      381 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 381
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
	;***      382 : 			case 3:
	;***      383 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 383
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@17_47:	; switch_clause_bb218
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@17_51
.BB@LABEL@17_48:	; switch_clause_bb229
	;***      384 : 				break;
	;***      385 : 			case 2:
	;***      386 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 386
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@17_47
.BB@LABEL@17_49:	; switch_clause_bb240
	;***      387 : 				break;
	;***      388 : 			case 1:
	;***      389 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 389
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@17_51
.BB@LABEL@17_50:	; switch_clause_bb251
	;***      390 : 				break;
	;***      391 : 			case 0:
	;***      392 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 392
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@17_51:	; switch_break_bb263
	inc b
	mov a, b
	br $.BB@LABEL@17_42
.BB@LABEL@17_52:	; bb275
	;***      393 : 				break;
	;***      394 : 			default:
	;***      395 : 				break;
	;***      396 : 			}
	;***      397 : 		}
	;***      398 : 		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 398
	mov c, #0x24
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov !LOWW(__settingNumber+0x00024), a
	;***      399 : 				numberSettingSize - 1);
	;***      400 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 400
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
	;***      401 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      402 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 402
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call $!_sendToRasPi_f
	;***      403 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 403
	movw de, #0x0026
	movw bc, #LOWW(__settingNumber)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	clrw ax
	;***      404 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 404
	push ax
	mov x, #0x25
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      405 : 					numberSettingSize);
	;***      406 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 406
	clrb x
	br $.BB@LABEL@17_55
.BB@LABEL@17_54:	; if_else_bb300
	;***      407 : 		} else {
	;***      408 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 408
	mov x, #0x16
.BB@LABEL@17_55:	; if_else_bb300
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi_f
	;***      409 : 		}
	;***      410 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      411 : 		commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 411
	clrb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@17_56:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 413
	ret
_InitialOperationModeStart_nostop:
	.STACK _InitialOperationModeStart_nostop = 4
	;***      412 : 	}
	;***      413 : }
	;***      414 : /**
	;***      415 :  * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
	;***      416 :  * 13/12/2021: Checked!
	;***      417 :  * @return: 0 - Done; 1 - Not done
	;***      418 :  */
	;***      419 : uint8_t InitialOperationModeStart_nostop(void) {
	;***      420 : //	O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7; // Turn on SV5 if ACID tank empty
	;***      421 : //	O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6; // Turn on SV6 if ALK tank empty
	;***      422 : 	O_DRAIN_ACID_PIN_SV5 = isAcidTankEmpty() ? OFF : ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 422
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
	;***      423 : 	O_DRAIN_ALK_PIN_SV6 = isAlkalineTankEmpty() ? OFF : ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 423
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
	;***      424 : //	return (!isAcidTankEmpty() || !isAcidTankEmpty());
	;***      425 : 	return !(O_DRAIN_ACID_PIN_SV5 == OFF && O_DRAIN_ALK_PIN_SV6 == OFF);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 425
	mov a, 0xFFF06
	bt a.7, $.BB@LABEL@18_6
.BB@LABEL@18_5:	; bb34
	mov a, 0xFFF06
	shr a, 0x06
	and a, #0x01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 426
	ret
.BB@LABEL@18_6:	; bb50
	oneb a
	ret
_WaterSupplyOperation_nostop:
	.STACK _WaterSupplyOperation_nostop = 14
	;***      426 : }
	;***      427 : ///**
	;***      428 : // * FlowSensorCheck
	;***      429 : // * 30/11/2021: Checked!
	;***      430 : // * @return 0 is Error, 1 is OK, 2 Still taking
	;***      431 : // */
	;***      432 : //uint8_t FlowSensorCheck(uint32_t *_time) {
	;***      433 : ////	g_flow_value = measureFlowSensor();
	;***      434 : //	if ((g_flow_value < g_numberSetting.upperFlow)
	;***      435 : //			& (g_flow_value > g_numberSetting.lowerFlow)) {
	;***      436 : //		return 1;
	;***      437 : //	} else {
	;***      438 : //		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      439 : //		return 0;
	;***      440 : //	}
	;***      441 : //}
	;***      442 : /**
	;***      443 :  * WaterSupplyOperation
	;***      444 :  * 30/11/2021: Checked by An
	;***      445 :  */
	;***      446 : uint8_t WaterSupplyOperation_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 446
	subw sp, #0x06
	;***      447 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      448 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      449 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 449
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
	;***      450 : 	case 0:
	;***      451 : 		*tick = g_systemTime;
	;***      452 : 		(*state)++;
	;***      453 : 		break;
	;***      454 : 	case 1:
	;***      455 : 		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
	;***      456 : 		if (ns_delay_ms(tick, 30000)) {
	;***      457 : 			(*state)++;
	;***      458 : 		}
	;***      459 : 		break;
	;***      460 : 	case 2:
	;***      461 : 		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      462 : 		if (ns_delay_ms(tick, 500)) {
	;***      463 : 			(*state)++;
	;***      464 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      465 : 		}
	;***      466 : 		break;
	;***      467 : 	case 3:
	;***      468 : 		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      469 : 		if (ns_delay_ms(tick, 15000)) {
	;***      470 : 			(*state)++;
	;***      471 : 			g_machine_state.flowSensor = 0;
	;***      472 : 		}
	;***      473 : 		measureFlowSensor_nostop();
	;***      474 : 		break;
	;***      475 : 	case 4:
	;***      476 : 		measureFlowSensor(&g_timerSetting.t3_flowSensorMonitorTime_s);
	;***      477 : 		(*state)++;
	;***      478 : 		break;
	;***      479 : 	case 5:
	;***      480 : 		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      481 : 				|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      482 : 			(*state) = 3;
	;***      483 : 			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      484 : 					g_io_status.refined.FlowValue);
	;***      485 : 		} else
	;***      486 : 			(*state)++;
	;***      487 : 		g_Tick.tickWaterSupply = g_systemTime;
	;***      488 : 		break;
	;***      489 : 	case 6:
	;***      490 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply,
	;***      491 : 				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
	;***      492 : 			(*state)++;
	;***      493 : 		}
	;***      494 : 		break;
	;***      495 : 	default:
	;***      496 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 496
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@19_15
.BB@LABEL@19_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 451
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 452
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@19_15
.BB@LABEL@19_9:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 455
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 456
	clrw ax
	movw de, ax
	movw bc, #0x7530
	br $!.BB@LABEL@19_24
.BB@LABEL@19_10:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 461
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 462
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_15
.BB@LABEL@19_11:	; if_then_bb24
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 463
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 464
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00024), ax
	br $.BB@LABEL@19_15
.BB@LABEL@19_12:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 468
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 469
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_14
.BB@LABEL@19_13:	; if_then_bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 470
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 471
	clrb !LOWW(_g_machine_state+0x00005)
.BB@LABEL@19_14:	; if_break_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 473
	call $!_measureFlowSensor_nostop
.BB@LABEL@19_15:	; if_break_bb41
	br $.BB@LABEL@19_22
.BB@LABEL@19_16:	; switch_clause_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 476
	movw ax, #LOWW(_g_timerSetting+0x00008)
	call $!_measureFlowSensor
	br $.BB@LABEL@19_25
.BB@LABEL@19_17:	; switch_clause_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 480
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 486
	inc a
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@19_21
.BB@LABEL@19_20:	; if_then_bb64
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 482
	mov !LOWW(_g_machine_state+0x00004), #0x03
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 483
	movw ax, #0x4104
	call $!_sendToRasPi_f
.BB@LABEL@19_21:	; if_break_bb70
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 487
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
.BB@LABEL@19_22:	; if_break_bb70
	br $.BB@LABEL@19_26
.BB@LABEL@19_23:	; switch_clause_bb72
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 490
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
	;***      497 : 		break;
	;***      498 : 	}
	;***      499 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 499
	call !!_R_WDT_Restart
	;***      500 : //	if (*state == 6 + 1) {
	;***      501 : //		g_machine_state.flowSensor = 0;
	;***      502 : //		*state = 0;
	;***      503 : //		return 0;
	;***      504 : //	} else
	;***      505 : //		return 1;
	;***      506 : 	return (*state) == 0 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 506
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
	;***      507 : }
	;***      508 : void stop_waitAlarmConfirm(enum Control_status alarm, uint8_t timeout_s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 508
	subw sp, #0x04
	push ax
	;***      509 : 	uint32_t _tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@20_1:	; bb23
	mov a, [sp+0x01]
	;***      510 : 	while (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 510
	cmp a, !LOWW(_commnunication_flag+0x00007)
	bz $.BB@LABEL@20_4
.BB@LABEL@20_2:	; bb
	;***      511 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 511
	call $!_realTimeResponse
	mov a, [sp+0x00]
	;***      512 : 		if ((ns_delay_ms(&_tick, timeout_s * 1000)) && (timeout_s != 0)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 512
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
	;***      513 : 			break;
	;***      514 : 		}
	;***      515 : 	}
	;***      516 : 	commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 516
	clrb !LOWW(_commnunication_flag+0x00007)
	addw sp, #0x06
	ret
_nostop_waitAlarmConfirm:
	.STACK _nostop_waitAlarmConfirm = 4
	;***      517 : }
	;***      518 : uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 518
	cmp a, !LOWW(_commnunication_flag+0x00007)
	;***      519 : 	if (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 519
	bnz $.BB@LABEL@21_2
.BB@LABEL@21_1:	; if_break_bb
	;***      520 : 		return 1;
	;***      521 : 	}
	;***      522 : 	commnunication_flag.alarm_clear_flag = OK_ALL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 522
	clrb !LOWW(_commnunication_flag+0x00007)
	;***      523 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 523
	clrb a
	ret
.BB@LABEL@21_2:	; bb9
	;***      524 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
	oneb a
	ret
_resetAlarm:
	.STACK _resetAlarm = 4
	;***      525 : void resetAlarm(void) {
	;***      526 : 	commnunication_flag.alarm_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
	oneb !LOWW(_commnunication_flag+0x00007)
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      527 : }
	;***      528 : 
	;***      529 : /**
	;***      530 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      531 :  * 30/11/2021: Checked by An
	;***      532 :  * @return 0 - OK; 1 - Error
	;***      533 :  */
	;***      534 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 534
	subw sp, #0x0A
	;***      535 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 535
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
	;***      536 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 536
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 550
	ret
.BB@LABEL@23_8:	; if_then_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      537 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      538 : 			resetAlarm();
	;***      539 : 			sendToRasPi_f(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 539
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4105
	call $!_sendToRasPi_f
	;***      540 : 					g_io_status.refined.CVCCVoltage);
	;***      541 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 541
	set1 !LOWW(_g_alarm).0
	;***      542 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 542
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@23_9:	; if_then_bb11.bb23_crit_edge
	oneb a
.BB@LABEL@23_10:	; bb23
	mov !LOWW(_g_machine_state+0x00008), a
	;***      543 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 543
	movw ax, #0x0500
	call $!_stop_waitAlarmConfirm
	;***      544 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	clr1 !LOWW(_g_alarm).0
	;***      545 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 545
	oneb a
	br $.BB@LABEL@23_7
.BB@LABEL@23_11:	; if_else_bb
	;***      546 : 		}
	;***      547 : 	} else
	;***      548 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 548
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	br $.BB@LABEL@23_6
_Voltage2Check_nostop:
	.STACK _Voltage2Check_nostop = 18
	;***      549 : 	return 0;
	;***      550 : }
	;***      551 : /**
	;***      552 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      553 :  * 16/12/2021: Checked by An
	;***      554 :  * @return 0 - OK
	;***      555 :  */
	;***      556 : void Voltage2Check_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 556
	subw sp, #0x0A
	;***      557 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 557
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
	;***      558 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 558
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
	;***      559 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      560 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 560
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      561 : 					>= g_numberSetting.upperVoltage1)) {
	;***      562 : 				resetAlarm();
	;***      563 : 				g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 563
	set1 !LOWW(_g_alarm).1
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      564 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 564
	movw ax, #0x4106
	addw sp, #0x0A
	br $!_sendToRasPi_f
.BB@LABEL@24_8:	; if_else_bb
	;***      565 : 						g_io_status.refined.CVCCVoltage);
	;***      566 : 			}
	;***      567 : 		}
	;***      568 : 	} else {
	;***      569 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 569
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      570 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 570
	clr1 !LOWW(_g_alarm).1
.BB@LABEL@24_9:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 572
	ret
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      571 : 	}
	;***      572 : }
	;***      573 : /**
	;***      574 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      575 :  * 16/12/2021: Checked by An
	;***      576 :  * @return 0 - OK; 1 - Error
	;***      577 :  */
	;***      578 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 578
	subw sp, #0x0A
	;***      579 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 579
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
	;***      580 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 580
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
	;***      581 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      582 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 582
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      583 : 					>= g_numberSetting.upperVoltage2)) {
	;***      584 : 				resetAlarm();
	;***      585 : 				g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 585
	set1 !LOWW(_g_alarm).2
	;***      586 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 586
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      587 : //				g_machine_state.electrolyteOFF =
	;***      588 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      589 : //								1 : g_machine_state.electrolyteOFF;
	;***      590 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 590
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
	;***      591 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 591
	movw ax, #0x4107
	call $!_sendToRasPi_f
	;***      592 : 						g_io_status.refined.CVCCVoltage);
	;***      593 : 				stop_waitAlarmConfirm(OVER_VOLTAGE_3, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 593
	movw ax, #0x0700
	call $!_stop_waitAlarmConfirm
	;***      594 : 				g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 594
	clr1 !LOWW(_g_alarm).2
	;***      595 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 595
	oneb a
	br $.BB@LABEL@25_12
.BB@LABEL@25_10:	; if_else_bb
	;***      596 : 			}
	;***      597 : 		}
	;***      598 : 	} else {
	;***      599 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 599
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
.BB@LABEL@25_11:	; bb48
	clrb a
.BB@LABEL@25_12:	; bb48
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 602
	ret
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      600 : 	}
	;***      601 : 	return 0;
	;***      602 : }
	;***      603 : /**
	;***      604 :  * Checked 16/12/2021
	;***      605 :  * @return
	;***      606 :  */
	;***      607 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 607
	subw sp, #0x0A
	;***      608 : 	if ((g_systemTime - g_TimeKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 608
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
	;***      609 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      610 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 610
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
	;***      611 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 611
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 631
	ret
.BB@LABEL@26_13:	; if_then_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      612 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      613 : 				resetAlarm();
	;***      614 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 614
	set1 !LOWW(_g_alarm).5
	;***      615 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 615
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      616 : //				g_machine_state.electrolyteOFF =
	;***      617 : //						g_machine_state.electrolyteOFF == 0 ?
	;***      618 : //								1 : g_machine_state.electrolyteOFF;
	;***      619 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 619
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@26_14:	; if_then_bb20.bb32_crit_edge
	oneb a
.BB@LABEL@26_15:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	;***      620 : 				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 620
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4108
	call $!_sendToRasPi_f
	;***      621 : 						g_io_status.refined.CVCCVoltage);
	;***      622 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 622
	movw ax, #0x0800
	call $!_stop_waitAlarmConfirm
	;***      623 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 623
	clr1 !LOWW(_g_alarm).5
	;***      624 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 624
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
	;***      625 : 			}
	;***      626 : 		} else
	;***      627 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      628 : 	} else
	;***      629 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      630 : 	return 0;
	;***      631 : }
	;***      632 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 632
	subw sp, #0x0E
	;***      633 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 633
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      634 : 	const uint16_t _max_time = 10000;
	;***      635 : 	if (g_systemTime - g_TimeKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 635
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
	;***      636 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 636
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
	;***      637 : 				|| (g_io_status.refined.CVCCCurrent
	;***      638 : 						>= g_numberSetting.upperCurrent)) {
	;***      639 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 639
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
	;***      640 : 					&& (g_alarm.refined.overCurrent == 0)
	;***      641 : 					&& (g_io_status.refined.CVCCCurrent
	;***      642 : 							<= g_numberSetting.lowerCurrent)) {
	;***      643 : 				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 643
	movw ax, #0x4109
	call $!_sendToRasPi_f
.BB@LABEL@27_18:	; if_break_bb
	;***      644 : 						g_io_status.refined.CVCCCurrent);
	;***      645 : 			}
	;***      646 : 			g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 646
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
	;***      647 : 					g_io_status.refined.CVCCCurrent
	;***      648 : 							<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      649 : 
	;***      650 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 650
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
	;***      651 : 					>= g_numberSetting.upperCurrent) {
	;***      652 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 652
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_34
.BB@LABEL@27_30:	; if_then_bb88
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      653 : 					resetAlarm();
	;***      654 : 					g_alarm.refined.overCurrent = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 654
	set1 !LOWW(_g_alarm).3
	;***      655 : 					g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 655
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      656 : //					g_machine_state.electrolyteOFF =
	;***      657 : //							g_machine_state.electrolyteOFF == 0 ?
	;***      658 : //									1 : g_machine_state.electrolyteOFF;
	;***      659 : 					electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 659
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@27_31:	; if_then_bb88.bb102_crit_edge
	oneb a
.BB@LABEL@27_32:	; bb102
	mov !LOWW(_g_machine_state+0x00008), a
	;***      660 : 					sendToRasPi_f(H_ALARM, OVER_CURRENT,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 660
	movw bc, !LOWW(_g_io_status+0x0000E)
	movw de, !LOWW(_g_io_status+0x00010)
	movw ax, #0x410A
	call $!_sendToRasPi_f
	;***      661 : 							g_io_status.refined.CVCCCurrent);
	;***      662 : 					stop_waitAlarmConfirm(OVER_CURRENT, 10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 662
	movw ax, #0x0A0A
	call $!_stop_waitAlarmConfirm
	;***      663 : 					g_alarm.refined.overCurrent = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 663
	clr1 !LOWW(_g_alarm).3
	;***      664 : 					return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 664
	oneb a
	br $.BB@LABEL@27_35
.BB@LABEL@27_33:	; if_else_bb
	;***      665 : 				}
	;***      666 : 			} else {
	;***      667 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 667
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@27_34:	; bb117
	clrb a
.BB@LABEL@27_35:	; bb117
	addw sp, #0x0E
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 672
	ret
_ElectrolyticOperation_nostop:
	.STACK _ElectrolyticOperation_nostop = 4
	;***      668 : 			}
	;***      669 : 		}
	;***      670 : 	}
	;***      671 : 	return 0;
	;***      672 : }
	;***      673 : uint8_t ElectrolyticOperation_nostop(void) {
	;***      674 : 	uint8_t *state = &g_machine_state.electrolyteOperation;
	;***      675 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 675
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
	;***      676 : 	case 0:
	;***      677 : 		(*state)++;
	;***      678 : 		break;
	;***      679 : 	case 1:
	;***      680 : 		electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 680
	call $!_electrolyticOperationON
	;***      681 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 681
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	;***      682 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 682
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      683 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 683
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
	;***      684 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 684
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	;***      685 : 		g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 685
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
	br $.BB@LABEL@28_17
.BB@LABEL@28_6:	; switch_clause_bb16
	;***      686 : 		(*state)++;
	;***      687 : 		break;
	;***      688 : 	case 2:
	;***      689 : 		Voltage2Check_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 689
	call $!_Voltage2Check_nostop
	;***      690 : 		if (Voltage1Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 690
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_7:	; if_else_bb
	;***      691 : 			(*state)--;
	;***      692 : 			break;
	;***      693 : 
	;***      694 : 		} else if (Voltage3Check_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 694
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_8:	; if_else_bb35
	;***      695 : 			(*state)--;
	;***      696 : 			break;
	;***      697 : 		} else if (LowVoltageCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 697
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_9:	; if_else_bb46
	;***      698 : 			(*state)--;
	;***      699 : 			break;
	;***      700 : 		} else if (OverCurrentCheck_waitReset()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 700
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_10:	; if_else_bb57
	;***      701 : 			(*state)--;
	;***      702 : 			break;
	;***      703 : 		} else if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 703
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@28_15
.BB@LABEL@28_11:	; if_then_bb65
	;***      704 : 			g_alarm.refined.cvcc = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 704
	set1 !LOWW(_g_alarm).7
	;***      705 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 705
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      706 : 			g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 706
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@28_12:	; if_then_bb65.bb78_crit_edge
	oneb a
.BB@LABEL@28_13:	; bb78
	mov !LOWW(_g_machine_state+0x00008), a
	;***      707 : 					g_machine_state.electrolyteOFF == 0 ?
	;***      708 : 							1 : g_machine_state.electrolyteOFF;
	;***      709 : 			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 709
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi_f
	;***      710 : 			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 710
	movw ax, #0x1200
	call $!_stop_waitAlarmConfirm
	;***      711 : 			g_alarm.refined.cvcc = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 711
	clr1 !LOWW(_g_alarm).7
.BB@LABEL@28_14:	; if_then_bb
	dec !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@28_22
.BB@LABEL@28_15:	; if_break_bb92
	;***      712 : 			(*state)--;
	;***      713 : 			break;
	;***      714 : 		}
	;***      715 : 		if (isAcidTankFull() && isAlkalineTankFull())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 715
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
	;***      716 : 			(*state)++;
	;***      717 : 		break;
	;***      718 : 	case 3:
	;***      719 : 		g_machine_state.electrolyteOFF =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 719
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@28_19:	; switch_clause_bb115.bb125_crit_edge
	oneb a
.BB@LABEL@28_20:	; bb125
	mov !LOWW(_g_machine_state+0x00008), a
	br $!.BB@LABEL@28_4
.BB@LABEL@28_21:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 677
	inc a
	mov !LOWW(_g_machine_state+0x00007), a
.BB@LABEL@28_22:	; bb132
	;***      720 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      721 : 						1 : g_machine_state.electrolyteOFF;
	;***      722 : 		(*state) = 0;
	;***      723 : 		break;
	;***      724 : 	default:
	;***      725 : 		(*state) = 0;
	;***      726 : 		break;
	;***      727 : 	}
	;***      728 : 	return (*state) == 0 ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 728
	cmp0 !LOWW(_g_machine_state+0x00007)
	oneb a
	skz
.BB@LABEL@28_23:	; bb132
	clrb a
.BB@LABEL@28_24:	; bb132
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      729 : //	WAIT_RESET: electrolyticOperationON();
	;***      730 : //	g_Tick.tickVoltage1Check = g_systemTime;
	;***      731 : //	g_Tick.tickVoltage2Check = g_systemTime;
	;***      732 : //	g_Tick.tickVoltage3Check = g_systemTime;
	;***      733 : //	g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      734 : //	g_Tick.tickCurrentCheck = g_systemTime;
	;***      735 : //	do {
	;***      736 : //		realTimeResponse();
	;***      737 : //		if (Voltage1Check_waitReset())
	;***      738 : //			goto WAIT_RESET;
	;***      739 : //		Voltage2Check_nostop();
	;***      740 : //		if (Voltage3Check_waitReset())
	;***      741 : //			goto WAIT_RESET;
	;***      742 : //		if (LowVoltageCheck_waitReset())
	;***      743 : //			goto WAIT_RESET;
	;***      744 : //		if (OverCurrentCheck_waitReset())
	;***      745 : //			goto WAIT_RESET;
	;***      746 : //		//----------CVCC Alarm Input-----------------
	;***      747 : //		if (I_CVCC_ALARM_IN == I_ON) {
	;***      748 : //			g_alarm.refined.cvcc = 1;
	;***      749 : //			g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      750 : //			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	;***      751 : //			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	;***      752 : //			g_alarm.refined.cvcc = 0;
	;***      753 : //			goto WAIT_RESET;
	;***      754 : //		}
	;***      755 : //		R_WDT_Restart();
	;***      756 : //	} while (!isAcidTankFull() || !isAlkalineTankFull());
	;***      757 : //	g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      758 : }
	;***      759 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 759
	subw sp, #0x04
	;***      760 : 	uint32_t _time_count = 0;
	;***      761 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 761
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
	;***      762 : 			& (_time_count
	;***      763 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      764 : 		_time_count++;
	;***      765 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 765
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@29_5:	; if_break_bb
	;***      766 : 	}
	;***      767 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 767
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
	;***      768 : 		sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 768
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi_f
.BB@LABEL@29_9:	; return
	;***      769 : 	}
	;***      770 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 770
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      771 : void saltWaterTankFullCheck(void) {
	;***      772 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 772
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@30_2
.BB@LABEL@30_1:	; return
	;***      773 : 		sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      774 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	;***      775 : 		g_machine_state.electrolyteOFF =
	;***      776 : 				g_machine_state.electrolyteOFF == 0 ?
	;***      777 : 						1 : g_machine_state.electrolyteOFF;
	;***      778 : 	}
	;***      779 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 779
	ret
.BB@LABEL@30_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 773
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 774
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 775
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@30_3:	; if_then_bb.bb14_crit_edge
	oneb a
.BB@LABEL@30_4:	; bb14
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 779
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      780 : void saltWaterTankEmptyCheck(void) {
	;***      781 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 781
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@31_2
.BB@LABEL@31_1:	; if_then_bb
	;***      782 : 		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 782
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi_f
.BB@LABEL@31_2:	; return
	;***      783 : 	}
	;***      784 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 784
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      785 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 785
	movw de, #0xFF07
	;***      786 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 786
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
	;***      787 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      788 : 		sendToRasPi_f(H_ALARM, ACID_ERROR, 1);
	;***      789 : 
	;***      790 : 	}
	;***      791 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 791
	ret
.BB@LABEL@32_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 788
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi_f
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      792 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 792
	push hl
	;***      793 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 793
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
	;***      794 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      795 : 		sendToRasPi_f(H_ALARM, ALKALINE_ERROR, 1);
	;***      796 : 	}
	;***      797 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 797
	ret
.BB@LABEL@33_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 795
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi_f
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      798 : 
	;***      799 : uint8_t FilterReplacementCheck(void) {
	;***      800 : 
	;***      801 : 	return 0;
	;***      802 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 802
	clrb a
	ret
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      803 : 
	;***      804 : /**
	;***      805 :  * Tested: 10/12/2021 by Mr.An
	;***      806 :  */
	;***      807 : void WaterWashingMode_nostop(void) {
	;***      808 : 	uint8_t *state = &g_machine_state.water;
	;***      809 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      810 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 810
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
	;***      811 : 	case 0:
	;***      812 : 		g_machine_state.mode = WATER_WASHING;
	;***      813 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      814 : 		g_color = WHITE;
	;***      815 : 		*tick = g_systemTime;
	;***      816 : 		(*state)++;
	;***      817 : 		handSensorLED(g_color);
	;***      818 : 		break;
	;***      819 : 	case 1:
	;***      820 : 		if (ns_delay_ms(tick, 50)) {
	;***      821 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      822 : 			(*state)++;
	;***      823 : 		}
	;***      824 : 		break;
	;***      825 : 	case 2:
	;***      826 : 		if (DETECT_U == I_ON) {
	;***      827 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      828 : 			g_color = BLACK;
	;***      829 : 			(*state) = 0;
	;***      830 : 			g_machine_state.mode = BUSY;
	;***      831 : 			handSensorLED(g_color);
	;***      832 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      833 : 		}
	;***      834 : 		break;
	;***      835 : 	default:
	;***      836 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 836
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@35_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 812
	mov !LOWW(_g_machine_state+0x0000E), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 813
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 814
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 815
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 816
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 817
	mov a, #0x02
	br $!_handSensorLED
.BB@LABEL@35_5:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 820
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00018)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@35_9
.BB@LABEL@35_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 821
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call $!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 822
	inc !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@35_7:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 826
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@35_9
.BB@LABEL@35_8:	; if_then_bb27
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 827
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 828
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 829
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 830
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 831
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 832
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@35_9:	; return
	;***      837 : 		break;
	;***      838 : 	}
	;***      839 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 839
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***      840 : 
	;***      841 : /**
	;***      842 :  * Tested: 24/12/2021 by Mr.An
	;***      843 :  */
	;***      844 : void HandWashingMode_nostop(void) {
	;***      845 : 	uint8_t *state = &g_machine_state.handwash;
	;***      846 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      847 : 	const uint32_t delayPump_ms = 50;
	;***      848 : 	if ((*state) == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 848
	mov a, !LOWW(_g_machine_state+0x00003)
	mov d, a
	cmp0 a
	bnz $.BB@LABEL@36_10
.BB@LABEL@36_1:	; if_then_bb
	;***      849 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 849
	movw ax, !LOWW(_g_timerSetting+0x0007E)
	movw bc, ax
	cmpw ax, #0x0000
	movw ax, !LOWW(_g_timerSetting+0x0007C)
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
	;***      850 : 				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***      851 : 						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***      852 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 852
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
	movw !LOWW(_g_timerSetting+0x0007C), ax
	movw ax, bc
	movw !LOWW(_g_timerSetting+0x0007E), ax
.BB@LABEL@36_10:	; if_break_bb
	mov a, d
	;***      853 : 				g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***      854 : 						1000 : g_timerSetting.t54_overLapTime_ms;
	;***      855 : 	} else {
	;***      856 : //		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
	;***      857 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      858 : //		}
	;***      859 : 	}
	;***      860 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 860
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
	;***      861 : 	case 0:
	;***      862 : 		*state = 1;
	;***      863 : 		*tick = g_systemTime;
	;***      864 : 		break;
	;***      865 : 	case 1:
	;***      866 : 		g_machine_state.mode = HAND_WASHING;
	;***      867 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      868 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      869 : 			O_PUMP_ALK_PIN = ON;
	;***      870 : 			handSensorLED(BLUE);
	;***      871 : 			(*state)++;
	;***      872 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      873 : //			g_Tick.tickAnimation = g_systemTime;
	;***      874 : //			g_machine_state.waitAnimationRes = 1;
	;***      875 : 		}
	;***      876 : 		break;
	;***      877 : 	case 2:
	;***      878 : 		if (ns_delay_ms(tick,
	;***      879 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      880 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      881 : 			O_PUMP_ALK_PIN = OFF;
	;***      882 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      883 : 			(*state)++;
	;***      884 : 		}
	;***      885 : 		break;
	;***      886 : 	case 3:
	;***      887 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      888 : 			O_PUMP_ACID_PIN = ON;
	;***      889 : 			handSensorLED(RED);
	;***      890 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      891 : 			(*state)++;
	;***      892 : 		}
	;***      893 : 		break;
	;***      894 : 	case 4:
	;***      895 : 		if (ns_delay_ms(tick,
	;***      896 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      897 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      898 : 			(*state)++;
	;***      899 : 		}
	;***      900 : 		break;
	;***      901 : 	case 5:
	;***      902 : 		if (ns_delay_ms(tick,
	;***      903 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      904 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      905 : 			O_PUMP_ACID_PIN = OFF;
	;***      906 : 			handSensorLED(WHITE);
	;***      907 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      908 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      909 : 			(*state)++;
	;***      910 : 		}
	;***      911 : 		break;
	;***      912 : 	case 6:
	;***      913 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      914 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      915 : 			(*state)++;
	;***      916 : 		}
	;***      917 : 		break;
	;***      918 : 	case 7:
	;***      919 : 		if (ns_delay_ms(tick,
	;***      920 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      921 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      922 : 			handSensorLED(BLACK);
	;***      923 : 			(*state) = 0;
	;***      924 : 			g_machine_state.mode = BUSY;
	;***      925 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      926 : 		}
	;***      927 : 		break;
	;***      928 : 	default:
	;***      929 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 929
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@36_19:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 862
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 863
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	ret
.BB@LABEL@36_20:	; switch_clause_bb34
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 866
	oneb !LOWW(_g_machine_state+0x0000E)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 867
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 868
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_28
.BB@LABEL@36_21:	; if_then_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 869
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 870
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 871
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@36_22:	; if_then_bb41
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@36_23:	; switch_clause_bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 878
	movw ax, !LOWW(_g_timerSetting+0x00070)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x00072)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x0007C)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@36_24:	; switch_clause_bb46
	decw ax
.BB@LABEL@36_25:	; switch_clause_bb46
	subw ax, !LOWW(_g_timerSetting+0x0007E)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_34
.BB@LABEL@36_26:	; if_then_bb56
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 881
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 882
	set1 0xFFF07.6
	br $.BB@LABEL@36_36
.BB@LABEL@36_27:	; switch_clause_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 887
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 888
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 889
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 895
	addw ax, !LOWW(_g_timerSetting+0x0007C)
	movw bc, ax
	clrw ax
	decw ax
	sknc
.BB@LABEL@36_32:	; switch_clause_bb73
	incw ax
.BB@LABEL@36_33:	; switch_clause_bb73
	addw ax, !LOWW(_g_timerSetting+0x0007E)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@36_34:	; switch_clause_bb73
	bz $.BB@LABEL@36_43
.BB@LABEL@36_35:	; if_then_bb82
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 897
	clr1 0xFFF07.7
.BB@LABEL@36_36:	; if_then_bb82
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 933
	ret
.BB@LABEL@36_37:	; switch_clause_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 902
	movw ax, !LOWW(_g_timerSetting+0x00074)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x00076)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x0007C)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@36_38:	; switch_clause_bb87
	decw ax
.BB@LABEL@36_39:	; switch_clause_bb87
	subw ax, !LOWW(_g_timerSetting+0x0007E)
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@36_40:	; switch_clause_bb87
	bz $.BB@LABEL@36_47
.BB@LABEL@36_41:	; if_then_bb97
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 905
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 906
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 907
	set1 0xFFF05.5
	br $.BB@LABEL@36_30
.BB@LABEL@36_42:	; switch_clause_bb102
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 913
	movw bc, !LOWW(_g_timerSetting+0x0007C)
	movw de, !LOWW(_g_timerSetting+0x0007E)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@36_43:	; switch_clause_bb102
	bz $.BB@LABEL@36_47
.BB@LABEL@36_44:	; if_then_bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 914
	clr1 0xFFF07.6
	br $.BB@LABEL@36_36
.BB@LABEL@36_45:	; switch_clause_bb114
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 919
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
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_47
.BB@LABEL@36_46:	; if_then_bb122
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 921
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 922
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 923
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 924
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	br $!.BB@LABEL@36_22
.BB@LABEL@36_47:	; return
	;***      930 : 		break;
	;***      931 : 	}
	;***      932 : 
	;***      933 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 933
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      934 : /**
	;***      935 :  * Tested: 24/12/2021 by Mr.An
	;***      936 :  */
	;***      937 : void AcidWaterMode_nostop(void) {
	;***      938 : 	uint8_t *state = &g_machine_state.acid;
	;***      939 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      940 : 	const uint32_t delayPump_ms = 50;
	;***      941 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 941
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
	;***      942 : 	case 0:
	;***      943 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      944 : 		g_machine_state.mode = ACID_WASHING;
	;***      945 : 		*state = 1;
	;***      946 : 		*tick = g_systemTime;
	;***      947 : 		break;
	;***      948 : 	case 1:
	;***      949 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      950 : 		g_color = RED;
	;***      951 : 		handSensorLED(g_color);
	;***      952 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      953 : 			O_PUMP_ACID_PIN = ON;
	;***      954 : 			(*state)++;
	;***      955 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      956 : 		}
	;***      957 : 		break;
	;***      958 : 	case 2:
	;***      959 : 		//TODO: Change turn OFF signal here
	;***      960 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      961 : 				|| (DETECT_U == I_ON)) {
	;***      962 : 			O_PUMP_ACID_PIN = OFF;
	;***      963 : 			(*state)++;
	;***      964 : 		}
	;***      965 : 		break;
	;***      966 : 	case 3:
	;***      967 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      968 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      969 : 			g_color = BLACK;
	;***      970 : 			handSensorLED(g_color);
	;***      971 : 			(*state)++;
	;***      972 : 		}
	;***      973 : 		break;
	;***      974 : 	default:
	;***      975 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 975
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***      976 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 976
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi_f
	;***      977 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 977
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@37_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 944
	mov !LOWW(_g_machine_state+0x0000E), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 945
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 946
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@37_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 949
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 950
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 951
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 952
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@37_14
.BB@LABEL@37_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 953
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 954
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 955
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@37_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 960
	movw ax, !LOWW(_g_timerSetting+0x00084)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00086)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 962
	clr1 0xFFF06.2
.BB@LABEL@37_11:	; if_then_bb39
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 980
	ret
.BB@LABEL@37_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 967
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@37_14
.BB@LABEL@37_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 968
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 969
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 970
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@37_11
.BB@LABEL@37_14:	; return
	;***      978 : 		break;
	;***      979 : 	}
	;***      980 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 980
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      981 : /**
	;***      982 :  * Tested: 24/12/2021 by Mr.An
	;***      983 :  */
	;***      984 : void AlkalineWaterMode_nostop(void) {
	;***      985 : 	uint8_t *state = &g_machine_state.akaline;
	;***      986 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      987 : 	const uint32_t delayPump_ms = 50;
	;***      988 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 988
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
	;***      989 : 	case 0:
	;***      990 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      991 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      992 : 		*state = 1;
	;***      993 : 		*tick = g_systemTime;
	;***      994 : 		break;
	;***      995 : 	case 1:
	;***      996 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      997 : 		g_color = BLUE;
	;***      998 : 		handSensorLED(g_color);
	;***      999 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***     1000 : 			O_PUMP_ALK_PIN = ON;
	;***     1001 : 			(*state)++;
	;***     1002 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***     1003 : 		}
	;***     1004 : 		break;
	;***     1005 : 	case 2:
	;***     1006 : 		//TODO: Change turn OFF signal here
	;***     1007 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***     1008 : 				|| (DETECT_U == I_ON)) {
	;***     1009 : 			O_PUMP_ALK_PIN = OFF;
	;***     1010 : 			(*state)++;
	;***     1011 : 		}
	;***     1012 : 		break;
	;***     1013 : 	case 3:
	;***     1014 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***     1015 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***     1016 : 			g_color = BLACK;
	;***     1017 : 			handSensorLED(g_color);
	;***     1018 : 			(*state)++;
	;***     1019 : 		}
	;***     1020 : 		break;
	;***     1021 : 	default:
	;***     1022 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1022
	mov !LOWW(_g_machine_state+0x0000E), #0x07
	;***     1023 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1023
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi_f
	;***     1024 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1024
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@38_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 991
	mov !LOWW(_g_machine_state+0x0000E), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 992
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 993
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@38_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 996
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 997
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 998
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 999
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_14
.BB@LABEL@38_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1000
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1001
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1002
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@38_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1007
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
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@38_10
.BB@LABEL@38_9:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@38_14
.BB@LABEL@38_10:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1009
	clr1 0xFFF06.1
.BB@LABEL@38_11:	; if_then_bb39
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1027
	ret
.BB@LABEL@38_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1014
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_14
.BB@LABEL@38_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1015
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1016
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1017
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@38_11
.BB@LABEL@38_14:	; return
	;***     1025 : 		break;
	;***     1026 : 	}
	;***     1027 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1027
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***     1028 : 
	;***     1029 : // Newest
	;***     1030 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1030
	subw sp, #0x0A
	;***     1031 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1031
	call $!_UpdateMachineStatus
.BB@LABEL@39_1:	; bb1
	;***     1032 : 	while (InitialOperationModeStart_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1032
	call $!_InitialOperationModeStart_nostop
	cmp0 a
	bz $.BB@LABEL@39_3
.BB@LABEL@39_2:	; bb
	;***     1033 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1033
	call $!_RaspberryResponse_nostop
	;***     1034 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1034
	call $!_UpdateMachineStatus
	;***     1035 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1035
	call !!_R_WDT_Restart
	br $.BB@LABEL@39_1
.BB@LABEL@39_3:	; bb5
	;***     1036 : 	}
	;***     1037 : 
	;***     1038 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1038
	call $!_UpdateMachineStatus
.BB@LABEL@39_4:	; bb7
	;***     1039 : 	while (WaterSupplyOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1039
	call $!_WaterSupplyOperation_nostop
	cmp0 a
	bz $.BB@LABEL@39_6
.BB@LABEL@39_5:	; bb6
	;***     1040 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1040
	call $!_realTimeResponse
	br $.BB@LABEL@39_4
.BB@LABEL@39_6:	; bb13
	;***     1041 : 	}
	;***     1042 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1042
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
	;***     1043 : 		sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1043
	movw ax, #0x4104
	call $!_sendToRasPi_f
.BB@LABEL@39_12:	; bb21
	;***     1044 : 				g_io_status.refined.FlowValue);
	;***     1045 : 	}
	;***     1046 : 	while (!ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1046
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@39_14
.BB@LABEL@39_13:	; bb20
	;***     1047 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1047
	call $!_realTimeResponse
	br $.BB@LABEL@39_12
.BB@LABEL@39_14:	; return
	;***     1048 : 	}
	;***     1049 : 
	;***     1050 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1050
	addw sp, #0x0A
	ret
_userAuthHandler_nostop:
	.STACK _userAuthHandler_nostop = 4
	;***     1051 : 
	;***     1052 : void userAuthHandler_nostop(void) {
	;***     1053 : 	if (g_machine_state.user == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1053
	cmp !LOWW(_g_machine_state+0x0000D), #0x01
	bnz $.BB@LABEL@40_9
.BB@LABEL@40_1:	; if_then_bb
	;***     1054 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1054
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
	;***     1055 : 		case HAND_WASHING:
	;***     1056 : 			HandWashingMode_nostop();
	;***     1057 : 			break;
	;***     1058 : 		case WATER_WASHING:
	;***     1059 : 			WaterWashingMode_nostop();
	;***     1060 : 			break;
	;***     1061 : 		case ACID_WASHING:
	;***     1062 : 			AcidWaterMode_nostop();
	;***     1063 : 			break;
	;***     1064 : 		case ALKALINE_WASHING:
	;***     1065 : 			AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1065
	br $!_AlkalineWaterMode_nostop
.BB@LABEL@40_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1056
	br $!_HandWashingMode_nostop
.BB@LABEL@40_7:	; switch_clause_bb6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1059
	br $!_WaterWashingMode_nostop
.BB@LABEL@40_8:	; switch_clause_bb7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1062
	br $!_AcidWaterMode_nostop
.BB@LABEL@40_9:	; return
	;***     1066 : 			break;
	;***     1067 : 		default:
	;***     1068 : 			break;
	;***     1069 : 		}
	;***     1070 : 	}
	;***     1071 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1071
	ret
_ElectrolyzeWaterGeneration_nostop:
	.STACK _ElectrolyzeWaterGeneration_nostop = 4
	;***     1072 : /*!
	;***     1073 :  * Tested!
	;***     1074 :  */
	;***     1075 : void ElectrolyzeWaterGeneration_nostop(void) {
	;***     1076 : 	if ((g_machine_state.mode != ELECTROLYTIC_GENERATION)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1076
	mov a, !LOWW(_g_machine_state+0x0000E)
	cmp0 a
	bnz $.BB@LABEL@41_4
.BB@LABEL@41_1:	; if_then_bb
	;***     1077 : 			&& (g_machine_state.mode == INDIE)) {
	;***     1078 : 		if (isAcidTankEmpty() || isAlkalineTankEmpty()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1078
	call $!_isAcidTankEmpty
	cmp0 a
	bnz $.BB@LABEL@41_3
.BB@LABEL@41_2:	; bb18
	call $!_isAlkalineTankEmpty
	cmp0 a
	bz $.BB@LABEL@41_12
.BB@LABEL@41_3:	; if_then_bb31
	;***     1079 : 			// Start Electrolyte
	;***     1080 : 			g_machine_state.mode = ELECTROLYTIC_GENERATION;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1080
	mov !LOWW(_g_machine_state+0x0000E), #0x08
	;***     1081 : 			//Stop what ever operation is happening
	;***     1082 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1082
	clrb !LOWW(_g_machine_state+0x0000D)
	;***     1083 : 			g_machine_state.handwash = g_machine_state.water =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1083
	clrb !LOWW(_g_machine_state)
	clrb !LOWW(_g_machine_state+0x00001)
	clrb !LOWW(_g_machine_state+0x00002)
	clrb !LOWW(_g_machine_state+0x00003)
	movw hl, #0xFF06
	movw ax, hl
	movw de, ax
	;***     1084 : 					g_machine_state.acid = g_machine_state.akaline = 0;
	;***     1085 : 			O_PUMP_ACID_PIN = O_PUMP_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1085
	clr1 [hl].1
	mov a, [de]
	mov1 CY, a.1
	mov a, [de]
	mov1 a.2, CY
	mov [de], a
	;***     1086 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1086
	clr1 0xFFF05.5
	ret
.BB@LABEL@41_4:	; if_else_bb
	;***     1087 : 
	;***     1088 : 		}
	;***     1089 : 	} else if (g_machine_state.mode == ELECTROLYTIC_GENERATION) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1089
	cmp a, #0x08
	bnz $.BB@LABEL@41_12
.BB@LABEL@41_5:	; if_then_bb49
	;***     1090 : 		// Start Loop Electrolyte
	;***     1091 : 		if (ElectrolyticOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1091
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@41_13
.BB@LABEL@41_6:	; if_else_bb63
	;***     1092 : 			O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
	;***     1093 : 			g_machine_state.mode = INDIE;
	;***     1094 : 			g_machine_state.user = 0;
	;***     1095 : 			handSensorLED(BLACK);
	;***     1096 : 			// Start Electrolyte Operation Off time keeper
	;***     1097 : 		} else if (!isAcidTankFull() && !isAlkalineTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1097
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@41_8
.BB@LABEL@41_7:	; bb74
	call $!_isAlkalineTankFull
	cmp0 a
	;***     1098 : 			handSensorLEDBlink(WHITE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1098
	mov a, #0x02
	bz $.BB@LABEL@41_10
.BB@LABEL@41_8:	; if_else_bb94
	;***     1099 : 		} else if (!isAcidTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1099
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@41_11
.BB@LABEL@41_9:	; if_then_bb106
	;***     1100 : 			handSensorLEDBlink(RED, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1100
	oneb a
.BB@LABEL@41_10:	; if_then_bb106
	movw de, #0x0000
	movw bc, #0x0064
	br $!_handSensorLEDBlink
.BB@LABEL@41_11:	; if_else_bb107
	;***     1101 : 		} else if (!isAlkalineTankFull()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1101
	call $!_isAlkalineTankFull
	cmp0 a
	;***     1102 : 			handSensorLEDBlink(BLUE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1102
	mov a, #0x03
	bz $.BB@LABEL@41_10
.BB@LABEL@41_12:	; return
	;***     1103 : 		}
	;***     1104 : 	}
	;***     1105 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1105
	ret
.BB@LABEL@41_13:	; if_then_bb55
	movw hl, #0xFF07
	movw ax, hl
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1092
	clr1 [hl].7
	mov a, [de]
	mov1 CY, a.7
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1093
	clrb !LOWW(_g_machine_state+0x0000E)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1094
	clrb !LOWW(_g_machine_state+0x0000D)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1095
	clrb a
	br $!_handSensorLED
_isSV1andSV2Off8h:
	.STACK _isSV1andSV2Off8h = 8
	;***     1106 : /*!
	;***     1107 :  * Tested!
	;***     1108 :  */
	;***     1109 : uint8_t isSV1andSV2Off8h(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1109
	push hl
	;***     1110 : 	if (O_SUPPLY_WATER_PIN_SV1 == OFF && O_SPOUT_WATER_PIN_SV2 == OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1110
	mov a, 0xFFF01
	bt a.7, $.BB@LABEL@42_5
.BB@LABEL@42_1:	; bb
	mov a, 0xFFF05
	bt a.5, $.BB@LABEL@42_5
.BB@LABEL@42_2:	; if_then_bb
	;***     1111 : 		if (ns_delay_ms(&g_Tick.tickSV1SV2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1111
	movw ax, !LOWW(_g_timerSetting+0x0008C)
	movw hl, ax
	movw bc, #0x0036
	mulh
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0008E)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1120
	ret
.BB@LABEL@42_5:	; if_else_bb
	;***     1112 : 				(uint32_t) g_timerSetting.t61_curranCleaningIntervalTime_h * 60
	;***     1113 : 						* 60 * 1000)) {
	;***     1114 : 			return 1;
	;***     1115 : 		}
	;***     1116 : 	} else {
	;***     1117 : 		g_Tick.tickSV1SV2 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1117
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
	clrb a
	br $.BB@LABEL@42_4
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***     1118 : 	}
	;***     1119 : 	return 0;
	;***     1120 : }
	;***     1121 : /*!
	;***     1122 :  * Tested!
	;***     1123 :  */
	;***     1124 : void CallanCleaningMode_nostop(void) {
	;***     1125 : 	uint8_t *state = &g_machine_state.callan;
	;***     1126 : 	uint32_t *tick = &g_Tick.tickCallan;
	;***     1127 : 	if (isSV1andSV2Off8h() || (*state) != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1127
	call $!_isSV1andSV2Off8h
	cmp0 a
	bnz $.BB@LABEL@43_2
.BB@LABEL@43_1:	; bb
	cmp0 !LOWW(_g_machine_state+0x00006)
	bz $.BB@LABEL@43_8
.BB@LABEL@43_2:	; if_then_bb
	;***     1128 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1128
	mov a, !LOWW(_g_machine_state+0x00006)
	cmp0 a
	bz $.BB@LABEL@43_5
.BB@LABEL@43_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@43_6
.BB@LABEL@43_4:	; switch_clause_bb37
	;***     1129 : 		case 0:
	;***     1130 : 			(*state)++;
	;***     1131 : 			*tick = g_systemTime;
	;***     1132 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***     1133 : 			g_machine_state.mode = CALLAN_MODE;
	;***     1134 : 			break;
	;***     1135 : 		case 1:
	;***     1136 : 			handSensorLEDBlink(WHITE, 500);
	;***     1137 : 			if (ns_delay_ms(tick,
	;***     1138 : 					g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***     1139 : 				(*state)++;
	;***     1140 : 				O_SPOUT_WATER_PIN_SV2 = OFF;
	;***     1141 : 				handSensorLED(BLACK);
	;***     1142 : 			}
	;***     1143 : 			break;
	;***     1144 : 		default:
	;***     1145 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1145
	clrb !LOWW(_g_machine_state+0x00006)
	ret
.BB@LABEL@43_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1130
	inc a
	mov !LOWW(_g_machine_state+0x00006), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1131
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1132
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1133
	mov !LOWW(_g_machine_state+0x0000E), #0x09
	ret
.BB@LABEL@43_6:	; switch_clause_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1136
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	mov a, #0x02
	call $!_handSensorLEDBlink
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1137
	movw ax, !LOWW(_g_timerSetting+0x00090)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00092)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1139
	inc !LOWW(_g_machine_state+0x00006)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1140
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1141
	clrb a
	br $!_handSensorLED
.BB@LABEL@43_8:	; return
	;***     1146 : 			break;
	;***     1147 : 		}
	;***     1148 : 	}
	;***     1149 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1149
	ret
_DrainageMode_nostop:
	.STACK _DrainageMode_nostop = 14
	;***     1150 : /*!
	;***     1151 :  * Tested!
	;***     1152 :  */
	;***     1153 : void DrainageMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1153
	subw sp, #0x06
	;***     1154 : 	uint8_t *state = &g_machine_state.drainage;
	;***     1155 : 	uint32_t *tick = &g_Tick.tickDrainage;
	;***     1156 : 	if (g_machine_state.mode == DRAINAGE_MODE) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1156
	mov a, !LOWW(_g_machine_state+0x0000E)
	mov b, a
	cmp a, #0x0A
	.bnz $!.BB@LABEL@44_25
.BB@LABEL@44_1:	; if_then_bb
	;***     1157 : 		// Start Drainage Loop
	;***     1158 : 		switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1158
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
	;***     1159 : 		case 0:
	;***     1160 : 			if (InitialOperationModeStart_nostop() == 0) {
	;***     1161 : 				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***     1162 : 				(*state)++;
	;***     1163 : 			}
	;***     1164 : 			break;
	;***     1165 : 		case 1:
	;***     1166 : 			if (ns_delay_ms(tick, 15 * 1000)) {
	;***     1167 : 				(*state)++;
	;***     1168 : 			}
	;***     1169 : 			break;
	;***     1170 : 		case 2:
	;***     1171 : 			if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***     1172 : 					|| (g_io_status.refined.FlowValue
	;***     1173 : 							> g_numberSetting.upperFlow)) {
	;***     1174 : 				(*state)--;
	;***     1175 : 				rx_count++;
	;***     1176 : 			} else {
	;***     1177 : 				(*state)++;
	;***     1178 : 			}
	;***     1179 : 			(*tick) = g_systemTime;
	;***     1180 : 			break;
	;***     1181 : 		case 3:
	;***     1182 : 			if (ns_delay_ms(tick, 10 * 1000)) {
	;***     1183 : 				electrolyticOperationON();
	;***     1184 : 				(*state)++;
	;***     1185 : 			}
	;***     1186 : 			break;
	;***     1187 : 		case 4:
	;***     1188 : 			if (isAcidTankFull() && isAlkalineTankFull()) {
	;***     1189 : 				electrolyticOperationOFF();
	;***     1190 : 				(*state)++;
	;***     1191 : 			}
	;***     1192 : 			break;
	;***     1193 : 		default:
	;***     1194 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1194
	clrb !LOWW(_g_machine_state+0x00009)
	;***     1195 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1195
	clrb !LOWW(_g_machine_state+0x0000E)
	br $.BB@LABEL@44_16
.BB@LABEL@44_7:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1160
	call $!_InitialOperationModeStart_nostop
	cmp0 a
	bnz $.BB@LABEL@44_16
.BB@LABEL@44_8:	; if_then_bb14
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1161
	set1 0xFFF01.7
	br $.BB@LABEL@44_10
.BB@LABEL@44_9:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1166
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1171
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1177
	inc a
	mov !LOWW(_g_machine_state+0x00009), a
	br $.BB@LABEL@44_15
.BB@LABEL@44_14:	; bb40
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1174
	dec a
	mov !LOWW(_g_machine_state+0x00009), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1175
	inc !LOWW(_rx_count)
.BB@LABEL@44_15:	; if_break_bb54
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
.BB@LABEL@44_16:	; return
	addw sp, #0x06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1205
	ret
.BB@LABEL@44_17:	; switch_clause_bb57
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1182
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@44_16
.BB@LABEL@44_18:	; if_then_bb63
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1183
	call $!_electrolyticOperationON
.BB@LABEL@44_19:	; if_then_bb63
	br $.BB@LABEL@44_10
.BB@LABEL@44_20:	; switch_clause_bb68
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1188
	call $!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@44_16
.BB@LABEL@44_21:	; bb73
	call $!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@44_16
.BB@LABEL@44_22:	; if_then_bb86
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1189
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@44_23:	; if_then_bb86.bb96_crit_edge
	oneb a
.BB@LABEL@44_24:	; bb96
	mov !LOWW(_g_machine_state+0x00008), a
	br $.BB@LABEL@44_19
.BB@LABEL@44_25:	; if_else_bb106
	;***     1196 : 			break;
	;***     1197 : 		}
	;***     1198 : 	} else if ((g_TimeKeeper.electrolyteOff_h
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1198
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
	;***     1199 : 			>= g_timerSetting.t6_drainageOffTime_h)
	;***     1200 : 			&& (g_machine_state.isMidNight != 0)
	;***     1201 : 			&& (g_machine_state.mode == INDIE)) {
	;***     1202 : 		g_machine_state.mode = DRAINAGE_MODE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1202
	mov !LOWW(_g_machine_state+0x0000E), #0x0A
	br $.BB@LABEL@44_15
_NormalMode_nostop:
	.STACK _NormalMode_nostop = 6
	;***     1203 : 		(*tick) = g_systemTime;
	;***     1204 : 	}
	;***     1205 : }
	;***     1206 : /*!
	;***     1207 :  * Tested!
	;***     1208 :  */
	;***     1209 : void NormalMode_nostop(void) {
	;***     1210 : 	if ((g_machine_state.mode != BUSY)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1210
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
	;***     1211 : 			&& (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1212 : 			&& (g_machine_state.mode != CALLAN_MODE)
	;***     1213 : 			&& (g_machine_state.mode != DRAINAGE_MODE)) {
	;***     1214 : 		userAuthHandler_nostop();
	;***     1215 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***     1216 : 	} else if (g_machine_state.mode == BUSY) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1216
	cmp a, #0x07
	bnz $.BB@LABEL@45_6
.BB@LABEL@45_4:	; if_then_bb44
	;***     1217 : 		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1217
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
	movw ax, #LOWW(_g_Tick+0x00028)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@45_6
.BB@LABEL@45_5:	; if_then_bb52
	;***     1218 : 				g_timerSetting.t55_waterDischargeDelay_s * 1000)) {
	;***     1219 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1219
	clrb !LOWW(_g_machine_state+0x0000E)
	;***     1220 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1220
	clrb !LOWW(_g_machine_state+0x0000D)
.BB@LABEL@45_6:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1223
	ret
.BB@LABEL@45_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1214
	call $!_userAuthHandler_nostop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1215
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00028), ax
	ret
_TestPowerOn_nostop_keepstate:
	.STACK _TestPowerOn_nostop_keepstate = 8
	;***     1221 : 		}
	;***     1222 : 	}
	;***     1223 : }
	;***     1224 : /*!
	;***     1225 :  * Power ON test mode, state 0 - 1, end at 2
	;***     1226 :  * @param state: Machine state
	;***     1227 :  * @param tick: Tick for no stop delay
	;***     1228 :  * @return 0 when done
	;***     1229 :  */
	;***     1230 : uint8_t TestPowerOn_nostop_keepstate(uint8_t *state, uint32_t *tick) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1230
	push ax
	movw hl, ax
	push bc
	pop de
	;***     1231 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1231
	mov a, [hl]
	cmp0 a
	bz $.BB@LABEL@46_5
.BB@LABEL@46_1:	; entry
	dec a
	bnz $.BB@LABEL@46_4
.BB@LABEL@46_2:	; switch_clause_bb69
	;***     1232 : 	case 0:
	;***     1233 : 		O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 = O_SPOUT_ACID_PIN_SV3 =
	;***     1234 : 		O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 = O_DRAIN_ALK_PIN_SV6 =
	;***     1235 : 		O_DRAIN_ALK_PIN_SV6 = OPTION_1_PIN_SV8 = OPTION_2_PIN_SV9 = ON;
	;***     1236 : 		O_PUMP_SALT_PIN_SP1 = ON;
	;***     1237 : 		(*tick) = g_systemTime;
	;***     1238 : 		break;
	;***     1239 : 	case 1:
	;***     1240 : 		if (ns_delay_ms(tick, 30 * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1240
	movw ax, de
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@46_4
.BB@LABEL@46_3:	; if_then_bb
	movw de, #0xFF06
	;***     1241 : 			O_SUPPLY_WATER_PIN_SV1 = O_SPOUT_WATER_PIN_SV2 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1241
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
	;***     1242 : 					O_SPOUT_ACID_PIN_SV3 =
	;***     1243 : 					O_SPOUT_ALK_PIN_SV4 = O_DRAIN_ACID_PIN_SV5 =
	;***     1244 : 							O_DRAIN_ALK_PIN_SV6 =
	;***     1245 : 							O_DRAIN_ALK_PIN_SV6 = OPTION_1_PIN_SV8 =
	;***     1246 : 									OPTION_2_PIN_SV9 = OFF;
	;***     1247 : 			O_PUMP_SALT_PIN_SP1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1247
	clr1 [hl].0
	pop hl
	push hl
	;***     1248 : 			(*state)++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1248
	inc [hl+0x00]
.BB@LABEL@46_4:	; if_then_bb
	br $.BB@LABEL@46_6
.BB@LABEL@46_5:	; switch_clause_bb
	movw hl, #0xFF06
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1233
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1236
	set1 [hl].0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1237
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	movw [de], ax
	movw ax, bc
	movw [de+0x02], ax
.BB@LABEL@46_6:	; switch_break_bb
	pop de
	push de
	;***     1249 : 		}
	;***     1250 : 		break;
	;***     1251 : 	default:
	;***     1252 : 		break;
	;***     1253 : 	}
	;***     1254 : 	return (*state) == 2? 1:0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1254
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
	;***     1255 : }
	;***     1256 : uint8_t FlowRateAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1256
	push bc
	push ax
	;***     1257 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1257
	call $!_measureFlowSensor_nostop
	pop de
	push de
	;***     1258 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1258
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
	;***     1259 : 		case 2:
	;***     1260 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***     1261 : 			(*state)++;
	;***     1262 : 			(*tick) = g_systemTime;
	;***     1263 : 			break;
	;***     1264 : 		case 3:
	;***     1265 : 			if(ns_delay_ms(tick, 30*1000)){
	;***     1266 : 				O_SUPPLY_WATER_PIN_SV1 = ON;
	;***     1267 : 				(*state)++;
	;***     1268 : 			}
	;***     1269 : 			break;
	;***     1270 : 		case 4:
	;***     1271 : 			if(ns_delay_ms(tick, 500)){
	;***     1272 : 				(*state)++;
	;***     1273 : 				O_SPOUT_WATER_PIN_SV2 = OFF;
	;***     1274 : 			}
	;***     1275 : 			break;
	;***     1276 : 		case 5:
	;***     1277 : 			if(ns_delay_ms(tick, (uint32_t)15*1000 + (uint32_t)10*60*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1277
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1260
	set1 0xFFF05.5
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1261
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1262
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1265
	movw de, #0x0000
	movw bc, #0x7530
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@47_11
.BB@LABEL@47_8:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1266
	set1 0xFFF01.7
	br $.BB@LABEL@47_5
.BB@LABEL@47_9:	; switch_clause_bb19
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1271
	movw de, #0x0000
	movw bc, #0x01F4
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@47_11
.BB@LABEL@47_10:	; if_then_bb25
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1272
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1273
	clr1 0xFFF05.5
.BB@LABEL@47_11:	; switch_break_bb
	pop de
	push de
	;***     1278 : 				(*state)++;
	;***     1279 : 			}
	;***     1280 : 			break;
	;***     1281 : 		default:
	;***     1282 : 			break;
	;***     1283 : 	}
	;***     1284 : 	return (*state) == 6 ? 1:0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1284
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
	;***     1285 : }
	;***     1286 : uint8_t CurrentAdjustmentMode_nostop_keepstate(uint8_t *state, uint32_t *tick){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1286
	movw de, ax
	push bc
	push ax
	;***     1287 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1287
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
	;***     1288 : 		case 6:
	;***     1289 : 			electrolyticOperationON();
	;***     1290 : 			(*state)++;
	;***     1291 : 			break;
	;***     1292 : 		case 7:
	;***     1293 : 			if(ElectrolyticOperation_nostop()){
	;***     1294 : 				(*state)++;
	;***     1295 : 				(*tick) = g_systemTime;
	;***     1296 : 			}
	;***     1297 : 			break;
	;***     1298 : 		case 8:
	;***     1299 : 			if(ns_delay_ms(tick, (uint32_t)15*1000 + (uint32_t)10*60*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1299
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1289
	call $!_electrolyticOperationON
	br $.BB@LABEL@48_4
.BB@LABEL@48_6:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1293
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bz $.BB@LABEL@48_8
.BB@LABEL@48_7:	; if_then_bb
	pop hl
	push hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1294
	inc [hl+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1295
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
	;***     1300 : 				(*state)++;
	;***     1301 : 			}
	;***     1302 : 			break;
	;***     1303 : 		default:
	;***     1304 : 			break;
	;***     1305 : 	}
	;***     1306 : 	return (*state);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1306
	mov a, [de]
	;***     1307 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1307
	addw sp, #0x04
	ret
_ElectrolyteAdjustmentOperation:
	.STACK _ElectrolyteAdjustmentOperation = 8
	;***     1308 : uint8_t ElectrolyteAdjustmentOperation(uint8_t *state, uint32_t *tick){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1308
	movw de, ax
	push ax
	push bc
	;***     1309 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1309
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
	;***     1310 : 		case 9:
	;***     1311 : 			electrolyticOperationON();
	;***     1312 : 			(*state)++;
	;***     1313 : 			break;
	;***     1314 : 		case 10:
	;***     1315 : 			if(isAcidTankFull() && isAlkalineTankFull()){
	;***     1316 : 				electrolyticOperationOFF();
	;***     1317 : 				(*tick) = g_systemTime;
	;***     1318 : 				(*state)++;
	;***     1319 : 			}
	;***     1320 : 			break;
	;***     1321 : 		case 11:
	;***     1322 : 			if(ns_delay_ms(tick, (uint32_t)10*60*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1322
	movw de, #0x0009
	movw bc, #0x27C0
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@49_10
	br $.BB@LABEL@49_11
.BB@LABEL@49_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1311
	call $!_electrolyticOperationON
	br $.BB@LABEL@49_10
.BB@LABEL@49_5:	; switch_clause_bb8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1315
	call $!_isAcidTankFull
	cmp0 a
	bz $.BB@LABEL@49_11
.BB@LABEL@49_6:	; bb
	call $!_isAlkalineTankFull
	cmp0 a
	bz $.BB@LABEL@49_11
.BB@LABEL@49_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1316
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@49_8:	; if_then_bb.bb32_crit_edge
	oneb a
.BB@LABEL@49_9:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1317
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
	;***     1323 : 				(*state)++;
	;***     1324 : 			}
	;***     1325 : 			break;
	;***     1326 : 		default:
	;***     1327 : 			break;
	;***     1328 : 	}
	;***     1329 : 	return (*state);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1329
	mov a, [de]
	;***     1330 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1330
	addw sp, #0x04
	ret
_TestOperation_nostop:
	.STACK _TestOperation_nostop = 4
	;***     1331 : void TestOperation_nostop(void) {
	;***     1332 : 	uint8_t *state = &g_machine_state.test;
	;***     1333 : 	uint32_t *tick = &g_Tick.tickTestOperation;
	;***     1334 : 	switch (commnunication_flag.test_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1334
	mov a, !LOWW(_commnunication_flag+0x00008)
	add a, #0xE3
	bz $.BB@LABEL@50_3
.BB@LABEL@50_1:	; entry
	dec a
	bnz $.BB@LABEL@50_5
.BB@LABEL@50_2:	; switch_clause_bb10
	;***     1335 : 		case TEST_POWER_ON:
	;***     1336 : 			if(TestPowerOn_nostop_keepstate(state, &g_Tick.tickTestOperation)){
	;***     1337 : 				commnunication_flag.test_flag = 0;
	;***     1338 : 				*state = 0;
	;***     1339 : 			}
	;***     1340 : 			break;
	;***     1341 : 		case TEST_FLOW_RATE:
	;***     1342 : 			if(FlowRateAdjustmentMode_nostop_keepstate(state, tick)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1342
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	br $!_FlowRateAdjustmentMode_nostop_keepstate
.BB@LABEL@50_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1336
	movw bc, #LOWW(_g_Tick+0x0005C)
	movw ax, #LOWW(_g_machine_state+0x0000B)
	call $!_TestPowerOn_nostop_keepstate
	cmp0 a
	bz $.BB@LABEL@50_5
.BB@LABEL@50_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1337
	clrb !LOWW(_commnunication_flag+0x00008)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1338
	clrb !LOWW(_g_machine_state+0x0000B)
.BB@LABEL@50_5:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1349
	ret
_NeutralizationTreatment:
	.STACK _NeutralizationTreatment = 10
	;***     1343 : 
	;***     1344 : 			}
	;***     1345 : 			break;
	;***     1346 : 		default:
	;***     1347 : 			break;
	;***     1348 : 	}
	;***     1349 : }
	;***     1350 : void NeutralizationTreatment(uint32_t *tick){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1350
	subw sp, #0x04
	movw hl, ax
	;***     1351 : 	if(g_neutralization_time_s >= g_timerSetting.t33_neutralizationStartTime_h*60*60){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1351
	movw ax, !LOWW(_g_timerSetting+0x00068)
	movw bc, #0x0E10
	mulhu
	movw [sp+0x00], ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0006A)
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
	;***     1352 : 		g_machine_state.neutrlization = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1352
	oneb !LOWW(_g_machine_state+0x0000C)
	;***     1353 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1353
	set1 0xFFF06.5
	clrw ax
	;***     1354 : 		g_neutralization_time_s = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1354
	movw !LOWW(_g_neutralization_time_s+0x00002), ax
	movw !LOWW(_g_neutralization_time_s), ax
.BB@LABEL@51_4:	; if_break_bb
	;***     1355 : 	}
	;***     1356 : 	if(ns_delay_ms(tick, g_timerSetting.t34_neutralizationOpenTime_s*1000) && (g_machine_state.neutrlization != 0)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1356
	movw ax, !LOWW(_g_timerSetting+0x0006C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, bc
	movw [sp+0x02], ax
	movw ax, !LOWW(_g_timerSetting+0x0006E)
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
	;***     1357 : 		O_NEUTRALIZE_PIN_SV7 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1357
	set1 0xFFF06.5
	;***     1358 : 		g_machine_state.neutrlization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1358
	clrb !LOWW(_g_machine_state+0x0000C)
.BB@LABEL@51_7:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1361
	ret
_main_loop_20211111:
	.STACK _main_loop_20211111 = 4
	;***     1359 : 	}
	;***     1360 : 
	;***     1361 : }
	;***     1362 : void main_loop_20211111(void) {
	;***     1363 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1363
	call $!_measureFlowSensor_nostop
	;***     1364 : 	DrainageMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1364
	call $!_DrainageMode_nostop
	;***     1365 : 	ElectrolyzeWaterGeneration_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1365
	call $!_ElectrolyzeWaterGeneration_nostop
	;***     1366 : 	CallanCleaningMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1366
	call $!_CallanCleaningMode_nostop
	;***     1367 : 	NormalMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1367
	br $!_NormalMode_nostop
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***     1368 : }
	;***     1369 : 
	;***     1370 : /**
	;***     1371 :  * 30/11/2021: Checked by An
	;***     1372 :  */
	;***     1373 : void electrolyticOperationON(void) {
	;***     1374 : 	//Electrolytic operation ON
	;***     1375 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1375
	set1 0xFFF01.7
	;***     1376 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1376
	set1 0xFFF0E.2
	;***     1377 : 	O_PUMP_SALT_PIN_SP1 = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1377
	set1 0xFFF06.0
	;***     1378 : 	g_machine_state.electrolyteOperation = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1378
	oneb !LOWW(_g_machine_state+0x00007)
	;***     1379 : 	g_TimeKeeper.electrolyteOff_h = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1379
	clrb !LOWW(_g_TimeKeeper@1)
	;***     1380 : 	g_TimeKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1380
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1383
	ret
_isElectrolyticOperationOFF_nostop:
	.STACK _isElectrolyticOperationOFF_nostop = 6
	;***     1381 : 			g_TimeKeeper.neutralization == 0 ?
	;***     1382 : 					g_systemTime : g_TimeKeeper.neutralization;
	;***     1383 : }
	;***     1384 : void isElectrolyticOperationOFF_nostop(void) {
	;***     1385 : 	uint8_t *state = &g_machine_state.electrolyteOFF;
	;***     1386 : 	uint32_t *tick = &g_Tick.tickElectrolyticOff;
	;***     1387 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1387
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	bz $.BB@LABEL@54_6
.BB@LABEL@54_1:	; entry
	dec a
	.bz $!.BB@LABEL@54_15
.BB@LABEL@54_2:	; entry
	dec a
	bnz $.BB@LABEL@54_5
.BB@LABEL@54_3:	; switch_clause_bb45
	;***     1388 : 	case 0:
	;***     1389 : 		// Set g_machine_state.electrolyteOFF = 1 to start OFF
	;***     1390 : 		// This case run when electrolyte is ON or already OFF
	;***     1391 : 		if (ns_delay_ms(tick, (uint32_t) 60000 * 60)
	;***     1392 : 				&& g_machine_state.electrolyteOperation == 0) {
	;***     1393 : 			sendToRasPi_u32(H_READ, MID_NIGHT, 0x00);
	;***     1394 : 			g_TimeKeeper.electrolyteOff_h++;
	;***     1395 : 		} else if (g_machine_state.electrolyteOperation == 1) {
	;***     1396 : 			if(ns_delay_ms(g_TimeKeeper.neutralization, 1000)){
	;***     1397 : 				g_neutralization_time_s++;
	;***     1398 : 			}
	;***     1399 : 			(*tick) = g_systemTime;
	;***     1400 : 		}
	;***     1401 : 		break;
	;***     1402 : 	case 1:
	;***     1403 : 		g_TimeKeeper.neutralization = 0;
	;***     1404 : 		O_CVCC_ON_PIN = OFF;
	;***     1405 : 		O_PUMP_SALT_PIN_SP1 = OFF; //SP1
	;***     1406 : 		(*state)++;
	;***     1407 : 		break;
	;***     1408 : 	case 2:
	;***     1409 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1409
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
.BB@LABEL@54_4:	; if_then_bb53
	;***     1410 : 				g_timerSetting.t5_electrolysisStopDelay_s * 1000)) {
	;***     1411 : 			(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1411
	clrb !LOWW(_g_machine_state+0x00008)
	;***     1412 : 			O_SUPPLY_WATER_PIN_SV1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1412
	clr1 0xFFF01.7
	;***     1413 : 			g_machine_state.electrolyteOperation = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1413
	clrb !LOWW(_g_machine_state+0x00007)
.BB@LABEL@54_5:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1420
	ret
.BB@LABEL@54_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1391
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1393
	clrw ax
	movw de, ax
	movw ax, #0x521C
	call $!_sendToRasPi_u32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1394
	inc !LOWW(_g_TimeKeeper@1)
	ret
.BB@LABEL@54_9:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1395
	cmp !LOWW(_g_machine_state+0x00007), #0x01
	bnz $.BB@LABEL@54_5
.BB@LABEL@54_10:	; if_then_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1396
	movw ax, !LOWW(_g_TimeKeeper@1+0x00002)
	movw de, #0x0000
	movw bc, #0x03E8
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@54_14
.BB@LABEL@54_11:	; if_then_bb34
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1397
	addw ax, !LOWW(_g_neutralization_time_s)
	movw !LOWW(_g_neutralization_time_s), ax
	clrw ax
	sknc
.BB@LABEL@54_12:	; if_then_bb34
	incw ax
.BB@LABEL@54_13:	; if_then_bb34
	addw ax, !LOWW(_g_neutralization_time_s+0x00002)
	movw !LOWW(_g_neutralization_time_s+0x00002), ax
.BB@LABEL@54_14:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1399
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	ret
.BB@LABEL@54_15:	; switch_clause_bb41
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1403
	movw !LOWW(_g_TimeKeeper@1+0x00004), ax
	movw !LOWW(_g_TimeKeeper@1+0x00002), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1404
	clr1 0xFFF0E.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1405
	clr1 0xFFF06.0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1406
	inc !LOWW(_g_machine_state+0x00008)
	ret
_realTimeResponse:
	.STACK _realTimeResponse = 4
	;***     1414 : 		}
	;***     1415 : 		break;
	;***     1416 : 	default:
	;***     1417 : 		break;
	;***     1418 : 	}
	;***     1419 : 
	;***     1420 : }
	;***     1421 : void realTimeResponse(void) {
	;***     1422 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1422
	call $!_UpdateMachineStatus
	;***     1423 : 	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1423
	call $!_RaspberryResponse_nostop
	;***     1424 : 	isElectrolyticOperationOFF_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1424
	call $!_isElectrolyticOperationOFF_nostop
	;***     1425 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1425
	call !!_R_WDT_Restart
	;***     1426 : 	if (ns_delay_ms(&g_Tick.tickCustom[0], 200)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1426
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick+0x00088)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	sknz
.BB@LABEL@55_1:	; return
	;***     1427 : 		P6_bit.no3 = ~P6_bit.no3;
	;***     1428 : 
	;***     1429 : 	}
	;***     1430 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1430
	ret
.BB@LABEL@55_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1427
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***     1431 : float measureFlowSensor(uint32_t *s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1431
	push ax
	subw sp, #0x0C
	;***     1432 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1432
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
	;***     1433 : 	float flow_pluse = 0.0;
	;***     1434 : 	uint8_t flow_pulse_state = I_OFF;
	;***     1435 : 	while (!ns_delay_ms(&stamp_flow_sensor, (*s) * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1435
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
	;***     1436 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1436
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@56_6
.BB@LABEL@56_3:	; if_then_bb
	;***     1437 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1437
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@56_5
.BB@LABEL@56_4:	; if_then_bb20
	movw ax, #0x3F80
	;***     1438 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1438
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
	;***     1439 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1439
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@56_6:	; if_break_bb26
	;***     1440 : 		}
	;***     1441 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1441
	call !!_R_WDT_Restart
	br $.BB@LABEL@56_1
.BB@LABEL@56_7:	; bb40
	movw ax, #0x3F33
	;***     1442 : 	}
	;***     1443 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1443
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
	;***     1444 : 	return g_io_status.refined.FlowValue;
	;***     1445 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1445
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***     1446 : 
	;***     1447 : uint8_t _pre_flow_state = I_OFF;
	;***     1448 : float _flow_pulse;
	;***     1449 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1449
	subw sp, #0x04
	;***     1450 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***     1451 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***     1452 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1452
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
	;***     1453 : 	case 0:
	;***     1454 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1454
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@57_9
.BB@LABEL@57_5:	; switch_clause_bb14
	;***     1455 : 			(*state)++;
	;***     1456 : 		}
	;***     1457 : 		break;
	;***     1458 : 	case 1:
	;***     1459 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1459
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@57_8
.BB@LABEL@57_6:	; if_then_bb24
	;***     1460 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1460
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***     1461 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1461
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@57_8
.BB@LABEL@57_7:	; if_then_bb35
	movw ax, #0x3F80
	;***     1462 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1462
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
	;***     1463 : 			}
	;***     1464 : 		}
	;***     1465 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1465
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
	;***     1466 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***     1467 : 			(*state)++;
	;***     1468 : 		}
	;***     1469 : 		break;
	;***     1470 : 	case 2:
	;***     1471 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***     1472 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***     1473 : 		_flow_pulse = 0;
	;***     1474 : 		(*state) = 0;
	;***     1475 : 		break;
	;***     1476 : 	default:
	;***     1477 : 		(*state) = 0;
	;***     1478 : 		break;
	;***     1479 : 	}
	;***     1480 : 	return g_io_status.refined.FlowValue;
	;***     1481 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1481
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@57_12:	; switch_clause_bb52
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1471
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1473
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@57_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***     1482 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1482
	push hl
	;***     1483 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1484 : 		pre_machine_washing_mode = g_machine_state.mode;
	;***     1485 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1485
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@58_2
.BB@LABEL@58_1:	; bb11
	clrb x
.BB@LABEL@58_2:	; bb12
	;***     1486 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1486
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@58_4
.BB@LABEL@58_3:	; bb28
	clrb c
.BB@LABEL@58_4:	; bb30
	;***     1487 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1487
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
	;***     1488 : 	g_mean_io_status.refined.AcidLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1488
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
	;***     1489 : 	I_ACID_M_PIN == I_ON ? g_mean_io_status.refined.AcidLowLevel : 0;
	;***     1490 : 	g_mean_io_status.refined.AcidHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1490
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
	;***     1491 : 	I_ACID_H_PIN == I_ON ? g_mean_io_status.refined.AcidHighLevel : 0;
	;***     1492 : 
	;***     1493 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1493
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@58_12
.BB@LABEL@58_11:	; bb109
	clrb x
.BB@LABEL@58_12:	; bb111
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***     1494 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1494
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@58_14
.BB@LABEL@58_13:	; bb126
	clrb b
.BB@LABEL@58_14:	; bb128
	mov a, c
	or a, x
	mov e, a
	;***     1495 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1495
	mov a, 0xFFF07
	mov c, #0x04
	bf a.0, $.BB@LABEL@58_16
.BB@LABEL@58_15:	; bb144
	clrb c
.BB@LABEL@58_16:	; bb146
	mov a, e
	or a, b
	mov e, a
	;***     1496 : 	g_mean_io_status.refined.AlkalineLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1496
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
	;***     1497 : 	I_ALKALI_M_PIN == I_ON ? g_mean_io_status.refined.AlkalineLowLevel : 0;
	;***     1498 : 	g_mean_io_status.refined.AlkalineHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1498
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
	;***     1499 : 	I_ALKALI_H_PIN == I_ON ? g_mean_io_status.refined.AlkalineHighLevel : 0;
	;***     1500 : 
	;***     1501 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1501
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@58_22
.BB@LABEL@58_21:	; bb206
	clrb b
.BB@LABEL@58_22:	; bb208
	mov a, e
	or a, c
	mov c, a
	;***     1502 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1502
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
	;***     1503 : 
	;***     1504 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1504
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***     1505 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1505
	mov x, 0xFFF05
	;***     1506 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1506
	mov c, 0xFFF07
	;***     1507 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1507
	mov a, 0xFFF07
	mov h, a
	;***     1508 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1508
	mov a, [de]
	mov l, a
	;***     1509 : 	O_DRAIN_ACID_PIN_SV5;
	;***     1510 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1510
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1504
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1505
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1506
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1507
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1508
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***     1511 : 	O_DRAIN_ALK_PIN_SV6;
	;***     1512 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN_SV7;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1512
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1508
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1512
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1510
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1512
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***     1513 : 
	;***     1514 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1514
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***     1515 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1515
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***     1516 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN_SP1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1516
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***     1517 : }
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
