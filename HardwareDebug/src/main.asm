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
#@  compiled at Thu Dec 23 18:18:27 2021

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
	.PUBLIC _water_solfner_buf
	.PUBLIC _time_setting_p
	.PUBLIC _number_setting_p
	.PUBLIC _test_control_buf
	.PUBLIC _this_true
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
	.PUBLIC _sendToWaterSolfner
	.EXTERN _R_UART3_Send
	.PUBLIC _isThisCommand
	.PUBLIC _RaspberryResponse_nostop
	.EXTERN _R_WDT_Restart
	.EXTERN _crc8_1
	.EXTERN _EE_SPI_Write
	.PUBLIC _InitialOperationModeStart
	.PUBLIC _WaterSupplyOperation_nostop
	.PUBLIC _stop_waitAlarmConfirm
	.PUBLIC _nostop_waitAlarmConfirm
	.PUBLIC _Voltage1Check_waitReset
	.PUBLIC _Voltage2Check_loop
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
	;***       34 : union BytesToDouble{
	;***       35 : 	struct{
	;***       36 : 		uint8_t data[4];
	;***       37 : 	}refined;
	;***       38 : 	uint32_t raw;
	;***       39 : }btod;
	;***       40 : //struct Tick_s g_Tick;
	;***       41 : 
	;***       42 : //void electrolyticOperationON(void);
	;***       43 : //void electrolyticOperationOFF(void);
	;***       44 : void handSensorLED(enum HS_COLOR color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 44
	mov !LOWW(_g_color), a
	;***       45 : 	g_color = color;
	;***       46 : 	if (g_color != g_pre_color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 46
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       47 : 		switch (color) {
	;***       48 : 		case RED:
	;***       49 : 			O_HS_ICL_PIN = 1;
	;***       50 : 			O_HS_IDA_PIN = 0;
	;***       51 : 			break;
	;***       52 : 		case BLUE:
	;***       53 : 			O_HS_ICL_PIN = 0;
	;***       54 : 			O_HS_IDA_PIN = 0;
	;***       55 : 			break;
	;***       56 : 		case WHITE:
	;***       57 : 			O_HS_ICL_PIN = 0;
	;***       58 : 			O_HS_IDA_PIN = 1;
	;***       59 : 			break;
	;***       60 : 		default:
	;***       61 : 			O_HS_ICL_PIN = 1;
	;***       62 : 			O_HS_IDA_PIN = 1;
	;***       63 : 			break;
	;***       64 : 		}
	;***       65 : 		g_pre_color = g_color;
	;***       66 : 	}
	;***       67 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 47
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 61
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 49
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 50
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 53
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 54
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 57
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_setting_default:
	.STACK _setting_default = 4
	;***       68 : void setting_default(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	movw ax, #0x4086
	;***       69 : 	g_numberSetting.upperVoltage1 = 4.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x6666
	movw !LOWW(_g_numberSetting), ax
	movw ax, #0x4060
	;***       70 : 	g_numberSetting.upperVoltage2 = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw !LOWW(_g_numberSetting+0x00006), ax
	;***       71 : 	g_numberSetting.upperVoltage3 = 2.2;
	;***       72 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       73 : 	g_numberSetting.upperCurrent = 4.3;
	;***       74 : 	g_numberSetting.lowerCurrent = 0.2;
	;***       75 : 	g_numberSetting.upperFlow = 3.5;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_numberSetting+0x00018), ax
	;***       76 : 	g_numberSetting.lowerFlow = 0.4;
	;***       77 : 
	;***       78 : 	g_timerSetting.t2_flowSensorStartTime_s = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       79 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       80 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       81 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       82 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x0002E), ax
	;***       83 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00032), ax
	;***       84 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00036), ax
	;***       85 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x0003A), ax
	;***       86 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x00042), ax
	;***       87 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x0006A), ax
	;***       88 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x0006E), ax
	;***       89 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x00072), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_numberSetting+0x0000A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_numberSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F00
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_numberSetting+0x0000E), ax
	movw ax, #0x4089
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_numberSetting+0x00016), ax
	mov x, #0xCC
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x00008), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x00028), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x0002C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00038), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00030), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00034), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x00040), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	movw !LOWW(_g_timerSetting+0x00068), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	movw !LOWW(_g_timerSetting+0x0006C), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	movw !LOWW(_g_timerSetting+0x00070), ax
	ret
_isAcidHigh:
	.STACK _isAcidHigh = 6
	;***       90 : }
	;***       91 : #ifdef RENAN_CODE
	;***       92 : void renanCode(void){
	;***       93 : 	//Power On Mode
	;***       94 : 	O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       95 : 	O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       96 : 	do{
	;***       97 : 		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN_SV7;	// Turn on SV5 if ACID tank empty
	;***       98 : 		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN_SV6;	// Turn on SV6 if ALK tank empty
	;***       99 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***      100 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***      101 : 		R_WDT_Restart();
	;***      102 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      103 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***      104 : 	O_DRAIN_ACID_PIN_SV7 = O_DRAIN_ALK_PIN_SV6 = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***      105 : 
	;***      106 : 	// Drainage operation
	;***      107 : 	O_SPOUT_WATER_PIN_SV2 = ON;	// SV2 On
	;***      108 : 	delay(st[1]);			// Default 30 seconds
	;***      109 : 	O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      110 : 	delay_ms(500);
	;***      111 : 	O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      112 : }
	;***      113 : 
	;***      114 : 
	;***      115 : void code_20211029(void){
	;***      116 : 	//---------------Electrolytic operation-----------------------------
	;***      117 : 	O_SUPPLY_WATER_PIN_SV1 = ON; //SV1
	;***      118 : 	O_CVCC_ON_PIN = ON;
	;***      119 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***      120 : 	delay(10);
	;***      121 : 	//TODO: Neutralization timer On
	;***      122 : 
	;***      123 : 	overVoltage1Error();
	;***      124 : }
	;***      125 : #endif
	;***      126 : 
	;***      127 : 
	;***      128 : uint8_t isAcidHigh(void){
	;***      129 : 	if(g_io_status.refined.AcidHighLevel != g_pre_io_status.refined.AcidHighLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].5
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].5
	bc $.BB@LABEL@3_3
.BB@LABEL@3_1:	; if_else_bb
	;***      130 : 		if(I_ACID_H_PIN == I_ON){
	;***      131 : 			if(ns_delay_ms(&g_Tick.tickAcidLevel[0], g_timerSetting.t28_onDelayHighLevel_s*1000)){
	;***      132 : 				g_pre_io_status.refined.AcidHighLevel = g_io_status.refined.AcidHighLevel;
	;***      133 : 				return 1;
	;***      134 : 			}
	;***      135 : 			return 0;
	;***      136 : 		}
	;***      137 : 	}else{
	;***      138 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00044), ax
.BB@LABEL@3_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
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
	movw ax, #LOWW(_g_Tick@1+0x00044)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@3_2
.BB@LABEL@3_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 132
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 132
	mov1 CY, [hl].5
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].5, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	ret
_isAcidLow:
	.STACK _isAcidLow = 6
	;***      139 : 	}
	;***      140 : 	return 0;
	;***      141 : }
	;***      142 : uint8_t isAcidLow(void){
	;***      143 : 	if(g_io_status.refined.AcidLowLevel != g_pre_io_status.refined.AcidLowLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].4
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].4
	bc $.BB@LABEL@4_3
.BB@LABEL@4_1:	; if_else_bb
	;***      144 : 		if(I_ACID_M_PIN == I_ON){
	;***      145 : 			if(ns_delay_ms(&g_Tick.tickAcidLevel[1], g_timerSetting.t27_onDelayLowLevel_s*1000)){
	;***      146 : 				g_pre_io_status.refined.AcidLowLevel = g_io_status.refined.AcidLowLevel;
	;***      147 : 				return 1;
	;***      148 : 			}
	;***      149 : 			return 0;
	;***      150 : 		}
	;***      151 : 	}else{
	;***      152 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0004A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00048), ax
.BB@LABEL@4_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 155
	ret
.BB@LABEL@4_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@4_2
.BB@LABEL@4_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 145
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
	movw ax, #LOWW(_g_Tick@1+0x00048)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@4_2
.BB@LABEL@4_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 146
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 146
	mov1 CY, [hl].4
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].4, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	ret
_isAcidEmpty:
	.STACK _isAcidEmpty = 6
	;***      153 : 	}
	;***      154 : 	return 0;
	;***      155 : }
	;***      156 : uint8_t isAcidEmpty(void){
	;***      157 : 	if(g_io_status.refined.AcidEmptyLevel!= g_pre_io_status.refined.AcidEmptyLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].3
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].3
	bc $.BB@LABEL@5_3
.BB@LABEL@5_1:	; if_else_bb
	;***      158 : 		if(I_ACID_L_PIN == I_ON){
	;***      159 : 			if(ns_delay_ms(&g_Tick.tickAcidLevel[2], g_timerSetting.t26_onDelayEmptyLevel_s*1000)){
	;***      160 : 				return 1;
	;***      161 : 			}
	;***      162 : 			return 0;
	;***      163 : 		}
	;***      164 : 	}else{
	;***      165 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 165
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0004C), ax
.BB@LABEL@5_2:	; bb31
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
	ret
.BB@LABEL@5_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@5_2
.BB@LABEL@5_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 159
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
	movw ax, #LOWW(_g_Tick@1+0x0004C)
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
	;***      166 : 	}
	;***      167 : 	return 0;
	;***      168 : }
	;***      169 : 
	;***      170 : uint8_t isAlkalineHigh(void){
	;***      171 : 	if(g_io_status.refined.AlkalineHighLevel != g_pre_io_status.refined.AlkalineHighLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].2
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].2
	bc $.BB@LABEL@6_3
.BB@LABEL@6_1:	; if_else_bb
	;***      172 : 		if(I_ALKALI_H_PIN == I_ON){
	;***      173 : 			if(ns_delay_ms(&g_Tick.tickAlkalineLevel[0], g_timerSetting.t28_onDelayHighLevel_s*1000)){
	;***      174 : 				g_pre_io_status.refined.AlkalineHighLevel = g_io_status.refined.AlkalineHighLevel;
	;***      175 : 				return 1;
	;***      176 : 			}
	;***      177 : 			return 0;
	;***      178 : 		}
	;***      179 : 	}else{
	;***      180 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00050), ax
.BB@LABEL@6_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 183
	ret
.BB@LABEL@6_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@6_2
.BB@LABEL@6_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 173
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
	movw ax, #LOWW(_g_Tick@1+0x00050)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@6_2
.BB@LABEL@6_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	mov1 CY, [hl].2
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].2, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	ret
_isAlkalineLow:
	.STACK _isAlkalineLow = 6
	;***      181 : 	}
	;***      182 : 	return 0;
	;***      183 : }
	;***      184 : uint8_t isAlkalineLow(void){
	;***      185 : 	if(g_io_status.refined.AlkalineLowLevel != g_pre_io_status.refined.AlkalineLowLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].1
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].1
	bc $.BB@LABEL@7_3
.BB@LABEL@7_1:	; if_else_bb
	;***      186 : 		if(I_ALKALI_M_PIN == I_ON){
	;***      187 : 			if(ns_delay_ms(&g_Tick.tickAlkalineLevel[1], g_timerSetting.t27_onDelayLowLevel_s*1000)){
	;***      188 : 				g_pre_io_status.refined.AlkalineLowLevel = g_io_status.refined.AlkalineLowLevel;
	;***      189 : 				return 1;
	;***      190 : 			}
	;***      191 : 			return 0;
	;***      192 : 		}
	;***      193 : 	}else{
	;***      194 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00054), ax
.BB@LABEL@7_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
	ret
.BB@LABEL@7_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 186
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@7_2
.BB@LABEL@7_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 187
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
	movw ax, #LOWW(_g_Tick@1+0x00054)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@7_2
.BB@LABEL@7_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 189
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	mov1 CY, [hl].1
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].1, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 189
	ret
