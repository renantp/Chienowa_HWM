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
#@  compiled at Tue Nov 23 09:22:20 2021

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
	.PUBLIC _setting_default
	.PUBLIC _sendToRasPi
	.EXTERN _R_UART2_Send
	.PUBLIC _InitialOperationModeStart
	.EXTERN _R_WDT_Restart
	.PUBLIC _WaterSupplyOperation
	.EXTERN _delay
	.EXTERN _delay_ms
	.EXTERN _R_UART2_Receive
	.PUBLIC _ElectrolyticOperation
	.PUBLIC _solenoidCheck
	.PUBLIC _main_20211111
	.PUBLIC _waitReset
	.PUBLIC _electrolyticOperationON
	.PUBLIC _electrolyticOperationOFF
	.PUBLIC _overVoltage1Error
	.PUBLIC _overVoltage2Error
	.PUBLIC _overVoltage3Error
	.PUBLIC _lowVoltageError
	.PUBLIC _currentError
	.PUBLIC _solenoidValueError
	.PUBLIC _callAlarm
	.PUBLIC _measureFlowSensor
	.EXTERN _ns_delay_ms

	.SECTION .textf,TEXTF
_setting_default:
	.STACK _setting_default = 4
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
	;***       33 : 
	;***       34 : void setting_default(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 34
	movw ax, #0x41B9
	;***       35 : 	g_numberSetting.upperVoltage1 = 23.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 35
	movw !LOWW(_g_numberSetting+0x00002), ax
	movw ax, #0x999A
	movw !LOWW(_g_numberSetting), ax
	;***       36 : 	g_numberSetting.upperVoltage2 = 18.4;
	;***       37 : 	g_numberSetting.upperVoltage3 = 15.7;
	;***       38 : 	g_numberSetting.upperCurrent = 12.0;
	;***       39 : 	g_numberSetting.lowerCurrent = 4.0;
	;***       40 : 	g_numberSetting.upperFlow = 1.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 40
	movw !LOWW(_g_numberSetting+0x00018), ax
	movw ax, #0x4193
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 36
	movw !LOWW(_g_numberSetting+0x00006), ax
	movw ax, #0x3333
	movw !LOWW(_g_numberSetting+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 37
	movw !LOWW(_g_numberSetting+0x00008), ax
	movw ax, #0x417B
	movw !LOWW(_g_numberSetting+0x0000A), ax
	mov x, #0x40
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 38
	movw !LOWW(_g_numberSetting+0x00012), ax
	clrw ax
	movw !LOWW(_g_numberSetting+0x00010), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 39
	movw !LOWW(_g_numberSetting+0x00014), ax
	;***       41 : 	g_numberSetting.lowerFlow = 0.2;
	;***       42 : 	g_timerSetting.t2_flowSensorStartTime = 30000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 42
	movw !LOWW(_g_timerSetting+0x00002), ax
	;***       43 : 	g_timerSetting.t3_flowSensorMonitorTime = 23000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 43
	movw !LOWW(_g_timerSetting+0x00006), ax
	;***       44 : 	g_timerSetting.t11_overVoltage1Time = 10000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 44
	movw !LOWW(_g_timerSetting+0x0000E), ax
	;***       45 : 	g_timerSetting.t12_overVoltage2Time = 10000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 45
	movw !LOWW(_g_timerSetting+0x00012), ax
	;***       46 : 	g_timerSetting.t13_overVoltage3Time = 20000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 46
	movw !LOWW(_g_timerSetting+0x00016), ax
	;***       47 : 	g_timerSetting.t17_solenoidLeakageStartTime = 5000;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 47
	movw !LOWW(_g_timerSetting+0x00022), ax
	movw ax, #0x4080
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 39
	movw !LOWW(_g_numberSetting+0x00016), ax
	movw ax, #0x3F99
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 40
	movw !LOWW(_g_numberSetting+0x0001A), ax
	movw ax, #0x3E4C
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 41
	movw !LOWW(_g_numberSetting+0x0001E), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x0001C), ax
	movw ax, #0x7530
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 42
	movw !LOWW(_g_timerSetting), ax
	movw ax, #0x59D8
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 43
	movw !LOWW(_g_timerSetting+0x00004), ax
	movw ax, #0x2710
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 44
	movw !LOWW(_g_timerSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 45
	movw !LOWW(_g_timerSetting+0x00010), ax
	movw ax, #0x4E20
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 46
	movw !LOWW(_g_timerSetting+0x00014), ax
	movw ax, #0x1388
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 47
	movw !LOWW(_g_timerSetting+0x00020), ax
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 10
	;***       48 : }
	;***       49 : #ifdef RENAN_CODE
	;***       50 : void renanCode(void){
	;***       51 : 	//Power On Mode
	;***       52 : 	O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       53 : 	O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       54 : 	do{
	;***       55 : 		O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN;	// Turn on SV5 if ACID tank empty
	;***       56 : 		O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN;	// Turn on SV6 if ALK tank empty
	;***       57 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***       58 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***       59 : 		R_WDT_Restart();
	;***       60 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***       61 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***       62 : 	O_DRAIN_ACID_PIN = O_DRAIN_ALK_PIN = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***       63 : 
	;***       64 : 	// Drainage operation
	;***       65 : 	O_SPOUT_WATER_PIN = ON;	// SV2 On
	;***       66 : 	delay(st[1]);			// Default 30 seconds
	;***       67 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	;***       68 : 	delay_ms(500);
	;***       69 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	;***       70 : }
	;***       71 : 
	;***       72 : 
	;***       73 : void code_20211029(void){
	;***       74 : 	//---------------Electrolytic operation-----------------------------
	;***       75 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	;***       76 : 	O_CVCC_ON_PIN = ON;
	;***       77 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***       78 : 	delay(10);
	;***       79 : 	//TODO: Neutralization timer On
	;***       80 : 
	;***       81 : 	overVoltage1Error();
	;***       82 : }
	;***       83 : #endif
	;***       84 : //----------------------Begin code 11112021--------------------------------------
	;***       85 : void sendToRasPi(enum UART_header_e head, enum Control_header type, float value){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	push hl
	push ax
	movw ax, bc
	push de
	pop bc
	;***       86 : 	uint8_t state = g_uart2_send;
	;***       87 : 	g_control_buffer.head = head;
	;***       88 : 	g_control_buffer.set_number = type;
	;***       89 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
	call !!__COM_ftoul
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	mov a, !LOWW(_g_uart2_send)
	mov [sp+0x02], a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 87
	mov !LOWW(_g_control_buffer), a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
	mov !LOWW(_g_control_buffer+0x00001), a
	;***       90 : 	R_UART2_Send((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@2_1:	; bb10
	mov a, [sp+0x02]
	;***       91 : 	while(state == g_uart2_send);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
	cmp a, !LOWW(_g_uart2_send)
	bz $.BB@LABEL@2_1
.BB@LABEL@2_2:	; return
	;***       92 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
	addw sp, #0x04
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 4
	;***       93 : void InitialOperationModeStart(void){
	;***       94 : 	OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 94
	mov a, 0xFFF07
	oneb x
	bf a.1, $.BB@LABEL@3_2
.BB@LABEL@3_1:	; bb6
	clrb x
.BB@LABEL@3_2:	; bb7
	mov a, #0xFE
	and a, 0xFFF0B
	add a, x
	mov 0xFFF0B, a
	;***       95 : 	OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 95
	mov a, 0xFFF00
	mov x, #0x02
	bf a.5, $.BB@LABEL@3_4
.BB@LABEL@3_3:	; bb21
	clrb x
.BB@LABEL@3_4:	; bb23
	mov a, #0xFD
	and a, 0xFFF0B
	or a, x
	mov 0xFFF0B, a
.BB@LABEL@3_5:	; bb32
	;***       96 : 	do{
	;***       97 : 		OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OPTION_1_PIN;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 97
	mov a, 0xFFF07
	mov1 CY, a.1
	oneb a
	sknc
.BB@LABEL@3_6:	; bb40
	and a, 0xFFF0B
.BB@LABEL@3_7:	; bb46
	mov x, a
	mov a, #0xFE
	and a, 0xFFF0B
	add a, x
	mov 0xFFF0B, a
	;***       98 : 		OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OPTION_2_PIN;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 98
	mov a, 0xFFF00
	mov1 CY, a.5
	mov a, #0x02
	sknc
.BB@LABEL@3_8:	; bb61
	and a, 0xFFF0B
.BB@LABEL@3_9:	; bb67
	mov x, a
	mov a, #0xFD
	and a, 0xFFF0B
	or a, x
	mov 0xFFF0B, a
	;***       99 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 99
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 96
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
	bnz $.BB@LABEL@3_5
.BB@LABEL@3_10:	; return
	;***      100 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***      101 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 101
	ret
_WaterSupplyOperation:
	.STACK _WaterSupplyOperation = 18
	;***      102 : void WaterSupplyOperation(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 102
	subw sp, #0x0A
	;***      103 : 	O_SPOUT_WATER_PIN = ON;		// SV2 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 103
	set1 0xFFF05.5
	;***      104 : 	delay(30);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 104
	mov a, #0x1E
	call !!_delay
	;***      105 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 105
	set1 0xFFF01.7
	;***      106 : 	delay_ms(500);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 106
	clrw bc
	movw ax, #0x01F4
	call !!_delay_ms
	;***      107 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 107
	clr1 0xFFF05.5
.BB@LABEL@4_1:	; bb
	;***      108 : 	do{
	;***      109 : 		delay(15);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 109
	mov a, #0x0F
	call !!_delay
	;***      110 : 		g_flow_value = measureFlowSensor(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 110
	clrw bc
	movw ax, #0x0005
	call $!_measureFlowSensor
	movw [sp+0x02], ax
	movw !LOWW(_g_flow_value), ax
	movw ax, bc
	movw [sp+0x00], ax
	movw !LOWW(_g_flow_value+0x00002), ax
	;***      111 : 		if((g_flow_value < g_numberSetting.upperFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 111
	movw ax, !LOWW(_g_numberSetting+0x0001E)
	movw [sp+0x06], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0001C)
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
	call !!__COM_fle
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x04]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@4_2:	; bb
	clrb a
.BB@LABEL@4_3:	; bb
	cmp0 x
	oneb x
	sknz
.BB@LABEL@4_4:	; bb
	clrb x
.BB@LABEL@4_5:	; bb
	or x, a
	movw bc, !LOWW(_g_numberSetting+0x0001A)
	movw ax, !LOWW(_g_numberSetting+0x00018)
	bnz $.BB@LABEL@4_7
.BB@LABEL@4_6:	; bb
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_flt
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@4_12
.BB@LABEL@4_7:	; if_else_bb
	;***      112 : 				&(g_flow_value > g_numberSetting.lowerFlow)){
	;***      113 : 			break;
	;***      114 : 		}else{
	;***      115 : 			g_alarm = FLOW_SENSOR_ERROR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 115
	oneb !LOWW(_g_alarm)
	;***      116 : 			sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 116
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4101
	call $!_sendToRasPi
.BB@LABEL@4_8:	; bb15
	;***      117 : 			while(g_control_buffer.set_value != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 117
	movw bc, !LOWW(_g_control_buffer+0x00004)
	movw ax, !LOWW(_g_control_buffer+0x00002)
	addw ax, bc
	sknz
.BB@LABEL@4_9:	; bb15
	bnc $.BB@LABEL@4_11
.BB@LABEL@4_10:	; bb13
	;***      118 : 				R_UART2_Receive((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 118
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Receive
	;***      119 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 119
	call !!_R_WDT_Restart
	br $.BB@LABEL@4_8
.BB@LABEL@4_11:	; bb20
	;***      120 : 			}
	;***      121 : 			g_alarm = OK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 121
	clrb !LOWW(_g_alarm)
	br $!.BB@LABEL@4_1
.BB@LABEL@4_12:	; bb22
	;***      122 : 		}
	;***      123 : 	}while(1);
	;***      124 : 	delay(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 124
	mov a, #0x0A
	addw sp, #0x0A
	br !!_delay
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 20
	;***      125 : }
	;***      126 : void ElectrolyticOperation(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 126
	subw sp, #0x0C
	;***      127 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 127
	set1 0xFFF01.7
	;***      128 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
	set1 0xFFF0E.2
	;***      129 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	set1 0xFFF06.0
	clrw ax
	movw [sp+0x00], ax
	;***      130 : 	//-----------Voltage 1 check----------------
	;***      131 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 131
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
	movw de, ax
	addw sp, #0x04
	movw ax, bc
	movw !LOWW(_g_cvcc_voltge+0x00002), ax
	movw ax, de
	movw !LOWW(_g_cvcc_voltge), ax
	;***      132 : 	if(g_cvcc_voltge>=g_numberSetting.upperVoltage1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 132
	movw ax, !LOWW(_g_numberSetting+0x00002)
	push ax
	movw ax, !LOWW(_g_numberSetting)
	push ax
	movw ax, de
	call !!__COM_fge
	addw sp, #0x04
	cmp0 a
	bz $.BB@LABEL@5_3
.BB@LABEL@5_1:	; if_then_bb
	;***      133 : 		//Alarm
	;***      134 : 		g_alarm = OVER_VOLTAGE_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	mov !LOWW(_g_alarm), #0x02
	;***      135 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
	call $!_electrolyticOperationOFF
	clrw ax
	movw [sp+0x00], ax
	;***      136 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 136
	movw de, #0x3F80
	clrw bc
	mov x, #0x02
.BB@LABEL@5_2:	; if_then_bb
	mov a, #0x41
	call $!_sendToRasPi
.BB@LABEL@5_3:	; bb11
	clrw ax
	;***      137 : 		//TODO: Wait to reset
	;***      138 : 	}
	;***      139 : 	//-----------Voltage 2 check----------------
	;***      140 : 	uint16_t _time_count = 0;
	;***      141 : 	do{
	;***      142 : 		_time_count = 0;
	;***      143 : 		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	cmpw ax, !LOWW(_g_timerSetting+0x00012)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@5_4:	; bb11
	cmpw ax, !LOWW(_g_timerSetting+0x00010)
.BB@LABEL@5_5:	; bb11
	movw hl, !LOWW(_g_numberSetting+0x00006)
	movw ax, hl
	movw [sp+0x04], ax
	movw de, !LOWW(_g_numberSetting+0x00004)
	movw ax, de
	movw [sp+0x06], ax
	movw bc, !LOWW(_g_cvcc_voltge+0x00002)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_cvcc_voltge)
	movw [sp+0x0A], ax
	bnc $.BB@LABEL@5_12
.BB@LABEL@5_6:	; bb11
	push hl
	push de
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x04]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x0C]
	movw bc, ax
	movw ax, [sp+0x0E]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_7:	; bb11
	clrb a
.BB@LABEL@5_8:	; bb11
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_9:	; bb11
	clrb x
.BB@LABEL@5_10:	; bb11
	or x, a
	bnz $.BB@LABEL@5_12
.BB@LABEL@5_11:	; bb8
	;***      144 : 			_time_count++;
	;***      145 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 145
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@5_3
.BB@LABEL@5_12:	; bb25
	movw ax, [sp+0x00]
	;***      146 : 		}
	;***      147 : 		if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	cmpw ax, #0x2710
	clrw ax
	movw [sp+0x00], ax
	;***      148 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_2, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	movw de, #0x3F80
	clrw bc
	mov x, #0x03
	bz $.BB@LABEL@5_2
.BB@LABEL@5_13:	; bb40
	clrw ax
	;***      149 : 		}
	;***      150 : 	}while(_time_count == 10000);
	;***      151 : 	//-----------Voltage 3 check----------------
	;***      152 : 	_time_count = 0;
	;***      153 : 	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@5_14:	; bb40
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@5_15:	; bb40
	movw hl, !LOWW(_g_numberSetting+0x0000A)
	movw ax, hl
	movw [sp+0x04], ax
	movw de, !LOWW(_g_numberSetting+0x00008)
	movw ax, de
	movw [sp+0x06], ax
	movw bc, !LOWW(_g_cvcc_voltge+0x00002)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_cvcc_voltge)
	movw [sp+0x0A], ax
	bnc $.BB@LABEL@5_22
.BB@LABEL@5_16:	; bb40
	push hl
	push de
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x04]
	push ax
	movw ax, [sp+0x08]
	push ax
	movw ax, [sp+0x0C]
	movw bc, ax
	movw ax, [sp+0x0E]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_17:	; bb40
	clrb a
.BB@LABEL@5_18:	; bb40
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_19:	; bb40
	clrb x
.BB@LABEL@5_20:	; bb40
	or x, a
	bnz $.BB@LABEL@5_22
.BB@LABEL@5_21:	; bb37
	;***      154 : 		_time_count++;
	;***      155 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 155
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@5_13
.BB@LABEL@5_22:	; bb54
	movw ax, [sp+0x00]
	;***      156 : 	}
	;***      157 : 	if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	cmpw ax, #0x2710
	bnz $.BB@LABEL@5_24
.BB@LABEL@5_23:	; if_then_bb59
	;***      158 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_3, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	;***      159 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 159
	call $!_electrolyticOperationOFF
.BB@LABEL@5_24:	; if_break_bb60
	;***      160 : 		//TODO: Wait to reset
	;***      161 : 	}
	;***      162 : 	//----------Low voltage error--------------
	;***      163 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 163
	call $!_electrolyticOperationON
.BB@LABEL@5_25:	; bb62
	;***      164 : 	while(g_neutralization_time > 60000);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 164
	movw ax, !LOWW(_g_neutralization_time+0x00002)
	clrw bc
	cmpw ax, bc
	movw ax, !LOWW(_g_neutralization_time)
	sknz
.BB@LABEL@5_26:	; bb62
	cmpw ax, #0xEA61
.BB@LABEL@5_27:	; bb62
	bnc $.BB@LABEL@5_25
.BB@LABEL@5_28:	; bb62.bb71_crit_edge
	clrw ax
.BB@LABEL@5_29:	; bb62.bb71_crit_edge
	movw [sp+0x00], ax
	;***      165 : 	_time_count = 0;
	;***      166 : 	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	movw ax, !LOWW(_g_numberSetting+0x0000E)
	movw [sp+0x0A], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0000C)
	movw [sp+0x0A], ax
	push ax
	movw bc, !LOWW(_g_cvcc_voltge+0x00002)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_cvcc_voltge)
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
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_30:	; bb71
	clrb a
