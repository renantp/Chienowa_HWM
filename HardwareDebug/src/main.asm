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
#@  compiled at Mon Dec 27 18:08:29 2021

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
	.PUBLIC _ElectrolyzeWaterGeneration
	.PUBLIC _WaterWashingMode_nostop
	.PUBLIC _HandWashingMode_nostop
	.PUBLIC _AcidWaterMode_nostop
	.PUBLIC _AlkalineWaterMode_nostop
	.PUBLIC _CallanCleaningMode_nostop
	.PUBLIC _main_init_20211111
	.PUBLIC _main_loop_20211111
	.PUBLIC _electrolyticOperationON
	.PUBLIC _electrolyticOperationOFF
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
	movw !LOWW(_g_Tick+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00044), ax
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
	movw ax, #LOWW(_g_Tick+0x00044)
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
	movw !LOWW(_g_Tick+0x0004A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00048), ax
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
	movw ax, #LOWW(_g_Tick+0x00048)
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
	;***      162 : 	if (g_io_status.refined.AcidEmptyLevel
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].3
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].3
	bc $.BB@LABEL@5_3
.BB@LABEL@5_1:	; if_else_bb
	;***      163 : 			!= g_pre_io_status.refined.AcidEmptyLevel) {
	;***      164 : 		if (I_ACID_L_PIN == I_ON) {
	;***      165 : 			if (ns_delay_ms(&g_Tick.tickAcidLevel[2],
	;***      166 : 					g_timerSetting.t26_onDelayEmptyLevel_s * 1000)) {
	;***      167 : 				return 1;
	;***      168 : 			}
	;***      169 : 			return 0;
	;***      170 : 		}
	;***      171 : 	} else {
	;***      172 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0004C), ax
.BB@LABEL@5_2:	; bb31
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	ret
.BB@LABEL@5_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 164
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@5_2
.BB@LABEL@5_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 165
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
	movw ax, #LOWW(_g_Tick+0x0004C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	oneb a
	sknz
.BB@LABEL@5_5:	; if_then_bb18
	clrb a
.BB@LABEL@5_6:	; if_then_bb18
	ret
_isAlkalineHigh:
	.STACK _isAlkalineHigh = 6
	;***      173 : 	}
	;***      174 : 	return 0;
	;***      175 : }
	;***      176 : 
	;***      177 : uint8_t isAlkalineHigh(void) {
	;***      178 : 	if (g_io_status.refined.AlkalineHighLevel
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 178
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].2
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].2
	bc $.BB@LABEL@6_3
.BB@LABEL@6_1:	; if_else_bb
	;***      179 : 			!= g_pre_io_status.refined.AlkalineHighLevel) {
	;***      180 : 		if (I_ALKALI_H_PIN == I_ON) {
	;***      181 : 			if (ns_delay_ms(&g_Tick.tickAlkalineLevel[0],
	;***      182 : 					g_timerSetting.t28_onDelayHighLevel_s * 1000)) {
	;***      183 : 				g_pre_io_status.refined.AlkalineHighLevel =
	;***      184 : 						g_io_status.refined.AlkalineHighLevel;
	;***      185 : 				return 1;
	;***      186 : 			}
	;***      187 : 			return 0;
	;***      188 : 		}
	;***      189 : 	} else {
	;***      190 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 190
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00050), ax
.BB@LABEL@6_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 193
	ret
.BB@LABEL@6_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@6_2
.BB@LABEL@6_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
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
	bz $.BB@LABEL@6_2
.BB@LABEL@6_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 183
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 183
	mov1 CY, [hl].2
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].2, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	ret
_isAlkalineLow:
	.STACK _isAlkalineLow = 6
	;***      191 : 	}
	;***      192 : 	return 0;
	;***      193 : }
	;***      194 : uint8_t isAlkalineLow(void) {
	;***      195 : 	if (g_io_status.refined.AlkalineLowLevel
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].1
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].1
	bc $.BB@LABEL@7_3
.BB@LABEL@7_1:	; if_else_bb
	;***      196 : 			!= g_pre_io_status.refined.AlkalineLowLevel) {
	;***      197 : 		if (I_ALKALI_M_PIN == I_ON) {
	;***      198 : 			if (ns_delay_ms(&g_Tick.tickAlkalineLevel[1],
	;***      199 : 					g_timerSetting.t27_onDelayLowLevel_s * 1000)) {
	;***      200 : 				g_pre_io_status.refined.AlkalineLowLevel =
	;***      201 : 						g_io_status.refined.AlkalineLowLevel;
	;***      202 : 				return 1;
	;***      203 : 			}
	;***      204 : 			return 0;
	;***      205 : 		}
	;***      206 : 	} else {
	;***      207 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 207
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00054), ax
.BB@LABEL@7_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	ret
.BB@LABEL@7_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@7_2
.BB@LABEL@7_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
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
	bz $.BB@LABEL@7_2
.BB@LABEL@7_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	mov1 CY, [hl].1
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].1, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	ret
_isAlkalineEmpty:
	.STACK _isAlkalineEmpty = 6
	;***      208 : 	}
	;***      209 : 	return 0;
	;***      210 : }
	;***      211 : uint8_t isAlkalineEmpty(void) {
	;***      212 : 	if (g_io_status.refined.AlkalineEmptyLevel
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].0
	bc $.BB@LABEL@8_3
.BB@LABEL@8_1:	; if_else_bb
	;***      213 : 			!= g_pre_io_status.refined.AlkalineEmptyLevel) {
	;***      214 : 		if (I_ALKALI_L_PIN == I_ON) {
	;***      215 : 			if (ns_delay_ms(&g_Tick.tickAlkalineLevel[2],
	;***      216 : 					g_timerSetting.t26_onDelayEmptyLevel_s * 1000)) {
	;***      217 : 				return 1;
	;***      218 : 			}
	;***      219 : 			return 0;
	;***      220 : 		}
	;***      221 : 	} else {
	;***      222 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00058), ax
.BB@LABEL@8_2:	; bb31
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	ret
.BB@LABEL@8_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@8_2
.BB@LABEL@8_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
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
.BB@LABEL@8_5:	; if_then_bb18
	clrb a