_isAlkalineEmpty:
	.STACK _isAlkalineEmpty = 6
	;***      195 : 	}
	;***      196 : 	return 0;
	;***      197 : }
	;***      198 : uint8_t isAlkalineEmpty(void){
	;***      199 : 	if(g_io_status.refined.AlkalineEmptyLevel!= g_pre_io_status.refined.AlkalineEmptyLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].0
	bc $.BB@LABEL@8_3
.BB@LABEL@8_1:	; if_else_bb
	;***      200 : 		if(I_ALKALI_L_PIN == I_ON){
	;***      201 : 			if(ns_delay_ms(&g_Tick.tickAlkalineLevel[2], g_timerSetting.t26_onDelayEmptyLevel_s*1000)){
	;***      202 : 				return 1;
	;***      203 : 			}
	;***      204 : 			return 0;
	;***      205 : 		}
	;***      206 : 	}else{
	;***      207 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 207
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0005A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00058), ax
.BB@LABEL@8_2:	; bb31
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	ret
.BB@LABEL@8_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@8_2
.BB@LABEL@8_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 201
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
	movw ax, #LOWW(_g_Tick@1+0x00058)
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
	.STACK _sendToRasPi = 10
	;***      208 : 	}
	;***      209 : 	return 0;
	;***      210 : }
	;***      211 : 
	;***      212 : //----------------------Begin code 11112021--------------------------------------
	;***      213 : void sendToRasPi(enum UART_header_e head, enum Control_status type, float value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
	push hl
	push ax
	movw ax, bc
	push de
	pop bc
	;***      214 : 	uint8_t state = g_uart2_sendend;
	;***      215 : 	g_control_buffer.head = head;
	;***      216 : 	g_control_buffer.set_number = type;
	;***      217 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 217
	call !!__COM_ftoul
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x02], a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	mov !LOWW(_g_control_buffer), a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	mov !LOWW(_g_control_buffer+0x00001), a
	;***      218 : 	R_UART2_Send((uint8_t*) &g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@9_1:	; bb10
	mov a, [sp+0x02]
	;***      219 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@9_1
.BB@LABEL@9_2:	; return
	;***      220 : 		;
	;***      221 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	addw sp, #0x04
	ret
_sendToWaterSolfner:
	.STACK _sendToWaterSolfner = 6
	;***      222 : struct UART3_Buffer_s {
	;***      223 : 	uint8_t busy;
	;***      224 : 	uint8_t head; // 1 byte
	;***      225 : 	uint8_t set_number; // 1 byte
	;***      226 : 	uint8_t set_value[4]; // 4 byte
	;***      227 : }water_solfner_buf;
	;***      228 : void sendToWaterSolfner(uint8_t busy, uint8_t head, uint8_t type, uint32_t value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	push hl
	;***      229 : 	uint8_t state = g_uart3_sendend;
	;***      230 : 	btod.raw = value;
	;***      231 : 	water_solfner_buf.busy = busy;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	mov !LOWW(_water_solfner_buf), a
	mov a, x
	;***      232 : 	water_solfner_buf.head = head;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 232
	mov !LOWW(_water_solfner_buf+0x00001), a
	mov a, c
	;***      233 : 	water_solfner_buf.set_number = type;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 233
	mov !LOWW(_water_solfner_buf+0x00002), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	movw ax, [sp+0x08]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	movw !LOWW(_btod+0x00002), ax
	movw ax, [sp+0x06]
	movw !LOWW(_btod), ax
	clrb a
.BB@LABEL@10_1:	; bb
	mov b, a
	;***      234 : 	for(uint8_t i=0;i<4;i++){
	;***      235 : 		 water_solfner_buf.set_value[i] = btod.refined.data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 235
	mov a, LOWW(_btod)[b]
	mov LOWW(_water_solfner_buf+0x00003)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 234
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@10_1
.BB@LABEL@10_2:	; bb25
	;***      236 : 	}
	;***      237 : 	O_RS485_MODE_PIN = 1U;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	set1 0xFFF00.0
	;***      238 : 	R_UART3_Send((uint8_t*) &water_solfner_buf, 7);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 238
	movw bc, #0x0007
	movw ax, #LOWW(_water_solfner_buf)
	call !!_R_UART3_Send
.BB@LABEL@10_3:	; bb28
	mov a, [sp+0x00]
	;***      239 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@10_3
.BB@LABEL@10_4:	; return
	;***      240 : 		;
	;***      241 : 
	;***      242 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 242
	pop hl
	ret
_isThisCommand:
	.STACK _isThisCommand = 6
	;***      243 : 
	;***      244 : uint8_t isThisCommand(uint8_t *input_buf, enum UART_header_e header, enum Control_status control, uint32_t data){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	push hl
	movw hl, ax
	mov a, b
	mov [sp+0x00], a
	clrb a
	mov b, a
.BB@LABEL@11_1:	; bb
	;***      245 : 	for(uint8_t i=0; i<4; i++){
	;***      246 : 		btod.refined.data[i] = input_buf[2+i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	shrw ax, 8+0x00000
	addw ax, hl
	incw ax
	incw ax
	movw de, ax
	mov a, [de]
	mov LOWW(_btod)[b], a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 245
	inc b
	mov a, b
	cmp a, #0x04
	bnz $.BB@LABEL@11_1
.BB@LABEL@11_2:	; bb23
	mov a, c
	;***      247 : 	}
	;***      248 : 
	;***      249 : 	if((input_buf[0] == header)&&(input_buf[1] == control)&&(btod.raw == data))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	cmp a, [hl]
	bnz $.BB@LABEL@11_10
.BB@LABEL@11_3:	; bb32
	mov a, [sp+0x00]
	cmp a, [hl+0x01]
	bnz $.BB@LABEL@11_7
.BB@LABEL@11_4:	; bb47
	movw ax, [sp+0x08]
	cmpw ax, !LOWW(_btod+0x00002)
	movw ax, [sp+0x06]
	sknz
.BB@LABEL@11_5:	; bb47
	cmpw ax, !LOWW(_btod)
.BB@LABEL@11_6:	; bb47
	;***      250 : 		return 2;
	;***      251 : 	else if((input_buf[0] == header)&&(input_buf[1] == control))
	;***      252 : 		return 1;
	;***      253 : 	else
	;***      254 : 		return 0;
	;***      255 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	mov a, #0x02
	bz $.BB@LABEL@11_9
.BB@LABEL@11_7:	; bb70
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	cmp a, [hl+0x01]
	oneb a
	skz
.BB@LABEL@11_8:	; bb70
	clrb a
.BB@LABEL@11_9:	; bb70
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	ret
.BB@LABEL@11_10:	; if_else_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	clrb a
	br $.BB@LABEL@11_9
_RaspberryResponse_nostop:
	.STACK _RaspberryResponse_nostop = 10
	;***      256 : /**
	;***      257 :  * Handle all response to Raspberry command.
	;***      258 :  */
	;***      259 : uint8_t * const time_setting_p = (uint8_t*) &_settingTime;
	;***      260 : uint8_t * const number_setting_p = (uint8_t*) &_settingNumber;
	;***      261 : struct UART_Buffer_s test_control_buf = {
	;***      262 : 		H_READ, READ_TIME, 0x000000ff
	;***      263 : };
	;***      264 : uint8_t this_true;
	;***      265 : void RaspberryResponse_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	push hl
	;***      266 : 	if (commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	cmp0 !LOWW(_commnunication_flag)
	bz $.BB@LABEL@12_8
.BB@LABEL@12_1:	; if_then_bb
	;***      267 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 267
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      268 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 268
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
	clrw ax
	;***      269 : 		// TODO: Move this set Mode
	;***      270 : 		this_true = isThisCommand(g_rx_data, H_READ, READ_TIME, 0xff);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
	push ax
	mov x, #0xFF
	push ax
	movw bc, #0x0252
	movw ax, #LOWW(_g_rx_data)
	call $!_isThisCommand
	addw sp, #0x04
	mov !LOWW(_this_true), a
	clrw ax
	;***      271 : 		if(isThisCommand(g_rx_data, H_SET, WASHING_MODE, 0xff) != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 271
	push ax
	mov x, #0xFF
	push ax
	movw bc, #0x1853
	movw ax, #LOWW(_g_rx_data)
	call $!_isThisCommand
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@12_4
.BB@LABEL@12_2:	; if_else_bb
	clrw ax
	;***      272 : 			g_machine_mode = g_rx_data[5];
	;***      273 : 		}else if(isThisCommand(g_rx_data, H_SET, OK_USER, 0xff) != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	push ax
	mov x, #0xFF
	push ax
	movw bc, #0x0153
	movw ax, #LOWW(_g_rx_data)
	call $!_isThisCommand
	addw sp, #0x04
	cmp0 a
	bz $.BB@LABEL@12_5
.BB@LABEL@12_3:	; if_then_bb29
	;***      274 : 			g_machine_state.user = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 274
	oneb !LOWW(_g_machine_state+0x00006)
	br $.BB@LABEL@12_5
.BB@LABEL@12_4:	; if_then_bb22
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 272
	mov a, !LOWW(_g_rx_data+0x00005)
	mov !LOWW(_g_machine_mode), a
.BB@LABEL@12_5:	; bb31
	mov a, [sp+0x00]
	;***      275 : 		}
	;***      276 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@12_7
.BB@LABEL@12_6:	; bb
	;***      277 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	call !!_R_WDT_Restart
	br $.BB@LABEL@12_5
.BB@LABEL@12_7:	; bb39
	;***      278 : 		}
	;***      279 : 		commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 279
	clrb !LOWW(_commnunication_flag)
.BB@LABEL@12_8:	; if_break_bb40
	;***      280 : 	}
	;***      281 : 	if(commnunication_flag.send_response_mode_flag == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 281
	cmp !LOWW(_commnunication_flag+0x00006), #0x01
	bnz $.BB@LABEL@12_10
.BB@LABEL@12_9:	; if_then_bb46
	;***      282 : 		sendToRasPi(H_READ, WASHING_MODE, (uint32_t)g_machine_mode << (8*3));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
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
	;***      283 : 		commnunication_flag.send_response_mode_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	clrb !LOWW(_commnunication_flag+0x00006)
.BB@LABEL@12_10:	; if_break_bb51
	;***      284 : 	}
	;***      285 : 	if (commnunication_flag.send_respone_status_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	cmp0 !LOWW(_commnunication_flag+0x00005)
	bz $.BB@LABEL@12_15
.BB@LABEL@12_11:	; if_then_bb57
	;***      286 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 286
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      287 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	movw bc, #0x0005
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@12_12:	; bb63
	mov a, [sp+0x00]
	;***      288 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@12_14
.BB@LABEL@12_13:	; bb62
	;***      289 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
	call !!_R_WDT_Restart
	br $.BB@LABEL@12_12
.BB@LABEL@12_14:	; bb71
	;***      290 : 		}
	;***      291 : 		commnunication_flag.send_respone_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	clrb !LOWW(_commnunication_flag+0x00005)
.BB@LABEL@12_15:	; if_break_bb72
	;***      292 : 	}
	;***      293 : 	if (commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	cmp0 !LOWW(_commnunication_flag+0x00001)
	bz $.BB@LABEL@12_20
.BB@LABEL@12_16:	; if_then_bb78
	;***      294 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      295 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 295
	mov c, #0x8C
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x0008C), a
	;***      296 : 				timeSettingSize - 1);
	;***      297 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
	movw bc, #0x008D
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@12_17:	; bb89
	mov a, [sp+0x00]
	;***      298 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 298
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@12_19
.BB@LABEL@12_18:	; bb88
	;***      299 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	call !!_R_WDT_Restart
	br $.BB@LABEL@12_17
.BB@LABEL@12_19:	; bb97
	;***      300 : 		}
	;***      301 : 		commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
	clrb !LOWW(_commnunication_flag+0x00001)
.BB@LABEL@12_20:	; if_break_bb98
	;***      302 : 	}
	;***      303 : 	if (commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	cmp0 !LOWW(_commnunication_flag+0x00002)
	bz $.BB@LABEL@12_25
.BB@LABEL@12_21:	; if_then_bb104
	;***      304 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      305 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	mov c, #0x20
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00020), a
	;***      306 : 				numberSettingSize - 1);
	;***      307 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	movw bc, #0x0021
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@12_22:	; bb115
	mov a, [sp+0x00]
	;***      308 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 308
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@12_24
.BB@LABEL@12_23:	; bb114
	;***      309 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	call !!_R_WDT_Restart
	br $.BB@LABEL@12_22