.BB@LABEL@5_31:	; bb71
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_32:	; bb71
	clrb x
.BB@LABEL@5_33:	; bb71
	or x, a
	bnz $.BB@LABEL@5_36
.BB@LABEL@5_34:	; bb71
	movw ax, [sp+0x00]
	cmpw ax, #0x2710
	bnc $.BB@LABEL@5_36
.BB@LABEL@5_35:	; bb68
	;***      167 : 		_time_count++;
	;***      168 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@5_29
.BB@LABEL@5_36:	; bb83
	movw ax, [sp+0x00]
	;***      169 : 	}
	;***      170 : 	if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
	cmpw ax, #0x2710
	bnz $.BB@LABEL@5_38
.BB@LABEL@5_37:	; if_then_bb88
	;***      171 : 		sendToRasPi(H_ALARM, UNDER_VOLTAGE, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      172 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	call $!_electrolyticOperationOFF
.BB@LABEL@5_38:	; if_break_bb89
	;***      173 : 		//TODO: Wait to reset
	;***      174 : 	}
	;***      175 : 	//----------Current Error------------------
	;***      176 : 	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
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
	bnz $.BB@LABEL@5_44
.BB@LABEL@5_39:	; if_break_bb89
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
.BB@LABEL@5_40:	; if_break_bb89
	clrb a