.BB@LABEL@8_6:	; if_then_bb18
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 6
	;***      223 : 	}
	;***      224 : 	return 0;
	;***      225 : }
	;***      226 : 
	;***      227 : //----------------------Begin code 11112021--------------------------------------
	;***      228 : void sendToRasPi(enum UART_header_e head, enum Control_status type, float value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	push hl
	;***      229 : 	uint8_t state = g_uart2_sendend;
	;***      230 : 	g_control_buffer.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	mov !LOWW(_g_control_buffer), a
	mov a, x
	;***      231 : 	g_control_buffer.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	mov !LOWW(_g_control_buffer+0x00001), a
	movw ax, bc
	;***      232 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 232
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, de
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      233 : 	R_UART2_Send((uint8_t*) &g_control_buffer, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 233
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@9_1:	; bb9
	mov a, [sp+0x00]
	;***      234 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 234
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@9_1
.BB@LABEL@9_2:	; return
	;***      235 : 		;
	;***      236 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
	pop hl
	ret
_sendRS485:
	.STACK _sendRS485 = 6
	;***      237 : struct UART3_Buffer_s {
	;***      238 : 	uint8_t busy;
	;***      239 : 	uint8_t head; // 1 byte
	;***      240 : 	uint8_t set_number; // 1 byte
	;***      241 : 	uint8_t set_value[4]; // 4 byte
	;***      242 : } water_solfner_buf;
	;***      243 : void sendRS485(uint8_t busy, uint8_t head, uint8_t type, uint32_t value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 243
	push hl
	;***      244 : 	uint8_t state = g_uart3_sendend;
	;***      245 : 	btod.raw = value;
	;***      246 : 	water_solfner_buf.busy = busy;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	mov !LOWW(_water_solfner_buf), a
	mov a, x
	;***      247 : 	water_solfner_buf.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	mov !LOWW(_water_solfner_buf+0x00001), a
	mov a, c
	;***      248 : 	water_solfner_buf.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 248
	mov !LOWW(_water_solfner_buf+0x00002), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	movw ax, [sp+0x08]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 245
	movw !LOWW(_btod+0x00002), ax
	movw ax, [sp+0x06]
	movw !LOWW(_btod), ax
	clrb a
.BB@LABEL@10_1:	; bb
	mov b, a
	;***      249 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      250 : 		water_solfner_buf.set_value[i] = btod.refined.data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	mov a, LOWW(_btod)[b]
	mov LOWW(_water_solfner_buf+0x00003)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@10_1
.BB@LABEL@10_2:	; bb25
	;***      251 : 	}
	;***      252 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 252
	set1 0xFFF00.0
	;***      253 : 	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	movw bc, #0x0007
	movw ax, #LOWW(_water_solfner_buf)
	call !!_R_UART3_Send
.BB@LABEL@10_3:	; bb28
	mov a, [sp+0x00]
	;***      254 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@10_3
.BB@LABEL@10_4:	; return
	;***      255 : 		;
	;***      256 : 
	;***      257 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
	pop hl
	ret
_sendR485_7byte:
	.STACK _sendR485_7byte = 16
	;***      258 : void sendR485_7byte(uint8_t addr, uint8_t head, uint8_t *val5) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	subw sp, #0x0A
	mov h, a
	push bc
	pop de
	;***      259 : 	uint8_t buf[7] = { addr, head };
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
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
	;***      260 : 	uint8_t state = g_uart3_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 260
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x07], a
.BB@LABEL@11_1:	; bb
	movw ax, sp
	movw [sp+0x08], ax
	mov a, b
	add a, #0x02
	mov c, a
	;***      261 : 	for (uint8_t i = 2; i < 7; i++) {
	;***      262 : 		buf[i] = val5[i-2];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	shrw ax, 8+0x00000
	addw ax, de
	decw ax
	decw ax
	movw hl, ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 261
	inc b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	mov a, [hl]
	mov h, a
	movw ax, [sp+0x08]
	xchw ax, hl
	mov [hl+c], a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 261
	cmp a, #0x05
	bnz $.BB@LABEL@11_1
.BB@LABEL@11_2:	; bb31
	;***      263 : 	}
	;***      264 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	set1 0xFFF00.0
	;***      265 : 	R_UART3_Send(buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	movw bc, #0x0007
	movw ax, sp
	call !!_R_UART3_Send
.BB@LABEL@11_3:	; bb35
	mov a, [sp+0x07]
	;***      266 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@11_3
.BB@LABEL@11_4:	; return
	;***      267 : 		;
	;***      268 : 
	;***      269 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 269
	addw sp, #0x0A
	ret
_isThisCommand:
	.STACK _isThisCommand = 6
	;***      270 : uint8_t isThisCommand(uint8_t *input_buf, enum UART_header_e header,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
	push hl
	movw hl, ax
	mov a, b
	mov [sp+0x00], a
	clrb a
	mov b, a
.BB@LABEL@12_1:	; bb
	;***      271 : 		enum Control_status control, uint32_t data) {
	;***      272 : 	for (uint8_t i = 0; i < 4; i++) {
	;***      273 : 		btod.refined.data[i] = input_buf[2 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	shrw ax, 8+0x00000
	addw ax, hl
	incw ax
	incw ax
	movw de, ax
	mov a, [de]
	mov LOWW(_btod)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 272
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_2:	; bb23
	mov a, c
	;***      274 : 	}
	;***      275 : 
	;***      276 : 	if ((input_buf[0] == header) && (input_buf[1] == control)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
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
	;***      277 : 			&& (btod.raw == data))
	;***      278 : 		return 2;
	;***      279 : 	else if ((input_buf[0] == header) && (input_buf[1] == control))
	;***      280 : 		return 1;
	;***      281 : 	else
	;***      282 : 		return 0;
	;***      283 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	mov a, #0x02
	bz $.BB@LABEL@12_9
.BB@LABEL@12_7:	; bb70
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 279
	cmp a, [hl+0x01]
	oneb a
	skz
.BB@LABEL@12_8:	; bb70
	clrb a
.BB@LABEL@12_9:	; bb70
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	ret
.BB@LABEL@12_10:	; if_else_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	clrb a
	br $.BB@LABEL@12_9
_RaspberryResponse_nostop:
	.STACK _RaspberryResponse_nostop = 10
	;***      284 : /**
	;***      285 :  * Handle all response to Raspberry command.
	;***      286 :  */
	;***      287 : uint8_t *const time_setting_p = (uint8_t*) &_settingTime;
	;***      288 : uint8_t *const number_setting_p = (uint8_t*) &_settingNumber;
	;***      289 : struct UART_Buffer_s test_control_buf = { H_READ, READ_TIME, 0x000000ff };
	;***      290 : void RaspberryResponse_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	push hl
	;***      291 : 	if (commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	cmp0 !LOWW(_commnunication_flag)
	bz $.BB@LABEL@13_5
.BB@LABEL@13_1:	; if_then_bb
	;***      292 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      293 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@13_2:	; bb16
	mov a, [sp+0x00]
	;***      294 : //		if (isThisCommand(g_rx_data, H_SET, WASHING_MODE, 0xff) != 0) {
	;***      295 : //			g_machine_mode = g_rx_data[5];
	;***      296 : //		} else if (isThisCommand(g_rx_data, H_SET, OK_USER, 0xff) != 0) {
	;***      297 : //			g_machine_state.user = 1;
	;***      298 : //		}
	;***      299 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@13_4
.BB@LABEL@13_3:	; bb
	;***      300 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 300
	call !!_R_WDT_Restart
	br $.BB@LABEL@13_2
.BB@LABEL@13_4:	; bb24
	;***      301 : 		}
	;***      302 : 		commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
	clrb !LOWW(_commnunication_flag)
.BB@LABEL@13_5:	; if_break_bb
	;***      303 : 	}
	;***      304 : 	if (commnunication_flag.send_response_mode_flag == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	cmp !LOWW(_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@13_7
.BB@LABEL@13_6:	; if_then_bb30
	;***      305 : 		sendToRasPi(H_READ, WASHING_MODE, (uint32_t) g_machine_mode << (8 * 3));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
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
	;***      306 : //		sendToRasPi(H_READ, WASHING_MODE, (uint32_t) g_machine_mode);
	;***      307 : 		commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	clrb !LOWW(_commnunication_flag+0x00006)
.BB@LABEL@13_7:	; if_break_bb35
	;***      308 : 	}
	;***      309 : 	if (commnunication_flag.send_respone_status_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	cmp0 !LOWW(_commnunication_flag+0x00005)
	bz $.BB@LABEL@13_12
.BB@LABEL@13_8:	; if_then_bb41
	;***      310 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 310
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      311 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
	movw bc, #0x0005
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@13_9:	; bb47
	mov a, [sp+0x00]
	;***      312 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 312
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@13_11
.BB@LABEL@13_10:	; bb46
	;***      313 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	call !!_R_WDT_Restart
	br $.BB@LABEL@13_9
.BB@LABEL@13_11:	; bb55
	;***      314 : 		}
	;***      315 : 		commnunication_flag.send_respone_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	clrb !LOWW(_commnunication_flag+0x00005)
.BB@LABEL@13_12:	; if_break_bb56
	;***      316 : 	}
	;***      317 : 	if (commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 317
	cmp0 !LOWW(_commnunication_flag+0x00001)
	bz $.BB@LABEL@13_17
.BB@LABEL@13_13:	; if_then_bb62
	;***      318 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 318
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      319 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 319
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x0008C), a
	;***      320 : 				timeSettingSize - 1);
	;***      321 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 321
	movw bc, #0x008D
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@13_14:	; bb73
	mov a, [sp+0x00]
	;***      322 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 322
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@13_16
.BB@LABEL@13_15:	; bb72
	;***      323 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 323
	call !!_R_WDT_Restart
	br $.BB@LABEL@13_14
.BB@LABEL@13_16:	; bb81
	;***      324 : 		}
	;***      325 : 		commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	clrb !LOWW(_commnunication_flag+0x00001)
.BB@LABEL@13_17:	; if_break_bb82
	;***      326 : 	}
	;***      327 : 	if (commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 327
	cmp0 !LOWW(_commnunication_flag+0x00002)
	bz $.BB@LABEL@13_22
.BB@LABEL@13_18:	; if_then_bb88
	;***      328 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 328
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      329 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 329
	mov c, #0x20
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00024), a
	;***      330 : 				numberSettingSize - 1);
	;***      331 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 331
	movw bc, #0x0021
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@13_19:	; bb99
	mov a, [sp+0x00]
	;***      332 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 332
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@13_21
.BB@LABEL@13_20:	; bb98
	;***      333 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 333
	call !!_R_WDT_Restart
	br $.BB@LABEL@13_19
.BB@LABEL@13_21:	; bb107
	;***      334 : 		}
	;***      335 : 		commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 335
	clrb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@13_22:	; if_break_bb108
	;***      336 : 	}
	;***      337 : 	if (commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 337
	cmp !LOWW(_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@13_38
.BB@LABEL@13_23:	; if_break_bb108.bb165_crit_edge
	clrb a
	mov b, a
.BB@LABEL@13_24:	; bb165
	;***      338 : //		//Do not Edit this, must keep!!!!
	;***      339 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 339
	cmp a, #0x8C
	bnc $.BB@LABEL@13_34
.BB@LABEL@13_25:	; bb115
	;***      340 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 340
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
	;***      341 : //			case 3:
	;***      342 : //				pointer0[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
	;***      343 : //				break;
	;***      344 : //			case 2:
	;***      345 : //				pointer0[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
	;***      346 : //				break;
	;***      347 : //			case 1:
	;***      348 : //				pointer0[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
	;***      349 : //				break;
	;***      350 : //			case 0:
	;***      351 : //				pointer0[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
	;***      352 : //				break;
	;***      353 : //			default:
	;***      354 : //				break;
	;***      355 : 			case 3:
	;***      356 : 				time_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 356
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFD)
.BB@LABEL@13_29:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@13_33
.BB@LABEL@13_30:	; switch_clause_bb129
	;***      357 : 				break;
	;***      358 : 			case 2:
	;***      359 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 359
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@13_29
.BB@LABEL@13_31:	; switch_clause_bb140
	;***      360 : 				break;
	;***      361 : 			case 1:
	;***      362 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 362
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@13_33
.BB@LABEL@13_32:	; switch_clause_bb151
	;***      363 : 				break;
	;***      364 : 			case 0:
	;***      365 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 365
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@13_33:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@13_24
.BB@LABEL@13_34:	; bb174
	;***      366 : 				break;
	;***      367 : 			default:
	;***      368 : 				break;
	;***      369 : 			}
	;***      370 : 		}
	;***      371 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 371
	mov a, !LOWW(_g_rx_data+0x0008C)
	mov [sp+0x00], a
	mov !LOWW(__settingTime+0x0008C), a
	;***      372 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 372
	mov c, #0x8C
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp x, a
	bnz $.BB@LABEL@13_36
.BB@LABEL@13_35:	; if_then_bb197
	;***      373 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
	;***      374 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 374
	movw de, #0x008E
	movw bc, #LOWW(__settingTime)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	clrw ax
	;***      375 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 375
	push ax
	mov x, #0x8D
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      376 : 					timeSettingSize);
	;***      377 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 377
	clrb x
	br $.BB@LABEL@13_37
