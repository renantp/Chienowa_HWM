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
#@  compiled at Mon Nov 22 14:17:12 2021

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
	movw ax, #0x4080
	movw !LOWW(_g_numberSetting+0x00016), ax
	movw ax, #0x3F99
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 40
	movw !LOWW(_g_numberSetting+0x0001A), ax
	movw ax, #0x3E4C
	;***       41 : 	g_numberSetting.lowerFlow = 0.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 41
	movw !LOWW(_g_numberSetting+0x0001E), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x0001C), ax
	ret
_sendToRasPi:
	.STACK _sendToRasPi = 10
	;***       42 : }
	;***       43 : #ifdef RENAN_CODE
	;***       44 : void renanCode(void){
	;***       45 : 	//Power On Mode
	;***       46 : 	O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	;***       47 : 	O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	;***       48 : 	do{
	;***       49 : 		O_DRAIN_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:O_DRAIN_ACID_PIN;	// Turn on SV5 if ACID tank empty
	;***       50 : 		O_DRAIN_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:O_DRAIN_ALK_PIN;	// Turn on SV6 if ALK tank empty
	;***       51 : 		O_PUMP_ACID_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on P1 if SV5 is open
	;***       52 : 		O_PUMP_ALK_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on P2 if SV6 is open
	;***       53 : 		R_WDT_Restart();
	;***       54 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***       55 : 	delay_ms(st[0]); // 0.2 ~ 1.0 seconds to prevent water hammer
	;***       56 : 	O_DRAIN_ACID_PIN = O_DRAIN_ALK_PIN = OFF;	// Turn on SV5 if ACID tank empty. Turn on SV6 if ALK tank empty
	;***       57 : 
	;***       58 : 	// Drainage operation
	;***       59 : 	O_SPOUT_WATER_PIN = ON;	// SV2 On
	;***       60 : 	delay(st[1]);			// Default 30 seconds
	;***       61 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	;***       62 : 	delay_ms(500);
	;***       63 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	;***       64 : }
	;***       65 : 
	;***       66 : 
	;***       67 : void code_20211029(void){
	;***       68 : 	//---------------Electrolytic operation-----------------------------
	;***       69 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	;***       70 : 	O_CVCC_ON_PIN = ON;
	;***       71 : 	O_PUMP_SALT_PIN = ON; //SP1
	;***       72 : 	delay(10);
	;***       73 : 	//TODO: Neutralization timer On
	;***       74 : 
	;***       75 : 	overVoltage1Error();
	;***       76 : }
	;***       77 : #endif
	;***       78 : //----------------------Begin code 11112021--------------------------------------
	;***       79 : void sendToRasPi(enum UART_header_e head, enum Control_header type, float value){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 79
	push hl
	push ax
	movw ax, bc
	push de
	pop bc
	;***       80 : 	uint8_t state = g_uart2_send;
	;***       81 : 	g_control_buffer.head = head;
	;***       82 : 	g_control_buffer.set_number = type;
	;***       83 : 	g_control_buffer.set_value = value;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 83
	call !!__COM_ftoul
	movw !LOWW(_g_control_buffer+0x00002), ax
	movw ax, bc
	movw !LOWW(_g_control_buffer+0x00004), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 80
	mov a, !LOWW(_g_uart2_send)
	mov [sp+0x02], a
	mov a, [sp+0x01]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 81
	mov !LOWW(_g_control_buffer), a
	mov a, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 82
	mov !LOWW(_g_control_buffer+0x00001), a
	;***       84 : 	R_UART2_Send((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 84
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Send
.BB@LABEL@2_1:	; bb10
	mov a, [sp+0x02]
	;***       85 : 	while(state == g_uart2_send);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 85
	cmp a, !LOWW(_g_uart2_send)
	bz $.BB@LABEL@2_1
.BB@LABEL@2_2:	; return
	;***       86 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 86
	addw sp, #0x04
	ret
_InitialOperationModeStart:
	.STACK _InitialOperationModeStart = 4
	;***       87 : void InitialOperationModeStart(void){
	;***       88 : 	OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OFF;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 88
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
	;***       89 : 	OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OFF;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 89
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
	;***       90 : 	do{
	;***       91 : 		OPTION_1_PIN = I_ACID_L_PIN == I_ON ? ON:OPTION_1_PIN;	// Turn on SV5 if ACID tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 91
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
	;***       92 : 		OPTION_2_PIN = I_ALKALI_L_PIN == I_ON ? ON:OPTION_2_PIN;	// Turn on SV6 if ALK tank empty
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 92
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
	;***       93 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 93
	call !!_R_WDT_Restart
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 90
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
	;***       94 : 	}while((I_ACID_L_PIN == I_ON)|(I_ALKALI_L_PIN == I_ON));
	;***       95 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 95
	ret
_WaterSupplyOperation:
	.STACK _WaterSupplyOperation = 18
	;***       96 : void WaterSupplyOperation(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 96
	subw sp, #0x0A
	;***       97 : 	O_SPOUT_WATER_PIN = ON;		// SV2 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 97
	set1 0xFFF05.5
	;***       98 : 	delay(30);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 98
	mov a, #0x1E
	call !!_delay
	;***       99 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 99
	set1 0xFFF01.7
	;***      100 : 	delay_ms(500);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 100
	clrw bc
	movw ax, #0x01F4
	call !!_delay_ms
	;***      101 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 101
	clr1 0xFFF05.5
.BB@LABEL@4_1:	; bb
	;***      102 : 	do{
	;***      103 : 		delay(15);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 103
	mov a, #0x0F
	call !!_delay
	;***      104 : 		g_flow_value = measureFlowSensor(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 104
	clrw bc
	movw ax, #0x0005
	call $!_measureFlowSensor
	movw [sp+0x02], ax
	movw !LOWW(_g_flow_value), ax
	movw ax, bc
	movw [sp+0x00], ax
	movw !LOWW(_g_flow_value+0x00002), ax
	;***      105 : 		if((g_flow_value < g_numberSetting.upperFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 105
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
	;***      106 : 				&(g_flow_value > g_numberSetting.lowerFlow)){
	;***      107 : 			break;
	;***      108 : 		}else{
	;***      109 : 			g_alarm = FLOW_SENSOR_ERROR;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 109
	oneb !LOWW(_g_alarm)
	;***      110 : 			sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 110
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4101
	call $!_sendToRasPi
.BB@LABEL@4_8:	; bb15
	;***      111 : 			while(g_control_buffer.set_value != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 111
	movw bc, !LOWW(_g_control_buffer+0x00004)
	movw ax, !LOWW(_g_control_buffer+0x00002)
	addw ax, bc
	sknz
.BB@LABEL@4_9:	; bb15
	bnc $.BB@LABEL@4_11
.BB@LABEL@4_10:	; bb13
	;***      112 : 				R_UART2_Receive((uint8_t *)&g_control_buffer, sizeof(struct UART_Buffer_s));
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 112
	movw bc, #0x0006
	movw ax, #LOWW(_g_control_buffer)
	call !!_R_UART2_Receive
	;***      113 : 				R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 113
	call !!_R_WDT_Restart
	br $.BB@LABEL@4_8
.BB@LABEL@4_11:	; bb20
	;***      114 : 			}
	;***      115 : 			g_alarm = OK;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 115
	clrb !LOWW(_g_alarm)
	br $!.BB@LABEL@4_1
.BB@LABEL@4_12:	; bb22
	;***      116 : 		}
	;***      117 : 	}while(1);
	;***      118 : 	delay(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 118
	mov a, #0x0A
	addw sp, #0x0A
	br !!_delay
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 20
	;***      119 : }
	;***      120 : void ElectrolyticOperation(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 120
	subw sp, #0x0C
	;***      121 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 121
	set1 0xFFF01.7
	;***      122 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 122
	set1 0xFFF0E.2
	;***      123 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 123
	set1 0xFFF06.0
	clrw ax
	movw [sp+0x00], ax
	;***      124 : 	//-----------Voltage 1 check----------------
	;***      125 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 125
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
	;***      126 : 	if(g_cvcc_voltge>=g_numberSetting.upperVoltage1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 126
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
	;***      127 : 		//Alarm
	;***      128 : 		g_alarm = OVER_VOLTAGE_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 128
	mov !LOWW(_g_alarm), #0x02
	;***      129 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	call $!_electrolyticOperationOFF
	clrw ax
	movw [sp+0x00], ax
	;***      130 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	movw de, #0x3F80
	clrw bc
	mov x, #0x02
.BB@LABEL@5_2:	; if_then_bb
	mov a, #0x41
	call $!_sendToRasPi
.BB@LABEL@5_3:	; bb11
	clrw ax
	;***      131 : 		//TODO: Wait to reset
	;***      132 : 	}
	;***      133 : 	//-----------Voltage 2 check----------------
	;***      134 : 	uint16_t _time_count = 0;
	;***      135 : 	do{
	;***      136 : 		_time_count = 0;
	;***      137 : 		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 137
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
	;***      138 : 			_time_count++;
	;***      139 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 139
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@5_3
.BB@LABEL@5_12:	; bb25
	movw ax, [sp+0x00]
	;***      140 : 		}
	;***      141 : 		if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
	cmpw ax, #0x2710
	clrw ax
	movw [sp+0x00], ax
	;***      142 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_2, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 142
	movw de, #0x3F80
	clrw bc
	mov x, #0x03
	bz $.BB@LABEL@5_2
.BB@LABEL@5_13:	; bb40
	clrw ax
	;***      143 : 		}
	;***      144 : 	}while(_time_count == 10000);
	;***      145 : 	//-----------Voltage 3 check----------------
	;***      146 : 	_time_count = 0;
	;***      147 : 	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
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
	;***      148 : 		_time_count++;
	;***      149 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@5_13
.BB@LABEL@5_22:	; bb54
	movw ax, [sp+0x00]
	;***      150 : 	}
	;***      151 : 	if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 151
	cmpw ax, #0x2710
	bnz $.BB@LABEL@5_24
.BB@LABEL@5_23:	; if_then_bb59
	;***      152 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_3, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	;***      153 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	call $!_electrolyticOperationOFF
.BB@LABEL@5_24:	; if_break_bb60
	;***      154 : 		//TODO: Wait to reset
	;***      155 : 	}
	;***      156 : 	//----------Low voltage error--------------
	;***      157 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	call $!_electrolyticOperationON
.BB@LABEL@5_25:	; bb62
	;***      158 : 	while(g_neutralization_time > 60000);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
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
	;***      159 : 	_time_count = 0;
	;***      160 : 	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
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
	;***      161 : 		_time_count++;
	;***      162 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@5_29
.BB@LABEL@5_36:	; bb83
	movw ax, [sp+0x00]
	;***      163 : 	}
	;***      164 : 	if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 164
	cmpw ax, #0x2710
	bnz $.BB@LABEL@5_38
.BB@LABEL@5_37:	; if_then_bb88
	;***      165 : 		sendToRasPi(H_ALARM, UNDER_VOLTAGE, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 165
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      166 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	call $!_electrolyticOperationOFF
.BB@LABEL@5_38:	; if_break_bb89
	;***      167 : 		//TODO: Wait to reset
	;***      168 : 	}
	;***      169 : 	//----------Current Error------------------
	;***      170 : 	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
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
	;***      171 : 		sendToRasPi(H_ALARM, CURRENT_INVALID, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4106
	call $!_sendToRasPi
.BB@LABEL@5_45:	; bb106
	;***      172 : 		_time_count = 0;
	;***      173 : 		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 173
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
	;***      174 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      175 : 			_time_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@5_45
.BB@LABEL@5_52:	; bb118
	movw ax, [sp+0x00]
	;***      176 : 		}
	;***      177 : 		if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 177
	cmpw ax, #0x2710
.BB@LABEL@5_53:	; bb118
	bnz $.BB@LABEL@5_55
.BB@LABEL@5_54:	; if_then_bb123
	;***      178 : 			sendToRasPi(H_ALARM, OVER_CURRENT, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 178
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      179 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
	addw sp, #0x0C
	br $!_electrolyticOperationOFF
.BB@LABEL@5_55:	; return
	;***      180 : 			//TODO: Wait to reset
	;***      181 : 		}
	;***      182 : 	}
	;***      183 : 
	;***      184 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	addw sp, #0x0C
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      185 : void solenoidCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	subw sp, #0x04
	;***      186 : 	uint32_t _time_count = 0;
	;***      187 : 	if((g_flow_value <= 0.1f)&(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 187
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
	;***      188 : 		_time_count++;
	;***      189 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 189
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@6_5:	; if_break_bb
	;***      190 : 	}
	;***      191 : 	if(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
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
	;***      192 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 192
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4108
	br $!_sendToRasPi
.BB@LABEL@6_9:	; return
	;***      193 : 	}
	;***      194 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	ret
_main_20211111:
	.STACK _main_20211111 = 4
	;***      195 : void main_20211111(void){
	;***      196 : 	InitialOperationModeStart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	call $!_InitialOperationModeStart
	;***      197 : 	WaterSupplyOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
	call $!_WaterSupplyOperation
.BB@LABEL@7_1:	; bb
	;***      198 : 	do{
	;***      199 : 		ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 199
	call $!_ElectrolyticOperation
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
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
	;***      200 : 	}while((I_ALKALI_H_PIN == 0U)|(I_ACID_H_PIN == 0U));
	;***      201 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 201
	call $!_electrolyticOperationOFF
	;***      202 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	set1 0xFFF0E.2
	;***      203 : 	O_PUMP_SALT_PIN = OFF; 		//SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 203
	clr1 0xFFF06.0
	;***      204 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	mov a, #0x05
	call !!_delay
	;***      205 : 	O_SUPPLY_WATER_PIN = OFF;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 205
	clr1 0xFFF01.7
	ret
_waitReset:
	.STACK _waitReset = 4
.BB@LABEL@8_1:	; bb1
	;***      206 : }
	;***      207 : 
	;***      208 : void waitReset(void){
	;***      209 : 	while(g_error != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 209
	movw ax, !LOWW(_g_error)
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@8_3
.BB@LABEL@8_2:	; bb
	;***      210 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	call !!_R_WDT_Restart
	br $.BB@LABEL@8_1
.BB@LABEL@8_3:	; return
	;***      211 : 	}
	;***      212 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	ret
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      213 : void electrolyticOperationON(void){
	;***      214 : 	//Electrolytic operation ON
	;***      215 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 215
	set1 0xFFF0E.2
	;***      216 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	set1 0xFFF06.0
	;***      217 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 217
	oneb !LOWW(_g_electrolytic_flag)
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      218 : }
	;***      219 : void electrolyticOperationOFF(void){
	;***      220 : 	//Electrolytic operation OFF
	;***      221 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	clr1 0xFFF0E.2
	;***      222 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	clr1 0xFFF06.0
	;***      223 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	clrb !LOWW(_g_electrolytic_flag)
	ret
_overVoltage1Error:
	.STACK _overVoltage1Error = 4
	;***      224 : }
	;***      225 : void overVoltage1Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	ret
_overVoltage2Error:
	.STACK _overVoltage2Error = 4
	;***      226 : 
	;***      227 : }
	;***      228 : void overVoltage2Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	ret
_overVoltage3Error:
	.STACK _overVoltage3Error = 16
	;***      229 : 
	;***      230 : }
	;***      231 : void overVoltage3Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
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
	;***      232 : 	uint16_t _time_count = 0;
	;***      233 : 
	;***      234 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	;***      235 : 	_time_count = 0;
	;***      236 : 	while((g_cvcc_voltge < 2.0)&(_time_count < 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
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
	;***      237 : 		_time_count++;
	;***      238 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 238
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      239 : 		g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
	incw ax
	br $.BB@LABEL@13_1
.BB@LABEL@13_8:	; bb19
	movw ax, [sp+0x00]
	;***      240 : 	}
	;***      241 : 	if(_time_count == 1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	cmpw ax, #0x03E8
	bnz $.BB@LABEL@13_10
.BB@LABEL@13_9:	; if_then_bb
	onew ax
	;***      242 : 		//Alarm
	;***      243 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 243
	movw !LOWW(_g_error), ax
	;***      244 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	call $!_electrolyticOperationOFF
	;***      245 : 		waitReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 245
	addw sp, #0x08
	br $!_waitReset
.BB@LABEL@13_10:	; return
	;***      246 : 	}
	;***      247 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	addw sp, #0x08
	ret
_lowVoltageError:
	.STACK _lowVoltageError = 16
	;***      248 : void lowVoltageError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 248
	subw sp, #0x08
	;***      249 : 	uint16_t _time_count;
	;***      250 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	set1 0xFFF01.7
	;***      251 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	set1 0xFFF0E.2
	;***      252 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 252
	set1 0xFFF06.0
	;***      253 : 	delay(60);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 253
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
	;***      254 : 
	;***      255 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	;***      256 : 	_time_count = 0;
	;***      257 : 	while((g_cvcc_voltge < 0.2)&(_time_count < 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
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
	;***      258 : 		_time_count++;
	;***      259 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 259
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      260 : 		g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 260
	incw ax
	br $.BB@LABEL@14_1
.BB@LABEL@14_8:	; bb19
	movw ax, [sp+0x00]
	;***      261 : 	}
	;***      262 : 	if(_time_count == 1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	cmpw ax, #0x03E8
	bnz $.BB@LABEL@14_10
.BB@LABEL@14_9:	; if_then_bb
	onew ax
	;***      263 : 		//Alarm
	;***      264 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	movw !LOWW(_g_error), ax
	;***      265 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	addw sp, #0x08
	br $!_electrolyticOperationOFF
.BB@LABEL@14_10:	; return
	;***      266 : 	}
	;***      267 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 267
	addw sp, #0x08
	ret
_currentError:
	.STACK _currentError = 18
	;***      268 : void currentError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 268
	subw sp, #0x0A
	;***      269 : 	uint16_t _time_count;
	;***      270 : 	g_cvcc_current = (float)g_adc_value[0]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
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
	;***      271 : 	if((g_cvcc_current<g_numberSetting.lowerCurrent)|(g_cvcc_current>g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 271
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
	;***      272 : 		//Alarm
	;***      273 : 		g_alarm = CURRENT_INVALID;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	mov !LOWW(_g_alarm), #0x06
.BB@LABEL@15_3:	; bb20
	;***      274 : 	}
	;***      275 : 	while((g_cvcc_current<g_numberSetting.lowerCurrent)|(g_cvcc_current>g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
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
	;***      276 : 		_time_count++;
	;***      277 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      278 : 		g_cvcc_current = (float)g_adc_value[0]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 278
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
	;***      279 : 	}
	;***      280 : 	if(_time_count == 6000){
	;***      281 : 		//Alarm
	;***      282 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	movw !LOWW(_g_error), ax
	;***      283 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	call $!_electrolyticOperationOFF
	;***      284 : 		waitReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 284
	addw sp, #0x0A
	br $!_waitReset
_solenoidValueError:
	.STACK _solenoidValueError = 4
	;***      285 : 	}
	;***      286 : }
	;***      287 : void solenoidValueError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	ret
_callAlarm:
	.STACK _callAlarm = 4
	;***      288 : 
	;***      289 : }
	;***      290 : void callAlarm(int _error){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	movw !LOWW(_g_error), ax
	;***      291 : 	g_error = _error;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 26
	;***      292 : }
	;***      293 : float measureFlowSensor(uint32_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	push bc
	push ax
	subw sp, #0x0E
	;***      294 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
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
	;***      295 : 	float flow_pluse = 0.0;
	;***      296 : 	uint8_t flow_pulse_state = 1;
	;***      297 : 	while(!ns_delay_ms(&stamp_flow_sensor, (s*1000))){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
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
	;***      298 : 		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 298
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@18_6
.BB@LABEL@18_3:	; if_then_bb
	;***      299 : 			if(I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@18_5
.BB@LABEL@18_4:	; if_then_bb21
	movw ax, #0x3F80
	;***      300 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 300
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
	;***      301 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@18_6:	; if_break_bb27
	;***      302 : 		}
	;***      303 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	call !!_R_WDT_Restart
	br $.BB@LABEL@18_1
.BB@LABEL@18_7:	; bb40
	movw ax, #0x3F33
	;***      304 : 	}
	;***      305 : 	float flow_value = (flow_pluse*0.7*60)/(1000*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
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
	;***      306 : 	return flow_value;
	;***      307 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 307
	addw sp, #0x16
	ret
	;***      308 : 
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
