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
#@  compiled at Mon Dec 20 17:36:47 2021

	.EXTERN _rx_count
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
	.PUBLIC _io_statusSize
	.PUBLIC _timeSettingSize
	.PUBLIC _numberSettingSize
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
	.PUBLIC _RaspberryResponse_nostop
	.EXTERN _R_WDT_Restart
	.EXTERN _crc8_1
	.EXTERN _EE_SPI_Write
	.PUBLIC _InitialOperationModeStart
	.PUBLIC _nostop_WaterSupplyOperation
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
	.EXTERN _delay
	.PUBLIC _nostop_measureFlowSensor
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
	;***       30 : //const uint8_t io_statusSize = sizeof(union IO_Status_u);
	;***       31 : const uint8_t io_statusSize = 5;
	;***       32 : //const uint8_t timeSettingSize = sizeof(struct Timer_Setting_s);
	;***       33 : const uint8_t timeSettingSize = 69;
	;***       34 : //const uint8_t numberSettingSize = sizeof(struct Number_Setting_s);
	;***       35 : const uint8_t numberSettingSize = 33;
	;***       36 : 
	;***       37 : //struct Tick_s g_Tick;
	;***       38 : 
	;***       39 : //void electrolyticOperationON(void);
	;***       40 : //void electrolyticOperationOFF(void);
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
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***       76 : 	g_timerSetting.t3_flowSensorMonitorTime_s = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       77 : 	g_timerSetting.t6_drainageOffTime_h = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       78 : 	g_timerSetting.t11_overVoltage1Time_s = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_timerSetting+0x0000E), ax
	;***       79 : 	g_timerSetting.t12_overVoltage2Time_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x00012), ax
	;***       80 : 	g_timerSetting.t13_overVoltage3Time_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       81 : 	g_timerSetting.t14_lowVoltageStartTime_s = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x0001A), ax
	;***       82 : 	g_timerSetting.t15_lowVoltageDelayTime_s = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x0001E), ax
	;***       83 : 	g_timerSetting.t17_solenoidLeakageStartTime_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00022), ax
	;***       84 : 	g_timerSetting.t51_alkalineWaterSpoutingTime_s = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00026), ax
	;***       85 : 	g_timerSetting.t52_acidWaterSpoutingTime_s = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       86 : 	g_timerSetting.t53_washingWaterSpoutingTime_s = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x0002E), ax
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
	movw !LOWW(_g_timerSetting), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_timerSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 78
	movw !LOWW(_g_timerSetting+0x0000C), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	movw !LOWW(_g_timerSetting+0x00010), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	movw !LOWW(_g_timerSetting+0x0001C), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	movw !LOWW(_g_timerSetting+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	movw !LOWW(_g_timerSetting+0x00020), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw !LOWW(_g_timerSetting+0x00024), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	movw !LOWW(_g_timerSetting+0x00028), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	movw !LOWW(_g_timerSetting+0x0002C), ax
	ret
_isAcidHigh:
	.STACK _isAcidHigh = 6
	;***       87 : }
	;***       88 : #ifdef RENAN_CODE
	;***       89 : void renanCode(void){
	;***       90 : 	//Power On Mode
	;***       91 : 	O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       92 : 	O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       93 : 	do{
	;***       94 : 		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN_SV7;	// Turn on SV5 if ACID tank empty
	;***       95 : 		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN_SV6;	// Turn on SV6 if ALK tank empty
	;***       96 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***       97 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***       98 : 		R_WDT_Restart();
	;***       99 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      100 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***      101 : 	O_DRAIN_ACID_PIN_SV7 = O_DRAIN_ALK_PIN_SV6 = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***      102 : 
	;***      103 : 	// Drainage operation
	;***      104 : 	O_SPOUT_WATER_PIN_SV2 = ON;	// SV2 On
	;***      105 : 	delay(st[1]);			// Default 30 seconds
	;***      106 : 	O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      107 : 	delay_ms(500);
	;***      108 : 	O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      109 : }
	;***      110 : 
	;***      111 : 
	;***      112 : void code_20211029(void){
	;***      113 : 	//---------------Electrolytic operation-----------------------------
	;***      114 : 	O_SUPPLY_WATER_PIN_SV1 = ON; //SV1
	;***      115 : 	O_CVCC_ON_PIN = ON;
	;***      116 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***      117 : 	delay(10);
	;***      118 : 	//TODO: Neutralization timer On
	;***      119 : 
	;***      120 : 	overVoltage1Error();
	;***      121 : }
	;***      122 : #endif
	;***      123 : 
	;***      124 : 
	;***      125 : uint8_t isAcidHigh(void){
	;***      126 : 	if(g_io_status.refined.AcidHighLevel != g_pre_io_status.refined.AcidHighLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 126
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].5
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].5
	bc $.BB@LABEL@3_3
.BB@LABEL@3_1:	; if_else_bb
	;***      127 : 		if(I_ACID_H_PIN == I_ON){
	;***      128 : 			if(ns_delay_ms(&g_Tick.tickAcidLevel[0], g_timerSetting.t28_onDelayHighLevel_s*1000)){
	;***      129 : 				g_pre_io_status.refined.AcidHighLevel = g_io_status.refined.AcidHighLevel;
	;***      130 : 				return 1;
	;***      131 : 			}
	;***      132 : 			return 0;
	;***      133 : 		}
	;***      134 : 	}else{
	;***      135 : 		g_Tick.tickAcidLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00042), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00040), ax
.BB@LABEL@3_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	ret
.BB@LABEL@3_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 127
	mov a, 0xFFF07
	bt a.3, $.BB@LABEL@3_2
.BB@LABEL@3_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
	movw ax, !LOWW(_g_timerSetting+0x0004E)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00050)
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
	bz $.BB@LABEL@3_2
.BB@LABEL@3_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	mov1 CY, [hl].5
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].5, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	ret
_isAcidLow:
	.STACK _isAcidLow = 6
	;***      136 : 	}
	;***      137 : 	return 0;
	;***      138 : }
	;***      139 : uint8_t isAcidLow(void){
	;***      140 : 	if(g_io_status.refined.AcidLowLevel != g_pre_io_status.refined.AcidLowLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 140
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].4
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].4
	bc $.BB@LABEL@4_3
.BB@LABEL@4_1:	; if_else_bb
	;***      141 : 		if(I_ACID_M_PIN == I_ON){
	;***      142 : 			if(ns_delay_ms(&g_Tick.tickAcidLevel[1], g_timerSetting.t27_onDelayLowLevel_s*1000)){
	;***      143 : 				g_pre_io_status.refined.AcidLowLevel = g_io_status.refined.AcidLowLevel;
	;***      144 : 				return 1;
	;***      145 : 			}
	;***      146 : 			return 0;
	;***      147 : 		}
	;***      148 : 	}else{
	;***      149 : 		g_Tick.tickAcidLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00046), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00044), ax
.BB@LABEL@4_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	ret
.BB@LABEL@4_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
	mov a, 0xFFF07
	bt a.2, $.BB@LABEL@4_2
.BB@LABEL@4_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 142
	movw ax, !LOWW(_g_timerSetting+0x0004A)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0004C)
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
	bz $.BB@LABEL@4_2
.BB@LABEL@4_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	mov1 CY, [hl].4
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].4, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	ret
_isAcidEmpty:
	.STACK _isAcidEmpty = 6
	;***      150 : 	}
	;***      151 : 	return 0;
	;***      152 : }
	;***      153 : uint8_t isAcidEmpty(void){
	;***      154 : 	if(g_io_status.refined.AcidEmptyLevel!= g_pre_io_status.refined.AcidEmptyLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 154
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].3
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].3
	bc $.BB@LABEL@5_3
.BB@LABEL@5_1:	; if_else_bb
	;***      155 : 		if(I_ACID_L_PIN == I_ON){
	;***      156 : 			if(ns_delay_ms(&g_Tick.tickAcidLevel[2], g_timerSetting.t26_onDelayEmptyLevel_s*1000)){
	;***      157 : 				return 1;
	;***      158 : 			}
	;***      159 : 			return 0;
	;***      160 : 		}
	;***      161 : 	}else{
	;***      162 : 		g_Tick.tickAcidLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0004A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00048), ax
.BB@LABEL@5_2:	; bb31
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 165
	ret
.BB@LABEL@5_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 155
	mov a, 0xFFF07
	bt a.1, $.BB@LABEL@5_2
.BB@LABEL@5_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 156
	movw ax, !LOWW(_g_timerSetting+0x00046)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00048)
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
	oneb a
	sknz
.BB@LABEL@5_5:	; if_then_bb18
	clrb a
.BB@LABEL@5_6:	; if_then_bb18
	ret
_isAlkalineHigh:
	.STACK _isAlkalineHigh = 6
	;***      163 : 	}
	;***      164 : 	return 0;
	;***      165 : }
	;***      166 : 
	;***      167 : uint8_t isAlkalineHigh(void){
	;***      168 : 	if(g_io_status.refined.AlkalineHighLevel != g_pre_io_status.refined.AlkalineHighLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].2
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].2
	bc $.BB@LABEL@6_3
.BB@LABEL@6_1:	; if_else_bb
	;***      169 : 		if(I_ALKALI_H_PIN == I_ON){
	;***      170 : 			if(ns_delay_ms(&g_Tick.tickAlkalineLevel[0], g_timerSetting.t28_onDelayHighLevel_s*1000)){
	;***      171 : 				g_pre_io_status.refined.AlkalineHighLevel = g_io_status.refined.AlkalineHighLevel;
	;***      172 : 				return 1;
	;***      173 : 			}
	;***      174 : 			return 0;
	;***      175 : 		}
	;***      176 : 	}else{
	;***      177 : 		g_Tick.tickAlkalineLevel[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0004E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0004C), ax
.BB@LABEL@6_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	ret
.BB@LABEL@6_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 169
	mov a, 0xFFF07
	bt a.0, $.BB@LABEL@6_2
.BB@LABEL@6_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
	movw ax, !LOWW(_g_timerSetting+0x0004E)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00050)
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
	bz $.BB@LABEL@6_2
.BB@LABEL@6_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	mov1 CY, [hl].2
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].2, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	ret
_isAlkalineLow:
	.STACK _isAlkalineLow = 6
	;***      178 : 	}
	;***      179 : 	return 0;
	;***      180 : }
	;***      181 : uint8_t isAlkalineLow(void){
	;***      182 : 	if(g_io_status.refined.AlkalineLowLevel != g_pre_io_status.refined.AlkalineLowLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 182
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].1
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].1
	bc $.BB@LABEL@7_3
.BB@LABEL@7_1:	; if_else_bb
	;***      183 : 		if(I_ALKALI_M_PIN == I_ON){
	;***      184 : 			if(ns_delay_ms(&g_Tick.tickAlkalineLevel[1], g_timerSetting.t27_onDelayLowLevel_s*1000)){
	;***      185 : 				g_pre_io_status.refined.AlkalineLowLevel = g_io_status.refined.AlkalineLowLevel;
	;***      186 : 				return 1;
	;***      187 : 			}
	;***      188 : 			return 0;
	;***      189 : 		}
	;***      190 : 	}else{
	;***      191 : 		g_Tick.tickAlkalineLevel[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00052), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00050), ax
.BB@LABEL@7_2:	; bb39
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	ret
.BB@LABEL@7_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 183
	mov a, 0xFFF00
	bt a.6, $.BB@LABEL@7_2
.BB@LABEL@7_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	movw ax, !LOWW(_g_timerSetting+0x0004A)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0004C)
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
	bz $.BB@LABEL@7_2
.BB@LABEL@7_5:	; if_then_bb25
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	movw hl, #LOWW(_g_io_status)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 186
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	mov1 CY, [hl].1
	movw hl, #LOWW(_g_pre_io_status)
	mov1 [hl].1, CY
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 186
	ret
_isAlkalineEmpty:
	.STACK _isAlkalineEmpty = 6
	;***      192 : 	}
	;***      193 : 	return 0;
	;***      194 : }
	;***      195 : uint8_t isAlkalineEmpty(void){
	;***      196 : 	if(g_io_status.refined.AlkalineEmptyLevel!= g_pre_io_status.refined.AlkalineEmptyLevel){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	movw hl, #LOWW(_g_pre_io_status)
	mov1 CY, [hl].0
	movw hl, #LOWW(_g_io_status)
	xor1 CY, [hl].0
	bc $.BB@LABEL@8_3
.BB@LABEL@8_1:	; if_else_bb
	;***      197 : 		if(I_ALKALI_L_PIN == I_ON){
	;***      198 : 			if(ns_delay_ms(&g_Tick.tickAlkalineLevel[2], g_timerSetting.t26_onDelayEmptyLevel_s*1000)){
	;***      199 : 				return 1;
	;***      200 : 			}
	;***      201 : 			return 0;
	;***      202 : 		}
	;***      203 : 	}else{
	;***      204 : 		g_Tick.tickAlkalineLevel[2] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00056), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00054), ax
.BB@LABEL@8_2:	; bb31
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 207
	ret
.BB@LABEL@8_3:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
	mov a, 0xFFF00
	bt a.5, $.BB@LABEL@8_2
.BB@LABEL@8_4:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	movw ax, !LOWW(_g_timerSetting+0x00046)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00048)
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
	oneb a
	sknz
.BB@LABEL@8_5:	; if_then_bb18
	clrb a