.BB@LABEL@13_36:	; if_else_bb
	;***      378 : 		} else {
	;***      379 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 379
	mov x, #0x16
.BB@LABEL@13_37:	; if_else_bb
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi
	;***      380 : 		}
	;***      381 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      382 : 		commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 382
	clrb !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@13_38:	; if_break_bb201
	;***      383 : 	}
	;***      384 : 
	;***      385 : 	if (commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 385
	cmp !LOWW(_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@13_54
.BB@LABEL@13_39:	; if_break_bb201.bb260_crit_edge
	clrb a
	mov b, a
.BB@LABEL@13_40:	; bb260
	;***      386 : //		//Do not Edit this, must keep!!!!
	;***      387 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 387
	cmp a, #0x20
	bnc $.BB@LABEL@13_50
.BB@LABEL@13_41:	; bb208
	;***      388 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 388
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
	;***      389 : 			case 3:
	;***      390 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 390
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@13_45:	; switch_clause_bb212
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@13_49
.BB@LABEL@13_46:	; switch_clause_bb223
	;***      391 : 				break;
	;***      392 : 			case 2:
	;***      393 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 393
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@13_45
.BB@LABEL@13_47:	; switch_clause_bb234
	;***      394 : 				break;
	;***      395 : 			case 1:
	;***      396 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 396
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@13_49
.BB@LABEL@13_48:	; switch_clause_bb245
	;***      397 : 				break;
	;***      398 : 			case 0:
	;***      399 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 399
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@13_49:	; switch_break_bb257
	inc b
	mov a, b
	br $.BB@LABEL@13_40
.BB@LABEL@13_50:	; bb269
	;***      400 : 				break;
	;***      401 : 			default:
	;***      402 : 				break;
	;***      403 : 			}
	;***      404 : 		}
	;***      405 : 		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 405
	mov c, #0x20
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov !LOWW(__settingNumber+0x00024), a
	;***      406 : 				numberSettingSize - 1);
	;***      407 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 407
	mov a, !LOWW(_g_rx_data+0x00020)
	mov [sp+0x00], a
	mov c, #0x20
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp a, x
	bnz $.BB@LABEL@13_52
.BB@LABEL@13_51:	; if_then_bb291
	;***      408 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      409 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 409
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call $!_sendToRasPi
	;***      410 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 410
	movw de, #0x0026
	movw bc, #LOWW(__settingNumber)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	clrw ax
	;***      411 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 411
	push ax
	mov x, #0x21
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      412 : 					numberSettingSize);
	;***      413 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 413
	clrb x
	br $.BB@LABEL@13_53
.BB@LABEL@13_52:	; if_else_bb294
	;***      414 : 		} else {
	;***      415 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 415
	mov x, #0x16
.BB@LABEL@13_53:	; if_else_bb294
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi
	;***      416 : 		}
	;***      417 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      418 : 		commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 418
	clrb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@13_54:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 420
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 14
	;***      419 : 	}
	;***      420 : }
	;***      421 : /**
	;***      422 :  * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
	;***      423 :  * 13/12/2021: Checked!
	;***      424 :  */
	;***      425 : void InitialOperationModeStart(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 425
	subw sp, #0x08
	;***      426 : 	uint32_t _tick[2];
	;***      427 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 427
	call $!_UpdateMachineStatus
.BB@LABEL@14_1:	; bb103
	;***      428 : 	while (1) {
	;***      429 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 429
	call $!_RaspberryResponse_nostop
	;***      430 : 		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7; // Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 430
	mov a, 0xFFF07
	mov1 CY, a.1
	mov a, #0x80
	sknc
.BB@LABEL@14_2:	; bb8
	and a, 0xFFF06
.BB@LABEL@14_3:	; bb12
	mov x, a
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      431 : 		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6; // Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 431
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
	;***      432 : 		if (I_ACID_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 432
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@14_7
.BB@LABEL@14_6:	; if_else_bb
	;***      433 : 			if (ns_delay_ms(&_tick[0],
	;***      434 : 					g_timerSetting.t26_onDelayEmptyLevel_s * 1000)) {
	;***      435 : 				O_DRAIN_ACID_PIN_SV7 = OFF;
	;***      436 : 			}
	;***      437 : 		} else
	;***      438 : 			_tick[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 438
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x02], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x00], ax
	br $.BB@LABEL@14_9
.BB@LABEL@14_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 433
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
	movw ax, sp
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@14_8:	; if_then_bb57
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 435
	clr1 0xFFF06.7
.BB@LABEL@14_9:	; if_break_bb61
	;***      439 : 		if (I_ALKALI_L_PIN == I_OFF) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 439
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@14_11
.BB@LABEL@14_10:	; if_else_bb80
	;***      440 : 			if (ns_delay_ms(&_tick[1],
	;***      441 : 					g_timerSetting.t26_onDelayEmptyLevel_s * 1000)) {
	;***      442 : 				O_DRAIN_ALK_PIN_SV6 = OFF;
	;***      443 : 			}
	;***      444 : 		} else
	;***      445 : 			_tick[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 445
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x04], ax
	br $.BB@LABEL@14_13
.BB@LABEL@14_11:	; if_then_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 440
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
	movw ax, sp
	addw ax, #0x0004
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@14_12:	; if_then_bb78
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 442
	clr1 0xFFF06.6
.BB@LABEL@14_13:	; if_break_bb84
	mov a, #0x80
	;***      446 : 		if ((O_DRAIN_ACID_PIN_SV7 == OFF) & (O_DRAIN_ALK_PIN_SV6 == OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 446
	and a, 0xFFF06
	mov x, a
	mov a, 0xFFF06
	bt a.6, $.BB@LABEL@14_15
.BB@LABEL@14_14:	; if_break_bb84
	cmp0 x
	bz $.BB@LABEL@14_16
.BB@LABEL@14_15:	; if_break_bb102
	;***      447 : 			break;
	;***      448 : 		}
	;***      449 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 449
	call $!_UpdateMachineStatus
	;***      450 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 450
	call !!_R_WDT_Restart
	br $!.BB@LABEL@14_1
.BB@LABEL@14_16:	; return
	;***      451 : 	}
	;***      452 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 452
	addw sp, #0x08
	ret
_WaterSupplyOperation_nostop:
	.STACK _WaterSupplyOperation_nostop = 14
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
	;***      476 : 	case 0:
	;***      477 : 		*tick = g_systemTime;
	;***      478 : 		(*state)++;
	;***      479 : 		break;
	;***      480 : 	case 1:
	;***      481 : 		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
	;***      482 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 30000)) {
	;***      483 : 			(*state)++;
	;***      484 : 		}
	;***      485 : 		break;
	;***      486 : 	case 2:
	;***      487 : 		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      488 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 500)) {
	;***      489 : 			(*state)++;
	;***      490 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      491 : 		}
	;***      492 : 		break;
	;***      493 : 	case 3:
	;***      494 : 		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      495 : //			nostop_measureFlowSensor();
	;***      496 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 15000)) {
	;***      497 : 			(*state)++;
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
	;***      509 : 			sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR,
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
	br $.BB@LABEL@15_15
.BB@LABEL@15_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 477
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 478
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@15_15
.BB@LABEL@15_9:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 481
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 482
	clrw ax
	movw de, ax
	movw bc, #0x7530
	br $!.BB@LABEL@15_24
.BB@LABEL@15_10:	; switch_clause_bb17
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
	bz $.BB@LABEL@15_15
.BB@LABEL@15_11:	; if_then_bb22
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 489
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 490
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00024), ax
	br $.BB@LABEL@15_15
.BB@LABEL@15_12:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 494
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 496
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@15_13:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 497
	inc !LOWW(_g_machine_state+0x00004)
.BB@LABEL@15_14:	; if_break_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 499
	call $!_measureFlowSensor_nostop
.BB@LABEL@15_15:	; if_break_bb38
	br $.BB@LABEL@15_22
.BB@LABEL@15_16:	; switch_clause_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 502
	movw ax, #LOWW(_g_timerSetting+0x00008)
	call $!_measureFlowSensor
	br $.BB@LABEL@15_25
.BB@LABEL@15_17:	; switch_clause_bb45
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 512
	inc a
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@15_21
.BB@LABEL@15_20:	; if_then_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 508
	mov !LOWW(_g_machine_state+0x00004), #0x03
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	movw ax, #0x4104
	call $!_sendToRasPi
.BB@LABEL@15_21:	; if_break_bb67
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 513
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00020), ax
.BB@LABEL@15_22:	; if_break_bb67
	br $.BB@LABEL@15_26
.BB@LABEL@15_23:	; switch_clause_bb69
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
.BB@LABEL@15_24:	; switch_clause_bb69
	movw ax, #LOWW(_g_Tick+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@15_25:	; if_then_bb76
	inc !LOWW(_g_machine_state+0x00004)
.BB@LABEL@15_26:	; switch_break_bb
	;***      523 : 		break;
	;***      524 : 	}
	;***      525 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 525
	call !!_R_WDT_Restart
	;***      526 : 	return *state == 6 + 1 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
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
	;***      527 : }
	;***      528 : void stop_waitAlarmConfirm(enum Control_status alarm, uint8_t timeout_s) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 528
	subw sp, #0x04
	push ax
	;***      529 : 	uint32_t _tick = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 529
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
.BB@LABEL@16_1:	; bb23
	mov a, [sp+0x01]
	;***      530 : 	while (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 530
	cmp a, !LOWW(_commnunication_flag+0x00007)
	bz $.BB@LABEL@16_5
.BB@LABEL@16_2:	; bb
	;***      531 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 531
	call $!_RaspberryResponse_nostop
	mov a, [sp+0x00]
	;***      532 : 		if((ns_delay_ms(&_tick, timeout_s*1000))&&(timeout_s != 0)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 532
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
	;***      533 : 			break;
	;***      534 : 		}
	;***      535 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 535
	call !!_R_WDT_Restart
	br $.BB@LABEL@16_1
.BB@LABEL@16_5:	; bb32
	;***      536 : 	}
	;***      537 : 	commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 537
	clrb !LOWW(_commnunication_flag+0x00007)
	addw sp, #0x06
	ret