.BB@LABEL@12_24:	; bb123
	;***      310 : 		}
	;***      311 : 		commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
	clrb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@12_25:	; if_break_bb124
	;***      312 : 	}
	;***      313 : 	if (commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	cmp !LOWW(_commnunication_flag+0x00004), #0x02
	bnz $.BB@LABEL@12_41
.BB@LABEL@12_26:	; if_break_bb124.bb181_crit_edge
	clrb a
	mov b, a
.BB@LABEL@12_27:	; bb181
	;***      314 : //		//Do not Edit this, must keep!!!!
	;***      315 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	cmp a, #0x8C
	bnc $.BB@LABEL@12_37
.BB@LABEL@12_28:	; bb131
	;***      316 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 316
	and a, #0x03
	bz $.BB@LABEL@12_35
.BB@LABEL@12_29:	; bb131
	dec a
	bz $.BB@LABEL@12_34
.BB@LABEL@12_30:	; bb131
	dec a
	mov a, b
	bz $.BB@LABEL@12_33
.BB@LABEL@12_31:	; switch_clause_bb
	;***      317 : //			case 3:
	;***      318 : //				pointer0[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
	;***      319 : //				break;
	;***      320 : //			case 2:
	;***      321 : //				pointer0[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
	;***      322 : //				break;
	;***      323 : //			case 1:
	;***      324 : //				pointer0[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
	;***      325 : //				break;
	;***      326 : //			case 0:
	;***      327 : //				pointer0[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
	;***      328 : //				break;
	;***      329 : //			default:
	;***      330 : //				break;
	;***      331 : 			case 3:
	;***      332 : 				time_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 332
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFD)
.BB@LABEL@12_32:	; switch_clause_bb
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@12_36
.BB@LABEL@12_33:	; switch_clause_bb145
	;***      333 : 				break;
	;***      334 : 			case 2:
	;***      335 : 				time_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 335
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingTime+0x0FFFF)
	br $.BB@LABEL@12_32
.BB@LABEL@12_34:	; switch_clause_bb156
	;***      336 : 				break;
	;***      337 : 			case 1:
	;***      338 : 				time_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 338
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00001)[b], a
	br $.BB@LABEL@12_36
.BB@LABEL@12_35:	; switch_clause_bb167
	;***      339 : 				break;
	;***      340 : 			case 0:
	;***      341 : 				time_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 341
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingTime+0x00003)[b], a
.BB@LABEL@12_36:	; switch_break_bb
	inc b
	mov a, b
	br $.BB@LABEL@12_27
.BB@LABEL@12_37:	; bb190
	;***      342 : 				break;
	;***      343 : 			default:
	;***      344 : 				break;
	;***      345 : 			}
	;***      346 : 		}
	;***      347 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 347
	mov a, !LOWW(_g_rx_data+0x0008C)
	mov [sp+0x00], a
	mov !LOWW(__settingTime+0x0008C), a
	;***      348 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 348
	mov c, #0x8C
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp x, a
	bnz $.BB@LABEL@12_39
.BB@LABEL@12_38:	; if_then_bb213
	;***      349 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 1)) {
	;***      350 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 350
	movw de, #0x008E
	movw bc, #LOWW(__settingTime)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	clrw ax
	;***      351 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, TIME_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 351
	push ax
	mov x, #0x8D
	push ax
	movw bc, #0x0800
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      352 : 					timeSettingSize);
	;***      353 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 353
	clrb x
	br $.BB@LABEL@12_40
.BB@LABEL@12_39:	; if_else_bb216
	;***      354 : 		} else {
	;***      355 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 355
	mov x, #0x16
.BB@LABEL@12_40:	; if_else_bb216
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi
	;***      356 : 		}
	;***      357 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      358 : 		commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 358
	clrb !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@12_41:	; if_break_bb218
	;***      359 : 	}
	;***      360 : 
	;***      361 : 	if (commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 361
	cmp !LOWW(_commnunication_flag+0x00003), #0x02
	.bnz $!.BB@LABEL@12_57
.BB@LABEL@12_42:	; if_break_bb218.bb277_crit_edge
	clrb a
	mov b, a
.BB@LABEL@12_43:	; bb277
	;***      362 : //		//Do not Edit this, must keep!!!!
	;***      363 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 363
	cmp a, #0x20
	bnc $.BB@LABEL@12_53
.BB@LABEL@12_44:	; bb225
	;***      364 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 364
	and a, #0x03
	bz $.BB@LABEL@12_51
.BB@LABEL@12_45:	; bb225
	dec a
	bz $.BB@LABEL@12_50
.BB@LABEL@12_46:	; bb225
	dec a
	mov a, b
	bz $.BB@LABEL@12_49
.BB@LABEL@12_47:	; switch_clause_bb229
	;***      365 : 			case 3:
	;***      366 : 				number_setting_p[i - 3] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 366
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFD)
.BB@LABEL@12_48:	; switch_clause_bb229
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@12_52
.BB@LABEL@12_49:	; switch_clause_bb240
	;***      367 : 				break;
	;***      368 : 			case 2:
	;***      369 : 				number_setting_p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 369
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber+0x0FFFF)
	br $.BB@LABEL@12_48
.BB@LABEL@12_50:	; switch_clause_bb251
	;***      370 : 				break;
	;***      371 : 			case 1:
	;***      372 : 				number_setting_p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 372
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00001)[b], a
	br $.BB@LABEL@12_52
.BB@LABEL@12_51:	; switch_clause_bb262
	;***      373 : 				break;
	;***      374 : 			case 0:
	;***      375 : 				number_setting_p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 375
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber+0x00003)[b], a
.BB@LABEL@12_52:	; switch_break_bb274
	inc b
	mov a, b
	br $.BB@LABEL@12_43
.BB@LABEL@12_53:	; bb286
	;***      376 : 				break;
	;***      377 : 			default:
	;***      378 : 				break;
	;***      379 : 			}
	;***      380 : 		}
	;***      381 : 		_settingNumber.crc = crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 381
	mov c, #0x20
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov !LOWW(__settingNumber+0x00020), a
	;***      382 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 382
	mov a, !LOWW(_g_rx_data+0x00020)
	mov [sp+0x00], a
	mov c, #0x20
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	cmp a, x
	bnz $.BB@LABEL@12_55
.BB@LABEL@12_54:	; if_then_bb308
	;***      383 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 1)) {
	;***      384 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 384
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5300
	call $!_sendToRasPi
	;***      385 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 385
	movw de, #0x0026
	movw bc, #LOWW(__settingNumber)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	clrw ax
	;***      386 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, NUMBER_SETTING_ADDRESS,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 386
	push ax
	mov x, #0x21
	push ax
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	addw sp, #0x04
	;***      387 : 					numberSettingSize);
	;***      388 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 388
	clrb x
	br $.BB@LABEL@12_56
.BB@LABEL@12_55:	; if_else_bb311
	;***      389 : 		} else {
	;***      390 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 390
	mov x, #0x16
.BB@LABEL@12_56:	; if_else_bb311
	movw de, #0x0000
	clrw bc
	mov a, #0x53
	call $!_sendToRasPi
	;***      391 : 		}
	;***      392 : //		sendToRasPi(H_SET, OK_ALL, 0x0);
	;***      393 : 		commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 393
	clrb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@12_57:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 395
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 14
	;***      394 : 	}
	;***      395 : }
	;***      396 : /**
	;***      397 :  * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
	;***      398 :  * 13/12/2021: Checked!
	;***      399 :  */
	;***      400 : void InitialOperationModeStart(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 400
	subw sp, #0x0A
	;***      401 : 	uint32_t _tick[2];
	;***      402 : //	uint8_t pre_acid, pre_akaline;
	;***      403 : 	g_pre_io_status.refined.Valve.SV7 = O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7;	// Turn on SV5 if ACID tank NOT empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 403
	mov a, 0xFFF07
	mov1 CY, a.1
	mov a, #0x80
	sknc
.BB@LABEL@13_1:	; bb7
	and a, 0xFFF06
.BB@LABEL@13_2:	; bb11
	mov x, a
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	mov a, 0xFFF06
	shr a, 0x01
	mov c, a
	mov a, #0x9F
	and a, !LOWW(_g_pre_io_status+0x00001)
	mov [sp+0x00], a
	;***      404 : 	g_pre_io_status.refined.Valve.SV6 = O_DRAIN_ALK_PIN_SV6 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 404
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x40
	sknc
.BB@LABEL@13_3:	; bb33
	and a, 0xFFF06
.BB@LABEL@13_4:	; bb40
	mov x, a
	mov a, #0xBF
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	mov a, 0xFFF06
	shr a, 0x01
	and a, #0x20
	mov b, a
	pop ax
	push ax
	mov a, c
	and a, #0x40
	or a, x
	or a, b
	mov !LOWW(_g_pre_io_status+0x00001), a
	;***      405 : 	I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6;// Turn on SV6 if ALK tank NOT empty
	;***      406 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 406
	call $!_UpdateMachineStatus
.BB@LABEL@13_5:	; bb219
	;***      407 : 	while (1) {
	;***      408 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 408
	call $!_RaspberryResponse_nostop
	;***      409 : 		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7;// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 409
	mov a, 0xFFF07
	mov1 CY, a.1
	mov a, #0x80
	sknc
.BB@LABEL@13_6:	; bb65
	and a, 0xFFF06
.BB@LABEL@13_7:	; bb70
	mov x, a
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      410 : 		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6;// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 410
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x40
	sknc
.BB@LABEL@13_8:	; bb86
	and a, 0xFFF06
.BB@LABEL@13_9:	; bb92
	mov x, a
	mov a, #0xBF
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      411 : 		g_pre_io_status.refined.Valve.SV7 = I_ACID_L_PIN == I_ON ? ON : OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 411
	mov a, 0xFFF07
	mov x, #0x40
	bf a.1, $.BB@LABEL@13_11
.BB@LABEL@13_10:	; bb108
	clrb x
.BB@LABEL@13_11:	; bb110
	mov a, #0x9F
	and a, !LOWW(_g_pre_io_status+0x00001)
	mov c, a
	;***      412 : 		g_pre_io_status.refined.Valve.SV6 = I_ALKALI_L_PIN == I_ON ? ON : OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 412
	mov a, 0xFFF00
	mov b, #0x20
	bf a.5, $.BB@LABEL@13_13
.BB@LABEL@13_12:	; bb126
	clrb b
.BB@LABEL@13_13:	; bb128
	mov a, c
	or a, x
	or a, b
	mov b, a
	mov !LOWW(_g_pre_io_status+0x00001), a
	;***      413 : 		if (g_pre_io_status.refined.Valve.SV7 != O_DRAIN_ACID_PIN_SV7) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 413
	mov a, 0xFFF06
	shr a, 0x07
	mov x, a
	mov a, b
	shr a, 0x06
	and a, #0x01
	cmp a, x
	bnz $.BB@LABEL@13_15
.BB@LABEL@13_14:	; if_else_bb
	;***      414 : 			if (ns_delay_ms(&_tick[0], g_timerSetting.t26_onDelayEmptyLevel_s)) {
	;***      415 : 				O_DRAIN_ACID_PIN_SV7 = g_pre_io_status.refined.Valve.SV7;
	;***      416 : 			}
	;***      417 : 		} else
	;***      418 : 			_tick[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 418
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
	br $.BB@LABEL@13_17
.BB@LABEL@13_15:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 414
	movw bc, !LOWW(_g_timerSetting+0x00050)
	movw de, !LOWW(_g_timerSetting+0x00052)
	movw ax, sp
	incw ax
	incw ax
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@13_17
.BB@LABEL@13_16:	; if_then_bb154
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 415
	mov a, !LOWW(_g_pre_io_status+0x00001)
	mov1 CY, a.6
	mov a, 0xFFF06
	mov1 a.7, CY
	mov 0xFFF06, a
.BB@LABEL@13_17:	; if_break_bb166
	;***      419 : 		if (g_pre_io_status.refined.Valve.SV6 != O_DRAIN_ALK_PIN_SV6) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 419
	mov a, !LOWW(_g_pre_io_status+0x00001)
	shr a, 0x05
	mov x, a
	mov a, 0xFFF06
	shr a, 0x06
	xor a, x
	bt a.0, $.BB@LABEL@13_19
.BB@LABEL@13_18:	; if_else_bb196
	;***      420 : 			if (ns_delay_ms(&_tick[1], g_timerSetting.t26_onDelayEmptyLevel_s)) {
	;***      421 : 				O_DRAIN_ALK_PIN_SV6 = g_pre_io_status.refined.Valve.SV6;
	;***      422 : 			}
	;***      423 : 		} else
	;***      424 : 			_tick[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 424
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x06], ax
	br $.BB@LABEL@13_21
.BB@LABEL@13_19:	; if_then_bb178
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 420
	movw bc, !LOWW(_g_timerSetting+0x00050)
	movw de, !LOWW(_g_timerSetting+0x00052)
	movw ax, sp
	addw ax, #0x0006
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@13_21
.BB@LABEL@13_20:	; if_then_bb186
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 421
	mov a, !LOWW(_g_pre_io_status+0x00001)
	mov1 CY, a.5
	mov a, 0xFFF06
	mov1 a.6, CY
	mov 0xFFF06, a
.BB@LABEL@13_21:	; if_break_bb200
	mov a, #0x80
	;***      425 : 		if ((O_DRAIN_ACID_PIN_SV7 == OFF) & (O_DRAIN_ALK_PIN_SV6 == OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 425
	and a, 0xFFF06
	mov x, a
	mov a, 0xFFF06
	bt a.6, $.BB@LABEL@13_23
.BB@LABEL@13_22:	; if_break_bb200
	cmp0 x
	bz $.BB@LABEL@13_24
.BB@LABEL@13_23:	; if_break_bb218
	;***      426 : 			break;
	;***      427 : 		}
	;***      428 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 428
	call $!_UpdateMachineStatus
	;***      429 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 429
	call !!_R_WDT_Restart
	br $!.BB@LABEL@13_5
.BB@LABEL@13_24:	; return
	;***      430 : 	}
	;***      431 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 431
	addw sp, #0x0A
	ret
_WaterSupplyOperation_nostop:
	.STACK _WaterSupplyOperation_nostop = 14
	;***      432 : ///**
	;***      433 : // * FlowSensorCheck
	;***      434 : // * 30/11/2021: Checked!
	;***      435 : // * @return 0 is Error, 1 is OK, 2 Still taking
	;***      436 : // */
	;***      437 : //uint8_t FlowSensorCheck(uint32_t *_time) {
	;***      438 : ////	g_flow_value = measureFlowSensor();
	;***      439 : //	if ((g_flow_value < g_numberSetting.upperFlow)
	;***      440 : //			& (g_flow_value > g_numberSetting.lowerFlow)) {
	;***      441 : //		return 1;
	;***      442 : //	} else {
	;***      443 : //		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      444 : //		return 0;
	;***      445 : //	}
	;***      446 : //}
	;***      447 : /**
	;***      448 :  * WaterSupplyOperation
	;***      449 :  * 30/11/2021: Checked by An
	;***      450 :  */
	;***      451 : uint8_t WaterSupplyOperation_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 451
	subw sp, #0x06
	;***      452 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      453 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      454 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 454
	mov b, !LOWW(_g_machine_state+0x00004)
	mov a, b
	mov [sp+0x02], a
	cmp0 b
	bz $.BB@LABEL@14_8
.BB@LABEL@14_1:	; entry
	mov a, b
	dec a
	bz $.BB@LABEL@14_9
.BB@LABEL@14_2:	; entry
	dec a
	bz $.BB@LABEL@14_10
.BB@LABEL@14_3:	; entry
	dec a
	bz $.BB@LABEL@14_12
.BB@LABEL@14_4:	; entry
	dec a
	bz $.BB@LABEL@14_16
.BB@LABEL@14_5:	; entry
	dec a
	bz $.BB@LABEL@14_17
.BB@LABEL@14_6:	; entry
	dec a
	.bz $!.BB@LABEL@14_23
.BB@LABEL@14_7:	; switch_clause_bb81
	;***      455 : 	case 0:
	;***      456 : 		*tick = g_systemTime;
	;***      457 : 		(*state)++;
	;***      458 : 		break;
	;***      459 : 	case 1:
	;***      460 : 		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
	;***      461 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 30000)) {
	;***      462 : 			(*state)++;
	;***      463 : 		}
	;***      464 : 		break;
	;***      465 : 	case 2:
	;***      466 : 		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      467 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 500)) {
	;***      468 : 			(*state)++;
	;***      469 : 			g_Tick.tickFlowMeasurment = g_systemTime;
	;***      470 : 		}
	;***      471 : 		break;
	;***      472 : 	case 3:
	;***      473 : 		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      474 : //			nostop_measureFlowSensor();
	;***      475 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 15000)) {
	;***      476 : 			(*state)++;
	;***      477 : 		}
	;***      478 : 		measureFlowSensor_nostop();
	;***      479 : 		break;
	;***      480 : 	case 4:
	;***      481 : 		measureFlowSensor();
	;***      482 : 		(*state)++;
	;***      483 : 		break;
	;***      484 : 	case 5:
	;***      485 : 		if((g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) || (g_io_status.refined.FlowValue > g_numberSetting.upperFlow)){
	;***      486 : 			(*state) = 3;
	;***      487 : 			sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, g_io_status.refined.FlowValue);
	;***      488 : 		}else
	;***      489 : 			(*state)++;
	;***      490 : 		g_Tick.tickWaterSupply = g_systemTime;
	;***      491 : 		break;
	;***      492 : 	case 6:
	;***      493 : 		if(ns_delay_ms(&g_Tick.tickWaterSupply, g_timerSetting.t4_electrolysisOperationStart_s*1000)){
	;***      494 : 			(*state)++;
	;***      495 : 		}
	;***      496 : 		break;
	;***      497 : 	default:
	;***      498 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 498
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@14_15
.BB@LABEL@14_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 456
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 457
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@14_15
.BB@LABEL@14_9:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 460
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 461
	clrw ax
	movw de, ax
	movw bc, #0x7530
	br $!.BB@LABEL@14_24
