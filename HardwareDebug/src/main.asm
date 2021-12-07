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
#@  compiled at Tue Dec 07 17:52:11 2021

	.EXTERN _g_control_buffer
	.EXTERN _g_systemTime
	.EXTERN _g_uart2_sendend
	.EXTERN _g_rx_data
	.PUBLIC _g_timerSetting
	.PUBLIC _g_numberSetting
	.PUBLIC _g_color
	.PUBLIC _g_pre_color
	.PUBLIC _g_cvcc_current
	.PUBLIC _g_cvcc_voltge
	.PUBLIC _g_alarm
	.PUBLIC _g_flow_value
	.PUBLIC _g_neutralization_time
	.PUBLIC _g_electrolytic_flag
	.PUBLIC _handSensorLED
	.PUBLIC _setting_default
	.PUBLIC _sendToRasPi
	.EXTERN _R_UART2_Send
	.PUBLIC _InitialOperationModeStart
	.EXTERN _R_WDT_Restart
	.PUBLIC _FlowSensorCheck
	.EXTERN _delay
	.PUBLIC _WaterSupplyOperation
	.EXTERN _delay_ms
	.PUBLIC _Voltage1Check
	.PUBLIC _Voltage2Check
	.PUBLIC _Voltage3Check
	.PUBLIC _LowVoltageCheck
	.PUBLIC _OverCurrentCheck
	.PUBLIC _ElectrolyticOperation
	.PUBLIC _solenoidCheck
	.PUBLIC _saltWaterTankFullCheck
	.PUBLIC _saltWaterTankEmptyCheck
	.PUBLIC _acidWaterTankSkipCheck
	.PUBLIC _alkalineWaterTankSkipCheck
	.PUBLIC _OpenSV1
	.PUBLIC _CloseSV1
	.PUBLIC _OpenSV2
	.PUBLIC _CloseSV2
	.PUBLIC _FilterReplacementCheck
	.PUBLIC _ElectrolyzeWaterGeneration
	.PUBLIC _WaterWashingMode
	.EXTERN _readHS
	.PUBLIC _HandWashingMode
	.PUBLIC _AcidWaterMode
	.PUBLIC _AlkalineWaterMode
	.PUBLIC _nostop_CallanCleaningMode
	.EXTERN _ns_delay_ms
	.PUBLIC _main_20211111
	.PUBLIC _main_20211111_while
	.PUBLIC _electrolyticOperationON
	.PUBLIC _electrolyticOperationOFF
	.PUBLIC _measureFlowSensor

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
	;***       22 : struct Timer_Setting_s g_timerSetting = {1000, 15};
	;***       23 : struct Number_Setting_s g_numberSetting;
	;***       24 : enum HS_COLOR g_color, g_pre_color;
	;***       25 : float g_cvcc_current, g_cvcc_voltge;
	;***       26 : enum Control_status g_alarm;
	;***       27 : float g_flow_value;
	;***       28 : uint32_t g_neutralization_time = 0;
	;***       29 : volatile uint8_t g_electrolytic_flag = 0;
	;***       30 : 
	;***       31 : //void electrolyticOperationON(void);
	;***       32 : //void electrolyticOperationOFF(void);
	;***       33 : void handSensorLED(enum HS_COLOR color){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 33
	mov !LOWW(_g_color), a
	;***       34 : 	g_color = color;
	;***       35 : 	if(g_color != g_pre_color){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 35
	cmp a, !LOWW(_g_pre_color)
	sknz
.BB@LABEL@1_1:	; return
	;***       36 : 		switch (color) {
	;***       37 : 			case RED:
	;***       38 : 				O_HS_ICL_PIN = 1;
	;***       39 : 				O_HS_IDA_PIN = 0;
	;***       40 : 				break;
	;***       41 : 			case BLUE:
	;***       42 : 				O_HS_ICL_PIN = 0;
	;***       43 : 				O_HS_IDA_PIN = 0;
	;***       44 : 				break;
	;***       45 : 			case WHITE:
	;***       46 : 				O_HS_ICL_PIN = 0;
	;***       47 : 				O_HS_IDA_PIN = 1;
	;***       48 : 				break;
	;***       49 : 			default:
	;***       50 : 				O_HS_ICL_PIN = 1;
	;***       51 : 				O_HS_IDA_PIN = 1;
	;***       52 : 				break;
	;***       53 : 		}
	;***       54 : 		g_pre_color = g_color;
	;***       55 : 	}
	;***       56 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 56
	ret
.BB@LABEL@1_2:	; if_then_bb
	movw hl, #0xFF01
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 36
	dec a
	bz $.BB@LABEL@1_6
.BB@LABEL@1_3:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_4:	; if_then_bb
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_5:	; switch_clause_bb12
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 50
	set1 [hl].6
	br $.BB@LABEL@1_9
.BB@LABEL@1_6:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 38
	set1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 39
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_7:	; switch_clause_bb10
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 42
	clr1 [hl].6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 43
	clr1 [hl].5
	br $.BB@LABEL@1_10
.BB@LABEL@1_8:	; switch_clause_bb11
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 46
	clr1 [hl].6
.BB@LABEL@1_9:	; switch_clause_bb11
	set1 [hl].5
.BB@LABEL@1_10:	; switch_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 54
	mov a, !LOWW(_g_color)
	mov !LOWW(_g_pre_color), a
	ret
_setting_default:
	.STACK _setting_default = 4
	;***       57 : void setting_default(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 57
	movw ax, #0x4089
	;***       58 : 	g_numberSetting.upperVoltage1 = 4.3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 58
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting), ax
	;***       59 : 	g_numberSetting.upperVoltage2 = 2.7;
	;***       60 : 	g_numberSetting.upperVoltage3 = 1.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 60
	movw !LOWW(_g_numberSetting+0x00008), ax
	;***       61 : 	g_numberSetting.lowerVoltage = 0.5;
	;***       62 : 	g_numberSetting.upperCurrent = 2.2;
	;***       63 : 	g_numberSetting.lowerCurrent = 0.5;
	;***       64 : 	g_numberSetting.upperFlow = 1.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 64
	movw !LOWW(_g_numberSetting+0x00018), ax
	movw ax, #0x402C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 59
	movw !LOWW(_g_numberSetting+0x00006), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 62
	movw !LOWW(_g_numberSetting+0x00010), ax
	;***       65 : 	g_numberSetting.lowerFlow = 0.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x3F99
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 60
	movw !LOWW(_g_numberSetting+0x0000A), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 64
	movw !LOWW(_g_numberSetting+0x0001A), ax
	clrb x
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 61
	movw !LOWW(_g_numberSetting+0x0000E), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 63
	movw !LOWW(_g_numberSetting+0x00016), ax
	clrb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 61
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 63
	movw !LOWW(_g_numberSetting+0x00014), ax
	;***       66 : 	g_timerSetting.t2_flowSensorStartTime = 30000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***       67 : 	g_timerSetting.t3_flowSensorMonitorTime = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       68 : 	g_timerSetting.t11_overVoltage1Time = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	movw !LOWW(_g_timerSetting+0x0000E), ax
	;***       69 : 	g_timerSetting.t12_overVoltage2Time = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw !LOWW(_g_timerSetting+0x00012), ax
	;***       70 : 	g_timerSetting.t13_overVoltage3Time = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       71 : 	g_timerSetting.t14_lowVoltageStartTime = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_timerSetting+0x0001A), ax
	;***       72 : 	g_timerSetting.t15_lowVoltageDelayTime = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_timerSetting+0x0001E), ax
	;***       73 : 	g_timerSetting.t17_solenoidLeakageStartTime = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_timerSetting+0x00022), ax
	;***       74 : 	g_timerSetting.t51 = 15;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_timerSetting+0x00026), ax
	;***       75 : 	g_timerSetting.t52 = 16;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       76 : 	g_timerSetting.t53 = 17;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x0002E), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 62
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	movw !LOWW(_g_numberSetting+0x0001E), ax
	movw ax, #0x7530
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	movw !LOWW(_g_timerSetting), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	movw !LOWW(_g_timerSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_timerSetting+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_timerSetting+0x00020), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	movw !LOWW(_g_timerSetting+0x0000C), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw !LOWW(_g_timerSetting+0x00010), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_timerSetting+0x0001C), ax
	movw ax, #0x000F
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_timerSetting+0x00024), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_timerSetting+0x00028), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x0002C), ax
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 10
	;***       77 : }
	;***       78 : #ifdef RENAN_CODE
	;***       79 : void renanCode(void){
	;***       80 : 	//Power On Mode
	;***       81 : 	O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       82 : 	O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       83 : 	do{
	;***       84 : 		O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN;	// Turn on SV5 if ACID tank empty
	;***       85 : 		O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN;	// Turn on SV6 if ALK tank empty
	;***       86 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***       87 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***       88 : 		R_WDT_Restart();
	;***       89 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***       90 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***       91 : 	O_DRAIN_ACID_PIN = O_DRAIN_ALK_PIN = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***       92 : 
	;***       93 : 	// Drainage operation
	;***       94 : 	O_SPOUT_WATER_PIN = ON;	// SV2 On
	;***       95 : 	delay(st[1]);			// Default 30 seconds
	;***       96 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	;***       97 : 	delay_ms(500);
	;***       98 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	;***       99 : }
	;***      100 : 
	;***      101 : 
	;***      102 : void code_20211029(void){
	;***      103 : 	//---------------Electrolytic operation-----------------------------
	;***      104 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	;***      105 : 	O_CVCC_ON_PIN = ON;
	;***      106 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***      107 : 	delay(10);
	;***      108 : 	//TODO: Neutralization timer On
	;***      109 : 
	;***      110 : 	overVoltage1Error();
	;***      111 : }
	;***      112 : #endif
	;***      113 : 
	;***      114 : //----------------------Begin code 11112021--------------------------------------
	;***      115 : void sendToRasPi(enum UART_header_e head, enum Control_status type, float value){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 115
	push hl
	push ax
	movw ax, bc
	push de
	pop bc
	;***      116 : 	uint8_t state = g_uart2_sendend;
	;***      117 : 	g_control_buffer.head = head;
	;***      118 : 	g_control_buffer.set_number = type;
	;***      119 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 119
	call !!__COM_ftoul
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 116
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x02], a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 117
	mov !LOWW(_g_control_buffer), a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 118
	mov !LOWW(_g_control_buffer+0x00001), a
	;***      120 : 	R_UART2_Send((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 120
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@3_1:	; bb10
	mov a, [sp+0x02]
	;***      121 : 	while(state == g_uart2_sendend);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 121
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@3_1
.BB@LABEL@3_2:	; return
	;***      122 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 122
	addw sp, #0x04
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 4
	;***      123 : /**
	;***      124 :  * InitialOperationModeStart
	;***      125 :  * 30/11/2021: Checked!
	;***      126 :  */
	;***      127 : void InitialOperationModeStart(void){
	;***      128 : 	OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
	mov a, 0xFFF07
	oneb x
	bf a.1, $.BB@LABEL@4_2
.BB@LABEL@4_1:	; bb6
	clrb x
.BB@LABEL@4_2:	; bb7
	mov a, #0xFE
	and a, 0xFFF0B
	add a, x
	mov 0xFFF0B, a
	;***      129 : 	OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	mov a, 0xFFF00
	mov x, #0x02
	bf a.5, $.BB@LABEL@4_4
.BB@LABEL@4_3:	; bb21
	clrb x
.BB@LABEL@4_4:	; bb23
	mov a, #0xFD
	and a, 0xFFF0B
	or a, x
	mov 0xFFF0B, a
.BB@LABEL@4_5:	; bb32
	;***      130 : 	do{
	;***      131 : 		OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OPTION_1_PIN;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 131
	mov a, 0xFFF07
	mov1 CY, a.1
	oneb a
	sknc
.BB@LABEL@4_6:	; bb40
	and a, 0xFFF0B
.BB@LABEL@4_7:	; bb46
	mov x, a
	mov a, #0xFE
	and a, 0xFFF0B
	add a, x
	mov 0xFFF0B, a
	;***      132 : 		OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OPTION_2_PIN;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 132
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x02
	sknc
.BB@LABEL@4_8:	; bb61
	and a, 0xFFF0B
.BB@LABEL@4_9:	; bb67
	mov x, a
	mov a, #0xFD
	and a, 0xFFF0B
	or a, x
	mov 0xFFF0B, a
	;***      133 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	mov a, 0xFFF07
	shr a, 0x01
	and a, #0x01
	xor a, #0x01
	mov x, a
	mov a, 0xFFF00
	shr a, 0x05
	and a, #0x01
	xor a, #0x01
	or a, x
	bnz $.BB@LABEL@4_5
.BB@LABEL@4_10:	; return
	;***      134 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      135 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
	ret
_FlowSensorCheck:
	.STACK _FlowSensorCheck = 18
	;***      136 : /**
	;***      137 :  * FlowSensorCheck
	;***      138 :  * 30/11/2021: Checked!
	;***      139 :  * @return 0 is Error, 1 is OK
	;***      140 :  */
	;***      141 : uint8_t FlowSensorCheck(uint32_t *_time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
	subw sp, #0x08
	push ax
	;***      142 : 	delay(15);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 142
	mov a, #0x0F
	call !!_delay
	pop de
	push de
	;***      143 : 	g_flow_value = measureFlowSensor(*_time);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	movw ax, [de+0x02]
	movw bc, ax
	movw ax, [de]
	call $!_measureFlowSensor
	movw [sp+0x02], ax
	movw !LOWW(_g_flow_value), ax
	movw ax, bc
	movw [sp+0x00], ax
	movw !LOWW(_g_flow_value+0x00002), ax
	;***      144 : 	if((g_flow_value < g_numberSetting.upperFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	movw [sp+0x08], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
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
	call !!__COM_fle
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_1:	; entry
	clrb a
.BB@LABEL@5_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_3:	; entry
	clrb x
.BB@LABEL@5_4:	; entry
	or x, a
	movw bc, !LOWW(_g_numberSetting+0x0001A)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_numberSetting+0x00018)
	movw [sp+0x06], ax
	bnz $.BB@LABEL@5_12
.BB@LABEL@5_5:	; entry
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
	call !!__COM_fge
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_6:	; entry
	clrb a
.BB@LABEL@5_7:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_8:	; entry
	clrb x
.BB@LABEL@5_9:	; entry
	or x, a
	bnz $.BB@LABEL@5_12
.BB@LABEL@5_10:	; bb17
	;***      145 : 			&(g_flow_value > g_numberSetting.lowerFlow)){
	;***      146 : 		return 1;
	;***      147 : 	}else{
	;***      148 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      149 : 		return 0;
	;***      150 : 	}
	;***      151 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 151
	oneb a
.BB@LABEL@5_11:	; bb17
	addw sp, #0x0A
	ret
.BB@LABEL@5_12:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
	clrb a
	br $.BB@LABEL@5_11
_WaterSupplyOperation:
	.STACK _WaterSupplyOperation = 8
	;***      152 : /**
	;***      153 :  * WaterSupplyOperation
	;***      154 :  * 30/11/2021: Checked by An, need to test with Raspberry Pi Adjust alarm
	;***      155 :  */
	;***      156 : void WaterSupplyOperation(void){
	;***      157 : 	O_SPOUT_WATER_PIN = ON;		// SV2 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	set1 0xFFF05.5
	;***      158 : 	delay(30);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	mov a, #0x1E
	call !!_delay
	;***      159 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 159
	set1 0xFFF01.7
	;***      160 : 	delay_ms(500);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	clrw bc
	movw ax, #0x01F4
	call !!_delay_ms
	;***      161 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 161
	clr1 0xFFF05.5
.BB@LABEL@6_1:	; bb6
	;***      162 : 	while(FlowSensorCheck(&g_timerSetting.t3_flowSensorMonitorTime) != 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	movw ax, #LOWW(_g_timerSetting+0x00004)
	call $!_FlowSensorCheck
	dec a
	bz $.BB@LABEL@6_3
.BB@LABEL@6_2:	; bb
	movw ax, #0x447A
	;***      163 : 		//TODO: RasPi - Adjust
	;***      164 : 		uint32_t _flow = g_flow_value*1000; // mL/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 164
	push ax
	clrw ax
	push ax
	movw bc, !LOWW(_g_flow_value+0x00002)
	movw ax, !LOWW(_g_flow_value)
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	;***      165 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, _flow);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 165
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4104
	call $!_sendToRasPi
	br $.BB@LABEL@6_1
.BB@LABEL@6_3:	; bb11
	;***      166 : 	}
	;***      167 : 	delay(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 167
	mov a, #0x0A
	br !!_delay
_Voltage1Check:
	.STACK _Voltage1Check = 12
	;***      168 : }
	;***      169 : /**
	;***      170 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      171 :  * 30/11/2021: Checked by An
	;***      172 :  * @return 0 - OK; 1 - Error
	;***      173 :  */
	;***      174 : uint8_t Voltage1Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	subw sp, #0x04
	;***      175 : 	if(g_cvcc_voltge>=g_numberSetting.upperVoltage1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	movw ax, !LOWW(_g_numberSetting+0x00002)
	push ax
	movw ax, !LOWW(_g_numberSetting)
	push ax
	movw bc, !LOWW(_g_cvcc_voltge+0x00002)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_cvcc_voltge)
	movw [sp+0x06], ax
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	clrb a
	bz $.BB@LABEL@7_6
.BB@LABEL@7_1:	; if_then_bb
	movw ax, #0x447A
	;***      176 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
	push ax
	clrw ax
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      177 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
	call $!_electrolyticOperationOFF
.BB@LABEL@7_2:	; bb9
	;***      178 : 		//TODO: Wait to reset
	;***      179 : 		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_VOLTAGE_1)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
	cmp !LOWW(_g_rx_data+0x00001), #0x05
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@7_5
.BB@LABEL@7_3:	; bb9
	cmp a, #0x43
	bz $.BB@LABEL@7_5
.BB@LABEL@7_4:	; bb
	;***      180 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	call !!_R_WDT_Restart
	br $.BB@LABEL@7_2
.BB@LABEL@7_5:	; bb9.bb25_crit_edge
	oneb a
.BB@LABEL@7_6:	; bb25
	;***      181 : 		}
	;***      182 : 		return 1;
	;***      183 : 	}
	;***      184 : 	return 0;
	;***      185 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	addw sp, #0x04
	ret
_Voltage2Check:
	.STACK _Voltage2Check = 24
	;***      186 : /**
	;***      187 :  * Alarm every g_timerSetting.t12_overVoltage2Time second until voltage valid.
	;***      188 :  * 30/11/2021: Checked by An
	;***      189 :  * @return 0 - OK
	;***      190 :  */
	;***      191 : void Voltage2Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
	subw sp, #0x10
	br $!.BB@LABEL@8_18
.BB@LABEL@8_1:	; bb13
	;***      192 : 	uint16_t _time_count = 0;
	;***      193 : 	do{
	;***      194 : 		_time_count = 0;
	;***      195 : 		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	movw bc, !LOWW(_g_timerSetting+0x00012)
	movw ax, bc
	movw [sp+0x0E], ax
	clrw ax
	cmpw ax, bc
	movw bc, !LOWW(_g_timerSetting+0x00010)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@8_2:	; bb13
	cmpw ax, bc
.BB@LABEL@8_3:	; bb13
	movw hl, !LOWW(_g_numberSetting+0x00006)
	movw ax, hl
	movw [sp+0x06], ax
	movw de, !LOWW(_g_numberSetting+0x00004)
	movw ax, de
	movw [sp+0x08], ax
	movw bc, !LOWW(_g_cvcc_voltge+0x00002)
	movw ax, bc
	movw [sp+0x0A], ax
	movw ax, !LOWW(_g_cvcc_voltge)
	movw [sp+0x0C], ax
	bnc $.BB@LABEL@8_15
.BB@LABEL@8_4:	; bb13
	push hl
	push de
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x06]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x0E]
	movw bc, ax
	movw ax, [sp+0x10]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@8_5:	; bb13
	clrb a
.BB@LABEL@8_6:	; bb13
	cmp0 x
	oneb x
	sknz
.BB@LABEL@8_7:	; bb13
	clrb x
.BB@LABEL@8_8:	; bb13
	or x, a
	bnz $.BB@LABEL@8_15
.BB@LABEL@8_9:	; bb2
	;***      196 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	clrw bc
	onew ax
	call !!_delay_ms
	clrw ax
	;***      197 : 			_time_count++;
	;***      198 : 			if(_time_count == g_timerSetting.t12_overVoltage2Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	cmpw ax, !LOWW(_g_timerSetting+0x00012)
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
	incw ax
	movw [sp+0x00], ax
	sknz
.BB@LABEL@8_10:	; bb2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	cmpw ax, !LOWW(_g_timerSetting+0x00010)
.BB@LABEL@8_11:	; bb2
	bnz $.BB@LABEL@8_13
.BB@LABEL@8_12:	; if_then_bb
	movw ax, #0x447A
	;***      199 : 				sendToRasPi(H_ALARM, OVER_VOLTAGE_2, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	push ax
	clrw ax
	push ax
	movw bc, !LOWW(_g_cvcc_voltge+0x00002)
	movw ax, !LOWW(_g_cvcc_voltge)
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4106
	call $!_sendToRasPi
.BB@LABEL@8_13:	; if_break_bb
	;***      200 : 			}
	;***      201 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 201
	call !!_R_WDT_Restart
.BB@LABEL@8_14:	; if_break_bb
	br $!.BB@LABEL@8_1
.BB@LABEL@8_15:	; bb27
	movw ax, [sp+0x0E]
	movw bc, ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 193
	cmpw ax, bc
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@8_16:	; bb27
	cmpw ax, bc
.BB@LABEL@8_17:	; bb27
	bnz $.BB@LABEL@8_19
.BB@LABEL@8_18:	; bb27.bb13_crit_edge
	clrw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@8_14
.BB@LABEL@8_19:	; return
	;***      202 : 		}
	;***      203 : 	}while(_time_count == g_timerSetting.t12_overVoltage2Time);
	;***      204 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	addw sp, #0x10
	ret
_Voltage3Check:
	.STACK _Voltage3Check = 24
	;***      205 : /**
	;***      206 :  * Alarm after g_timerSetting.t13_overVoltage3Time second. Turn OFF electrolytic and stop until valid.
	;***      207 :  * 30/11/2021: Checked by An
	;***      208 :  * @return 0 - OK; 1 - Error
	;***      209 :  */
	;***      210 : uint8_t Voltage3Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	subw sp, #0x10
	clrw ax
.BB@LABEL@9_1:	; entry
	movw [sp+0x00], ax
	;***      211 : 	uint16_t _time_count = 0;
	;***      212 : 	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	movw bc, !LOWW(_g_timerSetting+0x00016)
	movw ax, bc
	movw [sp+0x0C], ax
	clrw ax
	cmpw ax, bc
	movw bc, !LOWW(_g_timerSetting+0x00014)
	movw ax, bc
	movw [sp+0x0E], ax
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@9_2:	; bb4
	cmpw ax, bc
.BB@LABEL@9_3:	; bb4
	movw bc, !LOWW(_g_numberSetting+0x0000A)
	movw ax, bc
	movw [sp+0x0A], ax
	movw ax, !LOWW(_g_numberSetting+0x00008)
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_cvcc_voltge+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_cvcc_voltge)
	movw [sp+0x06], ax
	bnc $.BB@LABEL@9_10
