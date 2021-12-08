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
#@  compiled at Wed Dec 08 17:02:54 2021

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
	.EXTERN _ns_delay_ms
	.PUBLIC _AcidWaterMode
	.PUBLIC _nostop_AlkalineWaterMode
	.PUBLIC _nostop_CallanCleaningMode
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
	;***       66 :     g_timerSetting.t2_flowSensorStartTime = 0x0000ffff;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***       67 :     g_timerSetting.t3_flowSensorMonitorTime = 0x0000aaaa;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       68 :     g_timerSetting.t6_drainageOffTime = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	movw !LOWW(_g_timerSetting+0x0000A), ax
	;***       69 : 	g_timerSetting.t11_overVoltage1Time = 1000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw !LOWW(_g_timerSetting+0x0000E), ax
	;***       70 : 	g_timerSetting.t12_overVoltage2Time = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw !LOWW(_g_timerSetting+0x00012), ax
	;***       71 : 	g_timerSetting.t13_overVoltage3Time = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       72 : 	g_timerSetting.t14_lowVoltageStartTime = 5000; //60000
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_timerSetting+0x0001A), ax
	;***       73 : 	g_timerSetting.t15_lowVoltageDelayTime = 2000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_timerSetting+0x0001E), ax
	;***       74 : 	g_timerSetting.t17_solenoidLeakageStartTime = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_timerSetting+0x00022), ax
	;***       75 : 	g_timerSetting.t51 = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_timerSetting+0x00026), ax
	;***       76 : 	g_timerSetting.t52 = 2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x0002A), ax
	;***       77 : 	g_timerSetting.t53 = 3;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_timerSetting+0x0002E), ax
	movw ax, #0x400C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 62
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	movw !LOWW(_g_numberSetting+0x0001E), ax
	clrw ax
	decw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	movw !LOWW(_g_timerSetting), ax
	movw ax, #0xAAAA
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 67
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0x03E8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 68
	movw !LOWW(_g_timerSetting+0x00008), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 69
	movw !LOWW(_g_timerSetting+0x0000C), ax
	movw ax, #0x07D0
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 70
	movw !LOWW(_g_timerSetting+0x00010), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	movw !LOWW(_g_timerSetting+0x0001C), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 71
	movw !LOWW(_g_timerSetting+0x00014), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 72
	movw !LOWW(_g_timerSetting+0x00018), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 74
	movw !LOWW(_g_timerSetting+0x00020), ax
	onew ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 75
	movw !LOWW(_g_timerSetting+0x00024), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 76
	movw !LOWW(_g_timerSetting+0x00028), ax
	incw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 77
	movw !LOWW(_g_timerSetting+0x0002C), ax
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 10
	;***       78 : }
	;***       79 : #ifdef RENAN_CODE
	;***       80 : void renanCode(void){
	;***       81 : 	//Power On Mode
	;***       82 : 	O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       83 : 	O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       84 : 	do{
	;***       85 : 		O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN;	// Turn on SV5 if ACID tank empty
	;***       86 : 		O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN;	// Turn on SV6 if ALK tank empty
	;***       87 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***       88 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***       89 : 		R_WDT_Restart();
	;***       90 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***       91 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***       92 : 	O_DRAIN_ACID_PIN = O_DRAIN_ALK_PIN = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***       93 : 
	;***       94 : 	// Drainage operation
	;***       95 : 	O_SPOUT_WATER_PIN = ON;	// SV2 On
	;***       96 : 	delay(st[1]);			// Default 30 seconds
	;***       97 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	;***       98 : 	delay_ms(500);
	;***       99 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	;***      100 : }
	;***      101 : 
	;***      102 : 
	;***      103 : void code_20211029(void){
	;***      104 : 	//---------------Electrolytic operation-----------------------------
	;***      105 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	;***      106 : 	O_CVCC_ON_PIN = ON;
	;***      107 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***      108 : 	delay(10);
	;***      109 : 	//TODO: Neutralization timer On
	;***      110 : 
	;***      111 : 	overVoltage1Error();
	;***      112 : }
	;***      113 : #endif
	;***      114 : 
	;***      115 : //----------------------Begin code 11112021--------------------------------------
	;***      116 : void sendToRasPi(enum UART_header_e head, enum Control_status type, float value){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 116
	push hl
	push ax
	movw ax, bc
	push de
	pop bc
	;***      117 : 	uint8_t state = g_uart2_sendend;
	;***      118 : 	g_control_buffer.head = head;
	;***      119 : 	g_control_buffer.set_number = type;
	;***      120 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 120
	call !!__COM_ftoul
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 117
	mov a, !LOWW(_g_uart2_sendend)
	mov [sp+0x02], a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 118
	mov !LOWW(_g_control_buffer), a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 119
	mov !LOWW(_g_control_buffer+0x00001), a
	;***      121 : 	R_UART2_Send((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 121
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@3_1:	; bb10
	mov a, [sp+0x02]
	;***      122 : 	while(state == g_uart2_sendend);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 122
	cmp a, !LOWW(_g_uart2_sendend)
	bz $.BB@LABEL@3_1
.BB@LABEL@3_2:	; return
	;***      123 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 123
	addw sp, #0x04
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 4
	;***      124 : /**
	;***      125 :  * InitialOperationModeStart
	;***      126 :  * 30/11/2021: Checked!
	;***      127 :  */
	;***      128 : void InitialOperationModeStart(void){
	;***      129 : 	OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
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
	;***      130 : 	OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
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
	;***      131 : 	do{
	;***      132 : 		OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OPTION_1_PIN;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 132
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
	;***      133 : 		OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OPTION_2_PIN;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
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
	;***      134 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 131
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
	;***      135 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      136 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 136
	ret
_FlowSensorCheck:
	.STACK _FlowSensorCheck = 18
	;***      137 : /**
	;***      138 :  * FlowSensorCheck
	;***      139 :  * 30/11/2021: Checked!
	;***      140 :  * @return 0 is Error, 1 is OK
	;***      141 :  */
	;***      142 : uint8_t FlowSensorCheck(uint32_t *_time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 142
	subw sp, #0x08
	push ax
	;***      143 : 	delay(15);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	mov a, #0x0F
	call !!_delay
	pop de
	push de
	;***      144 : 	g_flow_value = measureFlowSensor(*_time);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	movw ax, [de+0x02]
	movw bc, ax
	movw ax, [de]
	call $!_measureFlowSensor
	movw [sp+0x02], ax
	movw !LOWW(_g_flow_value), ax
	movw ax, bc
	movw [sp+0x00], ax
	movw !LOWW(_g_flow_value+0x00002), ax
	;***      145 : 	if((g_flow_value < g_numberSetting.upperFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 145
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
	;***      146 : 			&(g_flow_value > g_numberSetting.lowerFlow)){
	;***      147 : 		return 1;
	;***      148 : 	}else{
	;***      149 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      150 : 		return 0;
	;***      151 : 	}
	;***      152 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	oneb a
.BB@LABEL@5_11:	; bb17
	addw sp, #0x0A
	ret
.BB@LABEL@5_12:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 150
	clrb a
	br $.BB@LABEL@5_11
_WaterSupplyOperation:
	.STACK _WaterSupplyOperation = 8
	;***      153 : /**
	;***      154 :  * WaterSupplyOperation
	;***      155 :  * 30/11/2021: Checked by An, need to test with Raspberry Pi Adjust alarm
	;***      156 :  */
	;***      157 : void WaterSupplyOperation(void){
	;***      158 : 	O_SPOUT_WATER_PIN = ON;		// SV2 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	set1 0xFFF05.5
	;***      159 : 	delay(30);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 159
	mov a, #0x1E
	call !!_delay
	;***      160 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	set1 0xFFF01.7
	;***      161 : 	delay_ms(500);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 161
	clrw bc
	movw ax, #0x01F4
	call !!_delay_ms
	;***      162 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	clr1 0xFFF05.5
.BB@LABEL@6_1:	; bb6
	;***      163 : 	while(FlowSensorCheck(&g_timerSetting.t3_flowSensorMonitorTime) != 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 163
	movw ax, #LOWW(_g_timerSetting+0x00004)
	call $!_FlowSensorCheck
	dec a
	bz $.BB@LABEL@6_3
.BB@LABEL@6_2:	; bb
	movw ax, #0x447A
	;***      164 : 		//TODO: RasPi - Adjust
	;***      165 : 		uint32_t _flow = g_flow_value*1000; // mL/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 165
	push ax
	clrw ax
	push ax
	movw bc, !LOWW(_g_flow_value+0x00002)
	movw ax, !LOWW(_g_flow_value)
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	;***      166 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, _flow);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4104
	call $!_sendToRasPi
	br $.BB@LABEL@6_1
.BB@LABEL@6_3:	; bb11
	;***      167 : 	}
	;***      168 : 	delay(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
	mov a, #0x0A
	br !!_delay
_Voltage1Check:
	.STACK _Voltage1Check = 12
	;***      169 : }
	;***      170 : /**
	;***      171 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      172 :  * 30/11/2021: Checked by An
	;***      173 :  * @return 0 - OK; 1 - Error
	;***      174 :  */
	;***      175 : uint8_t Voltage1Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	subw sp, #0x04
	;***      176 : 	if(g_cvcc_voltge>=g_numberSetting.upperVoltage1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
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
	;***      177 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
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
	;***      178 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 178
	call $!_electrolyticOperationOFF
.BB@LABEL@7_2:	; bb9
	;***      179 : 		//TODO: Wait to reset
	;***      180 : 		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_VOLTAGE_1)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	cmp !LOWW(_g_rx_data+0x00001), #0x05
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@7_5
.BB@LABEL@7_3:	; bb9
	cmp a, #0x43
	bz $.BB@LABEL@7_5
.BB@LABEL@7_4:	; bb
	;***      181 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	call !!_R_WDT_Restart
	br $.BB@LABEL@7_2
.BB@LABEL@7_5:	; bb9.bb25_crit_edge
	oneb a
.BB@LABEL@7_6:	; bb25
	;***      182 : 		}
	;***      183 : 		return 1;
	;***      184 : 	}
	;***      185 : 	return 0;
	;***      186 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 186
	addw sp, #0x04
	ret
_Voltage2Check:
	.STACK _Voltage2Check = 24
	;***      187 : /**
	;***      188 :  * Alarm every g_timerSetting.t12_overVoltage2Time second until voltage valid.
	;***      189 :  * 30/11/2021: Checked by An
	;***      190 :  * @return 0 - OK
	;***      191 :  */
	;***      192 : void Voltage2Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 192
	subw sp, #0x10
	br $!.BB@LABEL@8_18
.BB@LABEL@8_1:	; bb13
	;***      193 : 	uint16_t _time_count = 0;
	;***      194 : 	do{
	;***      195 : 		_time_count = 0;
	;***      196 : 		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
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
	;***      197 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
	clrw bc
	onew ax
	call !!_delay_ms
	clrw ax
	;***      198 : 			_time_count++;
	;***      199 : 			if(_time_count == g_timerSetting.t12_overVoltage2Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	cmpw ax, !LOWW(_g_timerSetting+0x00012)
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	incw ax
	movw [sp+0x00], ax
	sknz
.BB@LABEL@8_10:	; bb2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	cmpw ax, !LOWW(_g_timerSetting+0x00010)
.BB@LABEL@8_11:	; bb2
	bnz $.BB@LABEL@8_13
.BB@LABEL@8_12:	; if_then_bb
	movw ax, #0x447A
	;***      200 : 				sendToRasPi(H_ALARM, OVER_VOLTAGE_2, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
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
	;***      201 : 			}
	;***      202 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	call !!_R_WDT_Restart
.BB@LABEL@8_14:	; if_break_bb
	br $!.BB@LABEL@8_1
.BB@LABEL@8_15:	; bb27
	movw ax, [sp+0x0E]
	movw bc, ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
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
	;***      203 : 		}
	;***      204 : 	}while(_time_count == g_timerSetting.t12_overVoltage2Time);
	;***      205 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 205
	addw sp, #0x10
	ret
_Voltage3Check:
	.STACK _Voltage3Check = 24
	;***      206 : /**
	;***      207 :  * Alarm after g_timerSetting.t13_overVoltage3Time second. Turn OFF electrolytic and stop until valid.
	;***      208 :  * 30/11/2021: Checked by An
	;***      209 :  * @return 0 - OK; 1 - Error
	;***      210 :  */
	;***      211 : uint8_t Voltage3Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 211
	subw sp, #0x10
	clrw ax
.BB@LABEL@9_1:	; entry
	movw [sp+0x00], ax
	;***      212 : 	uint16_t _time_count = 0;
	;***      213 : 	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 213
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
	;***      214 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	clrw bc
	onew ax
	call !!_delay_ms
	;***      215 : 		_time_count++;
	;***      216 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	call !!_R_WDT_Restart
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@9_1
.BB@LABEL@9_10:	; bb17
	movw ax, [sp+0x0C]
	movw bc, ax
	clrw ax
	;***      217 : 	}
	;***      218 : 	if(_time_count == g_timerSetting.t13_overVoltage3Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
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
	;***      219 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_3, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
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
	;***      220 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 220
	call $!_electrolyticOperationOFF
.BB@LABEL@9_14:	; bb29
	;***      221 : 		//TODO: Wait to reset
	;***      222 : 		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_VOLTAGE_3)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	cmp !LOWW(_g_rx_data+0x00001), #0x07
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@9_17
.BB@LABEL@9_15:	; bb29
	cmp a, #0x43
	bz $.BB@LABEL@9_17
.BB@LABEL@9_16:	; bb28
	;***      223 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	call !!_R_WDT_Restart
	br $.BB@LABEL@9_14
.BB@LABEL@9_17:	; bb29.bb45_crit_edge
	oneb a
.BB@LABEL@9_18:	; bb45
	;***      224 : 		}
	;***      225 : 		return 1;
	;***      226 : 	}
	;***      227 : 	return 0;
	;***      228 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	addw sp, #0x10
	ret
_LowVoltageCheck:
	.STACK _LowVoltageCheck = 24
	;***      229 : uint8_t LowVoltageCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	subw sp, #0x10
	;***      230 : 	uint16_t _time_count = 0;
	;***      231 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	call $!_electrolyticOperationON
.BB@LABEL@10_1:	; bb2
	;***      232 : 	while((g_systemTime - g_neutralization_time < g_timerSetting.t14_lowVoltageStartTime)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 232
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
	;***      233 : 		R_WDT_Restart();
	;***      234 : 	}
	;***      235 : 	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < g_timerSetting.t15_lowVoltageDelayTime)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 235
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
	;***      236 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
	clrw bc
	onew ax
	call !!_delay_ms
	;***      237 : 		_time_count++;
	;***      238 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 238
	call !!_R_WDT_Restart
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@10_7
.BB@LABEL@10_16:	; bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 233
	call !!_R_WDT_Restart
	br $!.BB@LABEL@10_1
.BB@LABEL@10_17:	; bb27
	movw ax, [sp+0x0C]
	movw bc, ax
	clrw ax
	;***      239 : 	}
	;***      240 : 	if(_time_count == g_timerSetting.t15_lowVoltageDelayTime){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
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
	;***      241 : 		sendToRasPi(H_ALARM, UNDER_VOLTAGE, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
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
	;***      242 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 242
	call $!_electrolyticOperationOFF
.BB@LABEL@10_21:	; bb39
	;***      243 : 		//TODO: Wait to reset
	;***      244 : 		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != UNDER_VOLTAGE)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	cmp !LOWW(_g_rx_data+0x00001), #0x08
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@10_24
.BB@LABEL@10_22:	; bb39
	cmp a, #0x43
	bz $.BB@LABEL@10_24
.BB@LABEL@10_23:	; bb38
	;***      245 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 245
	call !!_R_WDT_Restart
	br $.BB@LABEL@10_21
.BB@LABEL@10_24:	; bb39.bb55_crit_edge
	oneb a
.BB@LABEL@10_25:	; bb55
	;***      246 : 		}
	;***      247 : 		return 1;
	;***      248 : 	}
	;***      249 : 	return 0;
	;***      250 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	addw sp, #0x10
	ret