_nostop_waitAlarmConfirm:
	.STACK _nostop_waitAlarmConfirm = 4
	;***      538 : }
	;***      539 : uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 539
	cmp a, !LOWW(_commnunication_flag+0x00007)
	;***      540 : 	if (commnunication_flag.alarm_clear_flag != alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 540
	bnz $.BB@LABEL@17_2
.BB@LABEL@17_1:	; if_break_bb
	;***      541 : 		return 1;
	;***      542 : 	}
	;***      543 : 	commnunication_flag.alarm_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 543
	clrb !LOWW(_commnunication_flag+0x00007)
	;***      544 : 	return 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	clrb a
	ret
.BB@LABEL@17_2:	; bb9
	;***      545 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 545
	oneb a
	ret
_resetAlarm:
	.STACK _resetAlarm = 4
	;***      546 : void resetAlarm(void) {
	;***      547 : 	commnunication_flag.alarm_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 547
	oneb !LOWW(_commnunication_flag+0x00007)
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      548 : }
	;***      549 : 
	;***      550 : /**
	;***      551 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      552 :  * 30/11/2021: Checked by An
	;***      553 :  * @return 0 - OK; 1 - Error
	;***      554 :  */
	;***      555 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 555
	subw sp, #0x0A
	;***      556 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 556
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
	;***      557 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 557
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 573
	ret
.BB@LABEL@19_8:	; if_then_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 547
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      558 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      559 : 			resetAlarm();
	;***      560 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 560
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      561 : 					g_io_status.refined.CVCCVoltage);
	;***      562 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 562
	set1 !LOWW(_g_alarm).0
	;***      563 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 563
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@19_9:	; bb17
	;***      564 : 			while (electrolyticOperationOFF())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 564
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@19_9
.BB@LABEL@19_10:	; bb23
	;***      565 : 				;
	;***      566 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 566
	movw ax, #0x0500
	call $!_stop_waitAlarmConfirm
	;***      567 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 567
	clr1 !LOWW(_g_alarm).0
	;***      568 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 568
	oneb a
	br $.BB@LABEL@19_7
.BB@LABEL@19_11:	; if_else_bb
	;***      569 : 		}
	;***      570 : 	} else
	;***      571 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 571
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	br $.BB@LABEL@19_6
_Voltage2Check_nostop:
	.STACK _Voltage2Check_nostop = 18
	;***      572 : 	return 0;
	;***      573 : }
	;***      574 : /**
	;***      575 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      576 :  * 16/12/2021: Checked by An
	;***      577 :  * @return 0 - OK
	;***      578 :  */
	;***      579 : void Voltage2Check_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 579
	subw sp, #0x0A
	;***      580 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 580
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
	;***      581 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 581
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
	;***      582 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      583 : 			if(!(g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 583
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 547
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      584 : 				resetAlarm();
	;***      585 : 				g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 585
	set1 !LOWW(_g_alarm).1
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	;***      586 : 				sendToRasPi(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 586
	movw ax, #0x4106
	addw sp, #0x0A
	br $!_sendToRasPi
.BB@LABEL@20_8:	; if_else_bb
	;***      587 : 						g_io_status.refined.CVCCVoltage);
	;***      588 : 			}
	;***      589 : 		}
	;***      590 : 	} else {
	;***      591 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 591
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      592 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 592
	clr1 !LOWW(_g_alarm).1
.BB@LABEL@20_9:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 594
	ret
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      593 : 	}
	;***      594 : }
	;***      595 : /**
	;***      596 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      597 :  * 16/12/2021: Checked by An
	;***      598 :  * @return 0 - OK; 1 - Error
	;***      599 :  */
	;***      600 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 600
	subw sp, #0x0A
	;***      601 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 601
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
	;***      602 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 602
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
	;***      603 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      604 : 			if (!(g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 604
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 547
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      605 : 				resetAlarm();
	;***      606 : 				g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 606
	set1 !LOWW(_g_alarm).2
	;***      607 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 607
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@21_8:	; bb27
	;***      608 : 				while (electrolyticOperationOFF())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 608
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@21_8
.BB@LABEL@21_9:	; bb33
	;***      609 : 					;
	;***      610 : 				sendToRasPi(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 610
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      611 : 						g_io_status.refined.CVCCVoltage);
	;***      612 : 				stop_waitAlarmConfirm(OVER_VOLTAGE_3, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 612
	movw ax, #0x0700
	call $!_stop_waitAlarmConfirm
	;***      613 : 				g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 613
	clr1 !LOWW(_g_alarm).2
	;***      614 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 614
	oneb a
	br $.BB@LABEL@21_12
.BB@LABEL@21_10:	; if_else_bb
	;***      615 : 			}
	;***      616 : 		}
	;***      617 : 	} else {
	;***      618 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 618
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
.BB@LABEL@21_11:	; bb43
	clrb a
.BB@LABEL@21_12:	; bb43
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 621
	ret
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      619 : 	}
	;***      620 : 	return 0;
	;***      621 : }
	;***      622 : /**
	;***      623 :  * Checked 16/12/2021
	;***      624 :  * @return
	;***      625 :  */
	;***      626 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 626
	subw sp, #0x0A
	;***      627 : 	if ((g_systemTime - g_TickKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 627
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
	;***      628 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      629 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 629
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
	;***      630 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 630
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 648
	ret
.BB@LABEL@22_13:	; if_then_bb20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 547
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      631 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      632 : 				resetAlarm();
	;***      633 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 633
	set1 !LOWW(_g_alarm).5
	;***      634 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 634
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@22_14:	; bb25
	;***      635 : 				while (electrolyticOperationOFF())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 635
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@22_14
.BB@LABEL@22_15:	; bb31
	;***      636 : 					;
	;***      637 : 				sendToRasPi(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 637
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4108
	call $!_sendToRasPi
	;***      638 : 						(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      639 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE, 0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 639
	movw ax, #0x0800
	call $!_stop_waitAlarmConfirm
	;***      640 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 640
	clr1 !LOWW(_g_alarm).5
	;***      641 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 641
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
	;***      642 : 			}
	;***      643 : 		} else
	;***      644 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      645 : 	} else
	;***      646 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      647 : 	return 0;
	;***      648 : }
	;***      649 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 649
	subw sp, #0x0E
	;***      650 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 650
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      651 : 	const uint16_t _max_time = 10000;
	;***      652 : 	if (g_systemTime - g_TickKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 652
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
	;***      653 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 653
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
	;***      654 : 				|| (g_io_status.refined.CVCCCurrent
	;***      655 : 						>= g_numberSetting.upperCurrent)) {
	;***      656 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 656
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
	;***      657 : 					&& (g_alarm.refined.overCurrent == 0) && (g_io_status.refined.CVCCCurrent
	;***      658 : 							<= g_numberSetting.lowerCurrent)) {
	;***      659 : 				sendToRasPi(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 659
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4109
	call $!_sendToRasPi
	;***      660 : 						(uint32_t) (g_io_status.refined.CVCCCurrent));
	;***      661 : 				g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 661
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
	;***      662 : 						g_io_status.refined.CVCCCurrent
	;***      663 : 								<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      664 : 			}
	;***      665 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 665
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
	;***      666 : 					>= g_numberSetting.upperCurrent) {
	;***      667 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 667
	clrw ax
	movw de, ax
	movw bc, #0x2710
	movw ax, #LOWW(_g_Tick+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@23_30
.BB@LABEL@23_26:	; if_then_bb90
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 547
	oneb !LOWW(_commnunication_flag+0x00007)
	;***      668 : 					resetAlarm();
	;***      669 : 					g_alarm.refined.overCurrent = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 669
	set1 !LOWW(_g_alarm).3
	;***      670 : 					g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 670
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@23_27:	; bb96
	;***      671 : 					while (electrolyticOperationOFF())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 671
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@23_27
.BB@LABEL@23_28:	; bb102
	;***      672 : 						;
	;***      673 : 					sendToRasPi(H_ALARM, OVER_CURRENT,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 673
	movw bc, !LOWW(_g_io_status+0x0000E)
	movw de, !LOWW(_g_io_status+0x00010)
	movw ax, #0x410A
	call $!_sendToRasPi
	;***      674 : 							g_io_status.refined.CVCCCurrent);
	;***      675 : 					stop_waitAlarmConfirm(OVER_CURRENT, 10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 675
	movw ax, #0x0A0A
	call $!_stop_waitAlarmConfirm
	;***      676 : 					g_alarm.refined.overCurrent = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 676
	clr1 !LOWW(_g_alarm).3
	;***      677 : 					return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 677
	oneb a
	br $.BB@LABEL@23_31
.BB@LABEL@23_29:	; if_else_bb
	;***      678 : 				}
	;***      679 : 			} else{
	;***      680 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 680
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@23_30:	; bb114
	clrb a
.BB@LABEL@23_31:	; bb114
	addw sp, #0x0E
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 685
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@24_1:	; WAIT_RESET
	;***      681 : 			}
	;***      682 : 		}
	;***      683 : 	}
	;***      684 : 	return 0;
	;***      685 : }
	;***      686 : void ElectrolyticOperation(void) {
	;***      687 : 	WAIT_RESET:
	;***      688 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 688
	call $!_electrolyticOperationON
	;***      689 : 	g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 689
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0002C), ax
	;***      690 : 	g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 690
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00030), ax
	;***      691 : 	g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 691
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00034), ax
	;***      692 : 	g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 692
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0003C), ax
.BB@LABEL@24_2:	; bb
	;***      693 : 	do {
	;***      694 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 694
	call $!_RaspberryResponse_nostop
	;***      695 : 		if (Voltage1Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 695
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@24_1
.BB@LABEL@24_3:	; if_break_bb
	;***      696 : 			goto WAIT_RESET;
	;***      697 : 		Voltage2Check_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 697
	call $!_Voltage2Check_nostop
	;***      698 : 		if (Voltage3Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 698
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@24_1
.BB@LABEL@24_4:	; if_break_bb16
	;***      699 : 			goto WAIT_RESET;
	;***      700 : 		if (LowVoltageCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 700
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@24_1
.BB@LABEL@24_5:	; if_break_bb24
	;***      701 : 			goto WAIT_RESET;
	;***      702 : 		if (OverCurrentCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 702
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@24_1
.BB@LABEL@24_6:	; if_break_bb32
	;***      703 : 			goto WAIT_RESET;
	;***      704 : 		//----------CVCC Alarm Input-----------------
	;***      705 : 		if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 705
	mov a, 0xFFF00
	bf a.4, $.BB@LABEL@24_12
.BB@LABEL@24_7:	; if_break_bb57
	;***      706 : 			g_alarm.refined.cvcc = 1;
	;***      707 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	;***      708 : 			while (electrolyticOperationOFF())
	;***      709 : 				;
	;***      710 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	;***      711 : 			stop_waitAlarmConfirm(CVCC_ALARM, 0);
	;***      712 : 			g_alarm.refined.cvcc = 0;
	;***      713 : 			goto WAIT_RESET;
	;***      714 : 		}
	;***      715 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 715
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 693
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@24_2
.BB@LABEL@24_8:	; bb64
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@24_2
.BB@LABEL@24_9:	; bb78
	;***      716 : 	} while ((I_ACID_H_PIN == I_OFF) || (I_ALKALI_H_PIN == I_OFF));
	;***      717 : 	g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 717
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@24_10:	; bb81
	;***      718 : 	while (electrolyticOperationOFF())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 718
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@24_10
.BB@LABEL@24_11:	; return
	;***      719 : 		;
	;***      720 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 720
	ret
.BB@LABEL@24_12:	; if_then_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 706
	set1 !LOWW(_g_alarm).7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 707
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@24_13:	; bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 708
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@24_13
.BB@LABEL@24_14:	; bb52
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 710
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 711
	movw ax, #0x1200
	call $!_stop_waitAlarmConfirm
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 712
	clr1 !LOWW(_g_alarm).7
	br $!.BB@LABEL@24_1
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      721 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 721
	subw sp, #0x04
	;***      722 : 	uint32_t _time_count = 0;
	;***      723 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 723
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
	;***      724 : 			& (_time_count
	;***      725 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      726 : 		_time_count++;
	;***      727 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 727
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@25_5:	; if_break_bb
	;***      728 : 	}
	;***      729 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 729
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
	;***      730 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 730
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi
.BB@LABEL@25_9:	; return
	;***      731 : 	}
	;***      732 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 732
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      733 : void saltWaterTankFullCheck(void) {
	;***      734 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 734
	mov a, 0xFFF05
	bf a.3, $.BB@LABEL@26_3
.BB@LABEL@26_1:	; if_then_bb
	;***      735 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 735
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi
	;***      736 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 736
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@26_2:	; bb7
	;***      737 : 		while (electrolyticOperationOFF())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 737
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@26_2
.BB@LABEL@26_3:	; return
	;***      738 : 			;
	;***      739 : 		//TODO: Fault in the flowchart
	;***      740 : 	}
	;***      741 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 741
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      742 : void saltWaterTankEmptyCheck(void) {
	;***      743 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 743
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@27_2
.BB@LABEL@27_1:	; if_then_bb
	;***      744 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 744
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi
.BB@LABEL@27_2:	; return
	;***      745 : 		//TODO: Control OFF
	;***      746 : 	}
	;***      747 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 747
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      748 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 748
	movw de, #0xFF07
	;***      749 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 749
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
	;***      750 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      751 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      752 : 		//TODO: Control OFF
	;***      753 : 	}
	;***      754 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 754
	ret
.BB@LABEL@28_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 751
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      755 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 755
	push hl
	;***      756 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 756
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
	;***      757 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      758 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      759 : 		//TODO: Control OFF
	;***      760 : 	}
	;***      761 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 761
	ret
