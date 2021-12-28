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
#@  compiled at Tue Dec 28 10:42:04 2021

	.EXTERN _g_control_buffer
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
	.PUBLIC _g_pre_io_status
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
	.PUBLIC _setting_default
	.PUBLIC _isAcidHigh
	.EXTERN _ns_delay_ms
	.PUBLIC _isAcidLow
	.PUBLIC _isAcidEmpty
	.PUBLIC _isAlkalineHigh
	.PUBLIC _isAlkalineLow
	.PUBLIC _isAlkalineEmpty
	.PUBLIC _sendToRasPi
	.EXTERN _R_UART2_Send
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
	.PUBLIC _ElectrolyticOperation
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
	.PUBLIC _CallanCleaningMode_nostop
	.PUBLIC _main_init_20211111
	.PUBLIC _userAuthHandler_nostop
	.PUBLIC _ElectrolyzeWaterGeneration_nostop
	.PUBLIC _errorCheck
	.PUBLIC _main_loop_20211111
	.PUBLIC _electrolyticOperationON
	.PUBLIC _electrolyticOperationOFF_nostop
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
	;***       29 : union IO_Status_u g_io_status, g_pre_io_status;
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
_setting_default:
	.STACK _setting_default = 4
	;***       69 : void setting_default(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw ax, #0x4086
	;***       70 : 	g_numberSetting.upperVoltage1 = 4.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x6666
	movw !LOWW(_g_numberSetting), ax
	movw ax, #0x4060
	;***       71 : 	g_numberSetting.upperVoltage2 = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_numberSetting+0x00006), ax
	;***       72 : 	g_numberSetting.upperVoltage3 = 2.2;
	;***       73 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       74 : 	g_numberSetting.upperCurrent = 4.3;
	;***       75 : 	g_numberSetting.lowerCurrent = 0.2;
	;***       76 : 	g_numberSetting.upperFlow = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***       77 : 	g_numberSetting.lowerFlow = 0.4;
	;***       78 : 
	;***       79 : 	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       80 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       81 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       82 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       83 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***       84 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***       85 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***       86 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***       87 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***       88 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x0006A), ax
	;***       89 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x0006E), ax
	;***       90 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x00072), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_numberSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F00
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw ax, #0x4089
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_numberSetting+0x00016), ax
	mov x, #0xCC
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x00008), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x00028), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x00038), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00030), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00034), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x00040), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x00068), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x0006C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw !LOWW(_g_timerSetting+0x00070), ax
	ret
_isAcidHigh:
	.STACK _isAcidHigh = 6
	;***       91 : }
	;***       92 : #ifdef RENAN_CODE
	;***       93 : void renanCode(void){
	;***       94 : 	//Power On Mode
	;***       95 : 	O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       96 : 	O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       97 : 	do{
	;***       98 : 		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN_SV7;	// Turn on SV5 if ACID tank empty
	;***       99 : 		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN_SV6;	// Turn on SV6 if ALK tank empty
	;***      100 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***      101 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***      102 : 		R_WDT_Restart();
	;***      103 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      104 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***      105 : 	O_DRAIN_ACID_PIN_SV7 = O_DRAIN_ALK_PIN_SV6 = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***      106 : 
	;***      107 : 	// Drainage operation
	;***      108 : 	O_SPOUT_WATER_PIN_SV2 = ON;	// SV2 On
	;***      109 : 	delay(st[1]);			// Default 30 seconds
	;***      110 : 	O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      111 : 	delay_ms(500);
	;***      112 : 	O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      113 : }
	;***      114 : 
	;***      115 : 
	;***      116 : void code_20211029(void){
	;***      117 : 	//---------------Electrolytic operation-----------------------------
	;***      118 : 	O_SUPPLY_WATER_PIN_SV1 = ON; //SV1
	;***      119 : 	O_CVCC_ON_PIN = ON;
	;***      120 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***      121 : 	delay(10);
	;***      122 : 
	;***      123 : 	overVoltage1Error();
	;***      124 : }
	;***      125 : #endif
	;***      126 : 
	;***      127 : uint8_t isAcidHigh(void) {
	;***      128 : 	if (g_io_status.refined.AcidHighLevel
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].5
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].5
	bc $.BB@LABEL@3_3
.BB@LABEL@3_1:	; if_else_bb
	;***      129 : 			!= g_pre_io_status.refined.AcidHighLevel) {
	;***      130 : 		if (I_ACID_H_PIN == I_ON) {
	;***      131 : 			if (ns_delay_ms(&g_Tick.tickAcidLevel[0],
	;***      132 : 					g_timerSetting.t28_onDelayHighLevel_s * 1000)) {
	;***      133 : 				g_pre_io_status.refined.AcidHighLevel =
	;***      134 : 						g_io_status.refined.AcidHighLevel;
	;***      135 : 				return 1;
	;***      136 : 			}
	;***      137 : 			return 0;
	;***      138 : 		}
	;***      139 : 	} else {
	;***      140 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 140
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00050), ax
.BB@LABEL@3_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	ret
.BB@LABEL@3_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@3_2
.BB@LABEL@3_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 131
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
	movw ax, #LOWW(_g_Tick+0x00050)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_2
.BB@LABEL@3_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	mov1 CY, [hl].5
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].5, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
	ret
_isAcidLow:
	.STACK _isAcidLow = 6
	;***      141 : 	}
	;***      142 : 	return 0;
	;***      143 : }
	;***      144 : uint8_t isAcidLow(void) {
	;***      145 : 	if (g_io_status.refined.AcidLowLevel
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 145
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].4
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].4
	bc $.BB@LABEL@4_3
.BB@LABEL@4_1:	; if_else_bb
	;***      146 : 			!= g_pre_io_status.refined.AcidLowLevel) {
	;***      147 : 		if (I_ACID_M_PIN == I_ON) {
	;***      148 : 			if (ns_delay_ms(&g_Tick.tickAcidLevel[1],
	;***      149 : 					g_timerSetting.t27_onDelayLowLevel_s * 1000)) {
	;***      150 : 				g_pre_io_status.refined.AcidLowLevel =
	;***      151 : 						g_io_status.refined.AcidLowLevel;
	;***      152 : 				return 1;
	;***      153 : 			}
	;***      154 : 			return 0;
	;***      155 : 		}
	;***      156 : 	} else {
	;***      157 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
.BB@LABEL@4_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	ret
.BB@LABEL@4_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@4_2
.BB@LABEL@4_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
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
	movw ax, #LOWW(_g_Tick+0x00054)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_2
.BB@LABEL@4_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 150
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 150
	mov1 CY, [hl].4
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].4, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	ret
_isAcidEmpty:
	.STACK _isAcidEmpty = 6
	;***      158 : 	}
	;***      159 : 	return 0;
	;***      160 : }
	;***      161 : uint8_t isAcidEmpty(void) {
	;***      162 : 	if (I_ACID_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@5_2
.BB@LABEL@5_1:	; if_else_bb
	;***      163 : 		if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	;***      164 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)) {
	;***      165 : 			return 1;
	;***      166 : 		}
	;***      167 : 	} else {
	;***      168 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
	clrb a
	ret
.BB@LABEL@5_2:	; if_then_bb
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
	movw ax, #LOWW(_g_Tick+0x00058)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	oneb a
	sknz
.BB@LABEL@5_3:	; if_then_bb
	clrb a
.BB@LABEL@5_4:	; if_then_bb
	ret
_isAlkalineHigh:
	.STACK _isAlkalineHigh = 6
	;***      169 : 	}
	;***      170 : 	return 0;
	;***      171 : }
	;***      172 : 
	;***      173 : uint8_t isAlkalineHigh(void) {
	;***      174 : 	if (g_io_status.refined.AlkalineHighLevel
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].2
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].2
	bc $.BB@LABEL@6_3
.BB@LABEL@6_1:	; if_else_bb
	;***      175 : 			!= g_pre_io_status.refined.AlkalineHighLevel) {
	;***      176 : 		if (I_ALKALI_H_PIN == I_ON) {
	;***      177 : 			if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	;***      178 : 					g_timerSetting.t28_onDelayHighLevel_s * 1000)) {
	;***      179 : 				g_pre_io_status.refined.AlkalineHighLevel =
	;***      180 : 						g_io_status.refined.AlkalineHighLevel;
	;***      181 : 				return 1;
	;***      182 : 			}
	;***      183 : 			return 0;
	;***      184 : 		}
	;***      185 : 	} else {
	;***      186 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 186
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0005C), ax
.BB@LABEL@6_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 189
	ret
.BB@LABEL@6_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@6_2
.BB@LABEL@6_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
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
	bz $.BB@LABEL@6_2
.BB@LABEL@6_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
	mov1 CY, [hl].2
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].2, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	ret
_isAlkalineLow:
	.STACK _isAlkalineLow = 6
	;***      187 : 	}
	;***      188 : 	return 0;
	;***      189 : }
	;***      190 : uint8_t isAlkalineLow(void) {
	;***      191 : 	if (g_io_status.refined.AlkalineLowLevel
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].1
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].1
	bc $.BB@LABEL@7_3
.BB@LABEL@7_1:	; if_else_bb
	;***      192 : 			!= g_pre_io_status.refined.AlkalineLowLevel) {
	;***      193 : 		if (I_ALKALI_M_PIN == I_ON) {
	;***      194 : 			if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	;***      195 : 					g_timerSetting.t27_onDelayLowLevel_s * 1000)) {
	;***      196 : 				g_pre_io_status.refined.AlkalineLowLevel =
	;***      197 : 						g_io_status.refined.AlkalineLowLevel;
	;***      198 : 				return 1;
	;***      199 : 			}
	;***      200 : 			return 0;
	;***      201 : 		}
	;***      202 : 	} else {
	;***      203 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 203
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00062), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00060), ax
.BB@LABEL@7_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 206
	ret
.BB@LABEL@7_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 193
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@7_2
.BB@LABEL@7_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
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
	bz $.BB@LABEL@7_2
.BB@LABEL@7_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	mov1 CY, [hl].1
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].1, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	ret
_isAlkalineEmpty:
	.STACK _isAlkalineEmpty = 6
	;***      204 : 	}
	;***      205 : 	return 0;
	;***      206 : }
	;***      207 : uint8_t isAlkalineEmpty(void) {
	;***      208 : 	if (I_ALKALI_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 208
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@8_2
.BB@LABEL@8_1:	; if_else_bb
	;***      209 : 		if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	;***      210 : 				g_timerSetting.t26_onDelayEmptyLevel_s * 1000)) {
	;***      211 : 			return 1;
	;***      212 : 		}
	;***      213 : 	}else {
	;***      214 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00066), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00064), ax
	clrb a
	ret
.BB@LABEL@8_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 209
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
	oneb a
	sknz
.BB@LABEL@8_3:	; if_then_bb
	clrb a
