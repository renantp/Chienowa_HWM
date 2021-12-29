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
#@  compiled at Wed Dec 29 18:11:56 2021

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
	.PUBLIC _g_electrolytic_flag
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
	.PUBLIC _InitialOperationModeStart
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
	.PUBLIC _errorCheck
	.PUBLIC _main_loop_20211111
	.PUBLIC _electrolyticOperationON
	.PUBLIC _electrolyticOperationOFF_nostop
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
	;***       26 : volatile uint8_t g_electrolytic_flag = 0;
	;***       27 : union Alarm_Flag_u g_alarm;
	;***       28 : struct Machine_State_u g_machine_state;
	;***       29 : union IO_Status_u g_io_status, g_mean_io_status;
	;***       30 : 
	;***       31 : struct Timer_Setting_s _settingTime;
	;***       32 : struct Number_Setting_s _settingNumber;
	;***       33 : uint8_t g_machine_mode;
	;***       34 : union BytesToDouble {
	;***       35 : 	struct {
	;***       36 : 		uint8_t data[4];
	;***       37 : 	} refined;
	;***       38 : 	uint32_t raw;
	;***       39 : } btod;
	;***       40 : struct Tick_s g_Tick;
	;***       41 : //struct Tick_s g_Tick;
	;***       42 : 
	;***       43 : //void electrolyticOperationON(void);
	;***       44 : //void electrolyticOperationOFF(void);
	;***       45 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 45
	mov !LOWW(_g_color), a
	;***       46 : 	g_color = color;
	;***       47 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 47
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       48 : 		switch (color) {
	;***       49 : 		case RED:
	;***       50 : 			O_HS_ICL_PIN = 1;
	;***       51 : 			O_HS_IDA_PIN = 0;
	;***       52 : 			break;
	;***       53 : 		case BLUE:
	;***       54 : 			O_HS_ICL_PIN = 0;
	;***       55 : 			O_HS_IDA_PIN = 0;
	;***       56 : 			break;
	;***       57 : 		case WHITE:
	;***       58 : 			O_HS_ICL_PIN = 0;
	;***       59 : 			O_HS_IDA_PIN = 1;
	;***       60 : 			break;
	;***       61 : 		default:
	;***       62 : 			O_HS_ICL_PIN = 1;
	;***       63 : 			O_HS_IDA_PIN = 1;
	;***       64 : 			break;
	;***       65 : 		}
	;***       66 : 		g_pre_color = g_color;
	;***       67 : 	}
	;***       68 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 48
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 62
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 50
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 51
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 54
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 55
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 58
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_handSensorLEDBlink:
	.STACK _handSensorLEDBlink = 6
	;***       69 : void handSensorLEDBlink(enum HS_COLOR color, uint32_t ms) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	push hl
	mov [sp+0x00], a
	;***       70 : 	if (ns_delay_ms(&g_Tick.tickBlink, ms)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw ax, #LOWW(_g_Tick+0x0000C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@2_2
.BB@LABEL@2_1:	; return
	;***       71 : 		g_color = g_color == color ? BLACK : color;
	;***       72 : 		handSensorLED(g_color);
	;***       73 : 	}
	;***       74 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	pop hl
	ret
.BB@LABEL@2_2:	; if_then_bb
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	cmp a, !LOWW(_g_color)
	sknz
.BB@LABEL@2_3:	; if_then_bb.bb15_crit_edge
	clrb a
.BB@LABEL@2_4:	; bb15
	mov !LOWW(_g_color), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	pop hl
	br $_handSensorLED
_setting_default:
	.STACK _setting_default = 4
	;***       75 : void setting_default(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw ax, #0x4086
	;***       76 : 	g_numberSetting.upperVoltage1 = 4.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x6666
	movw !LOWW(_g_numberSetting), ax
	movw ax, #0x4060
	;***       77 : 	g_numberSetting.upperVoltage2 = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_numberSetting+0x00006), ax
	;***       78 : 	g_numberSetting.upperVoltage3 = 2.2;
	;***       79 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       80 : 	g_numberSetting.upperCurrent = 4.3;
	;***       81 : 	g_numberSetting.lowerCurrent = 0.2;
	;***       82 : 	g_numberSetting.upperFlow = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***       83 : 	g_numberSetting.lowerFlow = 0.4;
	;***       84 : 
	;***       85 : 	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       86 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       87 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       88 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       89 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***       90 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***       91 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***       92 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***       93 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 93
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***       94 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 94
	movw !LOWW(_g_timerSetting+0x0006A), ax
	;***       95 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 95
	movw !LOWW(_g_timerSetting+0x0006E), ax
	;***       96 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 96
	movw !LOWW(_g_timerSetting+0x00072), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_numberSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F00
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw ax, #0x4089
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_numberSetting+0x00016), ax
	mov x, #0xCC
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x00008), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x00028), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	movw !LOWW(_g_timerSetting+0x00038), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x00030), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
	movw !LOWW(_g_timerSetting+0x00034), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 93
	movw !LOWW(_g_timerSetting+0x00040), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 94
	movw !LOWW(_g_timerSetting+0x00068), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 95
	movw !LOWW(_g_timerSetting+0x0006C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 96
	movw !LOWW(_g_timerSetting+0x00070), ax
	ret
_isAcidTankFull:
	.STACK _isAcidTankFull = 6
	;***       97 : }
	;***       98 : #ifdef RENAN_CODE
	;***       99 : void renanCode(void){
	;***      100 : 	//Power On Mode
	;***      101 : 	O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***      102 : 	O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***      103 : 	do{
	;***      104 : 		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN_SV7;	// Turn on SV5 if ACID tank empty
	;***      105 : 		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN_SV6;	// Turn on SV6 if ALK tank empty
	;***      106 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***      107 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***      108 : 		R_WDT_Restart();
	;***      109 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      110 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***      111 : 	O_DRAIN_ACID_PIN_SV7 = O_DRAIN_ALK_PIN_SV6 = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***      112 : 
	;***      113 : 	// Drainage operation
	;***      114 : 	O_SPOUT_WATER_PIN_SV2 = ON;	// SV2 On
	;***      115 : 	delay(st[1]);			// Default 30 seconds
	;***      116 : 	O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      117 : 	delay_ms(500);
	;***      118 : 	O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      119 : }
	;***      120 : 
	;***      121 : 
	;***      122 : void code_20211029(void){
	;***      123 : 	//---------------Electrolytic operation-----------------------------
	;***      124 : 	O_SUPPLY_WATER_PIN_SV1 = ON; //SV1
	;***      125 : 	O_CVCC_ON_PIN = ON;
	;***      126 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***      127 : 	delay(10);
	;***      128 : 
	;***      129 : 	overVoltage1Error();
	;***      130 : }
	;***      131 : #endif
	;***      132 : 
	;***      133 : uint8_t isAcidTankFull(void) {
	;***      134 : 	if (I_ACID_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@4_5
.BB@LABEL@4_1:	; if_then_bb
	;***      135 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
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
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@4_4
.BB@LABEL@4_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].5, $.BB@LABEL@4_4
.BB@LABEL@4_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 146
	ret
.BB@LABEL@4_4:	; if_then_bb25
	;***      136 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***      137 : 				|| (g_mean_io_status.refined.AcidHighLevel == 1)) {
	;***      138 : 			g_mean_io_status.refined.AcidHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	set1 !LOWW(_g_mean_io_status).5
	;***      139 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 139
	oneb a
	ret
.BB@LABEL@4_5:	; if_else_bb
	;***      140 : 		}
	;***      141 : 	} else {
	;***      142 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 142
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
	;***      143 : 		g_mean_io_status.refined.AcidHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	clr1 !LOWW(_g_mean_io_status).5
	br $.BB@LABEL@4_3
_isAcidTankAlmostFull:
	.STACK _isAcidTankAlmostFull = 6
	;***      144 : 	}
	;***      145 : 	return 0;
	;***      146 : }
	;***      147 : uint8_t isAcidTankAlmostFull(void) {
	;***      148 : 	if (I_ACID_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@5_5
.BB@LABEL@5_1:	; if_then_bb
	;***      149 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
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
	movw ax, #LOWW(_g_Tick+0x0005C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@5_4
.BB@LABEL@5_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].4, $.BB@LABEL@5_4
.BB@LABEL@5_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	ret
.BB@LABEL@5_4:	; if_then_bb25
	;***      150 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      151 : 				|| (g_mean_io_status.refined.AcidLowLevel == 1)) {
	;***      152 : 			g_mean_io_status.refined.AcidLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	set1 !LOWW(_g_mean_io_status).4
	;***      153 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	oneb a
	ret
.BB@LABEL@5_5:	; if_else_bb
	;***      154 : 		}
	;***      155 : 	} else {
	;***      156 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 156
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
	;***      157 : 		g_mean_io_status.refined.AcidLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	clr1 !LOWW(_g_mean_io_status).4
	br $.BB@LABEL@5_3
_isAcidTankHasSomething:
	.STACK _isAcidTankHasSomething = 6
	;***      158 : 	}
	;***      159 : 	return 0;
	;***      160 : }
	;***      161 : uint8_t isAcidTankHasSomething(void) {
	;***      162 : 	if (I_ACID_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@6_5
.BB@LABEL@6_1:	; if_then_bb
	;***      163 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 163
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
	movw ax, #LOWW(_g_Tick+0x00060)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@6_4
.BB@LABEL@6_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].3, $.BB@LABEL@6_4
.BB@LABEL@6_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	ret
.BB@LABEL@6_4:	; if_then_bb25
	;***      164 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      165 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 1)) {
	;***      166 : 			g_mean_io_status.refined.AcidEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	set1 !LOWW(_g_mean_io_status).3
	;***      167 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 167
	oneb a
	ret
.BB@LABEL@6_5:	; if_else_bb
	;***      168 : 		}
	;***      169 : 	} else {
	;***      170 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00062), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00060), ax
	;***      171 : 		isAcidTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	call $!_isAcidTankEmpty
	br $.BB@LABEL@6_3
_isAcidTankEmpty:
	.STACK _isAcidTankEmpty = 6
	;***      172 : 	}
	;***      173 : 	return 0;
	;***      174 : }
	;***      175 : uint8_t isAcidTankEmpty(void) {
	;***      176 : 	if (I_ACID_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@7_2
.BB@LABEL@7_1:	; if_else_bb
	;***      177 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[3],
	;***      178 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      179 : 				|| (g_mean_io_status.refined.AcidEmptyLevel == 0)) {
	;***      180 : 			g_mean_io_status.refined.AcidEmptyLevel = 0;
	;***      181 : 			return 1;
	;***      182 : 		}
	;***      183 : 	} else {
	;***      184 : 		g_Tick.tickAcidLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00066), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00064), ax
	;***      185 : 		isAcidTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	call $!_isAcidTankHasSomething
	br $.BB@LABEL@7_4
.BB@LABEL@7_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
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
	movw ax, #LOWW(_g_Tick+0x00064)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@7_5
.BB@LABEL@7_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].3, $.BB@LABEL@7_5
.BB@LABEL@7_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	ret
.BB@LABEL@7_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	clr1 !LOWW(_g_mean_io_status).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	oneb a
	ret
_isAlkalineTankFull:
	.STACK _isAlkalineTankFull = 6
	;***      186 : 	}
	;***      187 : 	return 0;
	;***      188 : }
	;***      189 : uint8_t isAlkalineTankFull(void) {
	;***      190 : 	if (I_ALKALI_H_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 190
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@8_5
.BB@LABEL@8_1:	; if_then_bb
	;***      191 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
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
	movw ax, #LOWW(_g_Tick+0x00068)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@8_4
.BB@LABEL@8_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].2, $.BB@LABEL@8_4
.BB@LABEL@8_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	ret
.BB@LABEL@8_4:	; if_then_bb25
	;***      192 : 				g_timerSetting.t28_onDelayHighLevel_s * 1000)
	;***      193 : 				|| (g_mean_io_status.refined.AlkalineHighLevel == 1)) {
	;***      194 : 			g_mean_io_status.refined.AlkalineHighLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	set1 !LOWW(_g_mean_io_status).2
	;***      195 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	oneb a
	ret
.BB@LABEL@8_5:	; if_else_bb
	;***      196 : 		}
	;***      197 : 	} else {
	;***      198 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00068), ax
	;***      199 : 		g_mean_io_status.refined.AlkalineHighLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	clr1 !LOWW(_g_mean_io_status).2
	br $.BB@LABEL@8_3