_OverCurrentCheck:
	.STACK _OverCurrentCheck = 20
	;***      251 : uint8_t OverCurrentCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	subw sp, #0x0C
	;***      252 : 	uint16_t _time_count = 0;
	;***      253 : 	const uint16_t _max_time = 5000;
	;***      254 : 	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
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
	;***      255 : 		sendToRasPi(H_ALARM, CURRENT_ABNORMAL, (uint32_t)(g_cvcc_current*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
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
	;***      256 : 		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < _max_time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
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
	;***      257 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
	clrw bc
	onew ax
	call !!_delay_ms
	;***      258 : 			_time_count++;
	;***      259 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
	call !!_R_WDT_Restart
	movw ax, [sp+0x00]
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@11_4
.BB@LABEL@11_11:	; bb33
	movw ax, [sp+0x00]
	;***      260 : //			electrolyticOperationOFF();
	;***      261 : 		}
	;***      262 : 		if(_time_count >= _max_time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	cmpw ax, #0x1388
	.bc $!.BB@LABEL@11_2
.BB@LABEL@11_12:	; if_then_bb39
	movw ax, #0x447A
	;***      263 : 			sendToRasPi(H_ALARM, OVER_CURRENT, (uint32_t)(g_cvcc_current*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
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
	;***      264 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	call $!_electrolyticOperationOFF
.BB@LABEL@11_13:	; bb45
	;***      265 : 			//TODO: Wait to reset
	;***      266 : 			while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_CURRENT)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	cmp !LOWW(_g_rx_data+0x00001), #0x0A
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@11_16
.BB@LABEL@11_14:	; bb45
	cmp a, #0x43
	bz $.BB@LABEL@11_16
.BB@LABEL@11_15:	; bb44
	;***      267 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 267
	call !!_R_WDT_Restart
	br $.BB@LABEL@11_13
.BB@LABEL@11_16:	; bb45.bb62_crit_edge
	oneb a
.BB@LABEL@11_17:	; bb62
	;***      268 : 			}
	;***      269 : 			return 1;
	;***      270 : 		}
	;***      271 : 	}
	;***      272 : 	return 0;
	;***      273 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	addw sp, #0x0C
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@12_1:	; WAIT_RESET
	;***      274 : void ElectrolyticOperation(void){
	;***      275 : 	WAIT_RESET:
	;***      276 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	call $!_electrolyticOperationON
.BB@LABEL@12_2:	; bb
	;***      277 : 	do{
	;***      278 : 		if(Voltage1Check()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 278
	call $!_Voltage1Check
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_3:	; if_break_bb
	;***      279 : 		Voltage2Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 279
	call $!_Voltage2Check
	;***      280 : 		if(Voltage3Check()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 280
	call $!_Voltage3Check
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_4:	; if_break_bb12
	;***      281 : 		if(LowVoltageCheck()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 281
	call $!_LowVoltageCheck
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_5:	; if_break_bb20
	;***      282 : 		if(OverCurrentCheck()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	call $!_OverCurrentCheck
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_6:	; if_break_bb28
	;***      283 : 		//----------CVCC Alarm Input-----------------
	;***      284 : 		if(I_CVCC_ALARM_IN == I_ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	mov a, 0xFFF00
	bf a.4, $.BB@LABEL@12_9
.BB@LABEL@12_7:	; if_break_bb53
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
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
	;***      285 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	;***      286 : 			electrolyticOperationOFF();
	;***      287 : 			//TODO: Wait Reset
	;***      288 : 			while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != CVCC_ALARM)){
	;***      289 : 				R_WDT_Restart();
	;***      290 : 			}
	;***      291 : 			goto WAIT_RESET;
	;***      292 : 		}
	;***      293 : 	}while((I_ACID_H_PIN == 0)|(I_ALKALI_H_PIN == 0));
	;***      294 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
	br $!_electrolyticOperationOFF
.BB@LABEL@12_9:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 286
	call $!_electrolyticOperationOFF
.BB@LABEL@12_10:	; bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	cmp !LOWW(_g_rx_data+0x00001), #0x12
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@12_1
.BB@LABEL@12_11:	; bb38
	cmp a, #0x43
	bz $.BB@LABEL@12_1
.BB@LABEL@12_12:	; bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
	call !!_R_WDT_Restart
	br $.BB@LABEL@12_10
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      295 : }
	;***      296 : void solenoidCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
	subw sp, #0x04
	;***      297 : 	uint32_t _time_count = 0;
	;***      298 : 	if((g_flow_value <= 0.1f)&(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 298
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
	;***      299 : 		_time_count++;
	;***      300 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 300
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@13_5:	; if_break_bb
	;***      301 : 	}
	;***      302 : 	if(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
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
	;***      303 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi
.BB@LABEL@13_9:	; return
	;***      304 : 	}
	;***      305 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      306 : void saltWaterTankFullCheck(void){
	;***      307 : 	if(I_SALT_H_PIN == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@14_2
.BB@LABEL@14_1:	; return
	;***      308 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      309 : 		electrolyticOperationOFF();
	;***      310 : 		//TODO: Fault in the flowchart
	;***      311 : 	}
	;***      312 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 312
	ret
.BB@LABEL@14_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 308
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	br $!_electrolyticOperationOFF
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      313 : void saltWaterTankEmptyCheck(void){
	;***      314 : 	if(I_SALT_L_PIN == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 314
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@15_2
.BB@LABEL@15_1:	; if_then_bb
	;***      315 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi
.BB@LABEL@15_2:	; return
	;***      316 : 		//TODO: Control OFF
	;***      317 : 	}
	;***      318 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 318
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      319 : void acidWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 319
	movw de, #0xFF07
	;***      320 : 	if(((I_ACID_L_PIN == 0)&((I_ACID_M_PIN == 1)|(I_ACID_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 320
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
	;***      321 : 			((I_ACID_M_PIN == 0)&(I_ACID_H_PIN == 1))){
	;***      322 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      323 : 		//TODO: Control OFF
	;***      324 : 	}
	;***      325 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	ret
.BB@LABEL@16_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 322
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      326 : void alkalineWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 326
	push hl
	;***      327 : 	if(((I_ALKALI_L_PIN == 0)&((I_ALKALI_M_PIN == 1)|(I_ALKALI_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 327
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
	;***      328 : 			((I_ALKALI_M_PIN == 0)&(I_ALKALI_H_PIN == 1))){
	;***      329 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      330 : 		//TODO: Control OFF
	;***      331 : 	}
	;***      332 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 332
	ret
.BB@LABEL@17_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 329
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi
_OpenSV1:
	.STACK _OpenSV1 = 4
	;***      333 : 
	;***      334 : void OpenSV1(void){
	;***      335 : 	O_SUPPLY_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 335
	set1 0xFFF01.7
	ret
_CloseSV1:
	.STACK _CloseSV1 = 4
	;***      336 : }
	;***      337 : void CloseSV1(void){
	;***      338 : 	O_SUPPLY_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 338
	clr1 0xFFF01.7
	ret
_OpenSV2:
	.STACK _OpenSV2 = 4
	;***      339 : }
	;***      340 : void OpenSV2(void){
	;***      341 : 	O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 341
	set1 0xFFF05.5
	ret
_CloseSV2:
	.STACK _CloseSV2 = 4
	;***      342 : }
	;***      343 : void CloseSV2(void){
	;***      344 : 	O_SPOUT_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 344
	clr1 0xFFF05.5
	ret
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      345 : }
	;***      346 : uint8_t FilterReplacementCheck(void){
	;***      347 : 
	;***      348 : 	return 0;
	;***      349 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 349
	clrb a
	ret
_ElectrolyzeWaterGeneration:
	.STACK _ElectrolyzeWaterGeneration = 4
	;***      350 : void ElectrolyzeWaterGeneration(void){
	;***      351 : 	if((I_ACID_L_PIN == I_OFF)|(I_ALKALI_L_PIN = I_OFF)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 351
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
	;***      352 : 		electrolyticOperationON();
	;***      353 : 	}else if((I_ACID_H_PIN = I_ON)&(I_ALKALI_H_PIN = I_ON)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 353
	clr1 [hl].3
	mov a, [hl]
	clr1 [hl].0
	shr a, 0x03
	and a, [hl]
	bt a.0, $.BB@LABEL@23_3
.BB@LABEL@23_2:	; return
	;***      354 : 		electrolyticOperationOFF();
	;***      355 : 	}
	;***      356 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 356
	ret
.BB@LABEL@23_3:	; if_then_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 354
	br $!_electrolyticOperationOFF
.BB@LABEL@23_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 352
	br $!_electrolyticOperationON
_WaterWashingMode:
	.STACK _WaterWashingMode = 6
	;***      357 : void WaterWashingMode(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 357
	push hl
	;***      358 : 	uint8_t _state = 0;
	;***      359 : 	if(readHS() == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 359
	call !!_readHS
	dec a
	clrb a
	bnz $.BB@LABEL@24_2
.BB@LABEL@24_1:	; if_then_bb
	;***      360 : 		O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 360
	set1 0xFFF05.5
	;***      361 : 		g_color = WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 361
	mov !LOWW(_g_color), #0x02
	;***      362 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 362
	mov a, #0x02
	call $!_handSensorLED
	oneb a
.BB@LABEL@24_2:	; if_then_bb
	mov [sp+0x00], a
.BB@LABEL@24_3:	; bb6
	;***      363 : 		_state = 1;
	;***      364 : 	}
	;***      365 : 	while(readHS() == 1) R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 365
	call !!_readHS
	dec a
	bnz $.BB@LABEL@24_5
.BB@LABEL@24_4:	; bb
	call !!_R_WDT_Restart
	br $.BB@LABEL@24_3
.BB@LABEL@24_5:	; bb12
	mov a, [sp+0x00]
	;***      366 : 	if(_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 366
	cmp0 a
	bnz $.BB@LABEL@24_7
.BB@LABEL@24_6:	; return
	;***      367 : 		delay(2);
	;***      368 : 		O_SPOUT_WATER_PIN = OFF;
	;***      369 : 		g_color = BLACK;
	;***      370 : 		handSensorLED(g_color);
	;***      371 : 	}
	;***      372 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 372
	pop hl
	ret
.BB@LABEL@24_7:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 367
	mov a, #0x02
	call !!_delay
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 368
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 369
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 370
	clrb a
	pop hl
	br $!_handSensorLED
_HandWashingMode:
	.STACK _HandWashingMode = 6
	;***      373 : void HandWashingMode(void){
	;***      374 : 	uint8_t *flag = &g_machine_flag.handwash;
	;***      375 : 	uint32_t *tick = &g_Tick.tickHandWash;
	;***      376 : 	const uint32_t delayPump_ms = 50;
	;***      377 : 	switch (*flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 377
	mov a, !LOWW(_g_machine_flag@3+0x00003)
	cmp0 a
	bz $.BB@LABEL@25_5
.BB@LABEL@25_1:	; entry
	dec a
	bz $.BB@LABEL@25_8
.BB@LABEL@25_2:	; entry
	dec a
	bz $.BB@LABEL@25_10
.BB@LABEL@25_3:	; entry
	dec a
	bz $.BB@LABEL@25_15
.BB@LABEL@25_4:	; switch_clause_bb56
	;***      378 : 		case 0:
	;***      379 : 			*flag = readHS() == 1?1:0;
	;***      380 : 			*tick = g_systemTime;
	;***      381 : 			break;
	;***      382 : 		case 1:
	;***      383 : 			O_SPOUT_ALK_PIN = ON;
	;***      384 : 			g_color = BLUE;
	;***      385 : 			handSensorLED(g_color);
	;***      386 : 			if(ns_delay_ms(tick, delayPump_ms)){
	;***      387 : 				O_PUMP_ALK_PIN = ON;
	;***      388 : 				sendToRasPi(H_SET, NEXT_ANIMATION, 0x0);
	;***      389 : 				(*flag)++;
	;***      390 : 			}
	;***      391 : 			break;
	;***      392 : 		case 2:
	;***      393 : 			if(ns_delay_ms(tick, (g_timerSetting.t51 - g_timerSetting.t54)*1000)){
	;***      394 : 				O_PUMP_ACID_PIN = ON;
	;***      395 : 				(*flag)++;
	;***      396 : 			}
	;***      397 : 			break;
	;***      398 : 		case 3:
	;***      399 : 			if(ns_delay_ms(tick, WATER_HAMER_TIME_MS)){
	;***      400 : 				O_SPOUT_ACID_PIN = OFF;
	;***      401 : 				g_color = BLACK;
	;***      402 : 				handSensorLED(g_color);
	;***      403 : 				(*flag)++;
	;***      404 : 			}
	;***      405 : 			break;
	;***      406 : 		default:
	;***      407 : 			*flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 407
	clrb !LOWW(_g_machine_flag@3+0x00003)
	ret
.BB@LABEL@25_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 379
	call !!_readHS
	dec a
	oneb a
	skz
.BB@LABEL@25_6:	; bb11
	clrb a
.BB@LABEL@25_7:	; bb12
	mov !LOWW(_g_machine_flag@3+0x00003), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 380
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0001E), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0001C), ax
	ret
.BB@LABEL@25_8:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 383
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 384
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 385
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 386
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@25_17
.BB@LABEL@25_9:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 387
	set1 0xFFF06.1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 388
	clrw ax
	movw de, ax
	movw ax, #0x5313
	call $!_sendToRasPi
	br $.BB@LABEL@25_14
.BB@LABEL@25_10:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 393
	movw ax, !LOWW(_g_timerSetting+0x00024)
	subw ax, !LOWW(_g_timerSetting+0x00030)
	movw bc, #0x03E8
	mulhu
	movw de, ax
	push bc
	pop hl
	movw ax, !LOWW(_g_timerSetting+0x00026)
	sknc
.BB@LABEL@25_11:	; switch_clause_bb28
	decw ax
.BB@LABEL@25_12:	; switch_clause_bb28
	subw ax, !LOWW(_g_timerSetting+0x00032)
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
	bz $.BB@LABEL@25_17
.BB@LABEL@25_13:	; if_then_bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 394
	set1 0xFFF06.2
.BB@LABEL@25_14:	; if_then_bb38
	inc !LOWW(_g_machine_flag@3+0x00003)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 445
	ret
.BB@LABEL@25_15:	; switch_clause_bb43
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 399
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick@1+0x0001C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@25_17
.BB@LABEL@25_16:	; if_then_bb50
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 400
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 401
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 402
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@25_14
.BB@LABEL@25_17:	; return
	;***      408 : 			break;
	;***      409 : 	}
	;***      410 : //	uint8_t _state = 0;
	;***      411 : //	const uint32_t _waterHamerTime = 1000;
	;***      412 : //	if(readHS() == 1){
	;***      413 : //		_state = 1;
	;***      414 : //		g_color = BLUE;
	;***      415 : //		handSensorLED(g_color);
	;***      416 : //		O_SPOUT_ALK_PIN = ON;
	;***      417 : //		delay_ms(10);
	;***      418 : //		O_PUMP_ALK_PIN = ON;
	;***      419 : //		delay_ms(g_timerSetting.t51 - g_timerSetting.t54);
	;***      420 : //		g_color = RED;
	;***      421 : //		handSensorLED(g_color);
	;***      422 : //		O_SPOUT_ACID_PIN = ON;
	;***      423 : //		delay_ms(10);
	;***      424 : //		O_PUMP_ACID_PIN = ON;
	;***      425 : //		delay_ms(g_timerSetting.t54);
	;***      426 : //		O_PUMP_ALK_PIN = OFF;
	;***      427 : //		delay_ms(_waterHamerTime);
	;***      428 : //		O_SPOUT_ALK_PIN = OFF;
	;***      429 : //		delay_ms(g_timerSetting.t52 - g_timerSetting.t54);
	;***      430 : //		g_color = WHITE;
	;***      431 : //		handSensorLED(g_color);
	;***      432 : //		O_SPOUT_WATER_PIN = ON;
	;***      433 : //		delay_ms(g_timerSetting.t54);
	;***      434 : //		O_PUMP_ACID_PIN = OFF;
	;***      435 : //		delay_ms(_waterHamerTime);
	;***      436 : //		O_SPOUT_ACID_PIN = OFF;
	;***      437 : //		delay_ms(g_timerSetting.t53 - g_timerSetting.t54);
	;***      438 : //		O_SPOUT_WATER_PIN = OFF;
	;***      439 : //	}
	;***      440 : //	while(readHS() == 1) R_WDT_Restart();
	;***      441 : //	if(_state == 1){
	;***      442 : //		g_color = BLACK;
	;***      443 : //		handSensorLED(g_color);
	;***      444 : //	}
	;***      445 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 445
	ret
_AcidWaterMode:
	.STACK _AcidWaterMode = 8
	;***      446 : void AcidWaterMode(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 446
	push hl
	;***      447 : 	uint8_t *flag = &g_machine_flag.acid;
	;***      448 : 	uint32_t *tick = &g_Tick.tickAcid;
	;***      449 : 	const uint32_t delayPump_ms = 50;
	;***      450 : 	switch (*flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 450
	mov a, !LOWW(_g_machine_flag@3+0x00001)
	cmp0 a
	bz $.BB@LABEL@26_5
.BB@LABEL@26_1:	; entry
	dec a
	bz $.BB@LABEL@26_9
.BB@LABEL@26_2:	; entry
	dec a
	bz $.BB@LABEL@26_11
.BB@LABEL@26_3:	; entry
	dec a
	.bz $!.BB@LABEL@26_17
.BB@LABEL@26_4:	; switch_clause_bb58
	;***      451 : 		case 0:
	;***      452 : 			*flag = readHS() == 1?1:0;
	;***      453 : 			*tick = g_systemTime;
	;***      454 : 			break;
	;***      455 : 		case 1:
	;***      456 : 			O_SPOUT_ACID_PIN = ON;
	;***      457 : 			g_color = RED;
	;***      458 : 			handSensorLED(g_color);
	;***      459 : 			if(ns_delay_ms(tick, delayPump_ms)){
	;***      460 : 				O_PUMP_ACID_PIN = ON;
	;***      461 : 				(*flag)++;
	;***      462 : 			}
	;***      463 : 			break;
	;***      464 : 		case 2:
	;***      465 : 			if(ns_delay_ms(tick, g_timerSetting.t56*1000)&(readHS() == 1)){
	;***      466 : 				O_PUMP_ACID_PIN = OFF;
	;***      467 : 				(*flag)++;
	;***      468 : 			}
	;***      469 : 			break;
	;***      470 : 		case 3:
	;***      471 : 			if(ns_delay_ms(tick, WATER_HAMER_TIME_MS)){
	;***      472 : 				O_SPOUT_ACID_PIN = OFF;
	;***      473 : 				g_color = BLACK;
	;***      474 : 				handSensorLED(g_color);
	;***      475 : 				(*flag)++;
	;***      476 : 			}
	;***      477 : 			break;
	;***      478 : 		default:
	;***      479 : 			*flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 479
	clrb !LOWW(_g_machine_flag@3+0x00001)
	br $.BB@LABEL@26_8
.BB@LABEL@26_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 452
	call !!_readHS
	dec a
	oneb a
	skz
.BB@LABEL@26_6:	; bb11
	clrb a
.BB@LABEL@26_7:	; bb12
	mov !LOWW(_g_machine_flag@3+0x00001), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 453
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00016), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00014), ax
.BB@LABEL@26_8:	; bb12
	br $.BB@LABEL@26_16
.BB@LABEL@26_9:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 456
	set1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 457
	oneb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 458
	oneb a
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 459
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@26_16
.BB@LABEL@26_10:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 460
	set1 0xFFF06.2
	br $.BB@LABEL@26_15
.BB@LABEL@26_11:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 465
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
	movw [sp+0x00], ax
	call !!_readHS
	dec a
	oneb a
	skz
.BB@LABEL@26_12:	; switch_clause_bb28
	clrb a
.BB@LABEL@26_13:	; switch_clause_bb28
	shrw ax, 8+0x00000
	movw bc, ax
	movw ax, [sp+0x00]
	and a, b
	xch a, x
	and a, c
	xch a, x
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@26_16
.BB@LABEL@26_14:	; if_then_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 466
	clr1 0xFFF06.2
.BB@LABEL@26_15:	; if_then_bb41
	inc !LOWW(_g_machine_flag@3+0x00001)
.BB@LABEL@26_16:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 482
	ret
.BB@LABEL@26_17:	; switch_clause_bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 471
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick@1+0x00014)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@26_16
.BB@LABEL@26_18:	; if_then_bb52
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 472
	clr1 0xFFF07.6
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 473
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 474
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@26_15
_nostop_AlkalineWaterMode:
	.STACK _nostop_AlkalineWaterMode = 8
	;***      480 : 			break;
	;***      481 : 	}
	;***      482 : }
	;***      483 : void nostop_AlkalineWaterMode(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 483
	push hl
	;***      484 : 	uint8_t *flag = &g_machine_flag.akaline;
	;***      485 : 	uint32_t *tick = &g_Tick.tickAlkaline;
	;***      486 : 	const uint32_t delayPump_ms = 50;
	;***      487 : 	switch (*flag) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 487
	mov a, !LOWW(_g_machine_flag@3)
	cmp0 a
	bz $.BB@LABEL@27_5
.BB@LABEL@27_1:	; entry
	dec a
	bz $.BB@LABEL@27_9
.BB@LABEL@27_2:	; entry
	dec a
	bz $.BB@LABEL@27_11
.BB@LABEL@27_3:	; entry
	dec a
	.bz $!.BB@LABEL@27_17
.BB@LABEL@27_4:	; switch_clause_bb58
	;***      488 : 		case 0:
	;***      489 : 			*flag = readHS() == 1?1:0;
	;***      490 : 			*tick = g_systemTime;
	;***      491 : 			break;
	;***      492 : 		case 1:
	;***      493 : 			O_SPOUT_ALK_PIN = ON;
	;***      494 : 			g_color = BLUE;
	;***      495 : 			handSensorLED(g_color);
	;***      496 : 			if(ns_delay_ms(tick, delayPump_ms)){
	;***      497 : 				O_PUMP_ALK_PIN = ON;
	;***      498 : 				(*flag)++;
	;***      499 : 			}
	;***      500 : 			break;
	;***      501 : 		case 2:
	;***      502 : 			if(ns_delay_ms(tick, g_timerSetting.t56*1000)&(readHS() == 1)){
	;***      503 : 				O_PUMP_ALK_PIN = OFF;
	;***      504 : 				(*flag)++;
	;***      505 : 			}
	;***      506 : 			break;
	;***      507 : 		case 3:
	;***      508 : 			if(ns_delay_ms(tick, WATER_HAMER_TIME_MS)){
	;***      509 : 				O_SPOUT_ALK_PIN = OFF;
	;***      510 : 				g_color = BLACK;
	;***      511 : 				handSensorLED(g_color);
	;***      512 : 				(*flag)++;
	;***      513 : 			}
	;***      514 : 			break;
	;***      515 : 		default:
	;***      516 : 			*flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 516
	clrb !LOWW(_g_machine_flag@3)
	br $.BB@LABEL@27_8
.BB@LABEL@27_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 489
	call !!_readHS
	dec a
	oneb a
	skz
.BB@LABEL@27_6:	; bb11
	clrb a
.BB@LABEL@27_7:	; bb12
	mov !LOWW(_g_machine_flag@3), a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 490
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x00012), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x00010), ax
.BB@LABEL@27_8:	; bb12
	br $.BB@LABEL@27_16
.BB@LABEL@27_9:	; switch_clause_bb17
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 493
	set1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 494
	mov !LOWW(_g_color), #0x03
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 495
	mov a, #0x03
	call $!_handSensorLED
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 496
	clrw ax
	movw de, ax
	movw bc, #0x0032
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_16
.BB@LABEL@27_10:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 497
	set1 0xFFF06.1
	br $.BB@LABEL@27_15
.BB@LABEL@27_11:	; switch_clause_bb28
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 502
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
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	movw [sp+0x00], ax
	call !!_readHS
	dec a
	oneb a
	skz
.BB@LABEL@27_12:	; switch_clause_bb28
	clrb a
.BB@LABEL@27_13:	; switch_clause_bb28
	shrw ax, 8+0x00000
	movw bc, ax
	movw ax, [sp+0x00]
	and a, b
	xch a, x
	and a, c
	xch a, x
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_16
.BB@LABEL@27_14:	; if_then_bb41
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 503
	clr1 0xFFF06.1
.BB@LABEL@27_15:	; if_then_bb41
	inc !LOWW(_g_machine_flag@3)
.BB@LABEL@27_16:	; return
	pop hl
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 519
	ret
.BB@LABEL@27_17:	; switch_clause_bb46
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 508
	clrw ax
	movw de, ax
	movw bc, #0x03E8
	movw ax, #LOWW(_g_Tick@1+0x00010)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@27_16
.BB@LABEL@27_18:	; if_then_bb52
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 509
	clr1 0xFFF07.7
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 510
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 511
	clrb a
	call $!_handSensorLED
	br $.BB@LABEL@27_15
_nostop_CallanCleaningMode:
	.STACK _nostop_CallanCleaningMode = 6
	;***      517 : 			break;
	;***      518 : 	}
	;***      519 : }
	;***      520 : void nostop_CallanCleaningMode(void){
	;***      521 : 	if((g_TickKeeper.SV1_OFF_minutes >= g_timerSetting.t61) &
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 521
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
	;***      522 : 			(g_TickKeeper.SV2_OFF_minutes >= g_timerSetting.t61)){
	;***      523 : 		g_callan_clear_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 523
	oneb !LOWW(_g_callan_clear_flag@4)
	;***      524 : 		g_Tick.tickCustom[6] = g_Tick.tickCustom[7] = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 524
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw !LOWW(_g_Tick@1+0x0003E), ax
	movw !LOWW(_g_Tick@1+0x0003A), ax
	movw ax, !LOWW(_g_systemTime)
	movw !LOWW(_g_Tick@1+0x0003C), ax
	movw !LOWW(_g_Tick@1+0x00038), ax
	;***      525 : 		O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 525
	set1 0xFFF05.5
.BB@LABEL@28_7:	; if_break_bb
	;***      526 : 	}
	;***      527 : 	if(g_callan_clear_flag){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 527
	cmp0 !LOWW(_g_callan_clear_flag@4)
	bz $.BB@LABEL@28_14
.BB@LABEL@28_8:	; if_then_bb18
	;***      528 : 		if(ns_delay_ms(&g_Tick.tickCustom[6], 500)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 528
	clrw ax
	movw de, ax
	movw bc, #0x01F4
	movw ax, #LOWW(_g_Tick@1+0x00038)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@28_12
.BB@LABEL@28_9:	; if_then_bb23
	;***      529 : 			g_color = g_color == WHITE ? BLACK:WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 529
	cmp !LOWW(_g_color), #0x02
	clrb a
	skz
.BB@LABEL@28_10:	; bb28
	mov a, #0x02
.BB@LABEL@28_11:	; bb29
	mov !LOWW(_g_color), a
	;***      530 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 530
	call $!_handSensorLED
.BB@LABEL@28_12:	; if_break_bb34
	;***      531 : 		}
	;***      532 : 		if(ns_delay_ms(&g_Tick.tickCustom[7], g_timerSetting.t62*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 532
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
	movw ax, #LOWW(_g_Tick@1+0x0003C)
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@28_14
.BB@LABEL@28_13:	; if_then_bb41
	;***      533 : 			g_callan_clear_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 533
	clrb !LOWW(_g_callan_clear_flag@4)
	;***      534 : 			O_SPOUT_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 534
	clr1 0xFFF05.5
	;***      535 : 			g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 535
	clrb !LOWW(_g_color)
	;***      536 : 			handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 536
	clrb a
	br $!_handSensorLED
.BB@LABEL@28_14:	; return
	;***      537 : 		}
	;***      538 : 	}
	;***      539 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 539
	ret
_main_20211111:
	.STACK _main_20211111 = 4
	;***      540 : // Newest
	;***      541 : void main_20211111(void){
	;***      542 : 	InitialOperationModeStart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 542
	call $!_InitialOperationModeStart
	;***      543 : 	WaterSupplyOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 543
	call $!_WaterSupplyOperation
	;***      544 : 	ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 544
	br $!_ElectrolyticOperation
_main_20211111_while:
	.STACK _main_20211111_while = 4
	;***      545 : 
	;***      546 : //	Test section
	;***      547 : //	electrolyticOperationON();
	;***      548 : //	delay_ms(500);
	;***      549 : //	Voltage1Check();
	;***      550 : //	Voltage2Check();
	;***      551 : //	Voltage3Check();
	;***      552 : //	LowVoltageCheck();
	;***      553 : //	if(OverCurrentCheck() == 0) electrolyticOperationOFF();
	;***      554 : }
	;***      555 : void main_20211111_while(void){
	;***      556 : 	ElectrolyzeWaterGeneration();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 556
	call $!_ElectrolyzeWaterGeneration
	;***      557 : 	WaterWashingMode();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 557
	br $!_WaterWashingMode
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      558 : 
	;***      559 : }
	;***      560 : 
	;***      561 : /**
	;***      562 :  * 30/11/2021: Checked by An, missing Neutralization timer ON
	;***      563 :  */
	;***      564 : void electrolyticOperationON(void){
	;***      565 : 	//Electrolytic operation ON
	;***      566 : 	O_SUPPLY_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 566
	set1 0xFFF01.7
	;***      567 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 567
	set1 0xFFF0E.2
	;***      568 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 568
	set1 0xFFF06.0
	;***      569 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 569
	oneb !LOWW(_g_electrolytic_flag)
	;***      570 : 	g_neutralization_time = g_neutralization_time == 0 ? g_systemTime:g_neutralization_time;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 570
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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 572
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      571 : 	//TODO: Add Neutralization timer ON
	;***      572 : }
	;***      573 : /**
	;***      574 :  * 30/11/2021: Checked by An, missing Neutralization timer OFF
	;***      575 :  */
	;***      576 : void electrolyticOperationOFF(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 576
	clrw ax
	;***      577 : 	//TODO: Add Neutralization timer OFF
	;***      578 : 	g_neutralization_time = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 578
	movw !LOWW(_g_neutralization_time+0x00002), ax
	movw !LOWW(_g_neutralization_time), ax
	;***      579 : 	//Electrolytic operation OFF
	;***      580 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 580
	clr1 0xFFF0E.2
	;***      581 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 581
	clr1 0xFFF06.0
	;***      582 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 582
	mov a, #0x05
	call !!_delay
	;***      583 : 	O_SUPPLY_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 583
	clr1 0xFFF01.7
	;***      584 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 584
	clrb !LOWW(_g_electrolytic_flag)
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***      585 : 
	;***      586 : }
	;***      587 : /**
	;***      588 :  *
	;***      589 :  * @param s: Period time take measurement in mills second
	;***      590 :  * @return L/minutes
	;***      591 :  */
	;***      592 : float measureFlowSensor(uint32_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 592
	push bc
	push ax
	subw sp, #0x0A
	;***      593 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 593
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
	;***      594 : 	float flow_pluse = 0.0;
	;***      595 : 	uint8_t flow_pulse_state = 1;
	;***      596 : 	while(!ns_delay_ms(&stamp_flow_sensor, s)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 596
	movw ax, sp
	addw ax, #0x0006
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@33_7
.BB@LABEL@33_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      597 : 		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 597
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@33_6
.BB@LABEL@33_3:	; if_then_bb
	;***      598 : 			if(I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 598
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@33_5
.BB@LABEL@33_4:	; if_then_bb21
	movw ax, #0x3F80
	;***      599 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 599
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
	;***      600 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 600
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@33_6:	; if_break_bb27
	;***      601 : 		}
	;***      602 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 602
	call !!_R_WDT_Restart
	br $.BB@LABEL@33_1
.BB@LABEL@33_7:	; bb39
	movw ax, #0x3F33
	;***      603 : 	}
	;***      604 : 	float flow_value = (flow_pluse*0.7*60)/s; // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 604
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
	;***      605 : 	return flow_value;
	;***      606 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 606
	addw sp, #0x12
	ret
	;***      607 : 
	.SECTION .bss,BSS
	.ALIGN 2
_g_Tick@1:
	.DS (64)
	.ALIGN 2
_g_TickKeeper@2:
	.DS (16)
_g_machine_flag@3:
	.DS (4)
_g_callan_clear_flag@4:
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