.BB@LABEL@29_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 758
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      762 : 
	;***      763 : uint8_t FilterReplacementCheck(void) {
	;***      764 : 
	;***      765 : 	return 0;
	;***      766 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 766
	clrb a
	ret
_ElectrolyzeWaterGeneration:
	.STACK _ElectrolyzeWaterGeneration = 4
	;***      767 : void ElectrolyzeWaterGeneration(void) {
	;***      768 : 	if ((I_ACID_L_PIN == I_OFF) | (I_ALKALI_L_PIN = I_OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 768
	mov a, 0xFFF07
	set1 0xFFF00.5
	shr a, 0x01
	mov x, a
	mov a, 0xFFF00
	shr a, 0x05
	or a, x
	bt a.0, $.BB@LABEL@31_5
.BB@LABEL@31_1:	; if_else_bb
	movw hl, #0xFF07
	;***      769 : 		g_machine_state.mode = ELECTROLYTIC_GENERATION;
	;***      770 : 		electrolyticOperationON();
	;***      771 : 	} else if ((I_ACID_H_PIN = I_ON) & (I_ALKALI_H_PIN = I_ON)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 771
	clr1 [hl].3
	mov a, [hl]
	clr1 [hl].0
	shr a, 0x03
	and a, [hl]
	bf a.0, $.BB@LABEL@31_4
.BB@LABEL@31_2:	; if_then_bb26
	;***      772 : 		g_machine_state.mode = pre_machine_mode;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 772
	mov a, !LOWW(_pre_machine_mode@2)
	mov !LOWW(_g_machine_state+0x00007), a
	;***      773 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 773
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00040), ax
.BB@LABEL@31_3:	; bb29
	;***      774 : 		while (electrolyticOperationOFF())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 774
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@31_3
.BB@LABEL@31_4:	; return
	;***      775 : 			;
	;***      776 : 	}
	;***      777 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 777
	ret
.BB@LABEL@31_5:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 769
	mov !LOWW(_g_machine_state+0x00007), #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 770
	br $!_electrolyticOperationON
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      778 : /**
	;***      779 :  * Tested: 10/12/2021 by Mr.An
	;***      780 :  */
	;***      781 : void WaterWashingMode_nostop(void) {
	;***      782 : 	uint8_t *state = &g_machine_state.water;
	;***      783 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      784 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 784
	mov a, !LOWW(_g_machine_state+0x00002)
	cmp0 a
	bz $.BB@LABEL@32_3
.BB@LABEL@32_1:	; entry
	dec a
	bz $.BB@LABEL@32_4
.BB@LABEL@32_2:	; switch_clause_bb20
	;***      785 : 	case 0:
	;***      786 : 		g_machine_state.mode = WATER_WASHING;
	;***      787 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      788 : 		g_color = WHITE;
	;***      789 : 		*tick = g_systemTime;
	;***      790 : 		(*state)++;
	;***      791 : 		handSensorLED(g_color);
	;***      792 : 		break;
	;***      793 : 	case 1:
	;***      794 : 		if (DETECT_U == I_ON) {
	;***      795 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      796 : 			g_color = BLACK;
	;***      797 : 			(*state) = 0;
	;***      798 : 			g_machine_state.mode = BUSY;
	;***      799 : 			handSensorLED(g_color);
	;***      800 : 		}
	;***      801 : 		break;
	;***      802 : 	default:
	;***      803 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 803
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@32_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 786
	mov !LOWW(_g_machine_state+0x00007), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 787
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 788
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 789
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 790
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 791
	mov a, #0x02
	br $.BB@LABEL@32_6
.BB@LABEL@32_4:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 794
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@32_7
.BB@LABEL@32_5:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 795
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 796
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 797
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 798
	mov !LOWW(_g_machine_state+0x00007), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 799
	clrb a
.BB@LABEL@32_6:	; if_then_bb
	br $!_handSensorLED
.BB@LABEL@32_7:	; return
	;***      804 : 		break;
	;***      805 : 	}
	;***      806 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 806
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 10
	;***      807 : 
	;***      808 : /**
	;***      809 :  * Tested: 24/12/2021 by Mr.An
	;***      810 :  */
	;***      811 : void HandWashingMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 811
	subw sp, #0x04
	;***      812 : 	uint8_t *state = &g_machine_state.handwash;
	;***      813 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      814 : 	const uint32_t delayPump_ms = 50;
	;***      815 : 	g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 815
	movw ax, !LOWW(_g_timerSetting+0x00076)
	movw [sp+0x00], ax
	clrw bc
	cmpw ax, bc
	movw ax, !LOWW(_g_timerSetting+0x00074)
	movw [sp+0x02], ax
	sknz
.BB@LABEL@33_1:	; entry
	cmpw ax, #0x0032
.BB@LABEL@33_2:	; entry
	bnc $.BB@LABEL@33_4
.BB@LABEL@33_3:	; entry.bb16_crit_edge
	clrw ax
	movw [sp+0x00], ax
	mov x, #0x32
	br $.BB@LABEL@33_8
.BB@LABEL@33_4:	; bb10
	movw ax, [sp+0x00]
	;***      816 : 			g_timerSetting.t54_overLapTime_ms < delayPump_ms ?
	;***      817 : 					delayPump_ms : g_timerSetting.t54_overLapTime_ms;
	;***      818 : 	g_timerSetting.t54_overLapTime_ms =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 818
	cmpw ax, bc
	movw ax, [sp+0x02]
	sknz
.BB@LABEL@33_5:	; bb10
	cmpw ax, #0x03E9
.BB@LABEL@33_6:	; bb10
	bc $.BB@LABEL@33_9
.BB@LABEL@33_7:	; bb10.bb19_crit_edge
	clrw ax
	movw [sp+0x00], ax
	movw ax, #0x03E8
.BB@LABEL@33_8:	; bb10.bb19_crit_edge
	movw [sp+0x02], ax
.BB@LABEL@33_9:	; bb19
	movw !LOWW(_g_timerSetting+0x00074), ax
	movw ax, [sp+0x00]
	movw !LOWW(_g_timerSetting+0x00076), ax
	;***      819 : 			g_timerSetting.t54_overLapTime_ms > 1000 ?
	;***      820 : 					1000 : g_timerSetting.t54_overLapTime_ms;
	;***      821 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 821
	mov a, !LOWW(_g_machine_state+0x00003)
	cmp0 a
	.bz $!.BB@LABEL@33_45
.BB@LABEL@33_10:	; bb19
	dec a
	bz $.BB@LABEL@33_18
.BB@LABEL@33_11:	; bb19
	dec a
	bz $.BB@LABEL@33_21
.BB@LABEL@33_12:	; bb19
	dec a
	.bz $!.BB@LABEL@33_25
.BB@LABEL@33_13:	; bb19
	dec a
	.bz $!.BB@LABEL@33_29
.BB@LABEL@33_14:	; bb19
	dec a
	.bz $!.BB@LABEL@33_35
.BB@LABEL@33_15:	; bb19
	dec a
	.bz $!.BB@LABEL@33_40
.BB@LABEL@33_16:	; bb19
	dec a
	.bz $!.BB@LABEL@33_43
.BB@LABEL@33_17:	; switch_clause_bb117
	;***      822 : 	case 0:
	;***      823 : 		*state = 1;
	;***      824 : 		*tick = g_systemTime;
	;***      825 : 		break;
	;***      826 : 	case 1:
	;***      827 : 		g_machine_state.mode = HAND_WASHING;
	;***      828 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      829 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      830 : 			O_PUMP_ALK_PIN = ON;
	;***      831 : 			handSensorLED(BLUE);
	;***      832 : 			(*state)++;
	;***      833 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      834 : 		}
	;***      835 : 		break;
	;***      836 : 	case 2:
	;***      837 : 		if (ns_delay_ms(tick,
	;***      838 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      839 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      840 : 			O_PUMP_ALK_PIN = OFF;
	;***      841 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      842 : 			(*state)++;
	;***      843 : 		}
	;***      844 : 		break;
	;***      845 : 	case 3:
	;***      846 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      847 : 			O_PUMP_ACID_PIN = ON;
	;***      848 : 			handSensorLED(RED);
	;***      849 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      850 : 			(*state)++;
	;***      851 : 		}
	;***      852 : 		break;
	;***      853 : 	case 4:
	;***      854 : 		if (ns_delay_ms(tick,
	;***      855 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      856 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      857 : 			(*state)++;
	;***      858 : 		}
	;***      859 : 		break;
	;***      860 : 	case 5:
	;***      861 : 		if (ns_delay_ms(tick,
	;***      862 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      863 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      864 : 			O_PUMP_ACID_PIN = OFF;
	;***      865 : 			handSensorLED(WHITE);
	;***      866 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      867 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      868 : 			(*state)++;
	;***      869 : 		}
	;***      870 : 		break;
	;***      871 : 	case 6:
	;***      872 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      873 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      874 : 			(*state)++;
	;***      875 : 		}
	;***      876 : 		break;
	;***      877 : 	case 7:
	;***      878 : 		if (ns_delay_ms(tick,
	;***      879 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      880 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      881 : 			handSensorLED(BLACK);
	;***      882 : 			(*state) = 0;
	;***      883 : 			g_machine_state.mode = BUSY;
	;***      884 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      885 : 		}
	;***      886 : 		break;
	;***      887 : 	default:
	;***      888 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 888
	clrb !LOWW(_g_machine_state+0x00003)
	br $!.BB@LABEL@33_46
.BB@LABEL@33_18:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 827
	oneb !LOWW(_g_machine_state+0x00007)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 828
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 829
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_26
.BB@LABEL@33_19:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 830
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 831
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 832
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@33_20:	; if_then_bb
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	addw sp, #0x04
	br $!_sendToRasPi
.BB@LABEL@33_21:	; switch_clause_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 837
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
.BB@LABEL@33_22:	; switch_clause_bb38
	decw ax
.BB@LABEL@33_23:	; switch_clause_bb38
	subw ax, de
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_34
.BB@LABEL@33_24:	; if_then_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 840
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 841
	set1 0xFFF07.6
	br $.BB@LABEL@33_33
.BB@LABEL@33_25:	; switch_clause_bb53
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 846
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@33_26:	; switch_clause_bb53
	bz $.BB@LABEL@33_38
.BB@LABEL@33_27:	; if_then_bb60
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 847
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 848
	oneb a
	call $!_handSensorLED
.BB@LABEL@33_28:	; if_then_bb60
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	br $.BB@LABEL@33_33
.BB@LABEL@33_29:	; switch_clause_bb65
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 854
	addw ax, #0xFFCE
	movw bc, ax
	pop de
	push de
	skc
.BB@LABEL@33_30:	; switch_clause_bb65
	decw de
.BB@LABEL@33_31:	; switch_clause_bb65
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_41
.BB@LABEL@33_32:	; if_then_bb74
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 856
	clr1 0xFFF07.7
.BB@LABEL@33_33:	; if_then_bb74
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@33_34:	; if_then_bb74
	br $!.BB@LABEL@33_46
.BB@LABEL@33_35:	; switch_clause_bb79
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 861
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
.BB@LABEL@33_36:	; switch_clause_bb79
	decw ax
.BB@LABEL@33_37:	; switch_clause_bb79
	subw ax, de
	movw de, ax
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@33_38:	; switch_clause_bb79
	bz $.BB@LABEL@33_46
.BB@LABEL@33_39:	; if_then_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 864
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 865
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 866
	set1 0xFFF05.5
	br $.BB@LABEL@33_28
.BB@LABEL@33_40:	; switch_clause_bb94
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 872
	movw ax, #LOWW(_g_Tick+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@33_41:	; switch_clause_bb94
	bz $.BB@LABEL@33_46
.BB@LABEL@33_42:	; if_then_bb101
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 873
	clr1 0xFFF07.6
	br $.BB@LABEL@33_33
.BB@LABEL@33_43:	; switch_clause_bb106
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 878
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
	bz $.BB@LABEL@33_46
.BB@LABEL@33_44:	; if_then_bb114
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 880
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 881
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 882
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 883
	mov !LOWW(_g_machine_state+0x00007), #0x07
	br $!.BB@LABEL@33_20
.BB@LABEL@33_45:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 823
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 824
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x0001C), ax
.BB@LABEL@33_46:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 892
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      889 : 		break;
	;***      890 : 	}
	;***      891 : 
	;***      892 : }
	;***      893 : /**
	;***      894 :  * Tested: 24/12/2021 by Mr.An
	;***      895 :  */
	;***      896 : void AcidWaterMode_nostop(void) {
	;***      897 : 	uint8_t *state = &g_machine_state.acid;
	;***      898 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      899 : 	const uint32_t delayPump_ms = 50;
	;***      900 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 900
	mov a, !LOWW(_g_machine_state+0x00001)
	cmp0 a
	bz $.BB@LABEL@34_5
.BB@LABEL@34_1:	; entry
	dec a
	bz $.BB@LABEL@34_6
.BB@LABEL@34_2:	; entry
	dec a
	bz $.BB@LABEL@34_9
.BB@LABEL@34_3:	; entry
	movw de, #0x0000
	dec a
	bz $.BB@LABEL@34_12
.BB@LABEL@34_4:	; switch_clause_bb57
	;***      901 : 	case 0:
	;***      902 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      903 : 		g_machine_state.mode = ACID_WASHING;
	;***      904 : 		*state = 1;
	;***      905 : 		*tick = g_systemTime;
	;***      906 : 		break;
	;***      907 : 	case 1:
	;***      908 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      909 : 		g_color = RED;
	;***      910 : 		handSensorLED(g_color);
	;***      911 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      912 : 			O_PUMP_ACID_PIN = ON;
	;***      913 : 			(*state)++;
	;***      914 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      915 : 		}
	;***      916 : 		break;
	;***      917 : 	case 2:
	;***      918 : 		//TODO: Change turn OFF signal here
	;***      919 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      920 : 				|| (DETECT_U == I_ON)) {
	;***      921 : 			O_PUMP_ACID_PIN = OFF;
	;***      922 : 			(*state)++;
	;***      923 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      924 : 		}
	;***      925 : 		break;
	;***      926 : 	case 3:
	;***      927 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      928 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      929 : 			g_color = BLACK;
	;***      930 : 			handSensorLED(g_color);
	;***      931 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      932 : 			(*state)++;
	;***      933 : 		}
	;***      934 : 		break;
	;***      935 : 	default:
	;***      936 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 936
	mov !LOWW(_g_machine_state+0x00007), #0x07
	;***      937 : 		sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 937
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	;***      938 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 938
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@34_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 903
	mov !LOWW(_g_machine_state+0x00007), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 904
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 905
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00014), ax
	ret