_isAlkalineTankAlmostFull:
	.STACK _isAlkalineTankAlmostFull = 6
	;***      200 : 	}
	;***      201 : 	return 0;
	;***      202 : }
	;***      203 : uint8_t isAlkalineTankAlmostFull(void) {
	;***      204 : 	if (I_ALKALI_M_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@9_5
.BB@LABEL@9_1:	; if_then_bb
	;***      205 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 205
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
	movw ax, #LOWW(_g_Tick+0x0006C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@9_4
.BB@LABEL@9_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].1, $.BB@LABEL@9_4
.BB@LABEL@9_3:	; bb36
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	ret
.BB@LABEL@9_4:	; if_then_bb25
	;***      206 : 				g_timerSetting.t27_onDelayLowLevel_s * 1000)
	;***      207 : 				|| (g_mean_io_status.refined.AlkalineLowLevel == 1)) {
	;***      208 : 			g_mean_io_status.refined.AlkalineLowLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 208
	set1 !LOWW(_g_mean_io_status).1
	;***      209 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 209
	oneb a
	ret
.BB@LABEL@9_5:	; if_else_bb
	;***      210 : 		}
	;***      211 : 	} else {
	;***      212 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0006E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0006C), ax
	;***      213 : 		g_mean_io_status.refined.AlkalineLowLevel = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
	clr1 !LOWW(_g_mean_io_status).1
	br $.BB@LABEL@9_3
_isAlkalineTankHasSomething:
	.STACK _isAlkalineTankHasSomething = 6
	;***      214 : 	}
	;***      215 : 	return 0;
	;***      216 : }
	;***      217 : uint8_t isAlkalineTankHasSomething(void) {
	;***      218 : 	if (I_ALKALI_L_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@10_5
.BB@LABEL@10_1:	; if_then_bb
	;***      219 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
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
	movw ax, #LOWW(_g_Tick+0x00070)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@10_4
.BB@LABEL@10_2:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bt [hl].0, $.BB@LABEL@10_4
.BB@LABEL@10_3:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	ret
.BB@LABEL@10_4:	; if_then_bb25
	;***      220 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)
	;***      221 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 1)) {
	;***      222 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	set1 !LOWW(_g_mean_io_status).0
	;***      223 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	oneb a
	ret
.BB@LABEL@10_5:	; if_else_bb
	;***      224 : 		}
	;***      225 : 	} else {
	;***      226 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 226
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00072), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00070), ax
	;***      227 : 		isAlkalineTankEmpty();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	call $!_isAlkalineTankEmpty
	br $.BB@LABEL@10_3
_isAlkalineTankEmpty:
	.STACK _isAlkalineTankEmpty = 6
	;***      228 : 	}
	;***      229 : 	return 0;
	;***      230 : }
	;***      231 : uint8_t isAlkalineTankEmpty(void) {
	;***      232 : 	if (I_ALKALI_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 232
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_else_bb
	;***      233 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[3],
	;***      234 : 				g_timerSetting.t30_offDelayEmptyLevel_s * 1000)
	;***      235 : 				|| (g_mean_io_status.refined.AlkalineEmptyLevel == 0)) {
	;***      236 : 			g_mean_io_status.refined.AlkalineEmptyLevel = 0;
	;***      237 : 			return 1;
	;***      238 : 		}
	;***      239 : 	} else {
	;***      240 : 		g_Tick.tickAlkalineLevel[3] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00076), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00074), ax
	;***      241 : 		isAlkalineTankHasSomething();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	call $!_isAlkalineTankHasSomething
	br $.BB@LABEL@11_4
.BB@LABEL@11_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 233
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
	movw ax, #LOWW(_g_Tick+0x00074)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@11_5
.BB@LABEL@11_3:	; bb
	movw hl, #LOWW(_g_mean_io_status)
	bf [hl].0, $.BB@LABEL@11_5
.BB@LABEL@11_4:	; bb34
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	ret
.BB@LABEL@11_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
	clr1 !LOWW(_g_mean_io_status).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	oneb a
	ret
_sendToRasPi_f:
	.STACK _sendToRasPi_f = 6
	;***      242 : 	}
	;***      243 : 	return 0;
	;***      244 : }
	;***      245 : 
	;***      246 : //----------------------Begin code 11112021--------------------------------------
	;***      247 : void sendToRasPi_f(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	push hl
	;***      248 : 		float value) {
	;***      249 : 	uint8_t state = g_uart2_sendend;
	;***      250 : 	g_control_buffer_f.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	mov !LOWW(_g_control_buffer_f), a
	mov a, x
	;***      251 : 	g_control_buffer_f.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	mov !LOWW(_g_control_buffer_f+0x00001), a
	movw ax, bc
	;***      252 : 	g_control_buffer_f.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 252
	movw !LOWW(_g_control_buffer_f+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_f+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      253 : 	R_UART2_Send((uint8_t*) &g_control_buffer_f, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_f)
	call !!_R_UART2_Send
.BB@LABEL@12_1:	; bb9
	mov a, [sp+0x00]
	;***      254 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@12_1
.BB@LABEL@12_2:	; return
	;***      255 : 		;
	;***      256 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	pop hl
	ret
_sendToRasPi_u32:
	.STACK _sendToRasPi_u32 = 6
	;***      257 : void sendToRasPi_u32(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
	push hl
	;***      258 : 		uint32_t value) {
	;***      259 : 	uint8_t state = g_uart2_sendend;
	;***      260 : 	g_control_buffer_u32.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 260
	mov !LOWW(_g_control_buffer_u32), a
	mov a, x
	;***      261 : 	g_control_buffer_u32.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 261
	mov !LOWW(_g_control_buffer_u32+0x00001), a
	movw ax, bc
	;***      262 : 	g_control_buffer_u32.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	movw !LOWW(_g_control_buffer_u32+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer_u32+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      263 : 	R_UART2_Send((uint8_t*) &g_control_buffer_u32, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer_u32)
	call !!_R_UART2_Send
.BB@LABEL@13_1:	; bb9
	mov a, [sp+0x00]
	;***      264 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@13_1
.BB@LABEL@13_2:	; return
	;***      265 : 		;
	;***      266 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	pop hl
	ret
_sendRS485:
	.STACK _sendRS485 = 6
	;***      267 : struct UART3_Buffer_s {
	;***      268 : 	uint8_t busy;
	;***      269 : 	uint8_t head; // 1 byte
	;***      270 : 	uint8_t set_number; // 1 byte
	;***      271 : 	uint8_t set_value[4]; // 4 byte
	;***      272 : } water_solfner_buf;
	;***      273 : void sendRS485(uint8_t busy, uint8_t head, uint8_t type, uint32_t value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	push hl
	;***      274 : 	uint8_t state = g_uart3_sendend;
	;***      275 : 	btod.raw = value;
	;***      276 : 	water_solfner_buf.busy = busy;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	mov !LOWW(_water_solfner_buf), a
	mov a, x
	;***      277 : 	water_solfner_buf.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	mov !LOWW(_water_solfner_buf+0x00001), a
	mov a, c
	;***      278 : 	water_solfner_buf.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 278
	mov !LOWW(_water_solfner_buf+0x00002), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 274
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	movw ax, [sp+0x08]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	movw !LOWW(_btod+0x00002), ax
	movw ax, [sp+0x06]
	movw !LOWW(_btod), ax
	clrb a
.BB@LABEL@14_1:	; bb
	mov b, a
	;***      279 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      280 : 		water_solfner_buf.set_value[i] = btod.refined.data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 280
	mov a, LOWW(_btod)[b]
	mov LOWW(_water_solfner_buf+0x00003)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 279
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@14_1
.BB@LABEL@14_2:	; bb25
	;***      281 : 	}
	;***      282 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	set1 0xFFF00.0
	;***      283 : 	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	movw bc, #0x0007
	movw ax, #LOWW(_water_solfner_buf)
	call !!_R_UART3_Send
.BB@LABEL@14_3:	; bb28
	mov a, [sp+0x00]
	;***      284 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@14_3
.BB@LABEL@14_4:	; return
	;***      285 : 		;
	;***      286 : 
	;***      287 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	pop hl
	ret
_sendR485_7byte:
	.STACK _sendR485_7byte = 16
	;***      288 : void sendR485_7byte(uint8_t addr, uint8_t head, uint8_t *val5) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	subw sp, #0x0A
	mov h, a
	push bc
	pop de
	;***      289 : 	uint8_t buf[7] = { addr, head };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
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
	;***      290 : 	uint8_t state = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x07], a
.BB@LABEL@15_1:	; bb
	movw ax, sp
	movw [sp+0x08], ax
	mov a, b
	add a, #0x02
	mov c, a
	;***      291 : 	for (uint8_t i = 2; i < 7; i++) {
	;***      292 : 		buf[i] = val5[i - 2];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
	shrw ax, 8+0x00000
	addw ax, de
	decw ax
	decw ax
	movw hl, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	inc b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
	mov a, [hl]
	mov h, a
	movw ax, [sp+0x08]
	xchw ax, hl
	mov [hl+c], a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	cmp a, #0x05
	bnz $.BB@LABEL@15_1
.BB@LABEL@15_2:	; bb31
	;***      293 : 	}
	;***      294 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
	set1 0xFFF00.0
	;***      295 : 	R_UART3_Send(buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 295
	movw bc, #0x0007
	movw ax, sp
	call !!_R_UART3_Send
.BB@LABEL@15_3:	; bb35
	mov a, [sp+0x07]
	;***      296 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@15_3
.BB@LABEL@15_4:	; return
	;***      297 : 		;
	;***      298 : 
	;***      299 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	addw sp, #0x0A
	ret
_isThisCommand:
	.STACK _isThisCommand = 6
	;***      300 : uint8_t isThisCommand(uint8_t *input_buf, enum UART_header_e header,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 300
	push hl
	movw hl, ax
	mov a, b
	mov [sp+0x00], a
	clrb a
	mov b, a
.BB@LABEL@16_1:	; bb
	;***      301 : 		enum Control_status control, uint32_t data) {
	;***      302 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      303 : 		btod.refined.data[i] = input_buf[2 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	shrw ax, 8+0x00000
	addw ax, hl
	incw ax
	incw ax
	movw de, ax
	mov a, [de]
	mov LOWW(_btod)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@16_1
.BB@LABEL@16_2:	; bb23
	mov a, c
	;***      304 : 	}
	;***      305 : 
	;***      306 : 	if ((input_buf[0] == header) && (input_buf[1] == control)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 306
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
	;***      307 : 			&& (btod.raw == data))
	;***      308 : 		return 2;
	;***      309 : 	else if ((input_buf[0] == header) && (input_buf[1] == control))
	;***      310 : 		return 1;
	;***      311 : 	else
	;***      312 : 		return 0;
	;***      313 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	mov a, #0x02
	bz $.BB@LABEL@16_9
.BB@LABEL@16_7:	; bb70
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	cmp a, [hl+0x01]
	oneb a
	skz
.BB@LABEL@16_8:	; bb70
	clrb a
.BB@LABEL@16_9:	; bb70
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	ret
.BB@LABEL@16_10:	; if_else_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 312
	clrb a
	br $.BB@LABEL@16_9
_RaspberryResponse_nostop:
	.STACK _RaspberryResponse_nostop = 10
	;***      314 : /**
	;***      315 :  * Handle all response to Raspberry command.
	;***      316 :  */
	;***      317 : uint8_t *const time_setting_p = (uint8_t*) &_settingTime;
	;***      318 : uint8_t *const number_setting_p = (uint8_t*) &_settingNumber;
	;***      319 : struct UART_Buffer_float_s test_control_buf = { H_READ, READ_TIME, 0x000000ff };
	;***      320 : void RaspberryResponse_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 320
	push hl
	;***      321 : 	//TODO: I'm doing here
	;***      322 : 	if (commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 322
	cmp0 !LOWW(_commnunication_flag)
	bz $.BB@LABEL@17_7
.BB@LABEL@17_1:	; if_then_bb
	;***      323 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 323
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      324 : 		if (g_machine_state.user == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 324
	cmp !LOWW(_g_machine_state+0x00009), #0x02
	sknz
.BB@LABEL@17_2:	; if_then_bb20
	;***      325 : 			g_machine_state.user = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	oneb !LOWW(_g_machine_state+0x00009)
.BB@LABEL@17_3:	; if_break_bb
	;***      326 : 		}
	;***      327 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 327
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@17_4:	; bb22
	mov a, [sp+0x00]
	;***      328 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 328
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_6
.BB@LABEL@17_5:	; bb
	;***      329 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 329
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_4
.BB@LABEL@17_6:	; bb30
	;***      330 : 		}
	;***      331 : 		commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 331
	clrb !LOWW(_commnunication_flag)
.BB@LABEL@17_7:	; if_break_bb31
	;***      332 : 	}
	;***      333 : 	if (commnunication_flag.send_response_mode_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 333
	cmp !LOWW(_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@17_9
.BB@LABEL@17_8:	; if_then_bb37
	;***      334 : 		sendToRasPi_u32(H_READ, WASHING_MODE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 334
	mov a, !LOWW(_g_machine_mode)
	clrb x
	movw de, ax
	clrw bc
	movw ax, #0x5218
	call $!_sendToRasPi_u32
	;***      335 : 				(uint32_t) g_machine_mode << (8 * 3));
	;***      336 : //		sendToRasPi_u32(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
	;***      337 : 		commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 337
	clrb !LOWW(_commnunication_flag+0x00006)
.BB@LABEL@17_9:	; if_break_bb41
	;***      338 : 	}
	;***      339 : 	if (commnunication_flag.send_respone_status_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 339
	cmp0 !LOWW(_commnunication_flag+0x00005)
	bz $.BB@LABEL@17_14
.BB@LABEL@17_10:	; if_then_bb47
	;***      340 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 340
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      341 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 341
	movw bc, #0x0005
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@17_11:	; bb53
	mov a, [sp+0x00]
	;***      342 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 342
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_13
.BB@LABEL@17_12:	; bb52
	;***      343 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 343
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_11
.BB@LABEL@17_13:	; bb61
	;***      344 : 		}
	;***      345 : 		commnunication_flag.send_respone_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 345
	clrb !LOWW(_commnunication_flag+0x00005)
.BB@LABEL@17_14:	; if_break_bb62
	;***      346 : 	}
	;***      347 : 	if (commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 347
	cmp0 !LOWW(_commnunication_flag+0x00001)
	bz $.BB@LABEL@17_19
.BB@LABEL@17_15:	; if_then_bb68
	;***      348 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 348
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      349 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 349
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x0008C), a
	;***      350 : 				timeSettingSize - 1);
	;***      351 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 351
	movw bc, #0x008D
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@17_16:	; bb79
	mov a, [sp+0x00]
	;***      352 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 352
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_18
.BB@LABEL@17_17:	; bb78
	;***      353 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 353
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_16
.BB@LABEL@17_18:	; bb87
	;***      354 : 		}
	;***      355 : 		commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 355
	clrb !LOWW(_commnunication_flag+0x00001)
.BB@LABEL@17_19:	; if_break_bb88
	;***      356 : 	}
	;***      357 : 	if (commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 357
	cmp0 !LOWW(_commnunication_flag+0x00002)
	bz $.BB@LABEL@17_24
.BB@LABEL@17_20:	; if_then_bb94
	;***      358 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 358
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      359 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 359
	mov c, #0x24
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00024), a
	;***      360 : 				numberSettingSize - 1);
	;***      361 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 361
	movw bc, #0x0025
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@17_21:	; bb105
	mov a, [sp+0x00]
	;***      362 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 362
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@17_23
.BB@LABEL@17_22:	; bb104
	;***      363 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 363
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_21
.BB@LABEL@17_23:	; bb113
	;***      364 : 		}
	;***      365 : 		commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 365
	clrb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@17_24:	; if_break_bb114
	;***      366 : 	}
	;***      367 : 	if (commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 367
	cmp !LOWW(_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@17_40
.BB@LABEL@17_25:	; if_break_bb114.bb171_crit_edge
	clrb a
	mov b, a
.BB@LABEL@17_26:	; bb171
	;***      368 : //		//Do not Edit this, must keep!!!!
	;***      369 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 369
	cmp a, #0x8C
	bnc $.BB@LABEL@17_36
.BB@LABEL@17_27:	; bb121
	;***      370 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 370
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
	;***      371 : //			case 3:
	;***      372 : //				pointer0[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
	;***      373 : //				break;
	;***      374 : //			case 2:
	;***      375 : //				pointer0[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
	;***      376 : //				break;
	;***      377 : //			case 1:
	;***      378 : //				pointer0[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
	;***      379 : //				break;
	;***      380 : //			case 0:
	;***      381 : //				pointer0[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
	;***      382 : //				break;
	;***      383 : //			default:
	;***      384 : //				break;
	;***      385 : 			case 3:
	;***      386 : 				time_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 386
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFD)
.BB@LABEL@17_31:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@17_35
.BB@LABEL@17_32:	; switch_clause_bb135
	;***      387 : 				break;
	;***      388 : 			case 2:
	;***      389 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 389
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@17_31
.BB@LABEL@17_33:	; switch_clause_bb146
	;***      390 : 				break;
	;***      391 : 			case 1:
	;***      392 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 392
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@17_35
.BB@LABEL@17_34:	; switch_clause_bb157
	;***      393 : 				break;
	;***      394 : 			case 0:
	;***      395 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 395
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@17_35:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@17_26
.BB@LABEL@17_36:	; bb180
	;***      396 : 				break;
	;***      397 : 			default:
	;***      398 : 				break;
	;***      399 : 			}
	;***      400 : 		}
	;***      401 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 401
	mov a, !LOWW(_g_rx_data+0x0008C)
	mov [sp+0x00], a
	mov !LOWW(__settingTime+0x0008C), a
	;***      402 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 402
	mov c, #0x8C
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp x, a
	bnz $.BB@LABEL@17_38