.BB@LABEL@8_6:	; if_then_bb18
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 10
	;***      205 : 	}
	;***      206 : 	return 0;
	;***      207 : }
	;***      208 : 
	;***      209 : //----------------------Begin code 11112021--------------------------------------
	;***      210 : void sendToRasPi(enum UART_header_e head, enum Control_status type, float value) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	push hl
	push ax
	movw ax, bc
	push de
	pop bc
	;***      211 : 	uint8_t state = g_uart2_sendend;
	;***      212 : 	g_control_buffer.head = head;
	;***      213 : 	g_control_buffer.set_number = type;
	;***      214 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	call !!__COM_ftoul
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 211
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x02], a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	mov !LOWW(_g_control_buffer), a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
	mov !LOWW(_g_control_buffer+0x00001), a
	;***      215 : 	R_UART2_Send((uint8_t*) &g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@9_1:	; bb10
	mov a, [sp+0x02]
	;***      216 : 	while (state == g_uart2_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@9_1
.BB@LABEL@9_2:	; return
	;***      217 : 		;
	;***      218 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	addw sp, #0x04
	ret
_sendToWaterSolfner:
	.STACK _sendToWaterSolfner = 6
	;***      219 : void sendToWaterSolfner(enum UART_header_e head, enum Control_status type,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	push hl
	;***      220 : 		uint32_t value) {
	;***      221 : 	uint8_t state = g_uart3_sendend;
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
	mov a, !LOWW(_g_uart3_sendend)
	mov [sp+0x00], a
	;***      225 : 	R_UART3_Send((uint8_t*) &g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART3_Send
.BB@LABEL@10_1:	; bb9
	mov a, [sp+0x00]
	;***      226 : 	while (state == g_uart3_sendend)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 226
	cmp a, !LOWW(_g_uart3_sendend)
	bz $.BB@LABEL@10_1
.BB@LABEL@10_2:	; return
	;***      227 : 		;
	;***      228 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	pop hl
	ret
_RaspberryResponse_nostop:
	.STACK _RaspberryResponse_nostop = 8
	;***      229 : void RaspberryResponse_nostop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	subw sp, #0x04
	;***      230 : 	if (commnunication_flag.send_response_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	cmp0 !LOWW(_commnunication_flag)
	bz $.BB@LABEL@11_5
.BB@LABEL@11_1:	; if_then_bb
	;***      231 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      232 : 		R_UART2_Send(g_rx_data, 6);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 232
	movw bc, #0x0006
	movw ax, #LOWW(_g_rx_data)
	call !!_R_UART2_Send
.BB@LABEL@11_2:	; bb19
	mov a, [sp+0x00]
	;***      233 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 233
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@11_4
.BB@LABEL@11_3:	; bb
	;***      234 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 234
	call !!_R_WDT_Restart
	br $.BB@LABEL@11_2
.BB@LABEL@11_4:	; bb27
	;***      235 : 		}
	;***      236 : 		commnunication_flag.send_response_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
	clrb !LOWW(_commnunication_flag)
.BB@LABEL@11_5:	; if_break_bb
	;***      237 : 	}
	;***      238 : 	if (commnunication_flag.send_respone_status_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 238
	cmp0 !LOWW(_commnunication_flag+0x00005)
	bz $.BB@LABEL@11_10
.BB@LABEL@11_6:	; if_then_bb33
	;***      239 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      240 : 		R_UART2_Send((uint8_t*) &g_io_status.refined, io_statusSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	movw bc, #0x0005
	movw ax, #LOWW(_g_io_status)
	call !!_R_UART2_Send
.BB@LABEL@11_7:	; bb39
	mov a, [sp+0x00]
	;***      241 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@11_9
.BB@LABEL@11_8:	; bb38
	;***      242 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 242
	call !!_R_WDT_Restart
	br $.BB@LABEL@11_7
.BB@LABEL@11_9:	; bb47
	;***      243 : 		}
	;***      244 : 		commnunication_flag.send_respone_status_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	clrb !LOWW(_commnunication_flag+0x00005)
.BB@LABEL@11_10:	; if_break_bb48
	;***      245 : 	}
	;***      246 : 	if (commnunication_flag.send_response_time_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	cmp0 !LOWW(_commnunication_flag+0x00001)
	bz $.BB@LABEL@11_15
.BB@LABEL@11_11:	; if_then_bb54
	;***      247 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      248 : 		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 248
	inc !LOWW(_rx_count)
	;***      249 : 		g_timerSetting.crc = crc8_1((uint8_t*) &g_timerSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	mov c, #0x44
	movw ax, #LOWW(_g_timerSetting)
	call !!_crc8_1
	mov !LOWW(_g_timerSetting+0x00044), a
	;***      250 : 				timeSettingSize - 1);
	;***      251 : 		R_UART2_Send((uint8_t*) &g_timerSetting, timeSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	movw bc, #0x0045
	movw ax, #LOWW(_g_timerSetting)
	call !!_R_UART2_Send
.BB@LABEL@11_12:	; bb67
	mov a, [sp+0x00]
	;***      252 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 252
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@11_14
.BB@LABEL@11_13:	; bb66
	;***      253 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	call !!_R_WDT_Restart
	br $.BB@LABEL@11_12
.BB@LABEL@11_14:	; bb75
	;***      254 : 		}
	;***      255 : 		commnunication_flag.send_response_time_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	clrb !LOWW(_commnunication_flag+0x00001)
.BB@LABEL@11_15:	; if_break_bb76
	;***      256 : 	}
	;***      257 : 	if (commnunication_flag.send_response_number_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
	cmp0 !LOWW(_commnunication_flag+0x00002)
	bz $.BB@LABEL@11_20
.BB@LABEL@11_16:	; if_then_bb82
	;***      258 : 		uint8_t state = g_uart2_sendend;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x00], a
	;***      259 : 		rx_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
	inc !LOWW(_rx_count)
	;***      260 : 		g_numberSetting.crc = crc8_1((uint8_t*) &g_numberSetting,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 260
	mov c, #0x20
	movw ax, #LOWW(_g_numberSetting)
	call !!_crc8_1
	mov !LOWW(_g_numberSetting+0x00020), a
	;***      261 : 				numberSettingSize - 1);
	;***      262 : 		R_UART2_Send((uint8_t*) &g_numberSetting, numberSettingSize);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	movw bc, #0x0021
	movw ax, #LOWW(_g_numberSetting)
	call !!_R_UART2_Send
.BB@LABEL@11_17:	; bb95
	mov a, [sp+0x00]
	;***      263 : 		while (state == g_uart2_sendend) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
	cmp a, !LOWW(_g_uart2_sendend)
	bnz $.BB@LABEL@11_19
.BB@LABEL@11_18:	; bb94
	;***      264 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	call !!_R_WDT_Restart
	br $.BB@LABEL@11_17
.BB@LABEL@11_19:	; bb103
	;***      265 : 		}
	;***      266 : 		commnunication_flag.send_response_number_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	clrb !LOWW(_commnunication_flag+0x00002)
.BB@LABEL@11_20:	; if_break_bb104
	;***      267 : 	}
	;***      268 : 	if (commnunication_flag.recived_time_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 268
	cmp !LOWW(_commnunication_flag+0x00004), #0x02
	.bnz $!.BB@LABEL@11_36
.BB@LABEL@11_21:	; if_break_bb104.bb185_crit_edge
	clrb a
.BB@LABEL@11_22:	; if_break_bb104.bb185_crit_edge
	mov [sp+0x00], a
	;***      269 : 		uint8_t *p = (uint8_t*) &_settingTime;
	;***      270 : 		//Do not Edit this, must keep!!!!
	;***      271 : 		for (uint8_t i = 0; i < timeSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 271
	cmp a, #0x44
	bz $.BB@LABEL@11_32
.BB@LABEL@11_23:	; bb111
	;***      272 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 272
	shrw ax, 8+0x00000
	movw [sp+0x02], ax
	mov a, [sp+0x00]
	and a, #0x03
	bz $.BB@LABEL@11_28
.BB@LABEL@11_24:	; bb111
	dec a
	bz $.BB@LABEL@11_27
.BB@LABEL@11_25:	; bb111
	dec a
	bnz $.BB@LABEL@11_31
.BB@LABEL@11_26:	; switch_clause_bb131
	movw ax, [sp+0x02]
	;***      273 : 			case 4:
	;***      274 : 				p[timeSettingSize - 3 + 3 - i] = g_rx_data[i - 3];
	;***      275 : 				break;
	;***      276 : 			case 2:
	;***      277 : 				p[timeSettingSize - 3 + 1 - i] = g_rx_data[i - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	addw ax, #LOWW(_g_rx_data+0x0FFFF)
	movw de, ax
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, #0x0043
	subw ax, bc
	movw bc, ax
	mov a, [de]
	br $.BB@LABEL@11_30
.BB@LABEL@11_27:	; switch_clause_bb148
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, #0x0041
	;***      278 : 				break;
	;***      279 : 			case 1:
	;***      280 : 				p[timeSettingSize - 3 - 1 - i] = g_rx_data[1 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 280
	subw ax, bc
	movw [sp+0x02], ax
	mov a, [sp+0x00]
	mov b, a
	mov a, LOWW(_g_rx_data+0x00001)[b]
	br $.BB@LABEL@11_29
.BB@LABEL@11_28:	; switch_clause_bb165
	movw ax, [sp+0x02]
	movw bc, ax
	movw ax, #0x003F
	;***      281 : 				break;
	;***      282 : 			case 0:
	;***      283 : 				p[timeSettingSize - 3 - 3 - i] = g_rx_data[3 + i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	subw ax, bc
	movw [sp+0x02], ax
	mov a, [sp+0x00]
	mov b, a
	mov a, LOWW(_g_rx_data+0x00003)[b]
.BB@LABEL@11_29:	; switch_clause_bb165
	mov b, a
	movw ax, [sp+0x02]
	xchw ax, bc
.BB@LABEL@11_30:	; switch_clause_bb165
	mov LOWW(__settingTime@4)[bc], a
.BB@LABEL@11_31:	; switch_break_bb
	mov a, [sp+0x00]
	inc a
	br $.BB@LABEL@11_22
.BB@LABEL@11_32:	; bb194
	;***      284 : 				break;
	;***      285 : 			default:
	;***      286 : 				break;
	;***      287 : 			}
	;***      288 : 		}
	;***      289 : 		_settingTime.crc = g_rx_data[timeSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
	mov a, !LOWW(_g_rx_data+0x00044)
	mov [sp+0x00], a
	mov !LOWW(__settingTime@4+0x00044), a
	;***      290 : 		if (g_rx_data[timeSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	mov c, #0x43
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	movw de, #0x0000
	clrw bc
	cmp x, a
	mov a, #0x53
	bnz $.BB@LABEL@11_34
.BB@LABEL@11_33:	; if_then_bb217
	;***      291 : 				== crc8_1((uint8_t*) g_rx_data, timeSettingSize - 2)) {
	;***      292 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
	clrb x
	call $!_sendToRasPi
	;***      293 : 			g_timerSetting = _settingTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	movw de, #0x0062
	movw bc, #LOWW(__settingTime@4)
	movw ax, #LOWW(_g_timerSetting)
	call !!_memcpy
	;***      294 : 			EE_SPI_Write((uint8_t*) &g_timerSetting, 0x040,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
	movw de, #0x0062
	movw bc, #0x0040
	movw ax, #LOWW(_g_timerSetting)
	call !!_EE_SPI_Write
	br $.BB@LABEL@11_35
.BB@LABEL@11_34:	; if_else_bb
	;***      295 : 					sizeof(g_timerSetting));
	;***      296 : 		} else {
	;***      297 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
	mov x, #0x16
	call $!_sendToRasPi
.BB@LABEL@11_35:	; if_break_bb218
	;***      298 : //				R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
	;***      299 : 		}
	;***      300 : 		commnunication_flag.recived_time_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 300
	clrb !LOWW(_commnunication_flag+0x00004)
.BB@LABEL@11_36:	; if_break_bb219
	;***      301 : 	}
	;***      302 : 	if (commnunication_flag.recived_number_setting_flag == 2) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
	cmp !LOWW(_commnunication_flag+0x00003), #0x02
	bnz $.BB@LABEL@11_50
.BB@LABEL@11_37:	; if_break_bb219.bb278_crit_edge
	clrb a
	mov b, a
.BB@LABEL@11_38:	; bb278
	;***      303 : 		uint8_t *p = (uint8_t*) &_settingNumber;
	;***      304 : 		//Do not Edit this, must keep!!!!
	;***      305 : 		for (uint8_t i = 0; i < numberSettingSize - 1; i++) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	cmp a, #0x20
	bz $.BB@LABEL@11_46
.BB@LABEL@11_39:	; bb226
	;***      306 : //				p[i] = g_rx_data[i];
	;***      307 : 			switch (i % 4) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	and a, #0x03
	bz $.BB@LABEL@11_44
.BB@LABEL@11_40:	; bb226
	dec a
	bz $.BB@LABEL@11_43
.BB@LABEL@11_41:	; bb226
	dec a
	bnz $.BB@LABEL@11_45
.BB@LABEL@11_42:	; switch_clause_bb241
	mov a, b
	;***      308 : 			case 4:
	;***      309 : 				p[i - 3] = g_rx_data[i];
	;***      310 : 				break;
	;***      311 : 			case 2:
	;***      312 : 				p[i - 1] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 312
	shrw ax, 8+0x00000
	addw ax, #LOWW(__settingNumber@5+0x0FFFF)
	movw de, ax
	mov a, LOWW(_g_rx_data)[b]
	mov [de], a
	br $.BB@LABEL@11_45
.BB@LABEL@11_43:	; switch_clause_bb252
	;***      313 : 				break;
	;***      314 : 			case 1:
	;***      315 : 				p[1 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber@5+0x00001)[b], a
	br $.BB@LABEL@11_45
.BB@LABEL@11_44:	; switch_clause_bb263
	;***      316 : 				break;
	;***      317 : 			case 0:
	;***      318 : 				p[3 + i] = g_rx_data[i];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 318
	mov a, LOWW(_g_rx_data)[b]
	mov LOWW(__settingNumber@5+0x00003)[b], a
.BB@LABEL@11_45:	; switch_break_bb275
	inc b
	mov a, b
	br $.BB@LABEL@11_38
.BB@LABEL@11_46:	; bb287
	;***      319 : 				break;
	;***      320 : 			default:
	;***      321 : 				break;
	;***      322 : 			}
	;***      323 : 		}
	;***      324 : 		_settingNumber.crc = g_rx_data[numberSettingSize - 1];
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 324
	mov a, !LOWW(_g_rx_data+0x00020)
	mov [sp+0x00], a
	mov !LOWW(__settingNumber@5+0x00020), a
	;***      325 : 		if (g_rx_data[numberSettingSize - 1]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	mov c, #0x1F
	movw ax, #LOWW(_g_rx_data)
	call !!_crc8_1
	mov x, a
	mov a, [sp+0x00]
	xch a, x
	movw de, #0x0000
	clrw bc
	cmp x, a
	mov a, #0x53
	bnz $.BB@LABEL@11_48
.BB@LABEL@11_47:	; if_then_bb310
	;***      326 : 				== crc8_1((uint8_t*) g_rx_data, numberSettingSize - 2)) {
	;***      327 : 			sendToRasPi(H_SET, OK_ALL, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 327
	clrb x
	call $!_sendToRasPi
	;***      328 : 			g_numberSetting = _settingNumber;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 328
	movw de, #0x0026
	movw bc, #LOWW(__settingNumber@5)
	movw ax, #LOWW(_g_numberSetting)
	call !!_memcpy
	;***      329 : 			EE_SPI_Write((uint8_t*) &g_numberSetting, 0x000,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 329
	movw de, #0x0026
	clrw bc
	movw ax, #LOWW(_g_numberSetting)
	call !!_EE_SPI_Write
	br $.BB@LABEL@11_49
.BB@LABEL@11_48:	; if_else_bb311
	;***      330 : 					sizeof(g_numberSetting));
	;***      331 : 		} else {
	;***      332 : 			sendToRasPi(H_SET, SAVE_ERROR, 0x0);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 332
	mov x, #0x16
	call $!_sendToRasPi
.BB@LABEL@11_49:	; if_break_bb312
	;***      333 : //				R_UART2_Receive(g_rx_data, sizeof(struct Timer_Setting_s)-1);
	;***      334 : 		}
	;***      335 : 		commnunication_flag.recived_number_setting_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 335
	clrb !LOWW(_commnunication_flag+0x00003)
.BB@LABEL@11_50:	; return
	addw sp, #0x04
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 337
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 14
	;***      336 : 	}
	;***      337 : }
	;***      338 : /**
	;***      339 :  * InitialOperationModeStart drain Tank 1 and Tank 2 if there are any liquid left
	;***      340 :  * 13/12/2021: Checked!
	;***      341 :  */
	;***      342 : void InitialOperationModeStart(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 342
	subw sp, #0x0A
	;***      343 : 	uint32_t _tick[2];
	;***      344 : //	uint8_t pre_acid, pre_akaline;
	;***      345 : 	g_pre_io_status.refined.Valve.SV7 = O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7;	// Turn on SV5 if ACID tank NOT empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 345
	mov a, 0xFFF07
	mov1 CY, a.1
	mov a, #0x80
	sknc
.BB@LABEL@12_1:	; bb7
	and a, 0xFFF06
.BB@LABEL@12_2:	; bb11
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
	;***      346 : 	g_pre_io_status.refined.Valve.SV6 = O_DRAIN_ALK_PIN_SV6 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 346
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x40
	sknc
.BB@LABEL@12_3:	; bb33
	and a, 0xFFF06
.BB@LABEL@12_4:	; bb40
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
	;***      347 : 	I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6;// Turn on SV6 if ALK tank NOT empty
	;***      348 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 348
	call $!_UpdateMachineStatus
	clrw ax
	;***      349 : 	g_timerSetting.t26_onDelayEmptyLevel_s = g_timerSetting.t26_onDelayEmptyLevel_s = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 349
	movw !LOWW(_g_timerSetting+0x00048), ax
	movw ax, #0x1388
	movw !LOWW(_g_timerSetting+0x00046), ax
.BB@LABEL@12_5:	; bb220
	;***      350 : 	while (1) {
	;***      351 : 		O_DRAIN_ACID_PIN_SV7 = I_ACID_L_PIN == I_ON ? ON : O_DRAIN_ACID_PIN_SV7;// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 351
	mov a, 0xFFF07
	mov1 CY, a.1
	mov a, #0x80
	sknc
.BB@LABEL@12_6:	; bb66
	and a, 0xFFF06
.BB@LABEL@12_7:	; bb71
	mov x, a
	mov a, #0x7F
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      352 : 		O_DRAIN_ALK_PIN_SV6 = I_ALKALI_L_PIN == I_ON ? ON : O_DRAIN_ALK_PIN_SV6;// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 352
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x40
	sknc
.BB@LABEL@12_8:	; bb87
	and a, 0xFFF06
.BB@LABEL@12_9:	; bb93
	mov x, a
	mov a, #0xBF
	and a, 0xFFF06
	or a, x
	mov 0xFFF06, a
	;***      353 : 		g_pre_io_status.refined.Valve.SV7 = I_ACID_L_PIN == I_ON ? ON : OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 353
	mov a, 0xFFF07
	mov x, #0x40
	bf a.1, $.BB@LABEL@12_11
.BB@LABEL@12_10:	; bb109
	clrb x
.BB@LABEL@12_11:	; bb111
	mov a, #0x9F
	and a, !LOWW(_g_pre_io_status+0x00001)
	mov c, a
	;***      354 : 		g_pre_io_status.refined.Valve.SV6 = I_ALKALI_L_PIN == I_ON ? ON : OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 354
	mov a, 0xFFF00
	mov b, #0x20
	bf a.5, $.BB@LABEL@12_13
.BB@LABEL@12_12:	; bb127
	clrb b
.BB@LABEL@12_13:	; bb129
	mov a, c
	or a, x
	or a, b
	mov b, a
	mov !LOWW(_g_pre_io_status+0x00001), a
	;***      355 : 		if (g_pre_io_status.refined.Valve.SV7 != O_DRAIN_ACID_PIN_SV7) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 355
	mov a, 0xFFF06
	shr a, 0x07
	mov x, a
	mov a, b
	shr a, 0x06
	and a, #0x01
	cmp a, x
	bnz $.BB@LABEL@12_15
.BB@LABEL@12_14:	; if_else_bb
	;***      356 : 			if (ns_delay_ms(&_tick[0], g_timerSetting.t26_onDelayEmptyLevel_s)) {
	;***      357 : 				O_DRAIN_ACID_PIN_SV7 = g_pre_io_status.refined.Valve.SV7;
	;***      358 : 			}
	;***      359 : 		} else
	;***      360 : 			_tick[0] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 360
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
	br $.BB@LABEL@12_17
.BB@LABEL@12_15:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 356
	movw bc, !LOWW(_g_timerSetting+0x00046)
	movw de, !LOWW(_g_timerSetting+0x00048)
	movw ax, sp
	incw ax
	incw ax
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@12_17
.BB@LABEL@12_16:	; if_then_bb155
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 357
	mov a, !LOWW(_g_pre_io_status+0x00001)
	mov1 CY, a.6
	mov a, 0xFFF06
	mov1 a.7, CY
	mov 0xFFF06, a
.BB@LABEL@12_17:	; if_break_bb167
	;***      361 : 		if (g_pre_io_status.refined.Valve.SV6 != O_DRAIN_ALK_PIN_SV6) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 361
	mov a, !LOWW(_g_pre_io_status+0x00001)
	shr a, 0x05
	mov x, a
	mov a, 0xFFF06
	shr a, 0x06
	xor a, x
	bt a.0, $.BB@LABEL@12_19
.BB@LABEL@12_18:	; if_else_bb197
	;***      362 : 			if (ns_delay_ms(&_tick[1], g_timerSetting.t26_onDelayEmptyLevel_s)) {
	;***      363 : 				O_DRAIN_ALK_PIN_SV6 = g_pre_io_status.refined.Valve.SV6;
	;***      364 : 			}
	;***      365 : 		} else
	;***      366 : 			_tick[1] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 366
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x06], ax
	br $.BB@LABEL@12_21
.BB@LABEL@12_19:	; if_then_bb179
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 362
	movw bc, !LOWW(_g_timerSetting+0x00046)
	movw de, !LOWW(_g_timerSetting+0x00048)
	movw ax, sp
	addw ax, #0x0006
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@12_21
.BB@LABEL@12_20:	; if_then_bb187
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 363
	mov a, !LOWW(_g_pre_io_status+0x00001)
	mov1 CY, a.5
	mov a, 0xFFF06
	mov1 a.6, CY
	mov 0xFFF06, a
.BB@LABEL@12_21:	; if_break_bb201
	mov a, #0x80
	;***      367 : 		if ((O_DRAIN_ACID_PIN_SV7 == OFF) & (O_DRAIN_ALK_PIN_SV6 == OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 367
	and a, 0xFFF06
	mov x, a
	mov a, 0xFFF06
	bt a.6, $.BB@LABEL@12_23
.BB@LABEL@12_22:	; if_break_bb201
	cmp0 x
	bz $.BB@LABEL@12_24
.BB@LABEL@12_23:	; if_break_bb219
	;***      368 : 			break;
	;***      369 : 		}
	;***      370 : 		UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 370
	call $!_UpdateMachineStatus
	;***      371 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 371
	call !!_R_WDT_Restart
	br $!.BB@LABEL@12_5
.BB@LABEL@12_24:	; return
	;***      372 : 	}
	;***      373 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 373
	addw sp, #0x0A
	ret
_nostop_WaterSupplyOperation:
	.STACK _nostop_WaterSupplyOperation = 4
	;***      374 : ///**
	;***      375 : // * FlowSensorCheck
	;***      376 : // * 30/11/2021: Checked!
	;***      377 : // * @return 0 is Error, 1 is OK, 2 Still taking
	;***      378 : // */
	;***      379 : //uint8_t FlowSensorCheck(uint32_t *_time) {
	;***      380 : ////	g_flow_value = measureFlowSensor();
	;***      381 : //	if ((g_flow_value < g_numberSetting.upperFlow)
	;***      382 : //			& (g_flow_value > g_numberSetting.lowerFlow)) {
	;***      383 : //		return 1;
	;***      384 : //	} else {
	;***      385 : //		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      386 : //		return 0;
	;***      387 : //	}
	;***      388 : //}
	;***      389 : /**
	;***      390 :  * WaterSupplyOperation
	;***      391 :  * 30/11/2021: Checked by An
	;***      392 :  */
	;***      393 : uint8_t nostop_WaterSupplyOperation(void) {
	;***      394 : 	uint8_t *state = &g_machine_state.waterSupply;
	;***      395 : 	uint32_t *tick = &g_Tick.tickWaterSupply;
	;***      396 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 396
	mov b, !LOWW(_g_machine_state+0x00004)
	cmp0 b
	bz $.BB@LABEL@13_12
.BB@LABEL@13_1:	; entry
	dec b
	bz $.BB@LABEL@13_6
.BB@LABEL@13_2:	; entry
	dec b
	bz $.BB@LABEL@13_7
.BB@LABEL@13_3:	; entry
	dec b
	bz $.BB@LABEL@13_8
.BB@LABEL@13_4:	; entry
	dec b
	bz $.BB@LABEL@13_11
.BB@LABEL@13_5:	; switch_clause_bb43
	;***      397 : 	case 0:
	;***      398 : 		*tick = g_systemTime;
	;***      399 : 		(*state)++;
	;***      400 : 		break;
	;***      401 : 	case 1:
	;***      402 : 		O_SPOUT_WATER_PIN_SV2 = ON;		// SV2 On
	;***      403 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 30000)) {
	;***      404 : 			(*state)++;
	;***      405 : 		}
	;***      406 : 		break;
	;***      407 : 	case 2:
	;***      408 : 		O_SUPPLY_WATER_PIN_SV1 = ON;	// SV1 On
	;***      409 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 500)) {
	;***      410 : 			(*state)++;
	;***      411 : 		}
	;***      412 : 		break;
	;***      413 : 	case 3:
	;***      414 : 		O_SPOUT_WATER_PIN_SV2 = OFF;	// SV2 Off
	;***      415 : //			nostop_measureFlowSensor();
	;***      416 : 		if (ns_delay_ms(&g_Tick.tickWaterSupply, 15000)) {
	;***      417 : 			(*state)++;
	;***      418 : 		}
	;***      419 : 		break;
	;***      420 : 	case 4:
	;***      421 : 		measureFlowSensor();
	;***      422 : 		(*state)++;
	;***      423 : 		break;
	;***      424 : 	default:
	;***      425 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 425
	clrb !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@13_13
