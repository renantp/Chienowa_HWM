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
#@  compiled at Tue Dec 07 09:51:49 2021

	.EXTERN _g_control_buffer
	.EXTERN _g_systemTime
	.EXTERN _g_uart2_send
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
	.PUBLIC _main_20211111
	.PUBLIC _main_20211111_while
	.PUBLIC _electrolyticOperationON
	.PUBLIC _electrolyticOperationOFF
	.PUBLIC _measureFlowSensor
	.EXTERN _ns_delay_ms

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
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 73
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 10
	;***       74 : }
	;***       75 : #ifdef RENAN_CODE
	;***       76 : void renanCode(void){
	;***       77 : 	//Power On Mode
	;***       78 : 	O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       79 : 	O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       80 : 	do{
	;***       81 : 		O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN;	// Turn on SV5 if ACID tank empty
	;***       82 : 		O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN;	// Turn on SV6 if ALK tank empty
	;***       83 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***       84 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***       85 : 		R_WDT_Restart();
	;***       86 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***       87 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***       88 : 	O_DRAIN_ACID_PIN = O_DRAIN_ALK_PIN = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***       89 : 
	;***       90 : 	// Drainage operation
	;***       91 : 	O_SPOUT_WATER_PIN = ON;	// SV2 On
	;***       92 : 	delay(st[1]);			// Default 30 seconds
	;***       93 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	;***       94 : 	delay_ms(500);
	;***       95 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	;***       96 : }
	;***       97 : 
	;***       98 : 
	;***       99 : void code_20211029(void){
	;***      100 : 	//---------------Electrolytic operation-----------------------------
	;***      101 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	;***      102 : 	O_CVCC_ON_PIN = ON;
	;***      103 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***      104 : 	delay(10);
	;***      105 : 	//TODO: Neutralization timer On
	;***      106 : 
	;***      107 : 	overVoltage1Error();
	;***      108 : }
	;***      109 : #endif
	;***      110 : 
	;***      111 : //----------------------Begin code 11112021--------------------------------------
	;***      112 : void sendToRasPi(enum UART_header_e head, enum Control_status type, float value){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 112
	push hl
	push ax
	movw ax, bc
	push de
	pop bc
	;***      113 : 	uint8_t state = g_uart2_send;
	;***      114 : 	g_control_buffer.head = head;
	;***      115 : 	g_control_buffer.set_number = type;
	;***      116 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 116
	call !!__COM_ftoul
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 113
	mov a, !LOWW(_g_uart2_send)
	mov [sp+0x02], a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 114
	mov !LOWW(_g_control_buffer), a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 115
	mov !LOWW(_g_control_buffer+0x00001), a
	;***      117 : 	R_UART2_Send((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 117
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@3_1:	; bb10
	mov a, [sp+0x02]
	;***      118 : 	while(state == g_uart2_send);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 118
	cmp a, !LOWW(_g_uart2_send)
	bz $.BB@LABEL@3_1
.BB@LABEL@3_2:	; return
	;***      119 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 119
	addw sp, #0x04
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 4
	;***      120 : /**
	;***      121 :  * InitialOperationModeStart
	;***      122 :  * 30/11/2021: Checked!
	;***      123 :  */
	;***      124 : void InitialOperationModeStart(void){
	;***      125 : 	OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 125
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
	;***      126 : 	OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 126
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
	;***      127 : 	do{
	;***      128 : 		OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OPTION_1_PIN;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
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
	;***      129 : 		OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OPTION_2_PIN;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
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
	;***      130 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 127
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
	;***      131 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      132 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 132
	ret
_FlowSensorCheck:
	.STACK _FlowSensorCheck = 18
	;***      133 : /**
	;***      134 :  * FlowSensorCheck
	;***      135 :  * 30/11/2021: Checked!
	;***      136 :  * @return 0 is Error, 1 is OK
	;***      137 :  */
	;***      138 : uint8_t FlowSensorCheck(uint32_t *_time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	subw sp, #0x08
	push ax
	;***      139 : 	delay(15);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 139
	mov a, #0x0F
	call !!_delay
	pop de
	push de
	;***      140 : 	g_flow_value = measureFlowSensor(*_time);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 140
	movw ax, [de+0x02]
	movw bc, ax
	movw ax, [de]
	call $!_measureFlowSensor
	movw [sp+0x02], ax
	movw !LOWW(_g_flow_value), ax
	movw ax, bc
	movw [sp+0x00], ax
	movw !LOWW(_g_flow_value+0x00002), ax
	;***      141 : 	if((g_flow_value < g_numberSetting.upperFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
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
	;***      142 : 			&(g_flow_value > g_numberSetting.lowerFlow)){
	;***      143 : 		return 1;
	;***      144 : 	}else{
	;***      145 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      146 : 		return 0;
	;***      147 : 	}
	;***      148 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	oneb a
.BB@LABEL@5_11:	; bb17
	addw sp, #0x0A
	ret
.BB@LABEL@5_12:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 145
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 146
	clrb a
	br $.BB@LABEL@5_11
_WaterSupplyOperation:
	.STACK _WaterSupplyOperation = 8
	;***      149 : /**
	;***      150 :  * WaterSupplyOperation
	;***      151 :  * 30/11/2021: Checked by An, need to test with Raspberry Pi Adjust alarm
	;***      152 :  */
	;***      153 : void WaterSupplyOperation(void){
	;***      154 : 	O_SPOUT_WATER_PIN = ON;		// SV2 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 154
	set1 0xFFF05.5
	;***      155 : 	delay(30);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 155
	mov a, #0x1E
	call !!_delay
	;***      156 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 156
	set1 0xFFF01.7
	;***      157 : 	delay_ms(500);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	clrw bc
	movw ax, #0x01F4
	call !!_delay_ms
	;***      158 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	clr1 0xFFF05.5
.BB@LABEL@6_1:	; bb6
	;***      159 : 	while(FlowSensorCheck(&g_timerSetting.t3_flowSensorMonitorTime) != 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 159
	movw ax, #LOWW(_g_timerSetting+0x00004)
	call $!_FlowSensorCheck
	dec a
	bz $.BB@LABEL@6_3
.BB@LABEL@6_2:	; bb
	movw ax, #0x447A
	;***      160 : 		//TODO: RasPi - Adjust
	;***      161 : 		uint32_t _flow = g_flow_value*1000; // mL/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 161
	push ax
	clrw ax
	push ax
	movw bc, !LOWW(_g_flow_value+0x00002)
	movw ax, !LOWW(_g_flow_value)
	call !!__COM_fmul
	addw sp, #0x04
	call !!__COM_ftoul
	;***      162 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, _flow);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	call !!__COM_ultof
	push bc
	pop de
	movw bc, ax
	movw ax, #0x4104
	call $!_sendToRasPi
	br $.BB@LABEL@6_1
.BB@LABEL@6_3:	; bb11
	;***      163 : 	}
	;***      164 : 	delay(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 164
	mov a, #0x0A
	br !!_delay
_Voltage1Check:
	.STACK _Voltage1Check = 12
	;***      165 : }
	;***      166 : /**
	;***      167 :  * Alarm once when voltage fail. Stop until voltage valid.
	;***      168 :  * 30/11/2021: Checked by An
	;***      169 :  * @return 0 - OK; 1 - Error
	;***      170 :  */
	;***      171 : uint8_t Voltage1Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	subw sp, #0x04
	;***      172 : 	if(g_cvcc_voltge>=g_numberSetting.upperVoltage1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
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
	;***      173 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 173
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
	;***      174 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	call $!_electrolyticOperationOFF
.BB@LABEL@7_2:	; bb9
	;***      175 : 		//TODO: Wait to reset
	;***      176 : 		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_VOLTAGE_1)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
	cmp !LOWW(_g_rx_data+0x00001), #0x05
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@7_5
.BB@LABEL@7_3:	; bb9
	cmp a, #0x43
	bz $.BB@LABEL@7_5
.BB@LABEL@7_4:	; bb
	;***      177 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
	call !!_R_WDT_Restart
	br $.BB@LABEL@7_2
.BB@LABEL@7_5:	; bb9.bb25_crit_edge
	oneb a
.BB@LABEL@7_6:	; bb25
	;***      178 : 		}
	;***      179 : 		return 1;
	;***      180 : 	}
	;***      181 : 	return 0;
	;***      182 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 182
	addw sp, #0x04
	ret
_Voltage2Check:
	.STACK _Voltage2Check = 24
	;***      183 : /**
	;***      184 :  * Alarm every g_timerSetting.t12_overVoltage2Time second until voltage valid.
	;***      185 :  * 30/11/2021: Checked by An
	;***      186 :  * @return 0 - OK
	;***      187 :  */
	;***      188 : void Voltage2Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	subw sp, #0x10
	br $!.BB@LABEL@8_18
.BB@LABEL@8_1:	; bb13
	;***      189 : 	uint16_t _time_count = 0;
	;***      190 : 	do{
	;***      191 : 		_time_count = 0;
	;***      192 : 		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 192
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
	;***      193 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 193
	clrw bc
	onew ax
	call !!_delay_ms
	clrw ax
	;***      194 : 			_time_count++;
	;***      195 : 			if(_time_count == g_timerSetting.t12_overVoltage2Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	cmpw ax, !LOWW(_g_timerSetting+0x00012)
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	incw ax
	movw [sp+0x00], ax
	sknz
.BB@LABEL@8_10:	; bb2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	cmpw ax, !LOWW(_g_timerSetting+0x00010)
.BB@LABEL@8_11:	; bb2
	bnz $.BB@LABEL@8_13
.BB@LABEL@8_12:	; if_then_bb
	movw ax, #0x447A
	;***      196 : 				sendToRasPi(H_ALARM, OVER_VOLTAGE_2, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
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
	;***      197 : 			}
	;***      198 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	call !!_R_WDT_Restart
.BB@LABEL@8_14:	; if_break_bb
	br $!.BB@LABEL@8_1
.BB@LABEL@8_15:	; bb27
	movw ax, [sp+0x0E]
	movw bc, ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 190
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
	;***      199 : 		}
	;***      200 : 	}while(_time_count == g_timerSetting.t12_overVoltage2Time);
	;***      201 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 201
	addw sp, #0x10
	ret
_Voltage3Check:
	.STACK _Voltage3Check = 24
	;***      202 : /**
	;***      203 :  * Alarm after g_timerSetting.t13_overVoltage3Time second. Turn OFF electrolytic and stop until valid.
	;***      204 :  * 30/11/2021: Checked by An
	;***      205 :  * @return 0 - OK; 1 - Error
	;***      206 :  */
	;***      207 : uint8_t Voltage3Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 207
	subw sp, #0x10
	clrw ax
.BB@LABEL@9_1:	; entry
	movw [sp+0x00], ax
	;***      208 : 	uint16_t _time_count = 0;
	;***      209 : 	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 209
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
	;***      210 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	clrw bc
	onew ax
	call !!_delay_ms
	;***      211 : 		_time_count++;
	;***      212 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	call !!_R_WDT_Restart
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@9_1
.BB@LABEL@9_10:	; bb17
	movw ax, [sp+0x0C]
	movw bc, ax
	clrw ax
	;***      213 : 	}
	;***      214 : 	if(_time_count == g_timerSetting.t13_overVoltage3Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
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
	;***      215 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_3, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
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
	;***      216 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	call $!_electrolyticOperationOFF
.BB@LABEL@9_14:	; bb29
	;***      217 : 		//TODO: Wait to reset
	;***      218 : 		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_VOLTAGE_3)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	cmp !LOWW(_g_rx_data+0x00001), #0x07
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@9_17
.BB@LABEL@9_15:	; bb29
	cmp a, #0x43
	bz $.BB@LABEL@9_17
.BB@LABEL@9_16:	; bb28
	;***      219 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	call !!_R_WDT_Restart
	br $.BB@LABEL@9_14
.BB@LABEL@9_17:	; bb29.bb45_crit_edge
	oneb a
.BB@LABEL@9_18:	; bb45
	;***      220 : 		}
	;***      221 : 		return 1;
	;***      222 : 	}
	;***      223 : 	return 0;
	;***      224 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 224
	addw sp, #0x10
	ret
_LowVoltageCheck:
	.STACK _LowVoltageCheck = 24
	;***      225 : uint8_t LowVoltageCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	subw sp, #0x10
	;***      226 : 	uint16_t _time_count = 0;
	;***      227 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	call $!_electrolyticOperationON
.BB@LABEL@10_1:	; bb2
	;***      228 : 	while((g_systemTime - g_neutralization_time < g_timerSetting.t14_lowVoltageStartTime)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
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
	;***      229 : 		R_WDT_Restart();
	;***      230 : 	}
	;***      231 : 	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < g_timerSetting.t15_lowVoltageDelayTime)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
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
	;***      232 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 232
	clrw bc
	onew ax
	call !!_delay_ms
	;***      233 : 		_time_count++;
	;***      234 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 234
	call !!_R_WDT_Restart
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@10_7
.BB@LABEL@10_16:	; bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	call !!_R_WDT_Restart
	br $!.BB@LABEL@10_1
.BB@LABEL@10_17:	; bb27
	movw ax, [sp+0x0C]
	movw bc, ax
	clrw ax
	;***      235 : 	}
	;***      236 : 	if(_time_count == g_timerSetting.t15_lowVoltageDelayTime){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
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
	;***      237 : 		sendToRasPi(H_ALARM, UNDER_VOLTAGE, (uint32_t)(g_cvcc_voltge*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
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
	;***      238 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 238
	call $!_electrolyticOperationOFF
.BB@LABEL@10_21:	; bb39
	;***      239 : 		//TODO: Wait to reset
	;***      240 : 		while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != UNDER_VOLTAGE)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	cmp !LOWW(_g_rx_data+0x00001), #0x08
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@10_24
.BB@LABEL@10_22:	; bb39
	cmp a, #0x43
	bz $.BB@LABEL@10_24
.BB@LABEL@10_23:	; bb38
	;***      241 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	call !!_R_WDT_Restart
	br $.BB@LABEL@10_21
.BB@LABEL@10_24:	; bb39.bb55_crit_edge
	oneb a
.BB@LABEL@10_25:	; bb55
	;***      242 : 		}
	;***      243 : 		return 1;
	;***      244 : 	}
	;***      245 : 	return 0;
	;***      246 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	addw sp, #0x10
	ret
_OverCurrentCheck:
	.STACK _OverCurrentCheck = 20
	;***      247 : uint8_t OverCurrentCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	subw sp, #0x0C
	;***      248 : 	uint16_t _time_count = 0;
	;***      249 : 	const uint16_t _max_time = 5000;
	;***      250 : 	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
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
	;***      251 : 		sendToRasPi(H_ALARM, CURRENT_ABNORMAL, (uint32_t)(g_cvcc_current*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
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
	;***      252 : 		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < _max_time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 252
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
	;***      253 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	clrw bc
	onew ax
	call !!_delay_ms
	;***      254 : 			_time_count++;
	;***      255 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	call !!_R_WDT_Restart
	movw ax, [sp+0x00]
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@11_4
.BB@LABEL@11_11:	; bb33
	movw ax, [sp+0x00]
	;***      256 : //			electrolyticOperationOFF();
	;***      257 : 		}
	;***      258 : 		if(_time_count >= _max_time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	cmpw ax, #0x1388
	.bc $!.BB@LABEL@11_2
.BB@LABEL@11_12:	; if_then_bb39
	movw ax, #0x447A
	;***      259 : 			sendToRasPi(H_ALARM, OVER_CURRENT, (uint32_t)(g_cvcc_current*1000));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
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
	;***      260 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 260
	call $!_electrolyticOperationOFF
.BB@LABEL@11_13:	; bb45
	;***      261 : 			//TODO: Wait to reset
	;***      262 : 			while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != OVER_CURRENT)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	cmp !LOWW(_g_rx_data+0x00001), #0x0A
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@11_16
.BB@LABEL@11_14:	; bb45
	cmp a, #0x43
	bz $.BB@LABEL@11_16
.BB@LABEL@11_15:	; bb44
	;***      263 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
	call !!_R_WDT_Restart
	br $.BB@LABEL@11_13
.BB@LABEL@11_16:	; bb45.bb62_crit_edge
	oneb a
.BB@LABEL@11_17:	; bb62
	;***      264 : 			}
	;***      265 : 			return 1;
	;***      266 : 		}
	;***      267 : 	}
	;***      268 : 	return 0;
	;***      269 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 269
	addw sp, #0x0C
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@12_1:	; WAIT_RESET
	;***      270 : void ElectrolyticOperation(void){
	;***      271 : 	WAIT_RESET:
	;***      272 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 272
	call $!_electrolyticOperationON
.BB@LABEL@12_2:	; bb
	;***      273 : 	do{
	;***      274 : 		if(Voltage1Check()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 274
	call $!_Voltage1Check
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_3:	; if_break_bb
	;***      275 : 		Voltage2Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	call $!_Voltage2Check
	;***      276 : 		if(Voltage3Check()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	call $!_Voltage3Check
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_4:	; if_break_bb12
	;***      277 : 		if(LowVoltageCheck()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	call $!_LowVoltageCheck
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_5:	; if_break_bb20
	;***      278 : 		if(OverCurrentCheck()) goto WAIT_RESET;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 278
	call $!_OverCurrentCheck
	cmp0 a
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_6:	; if_break_bb28
	;***      279 : 		//----------CVCC Alarm Input-----------------
	;***      280 : 		if(I_CVCC_ALARM_IN == I_ON){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 280
	mov a, 0xFFF00
	bf a.4, $.BB@LABEL@12_9
.BB@LABEL@12_7:	; if_break_bb53
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
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
	;***      281 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	;***      282 : 			electrolyticOperationOFF();
	;***      283 : 			//TODO: Wait Reset
	;***      284 : 			while((g_rx_data[0] != H_CLEAR)&(g_rx_data[1] != CVCC_ALARM)){
	;***      285 : 				R_WDT_Restart();
	;***      286 : 			}
	;***      287 : 			goto WAIT_RESET;
	;***      288 : 		}
	;***      289 : 	}while((I_ACID_H_PIN == 0)|(I_ALKALI_H_PIN == 0));
	;***      290 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	br $!_electrolyticOperationOFF
.BB@LABEL@12_9:	; if_then_bb36
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 281
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4112
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	call $!_electrolyticOperationOFF
.BB@LABEL@12_10:	; bb38
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	cmp !LOWW(_g_rx_data+0x00001), #0x12
	mov a, !LOWW(_g_rx_data)
	bz $.BB@LABEL@12_1
.BB@LABEL@12_11:	; bb38
	cmp a, #0x43
	bz $.BB@LABEL@12_1
.BB@LABEL@12_12:	; bb37
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	call !!_R_WDT_Restart
	br $.BB@LABEL@12_10
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      291 : }
	;***      292 : void solenoidCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
	subw sp, #0x04
	;***      293 : 	uint32_t _time_count = 0;
	;***      294 : 	if((g_flow_value <= 0.1f)&(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
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
	;***      295 : 		_time_count++;
	;***      296 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@13_5:	; if_break_bb
	;***      297 : 	}
	;***      298 : 	if(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000){
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
	;***      299 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410B
	br $!_sendToRasPi
.BB@LABEL@13_9:	; return
	;***      300 : 	}
	;***      301 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      302 : void saltWaterTankFullCheck(void){
	;***      303 : 	if(I_SALT_H_PIN == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@14_2
.BB@LABEL@14_1:	; return
	;***      304 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      305 : 		electrolyticOperationOFF();
	;***      306 : 		//TODO: Fault in the flowchart
	;***      307 : 	}
	;***      308 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 308
	ret
.BB@LABEL@14_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410C
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	br $!_electrolyticOperationOFF
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      309 : void saltWaterTankEmptyCheck(void){
	;***      310 : 	if(I_SALT_L_PIN == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 310
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@15_2
.BB@LABEL@15_1:	; if_then_bb
	;***      311 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410D
	br $!_sendToRasPi
.BB@LABEL@15_2:	; return
	;***      312 : 		//TODO: Control OFF
	;***      313 : 	}
	;***      314 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 314
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      315 : void acidWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	movw de, #0xFF07
	;***      316 : 	if(((I_ACID_L_PIN == 0)&((I_ACID_M_PIN == 1)|(I_ACID_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 316
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
	;***      317 : 			((I_ACID_M_PIN == 0)&(I_ACID_H_PIN == 1))){
	;***      318 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      319 : 		//TODO: Control OFF
	;***      320 : 	}
	;***      321 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 321
	ret
.BB@LABEL@16_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 318
	movw de, #0x3F80
	movw ax, #0x410E
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      322 : void alkalineWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 322
	push hl
	;***      323 : 	if(((I_ALKALI_L_PIN == 0)&((I_ALKALI_M_PIN == 1)|(I_ALKALI_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 323
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
	;***      324 : 			((I_ALKALI_M_PIN == 0)&(I_ALKALI_H_PIN == 1))){
	;***      325 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      326 : 		//TODO: Control OFF
	;***      327 : 	}
	;***      328 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 328
	ret
.BB@LABEL@17_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	movw de, #0x3F80
	movw ax, #0x410F
	br $!_sendToRasPi
_OpenSV1:
	.STACK _OpenSV1 = 4
	;***      329 : 
	;***      330 : void OpenSV1(void){
	;***      331 : 	O_SUPPLY_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 331
	set1 0xFFF01.7
	ret
_CloseSV1:
	.STACK _CloseSV1 = 4
	;***      332 : }
	;***      333 : void CloseSV1(void){
	;***      334 : 	O_SUPPLY_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 334
	clr1 0xFFF01.7
	ret
_OpenSV2:
	.STACK _OpenSV2 = 4
	;***      335 : }
	;***      336 : void OpenSV2(void){
	;***      337 : 	O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 337
	set1 0xFFF05.5
	ret
_CloseSV2:
	.STACK _CloseSV2 = 4
	;***      338 : }
	;***      339 : void CloseSV2(void){
	;***      340 : 	O_SPOUT_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 340
	clr1 0xFFF05.5
	ret
_FilterReplacementCheck:
	.STACK _FilterReplacementCheck = 4
	;***      341 : }
	;***      342 : uint8_t FilterReplacementCheck(void){
	;***      343 : 
	;***      344 : 	return 0;
	;***      345 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 345
	clrb a
	ret
_ElectrolyzeWaterGeneration:
	.STACK _ElectrolyzeWaterGeneration = 4
	;***      346 : void ElectrolyzeWaterGeneration(void){
	;***      347 : 	if((I_ACID_L_PIN == I_OFF)|(I_ALKALI_L_PIN = I_OFF)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 347
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
	;***      348 : 		electrolyticOperationON();
	;***      349 : 	}else if((I_ACID_H_PIN = I_ON)&(I_ALKALI_H_PIN = I_ON)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 349
	clr1 [hl].3
	mov a, [hl]
	clr1 [hl].0
	shr a, 0x03
	and a, [hl]
	bt a.0, $.BB@LABEL@23_3
.BB@LABEL@23_2:	; return
	;***      350 : 		electrolyticOperationOFF();
	;***      351 : 	}
	;***      352 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 352
	ret
.BB@LABEL@23_3:	; if_then_bb26
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 350
	br $!_electrolyticOperationOFF
.BB@LABEL@23_4:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 348
	br $!_electrolyticOperationON
_WaterWashingMode:
	.STACK _WaterWashingMode = 6
	;***      353 : void WaterWashingMode(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 353
	push hl
	;***      354 : 	uint8_t _state = 0;
	;***      355 : 	if(readHS() == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 355
	call !!_readHS
	dec a
	clrb a
	bnz $.BB@LABEL@24_2
.BB@LABEL@24_1:	; if_then_bb
	;***      356 : 		O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 356
	set1 0xFFF05.5
	;***      357 : 		g_color = WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 357
	mov !LOWW(_g_color), #0x02
	;***      358 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 358
	mov a, #0x02
	call $!_handSensorLED
	oneb a
.BB@LABEL@24_2:	; if_then_bb
	mov [sp+0x00], a
.BB@LABEL@24_3:	; bb6
	;***      359 : 		_state = 1;
	;***      360 : 	}
	;***      361 : 	while(readHS() == 1) R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 361
	call !!_readHS
	dec a
	bnz $.BB@LABEL@24_5
.BB@LABEL@24_4:	; bb
	call !!_R_WDT_Restart
	br $.BB@LABEL@24_3
.BB@LABEL@24_5:	; bb12
	mov a, [sp+0x00]
	;***      362 : 	if(_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 362
	cmp0 a
	bnz $.BB@LABEL@24_7
.BB@LABEL@24_6:	; return
	;***      363 : 		delay(2);
	;***      364 : 		O_SPOUT_WATER_PIN = OFF;
	;***      365 : 		g_color = BLACK;
	;***      366 : 		handSensorLED(g_color);
	;***      367 : 	}
	;***      368 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 368
	pop hl
	ret
.BB@LABEL@24_7:	; if_then_bb18
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 363
	mov a, #0x02
	call !!_delay
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 364
	clr1 0xFFF05.5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 365
	clrb !LOWW(_g_color)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 366
	clrb a
	pop hl
	br $!_handSensorLED
_HandWashingMode:
	.STACK _HandWashingMode = 6
	;***      369 : void HandWashingMode(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 369
	push hl
	;***      370 : 	uint8_t _state = 0;
	;***      371 : 	const uint32_t _waterHamerTime = 1000;
	;***      372 : 	if(readHS() == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 372
	call !!_readHS
	dec a
	bz $.BB@LABEL@25_2
.BB@LABEL@25_1:	; entry.bb22.preheader_crit_edge
	clrb a
	mov [sp+0x00], a
	br $!.BB@LABEL@25_9
.BB@LABEL@25_2:	; if_then_bb
	;***      373 : 		_state = 1;
	;***      374 : 		g_color = BLUE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 374
	mov !LOWW(_g_color), #0x03
	;***      375 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 375
	mov a, #0x03
	call $!_handSensorLED
	;***      376 : 		O_SPOUT_ALK_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 376
	set1 0xFFF07.7
	;***      377 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 377
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      378 : 		O_PUMP_ALK_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 378
	set1 0xFFF06.1
	;***      379 : 		delay_ms(g_timerSetting.t51 - g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 379
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
	;***      380 : 		g_color = RED;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 380
	oneb !LOWW(_g_color)
	oneb a
	mov [sp+0x00], a
	;***      381 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 381
	oneb a
	call $!_handSensorLED
	;***      382 : 		O_SPOUT_ACID_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 382
	set1 0xFFF07.6
	;***      383 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 383
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      384 : 		O_PUMP_ACID_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 384
	set1 0xFFF06.2
	;***      385 : 		delay_ms(g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 385
	movw bc, !LOWW(_g_timerSetting+0x00032)
	movw ax, !LOWW(_g_timerSetting+0x00030)
	call !!_delay_ms
	;***      386 : 		O_PUMP_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 386
	clr1 0xFFF06.1
	;***      387 : 		delay_ms(_waterHamerTime);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 387
	clrw bc
	movw ax, #0x03E8
	call !!_delay_ms
	;***      388 : 		O_SPOUT_ALK_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 388
	clr1 0xFFF07.7
	;***      389 : 		delay_ms(g_timerSetting.t52 - g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 389
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
	;***      390 : 		g_color = WHITE;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 390
	mov !LOWW(_g_color), #0x02
	;***      391 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 391
	mov a, #0x02
	call $!_handSensorLED
	;***      392 : 		O_SPOUT_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 392
	set1 0xFFF05.5
	;***      393 : 		delay_ms(g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 393
	movw bc, !LOWW(_g_timerSetting+0x00032)
	movw ax, !LOWW(_g_timerSetting+0x00030)
	call !!_delay_ms
	;***      394 : 		O_PUMP_ACID_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 394
	clr1 0xFFF06.2
	;***      395 : 		delay_ms(_waterHamerTime);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 395
	clrw bc
	movw ax, #0x03E8
	call !!_delay_ms
	;***      396 : 		O_SPOUT_ACID_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 396
	clr1 0xFFF07.6
	;***      397 : 		delay_ms(g_timerSetting.t53 - g_timerSetting.t54);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 397
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
	;***      398 : 		O_SPOUT_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 398
	clr1 0xFFF05.5
.BB@LABEL@25_9:	; bb22
	;***      399 : 	}
	;***      400 : 	while(readHS() == 1) R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 400
	call !!_readHS
	dec a
	bnz $.BB@LABEL@25_11
.BB@LABEL@25_10:	; bb
	call !!_R_WDT_Restart
	br $.BB@LABEL@25_9
.BB@LABEL@25_11:	; bb28
	mov a, [sp+0x00]
	;***      401 : 	if(_state == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 401
	dec a
	bnz $.BB@LABEL@25_13
.BB@LABEL@25_12:	; if_then_bb34
	;***      402 : 		g_color = BLACK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 402
	clrb !LOWW(_g_color)
	;***      403 : 		handSensorLED(g_color);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 403
	clrb a
	pop hl
	br $!_handSensorLED
.BB@LABEL@25_13:	; return
	;***      404 : 	}
	;***      405 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 405
	pop hl
	ret
_AcidWaterMode:
	.STACK _AcidWaterMode = 4
	;***      406 : void AcidWaterMode(void){
	;***      407 : 	uint8_t _state = 0;
	;***      408 : 	if(readHS() == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 408
	br !!_readHS
_main_20211111:
	.STACK _main_20211111 = 4
	;***      409 : 		_state = 1;
	;***      410 : 	}
	;***      411 : 	if(_state == 1){
	;***      412 : 
	;***      413 : 	}
	;***      414 : }
	;***      415 : // Newest
	;***      416 : void main_20211111(void){
	;***      417 : 	InitialOperationModeStart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 417
	call $!_InitialOperationModeStart
	;***      418 : 	WaterSupplyOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 418
	call $!_WaterSupplyOperation
	;***      419 : 	ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 419
	br $!_ElectrolyticOperation
_main_20211111_while:
	.STACK _main_20211111_while = 4
	;***      420 : 
	;***      421 : //	Test section
	;***      422 : //	electrolyticOperationON();
	;***      423 : //	delay_ms(500);
	;***      424 : //	Voltage1Check();
	;***      425 : //	Voltage2Check();
	;***      426 : //	Voltage3Check();
	;***      427 : //	LowVoltageCheck();
	;***      428 : //	if(OverCurrentCheck() == 0) electrolyticOperationOFF();
	;***      429 : }
	;***      430 : void main_20211111_while(void){
	;***      431 : 	ElectrolyzeWaterGeneration();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 431
	call $!_ElectrolyzeWaterGeneration
	;***      432 : 	WaterWashingMode();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 432
	br $!_WaterWashingMode
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      433 : 
	;***      434 : }
	;***      435 : 
	;***      436 : /**
	;***      437 :  * 30/11/2021: Checked by An, missing Neutralization timer ON
	;***      438 :  */
	;***      439 : void electrolyticOperationON(void){
	;***      440 : 	//Electrolytic operation ON
	;***      441 : 	O_SUPPLY_WATER_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 441
	set1 0xFFF01.7
	;***      442 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 442
	set1 0xFFF0E.2
	;***      443 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 443
	set1 0xFFF06.0
	;***      444 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 444
	oneb !LOWW(_g_electrolytic_flag)
	;***      445 : 	g_neutralization_time = g_neutralization_time == 0 ? g_systemTime:g_neutralization_time;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 445
	movw bc, !LOWW(_g_neutralization_time+0x00002)
	movw ax, !LOWW(_g_neutralization_time)
	movw de, ax
	addw ax, bc
	bnz $.BB@LABEL@29_3
.BB@LABEL@29_1:	; entry
	bc $.BB@LABEL@29_3
.BB@LABEL@29_2:	; bb
	movw bc, !LOWW(_g_systemTime+0x00002)
	movw de, !LOWW(_g_systemTime)
.BB@LABEL@29_3:	; bb6
	movw ax, de
	movw !LOWW(_g_neutralization_time), ax
	movw ax, bc
	movw !LOWW(_g_neutralization_time+0x00002), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 447
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      446 : 	//TODO: Add Neutralization timer ON
	;***      447 : }
	;***      448 : /**
	;***      449 :  * 30/11/2021: Checked by An, missing Neutralization timer OFF
	;***      450 :  */
	;***      451 : void electrolyticOperationOFF(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 451
	clrw ax
	;***      452 : 	//TODO: Add Neutralization timer OFF
	;***      453 : 	g_neutralization_time = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 453
	movw !LOWW(_g_neutralization_time+0x00002), ax
	movw !LOWW(_g_neutralization_time), ax
	;***      454 : 	//Electrolytic operation OFF
	;***      455 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 455
	clr1 0xFFF0E.2
	;***      456 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 456
	clr1 0xFFF06.0
	;***      457 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 457
	mov a, #0x05
	call !!_delay
	;***      458 : 	O_SUPPLY_WATER_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 458
	clr1 0xFFF01.7
	;***      459 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 459
	clrb !LOWW(_g_electrolytic_flag)
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 22
	;***      460 : 
	;***      461 : }
	;***      462 : /**
	;***      463 :  *
	;***      464 :  * @param s: Period time take measurement in mills second
	;***      465 :  * @return L/minutes
	;***      466 :  */
	;***      467 : float measureFlowSensor(uint32_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 467
	push bc
	push ax
	subw sp, #0x0A
	;***      468 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 468
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
.BB@LABEL@31_1:	; bb28
	movw ax, [sp+0x0A]
	movw bc, ax
	movw ax, [sp+0x0C]
	movw de, ax
	;***      469 : 	float flow_pluse = 0.0;
	;***      470 : 	uint8_t flow_pulse_state = 1;
	;***      471 : 	while(!ns_delay_ms(&stamp_flow_sensor, s)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 471
	movw ax, sp
	addw ax, #0x0006
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@31_7
.BB@LABEL@31_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      472 : 		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 472
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@31_6
.BB@LABEL@31_3:	; if_then_bb
	;***      473 : 			if(I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 473
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@31_5
.BB@LABEL@31_4:	; if_then_bb21
	movw ax, #0x3F80
	;***      474 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 474
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
.BB@LABEL@31_5:	; if_break_bb
	;***      475 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 475
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@31_6:	; if_break_bb27
	;***      476 : 		}
	;***      477 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 477
	call !!_R_WDT_Restart
	br $.BB@LABEL@31_1
.BB@LABEL@31_7:	; bb39
	movw ax, #0x3F33
	;***      478 : 	}
	;***      479 : 	float flow_value = (flow_pluse*0.7*60)/s; // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 479
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
	;***      480 : 	return flow_value;
	;***      481 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 481
	addw sp, #0x12
	ret
	;***      482 : 
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
	.SECTION .bss,BSS
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