.BB@LABEL@17_37:	; if_then_bb203
	;***      403 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
	;***      404 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 404
	movw de, #0x008E
	movw bc, #LOWW(__settingTime)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	clrw ax
	;***      405 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 405
	push ax
	mov x, #0x8D
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      406 : 					timeSettingSize);
	;***      407 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 407
	clrb x
	br $.BB@LABEL@17_39
.BB@LABEL@17_38:	; if_else_bb
	;***      408 : 		} else {
	;***      409 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 409
	mov x, #0x16
.BB@LABEL@17_39:	; if_else_bb
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi_f
	;***      410 : 		}
	;***      411 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      412 : 		commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 412
	clrb !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@17_40:	; if_break_bb207
	;***      413 : 	}
	;***      414 : 
	;***      415 : 	if (commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 415
	cmp !LOWW(_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@17_56
.BB@LABEL@17_41:	; if_break_bb207.bb266_crit_edge
	clrb a
	mov b, a
.BB@LABEL@17_42:	; bb266
	;***      416 : //		//Do not Edit this, must keep!!!!
	;***      417 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 417
	cmp a, #0x24
	bnc $.BB@LABEL@17_52
.BB@LABEL@17_43:	; bb214
	;***      418 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 418
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
	;***      419 : 			case 3:
	;***      420 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 420
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@17_47:	; switch_clause_bb218
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@17_51
.BB@LABEL@17_48:	; switch_clause_bb229
	;***      421 : 				break;
	;***      422 : 			case 2:
	;***      423 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 423
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@17_47
.BB@LABEL@17_49:	; switch_clause_bb240
	;***      424 : 				break;
	;***      425 : 			case 1:
	;***      426 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 426
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@17_51
.BB@LABEL@17_50:	; switch_clause_bb251
	;***      427 : 				break;
	;***      428 : 			case 0:
	;***      429 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 429
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@17_51:	; switch_break_bb263
	inc b
	mov a, b
	br $.BB@LABEL@17_42
.BB@LABEL@17_52:	; bb275
	;***      430 : 				break;
	;***      431 : 			default:
	;***      432 : 				break;
	;***      433 : 			}
	;***      434 : 		}
	;***      435 : 		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 435
	mov c, #0x24
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov !LOWW(__settingNumber+0x00024), a
	;***      436 : 				numberSettingSize - 1);
	;***      437 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 437
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
	;***      438 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      439 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 439
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call $!_sendToRasPi_f
	;***      440 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 440
	movw de, #0x0026
	movw bc, #LOWW(__settingNumber)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	clrw ax
	;***      441 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 441
	push ax
	mov x, #0x25
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      442 : 					numberSettingSize);
	;***      443 : 			sendToRasPi_f(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 443
	clrb x
	br $.BB@LABEL@17_55
.BB@LABEL@17_54:	; if_else_bb300
	;***      444 : 		} else {
	;***      445 : 			sendToRasPi_f(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 445
	mov x, #0x16
.BB@LABEL@17_55:	; if_else_bb300
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi_f
	;***      446 : 		}
	;***      447 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      448 : 		commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 448
	clrb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@17_56:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 450
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 4
	;***      449 : 	}
	;***      450 : }
	;***      451 : /**
	;***      452 :  * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
	;***      453 :  * 13/12/2021: Checked!
	;***      454 :  */
	;***      455 : void InitialOperationModeStart(void) {
	;***      456 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 456
	call $!_UpdateMachineStatus
.BB@LABEL@18_1:	; bb72
	;***      457 : 	while (1) {
	;***      458 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 458
	call $!_RaspberryResponse_nostop
	;***      459 : 		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7; // Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 459
	mov a, 0xFFF07
	mov1 CY, a.1
	mov a, #0x80
	sknc
.BB@LABEL@18_2:	; bb7
	and a, 0xFFF06
.BB@LABEL@18_3:	; bb11
	mov x, a
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      460 : 		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6; // Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 460
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x40
	sknc
.BB@LABEL@18_4:	; bb27
	and a, 0xFFF06
.BB@LABEL@18_5:	; bb33
	mov x, a
	mov a, #0xBF
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      461 : 		if (isAcidTankEmpty()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 461
	call $!_isAcidTankEmpty
	cmp0 a
	skz
.BB@LABEL@18_6:	; if_then_bb
	;***      462 : 			O_DRAIN_ACID_PIN_SV7 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 462
	clr1 0xFFF06.7
.BB@LABEL@18_7:	; if_break_bb
	;***      463 : 		}
	;***      464 : 		if (isAlkalineTankEmpty()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 464
	call $!_isAlkalineTankEmpty
	cmp0 a
	skz
.BB@LABEL@18_8:	; if_then_bb52
	;***      465 : 			O_DRAIN_ALK_PIN_SV6 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 465
	clr1 0xFFF06.6
.BB@LABEL@18_9:	; if_break_bb53
	mov a, #0x80
	;***      466 : 		}
	;***      467 : 		if ((O_DRAIN_ACID_PIN_SV7 == OFF) & (O_DRAIN_ALK_PIN_SV6 == OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 467
	and a, 0xFFF06
	mov x, a
	mov a, 0xFFF06
	bt a.6, $.BB@LABEL@18_11
.BB@LABEL@18_10:	; if_break_bb53
	cmp0 x
	bz $.BB@LABEL@18_12
.BB@LABEL@18_11:	; if_break_bb71
	;***      468 : 			break;
	;***      469 : 		}
	;***      470 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 470
	call $!_UpdateMachineStatus
	;***      471 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 471
	call !!_R_WDT_Restart
	br $.BB@LABEL@18_1
.BB@LABEL@18_12:	; return
	;***      472 : 	}
	;***      473 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 473
	ret
_WaterSupplyOperation_nostop:
	.STACK _WaterSupplyOperation_nostop = 14
	;***      474 : ///**
	;***      475 : // * FlowSensorCheck
	;***      476 : // * 30/11/2021: Checked!
	;***      477 : // * @return 0 is Error, 1 is OK, 2 Still taking
	;***      478 : // */
	;***      479 : //uint8_t FlowSensorCheck(uint32_t *_time) {
	;***      480 : ////	g_flow_value = measureFlowSensor();
	;***      481 : //	if ((g_flow_value < g_numberSetting.upperFlow)
	;***      482 : //			& (g_flow_value > g_numberSetting.lowerFlow)) {
	;***      483 : //		return 1;
	;***      484 : //	} else {
	;***      485 : //		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      486 : //		return 0;
	;***      487 : //	}
	;***      488 : //}
	;***      489 : /**
	;***      490 :  * WaterSupplyOperation
	;***      491 :  * 30/11/2021: Checked by An
	;***      492 :  */
	;***      493 : uint8_t WaterSupplyOperation_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 493
	subw sp, #0x06
	;***      494 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      495 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      496 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 496
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
.BB@LABEL@19_7:	; switch_clause_bb81
	;***      497 : 	case 0:
	;***      498 : 		*tick = g_systemTime;
	;***      499 : 		(*state)++;
	;***      500 : 		break;
	;***      501 : 	case 1:
	;***      502 : 		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
	;***      503 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 30000)) {
	;***      504 : 			(*state)++;
	;***      505 : 		}
	;***      506 : 		break;
	;***      507 : 	case 2:
	;***      508 : 		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      509 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 500)) {
	;***      510 : 			(*state)++;
	;***      511 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      512 : 		}
	;***      513 : 		break;
	;***      514 : 	case 3:
	;***      515 : 		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      516 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 15000)) {
	;***      517 : 			(*state)++;
	;***      518 : 			g_machine_state.flowSensor = 0;
	;***      519 : 		}
	;***      520 : 		measureFlowSensor_nostop();
	;***      521 : 		break;
	;***      522 : 	case 4:
	;***      523 : 		measureFlowSensor(&g_timerSetting.t3_flowSensorMonitorTime_s);
	;***      524 : 		(*state)++;
	;***      525 : 		break;
	;***      526 : 	case 5:
	;***      527 : 		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      528 : 				|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      529 : 			(*state) = 3;
	;***      530 : 			sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	;***      531 : 					g_io_status.refined.FlowValue);
	;***      532 : 		} else
	;***      533 : 			(*state)++;
	;***      534 : 		g_Tick.tickWaterSupply = g_systemTime;
	;***      535 : 		break;
	;***      536 : 	case 6:
	;***      537 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply,
	;***      538 : 				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
	;***      539 : 			(*state)++;
	;***      540 : 		}
	;***      541 : 		break;
	;***      542 : 	default:
	;***      543 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 543
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@19_15
.BB@LABEL@19_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 498
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 499
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@19_15
.BB@LABEL@19_9:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 502
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 503
	clrw ax
	movw de, ax
	movw bc, #0x7530
	br $!.BB@LABEL@19_24