.BB@LABEL@14_10:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 466
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 467
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick@1+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@14_15
.BB@LABEL@14_11:	; if_then_bb22
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 468
	inc !LOWW(_g_machine_state+0x00004)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 469
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00026), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00024), ax
	br $.BB@LABEL@14_15
.BB@LABEL@14_12:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 473
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 475
	clrw ax
	movw de, ax
	movw bc, #0x3A98
	movw ax, #LOWW(_g_Tick@1+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@14_13:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 476
	inc !LOWW(_g_machine_state+0x00004)
.BB@LABEL@14_14:	; if_break_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 478
	call $!_measureFlowSensor_nostop
.BB@LABEL@14_15:	; if_break_bb38
	br $.BB@LABEL@14_22
.BB@LABEL@14_16:	; switch_clause_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 481
	call $!_measureFlowSensor
	br $.BB@LABEL@14_25
.BB@LABEL@14_17:	; switch_clause_bb45
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 485
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
	bnz $.BB@LABEL@14_20
.BB@LABEL@14_18:	; bb
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
	bnz $.BB@LABEL@14_20
.BB@LABEL@14_19:	; if_else_bb
	mov a, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 489
	inc a
	mov !LOWW(_g_machine_state+0x00004), a
	br $.BB@LABEL@14_21
.BB@LABEL@14_20:	; if_then_bb61
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 486
	mov !LOWW(_g_machine_state+0x00004), #0x03
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 487
	movw ax, #0x4104
	call $!_sendToRasPi
.BB@LABEL@14_21:	; if_break_bb67
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 490
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00020), ax
.BB@LABEL@14_22:	; if_break_bb67
	br $.BB@LABEL@14_26
.BB@LABEL@14_23:	; switch_clause_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 493
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
.BB@LABEL@14_24:	; switch_clause_bb69
	movw ax, #LOWW(_g_Tick@1+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@14_25:	; if_then_bb76
	inc !LOWW(_g_machine_state+0x00004)
.BB@LABEL@14_26:	; switch_break_bb
	;***      499 : 		break;
	;***      500 : 	}
	;***      501 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 501
	call !!_R_WDT_Restart
	;***      502 : 	return *state == 6 + 1 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 502
	cmp !LOWW(_g_machine_state+0x00004), #0x07
	oneb a
	sknz
.BB@LABEL@14_27:	; switch_break_bb
	clrb a
.BB@LABEL@14_28:	; switch_break_bb
	addw sp, #0x06
	ret
_stop_waitAlarmConfirm:
	.STACK _stop_waitAlarmConfirm = 6
	;***      503 : }
	;***      504 : void stop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 504
	push hl
	mov [sp+0x00], a
.BB@LABEL@15_1:	; bb2
	pop ax
	push ax
	;***      505 : 	while ((g_rx_data[0] != H_CLEAR) & (g_rx_data[1] != alarm)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 505
	mov a, !LOWW(_g_rx_data+0x00001)
	cmp a, x
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@15_4
.BB@LABEL@15_2:	; bb2
	cmp a, #0x43
	bz $.BB@LABEL@15_4
.BB@LABEL@15_3:	; bb
	;***      506 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 506
	call !!_R_WDT_Restart
	br $.BB@LABEL@15_1
.BB@LABEL@15_4:	; bb15
	;***      507 : 	}
	;***      508 : 	g_rx_data[0] = g_rx_data[1] = OK_ALL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 508
	clrb !LOWW(_g_rx_data+0x00001)
	clrb !LOWW(_g_rx_data)
	pop hl
	ret
_nostop_waitAlarmConfirm:
	.STACK _nostop_waitAlarmConfirm = 4
	;***      509 : }
	;***      510 : uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 510
	mov x, !LOWW(_g_rx_data+0x00001)
	;***      511 : 	if ((g_rx_data[0] != H_CLEAR) & (g_rx_data[1] != alarm)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 511
	cmp x, a
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@16_3
.BB@LABEL@16_1:	; entry
	cmp a, #0x43
	bz $.BB@LABEL@16_3
.BB@LABEL@16_2:	; bb17
	;***      512 : 		return 1;
	;***      513 : 	}
	;***      514 : 	g_rx_data[0] = g_rx_data[1] = OK_ALL;
	;***      515 : 	return 0;
	;***      516 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 516
	oneb a
	ret
.BB@LABEL@16_3:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 514
	clrb !LOWW(_g_rx_data+0x00001)
	clrb !LOWW(_g_rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 515
	clrb a
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      517 : /**
	;***      518 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      519 :  * 30/11/2021: Checked by An
	;***      520 :  * @return 0 - OK; 1 - Error
	;***      521 :  */
	;***      522 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 522
	subw sp, #0x0A
	;***      523 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 523
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
	;***      524 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
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
	movw ax, #LOWW(_g_Tick@1+0x0002C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@17_8
.BB@LABEL@17_6:	; bb33
	clrb a
.BB@LABEL@17_7:	; bb33
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 538
	ret
.BB@LABEL@17_8:	; if_then_bb11
	;***      525 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      526 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 526
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      527 : 					(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      528 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 528
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00040), ax
.BB@LABEL@17_9:	; bb16
	;***      529 : 			while(electrolyticOperationOFF());
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 529
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@17_9
.BB@LABEL@17_10:	; bb22
	;***      530 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 530
	set1 !LOWW(_g_alarm).0
	;***      531 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 531
	mov a, #0x05
	call $!_stop_waitAlarmConfirm
	;***      532 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 532
	clr1 !LOWW(_g_alarm).0
	;***      533 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 533
	oneb a
	br $.BB@LABEL@17_7
.BB@LABEL@17_11:	; if_else_bb
	;***      534 : 		}
	;***      535 : 	} else
	;***      536 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 536
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0002C), ax
	br $.BB@LABEL@17_6
_Voltage2Check_loop:
	.STACK _Voltage2Check_loop = 18
	;***      537 : 	return 0;
	;***      538 : }
	;***      539 : /**
	;***      540 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      541 :  * 16/12/2021: Checked by An
	;***      542 :  * @return 0 - OK
	;***      543 :  */
	;***      544 : void Voltage2Check_loop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	subw sp, #0x0A
	;***      545 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 545
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
	;***      546 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 546
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
	movw ax, #LOWW(_g_Tick@1+0x00030)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@18_7
.BB@LABEL@18_6:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 556
	ret
.BB@LABEL@18_7:	; if_then_bb10
	;***      547 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      548 : 			g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 548
	set1 !LOWW(_g_alarm).1
	;***      549 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 549
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4106
	addw sp, #0x0A
	br $!_sendToRasPi
.BB@LABEL@18_8:	; if_else_bb
	;***      550 : 					g_io_status.refined.CVCCVoltage);
	;***      551 : 		}
	;***      552 : 	} else {
	;***      553 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 553
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00030), ax
	;***      554 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 554
	clr1 !LOWW(_g_alarm).1
	br $.BB@LABEL@18_6
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      555 : 	}
	;***      556 : }
	;***      557 : /**
	;***      558 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      559 :  * 16/12/2021: Checked by An
	;***      560 :  * @return 0 - OK; 1 - Error
	;***      561 :  */
	;***      562 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 562
	subw sp, #0x0A
	;***      563 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 563
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
	bnz $.BB@LABEL@19_9
.BB@LABEL@19_5:	; if_then_bb
	;***      564 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 564
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
	movw ax, #LOWW(_g_Tick@1+0x00034)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@19_8
.BB@LABEL@19_6:	; bb24
	clrb a
.BB@LABEL@19_7:	; bb24
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 577
	ret