.BB@LABEL@9_4:	; bb4
	push bc
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@9_5:	; bb4
	clrb a
.BB@LABEL@9_6:	; bb4
	cmp0 x
	oneb x
	sknz
.BB@LABEL@9_7:	; bb4
	clrb x
.BB@LABEL@9_8:	; bb4
	or x, a
	bnz $.BB@LABEL@9_10
.BB@LABEL@9_9:	; bb
	;***      213 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
	clrw bc
	onew ax
	call !!_delay_ms
	;***      214 : 		_time_count++;
	;***      215 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	call !!_R_WDT_Restart
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@9_1
.BB@LABEL@9_10:	; bb17
	movw ax, [sp+0x0C]
	movw bc, ax
	clrw ax
	;***      216 : 	}
	;***      217 : 	if(_time_count == g_timerSetting.t13_overVoltage3Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 217
	cmpw ax, bc
	movw ax, [sp+0x0E]
	movw bc, ax
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@9_11:	; bb17
	cmpw ax, bc
.BB@LABEL@9_12:	; bb17
	clrb a
	bnz $.BB@LABEL@9_18
.BB@LABEL@9_13:	; if_then_bb
	movw ax, #0x447A
	;***      218 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_3, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	push ax
	clrw ax
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      219 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	call $!_electrolyticOperationOFF
.BB@LABEL@9_14:	; bb29
	;***      220 : 		//TODO: Wait to reset
	;***      221 : 		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_VOLTAGE_3)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	cmp !LOWW(_g_rx_data+0x00001), #0x07
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@9_17
.BB@LABEL@9_15:	; bb29
	cmp a, #0x43
	bz $.BB@LABEL@9_17