.BB@LABEL@19_10:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 508
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_15
.BB@LABEL@19_11:	; if_then_bb23
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 510
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 511
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00024), ax
	br $.BB@LABEL@19_15
.BB@LABEL@19_12:	; switch_clause_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 515
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 516
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_14
.BB@LABEL@19_13:	; if_then_bb34
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 517
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 518
	clrb !LOWW(_g_machine_state+0x00005)
.BB@LABEL@19_14:	; if_break_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 520
	call $!_measureFlowSensor_nostop
.BB@LABEL@19_15:	; if_break_bb38
	br $.BB@LABEL@19_22
.BB@LABEL@19_16:	; switch_clause_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 523
	movw ax, #LOWW(_g_timerSetting+0x00008)
	call $!_measureFlowSensor
	br $.BB@LABEL@19_25
.BB@LABEL@19_17:	; switch_clause_bb45
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 527
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 533
	inc a
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@19_21
.BB@LABEL@19_20:	; if_then_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 529
	mov !LOWW(_g_machine_state+0x00004), #0x03
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 530
	movw ax, #0x4104
	call $!_sendToRasPi_f
.BB@LABEL@19_21:	; if_break_bb67
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 534
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
.BB@LABEL@19_22:	; if_break_bb67
	br $.BB@LABEL@19_26
.BB@LABEL@19_23:	; switch_clause_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 537
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
.BB@LABEL@19_24:	; switch_clause_bb69
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@19_25:	; if_then_bb76
	inc !LOWW(_g_machine_state+0x00004)
.BB@LABEL@19_26:	; switch_break_bb
	;***      544 : 		break;
	;***      545 : 	}
	;***      546 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 546
	call !!_R_WDT_Restart
	;***      547 : 	if (*state == 6 + 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 547
	cmp !LOWW(_g_machine_state+0x00004), #0x07
	bnz $.BB@LABEL@19_28
.BB@LABEL@19_27:	; if_then_bb89
	;***      548 : 		g_machine_state.flowSensor = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 548
	clrb !LOWW(_g_machine_state+0x00005)
	;***      549 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 549
	clrb !LOWW(_g_machine_state+0x00004)
	;***      550 : 		return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 550
	clrb a
	br $.BB@LABEL@19_29
.BB@LABEL@19_28:	; bb95
	;***      551 : 	} else
	;***      552 : 		return 1;
	;***      553 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 553
	oneb a
.BB@LABEL@19_29:	; bb95
	addw sp, #0x06
	ret
_stop_waitAlarmConfirm:
	.STACK _stop_waitAlarmConfirm = 10
	;***      554 : void stop_waitAlarmConfirm(enum Control_status alarm, uint8_t timeout_s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 554
	subw sp, #0x04
	push ax
	;***      555 : 	uint32_t _tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 555
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@20_1:	; bb23
	mov a, [sp+0x01]
	;***      556 : 	while (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 556
	cmp a, !LOWW(_commnunication_flag+0x00007)
	bz $.BB@LABEL@20_4
.BB@LABEL@20_2:	; bb
	;***      557 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 557
	call $!_realTimeResponse
	mov a, [sp+0x00]
	;***      558 : 		if ((ns_delay_ms(&_tick, timeout_s * 1000)) && (timeout_s != 0)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 558
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
	;***      559 : 			break;
	;***      560 : 		}
	;***      561 : 	}
	;***      562 : 	commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 562
	clrb !LOWW(_commnunication_flag+0x00007)
	addw sp, #0x06
	ret
_nostop_waitAlarmConfirm:
	.STACK _nostop_waitAlarmConfirm = 4
	;***      563 : }
	;***      564 : uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 564
	cmp a, !LOWW(_commnunication_flag+0x00007)
	;***      565 : 	if (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 565
	bnz $.BB@LABEL@21_2
.BB@LABEL@21_1:	; if_break_bb
	;***      566 : 		return 1;
	;***      567 : 	}
	;***      568 : 	commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 568
	clrb !LOWW(_commnunication_flag+0x00007)
	;***      569 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 569
	clrb a
	ret
.BB@LABEL@21_2:	; bb9
	;***      570 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 570
	oneb a
	ret
_resetAlarm:
	.STACK _resetAlarm = 4
	;***      571 : void resetAlarm(void) {
	;***      572 : 	commnunication_flag.alarm_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 572
	oneb !LOWW(_commnunication_flag+0x00007)
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      573 : }
	;***      574 : 
	;***      575 : /**
	;***      576 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      577 :  * 30/11/2021: Checked by An
	;***      578 :  * @return 0 - OK; 1 - Error
	;***      579 :  */
	;***      580 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 580
	subw sp, #0x0A
	;***      581 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 581
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
	;***      582 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 582
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 596
	ret
.BB@LABEL@23_8:	; if_then_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 572
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      583 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      584 : 			resetAlarm();
	;***      585 : 			sendToRasPi_f(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 585
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4105
	call $!_sendToRasPi_f
	;***      586 : 					g_io_status.refined.CVCCVoltage);
	;***      587 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 587
	set1 !LOWW(_g_alarm).0
	;***      588 : 			g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 588
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@23_9:	; if_then_bb11.bb23_crit_edge
	oneb a
.BB@LABEL@23_10:	; bb23
	mov !LOWW(_g_machine_state+0x00008), a
	;***      589 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 589
	movw ax, #0x0500
	call $!_stop_waitAlarmConfirm
	;***      590 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 590
	clr1 !LOWW(_g_alarm).0
	;***      591 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 591
	oneb a
	br $.BB@LABEL@23_7
.BB@LABEL@23_11:	; if_else_bb
	;***      592 : 		}
	;***      593 : 	} else
	;***      594 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 594
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	br $.BB@LABEL@23_6
_Voltage2Check_nostop:
	.STACK _Voltage2Check_nostop = 18
	;***      595 : 	return 0;
	;***      596 : }
	;***      597 : /**
	;***      598 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      599 :  * 16/12/2021: Checked by An
	;***      600 :  * @return 0 - OK
	;***      601 :  */
	;***      602 : void Voltage2Check_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 602
	subw sp, #0x0A
	;***      603 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 603
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
	;***      604 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 604
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
	;***      605 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      606 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 606
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 572
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      607 : 					>= g_numberSetting.upperVoltage1)) {
	;***      608 : 				resetAlarm();
	;***      609 : 				g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 609
	set1 !LOWW(_g_alarm).1
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      610 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 610
	movw ax, #0x4106
	addw sp, #0x0A
	br $!_sendToRasPi_f
.BB@LABEL@24_8:	; if_else_bb
	;***      611 : 						g_io_status.refined.CVCCVoltage);
	;***      612 : 			}
	;***      613 : 		}
	;***      614 : 	} else {
	;***      615 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 615
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      616 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 616
	clr1 !LOWW(_g_alarm).1
.BB@LABEL@24_9:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 618
	ret
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      617 : 	}
	;***      618 : }
	;***      619 : /**
	;***      620 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      621 :  * 16/12/2021: Checked by An
	;***      622 :  * @return 0 - OK; 1 - Error
	;***      623 :  */
	;***      624 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 624
	subw sp, #0x0A
	;***      625 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 625
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
	;***      626 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 626
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
	;***      627 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      628 : 			if (!(g_io_status.refined.CVCCVoltage
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 628
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 572
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      629 : 					>= g_numberSetting.upperVoltage2)) {
	;***      630 : 				resetAlarm();
	;***      631 : 				g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 631
	set1 !LOWW(_g_alarm).2
	;***      632 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 632
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      633 : 				g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 633
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
	;***      634 : 				sendToRasPi_f(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 634
	movw ax, #0x4107
	call $!_sendToRasPi_f
	;***      635 : 						g_io_status.refined.CVCCVoltage);
	;***      636 : 				stop_waitAlarmConfirm(OVER_VOLTAGE_3, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 636
	movw ax, #0x0700
	call $!_stop_waitAlarmConfirm
	;***      637 : 				g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 637
	clr1 !LOWW(_g_alarm).2
	;***      638 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 638
	oneb a
	br $.BB@LABEL@25_12
.BB@LABEL@25_10:	; if_else_bb
	;***      639 : 			}
	;***      640 : 		}
	;***      641 : 	} else {
	;***      642 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 642
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
.BB@LABEL@25_11:	; bb48
	clrb a
.BB@LABEL@25_12:	; bb48
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 645
	ret
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      643 : 	}
	;***      644 : 	return 0;
	;***      645 : }
	;***      646 : /**
	;***      647 :  * Checked 16/12/2021
	;***      648 :  * @return
	;***      649 :  */
	;***      650 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 650
	subw sp, #0x0A
	;***      651 : 	if ((g_systemTime - g_TickKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 651
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
	subw ax, !LOWW(_g_TickKeeper@1+0x00010)
	movw hl, ax
	movw ax, [sp+0x00]
	sknc
.BB@LABEL@26_1:	; entry
	decw ax
.BB@LABEL@26_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@1+0x00012)
	cmpw ax, bc
	movw ax, hl
	sknz
.BB@LABEL@26_3:	; entry
	cmpw ax, de
.BB@LABEL@26_4:	; entry
	.bc $!.BB@LABEL@26_16
.BB@LABEL@26_5:	; if_then_bb
	;***      652 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      653 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 653
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
	;***      654 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 654
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 671
	ret
.BB@LABEL@26_13:	; if_then_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 572
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      655 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      656 : 				resetAlarm();
	;***      657 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 657
	set1 !LOWW(_g_alarm).5
	;***      658 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 658
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      659 : 				g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 659
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@26_14:	; if_then_bb20.bb32_crit_edge
	oneb a
.BB@LABEL@26_15:	; bb32
	mov !LOWW(_g_machine_state+0x00008), a
	;***      660 : 				sendToRasPi_f(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 660
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4108
	call $!_sendToRasPi_f
	;***      661 : 						g_io_status.refined.CVCCVoltage);
	;***      662 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 662
	movw ax, #0x0800
	call $!_stop_waitAlarmConfirm
	;***      663 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 663
	clr1 !LOWW(_g_alarm).5
	;***      664 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 664
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
	;***      665 : 			}
	;***      666 : 		} else
	;***      667 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      668 : 	} else
	;***      669 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      670 : 	return 0;
	;***      671 : }
	;***      672 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 672
	subw sp, #0x0E
	;***      673 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 673
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      674 : 	const uint16_t _max_time = 10000;
	;***      675 : 	if (g_systemTime - g_TickKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 675
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TickKeeper@1+0x00010)
	movw de, ax
	movw ax, bc
	sknc