.BB@LABEL@13_6:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 402
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 403
	movw bc, #0x7530
	br $.BB@LABEL@13_9
.BB@LABEL@13_7:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 408
	set1 0xFFF01.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 409
	movw bc, #0x01F4
	br $.BB@LABEL@13_9
.BB@LABEL@13_8:	; switch_clause_bb27
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 414
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 416
	movw bc, #0x3A98
.BB@LABEL@13_9:	; switch_clause_bb27
	clrw ax
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x00020)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@13_13
.BB@LABEL@13_10:	; if_then_bb32
	inc !LOWW(_g_machine_state+0x00004)
	br $.BB@LABEL@13_13
.BB@LABEL@13_11:	; switch_clause_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 421
	call $!_measureFlowSensor
	br $.BB@LABEL@13_10
.BB@LABEL@13_12:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 398
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00022), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00020), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 399
	inc b
	mov a, b
	mov !LOWW(_g_machine_state+0x00004), a
.BB@LABEL@13_13:	; switch_break_bb
	;***      426 : 		break;
	;***      427 : 	}
	;***      428 : 	R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 428
	call !!_R_WDT_Restart
	;***      429 : 	return *state == 5 ? 0 : 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 429
	cmp !LOWW(_g_machine_state+0x00004), #0x05
	oneb a
	sknz