.BB@LABEL@8_4:	; if_then_bb
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 6
	;***      215 : 	}
	;***      216 : 	return 0;
	;***      217 : }
	;***      218 : 
	;***      219 : //----------------------Begin code 11112021--------------------------------------
	;***      220 : void sendToRasPi(enum UART_header_e head, enum Control_status type, float value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 220
	push hl
	;***      221 : 	uint8_t state = g_uart2_sendend;
	;***      222 : 	g_control_buffer.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	mov !LOWW(_g_control_buffer), a
	mov a, x
	;***      223 : 	g_control_buffer.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	mov !LOWW(_g_control_buffer+0x00001), a
	movw ax, bc
	;***      224 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 224
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      225 : 	R_UART2_Send((uint8_t*) &g_control_buffer, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@9_1:	; bb9
	mov a, [sp+0x00]
	;***      226 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 226
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@9_1
.BB@LABEL@9_2:	; return
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
.BB@LABEL@10_1:	; bb
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
	bnz $.BB@LABEL@10_1
.BB@LABEL@10_2:	; bb25
	;***      243 : 	}
	;***      244 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	set1 0xFFF00.0
	;***      245 : 	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 245
	movw bc, #0x0007
	movw ax, #LOWW(_water_solfner_buf)
	call !!_R_UART3_Send
.BB@LABEL@10_3:	; bb28
	mov a, [sp+0x00]
	;***      246 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@10_3
.BB@LABEL@10_4:	; return
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
.BB@LABEL@11_1:	; bb
	movw ax, sp
	movw [sp+0x08], ax
	mov a, b
	add a, #0x02
	mov c, a
	;***      253 : 	for (uint8_t i = 2; i < 7; i++) {
	;***      254 : 		buf[i] = val5[i-2];
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
	bnz $.BB@LABEL@11_1
.BB@LABEL@11_2:	; bb31
	;***      255 : 	}
	;***      256 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	set1 0xFFF00.0
	;***      257 : 	R_UART3_Send(buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
	movw bc, #0x0007
	movw ax, sp
	call !!_R_UART3_Send
.BB@LABEL@11_3:	; bb35
	mov a, [sp+0x07]
	;***      258 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@11_3
.BB@LABEL@11_4:	; return
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
.BB@LABEL@12_1:	; bb
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
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_2:	; bb23
	mov a, c
	;***      266 : 	}
	;***      267 : 
	;***      268 : 	if ((input_buf[0] == header) && (input_buf[1] == control)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 268
	cmp a, [hl]
	bnz $.BB@LABEL@12_10
.BB@LABEL@12_3:	; bb32
	mov a, [sp+0x00]
	cmp a, [hl+0x01]
	bnz $.BB@LABEL@12_7
.BB@LABEL@12_4:	; bb47
	movw ax, [sp+0x08]
	cmpw ax, !LOWW(_btod+0x00002)
	movw ax, [sp+0x06]
	sknz
.BB@LABEL@12_5:	; bb47
	cmpw ax, !LOWW(_btod)
.BB@LABEL@12_6:	; bb47
	;***      269 : 			&& (btod.raw == data))
	;***      270 : 		return 2;
	;***      271 : 	else if ((input_buf[0] == header) && (input_buf[1] == control))
	;***      272 : 		return 1;
	;***      273 : 	else
	;***      274 : 		return 0;
	;***      275 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	mov a, #0x02
	bz $.BB@LABEL@12_9
.BB@LABEL@12_7:	; bb70
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 271
	cmp a, [hl+0x01]
	oneb a
	skz
.BB@LABEL@12_8:	; bb70
	clrb a
.BB@LABEL@12_9:	; bb70
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	ret
.BB@LABEL@12_10:	; if_else_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 274
	clrb a
	br $.BB@LABEL@12_9
_RaspberryResponse_nostop:
	.STACK _RaspberryResponse_nostop = 10
	;***      276 : /**
	;***      277 :  * Handle all response to Raspberry command.
	;***      278 :  */
	;***      279 : uint8_t *const time_setting_p = (uint8_t*) &_settingTime;
	;***      280 : uint8_t *const number_setting_p = (uint8_t*) &_settingNumber;
	;***      281 : struct UART_Buffer_s test_control_buf = { H_READ, READ_TIME, 0x000000ff };
	;***      282 : void RaspberryResponse_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	push hl
	;***      283 : 	if (commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	cmp0 !LOWW(_commnunication_flag)
	bz $.BB@LABEL@13_5
.BB@LABEL@13_1:	; if_then_bb
	;***      284 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      285 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@13_2:	; bb16
	mov a, [sp+0x00]
	;***      286 : //		if (isThisCommand(g_rx_data, H_SET, WASHING_MODE, 0xff) != 0) {
	;***      287 : //			g_machine_mode = g_rx_data[5];
	;***      288 : //		} else if (isThisCommand(g_rx_data, H_SET, OK_USER, 0xff) != 0) {
	;***      289 : //			g_machine_state.user = 1;
	;***      290 : //		}
	;***      291 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@13_4
.BB@LABEL@13_3:	; bb
	;***      292 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
	call !!_R_WDT_Restart
	br $.BB@LABEL@13_2
.BB@LABEL@13_4:	; bb24
	;***      293 : 		}
	;***      294 : 		commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
	clrb !LOWW(_commnunication_flag)
.BB@LABEL@13_5:	; if_break_bb
	;***      295 : 	}
	;***      296 : 	if (commnunication_flag.send_response_mode_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
	cmp !LOWW(_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@13_7
.BB@LABEL@13_6:	; if_then_bb30
	;***      297 : 		sendToRasPi(H_READ, WASHING_MODE, (uint32_t) g_machine_mode << (8 * 3));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
	mov a, !LOWW(_g_machine_mode)
	clrb x
	movw bc, ax
	clrw ax
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x5218
	call $!_sendToRasPi
	;***      298 : //		sendToRasPi(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
	;***      299 : 		commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	clrb !LOWW(_commnunication_flag+0x00006)
.BB@LABEL@13_7:	; if_break_bb35
	;***      300 : 	}
	;***      301 : 	if (commnunication_flag.send_respone_status_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
	cmp0 !LOWW(_commnunication_flag+0x00005)
	bz $.BB@LABEL@13_12
.BB@LABEL@13_8:	; if_then_bb41
	;***      302 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      303 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	movw bc, #0x0005
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@13_9:	; bb47
	mov a, [sp+0x00]
	;***      304 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@13_11
.BB@LABEL@13_10:	; bb46
	;***      305 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	call !!_R_WDT_Restart
	br $.BB@LABEL@13_9
.BB@LABEL@13_11:	; bb55
	;***      306 : 		}
	;***      307 : 		commnunication_flag.send_respone_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	clrb !LOWW(_commnunication_flag+0x00005)
.BB@LABEL@13_12:	; if_break_bb56
	;***      308 : 	}
	;***      309 : 	if (commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	cmp0 !LOWW(_commnunication_flag+0x00001)
	bz $.BB@LABEL@13_17
.BB@LABEL@13_13:	; if_then_bb62
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
.BB@LABEL@13_14:	; bb73
	mov a, [sp+0x00]
	;***      314 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 314
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@13_16
.BB@LABEL@13_15:	; bb72
	;***      315 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	call !!_R_WDT_Restart
	br $.BB@LABEL@13_14
.BB@LABEL@13_16:	; bb81
	;***      316 : 		}
	;***      317 : 		commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 317
	clrb !LOWW(_commnunication_flag+0x00001)