.BB@LABEL@27_1:	; entry
	decw ax
.BB@LABEL@27_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@1+0x00012)
	clrw bc
	cmpw ax, bc
	movw ax, de
	sknz
.BB@LABEL@27_3:	; entry
	cmpw ax, #0x1388
.BB@LABEL@27_4:	; entry
	.bc $!.BB@LABEL@27_34
.BB@LABEL@27_5:	; if_then_bb
	;***      676 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 676
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
	;***      677 : 				|| (g_io_status.refined.CVCCCurrent
	;***      678 : 						>= g_numberSetting.upperCurrent)) {
	;***      679 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 679
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
	;***      680 : 					&& (g_alarm.refined.overCurrent == 0)
	;***      681 : 					&& (g_io_status.refined.CVCCCurrent
	;***      682 : 							<= g_numberSetting.lowerCurrent)) {
	;***      683 : 				sendToRasPi_f(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 683
	movw ax, #0x4109
	call $!_sendToRasPi_f
.BB@LABEL@27_18:	; if_break_bb
	;***      684 : 						g_io_status.refined.CVCCCurrent);
	;***      685 : 			}
	;***      686 : 			g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 686
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
	;***      687 : 					g_io_status.refined.CVCCCurrent
	;***      688 : 							<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      689 : 
	;***      690 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 690
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
	;***      691 : 					>= g_numberSetting.upperCurrent) {
	;***      692 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 692
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_34
.BB@LABEL@27_30:	; if_then_bb88
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 572
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      693 : 					resetAlarm();
	;***      694 : 					g_alarm.refined.overCurrent = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 694
	set1 !LOWW(_g_alarm).3
	;***      695 : 					g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 695
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      696 : 					g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 696
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@27_31:	; if_then_bb88.bb102_crit_edge
	oneb a
.BB@LABEL@27_32:	; bb102
	mov !LOWW(_g_machine_state+0x00008), a
	;***      697 : 					sendToRasPi_f(H_ALARM, OVER_CURRENT,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 697
	movw bc, !LOWW(_g_io_status+0x0000E)
	movw de, !LOWW(_g_io_status+0x00010)
	movw ax, #0x410A
	call $!_sendToRasPi_f
	;***      698 : 							g_io_status.refined.CVCCCurrent);
	;***      699 : 					stop_waitAlarmConfirm(OVER_CURRENT, 10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 699
	movw ax, #0x0A0A
	call $!_stop_waitAlarmConfirm
	;***      700 : 					g_alarm.refined.overCurrent = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 700
	clr1 !LOWW(_g_alarm).3
	;***      701 : 					return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 701
	oneb a
	br $.BB@LABEL@27_35
.BB@LABEL@27_33:	; if_else_bb
	;***      702 : 				}
	;***      703 : 			} else {
	;***      704 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 704
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@27_34:	; bb117
	clrb a
.BB@LABEL@27_35:	; bb117
	addw sp, #0x0E
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 709
	ret
_ElectrolyticOperation_nostop:
	.STACK _ElectrolyticOperation_nostop = 4
	;***      705 : 			}
	;***      706 : 		}
	;***      707 : 	}
	;***      708 : 	return 0;
	;***      709 : }
	;***      710 : uint8_t ElectrolyticOperation_nostop(void) {
	;***      711 : 	uint8_t *state = &g_machine_state.electrolyteOperation;
	;***      712 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 712
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
	;***      713 : 		case 0:
	;***      714 : 			(*state)++;
	;***      715 : 			break;
	;***      716 : 		case 1:
	;***      717 : 			electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 717
	call $!_electrolyticOperationON
	;***      718 : 			g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 718
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	;***      719 : 			g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 719
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      720 : 			g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 720
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
	;***      721 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 721
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	;***      722 : 			g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 722
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
	br $.BB@LABEL@28_17
.BB@LABEL@28_6:	; switch_clause_bb16
	;***      723 : 			(*state)++;
	;***      724 : 			break;
	;***      725 : 		case 2:
	;***      726 : 			Voltage2Check_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 726
	call $!_Voltage2Check_nostop
	;***      727 : 			if (Voltage1Check_waitReset()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 727
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_7:	; if_else_bb
	;***      728 : 				(*state)--;
	;***      729 : 				break;
	;***      730 : 
	;***      731 : 			}else if(Voltage3Check_waitReset()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 731
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_8:	; if_else_bb35
	;***      732 : 				(*state)--;
	;***      733 : 				break;
	;***      734 : 			}else if(LowVoltageCheck_waitReset()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 734
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_9:	; if_else_bb46
	;***      735 : 				(*state)--;
	;***      736 : 				break;
	;***      737 : 			}else if(OverCurrentCheck_waitReset()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 737
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@28_14
.BB@LABEL@28_10:	; if_else_bb57
	;***      738 : 				(*state)--;
	;***      739 : 				break;
	;***      740 : 			}else if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 740
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@28_15
.BB@LABEL@28_11:	; if_then_bb65
	;***      741 : 				g_alarm.refined.cvcc = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 741
	set1 !LOWW(_g_alarm).7
	;***      742 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 742
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	;***      743 : 				g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 743
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@28_12:	; if_then_bb65.bb78_crit_edge
	oneb a
.BB@LABEL@28_13:	; bb78
	mov !LOWW(_g_machine_state+0x00008), a
	;***      744 : 				sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 744
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi_f
	;***      745 : 				stop_waitAlarmConfirm(CVCC_ALARM, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 745
	movw ax, #0x1200
	call $!_stop_waitAlarmConfirm
	;***      746 : 				g_alarm.refined.cvcc = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 746
	clr1 !LOWW(_g_alarm).7
.BB@LABEL@28_14:	; if_then_bb
	dec !LOWW(_g_machine_state+0x00007)
	br $.BB@LABEL@28_22
.BB@LABEL@28_15:	; if_break_bb92
	;***      747 : 				(*state)--;
	;***      748 : 				break;
	;***      749 : 			}
	;***      750 : 			if(isAcidTankFull() && isAlkalineTankFull())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 750
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
	;***      751 : 				(*state)++;
	;***      752 : 			break;
	;***      753 : 		case 3:
	;***      754 : 			g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 754
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@28_19:	; switch_clause_bb115.bb125_crit_edge
	oneb a
.BB@LABEL@28_20:	; bb125
	mov !LOWW(_g_machine_state+0x00008), a
	br $!.BB@LABEL@28_4
.BB@LABEL@28_21:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 714
	inc a
	mov !LOWW(_g_machine_state+0x00007), a
.BB@LABEL@28_22:	; bb132
	;***      755 : 			(*state) = 0;
	;***      756 : 			break;
	;***      757 : 		default:
	;***      758 : 			(*state) = 0;
	;***      759 : 			break;
	;***      760 : 	}
	;***      761 : 	return (*state);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 761
	mov a, !LOWW(_g_machine_state+0x00007)
	;***      762 : //	WAIT_RESET: electrolyticOperationON();
	;***      763 : //	g_Tick.tickVoltage1Check = g_systemTime;
	;***      764 : //	g_Tick.tickVoltage2Check = g_systemTime;
	;***      765 : //	g_Tick.tickVoltage3Check = g_systemTime;
	;***      766 : //	g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      767 : //	g_Tick.tickCurrentCheck = g_systemTime;
	;***      768 : //	do {
	;***      769 : //		realTimeResponse();
	;***      770 : //		if (Voltage1Check_waitReset())
	;***      771 : //			goto WAIT_RESET;
	;***      772 : //		Voltage2Check_nostop();
	;***      773 : //		if (Voltage3Check_waitReset())
	;***      774 : //			goto WAIT_RESET;
	;***      775 : //		if (LowVoltageCheck_waitReset())
	;***      776 : //			goto WAIT_RESET;
	;***      777 : //		if (OverCurrentCheck_waitReset())
	;***      778 : //			goto WAIT_RESET;
	;***      779 : //		//----------CVCC Alarm Input-----------------
	;***      780 : //		if (I_CVCC_ALARM_IN == I_ON) {
	;***      781 : //			g_alarm.refined.cvcc = 1;
	;***      782 : //			g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      783 : //			sendToRasPi_f(H_ALARM, CVCC_ALARM, 1);
	;***      784 : //			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	;***      785 : //			g_alarm.refined.cvcc = 0;
	;***      786 : //			goto WAIT_RESET;
	;***      787 : //		}
	;***      788 : //		R_WDT_Restart();
	;***      789 : //	} while (!isAcidTankFull() || !isAlkalineTankFull());
	;***      790 : //	g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      791 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 791
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      792 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 792
	subw sp, #0x04
	;***      793 : 	uint32_t _time_count = 0;
	;***      794 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 794
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
	;***      795 : 			& (_time_count
	;***      796 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      797 : 		_time_count++;
	;***      798 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 798
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@29_5:	; if_break_bb
	;***      799 : 	}
	;***      800 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 800
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
	;***      801 : 		sendToRasPi_f(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 801
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi_f
.BB@LABEL@29_9:	; return
	;***      802 : 	}
	;***      803 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 803
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      804 : void saltWaterTankFullCheck(void) {
	;***      805 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 805
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@30_2
.BB@LABEL@30_1:	; return
	;***      806 : 		sendToRasPi_f(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      807 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	;***      808 : 		g_machine_state.electrolyteOFF = g_machine_state.electrolyteOFF == 0 ? 1: g_machine_state.electrolyteOFF;
	;***      809 : 	}
	;***      810 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 810
	ret
.BB@LABEL@30_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 806
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 807
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 808
	mov a, !LOWW(_g_machine_state+0x00008)
	cmp0 a
	sknz
.BB@LABEL@30_3:	; if_then_bb.bb14_crit_edge
	oneb a
.BB@LABEL@30_4:	; bb14
	mov !LOWW(_g_machine_state+0x00008), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 810
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      811 : void saltWaterTankEmptyCheck(void) {
	;***      812 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 812
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@31_2
.BB@LABEL@31_1:	; if_then_bb
	;***      813 : 		sendToRasPi_f(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 813
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi_f
.BB@LABEL@31_2:	; return
	;***      814 : 	}
	;***      815 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 815
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      816 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 816
	movw de, #0xFF07
	;***      817 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 817
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
	;***      818 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      819 : 		sendToRasPi_f(H_ALARM, ACID_ERROR, 1);
	;***      820 : 
	;***      821 : 	}
	;***      822 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 822
	ret
.BB@LABEL@32_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 819
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi_f
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      823 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 823
	push hl
	;***      824 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 824
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
	;***      825 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      826 : 		sendToRasPi_f(H_ALARM, ALKALINE_ERROR, 1);
	;***      827 : 	}
	;***      828 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 828
	ret