.BB@LABEL@19_8:	; if_then_bb11
	;***      565 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      566 : 			g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 566
	set1 !LOWW(_g_alarm).2
	;***      567 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 567
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      568 : 					(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      569 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_3);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 569
	mov a, #0x07
	call $!_stop_waitAlarmConfirm
	;***      570 : 			g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 570
	clr1 !LOWW(_g_alarm).2
	;***      571 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 571
	oneb a
	br $.BB@LABEL@19_7
.BB@LABEL@19_9:	; if_else_bb
	;***      572 : 		}
	;***      573 : 	} else {
	;***      574 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 574
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00034), ax
	br $.BB@LABEL@19_6
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      575 : 	}
	;***      576 : 	return 0;
	;***      577 : }
	;***      578 : /**
	;***      579 :  * Checked 16/12/2021
	;***      580 :  * @return
	;***      581 :  */
	;***      582 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 582
	subw sp, #0x0A
	;***      583 : 	if ((g_systemTime - g_TickKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 583
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
	subw ax, !LOWW(_g_TickKeeper@2+0x00010)
	movw hl, ax
	movw ax, [sp+0x00]
	sknc
.BB@LABEL@20_1:	; entry
	decw ax
.BB@LABEL@20_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@2+0x00012)
	cmpw ax, bc
	movw ax, hl
	sknz
.BB@LABEL@20_3:	; entry
	cmpw ax, de
.BB@LABEL@20_4:	; entry
	.bc $!.BB@LABEL@20_16
.BB@LABEL@20_5:	; if_then_bb
	;***      584 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      585 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 585
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
	;***      586 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 586
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
	movw ax, #LOWW(_g_Tick@1+0x00038)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@20_13
.BB@LABEL@20_11:	; bb45
	clrb a
.BB@LABEL@20_12:	; bb45
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 602
	ret
.BB@LABEL@20_13:	; if_then_bb20
	;***      587 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      588 : 				g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 588
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00040), ax
.BB@LABEL@20_14:	; bb22
	;***      589 : 				while(electrolyticOperationOFF());
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 589
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@20_14
.BB@LABEL@20_15:	; bb28
	;***      590 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 590
	set1 !LOWW(_g_alarm).5
	;***      591 : 				sendToRasPi(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 591
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4108
	call $!_sendToRasPi
	;***      592 : 						(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      593 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 593
	mov a, #0x08
	call $!_stop_waitAlarmConfirm
	;***      594 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 594
	clr1 !LOWW(_g_alarm).5
	;***      595 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 595
	oneb a
	br $.BB@LABEL@20_12
.BB@LABEL@20_16:	; if_else_bb
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00038), ax
	br $.BB@LABEL@20_11
_OverCurrentCheck_waitReset:
	.STACK _OverCurrentCheck_waitReset = 18
	;***      596 : 			}
	;***      597 : 		} else
	;***      598 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      599 : 	} else
	;***      600 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      601 : 	return 0;
	;***      602 : }
	;***      603 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 603
	subw sp, #0x0A
	;***      604 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 604
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      605 : 	const uint16_t _max_time = 60000;
	;***      606 : 	if (g_systemTime - g_TickKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 606
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TickKeeper@2+0x00010)
	movw de, ax
	movw ax, bc
	sknc
.BB@LABEL@21_1:	; entry
	decw ax
.BB@LABEL@21_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@2+0x00012)
	clrw bc
	cmpw ax, bc
	movw ax, de
	sknz
.BB@LABEL@21_3:	; entry
	cmpw ax, #0x1388
.BB@LABEL@21_4:	; entry
	.bc $!.BB@LABEL@21_28
.BB@LABEL@21_5:	; if_then_bb
	;***      607 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 607
	movw ax, !LOWW(_g_numberSetting+0x00012)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	push ax
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_io_status+0x0000E)
	movw [sp+0x06], ax
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	movw bc, !LOWW(_g_numberSetting+0x00016)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x06], ax
	bnz $.BB@LABEL@21_11
.BB@LABEL@21_6:	; if_then_bb
	push bc
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
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@21_7:	; if_then_bb
	clrb a
.BB@LABEL@21_8:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@21_9:	; if_then_bb
	clrb x
.BB@LABEL@21_10:	; if_then_bb
	or x, a
	.bnz $!.BB@LABEL@21_28
.BB@LABEL@21_11:	; if_then_bb21
	mov a, #0x48
	;***      608 : 				| (g_io_status.refined.CVCCCurrent
	;***      609 : 						>= g_numberSetting.upperCurrent)) {
	;***      610 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 610
	and a, !LOWW(_g_alarm)
	bnz $.BB@LABEL@21_19
.BB@LABEL@21_12:	; if_then_bb38
	pop bc
	push bc
	movw ax, [sp+0x02]
	;***      611 : 					& (g_alarm.refined.overCurrent == 0)) {
	;***      612 : 				sendToRasPi(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 612
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4109
	call $!_sendToRasPi
	;***      613 : 						(uint32_t) (g_io_status.refined.CVCCCurrent));
	;***      614 : 				g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 614
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
.BB@LABEL@21_13:	; if_then_bb38
	clrb a
.BB@LABEL@21_14:	; if_then_bb38
	cmp0 x
	oneb x
	sknz
.BB@LABEL@21_15:	; if_then_bb38
	clrb x
.BB@LABEL@21_16:	; if_then_bb38
	or x, a
	mov x, #0x40
	skz
.BB@LABEL@21_17:	; bb46
	clrb x
.BB@LABEL@21_18:	; bb47
	mov a, #0xBF
	and a, !LOWW(_g_alarm)
	or a, x
	mov !LOWW(_g_alarm), a
.BB@LABEL@21_19:	; if_break_bb
	;***      615 : 						g_io_status.refined.CVCCCurrent
	;***      616 : 								<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      617 : 			}
	;***      618 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 618
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
.BB@LABEL@21_20:	; if_break_bb
	clrb a
.BB@LABEL@21_21:	; if_break_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@21_22:	; if_break_bb
	clrb x
.BB@LABEL@21_23:	; if_break_bb
	or x, a
	bnz $.BB@LABEL@21_27
.BB@LABEL@21_24:	; if_then_bb61
	;***      619 : 					>= g_numberSetting.upperCurrent) {
	;***      620 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 620
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick@1+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@21_26
.BB@LABEL@21_25:	; if_break_bb79
	;***      621 : 					g_alarm.refined.overCurrent = 1;
	;***      622 : 					sendToRasPi(H_ALARM, OVER_CURRENT,
	;***      623 : 							(uint32_t) (g_io_status.refined.CVCCCurrent));
	;***      624 : 					stop_waitAlarmConfirm(OVER_CURRENT);
	;***      625 : 					g_alarm.refined.overCurrent = 0;
	;***      626 : 					return 1;
	;***      627 : 				}
	;***      628 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 628
	call !!_R_WDT_Restart
	br $.BB@LABEL@21_28
.BB@LABEL@21_26:	; if_then_bb68
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 621
	set1 !LOWW(_g_alarm).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 622
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, !LOWW(_g_io_status+0x0000E)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x410A
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 624
	mov a, #0x0A
	call $!_stop_waitAlarmConfirm
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 625
	clr1 !LOWW(_g_alarm).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 626
	oneb a
	br $.BB@LABEL@21_29
.BB@LABEL@21_27:	; if_else_bb
	;***      629 : 			} else
	;***      630 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 630
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0003C), ax
.BB@LABEL@21_28:	; bb85
	clrb a
.BB@LABEL@21_29:	; bb85
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 634
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@22_1:	; WAIT_RESET
	call $!_electrolyticOperationON
.BB@LABEL@22_2:	; bb
	;***      631 : 		}
	;***      632 : 	}
	;***      633 : 	return 0;
	;***      634 : }
	;***      635 : void ElectrolyticOperation(void) {
	;***      636 : 	WAIT_RESET: electrolyticOperationON();
	;***      637 : 	do {
	;***      638 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 638
	call $!_RaspberryResponse_nostop
	;***      639 : 		if (Voltage1Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 639
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@22_1
.BB@LABEL@22_3:	; if_break_bb
	;***      640 : 			goto WAIT_RESET;
	;***      641 : 		Voltage2Check_loop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 641
	call $!_Voltage2Check_loop
	;***      642 : 		if (Voltage3Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 642
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@22_1
.BB@LABEL@22_4:	; if_break_bb12
	;***      643 : 			goto WAIT_RESET;
	;***      644 : 		if (LowVoltageCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 644
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@22_1
.BB@LABEL@22_5:	; if_break_bb20
	;***      645 : 			goto WAIT_RESET;
	;***      646 : 		if (OverCurrentCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 646
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@22_1
.BB@LABEL@22_6:	; if_break_bb28
	;***      647 : 			goto WAIT_RESET;
	;***      648 : 		//----------CVCC Alarm Input-----------------
	;***      649 : 		if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 649
	mov a, 0xFFF00
	bf a.4, $.BB@LABEL@22_11
.BB@LABEL@22_7:	; if_break_bb53
	;***      650 : 			g_alarm.refined.cvcc = 1;
	;***      651 : 			g_Tick.tickElectrolyticOff = g_systemTime;
	;***      652 : 			while(electrolyticOperationOFF());
	;***      653 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	;***      654 : 			stop_waitAlarmConfirm(CVCC_ALARM);
	;***      655 : 			g_alarm.refined.cvcc = 0;
	;***      656 : 			goto WAIT_RESET;
	;***      657 : 		}
	;***      658 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 658
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 637
	mov a, 0xFFF07
	shr a, 0x03
	or a, 0xFFF07
	bt a.0, $.BB@LABEL@22_2
.BB@LABEL@22_8:	; bb71
	;***      659 : 	} while ((I_ACID_H_PIN == I_OFF) | (I_ALKALI_H_PIN == I_OFF));
	;***      660 : 	g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 660
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00040), ax
.BB@LABEL@22_9:	; bb74
	;***      661 : 	while(electrolyticOperationOFF());
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 661
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@22_9
.BB@LABEL@22_10:	; return
	;***      662 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 662
	ret
.BB@LABEL@22_11:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 650
	set1 !LOWW(_g_alarm+0x00001).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 651
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00040), ax
.BB@LABEL@22_12:	; bb42
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 652
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@22_12
.BB@LABEL@22_13:	; bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 653
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 654
	mov a, #0x12
	call $!_stop_waitAlarmConfirm
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 655
	clr1 !LOWW(_g_alarm+0x00001).0
	br $.BB@LABEL@22_1
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      663 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 663
	subw sp, #0x04
	;***      664 : 	uint32_t _time_count = 0;
	;***      665 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 665
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
	;***      666 : 			& (_time_count
	;***      667 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      668 : 		_time_count++;
	;***      669 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 669
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@23_5:	; if_break_bb
	;***      670 : 	}
	;***      671 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 671
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
	;***      672 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 672
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi
.BB@LABEL@23_9:	; return
	;***      673 : 	}
	;***      674 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 674
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      675 : void saltWaterTankFullCheck(void) {
	;***      676 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 676
	mov a, 0xFFF05
	bf a.3, $.BB@LABEL@24_3
.BB@LABEL@24_1:	; if_then_bb
	;***      677 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 677
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi
	;***      678 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 678
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00040), ax
.BB@LABEL@24_2:	; bb7
	;***      679 : 		while(electrolyticOperationOFF());
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 679
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@24_2
.BB@LABEL@24_3:	; return
	;***      680 : 		//TODO: Fault in the flowchart
	;***      681 : 	}
	;***      682 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 682
	ret
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      683 : void saltWaterTankEmptyCheck(void) {
	;***      684 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 684
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@25_2
.BB@LABEL@25_1:	; if_then_bb
	;***      685 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 685
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi
.BB@LABEL@25_2:	; return
	;***      686 : 		//TODO: Control OFF
	;***      687 : 	}
	;***      688 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 688
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      689 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 689
	movw de, #0xFF07
	;***      690 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 690
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
	;***      691 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      692 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      693 : 		//TODO: Control OFF
	;***      694 : 	}
	;***      695 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 695
	ret
.BB@LABEL@26_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 692
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      696 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 696
	push hl
	;***      697 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 697
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
	;***      698 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      699 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      700 : 		//TODO: Control OFF
	;***      701 : 	}
	;***      702 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 702
	ret