.BB@LABEL@13_17:	; if_break_bb82
	;***      318 : 	}
	;***      319 : 	if (commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 319
	cmp0 !LOWW(_commnunication_flag+0x00002)
	bz $.BB@LABEL@13_22
.BB@LABEL@13_18:	; if_then_bb88
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
.BB@LABEL@13_19:	; bb99
	mov a, [sp+0x00]
	;***      324 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 324
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@13_21
.BB@LABEL@13_20:	; bb98
	;***      325 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	call !!_R_WDT_Restart
	br $.BB@LABEL@13_19
.BB@LABEL@13_21:	; bb107
	;***      326 : 		}
	;***      327 : 		commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 327
	clrb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@13_22:	; if_break_bb108
	;***      328 : 	}
	;***      329 : 	if (commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 329
	cmp !LOWW(_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@13_38
.BB@LABEL@13_23:	; if_break_bb108.bb165_crit_edge
	clrb a
	mov b, a
.BB@LABEL@13_24:	; bb165
	;***      330 : //		//Do not Edit this, must keep!!!!
	;***      331 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 331
	cmp a, #0x8C
	bnc $.BB@LABEL@13_34
.BB@LABEL@13_25:	; bb115
	;***      332 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 332
	and a, #0x03
	bz $.BB@LABEL@13_32
.BB@LABEL@13_26:	; bb115
	dec a
	bz $.BB@LABEL@13_31
.BB@LABEL@13_27:	; bb115
	dec a
	mov a, b
	bz $.BB@LABEL@13_30
.BB@LABEL@13_28:	; switch_clause_bb
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
.BB@LABEL@13_29:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@13_33
.BB@LABEL@13_30:	; switch_clause_bb129
	;***      349 : 				break;
	;***      350 : 			case 2:
	;***      351 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 351
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@13_29
.BB@LABEL@13_31:	; switch_clause_bb140
	;***      352 : 				break;
	;***      353 : 			case 1:
	;***      354 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 354
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@13_33
.BB@LABEL@13_32:	; switch_clause_bb151
	;***      355 : 				break;
	;***      356 : 			case 0:
	;***      357 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 357
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@13_33:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@13_24
.BB@LABEL@13_34:	; bb174
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
	bnz $.BB@LABEL@13_36
.BB@LABEL@13_35:	; if_then_bb197
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
	;***      369 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 369
	clrb x
	br $.BB@LABEL@13_37
.BB@LABEL@13_36:	; if_else_bb
	;***      370 : 		} else {
	;***      371 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 371
	mov x, #0x16
.BB@LABEL@13_37:	; if_else_bb
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi
	;***      372 : 		}
	;***      373 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      374 : 		commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 374
	clrb !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@13_38:	; if_break_bb201
	;***      375 : 	}
	;***      376 : 
	;***      377 : 	if (commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 377
	cmp !LOWW(_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@13_54
.BB@LABEL@13_39:	; if_break_bb201.bb260_crit_edge
	clrb a
	mov b, a
.BB@LABEL@13_40:	; bb260
	;***      378 : //		//Do not Edit this, must keep!!!!
	;***      379 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 379
	cmp a, #0x24
	bnc $.BB@LABEL@13_50
.BB@LABEL@13_41:	; bb208
	;***      380 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 380
	and a, #0x03
	bz $.BB@LABEL@13_48
.BB@LABEL@13_42:	; bb208
	dec a
	bz $.BB@LABEL@13_47
.BB@LABEL@13_43:	; bb208
	dec a
	mov a, b
	bz $.BB@LABEL@13_46
.BB@LABEL@13_44:	; switch_clause_bb212
	;***      381 : 			case 3:
	;***      382 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 382
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@13_45:	; switch_clause_bb212
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@13_49
.BB@LABEL@13_46:	; switch_clause_bb223
	;***      383 : 				break;
	;***      384 : 			case 2:
	;***      385 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 385
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@13_45
.BB@LABEL@13_47:	; switch_clause_bb234
	;***      386 : 				break;
	;***      387 : 			case 1:
	;***      388 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 388
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@13_49
.BB@LABEL@13_48:	; switch_clause_bb245
	;***      389 : 				break;
	;***      390 : 			case 0:
	;***      391 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 391
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@13_49:	; switch_break_bb257
	inc b
	mov a, b
	br $.BB@LABEL@13_40
.BB@LABEL@13_50:	; bb269
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
	bnz $.BB@LABEL@13_52
.BB@LABEL@13_51:	; if_then_bb291
	;***      400 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      401 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 401
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call $!_sendToRasPi
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
	;***      405 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 405
	clrb x
	br $.BB@LABEL@13_53
.BB@LABEL@13_52:	; if_else_bb294
	;***      406 : 		} else {
	;***      407 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 407
	mov x, #0x16
.BB@LABEL@13_53:	; if_else_bb294
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi
	;***      408 : 		}
	;***      409 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      410 : 		commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 410
	clrb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@13_54:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 412
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 4
	;***      411 : 	}
	;***      412 : }
	;***      413 : /**
	;***      414 :  * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
	;***      415 :  * 13/12/2021: Checked!
	;***      416 :  */
	;***      417 : void InitialOperationModeStart(void) {
	;***      418 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 418
	call $!_UpdateMachineStatus
.BB@LABEL@14_1:	; bb72
	;***      419 : 	while (1) {
	;***      420 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 420
	call $!_RaspberryResponse_nostop
	;***      421 : 		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7; // Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 421
	mov a, 0xFFF07
	mov1 CY, a.1
	mov a, #0x80
	sknc
.BB@LABEL@14_2:	; bb7
	and a, 0xFFF06
.BB@LABEL@14_3:	; bb11
	mov x, a
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      422 : 		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6; // Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 422
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x40
	sknc
.BB@LABEL@14_4:	; bb27
	and a, 0xFFF06
.BB@LABEL@14_5:	; bb33
	mov x, a
	mov a, #0xBF
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      423 : 		if(isAcidEmpty()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 423
	call $!_isAcidEmpty
	cmp0 a
	skz
.BB@LABEL@14_6:	; if_then_bb
	;***      424 : 			O_DRAIN_ACID_PIN_SV7 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 424
	clr1 0xFFF06.7
.BB@LABEL@14_7:	; if_break_bb
	;***      425 : 		}
	;***      426 : 		if(isAlkalineEmpty()){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 426
	call $!_isAlkalineEmpty
	cmp0 a
	skz
.BB@LABEL@14_8:	; if_then_bb52
	;***      427 : 			O_DRAIN_ALK_PIN_SV6 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 427
	clr1 0xFFF06.6
.BB@LABEL@14_9:	; if_break_bb53
	mov a, #0x80
	;***      428 : 		}
	;***      429 : //		if (I_ACID_L_PIN == I_OFF) {
	;***      430 : //			if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	;***      431 : //					g_timerSetting.t26_onDelayEmptyLevel_s * 1000)) {
	;***      432 : //				O_DRAIN_ACID_PIN_SV7 = OFF;
	;***      433 : //			}
	;***      434 : //		} else
	;***      435 : //			g_Tick.tickAcidLevel[2] = g_systemTime;
	;***      436 : //		if (I_ALKALI_L_PIN == I_OFF) {
	;***      437 : //			if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	;***      438 : //					g_timerSetting.t26_onDelayEmptyLevel_s * 1000)) {
	;***      439 : //				O_DRAIN_ALK_PIN_SV6 = OFF;
	;***      440 : //			}
	;***      441 : //		} else
	;***      442 : //			g_Tick.tickAlkalineLevel[2] = g_systemTime;
	;***      443 : 		if ((O_DRAIN_ACID_PIN_SV7 == OFF) & (O_DRAIN_ALK_PIN_SV6 == OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 443
	and a, 0xFFF06
	mov x, a
	mov a, 0xFFF06
	bt a.6, $.BB@LABEL@14_11
.BB@LABEL@14_10:	; if_break_bb53
	cmp0 x
	bz $.BB@LABEL@14_12
.BB@LABEL@14_11:	; if_break_bb71
	;***      444 : 			break;
	;***      445 : 		}
	;***      446 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 446
	call $!_UpdateMachineStatus
	;***      447 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 447
	call !!_R_WDT_Restart
	br $.BB@LABEL@14_1
.BB@LABEL@14_12:	; return
	;***      448 : 	}
	;***      449 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 449
	ret
_WaterSupplyOperation_nostop:
	.STACK _WaterSupplyOperation_nostop = 14
	;***      450 : ///**
	;***      451 : // * FlowSensorCheck
	;***      452 : // * 30/11/2021: Checked!
	;***      453 : // * @return 0 is Error, 1 is OK, 2 Still taking
	;***      454 : // */
	;***      455 : //uint8_t FlowSensorCheck(uint32_t *_time) {
	;***      456 : ////	g_flow_value = measureFlowSensor();
	;***      457 : //	if ((g_flow_value < g_numberSetting.upperFlow)
	;***      458 : //			& (g_flow_value > g_numberSetting.lowerFlow)) {
	;***      459 : //		return 1;
	;***      460 : //	} else {
	;***      461 : //		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      462 : //		return 0;
	;***      463 : //	}
	;***      464 : //}
	;***      465 : /**
	;***      466 :  * WaterSupplyOperation
	;***      467 :  * 30/11/2021: Checked by An
	;***      468 :  */
	;***      469 : uint8_t WaterSupplyOperation_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 469
	subw sp, #0x06
	;***      470 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      471 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      472 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 472
	mov b, !LOWW(_g_machine_state+0x00004)
	mov a, b
	mov [sp+0x02], a
	cmp0 b
	bz $.BB@LABEL@15_8
.BB@LABEL@15_1:	; entry
	mov a, b
	dec a
	bz $.BB@LABEL@15_9
.BB@LABEL@15_2:	; entry
	dec a
	bz $.BB@LABEL@15_10
.BB@LABEL@15_3:	; entry
	dec a
	bz $.BB@LABEL@15_12
.BB@LABEL@15_4:	; entry
	dec a
	bz $.BB@LABEL@15_16
.BB@LABEL@15_5:	; entry
	dec a
	bz $.BB@LABEL@15_17
.BB@LABEL@15_6:	; entry
	dec a
	.bz $!.BB@LABEL@15_23
.BB@LABEL@15_7:	; switch_clause_bb81
	;***      473 : 	case 0:
	;***      474 : 		*tick = g_systemTime;
	;***      475 : 		(*state)++;
	;***      476 : 		break;
	;***      477 : 	case 1:
	;***      478 : 		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
	;***      479 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 30000)) {
	;***      480 : 			(*state)++;
	;***      481 : 		}
	;***      482 : 		break;
	;***      483 : 	case 2:
	;***      484 : 		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      485 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 500)) {
	;***      486 : 			(*state)++;
	;***      487 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      488 : 		}
	;***      489 : 		break;
	;***      490 : 	case 3:
	;***      491 : 		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      492 : //			nostop_measureFlowSensor();
	;***      493 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 15000)) {
	;***      494 : 			(*state)++;
	;***      495 : 		}
	;***      496 : 		measureFlowSensor_nostop();
	;***      497 : 		break;
	;***      498 : 	case 4:
	;***      499 : 		measureFlowSensor(&g_timerSetting.t3_flowSensorMonitorTime_s);
	;***      500 : 		(*state)++;
	;***      501 : 		break;
	;***      502 : 	case 5:
	;***      503 : 		if ((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow)
	;***      504 : 				|| (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)) {
	;***      505 : 			(*state) = 3;
	;***      506 : 			sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR,
	;***      507 : 					g_io_status.refined.FlowValue);
	;***      508 : 		} else
	;***      509 : 			(*state)++;
	;***      510 : 		g_Tick.tickWaterSupply = g_systemTime;
	;***      511 : 		break;
	;***      512 : 	case 6:
	;***      513 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply,
	;***      514 : 				g_timerSetting.t4_electrolysisOperationStart_s * 1000)) {
	;***      515 : 			(*state)++;
	;***      516 : 		}
	;***      517 : 		break;
	;***      518 : 	default:
	;***      519 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 519
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@15_15
.BB@LABEL@15_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 474
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 475
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@15_15
.BB@LABEL@15_9:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 478
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 479
	clrw ax
	movw de, ax
	movw bc, #0x7530
	br $!.BB@LABEL@15_24
.BB@LABEL@15_10:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 484
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 485
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@15_15
.BB@LABEL@15_11:	; if_then_bb22
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 486
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 487
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00024), ax
	br $.BB@LABEL@15_15
.BB@LABEL@15_12:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 491
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 493
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@15_13:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 494
	inc !LOWW(_g_machine_state+0x00004)
.BB@LABEL@15_14:	; if_break_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 496
	call $!_measureFlowSensor_nostop
.BB@LABEL@15_15:	; if_break_bb38
	br $.BB@LABEL@15_22
.BB@LABEL@15_16:	; switch_clause_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 499
	movw ax, #LOWW(_g_timerSetting+0x00008)
	call $!_measureFlowSensor
	br $.BB@LABEL@15_25
.BB@LABEL@15_17:	; switch_clause_bb45
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 503
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
	bnz $.BB@LABEL@15_20
.BB@LABEL@15_18:	; bb
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
	bnz $.BB@LABEL@15_20
.BB@LABEL@15_19:	; if_else_bb
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	inc a
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@15_21
.BB@LABEL@15_20:	; if_then_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 505
	mov !LOWW(_g_machine_state+0x00004), #0x03
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 506
	movw ax, #0x4104
	call $!_sendToRasPi
.BB@LABEL@15_21:	; if_break_bb67
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 510
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
.BB@LABEL@15_22:	; if_break_bb67
	br $.BB@LABEL@15_26
.BB@LABEL@15_23:	; switch_clause_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 513
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
.BB@LABEL@15_24:	; switch_clause_bb69
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@15_25:	; if_then_bb76
	inc !LOWW(_g_machine_state+0x00004)
.BB@LABEL@15_26:	; switch_break_bb
	;***      520 : 		break;
	;***      521 : 	}
	;***      522 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 522
	call !!_R_WDT_Restart
	;***      523 : 	return *state == 6 + 1 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 523
	cmp !LOWW(_g_machine_state+0x00004), #0x07
	oneb a
	sknz
.BB@LABEL@15_27:	; switch_break_bb
	clrb a
.BB@LABEL@15_28:	; switch_break_bb
	addw sp, #0x06
	ret
_stop_waitAlarmConfirm:
	.STACK _stop_waitAlarmConfirm = 10
	;***      524 : }
	;***      525 : void stop_waitAlarmConfirm(enum Control_status alarm, uint8_t timeout_s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 525
	subw sp, #0x04
	push ax
	;***      526 : 	uint32_t _tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@16_1:	; bb23
	mov a, [sp+0x01]
	;***      527 : 	while (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 527
	cmp a, !LOWW(_commnunication_flag+0x00007)
	bz $.BB@LABEL@16_5
.BB@LABEL@16_2:	; bb
	;***      528 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 528
	call $!_RaspberryResponse_nostop
	mov a, [sp+0x00]
	;***      529 : 		if((ns_delay_ms(&_tick, timeout_s*1000))&&(timeout_s != 0)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 529
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
	bz $.BB@LABEL@16_4
.BB@LABEL@16_3:	; bb
	mov a, [sp+0x00]
	cmp0 a
	bnz $.BB@LABEL@16_5
.BB@LABEL@16_4:	; if_break_bb
	;***      530 : 			break;
	;***      531 : 		}
	;***      532 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 532
	call !!_R_WDT_Restart
	br $.BB@LABEL@16_1
.BB@LABEL@16_5:	; bb32
	;***      533 : 	}
	;***      534 : 	commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 534
	clrb !LOWW(_commnunication_flag+0x00007)
	addw sp, #0x06
	ret
_nostop_waitAlarmConfirm:
	.STACK _nostop_waitAlarmConfirm = 4
	;***      535 : }
	;***      536 : uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 536
	cmp a, !LOWW(_commnunication_flag+0x00007)
	;***      537 : 	if (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 537
	bnz $.BB@LABEL@17_2
.BB@LABEL@17_1:	; if_break_bb
	;***      538 : 		return 1;
	;***      539 : 	}
	;***      540 : 	commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 540
	clrb !LOWW(_commnunication_flag+0x00007)
	;***      541 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 541
	clrb a
	ret