.BB@LABEL@9_16:	; bb28
	;***      222 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	call !!_R_WDT_Restart
	br $.BB@LABEL@9_14
.BB@LABEL@9_17:	; bb29.bb45_crit_edge
	oneb a
.BB@LABEL@9_18:	; bb45
	;***      223 : 		}
	;***      224 : 		return 1;
	;***      225 : 	}
	;***      226 : 	return 0;
	;***      227 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	addw sp, #0x10
	ret
_LowVoltageCheck:
	.STACK _LowVoltageCheck = 24
	;***      228 : uint8_t LowVoltageCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	subw sp, #0x10
	;***      229 : 	uint16_t _time_count = 0;
	;***      230 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	call $!_electrolyticOperationON
.BB@LABEL@10_1:	; bb2
	;***      231 : 	while((g_systemTime - g_neutralization_time < g_timerSetting.t14_lowVoltageStartTime)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw ax, !LOWW(_g_systemTime)
	subw ax, !LOWW(_g_neutralization_time)
	movw de, ax
	movw ax, bc
	sknc
.BB@LABEL@10_2:	; bb2
	decw ax
.BB@LABEL@10_3:	; bb2
	subw ax, !LOWW(_g_neutralization_time+0x00002)
	cmpw ax, !LOWW(_g_timerSetting+0x0001A)
	movw ax, de
	sknz
.BB@LABEL@10_4:	; bb2
	cmpw ax, !LOWW(_g_timerSetting+0x00018)
.BB@LABEL@10_5:	; bb2
	bc $.BB@LABEL@10_16
.BB@LABEL@10_6:	; bb2.bb13_crit_edge
	clrw ax
.BB@LABEL@10_7:	; bb2.bb13_crit_edge
	movw [sp+0x00], ax
	;***      232 : 		R_WDT_Restart();
	;***      233 : 	}
	;***      234 : 	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < g_timerSetting.t15_lowVoltageDelayTime)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 234
	movw bc, !LOWW(_g_timerSetting+0x0001E)
	movw ax, bc
	movw [sp+0x0C], ax
	clrw ax
	cmpw ax, bc
	movw bc, !LOWW(_g_timerSetting+0x0001C)
	movw ax, bc
	movw [sp+0x0E], ax
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@10_8:	; bb13
	cmpw ax, bc