.BB@LABEL@33_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 826
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi_f
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      829 : 
	;***      830 : uint8_t FilterReplacementCheck(void) {
	;***      831 : 
	;***      832 : 	return 0;
	;***      833 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 833
	clrb a
	ret
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      834 : 
	;***      835 : /**
	;***      836 :  * Tested: 10/12/2021 by Mr.An
	;***      837 :  */
	;***      838 : void WaterWashingMode_nostop(void) {
	;***      839 : 	uint8_t *state = &g_machine_state.water;
	;***      840 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      841 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 841
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
	;***      842 : 	case 0:
	;***      843 : 		g_machine_state.mode = WATER_WASHING;
	;***      844 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      845 : 		g_color = WHITE;
	;***      846 : 		*tick = g_systemTime;
	;***      847 : 		(*state)++;
	;***      848 : 		handSensorLED(g_color);
	;***      849 : 		break;
	;***      850 : 	case 1:
	;***      851 : 		if (ns_delay_ms(tick, 50)) {
	;***      852 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      853 : 			(*state)++;
	;***      854 : 		}
	;***      855 : 		break;
	;***      856 : 	case 2:
	;***      857 : 		if (DETECT_U == I_ON) {
	;***      858 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      859 : 			g_color = BLACK;
	;***      860 : 			(*state) = 0;
	;***      861 : 			g_machine_state.mode = BUSY;
	;***      862 : 			handSensorLED(g_color);
	;***      863 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x00);
	;***      864 : 		}
	;***      865 : 		break;
	;***      866 : 	default:
	;***      867 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 867
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@35_4:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 843
	mov !LOWW(_g_machine_state+0x0000A), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 844
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 845
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 846
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 847
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 848
	mov a, #0x02
	br $!_handSensorLED
.BB@LABEL@35_5:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 851
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00018)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@35_9
.BB@LABEL@35_6:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 852
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call $!_sendToRasPi_f
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 853
	inc !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@35_7:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 857
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@35_9
.BB@LABEL@35_8:	; if_then_bb27
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 858
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 859
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 860
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 861
	mov !LOWW(_g_machine_state+0x0000A), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 862
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 863
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@35_9:	; return
	;***      868 : 		break;
	;***      869 : 	}
	;***      870 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 870
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***      871 : 
	;***      872 : /**
	;***      873 :  * Tested: 24/12/2021 by Mr.An
	;***      874 :  */
	;***      875 : void HandWashingMode_nostop(void) {
	;***      876 : 	uint8_t *state = &g_machine_state.handwash;
	;***      877 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      878 : 	const uint32_t delayPump_ms = 50;
	;***      879 : 	if ((*state) == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 879
	mov a, !LOWW(_g_machine_state+0x00003)
	mov d, a
	cmp0 a
	bnz $.BB@LABEL@36_10
.BB@LABEL@36_1:	; if_then_bb
	;***      880 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 880
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
	;***      881 : 				g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***      882 : 						delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***      883 : 		g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 883
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
	;***      884 : 				g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***      885 : 						1000 : g_timerSetting.t54_overLapTime_ms;
	;***      886 : 	} else {
	;***      887 : //		if(ns_delay_ms(&g_Tick.tickAnimation, 500) && (g_machine_state.waitAnimationRes == 1)){
	;***      888 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      889 : //		}
	;***      890 : 	}
	;***      891 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 891
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
	;***      892 : 	case 0:
	;***      893 : 		*state = 1;
	;***      894 : 		*tick = g_systemTime;
	;***      895 : 		break;
	;***      896 : 	case 1:
	;***      897 : 		g_machine_state.mode = HAND_WASHING;
	;***      898 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      899 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      900 : 			O_PUMP_ALK_PIN = ON;
	;***      901 : 			handSensorLED(BLUE);
	;***      902 : 			(*state)++;
	;***      903 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      904 : //			g_Tick.tickAnimation = g_systemTime;
	;***      905 : //			g_machine_state.waitAnimationRes = 1;
	;***      906 : 		}
	;***      907 : 		break;
	;***      908 : 	case 2:
	;***      909 : 		if (ns_delay_ms(tick,
	;***      910 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      911 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      912 : 			O_PUMP_ALK_PIN = OFF;
	;***      913 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      914 : 			(*state)++;
	;***      915 : 		}
	;***      916 : 		break;
	;***      917 : 	case 3:
	;***      918 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      919 : 			O_PUMP_ACID_PIN = ON;
	;***      920 : 			handSensorLED(RED);
	;***      921 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      922 : 			(*state)++;
	;***      923 : 		}
	;***      924 : 		break;
	;***      925 : 	case 4:
	;***      926 : 		if (ns_delay_ms(tick,
	;***      927 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      928 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      929 : 			(*state)++;
	;***      930 : 		}
	;***      931 : 		break;
	;***      932 : 	case 5:
	;***      933 : 		if (ns_delay_ms(tick,
	;***      934 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      935 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      936 : 			O_PUMP_ACID_PIN = OFF;
	;***      937 : 			handSensorLED(WHITE);
	;***      938 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      939 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      940 : 			(*state)++;
	;***      941 : 		}
	;***      942 : 		break;
	;***      943 : 	case 6:
	;***      944 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      945 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      946 : 			(*state)++;
	;***      947 : 		}
	;***      948 : 		break;
	;***      949 : 	case 7:
	;***      950 : 		if (ns_delay_ms(tick,
	;***      951 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      952 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      953 : 			handSensorLED(BLACK);
	;***      954 : 			(*state) = 0;
	;***      955 : 			g_machine_state.mode = BUSY;
	;***      956 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      957 : 		}
	;***      958 : 		break;
	;***      959 : 	default:
	;***      960 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 960
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@36_19:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 893
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 894
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	ret
.BB@LABEL@36_20:	; switch_clause_bb34
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 897
	oneb !LOWW(_g_machine_state+0x0000A)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 898
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 899
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_28
.BB@LABEL@36_21:	; if_then_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 900
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 901
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 902
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@36_22:	; if_then_bb41
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@36_23:	; switch_clause_bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 909
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 912
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 913
	set1 0xFFF07.6
	br $.BB@LABEL@36_36
.BB@LABEL@36_27:	; switch_clause_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 918
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 919
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 920
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 926
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 928
	clr1 0xFFF07.7
.BB@LABEL@36_36:	; if_then_bb82
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 964
	ret
.BB@LABEL@36_37:	; switch_clause_bb87
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 933
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 936
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 937
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 938
	set1 0xFFF05.5
	br $.BB@LABEL@36_30
.BB@LABEL@36_42:	; switch_clause_bb102
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 944
	movw bc, !LOWW(_g_timerSetting+0x00074)
	movw de, !LOWW(_g_timerSetting+0x00076)
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@36_43:	; switch_clause_bb102
	bz $.BB@LABEL@36_47
.BB@LABEL@36_44:	; if_then_bb109
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 945
	clr1 0xFFF07.6
	br $.BB@LABEL@36_36
.BB@LABEL@36_45:	; switch_clause_bb114
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 950
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 952
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 953
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 954
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 955
	mov !LOWW(_g_machine_state+0x0000A), #0x07
	br $!.BB@LABEL@36_22
.BB@LABEL@36_47:	; return
	;***      961 : 		break;
	;***      962 : 	}
	;***      963 : 
	;***      964 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 964
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      965 : /**
	;***      966 :  * Tested: 24/12/2021 by Mr.An
	;***      967 :  */
	;***      968 : void AcidWaterMode_nostop(void) {
	;***      969 : 	uint8_t *state = &g_machine_state.acid;
	;***      970 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      971 : 	const uint32_t delayPump_ms = 50;
	;***      972 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 972
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
	;***      973 : 	case 0:
	;***      974 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      975 : 		g_machine_state.mode = ACID_WASHING;
	;***      976 : 		*state = 1;
	;***      977 : 		*tick = g_systemTime;
	;***      978 : 		break;
	;***      979 : 	case 1:
	;***      980 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      981 : 		g_color = RED;
	;***      982 : 		handSensorLED(g_color);
	;***      983 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      984 : 			O_PUMP_ACID_PIN = ON;
	;***      985 : 			(*state)++;
	;***      986 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      987 : 		}
	;***      988 : 		break;
	;***      989 : 	case 2:
	;***      990 : 		//TODO: Change turn OFF signal here
	;***      991 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      992 : 				|| (DETECT_U == I_ON)) {
	;***      993 : 			O_PUMP_ACID_PIN = OFF;
	;***      994 : 			(*state)++;
	;***      995 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***      996 : 		}
	;***      997 : 		break;
	;***      998 : 	case 3:
	;***      999 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***     1000 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***     1001 : 			g_color = BLACK;
	;***     1002 : 			handSensorLED(g_color);
	;***     1003 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***     1004 : 			(*state)++;
	;***     1005 : 		}
	;***     1006 : 		break;
	;***     1007 : 	default:
	;***     1008 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1008
	mov !LOWW(_g_machine_state+0x0000A), #0x07
	;***     1009 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1009
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi_f
	;***     1010 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1010
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@37_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 975
	mov !LOWW(_g_machine_state+0x0000A), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 976
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 977
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@37_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 980
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 981
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 982
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 983
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@37_14
.BB@LABEL@37_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 984
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 985
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 986
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@37_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 991
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 993
	clr1 0xFFF06.2
.BB@LABEL@37_11:	; if_then_bb39
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1013
	ret
.BB@LABEL@37_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 999
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@37_14
.BB@LABEL@37_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1000
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1001
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1002
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@37_11
.BB@LABEL@37_14:	; return
	;***     1011 : 		break;
	;***     1012 : 	}
	;***     1013 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1013
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***     1014 : /**
	;***     1015 :  * Tested: 24/12/2021 by Mr.An
	;***     1016 :  */
	;***     1017 : void AlkalineWaterMode_nostop(void) {
	;***     1018 : 	uint8_t *state = &g_machine_state.akaline;
	;***     1019 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***     1020 : 	const uint32_t delayPump_ms = 50;
	;***     1021 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1021
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
	;***     1022 : 	case 0:
	;***     1023 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***     1024 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***     1025 : 		*state = 1;
	;***     1026 : 		*tick = g_systemTime;
	;***     1027 : 		break;
	;***     1028 : 	case 1:
	;***     1029 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***     1030 : 		g_color = BLUE;
	;***     1031 : 		handSensorLED(g_color);
	;***     1032 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***     1033 : 			O_PUMP_ALK_PIN = ON;
	;***     1034 : 			(*state)++;
	;***     1035 : 			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***     1036 : 		}
	;***     1037 : 		break;
	;***     1038 : 	case 2:
	;***     1039 : 		//TODO: Change turn OFF signal here
	;***     1040 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***     1041 : 				|| (DETECT_U == I_ON)) {
	;***     1042 : 			O_PUMP_ALK_PIN = OFF;
	;***     1043 : 			(*state)++;
	;***     1044 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***     1045 : 		}
	;***     1046 : 		break;
	;***     1047 : 	case 3:
	;***     1048 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***     1049 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***     1050 : 			g_color = BLACK;
	;***     1051 : 			handSensorLED(g_color);
	;***     1052 : 			(*state)++;
	;***     1053 : //			sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	;***     1054 : 		}
	;***     1055 : 		break;
	;***     1056 : 	default:
	;***     1057 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1057
	mov !LOWW(_g_machine_state+0x0000A), #0x07
	;***     1058 : 		sendToRasPi_f(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1058
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi_f
	;***     1059 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1059
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@38_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1024
	mov !LOWW(_g_machine_state+0x0000A), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1025
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1026
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@38_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1029
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1030
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1031
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1032
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_14
.BB@LABEL@38_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1033
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1034
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1035
	clrw ax
	movw de, ax
	movw ax, #0x5313
	br $!_sendToRasPi_f
.BB@LABEL@38_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1040
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1042
	clr1 0xFFF06.1
.BB@LABEL@38_11:	; if_then_bb39
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1062
	ret
.BB@LABEL@38_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1048
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@38_14
.BB@LABEL@38_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1049
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1050
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1051
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@38_11
.BB@LABEL@38_14:	; return
	;***     1060 : 		break;
	;***     1061 : 	}
	;***     1062 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1062
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***     1063 : 
	;***     1064 : // Newest
	;***     1065 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1065
	subw sp, #0x0A
	;***     1066 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1066
	call $!_UpdateMachineStatus
	;***     1067 : 	InitialOperationModeStart(); //Worked!!;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1067
	call $!_InitialOperationModeStart
	;***     1068 : 
	;***     1069 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1069
	call $!_UpdateMachineStatus
.BB@LABEL@39_1:	; bb1
	;***     1070 : 	while (WaterSupplyOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1070
	call $!_WaterSupplyOperation_nostop
	cmp0 a
	bz $.BB@LABEL@39_3
.BB@LABEL@39_2:	; bb
	;***     1071 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1071
	call $!_realTimeResponse
	br $.BB@LABEL@39_1
.BB@LABEL@39_3:	; bb5
	;***     1072 : 	}
	;***     1073 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1073
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
.BB@LABEL@39_4:	; bb5
	clrb a
.BB@LABEL@39_5:	; bb5
	cmp0 x
	oneb x
	sknz
.BB@LABEL@39_6:	; bb5
	clrb x
.BB@LABEL@39_7:	; bb5
	or x, a
	bnz $.BB@LABEL@39_9