.BB@LABEL@27_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 699
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      703 : 
	;***      704 : uint8_t FilterReplacementCheck(void) {
	;***      705 : 
	;***      706 : 	return 0;
	;***      707 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 707
	clrb a
	ret
_ElectrolyzeWaterGeneration:
	.STACK _ElectrolyzeWaterGeneration = 4
	;***      708 : void ElectrolyzeWaterGeneration(void) {
	;***      709 : 	if ((I_ACID_L_PIN == I_OFF) | (I_ALKALI_L_PIN = I_OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 709
	mov a, 0xFFF07
	set1 0xFFF00.5
	shr a, 0x01
	mov x, a
	mov a, 0xFFF00
	shr a, 0x05
	or a, x
	bt a.0, $.BB@LABEL@29_5
.BB@LABEL@29_1:	; if_else_bb
	movw hl, #0xFF07
	;***      710 : 		g_machine_state.mode = ELECTROLYTIC_GENERATION;
	;***      711 : 		electrolyticOperationON();
	;***      712 : 	} else if ((I_ACID_H_PIN = I_ON) & (I_ALKALI_H_PIN = I_ON)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 712
	clr1 [hl].3
	mov a, [hl]
	clr1 [hl].0
	shr a, 0x03
	and a, [hl]
	bf a.0, $.BB@LABEL@29_4
.BB@LABEL@29_2:	; if_then_bb26
	;***      713 : 		g_machine_state.mode = pre_machine_mode;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 713
	mov a, !LOWW(_pre_machine_mode@3)
	mov !LOWW(_g_machine_state+0x00007), a
	;***      714 : 		g_Tick.tickElectrolyticOff = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 714
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00040), ax
.BB@LABEL@29_3:	; bb29
	;***      715 : 		while(electrolyticOperationOFF());
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 715
	call $!_electrolyticOperationOFF
	cmp0 a
	bnz $.BB@LABEL@29_3
.BB@LABEL@29_4:	; return
	;***      716 : 	}
	;***      717 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 717
	ret
.BB@LABEL@29_5:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 710
	mov !LOWW(_g_machine_state+0x00007), #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 711
	br $!_electrolyticOperationON
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      718 : /**
	;***      719 :  * Tested: 10/12/2021 by Mr.An
	;***      720 :  */
	;***      721 : void WaterWashingMode_nostop(void) {
	;***      722 : 	uint8_t *state = &g_machine_state.water;
	;***      723 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      724 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 724
	mov a, !LOWW(_g_machine_state+0x00002)
	cmp0 a
	bz $.BB@LABEL@30_3
.BB@LABEL@30_1:	; entry
	dec a
	bz $.BB@LABEL@30_4
.BB@LABEL@30_2:	; switch_clause_bb20
	;***      725 : 	case 0:
	;***      726 : 		g_machine_state.mode = WATER_WASHING;
	;***      727 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      728 : 		g_color = WHITE;
	;***      729 : 		*tick = g_systemTime;
	;***      730 : 		(*state)++;
	;***      731 : 		handSensorLED(g_color);
	;***      732 : 		break;
	;***      733 : 	case 1:
	;***      734 : 		if (DETECT_U == I_ON) {
	;***      735 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      736 : 			g_color = BLACK;
	;***      737 : 			(*state) = 0;
	;***      738 : 			g_machine_state.mode = BUSY;
	;***      739 : 			handSensorLED(g_color);
	;***      740 : 		}
	;***      741 : 		break;
	;***      742 : 	default:
	;***      743 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 743
	clrb !LOWW(_g_machine_state+0x00002)
	ret
.BB@LABEL@30_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 726
	mov !LOWW(_g_machine_state+0x00007), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 727
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 728
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 729
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 730
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 731
	mov a, #0x02
	br $.BB@LABEL@30_6
.BB@LABEL@30_4:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 734
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@30_7
.BB@LABEL@30_5:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 735
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 736
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 737
	clrb !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 738
	mov !LOWW(_g_machine_state+0x00007), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 739
	clrb a
.BB@LABEL@30_6:	; if_then_bb
	br $!_handSensorLED
.BB@LABEL@30_7:	; return
	;***      744 : 		break;
	;***      745 : 	}
	;***      746 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 746
	ret
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 10
	;***      747 : 
	;***      748 : /**
	;***      749 :  * Tested: 10/12/2021 by Mr.An
	;***      750 :  */
	;***      751 : void HandWashingMode_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 751
	subw sp, #0x04
	;***      752 : 	uint8_t *state = &g_machine_state.handwash;
	;***      753 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      754 : 	const uint32_t delayPump_ms = 50;
	;***      755 : 	g_timerSetting.t54_overLapTime_ms = g_timerSetting.t54_overLapTime_ms < delayPump_ms ? delayPump_ms:g_timerSetting.t54_overLapTime_ms;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 755
	movw ax, !LOWW(_g_timerSetting+0x00076)
	movw [sp+0x00], ax
	clrw bc
	cmpw ax, bc
	movw ax, !LOWW(_g_timerSetting+0x00074)
	movw [sp+0x02], ax
	sknz
.BB@LABEL@31_1:	; entry
	cmpw ax, #0x0032
.BB@LABEL@31_2:	; entry
	bnc $.BB@LABEL@31_4
.BB@LABEL@31_3:	; entry.bb16_crit_edge
	clrw ax
	movw [sp+0x00], ax
	mov x, #0x32
	br $.BB@LABEL@31_8
.BB@LABEL@31_4:	; bb10
	movw ax, [sp+0x00]
	;***      756 : 	g_timerSetting.t54_overLapTime_ms = g_timerSetting.t54_overLapTime_ms > 1000 ? 1000:g_timerSetting.t54_overLapTime_ms;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 756
	cmpw ax, bc
	movw ax, [sp+0x02]
	sknz
.BB@LABEL@31_5:	; bb10
	cmpw ax, #0x03E9
.BB@LABEL@31_6:	; bb10
	bc $.BB@LABEL@31_9
.BB@LABEL@31_7:	; bb10.bb19_crit_edge
	clrw ax
	movw [sp+0x00], ax
	movw ax, #0x03E8
.BB@LABEL@31_8:	; bb10.bb19_crit_edge
	movw [sp+0x02], ax
.BB@LABEL@31_9:	; bb19
	movw !LOWW(_g_timerSetting+0x00074), ax
	movw ax, [sp+0x00]
	movw !LOWW(_g_timerSetting+0x00076), ax
	;***      757 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 757
	mov a, !LOWW(_g_machine_state+0x00003)
	cmp0 a
	bz $.BB@LABEL@31_18
.BB@LABEL@31_10:	; bb19
	dec a
	bz $.BB@LABEL@31_20
.BB@LABEL@31_11:	; bb19
	dec a
	bz $.BB@LABEL@31_22
.BB@LABEL@31_12:	; bb19
	dec a
	.bz $!.BB@LABEL@31_26
.BB@LABEL@31_13:	; bb19
	dec a
	.bz $!.BB@LABEL@31_30
.BB@LABEL@31_14:	; bb19
	dec a
	.bz $!.BB@LABEL@31_36
.BB@LABEL@31_15:	; bb19
	dec a
	.bz $!.BB@LABEL@31_41
.BB@LABEL@31_16:	; bb19
	dec a
	.bz $!.BB@LABEL@31_44
.BB@LABEL@31_17:	; switch_clause_bb117
	;***      758 : 	case 0:
	;***      759 : 		*state = 1;
	;***      760 : 		*tick = g_systemTime;
	;***      761 : 		break;
	;***      762 : 	case 1:
	;***      763 : 		g_machine_state.mode = HAND_WASHING;
	;***      764 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      765 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      766 : 			O_PUMP_ALK_PIN = ON;
	;***      767 : 			handSensorLED(BLUE);
	;***      768 : 			(*state)++;
	;***      769 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      770 : 		}
	;***      771 : 		break;
	;***      772 : 	case 2:
	;***      773 : 		if (ns_delay_ms(tick,
	;***      774 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      775 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      776 : 			O_PUMP_ALK_PIN = OFF;
	;***      777 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      778 : 			(*state)++;
	;***      779 : 		}
	;***      780 : 		break;
	;***      781 : 	case 3:
	;***      782 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      783 : 			O_PUMP_ACID_PIN = ON;
	;***      784 : 			handSensorLED(RED);
	;***      785 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      786 : 			(*state)++;
	;***      787 : 		}
	;***      788 : 		break;
	;***      789 : 	case 4:
	;***      790 : 		if (ns_delay_ms(tick,
	;***      791 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      792 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      793 : 			(*state)++;
	;***      794 : 		}
	;***      795 : 		break;
	;***      796 : 	case 5:
	;***      797 : 		if (ns_delay_ms(tick,
	;***      798 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      799 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      800 : 			O_PUMP_ACID_PIN = OFF;
	;***      801 : 			handSensorLED(WHITE);
	;***      802 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      803 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      804 : 			(*state)++;
	;***      805 : 		}
	;***      806 : 		break;
	;***      807 : 	case 6:
	;***      808 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      809 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      810 : 			(*state)++;
	;***      811 : 		}
	;***      812 : 		break;
	;***      813 : 	case 7:
	;***      814 : 		if (ns_delay_ms(tick,
	;***      815 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      816 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      817 : 			handSensorLED(BLACK);
	;***      818 : 			(*state) = 0;
	;***      819 : 			g_machine_state.mode = BUSY;
	;***      820 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      821 : 			g_machine_state.user = 0;
	;***      822 : 		}
	;***      823 : 		break;
	;***      824 : 	default:
	;***      825 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 825
	clrb !LOWW(_g_machine_state+0x00003)
	br $.BB@LABEL@31_19
.BB@LABEL@31_18:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 759
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 760
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0001C), ax
.BB@LABEL@31_19:	; switch_clause_bb
	br $!.BB@LABEL@31_46
.BB@LABEL@31_20:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 763
	oneb !LOWW(_g_machine_state+0x00007)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 764
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 765
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@31_27
.BB@LABEL@31_21:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 766
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 767
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 768
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 769
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	addw sp, #0x04
	br $!_sendToRasPi
.BB@LABEL@31_22:	; switch_clause_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 773
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
.BB@LABEL@31_23:	; switch_clause_bb38
	decw ax
.BB@LABEL@31_24:	; switch_clause_bb38
	subw ax, de
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@31_35
.BB@LABEL@31_25:	; if_then_bb48
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 776
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 777
	set1 0xFFF07.6
	br $.BB@LABEL@31_34
.BB@LABEL@31_26:	; switch_clause_bb53
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 782
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@31_27:	; switch_clause_bb53
	bz $.BB@LABEL@31_39
.BB@LABEL@31_28:	; if_then_bb60
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 783
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 784
	oneb a
	call $!_handSensorLED
.BB@LABEL@31_29:	; if_then_bb60
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	br $.BB@LABEL@31_34
.BB@LABEL@31_30:	; switch_clause_bb65
	movw ax, [sp+0x02]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 790
	addw ax, #0xFFCE
	movw bc, ax
	pop de
	push de
	skc
.BB@LABEL@31_31:	; switch_clause_bb65
	decw de
.BB@LABEL@31_32:	; switch_clause_bb65
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@31_42
.BB@LABEL@31_33:	; if_then_bb74
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 792
	clr1 0xFFF07.7
.BB@LABEL@31_34:	; if_then_bb74
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@31_35:	; if_then_bb74
	br $!.BB@LABEL@31_46
.BB@LABEL@31_36:	; switch_clause_bb79
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 797
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
.BB@LABEL@31_37:	; switch_clause_bb79
	decw ax
.BB@LABEL@31_38:	; switch_clause_bb79
	subw ax, de
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@31_39:	; switch_clause_bb79
	bz $.BB@LABEL@31_46
.BB@LABEL@31_40:	; if_then_bb89
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 800
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 801
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 802
	set1 0xFFF05.5
	br $.BB@LABEL@31_29
.BB@LABEL@31_41:	; switch_clause_bb94
	movw ax, [sp+0x02]
	movw bc, ax
	pop de
	push de
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 808
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@31_42:	; switch_clause_bb94
	bz $.BB@LABEL@31_46
.BB@LABEL@31_43:	; if_then_bb101
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 809
	clr1 0xFFF07.6
	br $.BB@LABEL@31_34
.BB@LABEL@31_44:	; switch_clause_bb106
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 814
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
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@31_46
.BB@LABEL@31_45:	; if_then_bb114
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 816
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 817
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 818
	clrb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 819
	mov !LOWW(_g_machine_state+0x00007), #0x07
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 820
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 821
	clrb !LOWW(_g_machine_state+0x00006)
.BB@LABEL@31_46:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 829
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      826 : 		break;
	;***      827 : 	}
	;***      828 : 
	;***      829 : }
	;***      830 : /**
	;***      831 :  * Tested: 10/12/2021 by Mr.An
	;***      832 :  */
	;***      833 : void AcidWaterMode_nostop(void) {
	;***      834 : 	uint8_t *state = &g_machine_state.acid;
	;***      835 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      836 : 	const uint32_t delayPump_ms = 50;
	;***      837 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 837
	mov a, !LOWW(_g_machine_state+0x00001)
	cmp0 a
	bz $.BB@LABEL@32_5
.BB@LABEL@32_1:	; entry
	dec a
	bz $.BB@LABEL@32_6
.BB@LABEL@32_2:	; entry
	dec a
	bz $.BB@LABEL@32_8
.BB@LABEL@32_3:	; entry
	dec a
	bz $.BB@LABEL@32_12
.BB@LABEL@32_4:	; switch_clause_bb57
	;***      838 : 	case 0:
	;***      839 : //		*state = DETECT_U == I_ON ? 1 : 0;
	;***      840 : 		*state = 1;
	;***      841 : 		*tick = g_systemTime;
	;***      842 : 		break;
	;***      843 : 	case 1:
	;***      844 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      845 : 		g_color = RED;
	;***      846 : 		handSensorLED(g_color);
	;***      847 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      848 : 			O_PUMP_ACID_PIN = ON;
	;***      849 : 			(*state)++;
	;***      850 : 		}
	;***      851 : 		break;
	;***      852 : 	case 2:
	;***      853 : 		//TODO: Change turn OFF signal here
	;***      854 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      855 : 				|| (DETECT_D == I_ON)) {
	;***      856 : 			O_PUMP_ACID_PIN = OFF;
	;***      857 : 			(*state)++;
	;***      858 : 		}
	;***      859 : 		break;
	;***      860 : 	case 3:
	;***      861 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      862 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      863 : 			g_color = BLACK;
	;***      864 : 			handSensorLED(g_color);
	;***      865 : 			(*state)++;
	;***      866 : 		}
	;***      867 : 		break;
	;***      868 : 	default:
	;***      869 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 869
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@32_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 840
	oneb !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 841
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00014), ax
	ret