.BB@LABEL@17_2:	; bb9
	;***      542 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 542
	oneb a
	ret
_resetAlarm:
	.STACK _resetAlarm = 4
	;***      543 : void resetAlarm(void) {
	;***      544 : 	commnunication_flag.alarm_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	oneb !LOWW(_commnunication_flag+0x00007)
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      545 : }
	;***      546 : 
	;***      547 : /**
	;***      548 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      549 :  * 30/11/2021: Checked by An
	;***      550 :  * @return 0 - OK; 1 - Error
	;***      551 :  */
	;***      552 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 552
	subw sp, #0x0A
	;***      553 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 553
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
	bnz $.BB@LABEL@19_11
.BB@LABEL@19_5:	; if_then_bb
	;***      554 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 554
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
	bnz $.BB@LABEL@19_8
.BB@LABEL@19_6:	; bb31
	clrb a
.BB@LABEL@19_7:	; bb31
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 570
	ret
.BB@LABEL@19_8:	; if_then_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      555 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      556 : 			resetAlarm();
	;***      557 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 557
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      558 : 					g_io_status.refined.CVCCVoltage);
	;***      559 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 559
	set1 !LOWW(_g_alarm).0
	;***      560 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 560
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@19_9:	; bb17
	;***      561 : 			while (electrolyticOperationOFF_nostop())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 561
	call $!_electrolyticOperationOFF_nostop
	cmp0 a
	bnz $.BB@LABEL@19_9
.BB@LABEL@19_10:	; bb23
	;***      562 : 				;
	;***      563 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 563
	movw ax, #0x0500
	call $!_stop_waitAlarmConfirm
	;***      564 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 564
	clr1 !LOWW(_g_alarm).0
	;***      565 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 565
	oneb a
	br $.BB@LABEL@19_7
.BB@LABEL@19_11:	; if_else_bb
	;***      566 : 		}
	;***      567 : 	} else
	;***      568 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 568
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	br $.BB@LABEL@19_6
_Voltage2Check_nostop:
	.STACK _Voltage2Check_nostop = 18
	;***      569 : 	return 0;
	;***      570 : }
	;***      571 : /**
	;***      572 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      573 :  * 16/12/2021: Checked by An
	;***      574 :  * @return 0 - OK
	;***      575 :  */
	;***      576 : void Voltage2Check_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 576
	subw sp, #0x0A
	;***      577 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 577
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
.BB@LABEL@20_1:	; entry
	clrb a
.BB@LABEL@20_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@20_3:	; entry
	clrb x
.BB@LABEL@20_4:	; entry
	or x, a
	bnz $.BB@LABEL@20_8
.BB@LABEL@20_5:	; if_then_bb
	;***      578 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 578
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
	bz $.BB@LABEL@20_9
.BB@LABEL@20_6:	; if_then_bb10
	;***      579 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      580 : 			if(!(g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 580
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
	bnz $.BB@LABEL@20_9
.BB@LABEL@20_7:	; if_then_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      581 : 				resetAlarm();
	;***      582 : 				g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 582
	set1 !LOWW(_g_alarm).1
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      583 : 				sendToRasPi(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 583
	movw ax, #0x4106
	addw sp, #0x0A
	br $!_sendToRasPi
.BB@LABEL@20_8:	; if_else_bb
	;***      584 : 						g_io_status.refined.CVCCVoltage);
	;***      585 : 			}
	;***      586 : 		}
	;***      587 : 	} else {
	;***      588 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 588
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      589 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 589
	clr1 !LOWW(_g_alarm).1
.BB@LABEL@20_9:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 591
	ret
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      590 : 	}
	;***      591 : }
	;***      592 : /**
	;***      593 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      594 :  * 16/12/2021: Checked by An
	;***      595 :  * @return 0 - OK; 1 - Error
	;***      596 :  */
	;***      597 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 597
	subw sp, #0x0A
	;***      598 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 598
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
.BB@LABEL@21_1:	; entry
	clrb a
.BB@LABEL@21_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@21_3:	; entry
	clrb x
.BB@LABEL@21_4:	; entry
	or x, a
	bnz $.BB@LABEL@21_10
.BB@LABEL@21_5:	; if_then_bb
	;***      599 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 599
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
	bz $.BB@LABEL@21_11
.BB@LABEL@21_6:	; if_then_bb11
	;***      600 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      601 : 			if (!(g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 601
	movw ax, !LOWW(_g_numberSetting+0x00006)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00004)
	push ax
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@21_11
.BB@LABEL@21_7:	; if_then_bb21
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      602 : 				resetAlarm();
	;***      603 : 				g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 603
	set1 !LOWW(_g_alarm).2
	;***      604 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 604
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@21_8:	; bb27
	;***      605 : 				while (electrolyticOperationOFF_nostop())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 605
	call $!_electrolyticOperationOFF_nostop
	cmp0 a
	bnz $.BB@LABEL@21_8
.BB@LABEL@21_9:	; bb33
	;***      606 : 					;
	;***      607 : 				sendToRasPi(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 607
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      608 : 						g_io_status.refined.CVCCVoltage);
	;***      609 : 				stop_waitAlarmConfirm(OVER_VOLTAGE_3, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 609
	movw ax, #0x0700
	call $!_stop_waitAlarmConfirm
	;***      610 : 				g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 610
	clr1 !LOWW(_g_alarm).2
	;***      611 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 611
	oneb a
	br $.BB@LABEL@21_12
.BB@LABEL@21_10:	; if_else_bb
	;***      612 : 			}
	;***      613 : 		}
	;***      614 : 	} else {
	;***      615 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 615
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
.BB@LABEL@21_11:	; bb43
	clrb a
.BB@LABEL@21_12:	; bb43
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 618
	ret
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      616 : 	}
	;***      617 : 	return 0;
	;***      618 : }
	;***      619 : /**
	;***      620 :  * Checked 16/12/2021
	;***      621 :  * @return
	;***      622 :  */
	;***      623 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 623
	subw sp, #0x0A
	;***      624 : 	if ((g_systemTime - g_TickKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 624
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
.BB@LABEL@22_1:	; entry
	decw ax
.BB@LABEL@22_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@1+0x00012)
	cmpw ax, bc
	movw ax, hl
	sknz
.BB@LABEL@22_3:	; entry
	cmpw ax, de
.BB@LABEL@22_4:	; entry
	.bc $!.BB@LABEL@22_16
.BB@LABEL@22_5:	; if_then_bb
	;***      625 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      626 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 626
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
.BB@LABEL@22_6:	; if_then_bb
	clrb a
.BB@LABEL@22_7:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@22_8:	; if_then_bb
	clrb x
.BB@LABEL@22_9:	; if_then_bb
	or x, a
	bnz $.BB@LABEL@22_16
.BB@LABEL@22_10:	; if_then_bb13
	;***      627 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 627
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
	bnz $.BB@LABEL@22_13
.BB@LABEL@22_11:	; bb45
	clrb a
.BB@LABEL@22_12:	; bb45
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 645
	ret
.BB@LABEL@22_13:	; if_then_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      628 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      629 : 				resetAlarm();
	;***      630 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 630
	set1 !LOWW(_g_alarm).5
	;***      631 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 631
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@22_14:	; bb25
	;***      632 : 				while (electrolyticOperationOFF_nostop())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 632
	call $!_electrolyticOperationOFF_nostop
	cmp0 a
	bnz $.BB@LABEL@22_14
.BB@LABEL@22_15:	; bb31
	;***      633 : 					;
	;***      634 : 				sendToRasPi(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 634
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4108
	call $!_sendToRasPi
	;***      635 : 						(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      636 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 636
	movw ax, #0x0800
	call $!_stop_waitAlarmConfirm
	;***      637 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 637
	clr1 !LOWW(_g_alarm).5
	;***      638 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 638
	oneb a
	br $.BB@LABEL@22_12
.BB@LABEL@22_16:	; if_else_bb
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	br $.BB@LABEL@22_11
_OverCurrentCheck_waitReset:
	.STACK _OverCurrentCheck_waitReset = 22
	;***      639 : 			}
	;***      640 : 		} else
	;***      641 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      642 : 	} else
	;***      643 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      644 : 	return 0;
	;***      645 : }
	;***      646 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 646
	subw sp, #0x0E
	;***      647 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 647
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      648 : 	const uint16_t _max_time = 10000;
	;***      649 : 	if (g_systemTime - g_TickKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 649
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TickKeeper@1+0x00010)
	movw de, ax
	movw ax, bc
	sknc
.BB@LABEL@23_1:	; entry
	decw ax
.BB@LABEL@23_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@1+0x00012)
	clrw bc
	cmpw ax, bc
	movw ax, de
	sknz
.BB@LABEL@23_3:	; entry
	cmpw ax, #0x1388
.BB@LABEL@23_4:	; entry
	.bc $!.BB@LABEL@23_30
.BB@LABEL@23_5:	; if_then_bb
	;***      650 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 650
	movw ax, !LOWW(_g_numberSetting+0x00016)
	movw [sp+0x0C], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x08], ax
	push ax
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000E)
	movw [sp+0x06], ax
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@23_11
.BB@LABEL@23_6:	; bb
	movw ax, !LOWW(_g_numberSetting+0x00012)
	movw [sp+0x0A], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	movw [sp+0x0A], ax
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_funordered
	mov [sp+0x08], a
	addw sp, #0x04
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x0A]
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
.BB@LABEL@23_7:	; bb
	clrb a
.BB@LABEL@23_8:	; bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@23_9:	; bb
	clrb x
.BB@LABEL@23_10:	; bb
	or x, a
	.bnz $!.BB@LABEL@23_30
.BB@LABEL@23_11:	; if_then_bb24
	mov a, #0x48
	;***      651 : 				|| (g_io_status.refined.CVCCCurrent
	;***      652 : 						>= g_numberSetting.upperCurrent)) {
	;***      653 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 653
	and a, !LOWW(_g_alarm)
	bnz $.BB@LABEL@23_20
.BB@LABEL@23_12:	; if_then_bb24
	movw ax, [sp+0x0C]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bz $.BB@LABEL@23_20
.BB@LABEL@23_13:	; if_then_bb58
	pop bc
	push bc
	movw ax, [sp+0x02]
	;***      654 : 					&& (g_alarm.refined.overCurrent == 0) && (g_io_status.refined.CVCCCurrent
	;***      655 : 							<= g_numberSetting.lowerCurrent)) {
	;***      656 : 				sendToRasPi(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 656
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4109
	call $!_sendToRasPi
	;***      657 : 						(uint32_t) (g_io_status.refined.CVCCCurrent));
	;***      658 : 				g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 658
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
	movw [sp+0x06], ax
	call !!__COM_funordered
	mov [sp+0x08], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
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
.BB@LABEL@23_14:	; if_then_bb58
	clrb a
.BB@LABEL@23_15:	; if_then_bb58
	cmp0 x
	oneb x
	sknz
.BB@LABEL@23_16:	; if_then_bb58
	clrb x
.BB@LABEL@23_17:	; if_then_bb58
	or x, a
	mov x, #0x40
	skz
.BB@LABEL@23_18:	; bb67
	clrb x
.BB@LABEL@23_19:	; bb69
	mov a, #0xBF
	and a, !LOWW(_g_alarm)
	or a, x
	mov !LOWW(_g_alarm), a
.BB@LABEL@23_20:	; if_break_bb
	;***      659 : 						g_io_status.refined.CVCCCurrent
	;***      660 : 								<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      661 : 			}
	;***      662 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 662
	movw ax, !LOWW(_g_numberSetting+0x00012)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	movw [sp+0x08], ax
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_funordered
	mov [sp+0x08], a
	addw sp, #0x04
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x08]
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
.BB@LABEL@23_21:	; if_break_bb
	clrb a