.BB@LABEL@13_14:	; switch_break_bb
	clrb a
.BB@LABEL@13_15:	; switch_break_bb
	ret
_stop_waitAlarmConfirm:
	.STACK _stop_waitAlarmConfirm = 6
	;***      430 : }
	;***      431 : void stop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 431
	push hl
	mov [sp+0x00], a
.BB@LABEL@14_1:	; bb2
	pop ax
	push ax
	;***      432 : 	while ((g_rx_data[0] != H_CLEAR) & (g_rx_data[1] != alarm)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 432
	mov a, !LOWW(_g_rx_data+0x00001)
	cmp a, x
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@14_4
.BB@LABEL@14_2:	; bb2
	cmp a, #0x43
	bz $.BB@LABEL@14_4
.BB@LABEL@14_3:	; bb
	;***      433 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 433
	call !!_R_WDT_Restart
	br $.BB@LABEL@14_1
.BB@LABEL@14_4:	; bb15
	;***      434 : 	}
	;***      435 : 	g_rx_data[0] = g_rx_data[1] = OK_ALL;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 435
	clrb !LOWW(_g_rx_data+0x00001)
	clrb !LOWW(_g_rx_data)
	pop hl
	ret
_nostop_waitAlarmConfirm:
	.STACK _nostop_waitAlarmConfirm = 4
	;***      436 : }
	;***      437 : uint8_t nostop_waitAlarmConfirm(enum Control_status alarm) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 437
	mov x, !LOWW(_g_rx_data+0x00001)
	;***      438 : 	if ((g_rx_data[0] != H_CLEAR) & (g_rx_data[1] != alarm)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 438
	cmp x, a
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@15_3
.BB@LABEL@15_1:	; entry
	cmp a, #0x43
	bz $.BB@LABEL@15_3
.BB@LABEL@15_2:	; bb17
	;***      439 : 		return 1;
	;***      440 : 	}
	;***      441 : 	g_rx_data[0] = g_rx_data[1] = OK_ALL;
	;***      442 : 	return 0;
	;***      443 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 443
	oneb a
	ret
.BB@LABEL@15_3:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 441
	clrb !LOWW(_g_rx_data+0x00001)
	clrb !LOWW(_g_rx_data)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 442
	clrb a
	ret
_Voltage1Check_waitReset:
	.STACK _Voltage1Check_waitReset = 18
	;***      444 : /**
	;***      445 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      446 :  * 30/11/2021: Checked by An
	;***      447 :  * @return 0 - OK; 1 - Error
	;***      448 :  */
	;***      449 : uint8_t Voltage1Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 449
	subw sp, #0x0A
	;***      450 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 450
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
.BB@LABEL@16_1:	; entry
	clrb a
.BB@LABEL@16_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@16_3:	; entry
	clrb x
.BB@LABEL@16_4:	; entry
	or x, a
	bnz $.BB@LABEL@16_9
.BB@LABEL@16_5:	; if_then_bb
	;***      451 : 		if (ns_delay_ms(&g_Tick.tickVoltage1Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 451
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
	movw ax, #LOWW(_g_Tick@1+0x0002C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@16_8
.BB@LABEL@16_6:	; bb24
	clrb a
.BB@LABEL@16_7:	; bb24
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 464
	ret
.BB@LABEL@16_8:	; if_then_bb11
	;***      452 : 				g_timerSetting.t11_overVoltage1Time_s * 1000)) {
	;***      453 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_1,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 453
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      454 : 					(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      455 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 455
	call $!_electrolyticOperationOFF
	;***      456 : 			g_alarm.refined.overVoltage1 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 456
	set1 !LOWW(_g_alarm).0
	;***      457 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 457
	mov a, #0x05
	call $!_stop_waitAlarmConfirm
	;***      458 : 			g_alarm.refined.overVoltage1 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 458
	clr1 !LOWW(_g_alarm).0
	;***      459 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 459
	oneb a
	br $.BB@LABEL@16_7
.BB@LABEL@16_9:	; if_else_bb
	;***      460 : 		}
	;***      461 : 	} else
	;***      462 : 		g_Tick.tickVoltage1Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 462
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0002E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0002C), ax
	br $.BB@LABEL@16_6
_Voltage2Check_loop:
	.STACK _Voltage2Check_loop = 18
	;***      463 : 	return 0;
	;***      464 : }
	;***      465 : /**
	;***      466 :  * Alarm every g_timerSetting.t12_overVoltage2Time_s second until voltage valid.
	;***      467 :  * 16/12/2021: Checked by An
	;***      468 :  * @return 0 - OK
	;***      469 :  */
	;***      470 : void Voltage2Check_loop(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 470
	subw sp, #0x0A
	;***      471 : 	if ((g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage2)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 471
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
	bnz $.BB@LABEL@17_8
.BB@LABEL@17_5:	; if_then_bb
	;***      472 : 		if (ns_delay_ms(&g_Tick.tickVoltage2Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 472
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
	movw ax, #LOWW(_g_Tick@1+0x00030)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@17_7
.BB@LABEL@17_6:	; return
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 482
	ret
.BB@LABEL@17_7:	; if_then_bb10
	;***      473 : 				g_timerSetting.t12_overVoltage2Time_s * 1000)) {
	;***      474 : 			g_alarm.refined.overVoltage2 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 474
	set1 !LOWW(_g_alarm).1
	;***      475 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_2,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 475
	movw bc, !LOWW(_g_io_status+0x0000A)
	movw de, !LOWW(_g_io_status+0x0000C)
	movw ax, #0x4106
	addw sp, #0x0A
	br $!_sendToRasPi
.BB@LABEL@17_8:	; if_else_bb
	;***      476 : 					g_io_status.refined.CVCCVoltage);
	;***      477 : 		}
	;***      478 : 	} else {
	;***      479 : 		g_Tick.tickVoltage2Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 479
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00032), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00030), ax
	;***      480 : 		g_alarm.refined.overVoltage2 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 480
	clr1 !LOWW(_g_alarm).1
	br $.BB@LABEL@17_6
_Voltage3Check_waitReset:
	.STACK _Voltage3Check_waitReset = 18
	;***      481 : 	}
	;***      482 : }
	;***      483 : /**
	;***      484 :  * Alarm after g_timerSetting.t13_overVoltage3Time_s second. Turn OFF electrolytic and stop until reset.
	;***      485 :  * 16/12/2021: Checked by An
	;***      486 :  * @return 0 - OK; 1 - Error
	;***      487 :  */
	;***      488 : uint8_t Voltage3Check_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 488
	subw sp, #0x0A
	;***      489 : 	if (g_io_status.refined.CVCCVoltage >= g_numberSetting.upperVoltage3) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 489
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
	bnz $.BB@LABEL@18_9
.BB@LABEL@18_5:	; if_then_bb
	;***      490 : 		if (ns_delay_ms(&g_Tick.tickVoltage3Check,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 490
	movw ax, !LOWW(_g_timerSetting+0x00014)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00016)
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
	bnz $.BB@LABEL@18_8
.BB@LABEL@18_6:	; bb24
	clrb a
.BB@LABEL@18_7:	; bb24
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 503
	ret
.BB@LABEL@18_8:	; if_then_bb11
	;***      491 : 				g_timerSetting.t13_overVoltage3Time_s * 1000)) {
	;***      492 : 			g_alarm.refined.overVoltage3 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 492
	set1 !LOWW(_g_alarm).2
	;***      493 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_3,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 493
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      494 : 					(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      495 : 			stop_waitAlarmConfirm(OVER_VOLTAGE_3);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 495
	mov a, #0x07
	call $!_stop_waitAlarmConfirm
	;***      496 : 			g_alarm.refined.overVoltage3 = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 496
	clr1 !LOWW(_g_alarm).2
	;***      497 : 			return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 497
	oneb a
	br $.BB@LABEL@18_7
.BB@LABEL@18_9:	; if_else_bb
	;***      498 : 		}
	;***      499 : 	} else {
	;***      500 : 		g_Tick.tickVoltage3Check = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 500
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00036), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00034), ax
	br $.BB@LABEL@18_6
_LowVoltageCheck_waitReset:
	.STACK _LowVoltageCheck_waitReset = 18
	;***      501 : 	}
	;***      502 : 	return 0;
	;***      503 : }
	;***      504 : /**
	;***      505 :  * Checked 16/12/2021
	;***      506 :  * @return
	;***      507 :  */
	;***      508 : uint8_t LowVoltageCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 508
	subw sp, #0x0A
	;***      509 : 	if ((g_systemTime - g_TickKeeper.neutralization
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x00], ax
	movw ax, !LOWW(_g_timerSetting+0x00018)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0001A)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	movw bc, ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TickKeeper@2+0x00010)
	movw hl, ax
	movw ax, [sp+0x00]
	sknc
.BB@LABEL@19_1:	; entry
	decw ax
.BB@LABEL@19_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@2+0x00012)
	cmpw ax, bc
	movw ax, hl
	sknz
.BB@LABEL@19_3:	; entry
	cmpw ax, de
.BB@LABEL@19_4:	; entry
	.bc $!.BB@LABEL@19_14