.BB@LABEL@32_6:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 844
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 845
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 846
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 847
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@32_14
.BB@LABEL@32_7:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 848
	set1 0xFFF06.2
	br $.BB@LABEL@32_11
.BB@LABEL@32_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 854
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
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@32_10
.BB@LABEL@32_9:	; bb
	mov a, 0xFFF07
	bt a.4, $.BB@LABEL@32_14
.BB@LABEL@32_10:	; if_then_bb39
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 856
	clr1 0xFFF06.2
.BB@LABEL@32_11:	; if_then_bb39
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 872
	ret
.BB@LABEL@32_12:	; switch_clause_bb44
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 861
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@32_14
.BB@LABEL@32_13:	; if_then_bb51
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 862
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 863
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 864
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@32_11
.BB@LABEL@32_14:	; return
	;***      870 : 		break;
	;***      871 : 	}
	;***      872 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 872
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      873 : /**
	;***      874 :  * Tested: 10/12/2021 by Mr.An
	;***      875 :  */
	;***      876 : void AlkalineWaterMode_nostop(void) {
	;***      877 : 	uint8_t *state = &g_machine_state.akaline;
	;***      878 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      879 : 	const uint32_t delayPump_ms = 50;
	;***      880 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 880
	mov a, !LOWW(_g_machine_state)
	cmp0 a
	bz $.BB@LABEL@33_5
.BB@LABEL@33_1:	; entry
	dec a
	bz $.BB@LABEL@33_8
.BB@LABEL@33_2:	; entry
	dec a
	bz $.BB@LABEL@33_10
.BB@LABEL@33_3:	; entry
	dec a
	.bz $!.BB@LABEL@33_13
.BB@LABEL@33_4:	; switch_clause_bb62
	;***      881 : 	case 0:
	;***      882 : 		*state = DETECT_U == I_ON ? 1 : 0;
	;***      883 : 		*tick = g_systemTime;
	;***      884 : 		break;
	;***      885 : 	case 1:
	;***      886 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      887 : 		g_color = BLUE;
	;***      888 : 		handSensorLED(g_color);
	;***      889 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      890 : 			O_PUMP_ALK_PIN = ON;
	;***      891 : 			(*state)++;
	;***      892 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      893 : 		}
	;***      894 : 		break;
	;***      895 : 	case 2:
	;***      896 : 		//TODO: Change turn OFF signal here
	;***      897 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***      898 : 				| (DETECT_D == I_ON)) {
	;***      899 : 			O_PUMP_ALK_PIN = OFF;
	;***      900 : 			(*state)++;
	;***      901 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      902 : 		}
	;***      903 : 		break;
	;***      904 : 	case 3:
	;***      905 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      906 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      907 : 			g_color = BLACK;
	;***      908 : 			handSensorLED(g_color);
	;***      909 : 			(*state)++;
	;***      910 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      911 : 		}
	;***      912 : 		break;
	;***      913 : 	default:
	;***      914 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 914
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@33_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 882
	mov a, 0xFFF07
	mov1 CY, a.5
	oneb a
	sknc
.BB@LABEL@33_6:	; bb13
	clrb a
.BB@LABEL@33_7:	; bb14
	mov !LOWW(_g_machine_state), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 883
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00010), ax
	ret
.BB@LABEL@33_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 886
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 887
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 888
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 889
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_15
.BB@LABEL@33_9:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 890
	set1 0xFFF06.1
	br $.BB@LABEL@33_12
.BB@LABEL@33_10:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 897
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
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	movw bc, ax
	mov a, 0xFFF07
	shr a, 0x04
	and a, #0x01
	xor a, #0x01
	shrw ax, 8+0x00000
	or a, b
	xch a, x
	or a, c
	xch a, x
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_15
.BB@LABEL@33_11:	; if_then_bb45
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 899
	clr1 0xFFF06.1
.BB@LABEL@33_12:	; if_then_bb45
	inc !LOWW(_g_machine_state)
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi
.BB@LABEL@33_13:	; switch_clause_bb50
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 905
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_15
.BB@LABEL@33_14:	; if_then_bb56
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 906
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 907
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 908
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@33_12
.BB@LABEL@33_15:	; return
	;***      915 : 		break;
	;***      916 : 	}
	;***      917 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 917
	ret
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***      918 : 
	;***      919 : void CallanCleaningMode_nostop(void) {
	;***      920 : 	if ((g_TickKeeper.SV1_OFF_minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 920
	movw de, !LOWW(_g_timerSetting+0x00086)
	movw bc, !LOWW(_g_timerSetting+0x00084)
	movw ax, !LOWW(_g_TickKeeper@2+0x0000E)
	cmpw ax, de
	movw ax, !LOWW(_g_TickKeeper@2+0x0000C)
	sknz
.BB@LABEL@34_1:	; entry
	cmpw ax, bc
.BB@LABEL@34_2:	; entry
	movw hl, !LOWW(_g_TickKeeper@2+0x00004)
	movw ax, !LOWW(_g_TickKeeper@2+0x00006)
	bc $.BB@LABEL@34_7
.BB@LABEL@34_3:	; entry
	cmpw ax, de
	movw ax, hl
	sknz
.BB@LABEL@34_4:	; entry
	cmpw ax, bc
.BB@LABEL@34_5:	; entry
	bc $.BB@LABEL@34_7
.BB@LABEL@34_6:	; if_then_bb
	;***      921 : 			>= g_timerSetting.t61_curranCleaningIntervalTime_h)
	;***      922 : 			& (g_TickKeeper.SV2_OFF_minutes
	;***      923 : 					>= g_timerSetting.t61_curranCleaningIntervalTime_h)) {
	;***      924 : 		g_callan_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 924
	oneb !LOWW(_g_callan_clear_flag@4)
	;***      925 : 		g_Tick.tickCustom[6] = g_Tick.tickCustom[7] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 925
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00082), ax
	movw !LOWW(_g_Tick@1+0x0007E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00080), ax
	movw !LOWW(_g_Tick@1+0x0007C), ax
	;***      926 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 926
	set1 0xFFF05.5
.BB@LABEL@34_7:	; if_break_bb
	;***      927 : 	}
	;***      928 : 	if (g_callan_clear_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 928
	cmp0 !LOWW(_g_callan_clear_flag@4)
	bz $.BB@LABEL@34_14
.BB@LABEL@34_8:	; if_then_bb18
	;***      929 : 		if (ns_delay_ms(&g_Tick.tickCustom[6], 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 929
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick@1+0x0007C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@34_12
.BB@LABEL@34_9:	; if_then_bb23
	;***      930 : 			g_color = g_color == WHITE ? BLACK : WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 930
	cmp !LOWW(_g_color), #0x02
	clrb a
	skz
.BB@LABEL@34_10:	; bb28
	mov a, #0x02
.BB@LABEL@34_11:	; bb29
	mov !LOWW(_g_color), a
	;***      931 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 931
	call $!_handSensorLED
.BB@LABEL@34_12:	; if_break_bb34
	;***      932 : 		}
	;***      933 : 		if (ns_delay_ms(&g_Tick.tickCustom[7],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 933
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
	movw ax, #LOWW(_g_Tick@1+0x00080)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@34_14
.BB@LABEL@34_13:	; if_then_bb41
	;***      934 : 				g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***      935 : 			g_callan_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 935
	clrb !LOWW(_g_callan_clear_flag@4)
	;***      936 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 936
	clr1 0xFFF05.5
	;***      937 : 			g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 937
	clrb !LOWW(_g_color)
	;***      938 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 938
	clrb a
	br $!_handSensorLED
.BB@LABEL@34_14:	; return
	;***      939 : 		}
	;***      940 : 	}
	;***      941 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 941
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***      942 : // Newest
	;***      943 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 943
	subw sp, #0x0A
	;***      944 : 
	;***      945 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 945
	call $!_UpdateMachineStatus
	;***      946 : 	InitialOperationModeStart(); //Worked!!;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 946
	call $!_InitialOperationModeStart
	;***      947 : 
	;***      948 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 948
	call $!_UpdateMachineStatus
.BB@LABEL@35_1:	; bb1
	;***      949 : 	while (WaterSupplyOperation_nostop()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 949
	call $!_WaterSupplyOperation_nostop
	cmp0 a
	bz $.BB@LABEL@35_3
.BB@LABEL@35_2:	; bb
	;***      950 : 		RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 950
	call $!_RaspberryResponse_nostop
	br $.BB@LABEL@35_1
.BB@LABEL@35_3:	; bb5
	;***      951 : 	}
	;***      952 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 952
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
.BB@LABEL@35_4:	; bb5
	clrb a
.BB@LABEL@35_5:	; bb5
	cmp0 x
	oneb x
	sknz
.BB@LABEL@35_6:	; bb5
	clrb x
.BB@LABEL@35_7:	; bb5
	or x, a
	bnz $.BB@LABEL@35_9
.BB@LABEL@35_8:	; if_then_bb
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	;***      953 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, g_io_status.refined.FlowValue);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 953
	movw ax, #0x4104
	call $!_sendToRasPi
.BB@LABEL@35_9:	; if_break_bb
	;***      954 : 	}
	;***      955 : 
	;***      956 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 956
	call $!_UpdateMachineStatus
	;***      957 : 	ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 957
	call $!_ElectrolyticOperation
	;***      958 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 958
	addw sp, #0x0A
	br $!_UpdateMachineStatus