.BB@LABEL@34_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 908
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 909
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 910
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 911
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@34_14
.BB@LABEL@34_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 912
	set1 0xFFF06.2
.BB@LABEL@34_8:	; if_then_bb
	inc !LOWW(_g_machine_state+0x00001)
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi
.BB@LABEL@34_9:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 919
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
	bnz $.BB@LABEL@34_11
.BB@LABEL@34_10:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@34_14
.BB@LABEL@34_11:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 921
	clr1 0xFFF06.2
	br $.BB@LABEL@34_8
.BB@LABEL@34_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 927
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@34_14
.BB@LABEL@34_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 928
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 929
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 930
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 931
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 932
	inc !LOWW(_g_machine_state+0x00001)
.BB@LABEL@34_14:	; return
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 941
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      939 : 		break;
	;***      940 : 	}
	;***      941 : }
	;***      942 : /**
	;***      943 :  * Tested: 24/12/2021 by Mr.An
	;***      944 :  */
	;***      945 : void AlkalineWaterMode_nostop(void) {
	;***      946 : 	uint8_t *state = &g_machine_state.akaline;
	;***      947 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      948 : 	const uint32_t delayPump_ms = 50;
	;***      949 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 949
	mov a, !LOWW(_g_machine_state)
	cmp0 a
	bz $.BB@LABEL@35_5
.BB@LABEL@35_1:	; entry
	dec a
	bz $.BB@LABEL@35_6
.BB@LABEL@35_2:	; entry
	dec a
	bz $.BB@LABEL@35_8
.BB@LABEL@35_3:	; entry
	movw de, #0x0000
	dec a
	bz $.BB@LABEL@35_12
.BB@LABEL@35_4:	; switch_clause_bb57
	;***      950 : 	case 0:
	;***      951 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      952 : 		g_machine_state.mode = ALKALINE_WASHING;
	;***      953 : 		*state = 1;
	;***      954 : 		*tick = g_systemTime;
	;***      955 : 		break;
	;***      956 : 	case 1:
	;***      957 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      958 : 		g_color = BLUE;
	;***      959 : 		handSensorLED(g_color);
	;***      960 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      961 : 			O_PUMP_ALK_PIN = ON;
	;***      962 : 			(*state)++;
	;***      963 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      964 : 		}
	;***      965 : 		break;
	;***      966 : 	case 2:
	;***      967 : 		//TODO: Change turn OFF signal here
	;***      968 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***      969 : 				|| (DETECT_U == I_ON)) {
	;***      970 : 			O_PUMP_ALK_PIN = OFF;
	;***      971 : 			(*state)++;
	;***      972 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      973 : 		}
	;***      974 : 		break;
	;***      975 : 	case 3:
	;***      976 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      977 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      978 : 			g_color = BLACK;
	;***      979 : 			handSensorLED(g_color);
	;***      980 : 			(*state)++;
	;***      981 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      982 : 		}
	;***      983 : 		break;
	;***      984 : 	default:
	;***      985 : 		g_machine_state.mode = BUSY;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 985
	mov !LOWW(_g_machine_state+0x00007), #0x07
	;***      986 : 		sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 986
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	;***      987 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 987
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@35_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 952
	mov !LOWW(_g_machine_state+0x00007), #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 953
	oneb !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 954
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00010), ax
	ret