.BB@LABEL@10_9:	; bb13
	movw bc, !LOWW(_g_numberSetting+0x0000E)
	movw ax, bc
	movw [sp+0x0A], ax
	movw ax, !LOWW(_g_numberSetting+0x0000C)
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_cvcc_voltge+0x00002)
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_cvcc_voltge)
	movw [sp+0x06], ax
	bnc $.BB@LABEL@10_17
.BB@LABEL@10_10:	; bb13
	push bc
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@10_11:	; bb13
	clrb a
.BB@LABEL@10_12:	; bb13
	cmp0 x
	oneb x
	sknz
.BB@LABEL@10_13:	; bb13
	clrb x
.BB@LABEL@10_14:	; bb13
	or x, a
	bnz $.BB@LABEL@10_17
.BB@LABEL@10_15:	; bb10
	;***      235 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 235
	clrw bc
	onew ax
	call !!_delay_ms
	;***      236 : 		_time_count++;
	;***      237 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	call !!_R_WDT_Restart
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@10_7
.BB@LABEL@10_16:	; bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 232
	call !!_R_WDT_Restart
	br $!.BB@LABEL@10_1
.BB@LABEL@10_17:	; bb27
	movw ax, [sp+0x0C]
	movw bc, ax
	clrw ax
	;***      238 : 	}
	;***      239 : 	if(_time_count == g_timerSetting.t15_lowVoltageDelayTime){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
	cmpw ax, bc
	movw ax, [sp+0x0E]
	movw bc, ax
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@10_18:	; bb27
	cmpw ax, bc
.BB@LABEL@10_19:	; bb27
	clrb a
	bnz $.BB@LABEL@10_25
.BB@LABEL@10_20:	; if_then_bb
	movw ax, #0x447A
	;***      240 : 		sendToRasPi(H_ALARM, UNDER_VOLTAGE, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	push ax
	clrw ax
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4108
	call $!_sendToRasPi
	;***      241 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	call $!_electrolyticOperationOFF
.BB@LABEL@10_21:	; bb39
	;***      242 : 		//TODO: Wait to reset
	;***      243 : 		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != UNDER_VOLTAGE)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 243
	cmp !LOWW(_g_rx_data+0x00001), #0x08
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@10_24
.BB@LABEL@10_22:	; bb39
	cmp a, #0x43
	bz $.BB@LABEL@10_24
.BB@LABEL@10_23:	; bb38
	;***      244 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	call !!_R_WDT_Restart
	br $.BB@LABEL@10_21
.BB@LABEL@10_24:	; bb39.bb55_crit_edge
	oneb a
.BB@LABEL@10_25:	; bb55
	;***      245 : 		}
	;***      246 : 		return 1;
	;***      247 : 	}
	;***      248 : 	return 0;
	;***      249 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	addw sp, #0x10
	ret
_OverCurrentCheck:
	.STACK _OverCurrentCheck = 20
	;***      250 : uint8_t OverCurrentCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	subw sp, #0x0C
	;***      251 : 	uint16_t _time_count = 0;
	;***      252 : 	const uint16_t _max_time = 5000;
	;***      253 : 	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	movw ax, !LOWW(_g_numberSetting+0x00012)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	push ax
	movw bc, !LOWW(_g_cvcc_current+0x00002)
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_cvcc_current)
	movw [sp+0x08], ax
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	movw bc, !LOWW(_g_numberSetting+0x00016)
	movw ax, !LOWW(_g_numberSetting+0x00014)
	bnz $.BB@LABEL@11_3
.BB@LABEL@11_1:	; entry
	push bc
	push ax
	movw ax, [sp+0x06]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@11_3
.BB@LABEL@11_2:	; entry.bb62_crit_edge
	clrb a
	br $!.BB@LABEL@11_17
.BB@LABEL@11_3:	; if_then_bb
	movw ax, #0x447A
	;***      254 : 		sendToRasPi(H_ALARM, CURRENT_ABNORMAL, (uint32_t)(g_cvcc_current*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	push ax
	clrw ax
	movw [sp+0x02], ax
	push ax
	movw ax, [sp+0x06]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4109
	call $!_sendToRasPi
.BB@LABEL@11_4:	; bb20
	;***      255 : 		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < _max_time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	movw ax, !LOWW(_g_numberSetting+0x00012)
	movw [sp+0x0A], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	movw [sp+0x0A], ax
	push ax
	movw bc, !LOWW(_g_cvcc_current+0x00002)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_cvcc_current)
	movw [sp+0x0A], ax
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x0A]
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@11_5:	; bb20
	clrb a
.BB@LABEL@11_6:	; bb20
	cmp0 x
	oneb x
	sknz
.BB@LABEL@11_7:	; bb20
	clrb x
.BB@LABEL@11_8:	; bb20
	or x, a
	bnz $.BB@LABEL@11_11
.BB@LABEL@11_9:	; bb20
	movw ax, [sp+0x00]
	cmpw ax, #0x1388
	bnc $.BB@LABEL@11_11