_main_loop_20211111:
	.STACK _main_loop_20211111 = 6
	;***      959 : }
	;***      960 : void main_loop_20211111(void) {
	;***      961 : //	ElectrolyzeWaterGeneration();
	;***      962 : 
	;***      963 : 	if((g_machine_state.user == 1) && (g_machine_state.mode != BUSY)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 963
	cmp !LOWW(_g_machine_state+0x00006), #0x01
	bnz $.BB@LABEL@36_11
.BB@LABEL@36_1:	; bb
	cmp !LOWW(_g_machine_state+0x00007), #0x07
	bz $.BB@LABEL@36_11
.BB@LABEL@36_2:	; if_then_bb
	;***      964 : 		switch (g_machine_mode) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 964
	mov a, !LOWW(_g_machine_mode)
	dec a
	bz $.BB@LABEL@36_8
.BB@LABEL@36_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@36_9
.BB@LABEL@36_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@36_10
.BB@LABEL@36_5:	; if_then_bb
	dec a
	sknz
.BB@LABEL@36_6:	; switch_clause_bb18
	;***      965 : 			case HAND_WASHING:
	;***      966 : 				HandWashingMode_nostop();
	;***      967 : 				break;
	;***      968 : 			case WATER_WASHING:
	;***      969 : 				WaterWashingMode_nostop();
	;***      970 : 				break;
	;***      971 : 			case ACID_WASHING:
	;***      972 : 				AcidWaterMode_nostop();
	;***      973 : 				break;
	;***      974 : 			case ALKALINE_WASHING:
	;***      975 : 				AlkalineWaterMode_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 975
	call $!_AlkalineWaterMode_nostop
.BB@LABEL@36_7:	; if_else_bb34
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00028), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 989
	ret
.BB@LABEL@36_8:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 966
	call $!_HandWashingMode_nostop
	br $.BB@LABEL@36_7
.BB@LABEL@36_9:	; switch_clause_bb16
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 969
	call $!_WaterWashingMode_nostop
	br $.BB@LABEL@36_7
.BB@LABEL@36_10:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 972
	call $!_AcidWaterMode_nostop
	br $.BB@LABEL@36_7
.BB@LABEL@36_11:	; if_else_bb
	;***      976 : 				break;
	;***      977 : 			default:
	;***      978 : 				break;
	;***      979 : 		}
	;***      980 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      981 : 	}else if(g_machine_state.mode == BUSY){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 981
	cmp !LOWW(_g_machine_state+0x00007), #0x07
	bnz $.BB@LABEL@36_7
.BB@LABEL@36_12:	; if_then_bb26
	;***      982 : 		if(ns_delay_ms(&g_Tick.tickDebouceHandSensor, g_timerSetting.t55_waterDischargeDelay_s*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 982
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
	movw ax, #LOWW(_g_Tick@1+0x00028)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	sknz
.BB@LABEL@36_13:	; return
	;***      983 : 			g_machine_state.mode = INDIE;
	;***      984 : 			g_machine_state.user = 0;
	;***      985 : 		}
	;***      986 : 	}else{
	;***      987 : 		g_Tick.tickDebouceHandSensor = g_systemTime;
	;***      988 : 	}
	;***      989 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 989
	ret
.BB@LABEL@36_14:	; if_then_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 983
	clrb !LOWW(_g_machine_state+0x00007)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 984
	clrb !LOWW(_g_machine_state+0x00006)
	ret
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      990 : 
	;***      991 : /**
	;***      992 :  * 30/11/2021: Checked by An
	;***      993 :  */
	;***      994 : void electrolyticOperationON(void) {
	;***      995 : 	//Electrolytic operation ON
	;***      996 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 996
	set1 0xFFF01.7
	;***      997 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 997
	set1 0xFFF0E.2
	;***      998 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 998
	set1 0xFFF06.0
	;***      999 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 999
	oneb !LOWW(_g_electrolytic_flag)
	;***     1000 : 	g_TickKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1000
	movw bc, !LOWW(_g_TickKeeper@2+0x00012)
	movw ax, !LOWW(_g_TickKeeper@2+0x00010)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@37_3
.BB@LABEL@37_1:	; entry
	bc $.BB@LABEL@37_3
.BB@LABEL@37_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@37_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TickKeeper@2+0x00010), ax
	movw ax, bc
	movw !LOWW(_g_TickKeeper@2+0x00012), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1004
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 6
	;***     1001 : 			g_TickKeeper.neutralization == 0 ?
	;***     1002 : 					g_systemTime : g_TickKeeper.neutralization;
	;***     1003 : 	//TODO: Add Neutralization timer ON
	;***     1004 : }
	;***     1005 : /**
	;***     1006 :  * 30/11/2021: Checked by An, missing Neutralization timer OFF
	;***     1007 :  */
	;***     1008 : uint8_t electrolyticOperationOFF(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1008
	clrw ax
	;***     1009 : 	//TODO: Add Neutralization timer OFF
	;***     1010 : 	g_TickKeeper.neutralization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1010
	movw !LOWW(_g_TickKeeper@2+0x00012), ax
	movw !LOWW(_g_TickKeeper@2+0x00010), ax
	;***     1011 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1011
	clr1 0xFFF0E.2
	;***     1012 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1012
	clr1 0xFFF06.0
	;***     1013 : 	RaspberryResponse_nostop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1013
	call $!_RaspberryResponse_nostop
	;***     1014 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1014
	call !!_R_WDT_Restart
	;***     1015 : 	//delay(5)
	;***     1016 : 	if(ns_delay_ms(&g_Tick.tickElectrolyticOff, g_timerSetting.t5_electrolysisStopDelay_s*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1016
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
	movw ax, #LOWW(_g_Tick@1+0x00040)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@38_2
.BB@LABEL@38_1:	; bb7
	;***     1017 : 		O_SUPPLY_WATER_PIN_SV1 = OFF;
	;***     1018 : 		g_electrolytic_flag = 0;
	;***     1019 : 		return 0;
	;***     1020 : 	}
	;***     1021 : 	return 1;
	;***     1022 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1022
	oneb a
	ret
.BB@LABEL@38_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1017
	clr1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1018
	clrb !LOWW(_g_electrolytic_flag)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1019
	clrb a
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 18
	;***     1023 : 
	;***     1024 : float measureFlowSensor(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1024
	subw sp, #0x0A
	;***     1025 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1025
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x06], ax
	clrw ax
	movw [sp+0x00], ax
	oneb a
	mov [sp+0x02], a
	clrw ax
	movw [sp+0x04], ax
.BB@LABEL@39_1:	; bb26
	;***     1026 : 	float flow_pluse = 0.0;
	;***     1027 : 	uint8_t flow_pulse_state = I_OFF;
	;***     1028 : 	while (!ns_delay_ms(&stamp_flow_sensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1028
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0000A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, sp
	addw ax, #0x0006
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@39_7
.BB@LABEL@39_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***     1029 : 			g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***     1030 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1030
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@39_6
.BB@LABEL@39_3:	; if_then_bb
	;***     1031 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1031
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@39_5
.BB@LABEL@39_4:	; if_then_bb19
	movw ax, #0x3F80
	;***     1032 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1032
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
.BB@LABEL@39_5:	; if_break_bb
	;***     1033 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1033
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@39_6:	; if_break_bb25
	;***     1034 : 		}
	;***     1035 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1035
	call !!_R_WDT_Restart
	br $.BB@LABEL@39_1
.BB@LABEL@39_7:	; bb38
	movw ax, #0x3F33
	;***     1036 : 	}
	;***     1037 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1037
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
	movw !LOWW(_g_io_status+0x00006), ax
	movw ax, bc
	movw !LOWW(_g_io_status+0x00008), ax
	addw sp, #0x04
	;***     1038 : 			/ g_timerSetting.t3_flowSensorMonitorTime_s; // L/minutes
	;***     1039 : 	return g_io_status.refined.FlowValue;
	;***     1040 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1040
	movw bc, ax
	movw ax, de
	addw sp, #0x0A
	ret
_measureFlowSensor_nostop:
	.STACK _measureFlowSensor_nostop = 12
	;***     1041 : 
	;***     1042 : uint8_t _pre_flow_state = I_OFF;
	;***     1043 : float _flow_pulse;
	;***     1044 : float measureFlowSensor_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1044
	subw sp, #0x04
	;***     1045 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***     1046 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***     1047 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1047
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@40_4
.BB@LABEL@40_1:	; entry
	dec a
	bz $.BB@LABEL@40_5
.BB@LABEL@40_2:	; entry
	dec a
	bz $.BB@LABEL@40_12
.BB@LABEL@40_3:	; switch_clause_bb60
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@40_11
.BB@LABEL@40_4:	; switch_clause_bb
	;***     1048 : 	case 0:
	;***     1049 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1049
	movw bc, !LOWW(_g_timerSetting+0x00004)
	movw de, !LOWW(_g_timerSetting+0x00006)
	br $.BB@LABEL@40_9
.BB@LABEL@40_5:	; switch_clause_bb13
	;***     1050 : 			(*state)++;
	;***     1051 : 		}
	;***     1052 : 		break;
	;***     1053 : 	case 1:
	;***     1054 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1054
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@40_8
.BB@LABEL@40_6:	; if_then_bb23
	;***     1055 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1055
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***     1056 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1056
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@40_8
.BB@LABEL@40_7:	; if_then_bb34
	movw ax, #0x3F80
	;***     1057 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1057
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
.BB@LABEL@40_8:	; if_break_bb38
	;***     1058 : 			}
	;***     1059 : 		}
	;***     1060 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1060
	movw ax, !LOWW(_g_timerSetting+0x00008)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0000A)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
.BB@LABEL@40_9:	; if_break_bb38
	movw ax, #LOWW(_g_Tick@1+0x00024)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@40_10:	; if_then_bb46
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@40_11:	; switch_break_bb
	;***     1061 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***     1062 : 			(*state)++;
	;***     1063 : 		}
	;***     1064 : 		break;
	;***     1065 : 	case 2:
	;***     1066 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***     1067 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***     1068 : 		_flow_pulse = 0;
	;***     1069 : 		(*state) = 0;
	;***     1070 : 		break;
	;***     1071 : 	default:
	;***     1072 : 		(*state) = 0;
	;***     1073 : 		break;
	;***     1074 : 	}
	;***     1075 : 	return g_io_status.refined.FlowValue;
	;***     1076 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1076
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@40_12:	; switch_clause_bb51
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1066
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1068
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@40_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***     1077 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1077
	push hl
	;***     1078 : 	if(g_machine_state.mode != ELECTROLYTIC_GENERATION)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1078
	mov a, !LOWW(_g_machine_state+0x00007)
	cmp a, #0x08
	skz
.BB@LABEL@41_1:	; if_then_bb
	;***     1079 : 		pre_machine_mode = g_machine_state.mode;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1079
	mov !LOWW(_pre_machine_mode@3), a
.BB@LABEL@41_2:	; if_break_bb
	;***     1080 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1080
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@41_4
.BB@LABEL@41_3:	; bb11
	clrb x
.BB@LABEL@41_4:	; bb12
	;***     1081 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1081
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@41_6
.BB@LABEL@41_5:	; bb28
	clrb c
.BB@LABEL@41_6:	; bb30
	;***     1082 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1082
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@41_8
.BB@LABEL@41_7:	; bb46
	clrb b
.BB@LABEL@41_8:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***     1083 : 
	;***     1084 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1084
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@41_10
.BB@LABEL@41_9:	; bb64
	clrb x
.BB@LABEL@41_10:	; bb66
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***     1085 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1085
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@41_12
.BB@LABEL@41_11:	; bb82
	clrb b
.BB@LABEL@41_12:	; bb84
	mov a, c
	or a, x
	mov c, a
	;***     1086 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1086
	mov a, 0xFFF07
	mov x, #0x04
	bf a.0, $.BB@LABEL@41_14
.BB@LABEL@41_13:	; bb100
	clrb x
.BB@LABEL@41_14:	; bb102
	mov a, c
	or a, b
	mov c, a
	;***     1087 : 
	;***     1088 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1088
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@41_16
.BB@LABEL@41_15:	; bb118
	clrb b
.BB@LABEL@41_16:	; bb120
	mov a, c
	or a, x
	mov c, a
	;***     1089 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1089
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@41_18
.BB@LABEL@41_17:	; bb136
	clrb x
.BB@LABEL@41_18:	; bb138
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***     1090 : 
	;***     1091 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1091
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***     1092 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1092
	mov x, 0xFFF05
	;***     1093 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1093
	mov c, 0xFFF07
	;***     1094 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1094
	mov a, 0xFFF07
	mov h, a
	;***     1095 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1095
	mov a, [de]
	mov l, a
	;***     1096 : 	O_DRAIN_ACID_PIN_SV7;
	;***     1097 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1097
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1091
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1092
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1093
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1094
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1095
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***     1098 : 	O_DRAIN_ALK_PIN_SV6;
	;***     1099 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1099
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1095
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1099
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1097
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1099
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***     1100 : 
	;***     1101 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1101
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***     1102 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1102
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***     1103 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 1103
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***     1104 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_Tick@1:
	.DS (132)
	.ALIGN 2
_g_TickKeeper@2:
	.DS (20)
_pre_machine_mode@3:
	.DS (1)
_g_callan_clear_flag@4:
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
_water_solfner_buf:
	.DS (7)
_this_true:
	.DS (1)
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
	.DB4 0x000000FF
__pre_flow_state:
	.DB 0x01
	.SECTION .const,CONST
	.ALIGN 2
_time_setting_p:
	.DB2 LOWW(__settingTime)
	.ALIGN 2
_number_setting_p:
	.DB2 LOWW(__settingNumber)