.BB@LABEL@35_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 957
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 958
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 959
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 960
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@35_14
.BB@LABEL@35_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 961
	set1 0xFFF06.1
	br $.BB@LABEL@35_11
.BB@LABEL@35_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 968
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
	bnz $.BB@LABEL@35_10
.BB@LABEL@35_9:	; bb
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@35_14
.BB@LABEL@35_10:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 970
	clr1 0xFFF06.1
.BB@LABEL@35_11:	; if_then_bb39
	inc !LOWW(_g_machine_state)
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi
.BB@LABEL@35_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 976
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@35_14
.BB@LABEL@35_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 977
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 978
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 979
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@35_11
.BB@LABEL@35_14:	; return
	;***      988 : 		break;
	;***      989 : 	}
	;***      990 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 990
	ret
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***      991 : 
	;***      992 : void CallanCleaningMode_nostop(void) {
	;***      993 : 	if ((g_TickKeeper.SV1_OFF_minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 993
	movw de, !LOWW(_g_timerSetting+0x00086)
	movw bc, !LOWW(_g_timerSetting+0x00084)
	movw ax, !LOWW(_g_TickKeeper@1+0x0000E)
	cmpw ax, de
	movw ax, !LOWW(_g_TickKeeper@1+0x0000C)
	sknz
.BB@LABEL@36_1:	; entry
	cmpw ax, bc
.BB@LABEL@36_2:	; entry
	movw hl, !LOWW(_g_TickKeeper@1+0x00004)
	movw ax, !LOWW(_g_TickKeeper@1+0x00006)
	bc $.BB@LABEL@36_7
.BB@LABEL@36_3:	; entry
	cmpw ax, de
	movw ax, hl
	sknz
.BB@LABEL@36_4:	; entry
	cmpw ax, bc
.BB@LABEL@36_5:	; entry
	bc $.BB@LABEL@36_7
.BB@LABEL@36_6:	; if_then_bb
	;***      994 : 			>= g_timerSetting.t61_curranCleaningIntervalTime_h)
	;***      995 : 			& (g_TickKeeper.SV2_OFF_minutes
	;***      996 : 					>= g_timerSetting.t61_curranCleaningIntervalTime_h)) {
	;***      997 : 		g_callan_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 997
	oneb !LOWW(_g_callan_clear_flag@3)
	;***      998 : 		g_Tick.tickCustom[6] = g_Tick.tickCustom[7] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 998
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x00082), ax
	movw !LOWW(_g_Tick+0x0007E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00080), ax
	movw !LOWW(_g_Tick+0x0007C), ax
	;***      999 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 999
	set1 0xFFF05.5
.BB@LABEL@36_7:	; if_break_bb
	;***     1000 : 	}
	;***     1001 : 	if (g_callan_clear_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1001
	cmp0 !LOWW(_g_callan_clear_flag@3)
	bz $.BB@LABEL@36_14
.BB@LABEL@36_8:	; if_then_bb18
	;***     1002 : 		if (ns_delay_ms(&g_Tick.tickCustom[6], 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1002
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick+0x0007C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_12
.BB@LABEL@36_9:	; if_then_bb23
	;***     1003 : 			g_color = g_color == WHITE ? BLACK : WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1003
	cmp !LOWW(_g_color), #0x02
	clrb a
	skz
.BB@LABEL@36_10:	; bb28
	mov a, #0x02
.BB@LABEL@36_11:	; bb29
	mov !LOWW(_g_color), a
	;***     1004 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1004
	call $!_handSensorLED
.BB@LABEL@36_12:	; if_break_bb34
	;***     1005 : 		}
	;***     1006 : 		if (ns_delay_ms(&g_Tick.tickCustom[7],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1006
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
	movw ax, #LOWW(_g_Tick+0x00080)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@36_14
.BB@LABEL@36_13:	; if_then_bb41
	;***     1007 : 				g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***     1008 : 			g_callan_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1008
	clrb !LOWW(_g_callan_clear_flag@3)
	;***     1009 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1009
	clr1 0xFFF05.5
	;***     1010 : 			g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1010
	clrb !LOWW(_g_color)
	;***     1011 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1011
	clrb a
	br $!_handSensorLED
.BB@LABEL@36_14:	; return
	;***     1012 : 		}
	;***     1013 : 	}
	;***     1014 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1014
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 4
	;***     1015 : // Newest
	;***     1016 : void main_init_20211111(void) {
	;***     1017 : 	//TODO: Testing here
	;***     1018 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1018
	call $!_UpdateMachineStatus
	;***     1019 : 	InitialOperationModeStart(); //Worked!!;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1019
	call $!_InitialOperationModeStart
	;***     1020 : 
	;***     1021 : //	UpdateMachineStatus();
	;***     1022 : //	while (WaterSupplyOperation_nostop()) {
	;***     1023 : //		RaspberryResponse_nostop();
	;***     1024 : //	}
	;***     1025 : //	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	;***     1026 : //		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, g_io_status.refined.FlowValue);
	;***     1027 : //	}
	;***     1028 : 
	;***     1029 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1029
	call $!_UpdateMachineStatus
	;***     1030 : 	ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1030
	call $!_ElectrolyticOperation
	;***     1031 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1031
	br $!_UpdateMachineStatus
_main_loop_20211111:
	.STACK _main_loop_20211111 = 6
	;***     1032 : //	rx_count++;
	;***     1033 : }
	;***     1034 : void main_loop_20211111(void) {
	;***     1035 : //	ElectrolyzeWaterGeneration();
	;***     1036 : 
	;***     1037 : 	if ((g_machine_state.user == 1) && (g_machine_state.mode != BUSY)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1037
	cmp !LOWW(_g_machine_state+0x00006), #0x01
	bnz $.BB@LABEL@38_11
.BB@LABEL@38_1:	; bb
	cmp !LOWW(_g_machine_state+0x00007), #0x07
	bz $.BB@LABEL@38_11
.BB@LABEL@38_2:	; if_then_bb
	;***     1038 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1038
	mov a, !LOWW(_g_machine_mode)
	dec a
	bz $.BB@LABEL@38_8
.BB@LABEL@38_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@38_9
.BB@LABEL@38_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@38_10
.BB@LABEL@38_5:	; if_then_bb
	dec a
	sknz
.BB@LABEL@38_6:	; switch_clause_bb18
	;***     1039 : 		case HAND_WASHING:
	;***     1040 : 			HandWashingMode_nostop();
	;***     1041 : 			break;
	;***     1042 : 		case WATER_WASHING:
	;***     1043 : 			WaterWashingMode_nostop();
	;***     1044 : 			break;
	;***     1045 : 		case ACID_WASHING:
	;***     1046 : 			AcidWaterMode_nostop();
	;***     1047 : 			break;
	;***     1048 : 		case ALKALINE_WASHING:
	;***     1049 : 			AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1049
	call $!_AlkalineWaterMode_nostop
.BB@LABEL@38_7:	; if_else_bb34
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick+0x00028), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1064
	ret
.BB@LABEL@38_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1040
	call $!_HandWashingMode_nostop
	br $.BB@LABEL@38_7
.BB@LABEL@38_9:	; switch_clause_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1043
	call $!_WaterWashingMode_nostop
	br $.BB@LABEL@38_7
.BB@LABEL@38_10:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1046
	call $!_AcidWaterMode_nostop
	br $.BB@LABEL@38_7
.BB@LABEL@38_11:	; if_else_bb
	;***     1050 : 			break;
	;***     1051 : 		default:
	;***     1052 : 			break;
	;***     1053 : 		}
	;***     1054 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***     1055 : 	} else if (g_machine_state.mode == BUSY) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1055
	cmp !LOWW(_g_machine_state+0x00007), #0x07
	bnz $.BB@LABEL@38_7
.BB@LABEL@38_12:	; if_then_bb26
	;***     1056 : 		if (ns_delay_ms(&g_Tick.tickDebouceHandSensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1056
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
.BB@LABEL@38_13:	; return
	;***     1057 : 				g_timerSetting.t55_waterDischargeDelay_s * 1000)) {
	;***     1058 : 			g_machine_state.mode = INDIE;
	;***     1059 : 			g_machine_state.user = 0;
	;***     1060 : 		}
	;***     1061 : 	} else {
	;***     1062 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***     1063 : 	}
	;***     1064 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1064
	ret