.BB@LABEL@5_41:	; if_break_bb89
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_42:	; if_break_bb89
	clrb x
.BB@LABEL@5_43:	; if_break_bb89
	or x, a
	bnz $.BB@LABEL@5_53
.BB@LABEL@5_44:	; if_then_bb102
	clrw ax
	movw [sp+0x00], ax
	;***      177 : 		sendToRasPi(H_ALARM, CURRENT_INVALID, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4106
	call $!_sendToRasPi
.BB@LABEL@5_45:	; bb106
	;***      178 : 		_time_count = 0;
	;***      179 : 		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
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
.BB@LABEL@5_46:	; bb106
	clrb a
.BB@LABEL@5_47:	; bb106
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_48:	; bb106
	clrb x
.BB@LABEL@5_49:	; bb106
	or x, a
	bnz $.BB@LABEL@5_52
.BB@LABEL@5_50:	; bb106
	movw ax, [sp+0x00]
	cmpw ax, #0x2710
	bnc $.BB@LABEL@5_52
.BB@LABEL@5_51:	; bb103
	;***      180 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      181 : 			_time_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@5_45
.BB@LABEL@5_52:	; bb118
	movw ax, [sp+0x00]
	;***      182 : 		}
	;***      183 : 		if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 183
	cmpw ax, #0x2710