.BB@LABEL@39_8:	; if_then_bb
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	;***     1074 : 		sendToRasPi_f(H_ALARM, FLOW_SENSOR_ERROR,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1074
	movw ax, #0x4104
	call $!_sendToRasPi_f
.BB@LABEL@39_9:	; bb13
	;***     1075 : 				g_io_status.refined.FlowValue);
	;***     1076 : 	}
	;***     1077 : 	while(ElectrolyticOperation_nostop() != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1077
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bz $.BB@LABEL@39_11
.BB@LABEL@39_10:	; bb12
	;***     1078 : 		realTimeResponse();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1078
	call $!_realTimeResponse
	br $.BB@LABEL@39_9
.BB@LABEL@39_11:	; return
	;***     1079 : 	}
	;***     1080 : 
	;***     1081 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1081
	addw sp, #0x0A
	ret
_userAuthHandler_nostop:
	.STACK _userAuthHandler_nostop = 4
	;***     1082 : 
	;***     1083 : void userAuthHandler_nostop(void) {
	;***     1084 : 	if (g_machine_state.user == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1084
	cmp !LOWW(_g_machine_state+0x00009), #0x01
	bnz $.BB@LABEL@40_9
.BB@LABEL@40_1:	; if_then_bb
	;***     1085 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1085
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
	;***     1086 : 		case HAND_WASHING:
	;***     1087 : 			HandWashingMode_nostop();
	;***     1088 : 			break;
	;***     1089 : 		case WATER_WASHING:
	;***     1090 : 			WaterWashingMode_nostop();
	;***     1091 : 			break;
	;***     1092 : 		case ACID_WASHING:
	;***     1093 : 			AcidWaterMode_nostop();
	;***     1094 : 			break;
	;***     1095 : 		case ALKALINE_WASHING:
	;***     1096 : 			AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1096
	br $!_AlkalineWaterMode_nostop
.BB@LABEL@40_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1087
	br $!_HandWashingMode_nostop
.BB@LABEL@40_7:	; switch_clause_bb6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1090
	br $!_WaterWashingMode_nostop
.BB@LABEL@40_8:	; switch_clause_bb7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1093
	br $!_AcidWaterMode_nostop
.BB@LABEL@40_9:	; return
	;***     1097 : 			break;
	;***     1098 : 		default:
	;***     1099 : 			break;
	;***     1100 : 		}
	;***     1101 : 	}
	;***     1102 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1102
	ret
_ElectrolyzeWaterGeneration_nostop:
	.STACK _ElectrolyzeWaterGeneration_nostop = 4
	;***     1103 : void ElectrolyzeWaterGeneration_nostop(void) {
	;***     1104 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1104
	cmp !LOWW(_g_machine_state+0x0000A), #0x08
	bnz $.BB@LABEL@41_9
.BB@LABEL@41_1:	; if_then_bb36
	;***     1105 : 		if (isAcidTankEmpty() || isAlkalineTankEmpty()) {
	;***     1106 : 			// Start Electrolyte
	;***     1107 : 			g_machine_state.mode = ELECTROLYTIC_GENERATION;
	;***     1108 : 			//Stop what ever operation is happening
	;***     1109 : 			g_machine_state.user = 0;
	;***     1110 : 			g_machine_state.handwash = g_machine_state.water =
	;***     1111 : 					g_machine_state.acid = g_machine_state.akaline = 0;
	;***     1112 : 			O_PUMP_ACID_PIN = O_PUMP_ALK_PIN = OFF;
	;***     1113 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***     1114 : 
	;***     1115 : 		}
	;***     1116 : 	} else if(g_machine_state.mode == ELECTROLYTIC_GENERATION) {
	;***     1117 : 		// Start Loop Electrolyte
	;***     1118 : 		if(ElectrolyticOperation_nostop() == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1118
	call $!_ElectrolyticOperation_nostop
	cmp0 a
	bnz $.BB@LABEL@41_3
.BB@LABEL@41_2:	; if_then_bb42
	movw hl, #0xFF07
	movw ax, hl
	movw de, ax
	;***     1119 : 			O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1119
	clr1 [hl].7
	mov a, [de]
	mov1 CY, a.7
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	;***     1120 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1120
	clrb !LOWW(_g_machine_state+0x0000A)
	;***     1121 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1121
	clrb !LOWW(_g_machine_state+0x00009)
	;***     1122 : 			handSensorLED(BLACK);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1122
	clrb a
	br $!_handSensorLED
.BB@LABEL@41_3:	; if_else_bb51
	;***     1123 : 		}else if(!isAcidTankFull() && !isAlkalineTankFull()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1123
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@41_5
.BB@LABEL@41_4:	; bb62
	call $!_isAlkalineTankFull
	cmp0 a
	;***     1124 : 			handSensorLEDBlink(WHITE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1124
	mov a, #0x02
	bz $.BB@LABEL@41_7
.BB@LABEL@41_5:	; if_else_bb82
	;***     1125 : 		}else if(!isAcidTankFull()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1125
	call $!_isAcidTankFull
	cmp0 a
	bnz $.BB@LABEL@41_8
.BB@LABEL@41_6:	; if_then_bb94
	;***     1126 : 			handSensorLEDBlink(RED, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1126
	oneb a
.BB@LABEL@41_7:	; if_then_bb94
	movw de, #0x0000
	movw bc, #0x0064
	br $!_handSensorLEDBlink
.BB@LABEL@41_8:	; if_else_bb95
	;***     1127 : 		}else if(!isAlkalineTankFull()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1127
	call $!_isAlkalineTankFull
	cmp0 a
	;***     1128 : 			handSensorLEDBlink(BLUE, 100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1128
	mov a, #0x03
	bz $.BB@LABEL@41_7
	br $.BB@LABEL@41_12
.BB@LABEL@41_9:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1105
	call $!_isAcidTankEmpty
	cmp0 a
	bnz $.BB@LABEL@41_11
.BB@LABEL@41_10:	; bb
	call $!_isAlkalineTankEmpty
	cmp0 a
	bz $.BB@LABEL@41_12
.BB@LABEL@41_11:	; if_then_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1107
	mov !LOWW(_g_machine_state+0x0000A), #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1109
	clrb !LOWW(_g_machine_state+0x00009)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1110
	clrb !LOWW(_g_machine_state)
	clrb !LOWW(_g_machine_state+0x00001)
	clrb !LOWW(_g_machine_state+0x00002)
	clrb !LOWW(_g_machine_state+0x00003)
	movw hl, #0xFF06
	movw ax, hl
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1112
	clr1 [hl].1
	mov a, [de]
	mov1 CY, a.1
	mov a, [de]
	mov1 a.2, CY
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1113
	clr1 0xFFF05.5
.BB@LABEL@41_12:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1131
	ret
_isSV1andSV2Off8h:
	.STACK _isSV1andSV2Off8h = 8
	;***     1129 : 		}
	;***     1130 : 	}
	;***     1131 : }
	;***     1132 : uint8_t isSV1andSV2Off8h(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1132
	push hl
	;***     1133 : 	if (O_SUPPLY_WATER_PIN_SV1 == ON && O_SPOUT_WATER_PIN_SV2 == ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1133
	mov a, 0xFFF01
	bf a.7, $.BB@LABEL@42_5
.BB@LABEL@42_1:	; bb
	mov a, 0xFFF05
	bf a.5, $.BB@LABEL@42_5
.BB@LABEL@42_2:	; if_then_bb
	;***     1134 : 		if (ns_delay_ms(&g_Tick.tickSV1SV2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1134
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1143
	ret
.BB@LABEL@42_5:	; if_else_bb
	;***     1135 : 				(uint32_t) g_timerSetting.t61_curranCleaningIntervalTime_h * 60
	;***     1136 : 						* 60 * 1000)) {
	;***     1137 : 			return 1;
	;***     1138 : 		}
	;***     1139 : 	} else {
	;***     1140 : 		g_Tick.tickSV1SV2 = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1140
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
	clrb a
	br $.BB@LABEL@42_4
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***     1141 : 	}
	;***     1142 : 	return 0;
	;***     1143 : }
	;***     1144 : void CallanCleaningMode_nostop(void) {
	;***     1145 : 	uint8_t *state = &g_machine_state.callan;
	;***     1146 : 	uint32_t *tick = &g_Tick.tickCallan;
	;***     1147 : 	if (isSV1andSV2Off8h() || g_machine_state.callan != 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1147
	call $!_isSV1andSV2Off8h
	cmp0 a
	bnz $.BB@LABEL@43_3
.BB@LABEL@43_1:	; bb
	cmp0 !LOWW(_g_machine_state+0x00006)
	sknz
.BB@LABEL@43_2:	; return
	;***     1148 : 		switch (*state) {
	;***     1149 : 		case 0:
	;***     1150 : 			(*state)++;
	;***     1151 : 			*tick = g_systemTime;
	;***     1152 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***     1153 : 			g_machine_state.mode = CALLAN_MODE;
	;***     1154 : 			break;
	;***     1155 : 		case 1:
	;***     1156 : 			handSensorLEDBlink(WHITE, 500);
	;***     1157 : 			if (ns_delay_ms(tick,
	;***     1158 : 					g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***     1159 : 				(*state)++;
	;***     1160 : 				O_SPOUT_WATER_PIN_SV2 = OFF;
	;***     1161 : 				handSensorLED(BLACK);
	;***     1162 : 			}
	;***     1163 : 			break;
	;***     1164 : 		default:
	;***     1165 : 			break;
	;***     1166 : 		}
	;***     1167 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***     1168 : 
	;***     1169 : 	}
	;***     1170 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1170
	ret
.BB@LABEL@43_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1148
	mov a, !LOWW(_g_machine_state+0x00006)
	cmp0 a
	bz $.BB@LABEL@43_7
.BB@LABEL@43_4:	; if_then_bb
	dec a
	bnz $.BB@LABEL@43_8
.BB@LABEL@43_5:	; switch_clause_bb24
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1156
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	mov a, #0x02
	call $!_handSensorLEDBlink
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1157
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
.BB@LABEL@43_6:	; if_then_bb32
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1159
	inc !LOWW(_g_machine_state+0x00006)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1160
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1161
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@43_8
.BB@LABEL@43_7:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1150
	inc a
	mov !LOWW(_g_machine_state+0x00006), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1151
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1152
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1153
	mov !LOWW(_g_machine_state+0x0000A), #0x09
.BB@LABEL@43_8:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1167
	set1 0xFFF05.5
	ret
_errorCheck:
	.STACK _errorCheck = 4
	;***     1171 : void errorCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1171
	ret
_main_loop_20211111:
	.STACK _main_loop_20211111 = 6
	;***     1172 : 
	;***     1173 : }
	;***     1174 : void main_loop_20211111(void) {
	;***     1175 : 	measureFlowSensor_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1175
	call $!_measureFlowSensor_nostop
	;***     1176 : 	ElectrolyzeWaterGeneration_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1176
	call $!_ElectrolyzeWaterGeneration_nostop
	;***     1177 : 	CallanCleaningMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1177
	call $!_CallanCleaningMode_nostop
	;***     1178 : 	if ((g_machine_state.mode != BUSY)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1178
	mov a, !LOWW(_g_machine_state+0x0000A)
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
	;***     1179 : 			&& (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1180 : 			&& (g_machine_state.mode != CALLAN_MODE)
	;***     1181 : 			&& (g_machine_state.mode != DRAINAGE_MODE)) {
	;***     1182 : 		userAuthHandler_nostop();
	;***     1183 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***     1184 : 	} else if (g_machine_state.mode == BUSY) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1184
	cmp a, #0x07
	bnz $.BB@LABEL@45_6
.BB@LABEL@45_4:	; if_then_bb45
	;***     1185 : 		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1185
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
	;***     1186 : 				g_timerSetting.t55_waterDischargeDelay_s * 1000)) {
	;***     1187 : 			g_machine_state.mode = INDIE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1187
	clrb !LOWW(_g_machine_state+0x0000A)
	;***     1188 : 			g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1188
	clrb !LOWW(_g_machine_state+0x00009)
.BB@LABEL@45_6:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1191
	ret
.BB@LABEL@45_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1182
	call $!_userAuthHandler_nostop
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1183
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00028), ax
	ret
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***     1189 : 		}
	;***     1190 : 	}
	;***     1191 : }
	;***     1192 : 
	;***     1193 : /**
	;***     1194 :  * 30/11/2021: Checked by An
	;***     1195 :  */
	;***     1196 : void electrolyticOperationON(void) {
	;***     1197 : 	//Electrolytic operation ON
	;***     1198 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1198
	set1 0xFFF01.7
	;***     1199 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1199
	set1 0xFFF0E.2
	;***     1200 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1200
	set1 0xFFF06.0
	;***     1201 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1201
	oneb !LOWW(_g_electrolytic_flag)
	;***     1202 : 	g_TickKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1202
	movw bc, !LOWW(_g_TickKeeper@1+0x00012)
	movw ax, !LOWW(_g_TickKeeper@1+0x00010)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@46_3
.BB@LABEL@46_1:	; entry
	bc $.BB@LABEL@46_3
.BB@LABEL@46_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@46_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TickKeeper@1+0x00010), ax
	movw ax, bc
	movw !LOWW(_g_TickKeeper@1+0x00012), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1205
	ret