.BB@LABEL@11_10:	; bb
	;***      256 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	clrw bc
	onew ax
	call !!_delay_ms
	;***      257 : 			_time_count++;
	;***      258 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	call !!_R_WDT_Restart
	movw ax, [sp+0x00]
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@11_4
.BB@LABEL@11_11:	; bb33
	movw ax, [sp+0x00]
	;***      259 : //			electrolyticOperationOFF();
	;***      260 : 		}
	;***      261 : 		if(_time_count >= _max_time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 261
	cmpw ax, #0x1388
	.bc $!.BB@LABEL@11_2
.BB@LABEL@11_12:	; if_then_bb39
	movw ax, #0x447A
	;***      262 : 			sendToRasPi(H_ALARM, OVER_CURRENT, (uint32_t)(g_cvcc_current*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	push ax
	clrw ax
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x410A
	call $!_sendToRasPi
	;***      263 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
	call $!_electrolyticOperationOFF
.BB@LABEL@11_13:	; bb45
	;***      264 : 			//TODO: Wait to reset
	;***      265 : 			while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_CURRENT)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	cmp !LOWW(_g_rx_data+0x00001), #0x0A
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@11_16
.BB@LABEL@11_14:	; bb45
	cmp a, #0x43
	bz $.BB@LABEL@11_16
.BB@LABEL@11_15:	; bb44
	;***      266 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	call !!_R_WDT_Restart
	br $.BB@LABEL@11_13
.BB@LABEL@11_16:	; bb45.bb62_crit_edge
	oneb a
.BB@LABEL@11_17:	; bb62
	;***      267 : 			}
	;***      268 : 			return 1;
	;***      269 : 		}
	;***      270 : 	}
	;***      271 : 	return 0;
	;***      272 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 272
	addw sp, #0x0C
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@12_1:	; WAIT_RESET
	;***      273 : void ElectrolyticOperation(void){
	;***      274 : 	WAIT_RESET:
	;***      275 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	call $!_electrolyticOperationON
.BB@LABEL@12_2:	; bb
	;***      276 : 	do{
	;***      277 : 		if(Voltage1Check()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	call $!_Voltage1Check
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_3:	; if_break_bb
	;***      278 : 		Voltage2Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 278
	call $!_Voltage2Check
	;***      279 : 		if(Voltage3Check()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 279
	call $!_Voltage3Check
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_4:	; if_break_bb12
	;***      280 : 		if(LowVoltageCheck()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 280
	call $!_LowVoltageCheck
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_5:	; if_break_bb20
	;***      281 : 		if(OverCurrentCheck()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 281
	call $!_OverCurrentCheck
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_6:	; if_break_bb28
	;***      282 : 		//----------CVCC Alarm Input-----------------
	;***      283 : 		if(I_CVCC_ALARM_IN == I_ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	mov a, 0xFFF00
	bf a.4, $.BB@LABEL@12_9
.BB@LABEL@12_7:	; if_break_bb53
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	mov b, 0xFFF07
	oneb a
	and a, 0xFFF07
	xor a, #0x01
	mov x, a
	mov a, b
	shr a, 0x03
	and a, #0x01
	xor a, #0x01
	or a, x
	bnz $.BB@LABEL@12_2
.BB@LABEL@12_8:	; bb71
	;***      284 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	;***      285 : 			electrolyticOperationOFF();
	;***      286 : 			//TODO: Wait Reset
	;***      287 : 			while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != CVCC_ALARM)){
	;***      288 : 				R_WDT_Restart();
	;***      289 : 			}
	;***      290 : 			goto WAIT_RESET;
	;***      291 : 		}
	;***      292 : 	}while((I_ACID_H_PIN == 0)|(I_ALKALI_H_PIN == 0));
	;***      293 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	br $!_electrolyticOperationOFF
.BB@LABEL@12_9:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	call $!_electrolyticOperationOFF
.BB@LABEL@12_10:	; bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	cmp !LOWW(_g_rx_data+0x00001), #0x12
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@12_1
.BB@LABEL@12_11:	; bb38
	cmp a, #0x43
	bz $.BB@LABEL@12_1
.BB@LABEL@12_12:	; bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	call !!_R_WDT_Restart
	br $.BB@LABEL@12_10
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      294 : }
	;***      295 : void solenoidCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 295
	subw sp, #0x04
	;***      296 : 	uint32_t _time_count = 0;
	;***      297 : 	if((g_flow_value <= 0.1f)&(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
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
	bnz $.BB@LABEL@13_3
.BB@LABEL@13_1:	; entry
	bc $.BB@LABEL@13_3
.BB@LABEL@13_2:	; entry
	movw ax, #0x3DCC
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, de
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@13_4
.BB@LABEL@13_3:	; entry.if_break_bb_crit_edge
	clrw ax
	movw [sp+0x02], ax
	movw [sp+0x00], ax
	br $.BB@LABEL@13_5
.BB@LABEL@13_4:	; if_then_bb
	onew ax
	movw [sp+0x02], ax
	decw ax
	movw [sp+0x00], ax
	;***      298 : 		_time_count++;
	;***      299 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@13_5:	; if_break_bb
	;***      300 : 	}
	;***      301 : 	if(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
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
.BB@LABEL@13_6:	; if_break_bb
	cmpw ax, de
.BB@LABEL@13_7:	; if_break_bb
	addw sp, #0x04
	bnz $.BB@LABEL@13_9
.BB@LABEL@13_8:	; if_then_bb20
	;***      302 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi
.BB@LABEL@13_9:	; return
	;***      303 : 	}
	;***      304 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      305 : void saltWaterTankFullCheck(void){
	;***      306 : 	if(I_SALT_H_PIN == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 306
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@14_2
.BB@LABEL@14_1:	; return
	;***      307 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      308 : 		electrolyticOperationOFF();
	;***      309 : 		//TODO: Fault in the flowchart
	;***      310 : 	}
	;***      311 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
	ret
.BB@LABEL@14_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 308
	br $!_electrolyticOperationOFF
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      312 : void saltWaterTankEmptyCheck(void){
	;***      313 : 	if(I_SALT_L_PIN == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@15_2
.BB@LABEL@15_1:	; if_then_bb
	;***      314 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 314
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi
.BB@LABEL@15_2:	; return
	;***      315 : 		//TODO: Control OFF
	;***      316 : 	}
	;***      317 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 317
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      318 : void acidWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 318
	movw de, #0xFF07
	;***      319 : 	if(((I_ACID_L_PIN == 0)&((I_ACID_M_PIN == 1)|(I_ACID_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 319
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
.BB@LABEL@16_1:	; return
	;***      320 : 			((I_ACID_M_PIN == 0)&(I_ACID_H_PIN == 1))){
	;***      321 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      322 : 		//TODO: Control OFF
	;***      323 : 	}
	;***      324 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 324
	ret
.BB@LABEL@16_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 321
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      325 : void alkalineWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	push hl
	;***      326 : 	if(((I_ALKALI_L_PIN == 0)&((I_ALKALI_M_PIN == 1)|(I_ALKALI_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 326
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
.BB@LABEL@17_1:	; return
	;***      327 : 			((I_ALKALI_M_PIN == 0)&(I_ALKALI_H_PIN == 1))){
	;***      328 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      329 : 		//TODO: Control OFF
	;***      330 : 	}
	;***      331 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 331
	ret
.BB@LABEL@17_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 328
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi
_OpenSV1:
	.STACK _OpenSV1 = 4
	;***      332 : 
	;***      333 : void OpenSV1(void){
	;***      334 : 	O_SUPPLY_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 334
	set1 0xFFF01.7
	ret
_CloseSV1:
	.STACK _CloseSV1 = 4
	;***      335 : }
	;***      336 : void CloseSV1(void){
	;***      337 : 	O_SUPPLY_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 337
	clr1 0xFFF01.7
	ret
_OpenSV2:
	.STACK _OpenSV2 = 4
	;***      338 : }
	;***      339 : void OpenSV2(void){
	;***      340 : 	O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 340
	set1 0xFFF05.5
	ret
_CloseSV2:
	.STACK _CloseSV2 = 4
	;***      341 : }
	;***      342 : void CloseSV2(void){
	;***      343 : 	O_SPOUT_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 343
	clr1 0xFFF05.5
	ret
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      344 : }
	;***      345 : uint8_t FilterReplacementCheck(void){
	;***      346 : 
	;***      347 : 	return 0;
	;***      348 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 348
	clrb a
	ret
_ElectrolyzeWaterGeneration:
	.STACK _ElectrolyzeWaterGeneration = 4
	;***      349 : void ElectrolyzeWaterGeneration(void){
	;***      350 : 	if((I_ACID_L_PIN == I_OFF)|(I_ALKALI_L_PIN = I_OFF)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 350
	mov a, 0xFFF07
	set1 0xFFF00.5
	shr a, 0x01
	mov x, a
	mov a, 0xFFF00
	shr a, 0x05
	or a, x
	bt a.0, $.BB@LABEL@23_4
.BB@LABEL@23_1:	; if_else_bb
	movw hl, #0xFF07
	;***      351 : 		electrolyticOperationON();
	;***      352 : 	}else if((I_ACID_H_PIN = I_ON)&(I_ALKALI_H_PIN = I_ON)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 352
	clr1 [hl].3
	mov a, [hl]
	clr1 [hl].0
	shr a, 0x03
	and a, [hl]
	bt a.0, $.BB@LABEL@23_3
.BB@LABEL@23_2:	; return
	;***      353 : 		electrolyticOperationOFF();
	;***      354 : 	}
	;***      355 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 355
	ret
.BB@LABEL@23_3:	; if_then_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 353
	br $!_electrolyticOperationOFF
.BB@LABEL@23_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 351
	br $!_electrolyticOperationON
_WaterWashingMode:
	.STACK _WaterWashingMode = 6
	;***      356 : void WaterWashingMode(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 356
	push hl
	;***      357 : 	uint8_t _state = 0;
	;***      358 : 	if(readHS() == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 358
	call !!_readHS
	dec a
	clrb a
	bnz $.BB@LABEL@24_2
.BB@LABEL@24_1:	; if_then_bb
	;***      359 : 		O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 359
	set1 0xFFF05.5
	;***      360 : 		g_color = WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 360
	mov !LOWW(_g_color), #0x02
	;***      361 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 361
	mov a, #0x02
	call $!_handSensorLED
	oneb a
.BB@LABEL@24_2:	; if_then_bb
	mov [sp+0x00], a
.BB@LABEL@24_3:	; bb6
	;***      362 : 		_state = 1;
	;***      363 : 	}
	;***      364 : 	while(readHS() == 1) R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 364
	call !!_readHS
	dec a
	bnz $.BB@LABEL@24_5
.BB@LABEL@24_4:	; bb
	call !!_R_WDT_Restart
	br $.BB@LABEL@24_3
.BB@LABEL@24_5:	; bb12
	mov a, [sp+0x00]
	;***      365 : 	if(_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 365
	cmp0 a
	bnz $.BB@LABEL@24_7
.BB@LABEL@24_6:	; return
	;***      366 : 		delay(2);
	;***      367 : 		O_SPOUT_WATER_PIN = OFF;
	;***      368 : 		g_color = BLACK;
	;***      369 : 		handSensorLED(g_color);
	;***      370 : 	}
	;***      371 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 371
	pop hl
	ret
.BB@LABEL@24_7:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 366
	mov a, #0x02
	call !!_delay
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 367
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 368
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 369
	clrb a
	pop hl
	br $!_handSensorLED
_HandWashingMode:
	.STACK _HandWashingMode = 6
	;***      372 : void HandWashingMode(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 372
	push hl
	;***      373 : 	uint8_t _state = 0;
	;***      374 : 	const uint32_t _waterHamerTime = 1000;
	;***      375 : 	if(readHS() == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 375
	call !!_readHS
	dec a
	bz $.BB@LABEL@25_2
.BB@LABEL@25_1:	; entry.bb22.preheader_crit_edge
	clrb a
	mov [sp+0x00], a
	br $!.BB@LABEL@25_9
.BB@LABEL@25_2:	; if_then_bb
	;***      376 : 		_state = 1;
	;***      377 : 		g_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 377
	mov !LOWW(_g_color), #0x03
	;***      378 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 378
	mov a, #0x03
	call $!_handSensorLED
	;***      379 : 		O_SPOUT_ALK_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 379
	set1 0xFFF07.7
	;***      380 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 380
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      381 : 		O_PUMP_ALK_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 381
	set1 0xFFF06.1
	;***      382 : 		delay_ms(g_timerSetting.t51 - g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 382
	movw ax, !LOWW(_g_timerSetting+0x00024)
	subw ax, !LOWW(_g_timerSetting+0x00030)
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x00026)
	sknc
.BB@LABEL@25_3:	; if_then_bb
	decw ax
.BB@LABEL@25_4:	; if_then_bb
	subw ax, !LOWW(_g_timerSetting+0x00032)
	movw bc, ax
	movw ax, de
	call !!_delay_ms
	;***      383 : 		g_color = RED;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 383
	oneb !LOWW(_g_color)
	oneb a
	mov [sp+0x00], a
	;***      384 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 384
	oneb a
	call $!_handSensorLED
	;***      385 : 		O_SPOUT_ACID_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 385
	set1 0xFFF07.6
	;***      386 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 386
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      387 : 		O_PUMP_ACID_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 387
	set1 0xFFF06.2
	;***      388 : 		delay_ms(g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 388
	movw bc, !LOWW(_g_timerSetting+0x00032)
	movw ax, !LOWW(_g_timerSetting+0x00030)
	call !!_delay_ms
	;***      389 : 		O_PUMP_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 389
	clr1 0xFFF06.1
	;***      390 : 		delay_ms(_waterHamerTime);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 390
	clrw bc
	movw ax, #0x03E8
	call !!_delay_ms
	;***      391 : 		O_SPOUT_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 391
	clr1 0xFFF07.7
	;***      392 : 		delay_ms(g_timerSetting.t52 - g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 392
	movw ax, !LOWW(_g_timerSetting+0x00028)
	subw ax, !LOWW(_g_timerSetting+0x00030)
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0002A)
	sknc
.BB@LABEL@25_5:	; if_then_bb
	decw ax
.BB@LABEL@25_6:	; if_then_bb
	subw ax, !LOWW(_g_timerSetting+0x00032)
	movw bc, ax
	movw ax, de
	call !!_delay_ms
	;***      393 : 		g_color = WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 393
	mov !LOWW(_g_color), #0x02
	;***      394 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 394
	mov a, #0x02
	call $!_handSensorLED
	;***      395 : 		O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 395
	set1 0xFFF05.5
	;***      396 : 		delay_ms(g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 396
	movw bc, !LOWW(_g_timerSetting+0x00032)
	movw ax, !LOWW(_g_timerSetting+0x00030)
	call !!_delay_ms
	;***      397 : 		O_PUMP_ACID_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 397
	clr1 0xFFF06.2
	;***      398 : 		delay_ms(_waterHamerTime);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 398
	clrw bc
	movw ax, #0x03E8
	call !!_delay_ms
	;***      399 : 		O_SPOUT_ACID_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 399
	clr1 0xFFF07.6
	;***      400 : 		delay_ms(g_timerSetting.t53 - g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 400
	movw ax, !LOWW(_g_timerSetting+0x0002C)
	subw ax, !LOWW(_g_timerSetting+0x00030)
	movw de, ax
	movw ax, !LOWW(_g_timerSetting+0x0002E)
	sknc
.BB@LABEL@25_7:	; if_then_bb
	decw ax
.BB@LABEL@25_8:	; if_then_bb
	subw ax, !LOWW(_g_timerSetting+0x00032)
	movw bc, ax
	movw ax, de
	call !!_delay_ms
	;***      401 : 		O_SPOUT_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 401
	clr1 0xFFF05.5
.BB@LABEL@25_9:	; bb22
	;***      402 : 	}
	;***      403 : 	while(readHS() == 1) R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 403
	call !!_readHS
	dec a
	bnz $.BB@LABEL@25_11
.BB@LABEL@25_10:	; bb
	call !!_R_WDT_Restart
	br $.BB@LABEL@25_9
.BB@LABEL@25_11:	; bb28
	mov a, [sp+0x00]
	;***      404 : 	if(_state == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 404
	dec a
	bnz $.BB@LABEL@25_13
.BB@LABEL@25_12:	; if_then_bb34
	;***      405 : 		g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 405
	clrb !LOWW(_g_color)
	;***      406 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 406
	clrb a
	pop hl
	br $!_handSensorLED
.BB@LABEL@25_13:	; return
	;***      407 : 	}
	;***      408 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 408
	pop hl
	ret
_AcidWaterMode:
	.STACK _AcidWaterMode = 12
	;***      409 : void AcidWaterMode(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 409
	subw sp, #0x08
	;***      410 : 	uint8_t _state = 0;
	;***      411 : 	uint32_t _stamp = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 411
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
	;***      412 : 	const uint32_t _waterHamerTime = 1000;
	;***      413 : 	if(readHS() == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 413
	call !!_readHS
	dec a
	bz $.BB@LABEL@26_2
.BB@LABEL@26_1:	; entry.bb9.preheader_crit_edge
	clrb a
	mov [sp+0x00], a
	br $.BB@LABEL@26_3
.BB@LABEL@26_2:	; if_then_bb
	;***      414 : 		_state = 1;
	;***      415 : 		O_SPOUT_ACID_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 415
	set1 0xFFF07.6
	;***      416 : 		delay_ms(100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 416
	clrw bc
	movw ax, #0x0064
	call !!_delay_ms
	;***      417 : 		O_PUMP_ACID_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 417
	set1 0xFFF06.2
	;***      418 : 		g_color = RED;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 418
	oneb !LOWW(_g_color)
	oneb a
	mov [sp+0x00], a
	;***      419 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 419
	oneb a
	call $!_handSensorLED
.BB@LABEL@26_3:	; bb9
	;***      420 : 	}
	;***      421 : 	while((readHS() == 1)&(g_systemTime - _stamp < g_timerSetting.t56)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 421
	call !!_readHS
	mov b, a
	movw hl, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, de
	movw [sp+0x04], ax
	movw ax, [sp+0x06]
	movw de, ax
	movw ax, hl
	sknc
.BB@LABEL@26_4:	; bb9
	decw ax
.BB@LABEL@26_5:	; bb9
	subw ax, de
	cmpw ax, !LOWW(_g_timerSetting+0x00036)
	movw ax, [sp+0x04]
	sknz
.BB@LABEL@26_6:	; bb9
	cmpw ax, !LOWW(_g_timerSetting+0x00034)
.BB@LABEL@26_7:	; bb9
	bnc $.BB@LABEL@26_10
.BB@LABEL@26_8:	; bb9
	dec b
	bnz $.BB@LABEL@26_10
.BB@LABEL@26_9:	; bb
	;***      422 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 422
	call !!_R_WDT_Restart
	br $.BB@LABEL@26_3
.BB@LABEL@26_10:	; bb24
	mov a, [sp+0x00]
	;***      423 : 	}
	;***      424 : 	if(_state == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 424
	dec a
	bnz $.BB@LABEL@26_12
.BB@LABEL@26_11:	; if_then_bb30
	;***      425 : 		O_PUMP_ACID_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 425
	clr1 0xFFF06.2
	;***      426 : 		delay_ms(_waterHamerTime);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 426
	clrw bc
	movw ax, #0x03E8
	call !!_delay_ms
	;***      427 : 		O_SPOUT_ACID_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 427
	clr1 0xFFF07.6
	;***      428 : 		g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 428
	clrb !LOWW(_g_color)
	;***      429 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 429
	clrb a
	addw sp, #0x08
	br $!_handSensorLED
.BB@LABEL@26_12:	; return
	;***      430 : 	}
	;***      431 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 431
	addw sp, #0x08
	ret
_AlkalineWaterMode:
	.STACK _AlkalineWaterMode = 12
	;***      432 : void AlkalineWaterMode(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 432
	subw sp, #0x08
	;***      433 : 	uint8_t _state = 0;
	;***      434 : 	uint32_t _stamp = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 434
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x02], ax
	;***      435 : 	const uint32_t _waterHamerTime = 1000;
	;***      436 : 	if(readHS() == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 436
	call !!_readHS
	dec a
	bz $.BB@LABEL@27_2
.BB@LABEL@27_1:	; entry.bb9.preheader_crit_edge
	clrb a
	mov [sp+0x00], a
	br $.BB@LABEL@27_3
.BB@LABEL@27_2:	; if_then_bb
	;***      437 : 		_state = 1;
	;***      438 : 		O_SPOUT_ALK_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 438
	set1 0xFFF07.7
	;***      439 : 		delay_ms(100);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 439
	clrw bc
	movw ax, #0x0064
	call !!_delay_ms
	;***      440 : 		O_PUMP_ALK_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 440
	set1 0xFFF06.1
	;***      441 : 		g_color = RED;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 441
	oneb !LOWW(_g_color)
	oneb a
	mov [sp+0x00], a
	;***      442 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 442
	oneb a
	call $!_handSensorLED
.BB@LABEL@27_3:	; bb9
	;***      443 : 	}
	;***      444 : 	while((readHS() == 1)&(g_systemTime - _stamp < g_timerSetting.t56)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 444
	call !!_readHS
	mov b, a
	movw hl, !LOWW(_g_systemTime+0x00002)
	movw ax, [sp+0x02]
	movw de, ax
	movw ax, !LOWW(_g_systemTime)
	subw ax, de
	movw [sp+0x04], ax
	movw ax, [sp+0x06]
	movw de, ax
	movw ax, hl
	sknc
.BB@LABEL@27_4:	; bb9
	decw ax
.BB@LABEL@27_5:	; bb9
	subw ax, de
	cmpw ax, !LOWW(_g_timerSetting+0x00036)
	movw ax, [sp+0x04]
	sknz
.BB@LABEL@27_6:	; bb9
	cmpw ax, !LOWW(_g_timerSetting+0x00034)
.BB@LABEL@27_7:	; bb9
	bnc $.BB@LABEL@27_10
.BB@LABEL@27_8:	; bb9
	dec b
	bnz $.BB@LABEL@27_10
.BB@LABEL@27_9:	; bb
	;***      445 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 445
	call !!_R_WDT_Restart
	br $.BB@LABEL@27_3
.BB@LABEL@27_10:	; bb24
	mov a, [sp+0x00]
	;***      446 : 	}
	;***      447 : 	if(_state == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 447
	dec a
	bnz $.BB@LABEL@27_12
.BB@LABEL@27_11:	; if_then_bb30
	;***      448 : 		O_PUMP_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 448
	clr1 0xFFF06.1
	;***      449 : 		delay_ms(_waterHamerTime);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 449
	clrw bc
	movw ax, #0x03E8
	call !!_delay_ms
	;***      450 : 		O_SPOUT_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 450
	clr1 0xFFF07.7
	;***      451 : 		g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 451
	clrb !LOWW(_g_color)
	;***      452 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 452
	clrb a
	addw sp, #0x08
	br $!_handSensorLED
.BB@LABEL@27_12:	; return
	;***      453 : 	}
	;***      454 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 454
	addw sp, #0x08
	ret
_nostop_CallanCleaningMode:
	.STACK _nostop_CallanCleaningMode = 6
	;***      455 : void nostop_CallanCleaningMode(void){
	;***      456 : 	if((g_TickKeeper.SV1_OFF_minutes >= g_timerSetting.t61) &
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 456
	movw de, !LOWW(_g_timerSetting+0x0003E)
	movw bc, !LOWW(_g_timerSetting+0x0003C)
	movw ax, !LOWW(_g_TickKeeper@2+0x0000E)
	cmpw ax, de
	movw ax, !LOWW(_g_TickKeeper@2+0x0000C)
	sknz
.BB@LABEL@28_1:	; entry
	cmpw ax, bc
.BB@LABEL@28_2:	; entry
	movw hl, !LOWW(_g_TickKeeper@2+0x00004)
	movw ax, !LOWW(_g_TickKeeper@2+0x00006)
	bc $.BB@LABEL@28_7
.BB@LABEL@28_3:	; entry
	cmpw ax, de
	movw ax, hl
	sknz
.BB@LABEL@28_4:	; entry
	cmpw ax, bc
.BB@LABEL@28_5:	; entry
	bc $.BB@LABEL@28_7
.BB@LABEL@28_6:	; if_then_bb
	;***      457 : 			(g_TickKeeper.SV2_OFF_minutes >= g_timerSetting.t61)){
	;***      458 : 		g_callan_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 458
	oneb !LOWW(_g_callan_clear_flag@3)
	;***      459 : 		g_Tick.tickCustom[6] = g_Tick.tickCustom[7] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 459
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0002E), ax
	movw !LOWW(_g_Tick@1+0x0002A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0002C), ax
	movw !LOWW(_g_Tick@1+0x00028), ax
	;***      460 : 		O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 460
	set1 0xFFF05.5
.BB@LABEL@28_7:	; if_break_bb
	;***      461 : 	}
	;***      462 : 	if(g_callan_clear_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 462
	cmp0 !LOWW(_g_callan_clear_flag@3)
	bz $.BB@LABEL@28_14
.BB@LABEL@28_8:	; if_then_bb18
	;***      463 : 		if(ns_delay_ms(&g_Tick.tickCustom[6], 500)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 463
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick@1+0x00028)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@28_12
.BB@LABEL@28_9:	; if_then_bb23
	;***      464 : 			g_color = g_color == WHITE ? BLACK:WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 464
	cmp !LOWW(_g_color), #0x02
	clrb a
	skz
.BB@LABEL@28_10:	; bb28
	mov a, #0x02
.BB@LABEL@28_11:	; bb29
	mov !LOWW(_g_color), a
	;***      465 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 465
	call $!_handSensorLED
.BB@LABEL@28_12:	; if_break_bb34
	;***      466 : 		}
	;***      467 : 		if(ns_delay_ms(&g_Tick.tickCustom[7], g_timerSetting.t62*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 467
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
	movw ax, #LOWW(_g_Tick@1+0x0002C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@28_14
.BB@LABEL@28_13:	; if_then_bb41
	;***      468 : 			g_callan_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 468
	clrb !LOWW(_g_callan_clear_flag@3)
	;***      469 : 			O_SPOUT_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 469
	clr1 0xFFF05.5
	;***      470 : 			g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 470
	clrb !LOWW(_g_color)
	;***      471 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 471
	clrb a
	br $!_handSensorLED
.BB@LABEL@28_14:	; return
	;***      472 : 		}
	;***      473 : 	}
	;***      474 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 474
	ret
_main_20211111:
	.STACK _main_20211111 = 4
	;***      475 : // Newest
	;***      476 : void main_20211111(void){
	;***      477 : 	InitialOperationModeStart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 477
	call $!_InitialOperationModeStart
	;***      478 : 	WaterSupplyOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 478
	call $!_WaterSupplyOperation
	;***      479 : 	ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 479
	br $!_ElectrolyticOperation
_main_20211111_while:
	.STACK _main_20211111_while = 4
	;***      480 : 
	;***      481 : //	Test section
	;***      482 : //	electrolyticOperationON();
	;***      483 : //	delay_ms(500);
	;***      484 : //	Voltage1Check();
	;***      485 : //	Voltage2Check();
	;***      486 : //	Voltage3Check();
	;***      487 : //	LowVoltageCheck();
	;***      488 : //	if(OverCurrentCheck() == 0) electrolyticOperationOFF();
	;***      489 : }
	;***      490 : void main_20211111_while(void){
	;***      491 : 	ElectrolyzeWaterGeneration();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 491
	call $!_ElectrolyzeWaterGeneration
	;***      492 : 	WaterWashingMode();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 492
	br $!_WaterWashingMode
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      493 : 
	;***      494 : }
	;***      495 : 
	;***      496 : /**
	;***      497 :  * 30/11/2021: Checked by An, missing Neutralization timer ON
	;***      498 :  */
	;***      499 : void electrolyticOperationON(void){
	;***      500 : 	//Electrolytic operation ON
	;***      501 : 	O_SUPPLY_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 501
	set1 0xFFF01.7
	;***      502 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 502
	set1 0xFFF0E.2
	;***      503 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 503
	set1 0xFFF06.0
	;***      504 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 504
	oneb !LOWW(_g_electrolytic_flag)
	;***      505 : 	g_neutralization_time = g_neutralization_time == 0 ? g_systemTime:g_neutralization_time;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 505
	movw bc, !LOWW(_g_neutralization_time+0x00002)
	movw ax, !LOWW(_g_neutralization_time)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@31_3
.BB@LABEL@31_1:	; entry
	bc $.BB@LABEL@31_3
.BB@LABEL@31_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@31_3:	; bb6
	movw ax, de
	movw !LOWW(_g_neutralization_time), ax
	movw ax, bc
	movw !LOWW(_g_neutralization_time+0x00002), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 507
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      506 : 	//TODO: Add Neutralization timer ON
	;***      507 : }
	;***      508 : /**
	;***      509 :  * 30/11/2021: Checked by An, missing Neutralization timer OFF
	;***      510 :  */
	;***      511 : void electrolyticOperationOFF(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 511
	clrw ax
	;***      512 : 	//TODO: Add Neutralization timer OFF
	;***      513 : 	g_neutralization_time = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 513
	movw !LOWW(_g_neutralization_time+0x00002), ax
	movw !LOWW(_g_neutralization_time), ax
	;***      514 : 	//Electrolytic operation OFF
	;***      515 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 515
	clr1 0xFFF0E.2
	;***      516 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 516
	clr1 0xFFF06.0
	;***      517 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 517
	mov a, #0x05
	call !!_delay
	;***      518 : 	O_SUPPLY_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 518
	clr1 0xFFF01.7
	;***      519 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 519
	clrb !LOWW(_g_electrolytic_flag)
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***      520 : 
	;***      521 : }
	;***      522 : /**
	;***      523 :  *
	;***      524 :  * @param s: Period time take measurement in mills second
	;***      525 :  * @return L/minutes
	;***      526 :  */
	;***      527 : float measureFlowSensor(uint32_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 527
	push bc
	push ax
	subw sp, #0x0A
	;***      528 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 528
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
.BB@LABEL@33_1:	; bb28
	movw ax, [sp+0x0A]
	movw bc, ax
	movw ax, [sp+0x0C]
	movw de, ax
	;***      529 : 	float flow_pluse = 0.0;
	;***      530 : 	uint8_t flow_pulse_state = 1;
	;***      531 : 	while(!ns_delay_ms(&stamp_flow_sensor, s)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 531
	movw ax, sp
	addw ax, #0x0006
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@33_7
.BB@LABEL@33_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      532 : 		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 532
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@33_6
.BB@LABEL@33_3:	; if_then_bb
	;***      533 : 			if(I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 533
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@33_5
.BB@LABEL@33_4:	; if_then_bb21
	movw ax, #0x3F80
	;***      534 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 534
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
.BB@LABEL@33_5:	; if_break_bb
	;***      535 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 535
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@33_6:	; if_break_bb27
	;***      536 : 		}
	;***      537 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 537
	call !!_R_WDT_Restart
	br $.BB@LABEL@33_1
.BB@LABEL@33_7:	; bb39
	movw ax, #0x3F33
	;***      538 : 	}
	;***      539 : 	float flow_value = (flow_pluse*0.7*60)/s; // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 539
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
	movw [sp+0x06], ax
	movw ax, bc
	movw [sp+0x04], ax
	addw sp, #0x04
	movw ax, [sp+0x0C]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_ultof
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fdiv
	;***      540 : 	return flow_value;
	;***      541 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 541
	addw sp, #0x12
	ret
	;***      542 : 
	.SECTION .bss,BSS
	.ALIGN 2
_g_Tick@1:
	.DS (48)
	.ALIGN 2
_g_TickKeeper@2:
	.DS (16)
_g_callan_clear_flag@3:
	.DS (1)
	.ALIGN 2
_g_numberSetting:
	.DS (34)
_g_color:
	.DS (1)
_g_pre_color:
	.DS (1)
	.ALIGN 2
_g_cvcc_current:
	.DS (4)
	.ALIGN 2
_g_cvcc_voltge:
	.DS (4)
_g_alarm:
	.DS (1)
	.ALIGN 2
_g_flow_value:
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
	.ALIGN 2
_g_neutralization_time:
	.DS (4)
_g_electrolytic_flag:
	.DS (1)