.BB@LABEL@5_53:	; bb118
	bnz $.BB@LABEL@5_55
.BB@LABEL@5_54:	; if_then_bb123
	;***      184 : 			sendToRasPi(H_ALARM, OVER_CURRENT, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      185 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	addw sp, #0x0C
	br $!_electrolyticOperationOFF
.BB@LABEL@5_55:	; return
	;***      186 : 			//TODO: Wait to reset
	;***      187 : 		}
	;***      188 : 	}
	;***      189 : 
	;***      190 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 190
	addw sp, #0x0C
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      191 : void solenoidCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
	subw sp, #0x04
	;***      192 : 	uint32_t _time_count = 0;
	;***      193 : 	if((g_flow_value <= 0.1f)&(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 193
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
	bnz $.BB@LABEL@6_3
.BB@LABEL@6_1:	; entry
	bc $.BB@LABEL@6_3
.BB@LABEL@6_2:	; entry
	movw ax, #0x3DCC
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, de
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@6_4
.BB@LABEL@6_3:	; entry.if_break_bb_crit_edge
	clrw ax
	movw [sp+0x02], ax
	movw [sp+0x00], ax
	br $.BB@LABEL@6_5
.BB@LABEL@6_4:	; if_then_bb
	onew ax
	movw [sp+0x02], ax
	decw ax
	movw [sp+0x00], ax
	;***      194 : 		_time_count++;
	;***      195 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@6_5:	; if_break_bb
	;***      196 : 	}
	;***      197 : 	if(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
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
.BB@LABEL@6_6:	; if_break_bb
	cmpw ax, de
.BB@LABEL@6_7:	; if_break_bb
	addw sp, #0x04
	bnz $.BB@LABEL@6_9
.BB@LABEL@6_8:	; if_then_bb20
	;***      198 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4108
	br $!_sendToRasPi
.BB@LABEL@6_9:	; return
	;***      199 : 	}
	;***      200 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	ret
_main_20211111:
	.STACK _main_20211111 = 4
	;***      201 : void main_20211111(void){
	;***      202 : 	InitialOperationModeStart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	call $!_InitialOperationModeStart
	;***      203 : 	WaterSupplyOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 203
	call $!_WaterSupplyOperation
.BB@LABEL@7_1:	; bb
	;***      204 : 	do{
	;***      205 : 		ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 205
	call $!_ElectrolyticOperation
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	and a, 0xFFF07
	xor a, #0x01
	mov x, a
	mov a, 0xFFF07
	shr a, 0x03
	and a, #0x01
	xor a, #0x01
	or a, x
	bnz $.BB@LABEL@7_1
.BB@LABEL@7_2:	; bb15
	;***      206 : 	}while((I_ALKALI_H_PIN == 0U)|(I_ACID_H_PIN == 0U));
	;***      207 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 207
	call $!_electrolyticOperationOFF
	;***      208 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 208
	set1 0xFFF0E.2
	;***      209 : 	O_PUMP_SALT_PIN = OFF; 		//SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 209
	clr1 0xFFF06.0
	;***      210 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	mov a, #0x05
	call !!_delay
	;***      211 : 	O_SUPPLY_WATER_PIN = OFF;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 211
	clr1 0xFFF01.7
	ret
_waitReset:
	.STACK _waitReset = 4
.BB@LABEL@8_1:	; bb1
	;***      212 : }
	;***      213 : 
	;***      214 : void waitReset(void){
	;***      215 : 	while(g_error != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	movw ax, !LOWW(_g_error)
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@8_3
.BB@LABEL@8_2:	; bb
	;***      216 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	call !!_R_WDT_Restart
	br $.BB@LABEL@8_1
.BB@LABEL@8_3:	; return
	;***      217 : 	}
	;***      218 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	ret
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      219 : void electrolyticOperationON(void){
	;***      220 : 	//Electrolytic operation ON
	;***      221 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	set1 0xFFF0E.2
	;***      222 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	set1 0xFFF06.0
	;***      223 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	oneb !LOWW(_g_electrolytic_flag)
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      224 : }
	;***      225 : void electrolyticOperationOFF(void){
	;***      226 : 	//Electrolytic operation OFF
	;***      227 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	clr1 0xFFF0E.2
	;***      228 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	clr1 0xFFF06.0
	;***      229 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	clrb !LOWW(_g_electrolytic_flag)
	ret
_overVoltage1Error:
	.STACK _overVoltage1Error = 4
	;***      230 : }
	;***      231 : void overVoltage1Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	ret
_overVoltage2Error:
	.STACK _overVoltage2Error = 4
	;***      232 : 
	;***      233 : }
	;***      234 : void overVoltage2Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 234
	ret
_overVoltage3Error:
	.STACK _overVoltage3Error = 16
	;***      235 : 
	;***      236 : }
	;***      237 : void overVoltage3Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	subw sp, #0x08
	clrw ax