.BB@LABEL@19_5:	; if_then_bb
	;***      510 : 			>= g_timerSetting.t14_lowVoltageStartTime_s * 1000)) {
	;***      511 : 		if ((g_io_status.refined.CVCCVoltage <= g_numberSetting.lowerVoltage)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 511
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
.BB@LABEL@19_6:	; if_then_bb
	clrb a
.BB@LABEL@19_7:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@19_8:	; if_then_bb
	clrb x
.BB@LABEL@19_9:	; if_then_bb
	or x, a
	bnz $.BB@LABEL@19_14
.BB@LABEL@19_10:	; if_then_bb13
	;***      512 : 			if (ns_delay_ms(&g_Tick.tickVoltageLowCheck,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 512
	movw ax, !LOWW(_g_timerSetting+0x0001C)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x0001E)
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
	bnz $.BB@LABEL@19_13
.BB@LABEL@19_11:	; bb36
	clrb a
.BB@LABEL@19_12:	; bb36
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 527
	ret
.BB@LABEL@19_13:	; if_then_bb20
	;***      513 : 					g_timerSetting.t15_lowVoltageDelayTime_s * 1000)) {
	;***      514 : 				electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 514
	call $!_electrolyticOperationOFF
	;***      515 : 				g_alarm.refined.underVoltage = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 515
	set1 !LOWW(_g_alarm).5
	;***      516 : 				sendToRasPi(H_ALARM, UNDER_VOLTAGE,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 516
	movw bc, !LOWW(_g_io_status+0x0000C)
	movw ax, !LOWW(_g_io_status+0x0000A)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4108
	call $!_sendToRasPi
	;***      517 : 						(uint32_t) (g_io_status.refined.CVCCVoltage));
	;***      518 : 				stop_waitAlarmConfirm(UNDER_VOLTAGE);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 518
	mov a, #0x08
	call $!_stop_waitAlarmConfirm
	;***      519 : 				g_alarm.refined.underVoltage = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 519
	clr1 !LOWW(_g_alarm).5
	;***      520 : 				return 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 520
	oneb a
	br $.BB@LABEL@19_12
.BB@LABEL@19_14:	; if_else_bb
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00038), ax
	br $.BB@LABEL@19_11
_OverCurrentCheck_waitReset:
	.STACK _OverCurrentCheck_waitReset = 18
	;***      521 : 			}
	;***      522 : 		} else
	;***      523 : 			g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      524 : 	} else
	;***      525 : 		g_Tick.tickVoltageLowCheck = g_systemTime;
	;***      526 : 	return 0;
	;***      527 : }
	;***      528 : uint8_t OverCurrentCheck_waitReset(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 528
	subw sp, #0x0A
	;***      529 : 	uint32_t _time_count = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 529
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	;***      530 : 	const uint16_t _max_time = 60000;
	;***      531 : 	if (g_systemTime - g_TickKeeper.neutralization >= 5000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 531
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_TickKeeper@2+0x00010)
	movw de, ax
	movw ax, bc
	sknc
.BB@LABEL@20_1:	; entry
	decw ax
.BB@LABEL@20_2:	; entry
	subw ax, !LOWW(_g_TickKeeper@2+0x00012)
	clrw bc
	cmpw ax, bc
	movw ax, de
	sknz
.BB@LABEL@20_3:	; entry
	cmpw ax, #0x1388
.BB@LABEL@20_4:	; entry
	.bc $!.BB@LABEL@20_28
.BB@LABEL@20_5:	; if_then_bb
	;***      532 : 		if ((g_io_status.refined.CVCCCurrent <= g_numberSetting.lowerCurrent)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 532
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
	bnz $.BB@LABEL@20_11
.BB@LABEL@20_6:	; if_then_bb
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
.BB@LABEL@20_7:	; if_then_bb
	clrb a
.BB@LABEL@20_8:	; if_then_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@20_9:	; if_then_bb
	clrb x
.BB@LABEL@20_10:	; if_then_bb
	or x, a
	.bnz $!.BB@LABEL@20_28
.BB@LABEL@20_11:	; if_then_bb21
	mov a, #0x48
	;***      533 : 				| (g_io_status.refined.CVCCCurrent
	;***      534 : 						>= g_numberSetting.upperCurrent)) {
	;***      535 : 			if ((g_alarm.refined.underCurrent == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 535
	and a, !LOWW(_g_alarm)
	bnz $.BB@LABEL@20_19
.BB@LABEL@20_12:	; if_then_bb38
	pop bc
	push bc
	movw ax, [sp+0x02]
	;***      536 : 					& (g_alarm.refined.overCurrent == 0)) {
	;***      537 : 				sendToRasPi(H_ALARM, CURRENT_ABNORMAL,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 537
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4109
	call $!_sendToRasPi
	;***      538 : 						(uint32_t) (g_io_status.refined.CVCCCurrent));
	;***      539 : 				g_alarm.refined.underCurrent =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 539
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
.BB@LABEL@20_13:	; if_then_bb38
	clrb a
.BB@LABEL@20_14:	; if_then_bb38
	cmp0 x
	oneb x
	sknz
.BB@LABEL@20_15:	; if_then_bb38
	clrb x
.BB@LABEL@20_16:	; if_then_bb38
	or x, a
	mov x, #0x40
	skz
.BB@LABEL@20_17:	; bb46
	clrb x
.BB@LABEL@20_18:	; bb47
	mov a, #0xBF
	and a, !LOWW(_g_alarm)
	or a, x
	mov !LOWW(_g_alarm), a
.BB@LABEL@20_19:	; if_break_bb
	;***      540 : 						g_io_status.refined.CVCCCurrent
	;***      541 : 								<= g_numberSetting.lowerCurrent ? 1 : 0;
	;***      542 : 			}
	;***      543 : 			if (g_io_status.refined.CVCCCurrent
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 543
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
.BB@LABEL@20_20:	; if_break_bb
	clrb a
.BB@LABEL@20_21:	; if_break_bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@20_22:	; if_break_bb
	clrb x
.BB@LABEL@20_23:	; if_break_bb
	or x, a
	bnz $.BB@LABEL@20_27
.BB@LABEL@20_24:	; if_then_bb61
	;***      544 : 					>= g_numberSetting.upperCurrent) {
	;***      545 : 				if (ns_delay_ms(&g_Tick.tickCurrentCheck, _max_time)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 545
	clrw ax
	movw de, ax
	movw bc, #0xEA60
	movw ax, #LOWW(_g_Tick@1+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@20_26
.BB@LABEL@20_25:	; if_break_bb79
	;***      546 : 					g_alarm.refined.overCurrent = 1;
	;***      547 : 					sendToRasPi(H_ALARM, OVER_CURRENT,
	;***      548 : 							(uint32_t) (g_io_status.refined.CVCCCurrent));
	;***      549 : 					stop_waitAlarmConfirm(OVER_CURRENT);
	;***      550 : 					g_alarm.refined.overCurrent = 0;
	;***      551 : 					return 1;
	;***      552 : 				}
	;***      553 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 553
	call !!_R_WDT_Restart
	br $.BB@LABEL@20_28
.BB@LABEL@20_26:	; if_then_bb68
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 546
	set1 !LOWW(_g_alarm).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 547
	movw bc, !LOWW(_g_io_status+0x00010)
	movw ax, !LOWW(_g_io_status+0x0000E)
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x410A
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 549
	mov a, #0x0A
	call $!_stop_waitAlarmConfirm
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 550
	clr1 !LOWW(_g_alarm).3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 551
	oneb a
	br $.BB@LABEL@20_29
.BB@LABEL@20_27:	; if_else_bb
	;***      554 : 			} else
	;***      555 : 				g_Tick.tickCurrentCheck = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 555
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0003E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0003C), ax
.BB@LABEL@20_28:	; bb85
	clrb a
.BB@LABEL@20_29:	; bb85
	addw sp, #0x0A
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 559
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@21_1:	; WAIT_RESET
	call $!_electrolyticOperationON
.BB@LABEL@21_2:	; bb
	;***      556 : 		}
	;***      557 : 	}
	;***      558 : 	return 0;
	;***      559 : }
	;***      560 : void ElectrolyticOperation(void) {
	;***      561 : 	WAIT_RESET: electrolyticOperationON();
	;***      562 : 	do {
	;***      563 : 		if (Voltage1Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 563
	call $!_Voltage1Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@21_1
.BB@LABEL@21_3:	; if_break_bb
	;***      564 : 			goto WAIT_RESET;
	;***      565 : 		Voltage2Check_loop();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 565
	call $!_Voltage2Check_loop
	;***      566 : 		if (Voltage3Check_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 566
	call $!_Voltage3Check_waitReset
	cmp0 a
	bnz $.BB@LABEL@21_1
.BB@LABEL@21_4:	; if_break_bb12
	;***      567 : 			goto WAIT_RESET;
	;***      568 : 		if (LowVoltageCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 568
	call $!_LowVoltageCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@21_1
.BB@LABEL@21_5:	; if_break_bb20
	;***      569 : 			goto WAIT_RESET;
	;***      570 : 		if (OverCurrentCheck_waitReset())
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 570
	call $!_OverCurrentCheck_waitReset
	cmp0 a
	bnz $.BB@LABEL@21_1
.BB@LABEL@21_6:	; if_break_bb28
	;***      571 : 			goto WAIT_RESET;
	;***      572 : 		//----------CVCC Alarm Input-----------------
	;***      573 : 		if (I_CVCC_ALARM_IN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 573
	mov a, 0xFFF00
	bf a.4, $.BB@LABEL@21_9
.BB@LABEL@21_7:	; if_break_bb44
	;***      574 : 			g_alarm.refined.cvcc = 1;
	;***      575 : 			electrolyticOperationOFF();
	;***      576 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	;***      577 : 			stop_waitAlarmConfirm(CVCC_ALARM);
	;***      578 : 			g_alarm.refined.cvcc = 0;
	;***      579 : 			goto WAIT_RESET;
	;***      580 : 		}
	;***      581 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 581
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 562
	mov a, 0xFFF07
	shr a, 0x03
	or a, 0xFFF07
	bt a.0, $.BB@LABEL@21_2
.BB@LABEL@21_8:	; bb62
	;***      582 : 	} while ((I_ACID_H_PIN == I_OFF) | (I_ALKALI_H_PIN == I_OFF));
	;***      583 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 583
	br $!_electrolyticOperationOFF
.BB@LABEL@21_9:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 574
	set1 !LOWW(_g_alarm+0x00001).0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 575
	call $!_electrolyticOperationOFF
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 576
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 577
	mov a, #0x12
	call $!_stop_waitAlarmConfirm
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 578
	clr1 !LOWW(_g_alarm+0x00001).0
	br $.BB@LABEL@21_1
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      584 : }
	;***      585 : void solenoidCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 585
	subw sp, #0x04
	;***      586 : 	uint32_t _time_count = 0;
	;***      587 : 	if ((g_flow_value <= 0.1f)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 587
	movw ax, !LOWW(_g_timerSetting+0x00020)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00022)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	addw ax, de
	movw bc, !LOWW(_g_flow_value+0x00002)
	movw de, !LOWW(_g_flow_value)
	bnz $.BB@LABEL@22_3
.BB@LABEL@22_1:	; entry
	bc $.BB@LABEL@22_3
.BB@LABEL@22_2:	; entry
	movw ax, #0x3DCC
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, de
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@22_4
.BB@LABEL@22_3:	; entry.if_break_bb_crit_edge
	clrw ax
	movw [sp+0x02], ax
	movw [sp+0x00], ax
	br $.BB@LABEL@22_5
.BB@LABEL@22_4:	; if_then_bb
	onew ax
	movw [sp+0x02], ax
	decw ax
	movw [sp+0x00], ax
	;***      588 : 			& (_time_count
	;***      589 : 					== g_timerSetting.t17_solenoidLeakageStartTime_s * 1000)) {
	;***      590 : 		_time_count++;
	;***      591 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 591
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@22_5:	; if_break_bb
	;***      592 : 	}
	;***      593 : 	if (_time_count == g_timerSetting.t17_solenoidLeakageStartTime_s * 1000) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 593
	movw ax, !LOWW(_g_timerSetting+0x00020)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00022)
	movw bc, #0x03E8
	mulh
	addw ax, hl
	movw bc, ax
	movw ax, [sp+0x00]
	cmpw ax, bc
	movw ax, [sp+0x02]
	sknz
.BB@LABEL@22_6:	; if_break_bb
	cmpw ax, de
.BB@LABEL@22_7:	; if_break_bb
	addw sp, #0x04
	bnz $.BB@LABEL@22_9
.BB@LABEL@22_8:	; if_then_bb20
	;***      594 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 594
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi
.BB@LABEL@22_9:	; return
	;***      595 : 	}
	;***      596 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 596
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      597 : void saltWaterTankFullCheck(void) {
	;***      598 : 	if (I_SALT_H_PIN == 1) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 598
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@23_2
.BB@LABEL@23_1:	; return
	;***      599 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      600 : 		electrolyticOperationOFF();
	;***      601 : 		//TODO: Fault in the flowchart
	;***      602 : 	}
	;***      603 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 603
	ret