_electrolyticOperationOFF_nostop:
	.STACK _electrolyticOperationOFF_nostop = 6
	;***     1203 : 			g_TickKeeper.neutralization == 0 ?
	;***     1204 : 					g_systemTime : g_TickKeeper.neutralization;
	;***     1205 : }
	;***     1206 : /**
	;***     1207 :  * 30/11/2021: Checked by An, missing Neutralization timer OFF
	;***     1208 :  */
	;***     1209 : void electrolyticOperationOFF_nostop(void) {
	;***     1210 : 	uint8_t *state = &g_machine_state.electrolyteOFF;
	;***     1211 : 	uint32_t *tick = &g_Tick.tickElectrolyticOff;
	;***     1212 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1212
	mov a, !LOWW(_g_machine_state+0x00008)
	dec a
	bz $.BB@LABEL@47_5
.BB@LABEL@47_1:	; entry
	dec a
	bnz $.BB@LABEL@47_4
.BB@LABEL@47_2:	; switch_clause_bb8
	;***     1213 : 		case 1:
	;***     1214 : 			g_TickKeeper.neutralization = 0;
	;***     1215 : 			O_CVCC_ON_PIN = OFF;
	;***     1216 : 			O_PUMP_SALT_PIN = OFF; //SP1
	;***     1217 : 			(*state)++;
	;***     1218 : 			break;
	;***     1219 : 		case 2:
	;***     1220 : 			if(ns_delay_ms(tick, g_timerSetting.t5_electrolysisStopDelay_s*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1220
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
	bz $.BB@LABEL@47_4
.BB@LABEL@47_3:	; if_then_bb
	;***     1221 : 				(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1221
	clrb !LOWW(_g_machine_state+0x00008)
	;***     1222 : 				O_SUPPLY_WATER_PIN_SV1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1222
	clr1 0xFFF01.7
.BB@LABEL@47_4:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1228
	ret
.BB@LABEL@47_5:	; switch_clause_bb
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1214
	movw !LOWW(_g_TickKeeper@1+0x00012), ax
	movw !LOWW(_g_TickKeeper@1+0x00010), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1215
	clr1 0xFFF0E.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1216
	clr1 0xFFF06.0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1217
	inc !LOWW(_g_machine_state+0x00008)
	ret
_realTimeResponse:
	.STACK _realTimeResponse = 4
	;***     1223 : 			}
	;***     1224 : 			break;
	;***     1225 : 		default:
	;***     1226 : 			break;
	;***     1227 : 	}
	;***     1228 : }
	;***     1229 : void realTimeResponse(void){
	;***     1230 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1230
	call $!_UpdateMachineStatus
	;***     1231 : 	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1231
	call $!_RaspberryResponse_nostop
	;***     1232 : 	electrolyticOperationOFF_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1232
	call $!_electrolyticOperationOFF_nostop
	;***     1233 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1233
	call !!_R_WDT_Restart
	;***     1234 : 	if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1234
	clrw ax
	movw de, ax
	movw bc, #0x00C8
	movw ax, #LOWW(_g_Tick+0x00080)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	sknz
.BB@LABEL@48_1:	; return
	;***     1235 : 		P6_bit.no3 = ~P6_bit.no3;
	;***     1236 : 
	;***     1237 : 	}
	;***     1238 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1238
	ret
.BB@LABEL@48_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1235
	mov a, 0xFFF06
	mov1 CY, a.3
	mov a, 0xFFF06
	mov1 a.3, CY
	xor a, #0x08
	mov 0xFFF06, a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***     1239 : float measureFlowSensor(uint32_t *t) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1239
	push ax
	subw sp, #0x0C
	;***     1240 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1240
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
.BB@LABEL@49_1:	; bb27
	movw ax, [sp+0x0C]
	movw de, ax
	;***     1241 : 	float flow_pluse = 0.0;
	;***     1242 : 	uint8_t flow_pulse_state = I_OFF;
	;***     1243 : 	while (!ns_delay_ms(&stamp_flow_sensor, (*t) * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1243
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
	bnz $.BB@LABEL@49_7
.BB@LABEL@49_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***     1244 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1244
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@49_6
.BB@LABEL@49_3:	; if_then_bb
	;***     1245 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1245
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@49_5
.BB@LABEL@49_4:	; if_then_bb20
	movw ax, #0x3F80
	;***     1246 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1246
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
.BB@LABEL@49_5:	; if_break_bb
	;***     1247 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1247
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@49_6:	; if_break_bb26
	;***     1248 : 		}
	;***     1249 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1249
	call !!_R_WDT_Restart
	br $.BB@LABEL@49_1
.BB@LABEL@49_7:	; bb40
	movw ax, #0x3F33
	;***     1250 : 	}
	;***     1251 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*t); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1251
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
	;***     1252 : 	return g_io_status.refined.FlowValue;
	;***     1253 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1253
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***     1254 : 
	;***     1255 : uint8_t _pre_flow_state = I_OFF;
	;***     1256 : float _flow_pulse;
	;***     1257 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1257
	subw sp, #0x04
	;***     1258 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***     1259 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***     1260 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1260
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@50_4
.BB@LABEL@50_1:	; entry
	dec a
	bz $.BB@LABEL@50_5
.BB@LABEL@50_2:	; entry
	dec a
	bz $.BB@LABEL@50_12
.BB@LABEL@50_3:	; switch_clause_bb61
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@50_11
.BB@LABEL@50_4:	; switch_clause_bb
	;***     1261 : 	case 0:
	;***     1262 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1262
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@50_9
.BB@LABEL@50_5:	; switch_clause_bb14
	;***     1263 : 			(*state)++;
	;***     1264 : 		}
	;***     1265 : 		break;
	;***     1266 : 	case 1:
	;***     1267 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1267
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@50_8
.BB@LABEL@50_6:	; if_then_bb24
	;***     1268 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1268
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***     1269 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1269
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@50_8
.BB@LABEL@50_7:	; if_then_bb35
	movw ax, #0x3F80
	;***     1270 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1270
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
.BB@LABEL@50_8:	; if_break_bb39
	;***     1271 : 			}
	;***     1272 : 		}
	;***     1273 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1273
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0000A)
.BB@LABEL@50_9:	; if_break_bb39
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
.BB@LABEL@50_10:	; if_then_bb47
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@50_11:	; switch_break_bb
	;***     1274 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***     1275 : 			(*state)++;
	;***     1276 : 		}
	;***     1277 : 		break;
	;***     1278 : 	case 2:
	;***     1279 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***     1280 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***     1281 : 		_flow_pulse = 0;
	;***     1282 : 		(*state) = 0;
	;***     1283 : 		break;
	;***     1284 : 	default:
	;***     1285 : 		(*state) = 0;
	;***     1286 : 		break;
	;***     1287 : 	}
	;***     1288 : 	return g_io_status.refined.FlowValue;
	;***     1289 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1289
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@50_12:	; switch_clause_bb52
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1279
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1281
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@50_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***     1290 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1290
	push hl
	;***     1291 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1292 : 		pre_machine_washing_mode = g_machine_state.mode;
	;***     1293 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1293
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@51_2
.BB@LABEL@51_1:	; bb11
	clrb x
.BB@LABEL@51_2:	; bb12
	;***     1294 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1294
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@51_4
.BB@LABEL@51_3:	; bb28
	clrb c
.BB@LABEL@51_4:	; bb30
	;***     1295 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1295
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@51_6
.BB@LABEL@51_5:	; bb46
	clrb b
.BB@LABEL@51_6:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***     1296 : 	g_mean_io_status.refined.AcidLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1296
	mov a, 0xFFF07
	mov1 CY, a.2
	clrb a
	bc $.BB@LABEL@51_8
.BB@LABEL@51_7:	; bb63
	mov a, #0x10
	and a, !LOWW(_g_mean_io_status)
.BB@LABEL@51_8:	; bb70
	mov x, a
	mov a, #0xEF
	and a, !LOWW(_g_mean_io_status)
	or a, x
	mov c, a
	;***     1297 : 	I_ACID_M_PIN == I_ON ? g_mean_io_status.refined.AcidLowLevel : 0;
	;***     1298 : 	g_mean_io_status.refined.AcidHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1298
	mov a, 0xFFF07
	clrb x
	bt a.3, $.BB@LABEL@51_10
.BB@LABEL@51_9:	; bb86
	mov a, c
	and a, #0x20
	mov x, a
.BB@LABEL@51_10:	; bb93
	mov a, c
	clr1 a.5
	or a, x
	mov d, a
	;***     1299 : 	I_ACID_H_PIN == I_ON ? g_mean_io_status.refined.AcidHighLevel : 0;
	;***     1300 : 
	;***     1301 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1301
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@51_12
.BB@LABEL@51_11:	; bb109
	clrb x
.BB@LABEL@51_12:	; bb111
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***     1302 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1302
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@51_14
.BB@LABEL@51_13:	; bb126
	clrb b
.BB@LABEL@51_14:	; bb128
	mov a, c
	or a, x
	mov e, a
	;***     1303 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1303
	mov a, 0xFFF07
	mov c, #0x04
	bf a.0, $.BB@LABEL@51_16
.BB@LABEL@51_15:	; bb144
	clrb c
.BB@LABEL@51_16:	; bb146
	mov a, e
	or a, b
	mov e, a
	;***     1304 : 	g_mean_io_status.refined.AlkalineLowLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1304
	mov a, 0xFFF00
	clrb x
	bt a.6, $.BB@LABEL@51_18
.BB@LABEL@51_17:	; bb161
	mov a, d
	and a, #0x02
	mov x, a
.BB@LABEL@51_18:	; bb168
	mov a, d
	clr1 a.1
	or a, x
	mov b, a
	;***     1305 : 	I_ALKALI_M_PIN == I_ON ? g_mean_io_status.refined.AlkalineLowLevel : 0;
	;***     1306 : 	g_mean_io_status.refined.AlkalineHighLevel =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1306
	mov a, 0xFFF07
	clrb x
	bt a.0, $.BB@LABEL@51_20
.BB@LABEL@51_19:	; bb183
	mov a, b
	and a, #0x04
	mov x, a
.BB@LABEL@51_20:	; bb190
	mov a, b
	clr1 a.2
	or a, x
	mov !LOWW(_g_mean_io_status), a
	;***     1307 : 	I_ALKALI_H_PIN == I_ON ? g_mean_io_status.refined.AlkalineHighLevel : 0;
	;***     1308 : 
	;***     1309 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1309
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@51_22
.BB@LABEL@51_21:	; bb206
	clrb b
.BB@LABEL@51_22:	; bb208
	mov a, e
	or a, c
	mov c, a
	;***     1310 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1310
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@51_24
.BB@LABEL@51_23:	; bb224
	clrb x
.BB@LABEL@51_24:	; bb226
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***     1311 : 
	;***     1312 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1312
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***     1313 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1313
	mov x, 0xFFF05
	;***     1314 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1314
	mov c, 0xFFF07
	;***     1315 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1315
	mov a, 0xFFF07
	mov h, a
	;***     1316 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1316
	mov a, [de]
	mov l, a
	;***     1317 : 	O_DRAIN_ACID_PIN_SV7;
	;***     1318 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1318
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1312
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1313
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1314
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1315
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1316
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***     1319 : 	O_DRAIN_ALK_PIN_SV6;
	;***     1320 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1320
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1316
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1320
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1318
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1320
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***     1321 : 
	;***     1322 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1322
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***     1323 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1323
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***     1324 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1324
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***     1325 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TickKeeper@1:
	.DS (20)
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
	.DS (11)
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
	.DS (160)
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
_g_electrolytic_flag:
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