.BB@LABEL@13_1:	; entry
	movw [sp+0x00], ax
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
	movw [sp+0x0A], ax
	movw !LOWW(_g_cvcc_voltge), ax
	movw ax, bc
	movw [sp+0x08], ax
	movw !LOWW(_g_cvcc_voltge+0x00002), ax
	addw sp, #0x04
	movw ax, #0x4000
	;***      238 : 	uint16_t _time_count = 0;
	;***      239 : 
	;***      240 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	;***      241 : 	_time_count = 0;
	;***      242 : 	while((g_cvcc_voltge < 2.0)&(_time_count < 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 242
	push ax
	clrb a
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, #0x4000
	push ax
	clrb a
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_fge
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@13_2:	; bb9
	clrb a
.BB@LABEL@13_3:	; bb9
	cmp0 x
	oneb x
	sknz
.BB@LABEL@13_4:	; bb9
	clrb x
.BB@LABEL@13_5:	; bb9
	or x, a
	bnz $.BB@LABEL@13_8
.BB@LABEL@13_6:	; bb9
	movw ax, [sp+0x00]
	cmpw ax, #0x03E8
	bnc $.BB@LABEL@13_8
.BB@LABEL@13_7:	; bb
	;***      243 : 		_time_count++;
	;***      244 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      245 : 		g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 245
	incw ax
	br $.BB@LABEL@13_1
.BB@LABEL@13_8:	; bb19
	movw ax, [sp+0x00]
	;***      246 : 	}
	;***      247 : 	if(_time_count == 1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	cmpw ax, #0x03E8
	bnz $.BB@LABEL@13_10
.BB@LABEL@13_9:	; if_then_bb
	onew ax
	;***      248 : 		//Alarm
	;***      249 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	movw !LOWW(_g_error), ax
	;***      250 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	call $!_electrolyticOperationOFF
	;***      251 : 		waitReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	addw sp, #0x08
	br $!_waitReset
.BB@LABEL@13_10:	; return
	;***      252 : 	}
	;***      253 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
	addw sp, #0x08
	ret
_lowVoltageError:
	.STACK _lowVoltageError = 16
	;***      254 : void lowVoltageError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	subw sp, #0x08
	;***      255 : 	uint16_t _time_count;
	;***      256 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	set1 0xFFF01.7
	;***      257 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
	set1 0xFFF0E.2
	;***      258 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	set1 0xFFF06.0
	;***      259 : 	delay(60);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
	mov a, #0x3C
	call !!_delay
	clrw ax
.BB@LABEL@14_1:	; entry
	movw [sp+0x00], ax
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
	movw [sp+0x0A], ax
	movw !LOWW(_g_cvcc_voltge), ax
	movw ax, bc
	movw [sp+0x08], ax
	movw !LOWW(_g_cvcc_voltge+0x00002), ax
	addw sp, #0x04
	movw ax, #0x3E4C
	;***      260 : 
	;***      261 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	;***      262 : 	_time_count = 0;
	;***      263 : 	while((g_cvcc_voltge < 0.2)&(_time_count < 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, #0x3E4C
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, [sp+0x08]
	movw bc, ax
	movw ax, [sp+0x0A]
	call !!__COM_fge
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@14_2:	; bb9
	clrb a
.BB@LABEL@14_3:	; bb9
	cmp0 x
	oneb x
	sknz
.BB@LABEL@14_4:	; bb9
	clrb x
.BB@LABEL@14_5:	; bb9
	or x, a
	bnz $.BB@LABEL@14_8
.BB@LABEL@14_6:	; bb9
	movw ax, [sp+0x00]
	cmpw ax, #0x03E8
	bnc $.BB@LABEL@14_8
.BB@LABEL@14_7:	; bb
	;***      264 : 		_time_count++;
	;***      265 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      266 : 		g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 266
	incw ax
	br $.BB@LABEL@14_1
.BB@LABEL@14_8:	; bb19
	movw ax, [sp+0x00]
	;***      267 : 	}
	;***      268 : 	if(_time_count == 1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 268
	cmpw ax, #0x03E8
	bnz $.BB@LABEL@14_10
.BB@LABEL@14_9:	; if_then_bb
	onew ax
	;***      269 : 		//Alarm
	;***      270 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
	movw !LOWW(_g_error), ax
	;***      271 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 271
	addw sp, #0x08
	br $!_electrolyticOperationOFF
.BB@LABEL@14_10:	; return
	;***      272 : 	}
	;***      273 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	addw sp, #0x08
	ret
_currentError:
	.STACK _currentError = 18
	;***      274 : void currentError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 274
	subw sp, #0x0A
	;***      275 : 	uint16_t _time_count;
	;***      276 : 	g_cvcc_current = (float)g_adc_value[0]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	movw ax, !LOWW(_g_adc_value)
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
	movw !LOWW(_g_cvcc_current+0x00002), ax
	movw ax, [sp+0x02]
	movw !LOWW(_g_cvcc_current), ax
	;***      277 : 	if((g_cvcc_current<g_numberSetting.lowerCurrent)|(g_cvcc_current>g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	movw ax, !LOWW(_g_numberSetting+0x00012)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fgt
	addw sp, #0x04
	cmp0 a
	movw bc, !LOWW(_g_numberSetting+0x00016)
	movw ax, !LOWW(_g_numberSetting+0x00014)
	bnz $.BB@LABEL@15_2
.BB@LABEL@15_1:	; entry
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_flt
	addw sp, #0x04
	cmp0 a
	skz
.BB@LABEL@15_2:	; if_then_bb
	;***      278 : 		//Alarm
	;***      279 : 		g_alarm = CURRENT_INVALID;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 279
	mov !LOWW(_g_alarm), #0x06
.BB@LABEL@15_3:	; bb20
	;***      280 : 	}
	;***      281 : 	while((g_cvcc_current<g_numberSetting.lowerCurrent)|(g_cvcc_current>g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 281
	movw ax, !LOWW(_g_numberSetting+0x00012)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fgt
	addw sp, #0x04
	cmp0 a
	movw bc, !LOWW(_g_numberSetting+0x00016)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_numberSetting+0x00014)
	movw [sp+0x06], ax
	bnz $.BB@LABEL@15_9
.BB@LABEL@15_4:	; bb20
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
.BB@LABEL@15_5:	; bb20
	clrb a
.BB@LABEL@15_6:	; bb20
	cmp0 x
	oneb x
	sknz
.BB@LABEL@15_7:	; bb20
	clrb x
.BB@LABEL@15_8:	; bb20
	or x, a
	bnz $.BB@LABEL@15_10
.BB@LABEL@15_9:	; bb
	;***      282 : 		_time_count++;
	;***      283 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      284 : 		g_cvcc_current = (float)g_adc_value[0]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	movw ax, !LOWW(_g_adc_value)
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
	movw !LOWW(_g_cvcc_current), ax
	movw ax, bc
	movw [sp+0x04], ax
	movw !LOWW(_g_cvcc_current+0x00002), ax
	addw sp, #0x04
	br $.BB@LABEL@15_3
.BB@LABEL@15_10:	; bb33
	onew ax
	;***      285 : 	}
	;***      286 : 	if(_time_count == 6000){
	;***      287 : 		//Alarm
	;***      288 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	movw !LOWW(_g_error), ax
	;***      289 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
	call $!_electrolyticOperationOFF
	;***      290 : 		waitReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	addw sp, #0x0A
	br $!_waitReset
_solenoidValueError:
	.STACK _solenoidValueError = 4
	;***      291 : 	}
	;***      292 : }
	;***      293 : void solenoidValueError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	ret
_callAlarm:
	.STACK _callAlarm = 4
	;***      294 : 
	;***      295 : }
	;***      296 : void callAlarm(int _error){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
	movw !LOWW(_g_error), ax
	;***      297 : 	g_error = _error;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 26
	;***      298 : }
	;***      299 : float measureFlowSensor(uint32_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	push bc
	push ax
	subw sp, #0x0E
	;***      300 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 300
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
.BB@LABEL@18_1:	; bb28
	movw ax, [sp+0x0E]
	;***      301 : 	float flow_pluse = 0.0;
	;***      302 : 	uint8_t flow_pulse_state = 1;
	;***      303 : 	while(!ns_delay_ms(&stamp_flow_sensor, (s*1000))){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
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
	bnz $.BB@LABEL@18_7
.BB@LABEL@18_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      304 : 		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@18_6
.BB@LABEL@18_3:	; if_then_bb
	;***      305 : 			if(I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@18_5
.BB@LABEL@18_4:	; if_then_bb21
	movw ax, #0x3F80
	;***      306 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 306
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
.BB@LABEL@18_5:	; if_break_bb
	;***      307 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@18_6:	; if_break_bb27
	;***      308 : 		}
	;***      309 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	call !!_R_WDT_Restart
	br $.BB@LABEL@18_1
.BB@LABEL@18_7:	; bb40
	movw ax, #0x3F33
	;***      310 : 	}
	;***      311 : 	float flow_value = (flow_pluse*0.7*60)/(1000*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
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
	;***      312 : 	return flow_value;
	;***      313 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	addw sp, #0x16
	ret
	;***      314 : 
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
	.ALIGN 2
_g_neutralization_time:
	.DS (4)
_g_electrolytic_flag:
	.DS (1)
	.SECTION .bss,BSS
	.ALIGN 2
_g_numberSetting:
	.DS (32)
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