.BB@LABEL@23_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 599
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 600
	br $!_electrolyticOperationOFF
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      604 : void saltWaterTankEmptyCheck(void) {
	;***      605 : 	if (I_SALT_L_PIN == 0) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 605
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@24_2
.BB@LABEL@24_1:	; if_then_bb
	;***      606 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 606
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi
.BB@LABEL@24_2:	; return
	;***      607 : 		//TODO: Control OFF
	;***      608 : 	}
	;***      609 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 609
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      610 : void acidWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 610
	movw de, #0xFF07
	;***      611 : 	if (((I_ACID_L_PIN == 0) & ((I_ACID_M_PIN == 1) | (I_ACID_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 611
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
.BB@LABEL@25_1:	; return
	;***      612 : 			| ((I_ACID_M_PIN == 0) & (I_ACID_H_PIN == 1))) {
	;***      613 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      614 : 		//TODO: Control OFF
	;***      615 : 	}
	;***      616 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 616
	ret
.BB@LABEL@25_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 613
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      617 : void alkalineWaterTankSkipCheck(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 617
	push hl
	;***      618 : 	if (((I_ALKALI_L_PIN == 0) & ((I_ALKALI_M_PIN == 1) | (I_ALKALI_H_PIN == 1)))
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 618
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
.BB@LABEL@26_1:	; return
	;***      619 : 			| ((I_ALKALI_M_PIN == 0) & (I_ALKALI_H_PIN == 1))) {
	;***      620 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      621 : 		//TODO: Control OFF
	;***      622 : 	}
	;***      623 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 623
	ret
.BB@LABEL@26_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 620
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      624 : 
	;***      625 : uint8_t FilterReplacementCheck(void) {
	;***      626 : 
	;***      627 : 	return 0;
	;***      628 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 628
	clrb a
	ret
_ElectrolyzeWaterGeneration:
	.STACK _ElectrolyzeWaterGeneration = 4
	;***      629 : void ElectrolyzeWaterGeneration(void) {
	;***      630 : 	if ((I_ACID_L_PIN == I_OFF) | (I_ALKALI_L_PIN = I_OFF)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 630
	mov a, 0xFFF07
	set1 0xFFF00.5
	shr a, 0x01
	mov x, a
	mov a, 0xFFF00
	shr a, 0x05
	or a, x
	bt a.0, $.BB@LABEL@28_4
.BB@LABEL@28_1:	; if_else_bb
	movw hl, #0xFF07
	;***      631 : 		g_machine_state.mode = ELECTROLYTIC_GENERATION;
	;***      632 : 		electrolyticOperationON();
	;***      633 : 	} else if ((I_ACID_H_PIN = I_ON) & (I_ALKALI_H_PIN = I_ON)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 633
	clr1 [hl].3
	mov a, [hl]
	clr1 [hl].0
	shr a, 0x03
	and a, [hl]
	bt a.0, $.BB@LABEL@28_3
.BB@LABEL@28_2:	; return
	;***      634 : 		g_machine_state.mode = pre_machine_mode;
	;***      635 : 		electrolyticOperationOFF();
	;***      636 : 	}
	;***      637 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 637
	ret
.BB@LABEL@28_3:	; if_then_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 634
	mov a, !LOWW(_pre_machine_mode@3)
	mov !LOWW(_g_machine_state+0x00007), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 635
	br $!_electrolyticOperationOFF
.BB@LABEL@28_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 631
	mov !LOWW(_g_machine_state+0x00007), #0x08
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 632
	br $!_electrolyticOperationON
_WaterWashingMode_nostop:
	.STACK _WaterWashingMode_nostop = 4
	;***      638 : /**
	;***      639 :  * Tested: 10/12/2021 by Mr.An
	;***      640 :  */
	;***      641 : void WaterWashingMode_nostop(void) {
	;***      642 : 	uint8_t *state = &g_machine_state.water;
	;***      643 : 	uint32_t *tick = &g_Tick.tickWater;
	;***      644 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 644
	mov a, !LOWW(_g_machine_state+0x00002)
	cmp0 a
	bz $.BB@LABEL@29_3
.BB@LABEL@29_1:	; entry
	dec a
	bz $.BB@LABEL@29_4
.BB@LABEL@29_2:	; switch_clause_bb20
	;***      645 : 	case 0:
	;***      646 : 		g_machine_state.mode = WATER_WASHING;
	;***      647 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	;***      648 : 		g_color = WHITE;
	;***      649 : 		*tick = g_systemTime;
	;***      650 : 		(*state)++;
	;***      651 : 		break;
	;***      652 : 	case 1:
	;***      653 : 		if (DETECT_U == I_ON) {
	;***      654 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      655 : 			g_color = BLACK;
	;***      656 : 			(*state)++;
	;***      657 : 			g_machine_state.mode = BUSY;
	;***      658 : 		}
	;***      659 : 		break;
	;***      660 : 	default:
	;***      661 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 661
	clrb !LOWW(_g_machine_state+0x00002)
	br $.BB@LABEL@29_6
.BB@LABEL@29_3:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 646
	mov !LOWW(_g_machine_state+0x00007), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 647
	set1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 648
	mov !LOWW(_g_color), #0x02
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 649
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0001A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 650
	inc !LOWW(_g_machine_state+0x00002)
	br $.BB@LABEL@29_6
.BB@LABEL@29_4:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 653
	mov a, 0xFFF07
	bt a.5, $.BB@LABEL@29_6
.BB@LABEL@29_5:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 654
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 655
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 656
	inc !LOWW(_g_machine_state+0x00002)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 657
	mov !LOWW(_g_machine_state+0x00007), #0x07
.BB@LABEL@29_6:	; switch_break_bb
	;***      662 : 		break;
	;***      663 : 	}
	;***      664 : 	handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 664
	mov a, !LOWW(_g_color)
	br $!_handSensorLED
_HandWashingMode_nostop:
	.STACK _HandWashingMode_nostop = 6
	;***      665 : }
	;***      666 : /**
	;***      667 :  * Tested: 10/12/2021 by Mr.An
	;***      668 :  */
	;***      669 : void HandWashingMode_nostop(void) {
	;***      670 : 	uint8_t *state = &g_machine_state.handwash;
	;***      671 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      672 : 	const uint32_t delayPump_ms = 50;
	;***      673 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 673
	mov a, !LOWW(_g_machine_state+0x00003)
	cmp0 a
	bz $.BB@LABEL@30_9
.BB@LABEL@30_1:	; entry
	dec a
	bz $.BB@LABEL@30_10
.BB@LABEL@30_2:	; entry
	dec a
	bz $.BB@LABEL@30_13
.BB@LABEL@30_3:	; entry
	dec a
	.bz $!.BB@LABEL@30_17
.BB@LABEL@30_4:	; entry
	dec a
	.bz $!.BB@LABEL@30_21
.BB@LABEL@30_5:	; entry
	dec a
	.bz $!.BB@LABEL@30_27
.BB@LABEL@30_6:	; entry
	dec a
	.bz $!.BB@LABEL@30_32
.BB@LABEL@30_7:	; entry
	dec a
	.bz $!.BB@LABEL@30_35
.BB@LABEL@30_8:	; switch_clause_bb99
	;***      674 : 	case 0:
	;***      675 : //			*state = DETECT_U == I_ON?1:0;
	;***      676 : 		*state = 1;
	;***      677 : 		*tick = g_systemTime;
	;***      678 : 		break;
	;***      679 : 	case 1:
	;***      680 : 		g_machine_state.mode = HAND_WASHING;
	;***      681 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      682 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      683 : 			O_PUMP_ALK_PIN = ON;
	;***      684 : 			handSensorLED(BLUE);
	;***      685 : 			(*state)++;
	;***      686 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      687 : 		}
	;***      688 : 		break;
	;***      689 : 	case 2:
	;***      690 : 		if (ns_delay_ms(tick,
	;***      691 : 				g_timerSetting.t51_alkalineWaterSpoutingTime_s * 1000
	;***      692 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      693 : 			O_PUMP_ALK_PIN = OFF;
	;***      694 : 			O_SPOUT_ACID_PIN_SV3 = ON;
	;***      695 : 			(*state)++;
	;***      696 : 		}
	;***      697 : 		break;
	;***      698 : 	case 3:
	;***      699 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      700 : 			O_PUMP_ACID_PIN = ON;
	;***      701 : 			handSensorLED(RED);
	;***      702 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      703 : 			(*state)++;
	;***      704 : 		}
	;***      705 : 		break;
	;***      706 : 	case 4:
	;***      707 : 		if (ns_delay_ms(tick,
	;***      708 : 				g_timerSetting.t54_overLapTime_ms - delayPump_ms)) {
	;***      709 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      710 : 			(*state)++;
	;***      711 : 		}
	;***      712 : 		break;
	;***      713 : 	case 5:
	;***      714 : 		if (ns_delay_ms(tick,
	;***      715 : 				g_timerSetting.t52_acidWaterSpoutingTime_s * 1000
	;***      716 : 						- g_timerSetting.t54_overLapTime_ms)) {
	;***      717 : 			O_PUMP_ACID_PIN = OFF;
	;***      718 : 			handSensorLED(WHITE);
	;***      719 : 			O_SPOUT_WATER_PIN_SV2 = ON;
	;***      720 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      721 : 			(*state)++;
	;***      722 : 		}
	;***      723 : 		break;
	;***      724 : 	case 6:
	;***      725 : 		if (ns_delay_ms(tick, g_timerSetting.t54_overLapTime_ms)) {
	;***      726 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      727 : 			(*state)++;
	;***      728 : 		}
	;***      729 : 		break;
	;***      730 : 	case 7:
	;***      731 : 		if (ns_delay_ms(tick,
	;***      732 : 				g_timerSetting.t53_washingWaterSpoutingTime_s * 1000)) {
	;***      733 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	;***      734 : 			handSensorLED(BLACK);
	;***      735 : 			(*state)++;
	;***      736 : 			g_machine_state.mode = BUSY;
	;***      737 : 			sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      738 : 		}
	;***      739 : 		break;
	;***      740 : 	default:
	;***      741 : 		g_machine_state.user = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 741
	clrb !LOWW(_g_machine_state+0x00006)
	;***      742 : 		(*state) = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 742
	clrb !LOWW(_g_machine_state+0x00003)
	ret
.BB@LABEL@30_9:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 676
	oneb !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 677
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0001C), ax
	ret
.BB@LABEL@30_10:	; switch_clause_bb9
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 680
	oneb !LOWW(_g_machine_state+0x00007)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 681
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 682
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@30_18
.BB@LABEL@30_11:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 683
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 684
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 685
	inc !LOWW(_g_machine_state+0x00003)
.BB@LABEL@30_12:	; if_then_bb
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	br $!_sendToRasPi
.BB@LABEL@30_13:	; switch_clause_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 690
	movw ax, !LOWW(_g_timerSetting+0x00024)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x00026)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x00030)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@30_14:	; switch_clause_bb18
	decw ax
.BB@LABEL@30_15:	; switch_clause_bb18
	subw ax, !LOWW(_g_timerSetting+0x00032)
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@30_24
.BB@LABEL@30_16:	; if_then_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 693
	clr1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 694
	set1 0xFFF07.6
	br $.BB@LABEL@30_26
.BB@LABEL@30_17:	; switch_clause_bb33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 699
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@30_18:	; switch_clause_bb33
	bz $.BB@LABEL@30_30
.BB@LABEL@30_19:	; if_then_bb40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 700
	set1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 701
	oneb a
	call $!_handSensorLED
.BB@LABEL@30_20:	; if_then_bb40
	clrw ax
	movw de, ax
	clrw bc
	movw ax, #0x5313
	call $!_sendToRasPi
	br $.BB@LABEL@30_26
.BB@LABEL@30_21:	; switch_clause_bb45
	movw ax, #0xFFCE
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 707
	addw ax, !LOWW(_g_timerSetting+0x00030)
	movw bc, ax
	clrw ax
	decw ax
	sknc
.BB@LABEL@30_22:	; switch_clause_bb45
	incw ax
.BB@LABEL@30_23:	; switch_clause_bb45
	addw ax, !LOWW(_g_timerSetting+0x00032)
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@30_24:	; switch_clause_bb45
	bz $.BB@LABEL@30_33
.BB@LABEL@30_25:	; if_then_bb54
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 709
	clr1 0xFFF07.7
.BB@LABEL@30_26:	; if_then_bb54
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 746
	ret
.BB@LABEL@30_27:	; switch_clause_bb59
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 714
	movw ax, !LOWW(_g_timerSetting+0x00028)
	movw bc, #0x03E8
	mulhu
	movw hl, ax
	push bc
	pop de
	movw ax, !LOWW(_g_timerSetting+0x0002A)
	movw bc, #0x03E8
	mulh
	addw ax, de
	movw de, ax
	movw ax, hl
	subw ax, !LOWW(_g_timerSetting+0x00030)
	movw bc, ax
	movw ax, de
	sknc
.BB@LABEL@30_28:	; switch_clause_bb59
	decw ax
.BB@LABEL@30_29:	; switch_clause_bb59
	subw ax, !LOWW(_g_timerSetting+0x00032)
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@30_30:	; switch_clause_bb59
	bz $.BB@LABEL@30_37
.BB@LABEL@30_31:	; if_then_bb69
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 717
	clr1 0xFFF06.2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 718
	mov a, #0x02
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 719
	set1 0xFFF05.5
	br $.BB@LABEL@30_20
.BB@LABEL@30_32:	; switch_clause_bb74
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 725
	movw bc, !LOWW(_g_timerSetting+0x00030)
	movw de, !LOWW(_g_timerSetting+0x00032)
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
.BB@LABEL@30_33:	; switch_clause_bb74
	bz $.BB@LABEL@30_37
.BB@LABEL@30_34:	; if_then_bb81
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 726
	clr1 0xFFF07.6
	br $.BB@LABEL@30_26
.BB@LABEL@30_35:	; switch_clause_bb86
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 731
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
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@30_37
.BB@LABEL@30_36:	; if_then_bb94
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 733
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 734
	clrb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 735
	inc !LOWW(_g_machine_state+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 736
	mov !LOWW(_g_machine_state+0x00007), #0x07
	br $!.BB@LABEL@30_12
.BB@LABEL@30_37:	; return
	;***      743 : 		break;
	;***      744 : 	}
	;***      745 : 
	;***      746 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 746
	ret
_AcidWaterMode_nostop:
	.STACK _AcidWaterMode_nostop = 6
	;***      747 : /**
	;***      748 :  * Tested: 10/12/2021 by Mr.An
	;***      749 :  */
	;***      750 : void AcidWaterMode_nostop(void) {
	;***      751 : 	uint8_t *state = &g_machine_state.acid;
	;***      752 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      753 : 	const uint32_t delayPump_ms = 50;
	;***      754 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 754
	mov a, !LOWW(_g_machine_state+0x00001)
	cmp0 a
	bz $.BB@LABEL@31_5
.BB@LABEL@31_1:	; entry
	dec a
	bz $.BB@LABEL@31_8
.BB@LABEL@31_2:	; entry
	dec a
	bz $.BB@LABEL@31_10
.BB@LABEL@31_3:	; entry
	dec a
	bz $.BB@LABEL@31_13
.BB@LABEL@31_4:	; switch_clause_bb62
	;***      755 : 	case 0:
	;***      756 : 		*state = DETECT_U == I_ON ? 1 : 0;
	;***      757 : 		*tick = g_systemTime;
	;***      758 : 		break;
	;***      759 : 	case 1:
	;***      760 : 		O_SPOUT_ACID_PIN_SV3 = ON;
	;***      761 : 		g_color = RED;
	;***      762 : 		handSensorLED(g_color);
	;***      763 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      764 : 			O_PUMP_ACID_PIN = ON;
	;***      765 : 			(*state)++;
	;***      766 : 		}
	;***      767 : 		break;
	;***      768 : 	case 2:
	;***      769 : 		if (ns_delay_ms(tick, g_timerSetting.t56_acidWaterDownTime_s * 1000)
	;***      770 : 				| (DETECT_D == I_ON)) {
	;***      771 : 			O_PUMP_ACID_PIN = OFF;
	;***      772 : 			(*state)++;
	;***      773 : 		}
	;***      774 : 		break;
	;***      775 : 	case 3:
	;***      776 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      777 : 			O_SPOUT_ACID_PIN_SV3 = OFF;
	;***      778 : 			g_color = BLACK;
	;***      779 : 			handSensorLED(g_color);
	;***      780 : 			(*state)++;
	;***      781 : 		}
	;***      782 : 		break;
	;***      783 : 	default:
	;***      784 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 784
	clrb !LOWW(_g_machine_state+0x00001)
	ret
.BB@LABEL@31_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 756
	mov a, 0xFFF07
	mov1 CY, a.5
	oneb a
	sknc
.BB@LABEL@31_6:	; bb13
	clrb a
.BB@LABEL@31_7:	; bb14
	mov !LOWW(_g_machine_state+0x00001), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 757
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00014), ax
	ret