.BB@LABEL@23_22:	; if_break_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@23_23:	; if_break_bb
	clrb x
.BB@LABEL@23_24:	; if_break_bb
	or x, a
	bnz $.BB@LABEL@23_29
.BB@LABEL@23_25:	; if_then_bb83
	;***      663 : 					>= g_numberSetting.upperCurrent) {
	;***      664 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 664
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@23_30
.BB@LABEL@23_26:	; if_then_bb90
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      665 : 					resetAlarm();
	;***      666 : 					g_alarm.refined.overCurrent = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 666
	set1 !LOWW(_g_alarm).3
	;***      667 : 					g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 667
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@23_27:	; bb96
	;***      668 : 					while (electrolyticOperationOFF_nostop())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 668
	call $!_electrolyticOperationOFF_nostop
	cmp0 a
	bnz $.BB@LABEL@23_27
.BB@LABEL@23_28:	; bb102
	;***      669 : 						;
	;***      670 : 					sendToRasPi(H_ALARM, OVER_CURRENT,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 670
	movw bc, !LOWW(_g_io_status+0x0000E)
	movw de, !LOWW(_g_io_status+0x00010)
	movw ax, #0x410A
	call $!_sendToRasPi
	;***      671 : 							g_io_status.refined.CVCCCurrent);
	;***      672 : 					stop_waitAlarmConfirm(OVER_CURRENT, 10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 672
	movw ax, #0x0A0A
	call $!_stop_waitAlarmConfirm
	;***      673 : 					g_alarm.refined.overCurrent = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 673
	clr1 !LOWW(_g_alarm).3
	;***      674 : 					return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 674
	oneb a
	br $.BB@LABEL@23_31
.BB@LABEL@23_29:	; if_else_bb
	;***      675 : 				}
	;***      676 : 			} else{
	;***      677 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 677
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@23_30:	; bb114
	clrb a
.BB@LABEL@23_31:	; bb114
	addw sp, #0x0E
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 682
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@24_1:	; WAIT_RESET
	;***      678 : 			}
	;***      679 : 		}
	;***      680 : 	}
	;***      681 : 	return 0;
	;***      682 : }
	;***      683 : void ElectrolyticOperation(void) {
	;***      684 : 	WAIT_RESET:
	;***      685 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 685
	call $!_electrolyticOperationON
	;***      686 : 	g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 686
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	;***      687 : 	g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 687
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      688 : 	g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 688
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
	;***      689 : 	g_Tick.tickVoltageLowCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 689
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00038), ax
	;***      690 : 	g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 690
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@24_2:	; bb
	;***      691 : 	do {
	;***      692 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 692
	call $!_RaspberryResponse_nostop
	;***      693 : 		if (Voltage1Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 693
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@24_1
.BB@LABEL@24_3:	; if_break_bb
	;***      694 : 			goto WAIT_RESET;
	;***      695 : 		Voltage2Check_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 695
	call $!_Voltage2Check_nostop
	;***      696 : 		if (Voltage3Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 696
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@24_1
.BB@LABEL@24_4:	; if_break_bb17
	;***      697 : 			goto WAIT_RESET;
	;***      698 : 		if (LowVoltageCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 698
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@24_1
.BB@LABEL@24_5:	; if_break_bb25
	;***      699 : 			goto WAIT_RESET;
	;***      700 : 		if (OverCurrentCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 700
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@24_1
.BB@LABEL@24_6:	; if_break_bb33
	;***      701 : 			goto WAIT_RESET;
	;***      702 : 		//----------CVCC Alarm Input-----------------
	;***      703 : 		if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 703
	mov a, 0xFFF00
	bf a.4, $.BB@LABEL@24_12
.BB@LABEL@24_7:	; if_break_bb59
	;***      704 : 			g_alarm.refined.cvcc = 1;
	;***      705 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	;***      706 : 			while (electrolyticOperationOFF_nostop())
	;***      707 : 				;
	;***      708 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	;***      709 : 			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	;***      710 : 			g_alarm.refined.cvcc = 0;
	;***      711 : 			goto WAIT_RESET;
	;***      712 : 		}
	;***      713 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 713
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 691
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@24_2
.BB@LABEL@24_8:	; bb66
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@24_2
.BB@LABEL@24_9:	; bb80
	;***      714 : 	} while ((I_ACID_H_PIN == I_OFF) || (I_ALKALI_H_PIN == I_OFF));
	;***      715 : 	g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 715
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@24_10:	; bb83
	;***      716 : 	while (electrolyticOperationOFF_nostop());
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 716
	call $!_electrolyticOperationOFF_nostop
	cmp0 a
	bnz $.BB@LABEL@24_10
.BB@LABEL@24_11:	; return
	;***      717 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 717
	ret
.BB@LABEL@24_12:	; if_then_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 704
	set1 !LOWW(_g_alarm).7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 705
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@24_13:	; bb47
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 706
	call $!_electrolyticOperationOFF_nostop
	cmp0 a
	bnz $.BB@LABEL@24_13
.BB@LABEL@24_14:	; bb53
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 708
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 709
	movw ax, #0x1200
	call $!_stop_waitAlarmConfirm
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 710
	clr1 !LOWW(_g_alarm).7
	br $!.BB@LABEL@24_1
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      718 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 718
	subw sp, #0x04
	;***      719 : 	uint32_t _time_count = 0;
	;***      720 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 720
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
	bnz $.BB@LABEL@25_3
.BB@LABEL@25_1:	; entry
	bc $.BB@LABEL@25_3
.BB@LABEL@25_2:	; entry
	movw ax, #0x3DCC
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, de
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@25_4
.BB@LABEL@25_3:	; entry.if_break_bb_crit_edge
	clrw ax
	movw [sp+0x02], ax
	movw [sp+0x00], ax
	br $.BB@LABEL@25_5
.BB@LABEL@25_4:	; if_then_bb
	onew ax
	movw [sp+0x02], ax
	decw ax
	movw [sp+0x00], ax
	;***      721 : 			& (_time_count
	;***      722 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      723 : 		_time_count++;
	;***      724 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 724
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@25_5:	; if_break_bb
	;***      725 : 	}
	;***      726 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 726
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
.BB@LABEL@25_6:	; if_break_bb
	cmpw ax, de
.BB@LABEL@25_7:	; if_break_bb
	addw sp, #0x04
	bnz $.BB@LABEL@25_9
.BB@LABEL@25_8:	; if_then_bb20
	;***      727 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 727
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi
.BB@LABEL@25_9:	; return
	;***      728 : 	}
	;***      729 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 729
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      730 : void saltWaterTankFullCheck(void) {
	;***      731 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 731
	mov a, 0xFFF05
	bf a.3, $.BB@LABEL@26_3
.BB@LABEL@26_1:	; if_then_bb
	;***      732 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 732
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi
	;***      733 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 733
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@26_2:	; bb7
	;***      734 : 		while (electrolyticOperationOFF_nostop())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 734
	call $!_electrolyticOperationOFF_nostop
	cmp0 a
	bnz $.BB@LABEL@26_2
.BB@LABEL@26_3:	; return
	;***      735 : 			;
	;***      736 : 	}
	;***      737 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 737
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      738 : void saltWaterTankEmptyCheck(void) {
	;***      739 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 739
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@27_2
.BB@LABEL@27_1:	; if_then_bb
	;***      740 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 740
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi
.BB@LABEL@27_2:	; return
	;***      741 : 	}
	;***      742 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 742
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      743 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 743
	movw de, #0xFF07
	;***      744 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 744
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
.BB@LABEL@28_1:	; return
	;***      745 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      746 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      747 : 
	;***      748 : 	}
	;***      749 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 749
	ret
.BB@LABEL@28_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 746
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      750 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 750
	push hl
	;***      751 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 751
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
.BB@LABEL@29_1:	; return
	;***      752 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      753 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      754 : 	}
	;***      755 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 755
	ret
