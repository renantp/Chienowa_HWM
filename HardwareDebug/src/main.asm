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
#@  compiled at Fri Nov 26 15:43:16 2021

	.EXTERN _g_control_buffer
	.EXTERN _g_systemTime
	.EXTERN _g_uart2_send
	.EXTERN _g_error
	.EXTERN _g_adc_value
	.PUBLIC _g_timerSetting
	.PUBLIC _g_numberSetting
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
	.PUBLIC _LowCurrentCheck
	.PUBLIC _ElectrolyticOperation
	.PUBLIC _solenoidCheck
	.PUBLIC _saltWaterTankFullCheck
	.PUBLIC _saltWaterTankEmptyCheck
	.PUBLIC _acidWaterTankSkipCheck
	.PUBLIC _alkalineWaterTankSkipCheck
	.PUBLIC _waterTankFullCheck
	.PUBLIC _main_20211111
	.PUBLIC _waitReset
	.PUBLIC _electrolyticOperationON
	.PUBLIC _electrolyticOperationOFF
	.PUBLIC _measureFlowSensor
	.EXTERN _ns_delay_ms
	.PUBLIC _CRC8

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
	;***       24 : 
	;***       25 : float g_cvcc_current, g_cvcc_voltge;
	;***       26 : enum Control_header g_alarm;
	;***       27 : float g_flow_value;
	;***       28 : uint32_t g_neutralization_time = 0;
	;***       29 : volatile uint8_t g_electrolytic_flag = 0;
	;***       30 : 
	;***       31 : //void electrolyticOperationON(void);
	;***       32 : //void electrolyticOperationOFF(void);
	;***       33 : void handSensorLED(enum HS_COLOR color){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 33
	movw hl, #0xFF01
	;***       34 : 	switch (color) {
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 34
	dec a
	bz $.BB@LABEL@1_5
.BB@LABEL@1_1:	; entry
	dec a
	bz $.BB@LABEL@1_8
.BB@LABEL@1_2:	; entry
	dec a
	bz $.BB@LABEL@1_7
.BB@LABEL@1_3:	; switch_clause_bb5
	;***       35 : 		case RED:
	;***       36 : 			O_HS_ICL_PIN = 1;
	;***       37 : 			O_HS_IDA_PIN = 0;
	;***       38 : 			break;
	;***       39 : 		case BLUE:
	;***       40 : 			O_HS_ICL_PIN = 0;
	;***       41 : 			O_HS_IDA_PIN = 0;
	;***       42 : 			break;
	;***       43 : 		case WHITE:
	;***       44 : 			O_HS_ICL_PIN = 0;
	;***       45 : 			O_HS_IDA_PIN = 1;
	;***       46 : 			break;
	;***       47 : 		default:
	;***       48 : 			O_HS_ICL_PIN = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 48
	set1 [hl].6
.BB@LABEL@1_4:	; switch_clause_bb5
	set1 [hl].5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 52
	ret
.BB@LABEL@1_5:	; switch_clause_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 36
	set1 [hl].6
.BB@LABEL@1_6:	; switch_clause_bb
	clr1 [hl].5
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 52
	ret
.BB@LABEL@1_7:	; switch_clause_bb3
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 40
	clr1 [hl].6
	br $.BB@LABEL@1_6
.BB@LABEL@1_8:	; switch_clause_bb4
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 44
	clr1 [hl].6
	br $.BB@LABEL@1_4
_setting_default:
	.STACK _setting_default = 4
	;***       49 : 			O_HS_IDA_PIN = 1;
	;***       50 : 			break;
	;***       51 : 	}
	;***       52 : }
	;***       53 : void setting_default(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 53
	movw ax, #0x41B9
	;***       54 : 	g_numberSetting.upperVoltage1 = 23.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 54
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting), ax
	;***       55 : 	g_numberSetting.upperVoltage2 = 18.4;
	;***       56 : 	g_numberSetting.upperVoltage3 = 15.7;
	;***       57 : 	g_numberSetting.upperCurrent = 12.0;
	;***       58 : 	g_numberSetting.lowerCurrent = 4.0;
	;***       59 : 	g_numberSetting.upperFlow = 1.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 59
	movw !LOWW(_g_numberSetting+0x00018), ax
	movw ax, #0x4193
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 55
	movw !LOWW(_g_numberSetting+0x00006), ax
	movw ax, #0x3333
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 56
	movw !LOWW(_g_numberSetting+0x00008), ax
	movw ax, #0x417B
	movw !LOWW(_g_numberSetting+0x0000A), ax
	mov x, #0x40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 57
	movw !LOWW(_g_numberSetting+0x00012), ax
	clrw ax
	movw !LOWW(_g_numberSetting+0x00010), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 58
	movw !LOWW(_g_numberSetting+0x00014), ax
	;***       60 : 	g_numberSetting.lowerFlow = 0.2;
	;***       61 : 	g_timerSetting.t2_flowSensorStartTime = 30000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 61
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***       62 : 	g_timerSetting.t3_flowSensorMonitorTime = 23000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 62
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       63 : 	g_timerSetting.t11_overVoltage1Time = 10000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 63
	movw !LOWW(_g_timerSetting+0x0000E), ax
	;***       64 : 	g_timerSetting.t12_overVoltage2Time = 10000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 64
	movw !LOWW(_g_timerSetting+0x00012), ax
	;***       65 : 	g_timerSetting.t13_overVoltage3Time = 20000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       66 : 	g_timerSetting.t17_solenoidLeakageStartTime = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	movw !LOWW(_g_timerSetting+0x00022), ax
	movw ax, #0x4080
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 58
	movw !LOWW(_g_numberSetting+0x00016), ax
	movw ax, #0x3F99
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 59
	movw !LOWW(_g_numberSetting+0x0001A), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 60
	movw !LOWW(_g_numberSetting+0x0001E), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x7530
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 61
	movw !LOWW(_g_timerSetting), ax
	movw ax, #0x59D8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 62
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0x2710
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 63
	movw !LOWW(_g_timerSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 64
	movw !LOWW(_g_timerSetting+0x00010), ax
	movw ax, #0x4E20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 65
	movw !LOWW(_g_timerSetting+0x00014), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 66
	movw !LOWW(_g_timerSetting+0x00020), ax
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 10
	;***       67 : }
	;***       68 : #ifdef RENAN_CODE
	;***       69 : void renanCode(void){
	;***       70 : 	//Power On Mode
	;***       71 : 	O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       72 : 	O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       73 : 	do{
	;***       74 : 		O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN;	// Turn on SV5 if ACID tank empty
	;***       75 : 		O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN;	// Turn on SV6 if ALK tank empty
	;***       76 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***       77 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***       78 : 		R_WDT_Restart();
	;***       79 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***       80 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***       81 : 	O_DRAIN_ACID_PIN = O_DRAIN_ALK_PIN = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***       82 : 
	;***       83 : 	// Drainage operation
	;***       84 : 	O_SPOUT_WATER_PIN = ON;	// SV2 On
	;***       85 : 	delay(st[1]);			// Default 30 seconds
	;***       86 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	;***       87 : 	delay_ms(500);
	;***       88 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	;***       89 : }
	;***       90 : 
	;***       91 : 
	;***       92 : void code_20211029(void){
	;***       93 : 	//---------------Electrolytic operation-----------------------------
	;***       94 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	;***       95 : 	O_CVCC_ON_PIN = ON;
	;***       96 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***       97 : 	delay(10);
	;***       98 : 	//TODO: Neutralization timer On
	;***       99 : 
	;***      100 : 	overVoltage1Error();
	;***      101 : }
	;***      102 : #endif
	;***      103 : //----------------------Begin code 11112021--------------------------------------
	;***      104 : void sendToRasPi(enum UART_header_e head, enum Control_header type, float value){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 104
	push hl
	push ax
	movw ax, bc
	push de
	pop bc
	;***      105 : 	uint8_t state = g_uart2_send;
	;***      106 : 	g_control_buffer.head = head;
	;***      107 : 	g_control_buffer.set_number = type;
	;***      108 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 108
	call !!__COM_ftoul
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 105
	mov a, !LOWW(_g_uart2_send)
	mov [sp+0x02], a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 106
	mov !LOWW(_g_control_buffer), a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 107
	mov !LOWW(_g_control_buffer+0x00001), a
	;***      109 : 	R_UART2_Send((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 109
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@3_1:	; bb10
	mov a, [sp+0x02]
	;***      110 : 	while(state == g_uart2_send);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 110
	cmp a, !LOWW(_g_uart2_send)
	bz $.BB@LABEL@3_1
.BB@LABEL@3_2:	; return
	;***      111 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 111
	addw sp, #0x04
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 4
	;***      112 : void InitialOperationModeStart(void){
	;***      113 : 	OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 113
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
	;***      114 : 	OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 114
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
	;***      115 : 	do{
	;***      116 : 		OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OPTION_1_PIN;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 116
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
	;***      117 : 		OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OPTION_2_PIN;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 117
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
	;***      118 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 118
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 115
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
	;***      119 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      120 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 120
	ret
_FlowSensorCheck:
	.STACK _FlowSensorCheck = 18
	;***      121 : uint8_t FlowSensorCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 121
	subw sp, #0x0A
	;***      122 : 	delay(15);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 122
	mov a, #0x0F
	call !!_delay
	;***      123 : 	g_flow_value = measureFlowSensor(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 123
	clrw bc
	movw ax, #0x0005
	call $!_measureFlowSensor
	movw [sp+0x02], ax
	movw !LOWW(_g_flow_value), ax
	movw ax, bc
	movw [sp+0x00], ax
	movw !LOWW(_g_flow_value+0x00002), ax
	;***      124 : 	if((g_flow_value < g_numberSetting.upperFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 124
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
.BB@LABEL@5_10:	; bb14
	;***      125 : 			&(g_flow_value > g_numberSetting.lowerFlow)){
	;***      126 : 		return 1;
	;***      127 : 	}else{
	;***      128 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      129 : 		return 0;
	;***      130 : 	}
	;***      131 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 131
	oneb a
.BB@LABEL@5_11:	; bb14
	addw sp, #0x0A
	ret
.BB@LABEL@5_12:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4101
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	clrb a
	br $.BB@LABEL@5_11
_WaterSupplyOperation:
	.STACK _WaterSupplyOperation = 4
	;***      132 : void WaterSupplyOperation(void){
	;***      133 : 	O_SPOUT_WATER_PIN = ON;		// SV2 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	set1 0xFFF05.5
	;***      134 : 	delay(30);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	mov a, #0x1E
	call !!_delay
	;***      135 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
	set1 0xFFF01.7
	;***      136 : 	delay_ms(500);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 136
	clrw bc
	movw ax, #0x01F4
	call !!_delay_ms
	;***      137 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 137
	clr1 0xFFF05.5
.BB@LABEL@6_1:	; bb1
	;***      138 : 	while(FlowSensorCheck() != 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	call $!_FlowSensorCheck
	dec a
	bnz $.BB@LABEL@6_1
.BB@LABEL@6_2:	; bb5
	;***      139 : 		//TODO: Adjust
	;***      140 : 
	;***      141 : 	}
	;***      142 : 	delay(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 142
	mov a, #0x0A
	br !!_delay
_Voltage1Check:
	.STACK _Voltage1Check = 18
	;***      143 : }
	;***      144 : void Voltage1Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	subw sp, #0x0A
	;***      145 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 145
	movw ax, !LOWW(_g_adc_value+0x00002)
	clrw bc
	call !!__COM_ultof
	movw de, ax
	movw ax, #0x3B00
	push ax
	clrb a
	push ax
	movw ax, de
	call !!__COM_fmul
	movw [sp+0x06], ax
	movw ax, bc
	movw [sp+0x04], ax
	addw sp, #0x04
	movw ax, [sp+0x00]
	movw !LOWW(_g_cvcc_voltge+0x00002), ax
	movw ax, [sp+0x02]
	movw !LOWW(_g_cvcc_voltge), ax
	;***      146 : 	if(g_cvcc_voltge>=g_numberSetting.upperVoltage1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 146
	movw ax, !LOWW(_g_numberSetting+0x00002)
	movw [sp+0x06], ax
	push ax
	movw ax, !LOWW(_g_numberSetting)
	movw [sp+0x0A], ax
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
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@7_1:	; entry
	clrb a
.BB@LABEL@7_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@7_3:	; entry
	clrb x
.BB@LABEL@7_4:	; entry
	or x, a
	bnz $.BB@LABEL@7_6
.BB@LABEL@7_5:	; if_then_bb
	;***      147 : 		//Alarm
	;***      148 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	call $!_electrolyticOperationOFF
	;***      149 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4102
	addw sp, #0x0A
	br $!_sendToRasPi
.BB@LABEL@7_6:	; return
	;***      150 : 		//TODO: Wait to reset
	;***      151 : 	}
	;***      152 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	addw sp, #0x0A
	ret
_Voltage2Check:
	.STACK _Voltage2Check = 24
	;***      153 : void Voltage2Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	subw sp, #0x10
	br $!.BB@LABEL@8_18
.BB@LABEL@8_1:	; bb9
	;***      154 : 	uint16_t _time_count = 0;
	;***      155 : 	do{
	;***      156 : 		_time_count = 0;
	;***      157 : 		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
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
.BB@LABEL@8_2:	; bb9
	cmpw ax, bc
.BB@LABEL@8_3:	; bb9
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
.BB@LABEL@8_4:	; bb9
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
.BB@LABEL@8_5:	; bb9
	clrb a
.BB@LABEL@8_6:	; bb9
	cmp0 x
	oneb x
	sknz
.BB@LABEL@8_7:	; bb9
	clrb x
.BB@LABEL@8_8:	; bb9
	or x, a
	bnz $.BB@LABEL@8_15
.BB@LABEL@8_9:	; bb2
	;***      158 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	clrw bc
	onew ax
	call !!_delay_ms
	clrw ax
	;***      159 : 			_time_count++;
	;***      160 : 			if(_time_count == g_timerSetting.t12_overVoltage2Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	cmpw ax, !LOWW(_g_timerSetting+0x00012)
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 159
	incw ax
	movw [sp+0x00], ax
	sknz
.BB@LABEL@8_10:	; bb2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	cmpw ax, !LOWW(_g_timerSetting+0x00010)
.BB@LABEL@8_11:	; bb2
	bnz $.BB@LABEL@8_13
.BB@LABEL@8_12:	; if_then_bb
	;***      161 : 				sendToRasPi(H_ALARM, OVER_VOLTAGE_2, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 161
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4103
	call $!_sendToRasPi
.BB@LABEL@8_13:	; if_break_bb
	;***      162 : 			}
	;***      163 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 163
	call !!_R_WDT_Restart
.BB@LABEL@8_14:	; if_break_bb
	br $.BB@LABEL@8_1
.BB@LABEL@8_15:	; bb23
	movw ax, [sp+0x0E]
	movw bc, ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 155
	cmpw ax, bc
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@8_16:	; bb23
	cmpw ax, bc
.BB@LABEL@8_17:	; bb23
	bnz $.BB@LABEL@8_19
.BB@LABEL@8_18:	; bb23.bb9_crit_edge
	clrw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@8_14
.BB@LABEL@8_19:	; return
	;***      164 : 		}
	;***      165 : 	}while(_time_count == g_timerSetting.t12_overVoltage2Time);
	;***      166 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	addw sp, #0x10
	ret
_Voltage3Check:
	.STACK _Voltage3Check = 20
	;***      167 : void Voltage3Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 167
	subw sp, #0x0C
	clrw ax
	movw [sp+0x00], ax
.BB@LABEL@9_1:	; bb8
	clrw ax
	;***      168 : 	uint16_t _time_count = 0;
	;***      169 : 	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 169
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@9_2:	; bb8
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@9_3:	; bb8
	movw hl, !LOWW(_g_numberSetting+0x0000A)
	movw ax, hl
	movw [sp+0x06], ax
	movw de, !LOWW(_g_numberSetting+0x00008)
	movw ax, de
	movw [sp+0x08], ax
	movw bc, !LOWW(_g_cvcc_voltge+0x00002)
	movw ax, bc
	movw [sp+0x0A], ax
	movw ax, !LOWW(_g_cvcc_voltge)
	movw [sp+0x04], ax
	bnc $.BB@LABEL@9_14
.BB@LABEL@9_4:	; bb8
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
	movw ax, [sp+0x08]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@9_5:	; bb8
	clrb a
.BB@LABEL@9_6:	; bb8
	cmp0 x
	oneb x
	sknz
.BB@LABEL@9_7:	; bb8
	clrb x
.BB@LABEL@9_8:	; bb8
	or x, a
	bnz $.BB@LABEL@9_14
.BB@LABEL@9_9:	; bb
	;***      170 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
	clrw bc
	onew ax
	call !!_delay_ms
	clrw ax
	;***      171 : 		_time_count++;
	;***      172 : 		if(_time_count == g_timerSetting.t13_overVoltage3Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	incw ax
	movw [sp+0x00], ax
	sknz
.BB@LABEL@9_10:	; bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@9_11:	; bb
	bnz $.BB@LABEL@9_13
.BB@LABEL@9_12:	; if_then_bb
	;***      173 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_3, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 173
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	;***      174 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	call $!_electrolyticOperationOFF
.BB@LABEL@9_13:	; if_break_bb
	;***      175 : 			//TODO: Wait to reset
	;***      176 : 		}
	;***      177 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
	call !!_R_WDT_Restart
	br $.BB@LABEL@9_1
.BB@LABEL@9_14:	; return
	;***      178 : 	}
	;***      179 : 
	;***      180 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	addw sp, #0x0C
	ret
_LowVoltageCheck:
	.STACK _LowVoltageCheck = 20
	;***      181 : void LowVoltageCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	subw sp, #0x0C
	;***      182 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 182
	call $!_electrolyticOperationON
	;***      183 : //	while(g_neutralization_time > 60000);
	;***      184 : 	delay(60);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	mov a, #0x3C
	call !!_delay
	clrw ax
	movw [sp+0x00], ax
.BB@LABEL@10_1:	; bb8
	clrw ax
	;***      185 : 	uint16_t _time_count = 0;
	;***      186 : 	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < g_timerSetting.t15_lowVoltageDelayTime)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 186
	cmpw ax, !LOWW(_g_timerSetting+0x0001E)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@10_2:	; bb8
	cmpw ax, !LOWW(_g_timerSetting+0x0001C)
.BB@LABEL@10_3:	; bb8
	movw hl, !LOWW(_g_numberSetting+0x0000E)
	movw ax, hl
	movw [sp+0x06], ax
	movw de, !LOWW(_g_numberSetting+0x0000C)
	movw ax, de
	movw [sp+0x08], ax
	movw bc, !LOWW(_g_cvcc_voltge+0x00002)
	movw ax, bc
	movw [sp+0x0A], ax
	movw ax, !LOWW(_g_cvcc_voltge)
	movw [sp+0x04], ax
	bnc $.BB@LABEL@10_14
.BB@LABEL@10_4:	; bb8
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
	movw ax, [sp+0x08]
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@10_5:	; bb8
	clrb a
.BB@LABEL@10_6:	; bb8
	cmp0 x
	oneb x
	sknz
.BB@LABEL@10_7:	; bb8
	clrb x
.BB@LABEL@10_8:	; bb8
	or x, a
	bnz $.BB@LABEL@10_14
.BB@LABEL@10_9:	; bb
	;***      187 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 187
	clrw bc
	onew ax
	call !!_delay_ms
	clrw ax
	;***      188 : 		_time_count++;
	;***      189 : 		if(_time_count == g_timerSetting.t15_lowVoltageDelayTime){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 189
	cmpw ax, !LOWW(_g_timerSetting+0x0001E)
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	incw ax
	movw [sp+0x00], ax
	sknz
.BB@LABEL@10_10:	; bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 189
	cmpw ax, !LOWW(_g_timerSetting+0x0001C)
.BB@LABEL@10_11:	; bb
	bnz $.BB@LABEL@10_13
.BB@LABEL@10_12:	; if_then_bb
	;***      190 : 			sendToRasPi(H_ALARM, UNDER_VOLTAGE, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 190
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      191 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
	call $!_electrolyticOperationOFF
.BB@LABEL@10_13:	; if_break_bb
	;***      192 : 			//TODO: Wait to reset
	;***      193 : 		}
	;***      194 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	call !!_R_WDT_Restart
	br $.BB@LABEL@10_1
.BB@LABEL@10_14:	; return
	;***      195 : 	}
	;***      196 : 
	;***      197 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
	addw sp, #0x0C
	ret
_LowCurrentCheck:
	.STACK _LowCurrentCheck = 20
	;***      198 : void LowCurrentCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	subw sp, #0x0C
	;***      199 : 	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	movw ax, !LOWW(_g_numberSetting+0x00012)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	push ax
	movw bc, !LOWW(_g_cvcc_current+0x00002)
	movw ax, bc
	movw [sp+0x04], ax
	movw ax, !LOWW(_g_cvcc_current)
	movw [sp+0x08], ax
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	movw bc, !LOWW(_g_numberSetting+0x00016)
	movw ax, bc
	movw [sp+0x06], ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x08], ax
	bnz $.BB@LABEL@11_6
.BB@LABEL@11_1:	; entry
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x06]
	push ax
	movw ax, [sp+0x0A]
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
.BB@LABEL@11_2:	; entry
	clrb a
.BB@LABEL@11_3:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@11_4:	; entry
	clrb x
.BB@LABEL@11_5:	; entry
	or x, a
	bnz $.BB@LABEL@11_15
.BB@LABEL@11_6:	; if_then_bb
	clrw ax
	movw [sp+0x00], ax
	;***      200 : 		sendToRasPi(H_ALARM, CURRENT_INVALID, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4106
	call $!_sendToRasPi
.BB@LABEL@11_7:	; bb14
	;***      201 : 		uint16_t _time_count = 0;
	;***      202 : 		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
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
.BB@LABEL@11_8:	; bb14
	clrb a
.BB@LABEL@11_9:	; bb14
	cmp0 x
	oneb x
	sknz
.BB@LABEL@11_10:	; bb14
	clrb x
.BB@LABEL@11_11:	; bb14
	or x, a
	bnz $.BB@LABEL@11_14
.BB@LABEL@11_12:	; bb14
	movw ax, [sp+0x00]
	cmpw ax, #0x2710
	bnc $.BB@LABEL@11_14
.BB@LABEL@11_13:	; bb
	;***      203 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 203
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      204 : 			_time_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@11_7
.BB@LABEL@11_14:	; bb26
	movw ax, [sp+0x00]
	;***      205 : 		}
	;***      206 : 		if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 206
	cmpw ax, #0x2710
.BB@LABEL@11_15:	; bb26
	bnz $.BB@LABEL@11_17
.BB@LABEL@11_16:	; if_then_bb31
	;***      207 : 			sendToRasPi(H_ALARM, OVER_CURRENT, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 207
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      208 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 208
	addw sp, #0x0C
	br $!_electrolyticOperationOFF
.BB@LABEL@11_17:	; return
	;***      209 : 			//TODO: Wait to reset
	;***      210 : 		}
	;***      211 : 	}
	;***      212 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	addw sp, #0x0C
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@12_1:	; bb
	;***      213 : void ElectrolyticOperation(void){
	;***      214 : 	do{
	;***      215 : 		O_SUPPLY_WATER_PIN = ON; //SV1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	set1 0xFFF01.7
	;***      216 : 		O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	set1 0xFFF0E.2
	;***      217 : 		O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 217
	set1 0xFFF06.0
	;***      218 : 		//-----------Voltage 1 check----------------
	;***      219 : 		Voltage1Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	call $!_Voltage1Check
	;***      220 : 		//-----------Voltage 2 check----------------
	;***      221 : 		Voltage2Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	call $!_Voltage2Check
	;***      222 : 		//-----------Voltage 3 check----------------
	;***      223 : 		Voltage3Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	call $!_Voltage3Check
	;***      224 : 		//----------Low voltage error check--------------
	;***      225 : 		LowVoltageCheck();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	call $!_LowVoltageCheck
	;***      226 : 		//----------Current Error check------------------
	;***      227 : 		LowCurrentCheck();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	call $!_LowCurrentCheck
	;***      228 : 		//----------CVCC Alarm Input---------------------
	;***      229 : 		if(I_CVCC_ALARM_IN == 0U){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@12_3
.BB@LABEL@12_2:	; if_then_bb
	;***      230 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410F
	call $!_sendToRasPi
	;***      231 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	call $!_electrolyticOperationOFF
.BB@LABEL@12_3:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
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
	bnz $.BB@LABEL@12_1
.BB@LABEL@12_4:	; bb22
	;***      232 : 			//TODO: Wait Reset
	;***      233 : 		}
	;***      234 : 	}while((I_ACID_H_PIN == 0)|(I_ALKALI_H_PIN == 0));
	;***      235 : 	O_CVCC_ON_PIN = GPIO_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 235
	set1 0xFFF0E.2
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      236 : }
	;***      237 : void solenoidCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	subw sp, #0x04
	;***      238 : 	uint32_t _time_count = 0;
	;***      239 : 	if((g_flow_value <= 0.1f)&(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
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
	;***      240 : 		_time_count++;
	;***      241 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@13_5:	; if_break_bb
	;***      242 : 	}
	;***      243 : 	if(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 243
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
	;***      244 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4108
	br $!_sendToRasPi
.BB@LABEL@13_9:	; return
	;***      245 : 	}
	;***      246 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 246
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      247 : void saltWaterTankFullCheck(void){
	;***      248 : 	if(I_SALT_H_PIN == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 248
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@14_2
.BB@LABEL@14_1:	; return
	;***      249 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      250 : 		electrolyticOperationOFF();
	;***      251 : 		//TODO: Fault in the flowchart
	;***      252 : 	}
	;***      253 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	ret
.BB@LABEL@14_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4109
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	br $!_electrolyticOperationOFF
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      254 : void saltWaterTankEmptyCheck(void){
	;***      255 : 	if(I_SALT_L_PIN == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@15_2
.BB@LABEL@15_1:	; if_then_bb
	;***      256 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410A
	br $!_sendToRasPi
.BB@LABEL@15_2:	; return
	;***      257 : 		//TODO: Control OFF
	;***      258 : 	}
	;***      259 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      260 : void acidWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 260
	movw de, #0xFF07
	;***      261 : 	if(((I_ACID_L_PIN == 0)&((I_ACID_M_PIN == 1)|(I_ACID_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 261
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
	;***      262 : 			((I_ACID_M_PIN == 0)&(I_ACID_H_PIN == 1))){
	;***      263 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      264 : 		//TODO: Control OFF
	;***      265 : 	}
	;***      266 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	ret
.BB@LABEL@16_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
	movw de, #0x3F80
	movw ax, #0x410B
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      267 : void alkalineWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 267
	push hl
	;***      268 : 	if(((I_ALKALI_L_PIN == 0)&((I_ALKALI_M_PIN == 1)|(I_ALKALI_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 268
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
	;***      269 : 			((I_ALKALI_M_PIN == 0)&(I_ALKALI_H_PIN == 1))){
	;***      270 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      271 : 		//TODO: Control OFF
	;***      272 : 	}
	;***      273 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	ret
.BB@LABEL@17_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
	movw de, #0x3F80
	movw ax, #0x410C
	br $!_sendToRasPi
_waterTankFullCheck:
	.STACK _waterTankFullCheck = 4
	;***      274 : void waterTankFullCheck(void){
	;***      275 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	br $_electrolyticOperationOFF
_main_20211111:
	.STACK _main_20211111 = 4
	;***      276 : 	//TODO: Hand Sensor Off
	;***      277 : 
	;***      278 : }
	;***      279 : 
	;***      280 : // Newest
	;***      281 : void main_20211111(void){
	;***      282 : 	InitialOperationModeStart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	call $!_InitialOperationModeStart
	;***      283 : 	WaterSupplyOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	call $!_WaterSupplyOperation
.BB@LABEL@19_1:	; bb
	;***      284 : 	do{
	;***      285 : 		ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	call $!_ElectrolyticOperation
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	and a, 0xFFF07
	xor a, #0x01
	mov x, a
	mov a, 0xFFF07
	shr a, 0x03
	and a, #0x01
	xor a, #0x01
	or a, x
	bnz $.BB@LABEL@19_1
.BB@LABEL@19_2:	; bb15
	;***      286 : 	}while((I_ALKALI_H_PIN == 0U)|(I_ACID_H_PIN == 0U));
	;***      287 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	call $!_electrolyticOperationOFF
	;***      288 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	set1 0xFFF0E.2
	;***      289 : 	O_PUMP_SALT_PIN = OFF; 		//SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
	clr1 0xFFF06.0
	;***      290 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	mov a, #0x05
	call !!_delay
	;***      291 : 	O_SUPPLY_WATER_PIN = OFF;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	clr1 0xFFF01.7
	ret
_waitReset:
	.STACK _waitReset = 4
.BB@LABEL@20_1:	; bb1
	;***      292 : }
	;***      293 : 
	;***      294 : void waitReset(void){
	;***      295 : 	while(g_error != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 295
	movw ax, !LOWW(_g_error)
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@20_3
.BB@LABEL@20_2:	; bb
	;***      296 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
	call !!_R_WDT_Restart
	br $.BB@LABEL@20_1
.BB@LABEL@20_3:	; return
	;***      297 : 	}
	;***      298 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 298
	ret
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      299 : void electrolyticOperationON(void){
	;***      300 : 	//Electrolytic operation ON
	;***      301 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
	set1 0xFFF0E.2
	;***      302 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 302
	set1 0xFFF06.0
	;***      303 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	oneb !LOWW(_g_electrolytic_flag)
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      304 : }
	;***      305 : void electrolyticOperationOFF(void){
	;***      306 : 	//Electrolytic operation OFF
	;***      307 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	clr1 0xFFF0E.2
	;***      308 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 308
	clr1 0xFFF06.0
	;***      309 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	clrb !LOWW(_g_electrolytic_flag)
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 26
	;***      310 : }
	;***      311 : float measureFlowSensor(uint32_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
	push bc
	push ax
	subw sp, #0x0E
	;***      312 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 312
	movw ax, !LOWW(_g_systemTime+0x00002)
	movw [sp+0x0C], ax
	movw ax, !LOWW(_g_systemTime)
	movw [sp+0x0A], ax
	clrw ax
	movw [sp+0x00], ax
	oneb a
	mov [sp+0x02], a
	clrw ax
	movw [sp+0x04], ax
.BB@LABEL@23_1:	; bb28
	movw ax, [sp+0x0E]
	;***      313 : 	float flow_pluse = 0.0;
	;***      314 : 	uint8_t flow_pulse_state = 1;
	;***      315 : 	while(!ns_delay_ms(&stamp_flow_sensor, (s*1000))){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 315
	movw bc, #0x03E8
	mulhu
	movw de, ax
	movw [sp+0x08], ax
	push bc
	pop hl
	movw ax, [sp+0x10]
	movw bc, #0x03E8
	mulh
	push de
	pop bc
	addw ax, hl
	movw [sp+0x06], ax
	movw de, ax
	movw ax, sp
	addw ax, #0x000A
	call !!_ns_delay_ms
	clrw bc
	cmpw ax, bc
	bnz $.BB@LABEL@23_7
.BB@LABEL@23_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      316 : 		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 316
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@23_6
.BB@LABEL@23_3:	; if_then_bb
	;***      317 : 			if(I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 317
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@23_5
.BB@LABEL@23_4:	; if_then_bb21
	movw ax, #0x3F80
	;***      318 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 318
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
.BB@LABEL@23_5:	; if_break_bb
	;***      319 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 319
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@23_6:	; if_break_bb27
	;***      320 : 		}
	;***      321 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 321
	call !!_R_WDT_Restart
	br $.BB@LABEL@23_1
.BB@LABEL@23_7:	; bb40
	movw ax, #0x3F33
	;***      322 : 	}
	;***      323 : 	float flow_value = (flow_pluse*0.7*60)/(1000*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 323
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
	movw [sp+0x12], ax
	movw ax, bc
	movw [sp+0x04], ax
	addw sp, #0x04
	movw ax, [sp+0x06]
	movw bc, ax
	movw ax, [sp+0x08]
	call !!__COM_ultof
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x12]
	call !!__COM_fdiv
	;***      324 : 	return flow_value;
	;***      325 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	addw sp, #0x16
	ret
_CRC8:
	.STACK _CRC8 = 10
	;***      326 : char CRC8(const char *data,int length)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 326
	push bc
	subw sp, #0x04
	movw hl, ax
	clrb b
	clrw ax
	movw de, ax
	movw [sp+0x02], ax
.BB@LABEL@24_1:	; bb46
	movw ax, [sp+0x04]
	;***      327 : {
	;***      328 :    char crc = 0x00;
	;***      329 :    char extract;
	;***      330 :    char sum;
	;***      331 :    for(int i=0;i<length;i++)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 331
	xor a, #0x80
	movw [sp+0x00], ax
	movw ax, de
	xor a, #0x80
	movw de, ax
	movw ax, [sp+0x00]
	xchw ax, de
	cmpw ax, de
	bnc $.BB@LABEL@24_8
.BB@LABEL@24_2:	; bb
	;***      332 :    {
	;***      333 :       extract = *data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 333
	mov a, [hl]
	mov c, a
	mov x, #0x08
.BB@LABEL@24_3:	; bb9
	;***      334 :       for (char tempI = 8; tempI; tempI--)
	;***      335 :       {
	;***      336 :          sum = (crc ^ extract) & 0x01;
	;***      337 :          crc >>= 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 337
	mov a, b
	shr a, 0x01
	mov [sp+0x00], a
	mov a, c
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 336
	xor b, a
	mov a, b
	bf a.0, $.BB@LABEL@24_5
.BB@LABEL@24_4:	; if_then_bb
	mov a, [sp+0x00]
	;***      338 :          if (sum)
	;***      339 :             crc ^= 0x8C;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 339
	xor a, #0x8C
	mov [sp+0x00], a
.BB@LABEL@24_5:	; if_break_bb
	mov a, c
	;***      340 :          extract >>= 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 340
	shr a, 0x01
	mov c, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 334
	dec x
	bz $.BB@LABEL@24_7
.BB@LABEL@24_6:	; if_break_bb.bb9_crit_edge
	mov a, [sp+0x00]
	mov b, a
	br $.BB@LABEL@24_3
.BB@LABEL@24_7:	; bb41
	movw ax, [sp+0x02]
	;***      341 :       }
	;***      342 :       data++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 342
	incw ax
	movw de, ax
	movw [sp+0x02], ax
	incw hl
	mov a, [sp+0x00]
	mov b, a
	br $.BB@LABEL@24_1
.BB@LABEL@24_8:	; bb52
	;***      343 :    }
	;***      344 :    return crc;
	;***      345 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 345
	mov a, b
	addw sp, #0x06
	ret
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