.BB@LABEL@31_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 760
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 761
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 762
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 763
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@31_15
.BB@LABEL@31_9:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 764
	set1 0xFFF06.2
	br $.BB@LABEL@31_12
.BB@LABEL@31_10:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 769
	movw ax, !LOWW(_g_timerSetting+0x00034)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00036)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x00014)
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
	bz $.BB@LABEL@31_15
.BB@LABEL@31_11:	; if_then_bb45
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 771
	clr1 0xFFF06.2
.BB@LABEL@31_12:	; if_then_bb45
	inc !LOWW(_g_machine_state+0x00001)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 787
	ret
.BB@LABEL@31_13:	; switch_clause_bb50
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 776
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@31_15
.BB@LABEL@31_14:	; if_then_bb56
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 777
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 778
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 779
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@31_12
.BB@LABEL@31_15:	; return
	;***      785 : 		break;
	;***      786 : 	}
	;***      787 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 787
	ret
_AlkalineWaterMode_nostop:
	.STACK _AlkalineWaterMode_nostop = 6
	;***      788 : /**
	;***      789 :  * Tested: 10/12/2021 by Mr.An
	;***      790 :  */
	;***      791 : void AlkalineWaterMode_nostop(void) {
	;***      792 : 	uint8_t *state = &g_machine_state.akaline;
	;***      793 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      794 : 	const uint32_t delayPump_ms = 50;
	;***      795 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 795
	mov a, !LOWW(_g_machine_state)
	cmp0 a
	bz $.BB@LABEL@32_5
.BB@LABEL@32_1:	; entry
	dec a
	bz $.BB@LABEL@32_8
.BB@LABEL@32_2:	; entry
	dec a
	bz $.BB@LABEL@32_10
.BB@LABEL@32_3:	; entry
	dec a
	bz $.BB@LABEL@32_13
.BB@LABEL@32_4:	; switch_clause_bb62
	;***      796 : 	case 0:
	;***      797 : 		*state = DETECT_U == I_ON ? 1 : 0;
	;***      798 : 		*tick = g_systemTime;
	;***      799 : 		break;
	;***      800 : 	case 1:
	;***      801 : 		O_SPOUT_ALK_PIN_SV4 = ON;
	;***      802 : 		g_color = BLUE;
	;***      803 : 		handSensorLED(g_color);
	;***      804 : 		if (ns_delay_ms(tick, delayPump_ms)) {
	;***      805 : 			O_PUMP_ALK_PIN = ON;
	;***      806 : 			(*state)++;
	;***      807 : 		}
	;***      808 : 		break;
	;***      809 : 	case 2:
	;***      810 : 		if (ns_delay_ms(tick, g_timerSetting.t59_alkalineWaterDownTime_s * 1000)
	;***      811 : 				| (DETECT_D == I_ON)) {
	;***      812 : 			O_PUMP_ALK_PIN = OFF;
	;***      813 : 			(*state)++;
	;***      814 : 		}
	;***      815 : 		break;
	;***      816 : 	case 3:
	;***      817 : 		if (ns_delay_ms(tick, WATER_HAMER_TIME_MS)) {
	;***      818 : 			O_SPOUT_ALK_PIN_SV4 = OFF;
	;***      819 : 			g_color = BLACK;
	;***      820 : 			handSensorLED(g_color);
	;***      821 : 			(*state)++;
	;***      822 : 		}
	;***      823 : 		break;
	;***      824 : 	default:
	;***      825 : 		*state = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 825
	clrb !LOWW(_g_machine_state)
	ret
.BB@LABEL@32_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 797
	mov a, 0xFFF07
	mov1 CY, a.5
	oneb a
	sknc
.BB@LABEL@32_6:	; bb13
	clrb a
.BB@LABEL@32_7:	; bb14
	mov !LOWW(_g_machine_state), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 798
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00010), ax
	ret
.BB@LABEL@32_8:	; switch_clause_bb19
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 801
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 802
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 803
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 804
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@32_15
.BB@LABEL@32_9:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 805
	set1 0xFFF06.1
	br $.BB@LABEL@32_12
.BB@LABEL@32_10:	; switch_clause_bb30
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 810
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
	bz $.BB@LABEL@32_15
.BB@LABEL@32_11:	; if_then_bb45
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 812
	clr1 0xFFF06.1
.BB@LABEL@32_12:	; if_then_bb45
	inc !LOWW(_g_machine_state)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 828
	ret
.BB@LABEL@32_13:	; switch_clause_bb50
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 817
	clrw ax
	movw de, ax
	movw bc, #0x000A
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@32_15
.BB@LABEL@32_14:	; if_then_bb56
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 818
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 819
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 820
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@32_12
.BB@LABEL@32_15:	; return
	;***      826 : 		break;
	;***      827 : 	}
	;***      828 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 828
	ret
_CallanCleaningMode_nostop:
	.STACK _CallanCleaningMode_nostop = 6
	;***      829 : 
	;***      830 : void CallanCleaningMode_nostop(void) {
	;***      831 : 	if ((g_TickKeeper.SV1_OFF_minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 831
	movw de, !LOWW(_g_timerSetting+0x0003E)
	movw bc, !LOWW(_g_timerSetting+0x0003C)
	movw ax, !LOWW(_g_TickKeeper@2+0x0000E)
	cmpw ax, de
	movw ax, !LOWW(_g_TickKeeper@2+0x0000C)
	sknz
.BB@LABEL@33_1:	; entry
	cmpw ax, bc
.BB@LABEL@33_2:	; entry
	movw hl, !LOWW(_g_TickKeeper@2+0x00004)
	movw ax, !LOWW(_g_TickKeeper@2+0x00006)
	bc $.BB@LABEL@33_7
.BB@LABEL@33_3:	; entry
	cmpw ax, de
	movw ax, hl
	sknz
.BB@LABEL@33_4:	; entry
	cmpw ax, bc
.BB@LABEL@33_5:	; entry
	bc $.BB@LABEL@33_7
.BB@LABEL@33_6:	; if_then_bb
	;***      832 : 			>= g_timerSetting.t61_curranCleaningIntervalTime_h)
	;***      833 : 			& (g_TickKeeper.SV2_OFF_minutes
	;***      834 : 					>= g_timerSetting.t61_curranCleaningIntervalTime_h)) {
	;***      835 : 		g_callan_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 835
	oneb !LOWW(_g_callan_clear_flag@6)
	;***      836 : 		g_Tick.tickCustom[6] = g_Tick.tickCustom[7] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 836
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0007E), ax
	movw !LOWW(_g_Tick@1+0x0007A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0007C), ax
	movw !LOWW(_g_Tick@1+0x00078), ax
	;***      837 : 		O_SPOUT_WATER_PIN_SV2 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 837
	set1 0xFFF05.5
.BB@LABEL@33_7:	; if_break_bb
	;***      838 : 	}
	;***      839 : 	if (g_callan_clear_flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 839
	cmp0 !LOWW(_g_callan_clear_flag@6)
	bz $.BB@LABEL@33_14
.BB@LABEL@33_8:	; if_then_bb18
	;***      840 : 		if (ns_delay_ms(&g_Tick.tickCustom[6], 500)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 840
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick@1+0x00078)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_12
.BB@LABEL@33_9:	; if_then_bb23
	;***      841 : 			g_color = g_color == WHITE ? BLACK : WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 841
	cmp !LOWW(_g_color), #0x02
	clrb a
	skz
.BB@LABEL@33_10:	; bb28
	mov a, #0x02
.BB@LABEL@33_11:	; bb29
	mov !LOWW(_g_color), a
	;***      842 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 842
	call $!_handSensorLED
.BB@LABEL@33_12:	; if_break_bb34
	;***      843 : 		}
	;***      844 : 		if (ns_delay_ms(&g_Tick.tickCustom[7],
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 844
	movw ax, !LOWW(_g_timerSetting+0x00040)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00042)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
	movw ax, #LOWW(_g_Tick@1+0x0007C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@33_14
.BB@LABEL@33_13:	; if_then_bb41
	;***      845 : 				g_timerSetting.t62_callanWashSpoutingTime_s * 1000)) {
	;***      846 : 			g_callan_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 846
	clrb !LOWW(_g_callan_clear_flag@6)
	;***      847 : 			O_SPOUT_WATER_PIN_SV2 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 847
	clr1 0xFFF05.5
	;***      848 : 			g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 848
	clrb !LOWW(_g_color)
	;***      849 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 849
	clrb a
	br $!_handSensorLED
.BB@LABEL@33_14:	; return
	;***      850 : 		}
	;***      851 : 	}
	;***      852 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 852
	ret
_main_init_20211111:
	.STACK _main_init_20211111 = 18
	;***      853 : // Newest
	;***      854 : void main_init_20211111(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 854
	subw sp, #0x0A
	;***      855 : 
	;***      856 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 856
	call $!_UpdateMachineStatus
	;***      857 : 	InitialOperationModeStart(); //Worked!!;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 857
	call $!_InitialOperationModeStart
	;***      858 : 
	;***      859 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 859
	call $!_UpdateMachineStatus
.BB@LABEL@34_1:	; bb1
	;***      860 : 	while (nostop_WaterSupplyOperation()) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 860
	call $!_nostop_WaterSupplyOperation
	cmp0 a
	bnz $.BB@LABEL@34_1
.BB@LABEL@34_2:	; bb5
	;***      861 : //		if(ns_delay_ms(&g_Tick.tickCustom[0], 200)){
	;***      862 : //			P6_bit.no3 = ~P6_bit.no3;
	;***      863 : //		}
	;***      864 : 	}
	;***      865 : 	if (g_io_status.refined.FlowValue < g_numberSetting.lowerFlow) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 865
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
.BB@LABEL@34_3:	; bb5
	clrb a
.BB@LABEL@34_4:	; bb5
	cmp0 x
	oneb x
	sknz
.BB@LABEL@34_5:	; bb5
	clrb x
.BB@LABEL@34_6:	; bb5
	or x, a
	bnz $.BB@LABEL@34_8
.BB@LABEL@34_7:	; if_then_bb
	movw ax, [sp+0x04]
	movw bc, ax
	pop de
	push de
	;***      866 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, g_io_status.refined.FlowValue);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 866
	movw ax, #0x4104
	call $!_sendToRasPi
.BB@LABEL@34_8:	; if_break_bb
	;***      867 : 	}
	;***      868 : 
	;***      869 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 869
	call $!_UpdateMachineStatus
	;***      870 : 	ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 870
	call $!_ElectrolyticOperation
	;***      871 : 	UpdateMachineStatus();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 871
	addw sp, #0x0A
	br $!_UpdateMachineStatus