.BB@LABEL@29_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 753
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      756 : 
	;***      757 : uint8_t FilterReplacementCheck(void) {
	;***      758 : 
	;***      759 : 	return 0;
	;***      760 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 760
	clrb a
	ret
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      761 : 
	;***      762 : /**
	;***      763 :  * Tested: 10/12/2021 by Mr.An
	;***      764 :  */
	;***      765 : void WaterWashingMode_nostop(void) {
	;***      766 : 	uint8_t *state = &g_machine_state.water;
	;***      767 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      768 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 768
	mov a, !LOWW(_g_machine_state+0x00002)
	cmp0 a
	bz $.BB@LABEL@31_3
.BB@LABEL@31_1:	; entry
	dec a
	bz $.BB@LABEL@31_4
.BB@LABEL@31_2:	; switch_clause_bb20
	;***      769 : 	case 0:
	;***      770 : 		g_machine_state.mode = WATER_WASHING;
	;***      771 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      772 : 		g_color = WHITE;
	;***      773 : 		*tick = g_systemTime;
	;***      774 : 		(*state)++;
	;***      775 : 		handSensorLED(g_color);
	;***      776 : 		break;
	;***      777 : 	case 1:
	;***      778 : 		if (DETECT_U == I_ON) {
	;***      779 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      780 : 			g_color = BLACK;
	;***      781 : 			(*state) = 0;
	;***      782 : 			g_machine_state.mode = BUSY;
	;***      783 : 			handSensorLED(g_color);
	;***      784 : 		}
	;***      785 : 		break;
	;***      786 : 	default:
	;***      787 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 787
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@31_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 770
	mov !LOWW(_g_machine_state+0x00007), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 771
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 772
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 773
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 774
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 775
	mov a, #0x02
	br $.BB@LABEL@31_6
.BB@LABEL@31_4:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 778
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@31_7
.BB@LABEL@31_5:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 779
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 780
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 781
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 782
	mov !LOWW(_g_machine_state+0x00007), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 783
	clrb a
.BB@LABEL@31_6:	; if_then_bb
	br $!_handSensorLED
.BB@LABEL@31_7:	; return
	;***      788 : 		break;
	;***      789 : 	}
	;***      790 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 790
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 10
	;***      791 : 
	;***      792 : /**
	;***      793 :  * Tested: 24/12/2021 by Mr.An
	;***      794 :  */
	;***      795 : void HandWashingMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 795
	subw sp, #0x04
	;***      796 : 	uint8_t *state = &g_machine_state.handwash;
	;***      797 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      798 : 	const uint32_t delayPump_ms = 50;
	;***      799 : 	g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 799
	movw ax, !LOWW(_g_timerSetting+0x00076)
	movw [sp+0x00], ax
	clrw bc
	cmpw ax, bc
	movw ax, !LOWW(_g_timerSetting+0x00074)
	movw [sp+0x02], ax
	sknz
.BB@LABEL@32_1:	; entry
	cmpw ax, #0x0032
.BB@LABEL@32_2:	; entry
	bnc $.BB@LABEL@32_4
.BB@LABEL@32_3:	; entry.bb16_crit_edge
	clrw ax
	movw [sp+0x00], ax
	mov x, #0x32
	br $.BB@LABEL@32_8
.BB@LABEL@32_4:	; bb10
	movw ax, [sp+0x00]
	;***      800 : 			g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***      801 : 					delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***      802 : 	g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 802
	cmpw ax, bc
	movw ax, [sp+0x02]
	sknz
.BB@LABEL@32_5:	; bb10
	cmpw ax, #0x03E9
.BB@LABEL@32_6:	; bb10
	bc $.BB@LABEL@32_9
.BB@LABEL@32_7:	; bb10.bb19_crit_edge
	clrw ax
	movw [sp+0x00], ax
	movw ax, #0x03E8
.BB@LABEL@32_8:	; bb10.bb19_crit_edge
	movw [sp+0x02], ax
.BB@LABEL@32_9:	; bb19
	movw !LOWW(_g_timerSetting+0x00074), ax
	movw ax, [sp+0x00]
	movw !LOWW(_g_timerSetting+0x00076), ax
	;***      803 : 			g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***      804 : 					1000 : g_timerSetting.t54_overLapTime_ms;
	;***      805 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 805
	mov a, !LOWW(_g_machine_state+0x00003)
	cmp0 a
	.bz $!.BB@LABEL@32_45
.BB@LABEL@32_10:	; bb19
	dec a
	bz $.BB@LABEL@32_18
.BB@LABEL@32_11:	; bb19
	dec a
	bz $.BB@LABEL@32_21
.BB@LABEL@32_12:	; bb19
	dec a
	.bz $!.BB@LABEL@32_25
.BB@LABEL@32_13:	; bb19
	dec a
	.bz $!.BB@LABEL@32_29
.BB@LABEL@32_14:	; bb19
	dec a
	.bz $!.BB@LABEL@32_35
.BB@LABEL@32_15:	; bb19
	dec a
	.bz $!.BB@LABEL@32_40
.BB@LABEL@32_16:	; bb19
	dec a
	.bz $!.BB@LABEL@32_43
.BB@LABEL@32_17:	; switch_clause_bb117
	;***      806 : 	case 0:
	;***      807 : 		*state = 1;
	;***      808 : 		*tick = g_systemTime;
	;***      809 : 		break;
	;***      810 : 	case 1:
	;***      811 : 		g_machine_state.mode = HAND_WASHING;
	;***      812 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      813 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      814 : 			O_PUMP_ALK_PIN = ON;
	;***      815 : 			handSensorLED(BLUE);
	;***      816 : 			(*state)++;
	;***      817 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      818 : 		}
	;***      819 : 		break;
	;***      820 : 	case 2:
	;***      821 : 		if (ns_delay_ms(tick,
	;***      822 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      823 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      824 : 			O_PUMP_ALK_PIN = OFF;
	;***      825 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      826 : 			(*state)++;
	;***      827 : 		}
	;***      828 : 		break;
	;***      829 : 	case 3:
	;***      830 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      831 : 			O_PUMP_ACID_PIN = ON;
	;***      832 : 			handSensorLED(RED);
	;***      833 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      834 : 			(*state)++;
	;***      835 : 		}
	;***      836 : 		break;
	;***      837 : 	case 4:
	;***      838 : 		if (ns_delay_ms(tick,
	;***      839 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      840 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      841 : 			(*state)++;
	;***      842 : 		}
	;***      843 : 		break;
	;***      844 : 	case 5:
	;***      845 : 		if (ns_delay_ms(tick,
	;***      846 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      847 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      848 : 			O_PUMP_ACID_PIN = OFF;
	;***      849 : 			handSensorLED(WHITE);
	;***      850 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      851 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      852 : 			(*state)++;
	;***      853 : 		}
	;***      854 : 		break;
	;***      855 : 	case 6:
	;***      856 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      857 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      858 : 			(*state)++;
	;***      859 : 		}
	;***      860 : 		break;
	;***      861 : 	case 7:
	;***      862 : 		if (ns_delay_ms(tick,
	;***      863 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      864 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      865 : 			handSensorLED(BLACK);
	;***      866 : 			(*state) = 0;
	;***      867 : 			g_machine_state.mode = BUSY;
	;***      868 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      869 : 		}
	;***      870 : 		break;
	;***      871 : 	default:
	;***      872 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 872
	clrb !LOWW(_g_machine_state+0x00003)
	br $!.BB@LABEL@32_46
.BB@LABEL@32_18:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 811
	oneb !LOWW(_g_machine_state+0x00007)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 812
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 813
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@32_26
.BB@LABEL@32_19:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 814
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 815
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 816
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@32_20:	; if_then_bb
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	addw sp, #0x04
	br $!_sendToRasPi
.BB@LABEL@32_21:	; switch_clause_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 821
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
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, hl
	subw ax, bc
	movw bc, ax
	movw ax, [sp+0x00]
	xchw ax, de
	sknc
.BB@LABEL@32_22:	; switch_clause_bb38
	decw ax
.BB@LABEL@32_23:	; switch_clause_bb38
	subw ax, de
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@32_34
.BB@LABEL@32_24:	; if_then_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 824
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 825
	set1 0xFFF07.6
	br $.BB@LABEL@32_33
.BB@LABEL@32_25:	; switch_clause_bb53
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 830
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@32_26:	; switch_clause_bb53
	bz $.BB@LABEL@32_38
.BB@LABEL@32_27:	; if_then_bb60
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 831
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 832
	oneb a
	call $!_handSensorLED
.BB@LABEL@32_28:	; if_then_bb60
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	br $.BB@LABEL@32_33
.BB@LABEL@32_29:	; switch_clause_bb65
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 838
	addw ax, #0xFFCE
	movw bc, ax
	pop de
	push de
	skc
.BB@LABEL@32_30:	; switch_clause_bb65
	decw de
.BB@LABEL@32_31:	; switch_clause_bb65
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@32_41
.BB@LABEL@32_32:	; if_then_bb74
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 840
	clr1 0xFFF07.7
.BB@LABEL@32_33:	; if_then_bb74
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@32_34:	; if_then_bb74
	br $!.BB@LABEL@32_46
.BB@LABEL@32_35:	; switch_clause_bb79
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 845
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
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, hl
	subw ax, bc
	movw bc, ax
	movw ax, [sp+0x00]
	xchw ax, de
	sknc
.BB@LABEL@32_36:	; switch_clause_bb79
	decw ax
.BB@LABEL@32_37:	; switch_clause_bb79
	subw ax, de
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@32_38:	; switch_clause_bb79
	bz $.BB@LABEL@32_46
.BB@LABEL@32_39:	; if_then_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 848
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 849
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 850
	set1 0xFFF05.5
	br $.BB@LABEL@32_28
.BB@LABEL@32_40:	; switch_clause_bb94
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 856
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@32_41:	; switch_clause_bb94
	bz $.BB@LABEL@32_46
.BB@LABEL@32_42:	; if_then_bb101
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 857
	clr1 0xFFF07.6
	br $.BB@LABEL@32_33
.BB@LABEL@32_43:	; switch_clause_bb106
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 862
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
	bz $.BB@LABEL@32_46
.BB@LABEL@32_44:	; if_then_bb114
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 864
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 865
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 866
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 867
	mov !LOWW(_g_machine_state+0x00007), #0x07
	br $!.BB@LABEL@32_20
.BB@LABEL@32_45:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 807
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 808
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
.BB@LABEL@32_46:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 876
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      873 : 		break;
	;***      874 : 	}
	;***      875 : 
	;***      876 : }
	;***      877 : /**
	;***      878 :  * Tested: 24/12/2021 by Mr.An
	;***      879 :  */
	;***      880 : void AcidWaterMode_nostop(void) {
	;***      881 : 	uint8_t *state = &g_machine_state.acid;
	;***      882 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      883 : 	const uint32_t delayPump_ms = 50;
	;***      884 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 884
	mov a, !LOWW(_g_machine_state+0x00001)
	cmp0 a
	bz $.BB@LABEL@33_5
.BB@LABEL@33_1:	; entry
	dec a
	bz $.BB@LABEL@33_6
.BB@LABEL@33_2:	; entry
	dec a
	bz $.BB@LABEL@33_9
.BB@LABEL@33_3:	; entry
	movw de, #0x0000
	dec a
	bz $.BB@LABEL@33_12
.BB@LABEL@33_4:	; switch_clause_bb57
	;***      885 : 	case 0:
	;***      886 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      887 : 		g_machine_state.mode = ACID_WASHING;
	;***      888 : 		*state = 1;
	;***      889 : 		*tick = g_systemTime;
	;***      890 : 		break;
	;***      891 : 	case 1:
	;***      892 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      893 : 		g_color = RED;
	;***      894 : 		handSensorLED(g_color);
	;***      895 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      896 : 			O_PUMP_ACID_PIN = ON;
	;***      897 : 			(*state)++;
	;***      898 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      899 : 		}
	;***      900 : 		break;
	;***      901 : 	case 2:
	;***      902 : 		//TODO: Change turn OFF signal here
	;***      903 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      904 : 				|| (DETECT_U == I_ON)) {
	;***      905 : 			O_PUMP_ACID_PIN = OFF;
	;***      906 : 			(*state)++;
	;***      907 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      908 : 		}
	;***      909 : 		break;
	;***      910 : 	case 3:
	;***      911 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      912 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      913 : 			g_color = BLACK;
	;***      914 : 			handSensorLED(g_color);
	;***      915 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      916 : 			(*state)++;
	;***      917 : 		}
	;***      918 : 		break;
	;***      919 : 	default:
	;***      920 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 920
	mov !LOWW(_g_machine_state+0x00007), #0x07
	;***      921 : 		sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 921
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	;***      922 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 922
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@33_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 887
	mov !LOWW(_g_machine_state+0x00007), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 888
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 889
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@33_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 892
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 893
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 894
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 895
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_14
.BB@LABEL@33_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 896
	set1 0xFFF06.2
.BB@LABEL@33_8:	; if_then_bb
	inc !LOWW(_g_machine_state+0x00001)
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi
.BB@LABEL@33_9:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 903
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
	bnz $.BB@LABEL@33_11
.BB@LABEL@33_10:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@33_14
.BB@LABEL@33_11:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 905
	clr1 0xFFF06.2
	br $.BB@LABEL@33_8
.BB@LABEL@33_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 911
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_14
.BB@LABEL@33_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 912
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 913
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 914
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 915
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 916
	inc !LOWW(_g_machine_state+0x00001)