.BB@LABEL@38_14:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1058
	clrb !LOWW(_g_machine_state+0x00007)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1059
	clrb !LOWW(_g_machine_state+0x00006)
	ret
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***     1065 : 
	;***     1066 : /**
	;***     1067 :  * 30/11/2021: Checked by An
	;***     1068 :  */
	;***     1069 : void electrolyticOperationON(void) {
	;***     1070 : 	//Electrolytic operation ON
	;***     1071 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1071
	set1 0xFFF01.7
	;***     1072 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1072
	set1 0xFFF0E.2
	;***     1073 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1073
	set1 0xFFF06.0
	;***     1074 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1074
	oneb !LOWW(_g_electrolytic_flag)
	;***     1075 : 	g_TickKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1075
	movw bc, !LOWW(_g_TickKeeper@1+0x00012)
	movw ax, !LOWW(_g_TickKeeper@1+0x00010)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@39_3
.BB@LABEL@39_1:	; entry
	bc $.BB@LABEL@39_3
.BB@LABEL@39_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@39_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TickKeeper@1+0x00010), ax
	movw ax, bc
	movw !LOWW(_g_TickKeeper@1+0x00012), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1079
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 6
	;***     1076 : 			g_TickKeeper.neutralization == 0 ?
	;***     1077 : 					g_systemTime : g_TickKeeper.neutralization;
	;***     1078 : 	//TODO: Add Neutralization timer ON
	;***     1079 : }
	;***     1080 : /**
	;***     1081 :  * 30/11/2021: Checked by An, missing Neutralization timer OFF
	;***     1082 :  */
	;***     1083 : uint8_t electrolyticOperationOFF(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1083
	clrw ax
	;***     1084 : 	//TODO: Add Neutralization timer OFF
	;***     1085 : 	g_TickKeeper.neutralization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1085
	movw !LOWW(_g_TickKeeper@1+0x00012), ax
	movw !LOWW(_g_TickKeeper@1+0x00010), ax
	;***     1086 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1086
	clr1 0xFFF0E.2
	;***     1087 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1087
	clr1 0xFFF06.0
	;***     1088 : 	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1088
	call $!_RaspberryResponse_nostop
	;***     1089 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1089
	call !!_R_WDT_Restart
	;***     1090 : 	//delay(5)
	;***     1091 : 	if (ns_delay_ms(&g_Tick.tickElectrolyticOff,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1091
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
	bnz $.BB@LABEL@40_2
.BB@LABEL@40_1:	; bb7
	;***     1092 : 			g_timerSetting.t5_electrolysisStopDelay_s * 1000)) {
	;***     1093 : 		O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***     1094 : 		g_electrolytic_flag = 0;
	;***     1095 : 		return 0;
	;***     1096 : 	}
	;***     1097 : 	return 1;
	;***     1098 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1098
	oneb a
	ret
.BB@LABEL@40_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1093
	clr1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1094
	clrb !LOWW(_g_electrolytic_flag)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1095
	clrb a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***     1099 : 
	;***     1100 : float measureFlowSensor(uint32_t *t) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1100
	push ax
	subw sp, #0x0C
	;***     1101 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1101
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
.BB@LABEL@41_1:	; bb27
	movw ax, [sp+0x0C]
	movw de, ax
	;***     1102 : 	float flow_pluse = 0.0;
	;***     1103 : 	uint8_t flow_pulse_state = I_OFF;
	;***     1104 : 	while (!ns_delay_ms(&stamp_flow_sensor, (*t) * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1104
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
	bnz $.BB@LABEL@41_7
.BB@LABEL@41_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***     1105 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1105
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@41_6
.BB@LABEL@41_3:	; if_then_bb
	;***     1106 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1106
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@41_5
.BB@LABEL@41_4:	; if_then_bb20
	movw ax, #0x3F80
	;***     1107 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1107
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
.BB@LABEL@41_5:	; if_break_bb
	;***     1108 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1108
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@41_6:	; if_break_bb26
	;***     1109 : 		}
	;***     1110 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1110
	call !!_R_WDT_Restart
	br $.BB@LABEL@41_1
.BB@LABEL@41_7:	; bb40
	movw ax, #0x3F33
	;***     1111 : 	}
	;***     1112 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000) / (*t); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1112
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
	;***     1113 : 	return g_io_status.refined.FlowValue;
	;***     1114 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1114
	movw bc, ax
	movw ax, de
	addw sp, #0x0E
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***     1115 : 
	;***     1116 : uint8_t _pre_flow_state = I_OFF;
	;***     1117 : float _flow_pulse;
	;***     1118 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1118
	subw sp, #0x04
	;***     1119 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***     1120 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***     1121 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1121
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@42_4
.BB@LABEL@42_1:	; entry
	dec a
	bz $.BB@LABEL@42_5
.BB@LABEL@42_2:	; entry
	dec a
	bz $.BB@LABEL@42_12
.BB@LABEL@42_3:	; switch_clause_bb61
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@42_11
.BB@LABEL@42_4:	; switch_clause_bb
	;***     1122 : 	case 0:
	;***     1123 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s * 1000)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1123
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@42_9
.BB@LABEL@42_5:	; switch_clause_bb14
	;***     1124 : 			(*state)++;
	;***     1125 : 		}
	;***     1126 : 		break;
	;***     1127 : 	case 1:
	;***     1128 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1128
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@42_8
.BB@LABEL@42_6:	; if_then_bb24
	;***     1129 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1129
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***     1130 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1130
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@42_8
.BB@LABEL@42_7:	; if_then_bb35
	movw ax, #0x3F80
	;***     1131 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1131
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
.BB@LABEL@42_8:	; if_break_bb39
	;***     1132 : 			}
	;***     1133 : 		}
	;***     1134 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1134
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0000A)
.BB@LABEL@42_9:	; if_break_bb39
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
.BB@LABEL@42_10:	; if_then_bb47
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@42_11:	; switch_break_bb
	;***     1135 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***     1136 : 			(*state)++;
	;***     1137 : 		}
	;***     1138 : 		break;
	;***     1139 : 	case 2:
	;***     1140 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***     1141 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***     1142 : 		_flow_pulse = 0;
	;***     1143 : 		(*state) = 0;
	;***     1144 : 		break;
	;***     1145 : 	default:
	;***     1146 : 		(*state) = 0;
	;***     1147 : 		break;
	;***     1148 : 	}
	;***     1149 : 	return g_io_status.refined.FlowValue;
	;***     1150 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1150
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@42_12:	; switch_clause_bb52
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1140
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1142
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@42_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***     1151 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1151
	push hl
	;***     1152 : 	if (g_machine_state.mode != ELECTROLYTIC_GENERATION)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1152
	mov a, !LOWW(_g_machine_state+0x00007)
	cmp a, #0x08
	skz
.BB@LABEL@43_1:	; if_then_bb
	;***     1153 : 		pre_machine_mode = g_machine_state.mode;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1153
	mov !LOWW(_pre_machine_mode@2), a
.BB@LABEL@43_2:	; if_break_bb
	;***     1154 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1154
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@43_4
.BB@LABEL@43_3:	; bb11
	clrb x
.BB@LABEL@43_4:	; bb12
	;***     1155 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1155
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@43_6
.BB@LABEL@43_5:	; bb28
	clrb c
.BB@LABEL@43_6:	; bb30
	;***     1156 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1156
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@43_8
.BB@LABEL@43_7:	; bb46
	clrb b
.BB@LABEL@43_8:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***     1157 : 
	;***     1158 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1158
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@43_10
.BB@LABEL@43_9:	; bb64
	clrb x
.BB@LABEL@43_10:	; bb66
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***     1159 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1159
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@43_12
.BB@LABEL@43_11:	; bb82
	clrb b
.BB@LABEL@43_12:	; bb84
	mov a, c
	or a, x
	mov c, a
	;***     1160 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1160
	mov a, 0xFFF07
	mov x, #0x04
	bf a.0, $.BB@LABEL@43_14
.BB@LABEL@43_13:	; bb100
	clrb x
.BB@LABEL@43_14:	; bb102
	mov a, c
	or a, b
	mov c, a
	;***     1161 : 
	;***     1162 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1162
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@43_16
.BB@LABEL@43_15:	; bb118
	clrb b
.BB@LABEL@43_16:	; bb120
	mov a, c
	or a, x
	mov c, a
	;***     1163 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1163
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@43_18
.BB@LABEL@43_17:	; bb136
	clrb x
.BB@LABEL@43_18:	; bb138
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***     1164 : 
	;***     1165 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1165
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***     1166 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1166
	mov x, 0xFFF05
	;***     1167 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1167
	mov c, 0xFFF07
	;***     1168 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1168
	mov a, 0xFFF07
	mov h, a
	;***     1169 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1169
	mov a, [de]
	mov l, a
	;***     1170 : 	O_DRAIN_ACID_PIN_SV7;
	;***     1171 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1171
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1165
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1166
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1167
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1168
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1169
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***     1172 : 	O_DRAIN_ALK_PIN_SV6;
	;***     1173 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1173
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1169
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1173
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1171
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1173
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***     1174 : 
	;***     1175 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1175
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***     1176 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1176
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***     1177 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1177
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***     1178 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_TickKeeper@1:
	.DS (20)
_pre_machine_mode@2:
	.DS (1)
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
	.DS (132)
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