_main_loop_20211111:
	.STACK _main_loop_20211111 = 4
	;***      872 : 
	;***      873 : }
	;***      874 : void main_loop_20211111(void) {
	;***      875 : 	ElectrolyzeWaterGeneration();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 875
	br $!_ElectrolyzeWaterGeneration
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      876 : 
	;***      877 : //	WaterWashingMode_nostop();
	;***      878 : 
	;***      879 : }
	;***      880 : 
	;***      881 : /**
	;***      882 :  * 30/11/2021: Checked by An
	;***      883 :  */
	;***      884 : void electrolyticOperationON(void) {
	;***      885 : 	//Electrolytic operation ON
	;***      886 : 	O_SUPPLY_WATER_PIN_SV1 = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 886
	set1 0xFFF01.7
	;***      887 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 887
	set1 0xFFF0E.2
	;***      888 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 888
	set1 0xFFF06.0
	;***      889 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 889
	oneb !LOWW(_g_electrolytic_flag)
	;***      890 : 	g_TickKeeper.neutralization =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 890
	movw bc, !LOWW(_g_TickKeeper@2+0x00012)
	movw ax, !LOWW(_g_TickKeeper@2+0x00010)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@36_3
.BB@LABEL@36_1:	; entry
	bc $.BB@LABEL@36_3
.BB@LABEL@36_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@36_3:	; bb6
	movw ax, de
	movw !LOWW(_g_TickKeeper@2+0x00010), ax
	movw ax, bc
	movw !LOWW(_g_TickKeeper@2+0x00012), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 894
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      891 : 			g_TickKeeper.neutralization == 0 ?
	;***      892 : 					g_systemTime : g_TickKeeper.neutralization;
	;***      893 : 	//TODO: Add Neutralization timer ON
	;***      894 : }
	;***      895 : /**
	;***      896 :  * 30/11/2021: Checked by An, missing Neutralization timer OFF
	;***      897 :  */
	;***      898 : void electrolyticOperationOFF(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 898
	clrw ax
	;***      899 : 	//TODO: Add Neutralization timer OFF
	;***      900 : 	g_TickKeeper.neutralization = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 900
	movw !LOWW(_g_TickKeeper@2+0x00012), ax
	movw !LOWW(_g_TickKeeper@2+0x00010), ax
	;***      901 : 	//Electrolytic operation OFF
	;***      902 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 902
	clr1 0xFFF0E.2
	;***      903 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 903
	clr1 0xFFF06.0
	;***      904 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 904
	mov a, #0x05
	call !!_delay
	;***      905 : 	O_SUPPLY_WATER_PIN_SV1 = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 905
	clr1 0xFFF01.7
	;***      906 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 906
	clrb !LOWW(_g_electrolytic_flag)
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 18
	;***      907 : }
	;***      908 : 
	;***      909 : float measureFlowSensor(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 909
	subw sp, #0x0A
	;***      910 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 910
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
.BB@LABEL@38_1:	; bb26
	;***      911 : 	float flow_pluse = 0.0;
	;***      912 : 	uint8_t flow_pulse_state = I_OFF;
	;***      913 : 	while (!ns_delay_ms(&stamp_flow_sensor,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 913
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00006)
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
	bnz $.BB@LABEL@38_7
.BB@LABEL@38_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      914 : 			g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***      915 : 		if (I_FLOW_PLUSE_PIN != flow_pulse_state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 915
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@38_6
.BB@LABEL@38_3:	; if_then_bb
	;***      916 : 			if (I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 916
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@38_5
.BB@LABEL@38_4:	; if_then_bb19
	movw ax, #0x3F80
	;***      917 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 917
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
.BB@LABEL@38_5:	; if_break_bb
	;***      918 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 918
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@38_6:	; if_break_bb25
	;***      919 : 		}
	;***      920 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 920
	call !!_R_WDT_Restart
	br $.BB@LABEL@38_1
.BB@LABEL@38_7:	; bb38
	movw ax, #0x3F33
	;***      921 : 	}
	;***      922 : 	g_io_status.refined.FlowValue = (flow_pluse * 0.7 * 60 / 1000)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 922
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
	movw bc, !LOWW(_g_timerSetting+0x00006)
	movw ax, !LOWW(_g_timerSetting+0x00004)
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
	;***      923 : 			/ g_timerSetting.t3_flowSensorMonitorTime_s; // L/minutes
	;***      924 : 	return g_io_status.refined.FlowValue;
	;***      925 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 925
	movw bc, ax
	movw ax, de
	addw sp, #0x0A
	ret
_nostop_measureFlowSensor:
	.STACK _nostop_measureFlowSensor = 12
	;***      926 : 
	;***      927 : uint8_t _pre_flow_state = I_OFF;
	;***      928 : float _flow_pulse;
	;***      929 : float nostop_measureFlowSensor(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 929
	subw sp, #0x04
	;***      930 : 	uint8_t *state = &g_machine_state.flowSensor;
	;***      931 : 	uint32_t *tick = &g_Tick.tickFlowMeasurment;
	;***      932 : 	switch (*state) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 932
	mov a, !LOWW(_g_machine_state+0x00005)
	cmp0 a
	bz $.BB@LABEL@39_4
.BB@LABEL@39_1:	; entry
	dec a
	bz $.BB@LABEL@39_5
.BB@LABEL@39_2:	; entry
	dec a
	bz $.BB@LABEL@39_12
.BB@LABEL@39_3:	; switch_clause_bb60
	clrb !LOWW(_g_machine_state+0x00005)
	br $.BB@LABEL@39_11
.BB@LABEL@39_4:	; switch_clause_bb
	;***      933 : 	case 0:
	;***      934 : 		if (ns_delay_ms(tick, g_timerSetting.t2_flowSensorStartTime_s)) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 934
	movw bc, !LOWW(_g_timerSetting)
	movw de, !LOWW(_g_timerSetting+0x00002)
	br $.BB@LABEL@39_9
.BB@LABEL@39_5:	; switch_clause_bb13
	;***      935 : 			(*state)++;
	;***      936 : 		}
	;***      937 : 		break;
	;***      938 : 	case 1:
	;***      939 : 		if (_pre_flow_state != I_FLOW_PLUSE_PIN) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 939
	mov x, !LOWW(__pre_flow_state)
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@39_8
.BB@LABEL@39_6:	; if_then_bb23
	;***      940 : 			_pre_flow_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 940
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov !LOWW(__pre_flow_state), a
	;***      941 : 			if (I_FLOW_PLUSE_PIN == I_ON) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 941
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@39_8
.BB@LABEL@39_7:	; if_then_bb34
	movw ax, #0x3F80
	;***      942 : 				_flow_pulse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 942
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
.BB@LABEL@39_8:	; if_break_bb38
	;***      943 : 			}
	;***      944 : 		}
	;***      945 : 		if (ns_delay_ms(tick,
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 945
	movw ax, !LOWW(_g_timerSetting+0x00004)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00006)
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw de, ax
.BB@LABEL@39_9:	; if_break_bb38
	movw ax, #LOWW(_g_Tick@1+0x00024)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	skz
.BB@LABEL@39_10:	; if_then_bb46
	inc !LOWW(_g_machine_state+0x00005)
.BB@LABEL@39_11:	; switch_break_bb
	;***      946 : 				g_timerSetting.t3_flowSensorMonitorTime_s * 1000)) {
	;***      947 : 			(*state)++;
	;***      948 : 		}
	;***      949 : 		break;
	;***      950 : 	case 2:
	;***      951 : 		g_io_status.refined.FlowValue = (_flow_pulse * 0.7 * 60 / 1000)
	;***      952 : 				/ g_timerSetting.t3_flowSensorMonitorTime_s;
	;***      953 : 		_flow_pulse = 0;
	;***      954 : 		(*state) = 0;
	;***      955 : 		break;
	;***      956 : 	default:
	;***      957 : 		(*state) = 0;
	;***      958 : 		break;
	;***      959 : 	}
	;***      960 : 	return g_io_status.refined.FlowValue;
	;***      961 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 961
	movw bc, !LOWW(_g_io_status+0x00008)
	movw ax, !LOWW(_g_io_status+0x00006)
	addw sp, #0x04
	ret
.BB@LABEL@39_12:	; switch_clause_bb51
	movw ax, #0x3F33
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 951
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
	movw bc, !LOWW(_g_timerSetting+0x00006)
	movw ax, !LOWW(_g_timerSetting+0x00004)
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 953
	movw !LOWW(__flow_pulse+0x00002), ax
	movw !LOWW(__flow_pulse), ax
	br $!.BB@LABEL@39_3
_UpdateMachineStatus:
	.STACK _UpdateMachineStatus = 6
	;***      962 : void UpdateMachineStatus(void) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 962
	push hl
	;***      963 : 	if(g_machine_state.mode != ELECTROLYTIC_GENERATION)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 963
	mov a, !LOWW(_g_machine_state+0x00007)
	cmp a, #0x08
	skz
.BB@LABEL@40_1:	; if_then_bb
	;***      964 : 		pre_machine_mode = g_machine_state.mode;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 964
	mov !LOWW(_pre_machine_mode@3), a
.BB@LABEL@40_2:	; if_break_bb
	;***      965 : 	g_io_status.refined.AcidEmptyLevel = I_ACID_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 965
	mov a, 0xFFF07
	mov x, #0x08
	bf a.1, $.BB@LABEL@40_4
.BB@LABEL@40_3:	; bb11
	clrb x
.BB@LABEL@40_4:	; bb12
	;***      966 : 	g_io_status.refined.AcidLowLevel = I_ACID_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 966
	mov a, 0xFFF07
	mov c, #0x10
	bf a.2, $.BB@LABEL@40_6
.BB@LABEL@40_5:	; bb28
	clrb c
.BB@LABEL@40_6:	; bb30
	;***      967 : 	g_io_status.refined.AcidHighLevel = I_ACID_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 967
	mov a, 0xFFF07
	mov b, #0x20
	bf a.3, $.BB@LABEL@40_8
.BB@LABEL@40_7:	; bb46
	clrb b
.BB@LABEL@40_8:	; bb48
	mov a, c
	or x, a
	mov a, x
	mov [sp+0x00], a
	;***      968 : 
	;***      969 : 	g_io_status.refined.AlkalineEmptyLevel = I_ALKALI_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 969
	mov a, 0xFFF00
	oneb x
	bf a.5, $.BB@LABEL@40_10
.BB@LABEL@40_9:	; bb64
	clrb x
.BB@LABEL@40_10:	; bb66
	mov a, [sp+0x00]
	or a, b
	mov c, a
	;***      970 : 	g_io_status.refined.AlkalineLowLevel = I_ALKALI_M_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 970
	mov a, 0xFFF00
	mov b, #0x02
	bf a.6, $.BB@LABEL@40_12
.BB@LABEL@40_11:	; bb82
	clrb b
.BB@LABEL@40_12:	; bb84
	mov a, c
	or a, x
	mov c, a
	;***      971 : 	g_io_status.refined.AlkalineHighLevel = I_ALKALI_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 971
	mov a, 0xFFF07
	mov x, #0x04
	bf a.0, $.BB@LABEL@40_14
.BB@LABEL@40_13:	; bb100
	clrb x
.BB@LABEL@40_14:	; bb102
	mov a, c
	or a, b
	mov c, a
	;***      972 : 
	;***      973 : 	g_io_status.refined.SaltLowLevel = I_SALT_L_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 973
	mov a, 0xFFF05
	mov b, #0x40
	bf a.4, $.BB@LABEL@40_16
.BB@LABEL@40_15:	; bb118
	clrb b
.BB@LABEL@40_16:	; bb120
	mov a, c
	or a, x
	mov c, a
	;***      974 : 	g_io_status.refined.SaltHighLevel = I_SALT_H_PIN == I_ON ? 1 : 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 974
	mov a, 0xFFF05
	mov x, #0x80
	bf a.3, $.BB@LABEL@40_18
.BB@LABEL@40_17:	; bb136
	clrb x
.BB@LABEL@40_18:	; bb138
	movw de, #0xFF06
	mov a, c
	or a, b
	or a, x
	mov !LOWW(_g_io_status), a
	;***      975 : 
	;***      976 : 	g_io_status.refined.Valve.SV1 = O_SUPPLY_WATER_PIN_SV1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 976
	mov b, 0xFFF01
	mov a, #0x70
	and a, !LOWW(_g_io_status+0x00001)
	mov [sp+0x00], a
	;***      977 : 	g_io_status.refined.Valve.SV2 = O_SPOUT_WATER_PIN_SV2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 977
	mov x, 0xFFF05
	;***      978 : 	g_io_status.refined.Valve.SV3 = O_SPOUT_ACID_PIN_SV3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 978
	mov c, 0xFFF07
	;***      979 : 	g_io_status.refined.Valve.SV4 = O_SPOUT_ALK_PIN_SV4;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 979
	mov a, 0xFFF07
	mov h, a
	;***      980 : 	g_io_status.refined.Valve.SV5 = g_io_status.refined.Valve.SV8 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 980
	mov a, [de]
	mov l, a
	;***      981 : 	O_DRAIN_ACID_PIN_SV7;
	;***      982 : 	g_io_status.refined.Valve.SV6 = g_io_status.refined.Valve.SV9 =
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 982
	mov a, [de]
	mov1 CY, a.6
	mov a, !LOWW(_g_io_status+0x00002)
	mov1 a.0, CY
	mov [sp+0x01], a
	mov !LOWW(_g_io_status+0x00002), a
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 976
	mov1 CY, a.7
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 977
	mov1 a.0, CY
	mov b, a
	mov a, x
	mov1 CY, a.5
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 978
	mov1 a.1, CY
	mov x, a
	mov a, c
	mov1 CY, a.6
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 979
	mov1 a.2, CY
	mov x, a
	mov a, h
	mov1 CY, a.7
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 980
	mov1 a.3, CY
	mov x, a
	mov a, l
	mov1 CY, a.7
	mov a, x
	mov1 a.7, CY
	mov x, a
	;***      983 : 	O_DRAIN_ALK_PIN_SV6;
	;***      984 : 	g_io_status.refined.Valve.SV7 = O_NEUTRALIZE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 984
	and a, #0x8F
	mov b, a
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 980
	mov1 CY, a.7
	mov a, b
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 984
	mov1 a.4, CY
	mov x, a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 982
	mov1 CY, a.0
	mov a, x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 984
	mov1 a.5, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.5
	mov a, x
	mov1 a.6, CY
	mov !LOWW(_g_io_status+0x00001), a
	mov a, #0xF8
	;***      985 : 
	;***      986 : 	g_io_status.refined.Pump1 = O_PUMP_ACID_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 986
	and a, !LOWW(_g_io_status+0x00003)
	mov x, a
	mov a, [de]
	mov1 CY, a.2
	mov a, x
	;***      987 : 	g_io_status.refined.Pump2 = O_PUMP_ALK_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 987
	mov1 a.0, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.1
	mov a, x
	;***      988 : 	g_io_status.refined.SaltPump = O_PUMP_SALT_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 988
	mov1 a.1, CY
	mov x, a
	mov a, [de]
	mov1 CY, a.0
	mov a, x
	mov1 a.2, CY
	mov !LOWW(_g_io_status+0x00003), a
	pop hl
	ret
	;***      989 : }
	.SECTION .bss,BSS
	.ALIGN 2
_g_Tick@1:
	.DS (128)
	.ALIGN 2
_g_TickKeeper@2:
	.DS (20)
_pre_machine_mode@3:
	.DS (1)
	.ALIGN 2
__settingTime@4:
	.DS (98)
	.ALIGN 2
__settingNumber@5:
	.DS (38)
_g_callan_clear_flag@6:
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
	.DS (1)
	.DS (1)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
	.DS (4)
_g_electrolytic_flag:
	.DS (1)
__pre_flow_state:
	.DB 0x01
	.SECTION .const,CONST
_io_statusSize:
	.DB 0x05
_timeSettingSize:
	.DB 0x45
_numberSettingSize:
	.DB 0x21