.BB@LABEL@33_14:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 925
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      923 : 		break;
	;***      924 : 	}
	;***      925 : }
	;***      926 : /**
	;***      927 :  * Tested: 24/12/2021 by Mr.An
	;***      928 :  */
	;***      929 : void AlkalineWaterMode_nostop(void) {
	;***      930 : 	uint8_t *state = &g_machine_state.akaline;
	;***      931 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      932 : 	const uint32_t delayPump_ms = 50;
	;***      933 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 933
	mov a, !LOWW(_g_machine_state)
	cmp0 a
	bz $.BB@LABEL@34_5
.BB@LABEL@34_1:	; entry
	dec a
	bz $.BB@LABEL@34_6
.BB@LABEL@34_2:	; entry
	dec a
	bz $.BB@LABEL@34_8
.BB@LABEL@34_3:	; entry
	movw de, #0x0000
	dec a
	bz $.BB@LABEL@34_12
.BB@LABEL@34_4:	; switch_clause_bb57
	;***      934 : 	case 0:
	;***      935 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      936 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      937 : 		*state = 1;
	;***      938 : 		*tick = g_systemTime;
	;***      939 : 		break;
	;***      940 : 	case 1:
	;***      941 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      942 : 		g_color = BLUE;
	;***      943 : 		handSensorLED(g_color);
	;***      944 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      945 : 			O_PUMP_ALK_PIN = ON;
	;***      946 : 			(*state)++;
	;***      947 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      948 : 		}
	;***      949 : 		break;
	;***      950 : 	case 2:
	;***      951 : 		//TODO: Change turn OFF signal here
	;***      952 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***      953 : 				|| (DETECT_U == I_ON)) {
	;***      954 : 			O_PUMP_ALK_PIN = OFF;
	;***      955 : 			(*state)++;
	;***      956 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      957 : 		}
	;***      958 : 		break;
	;***      959 : 	case 3:
	;***      960 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      961 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      962 : 			g_color = BLACK;
	;***      963 : 			handSensorLED(g_color);
	;***      964 : 			(*state)++;
	;***      965 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      966 : 		}
	;***      967 : 		break;
	;***      968 : 	default:
	;***      969 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 969
	mov !LOWW(_g_machine_state+0x00007), #0x07
	;***      970 : 		sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 970
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	;***      971 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 971
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@34_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 936
	mov !LOWW(_g_machine_state+0x00007), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 937
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 938
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@34_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 941
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 942
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 943
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 944
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@34_14
.BB@LABEL@34_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 945
	set1 0xFFF06.1
	br $.BB@LABEL@34_11
.BB@LABEL@34_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 952
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
	bnz $.BB@LABEL@34_10
.BB@LABEL@34_9:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@34_14
.BB@LABEL@34_10:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 954
	clr1 0xFFF06.1
.BB@LABEL@34_11:	; if_then_bb39
	inc !LOWW(_g_machine_state)
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi
.BB@LABEL@34_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 960
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@34_14
.BB@LABEL@34_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 961
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 962
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 963
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@34_11
.BB@LABEL@34_14:	; return
	;***      972 : 		break;
	;***      973 : 	}
	;***      974 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 974
	ret
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***      975 : 
	;***      976 : void CallanCleaningMode_nostop(void) {
	;***      977 : 	if ((g_TickKeeper.SV1_OFF_minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 977
	movw de, !LOWW(_g_timerSetting+0x00086)
	movw bc, !LOWW(_g_timerSetting+0x00084)
	movw ax, !LOWW(_g_TickKeeper@1+0x0000E)
	cmpw ax, de
	movw ax, !LOWW(_g_TickKeeper@1+0x0000C)
	sknz
.BB@LABEL@35_1:	; entry
	cmpw ax, bc
.BB@LABEL@35_2:	; entry
	movw hl, !LOWW(_g_TickKeeper@1+0x00004)
	movw ax, !LOWW(_g_TickKeeper@1+0x00006)
	bc $.BB@LABEL@35_7
.BB@LABEL@35_3:	; entry
	cmpw ax, de
	movw ax, hl
	sknz
.BB@LABEL@35_4:	; entry
	cmpw ax, bc
.BB@LABEL@35_5:	; entry
	bc $.BB@LABEL@35_7
.BB@LABEL@35_6:	; if_then_bb
	;***      978 : 			>= g_timerSetting.t61_curranCleaningIntervalTime_h)
	;***      979 : 			& (g_TickKeeper.SV2_OFF_minutes
	;***      980 : 					>= g_timerSetting.t61_curranCleaningIntervalTime_h)) {
	;***      981 : 		g_callan_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 981
	oneb !LOWW(_g_callan_clear_flag@3)
	;***      982 : 		g_Tick.tickCustom[6] = g_Tick.tickCustom[7] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 982
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0008E), ax
	movw !LOWW(_g_Tick+0x0008A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0008C), ax
	movw !LOWW(_g_Tick+0x00088), ax
	;***      983 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 983
	set1 0xFFF05.5
.BB@LABEL@35_7:	; if_break_bb
	;***      984 : 	}
	;***      985 : 	if (g_callan_clear_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 985
	cmp0 !LOWW(_g_callan_clear_flag@3)
	bz $.BB@LABEL@35_14
.BB@LABEL@35_8:	; if_then_bb18
	;***      986 : 		if (ns_delay_ms(&g_Tick.tickCustom[6], 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 986
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x00088)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@35_12
.BB@LABEL@35_9:	; if_then_bb23
	;***      987 : 			g_color = g_color == WHITE ? BLACK : WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 987
	cmp !LOWW(_g_color), #0x02
	clrb a
	skz
.BB@LABEL@35_10:	; bb28
	mov a, #0x02
.BB@LABEL@35_11:	; bb29
	mov !LOWW(_g_color), a
	;***      988 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 988
	call $!_handSensorLED
.BB@LABEL@35_12:	; if_break_bb34
	;***      989 : 		}
	;***      990 : 		if (ns_delay_ms(&g_Tick.tickCustom[7],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 990
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
	movw ax, #LOWW(_g_Tick+0x0008C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@35_14
.BB@LABEL@35_13:	; if_then_bb41
	;***      991 : 				g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***      992 : 			g_callan_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 992
	clrb !LOWW(_g_callan_clear_flag@3)
	;***      993 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 993
	clr1 0xFFF05.5
	;***      994 : 			g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 994
	clrb !LOWW(_g_color)
	;***      995 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 995
	clrb a
	br $!_handSensorLED
.BB@LABEL@35_14:	; return
	;***      996 : 		}
	;***      997 : 	}
	;***      998 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 998
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***      999 : // Newest
	;***     1000 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1000
	subw sp, #0x0A
	;***     1001 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1001
	call $!_UpdateMachineStatus
	;***     1002 : 	InitialOperationModeStart(); //Worked!!;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1002
	call $!_InitialOperationModeStart
	;***     1003 : 
	;***     1004 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1004
	call $!_UpdateMachineStatus
.BB@LABEL@36_1:	; bb1
	;***     1005 : 	while (WaterSupplyOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1005
	call $!_WaterSupplyOperation_nostop
	cmp0 a
	bz $.BB@LABEL@36_3
.BB@LABEL@36_2:	; bb
	;***     1006 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1006
	call $!_RaspberryResponse_nostop
	br $.BB@LABEL@36_1
.BB@LABEL@36_3:	; bb5
	;***     1007 : 	}
	;***     1008 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1008
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
.BB@LABEL@36_4:	; bb5
	clrb a
.BB@LABEL@36_5:	; bb5
	cmp0 x
	oneb x
	sknz
.BB@LABEL@36_6:	; bb5
	clrb x
.BB@LABEL@36_7:	; bb5
	or x, a
	bnz $.BB@LABEL@36_9
.BB@LABEL@36_8:	; if_then_bb
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	;***     1009 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, g_io_status.refined.FlowValue);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1009
	movw ax, #0x4104
	call $!_sendToRasPi
.BB@LABEL@36_9:	; if_break_bb
	;***     1010 : 	}
	;***     1011 : 
	;***     1012 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1012
	call $!_UpdateMachineStatus
	;***     1013 : 	ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1013
	call $!_ElectrolyticOperation
	;***     1014 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1014
	addw sp, #0x0A
	br $!_UpdateMachineStatus
_userAuthHandler_nostop:
	.STACK _userAuthHandler_nostop = 6
	;***     1015 : 
	;***     1016 : }
	;***     1017 : 
	;***     1018 : void userAuthHandler_nostop(void){
	;***     1019 : 	if ((g_machine_state.user == 1) && (g_machine_state.mode != BUSY) && (g_machine_state.mode != ELECTROLYTIC_GENERATION)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1019
	cmp !LOWW(_g_machine_state+0x00006), #0x01
	bnz $.BB@LABEL@37_11
.BB@LABEL@37_1:	; bb
	mov a, #0xF9
	add a, !LOWW(_g_machine_state+0x00007)
	cmp a, #0x02
	bc $.BB@LABEL@37_11
.BB@LABEL@37_2:	; if_then_bb
	;***     1020 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1020
	mov a, !LOWW(_g_machine_mode)
	dec a
	bz $.BB@LABEL@37_8
.BB@LABEL@37_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@37_9
.BB@LABEL@37_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@37_10
.BB@LABEL@37_5:	; if_then_bb
	dec a
	sknz
.BB@LABEL@37_6:	; switch_clause_bb30
	;***     1021 : 		case HAND_WASHING:
	;***     1022 : 			HandWashingMode_nostop();
	;***     1023 : 			break;
	;***     1024 : 		case WATER_WASHING:
	;***     1025 : 			WaterWashingMode_nostop();
	;***     1026 : 			break;
	;***     1027 : 		case ACID_WASHING:
	;***     1028 : 			AcidWaterMode_nostop();
	;***     1029 : 			break;
	;***     1030 : 		case ALKALINE_WASHING:
	;***     1031 : 			AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1031
	call $!_AlkalineWaterMode_nostop
.BB@LABEL@37_7:	; if_else_bb46
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00028), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1046
	ret
.BB@LABEL@37_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1022
	call $!_HandWashingMode_nostop
	br $.BB@LABEL@37_7
.BB@LABEL@37_9:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1025
	call $!_WaterWashingMode_nostop
	br $.BB@LABEL@37_7
.BB@LABEL@37_10:	; switch_clause_bb29
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1028
	call $!_AcidWaterMode_nostop
	br $.BB@LABEL@37_7
.BB@LABEL@37_11:	; if_else_bb
	;***     1032 : 			break;
	;***     1033 : 		default:
	;***     1034 : 			break;
	;***     1035 : 		}
	;***     1036 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***     1037 : 	} else if (g_machine_state.mode == BUSY) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1037
	cmp !LOWW(_g_machine_state+0x00007), #0x07
	bnz $.BB@LABEL@37_7
.BB@LABEL@37_12:	; if_then_bb38
	;***     1038 : 		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1038
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
	sknz
.BB@LABEL@37_13:	; return
	;***     1039 : 				g_timerSetting.t55_waterDischargeDelay_s * 1000)) {
	;***     1040 : 			g_machine_state.mode = INDIE;
	;***     1041 : 			g_machine_state.user = 0;
	;***     1042 : 		}
	;***     1043 : 	} else {
	;***     1044 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***     1045 : 	}
	;***     1046 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1046
	ret
.BB@LABEL@37_14:	; if_then_bb45
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1040
	clrb !LOWW(_g_machine_state+0x00007)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1041
	clrb !LOWW(_g_machine_state+0x00006)
	ret
_ElectrolyzeWaterGeneration_nostop:
	.STACK _ElectrolyzeWaterGeneration_nostop = 4
	;***     1047 : void ElectrolyzeWaterGeneration_nostop(void) {
	;***     1048 : 	if(g_machine_state.mode != ELECTROLYTIC_GENERATION){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1048
	cmp !LOWW(_g_machine_state+0x00007), #0x08
	bnz $.BB@LABEL@38_2
.BB@LABEL@38_1:	; if_else_bb
	;***     1049 : 		if (isAcidEmpty() || isAlkalineEmpty()) {
	;***     1050 : 			// Start Electrolyte
	;***     1051 : 			g_machine_state.mode = ELECTROLYTIC_GENERATION;
	;***     1052 : 			g_Tick.tickHandWash = g_systemTime;
	;***     1053 : 			//Stop what ever operation is happening
	;***     1054 : 			g_machine_state.user = 0;
	;***     1055 : 			g_machine_state.handwash = g_machine_state.water = g_machine_state.acid = g_machine_state.akaline = 0;
	;***     1056 : 			O_PUMP_ACID_PIN = O_PUMP_ALK_PIN = OFF;
	;***     1057 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***     1058 : 		}
	;***     1059 : 	}else{
	;***     1060 : 		// Start Loop Electrolyte
	;***     1061 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1061
	call $!_UpdateMachineStatus
	;***     1062 : 		ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1062
	call $!_ElectrolyticOperation
	;***     1063 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1063
	call $!_UpdateMachineStatus
	movw hl, #0xFF07
	movw ax, hl
	movw de, ax
	;***     1064 : 		O_SPOUT_ACID_PIN_SV3 = O_SPOUT_ALK_PIN_SV4 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1064
	clr1 [hl].7
	mov a, [de]
	mov1 CY, a.7
	mov a, [de]
	mov1 a.6, CY
	mov [de], a
	ret
.BB@LABEL@38_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1049
	call $!_isAcidEmpty
	cmp0 a
	bnz $.BB@LABEL@38_5
.BB@LABEL@38_3:	; bb
	call $!_isAlkalineEmpty
	cmp0 a
	sknz
.BB@LABEL@38_4:	; return
	;***     1065 : 	}
	;***     1066 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1066
	ret
.BB@LABEL@38_5:	; if_then_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1051
	mov !LOWW(_g_machine_state+0x00007), #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1052
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1054
	clrb !LOWW(_g_machine_state+0x00006)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1055
	clrb !LOWW(_g_machine_state)
	clrb !LOWW(_g_machine_state+0x00001)
	clrb !LOWW(_g_machine_state+0x00002)
	clrb !LOWW(_g_machine_state+0x00003)
	movw hl, #0xFF06
	movw ax, hl
	movw de, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1056
	clr1 [hl].1
	mov a, [de]
	mov1 CY, a.1
	mov a, [de]
	mov1 a.2, CY
	mov [de], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1057
	clr1 0xFFF05.5
	ret
_errorCheck:
	.STACK _errorCheck = 4
	;***     1067 : void errorCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1067
	ret
_main_loop_20211111:
	.STACK _main_loop_20211111 = 4
	;***     1068 : 	
	;***     1069 : }
	;***     1070 : void main_loop_20211111(void) {
	;***     1071 : 	ElectrolyzeWaterGeneration_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1071
	call $!_ElectrolyzeWaterGeneration_nostop
	;***     1072 : 	userAuthHandler_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1072
	br $!_userAuthHandler_nostop
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***     1073 : 	
	;***     1074 : 
	;***     1075 : }
	;***     1076 : 
	;***     1077 : /**
	;***     1078 :  * 30/11/2021: Checked by An
	;***     1079 :  */
	;***     1080 : void electrolyticOperationON(void) {
	;***     1081 : 	//Electrolytic operation ON
	;***     1082 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1082
	set1 0xFFF01.7
	;***     1083 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1083
	set1 0xFFF0E.2
	;***     1084 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1084
	set1 0xFFF06.0
	;***     1085 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1085
	oneb !LOWW(_g_electrolytic_flag)
	;***     1086 : 	g_TickKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1086
	movw bc, !LOWW(_g_TickKeeper@1+0x00012)
	movw ax, !LOWW(_g_TickKeeper@1+0x00010)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@41_3
.BB@LABEL@41_1:	; entry
	bc $.BB@LABEL@41_3
.BB@LABEL@41_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@41_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TickKeeper@1+0x00010), ax
	movw ax, bc
	movw !LOWW(_g_TickKeeper@1+0x00012), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1089
	ret
_electrolyticOperationOFF_nostop:
	.STACK _electrolyticOperationOFF_nostop = 6
	;***     1087 : 			g_TickKeeper.neutralization == 0 ?
	;***     1088 : 					g_systemTime : g_TickKeeper.neutralization;
	;***     1089 : }
	;***     1090 : /**
	;***     1091 :  * 30/11/2021: Checked by An, missing Neutralization timer OFF
	;***     1092 :  */
	;***     1093 : uint8_t electrolyticOperationOFF_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1093
	clrw ax
	;***     1094 : 	g_TickKeeper.neutralization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1094
	movw !LOWW(_g_TickKeeper@1+0x00012), ax
	movw !LOWW(_g_TickKeeper@1+0x00010), ax
	;***     1095 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1095
	clr1 0xFFF0E.2
	;***     1096 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1096
	clr1 0xFFF06.0
	;***     1097 : 	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1097
	call $!_RaspberryResponse_nostop
	;***     1098 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1098
	call !!_R_WDT_Restart
	;***     1099 : 	//delay(5)
	;***     1100 : 	if (ns_delay_ms(&g_Tick.tickElectrolyticOff,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1100
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
	movw ax, #LOWW(_g_Tick+0x00040)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@42_2
.BB@LABEL@42_1:	; bb7
	;***     1101 : 			g_timerSetting.t5_electrolysisStopDelay_s * 1000)) {
	;***     1102 : 		O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***     1103 : 		g_electrolytic_flag = 0;
	;***     1104 : 		return 0;
	;***     1105 : 	}
	;***     1106 : 	return 1;
	;***     1107 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1107
	oneb a
	ret
.BB@LABEL@42_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1102
	clr1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1103
	clrb !LOWW(_g_electrolytic_flag)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1104
	clrb a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***     1108 : 
	;***     1109 : float measureFlowSensor(uint32_t *t) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1109
	push ax
	subw sp, #0x0C
	;***     1110 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1110
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
.BB@LABEL@43_1:	; bb27
	movw ax, [sp+0x0C]
	movw de, ax
	;***     1111 : 	float flow_pluse = 0.0;
	;***     1112 : 	uint8_t flow_pulse_state = I_OFF;
	;***     1113 : 	while (!ns_delay_ms(&stamp_flow_sensor, (*t) * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1113
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
	bnz $.BB@LABEL@43_7
.BB@LABEL@43_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***     1114 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1114
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@43_6
.BB@LABEL@43_3:	; if_then_bb
	;***     1115 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1115
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@43_5
.BB@LABEL@43_4:	; if_then_bb20
	movw ax, #0x3F80
	;***     1116 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1116
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
.BB@LABEL@43_5:	; if_break_bb
	;***     1117 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1117
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@43_6:	; if_break_bb26
	;***     1118 : 		}
	;***     1119 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1119
	call !!_R_WDT_Restart
	br $.BB@LABEL@43_1
.BB@LABEL@43_7:	; bb40
	movw ax, #0x3F33
	;***     1120 : 	}
	;***     1121 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*t); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1121
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
	;***     1122 : 	return g_io_status.refined.FlowValue;
	;***     1123 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1123
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***     1124 : 
	;***     1125 : uint8_t _pre_flow_state = I_OFF;
	;***     1126 : float _flow_pulse;
	;***     1127 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1127
	subw sp, #0x04
	;***     1128 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***     1129 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***     1130 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1130
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@44_4
.BB@LABEL@44_1:	; entry
	dec a
	bz $.BB@LABEL@44_5
.BB@LABEL@44_2:	; entry
	dec a
	bz $.BB@LABEL@44_12
.BB@LABEL@44_3:	; switch_clause_bb61
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@44_11
.BB@LABEL@44_4:	; switch_clause_bb
	;***     1131 : 	case 0:
	;***     1132 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1132
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@44_9
.BB@LABEL@44_5:	; switch_clause_bb14
	;***     1133 : 			(*state)++;
	;***     1134 : 		}
	;***     1135 : 		break;
	;***     1136 : 	case 1:
	;***     1137 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1137
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@44_8
.BB@LABEL@44_6:	; if_then_bb24
	;***     1138 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1138
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***     1139 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1139
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@44_8
.BB@LABEL@44_7:	; if_then_bb35
	movw ax, #0x3F80
	;***     1140 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1140
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
.BB@LABEL@44_8:	; if_break_bb39
	;***     1141 : 			}
	;***     1142 : 		}
	;***     1143 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1143
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0000A)
.BB@LABEL@44_9:	; if_break_bb39
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
.BB@LABEL@44_10:	; if_then_bb47
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@44_11:	; switch_break_bb
	;***     1144 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***     1145 : 			(*state)++;
	;***     1146 : 		}
	;***     1147 : 		break;
	;***     1148 : 	case 2:
	;***     1149 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***     1150 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***     1151 : 		_flow_pulse = 0;
	;***     1152 : 		(*state) = 0;
	;***     1153 : 		break;
	;***     1154 : 	default:
	;***     1155 : 		(*state) = 0;
	;***     1156 : 		break;
	;***     1157 : 	}
	;***     1158 : 	return g_io_status.refined.FlowValue;
	;***     1159 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1159
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@44_12:	; switch_clause_bb52
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1149
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1151
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@44_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***     1160 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1160
	push hl
	;***     1161 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	;***     1162 : 		pre_machine_mode = g_machine_state.mode;
	;***     1163 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1163
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@45_2
.BB@LABEL@45_1:	; bb11
	clrb x
.BB@LABEL@45_2:	; bb12
	;***     1164 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1164
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@45_4
.BB@LABEL@45_3:	; bb28
	clrb c
.BB@LABEL@45_4:	; bb30
	;***     1165 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1165
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@45_6
.BB@LABEL@45_5:	; bb46
	clrb b
.BB@LABEL@45_6:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***     1166 : 
	;***     1167 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1167
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@45_8
.BB@LABEL@45_7:	; bb64
	clrb x
.BB@LABEL@45_8:	; bb66
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***     1168 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1168
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@45_10
.BB@LABEL@45_9:	; bb82
	clrb b
.BB@LABEL@45_10:	; bb84
	mov a, c
	or a, x
	mov c, a
	;***     1169 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1169
	mov a, 0xFFF07
	mov x, #0x04
	bf a.0, $.BB@LABEL@45_12
.BB@LABEL@45_11:	; bb100
	clrb x
.BB@LABEL@45_12:	; bb102
	mov a, c
	or a, b
	mov c, a
	;***     1170 : 
	;***     1171 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1171
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@45_14
.BB@LABEL@45_13:	; bb118
	clrb b
.BB@LABEL@45_14:	; bb120
	mov a, c
	or a, x
	mov c, a
	;***     1172 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1172
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@45_16
.BB@LABEL@45_15:	; bb136
	clrb x
.BB@LABEL@45_16:	; bb138
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***     1173 : 
	;***     1174 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1174
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***     1175 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1175
	mov x, 0xFFF05
	;***     1176 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1176
	mov c, 0xFFF07
	;***     1177 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1177
	mov a, 0xFFF07
	mov h, a
	;***     1178 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1178
	mov a, [de]
	mov l, a
	;***     1179 : 	O_DRAIN_ACID_PIN_SV7;
	;***     1180 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1180
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1174
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1175
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1176
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1177
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1178
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***     1181 : 	O_DRAIN_ALK_PIN_SV6;
	;***     1182 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1182
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1178
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1182
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1180
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1182
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***     1183 : 
	;***     1184 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1184
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***     1185 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1185
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***     1186 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1186
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***     1187 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TickKeeper@1:
	.DS (20)
_g_callan_clear_flag@3:
	.DS (1)
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
	.DS (8)
	.ALIGN 2
_g_io_status:
	.DS (18)
	.ALIGN 2
_g_pre_io_status:
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
	.DS (144)
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
