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
#@  compiled at Mon Nov 22 10:16:12 2021

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
	;***       26 : alarm_t g_alarm;
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
	movw !LOWW(_g_numberSetting+0x00014), ax
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
	movw !LOWW(_g_numberSetting+0x0000E), ax
	clrw ax
	movw !LOWW(_g_numberSetting+0x0000C), ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 39
	movw !LOWW(_g_numberSetting+0x00010), ax
	movw ax, #0x4080
	movw !LOWW(_g_numberSetting+0x00012), ax
	movw ax, #0x3F99
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 40
	movw !LOWW(_g_numberSetting+0x00016), ax
	movw ax, #0x3E4C
	;***       41 : 	g_numberSetting.lowerFlow = 0.2;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 41
	movw !LOWW(_g_numberSetting+0x0001A), ax
	movw ax, #0xCCCD
	movw !LOWW(_g_numberSetting+0x00018), ax
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
	;***       79 : void sendToRasPi(enum UART_header_e head, alarm_t type, float value){
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
	movw ax, !LOWW(_g_numberSetting+0x0001A)
	movw [sp+0x06], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00018)
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
	movw bc, !LOWW(_g_numberSetting+0x00016)
	movw ax, !LOWW(_g_numberSetting+0x00014)
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
	;***      131 : 		//TODO: Wait to reset
	;***      132 : 	}
	;***      133 : 	//-----------Voltage 2 check----------------
	;***      134 : 	uint16_t _time_count = 0;
	;***      135 : 	do{
	;***      136 : 		_time_count = 0;
	;***      137 : 		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 137
	movw ax, !LOWW(_g_numberSetting+0x00006)
	movw [sp+0x04], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00004)
	movw [sp+0x0C], ax
	push ax
	movw bc, !LOWW(_g_cvcc_voltge+0x00002)
	movw ax, bc
	movw [sp+0x0A], ax
	movw ax, !LOWW(_g_cvcc_voltge)
	movw [sp+0x0C], ax
	call !!__COM_funordered
	mov [sp+0x06], a
	addw sp, #0x04
	movw ax, [sp+0x04]
	push ax
	movw ax, [sp+0x0C]
	push ax
	movw ax, [sp+0x0A]
	movw bc, ax
	movw ax, [sp+0x0C]
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_4:	; bb11
	clrb a
.BB@LABEL@5_5:	; bb11
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_6:	; bb11
	clrb x
.BB@LABEL@5_7:	; bb11
	or x, a
	bnz $.BB@LABEL@5_10
.BB@LABEL@5_8:	; bb11
	movw ax, [sp+0x00]
	cmpw ax, #0x2710
	bnc $.BB@LABEL@5_10
.BB@LABEL@5_9:	; bb8
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
.BB@LABEL@5_10:	; bb23
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
.BB@LABEL@5_11:	; bb38
	;***      143 : 		}
	;***      144 : 	}while(_time_count == 10000);
	;***      145 : 	//-----------Voltage 3 check----------------
	;***      146 : 	_time_count = 0;
	;***      147 : 	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	movw ax, !LOWW(_g_numberSetting+0x0000A)
	movw [sp+0x0A], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x00008)
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
	call !!__COM_flt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@5_12:	; bb38
	clrb a
.BB@LABEL@5_13:	; bb38
	cmp0 x
	oneb x
	sknz
.BB@LABEL@5_14:	; bb38
	clrb x
.BB@LABEL@5_15:	; bb38
	or x, a
	bnz $.BB@LABEL@5_18
.BB@LABEL@5_16:	; bb38
	movw ax, [sp+0x00]
	cmpw ax, #0x2710
	bnc $.BB@LABEL@5_18
.BB@LABEL@5_17:	; bb35
	;***      148 : 		_time_count++;
	;***      149 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 149
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@5_11
.BB@LABEL@5_18:	; bb50
	movw ax, [sp+0x00]
	;***      150 : 	}
	;***      151 : 	if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 151
	cmpw ax, #0x2710
	bnz $.BB@LABEL@5_20
.BB@LABEL@5_19:	; if_then_bb55
	;***      152 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_3, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	;***      153 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	call $!_electrolyticOperationOFF
.BB@LABEL@5_20:	; if_break_bb56
	;***      154 : 		//TODO: Wait to reset
	;***      155 : 	}
	;***      156 : 	//----------Low voltage error--------------
	;***      157 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 157
	addw sp, #0x0C
	br $_electrolyticOperationON
_main_20211111:
	.STACK _main_20211111 = 4
	;***      158 : }
	;***      159 : void main_20211111(void){
	;***      160 : 	InitialOperationModeStart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	call $!_InitialOperationModeStart
	;***      161 : 	WaterSupplyOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 161
	call $!_WaterSupplyOperation
	;***      162 : 	ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	br $!_ElectrolyticOperation
_waitReset:
	.STACK _waitReset = 4
.BB@LABEL@7_1:	; bb1
	;***      163 : }
	;***      164 : 
	;***      165 : void waitReset(void){
	;***      166 : 	while(g_error != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	movw ax, !LOWW(_g_error)
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@7_3
.BB@LABEL@7_2:	; bb
	;***      167 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 167
	call !!_R_WDT_Restart
	br $.BB@LABEL@7_1
.BB@LABEL@7_3:	; return
	;***      168 : 	}
	;***      169 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 169
	ret
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      170 : void electrolyticOperationON(void){
	;***      171 : 	//Electrolytic operation ON
	;***      172 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	set1 0xFFF0E.2
	;***      173 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 173
	set1 0xFFF06.0
	;***      174 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	oneb !LOWW(_g_electrolytic_flag)
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      175 : }
	;***      176 : void electrolyticOperationOFF(void){
	;***      177 : 	//Electrolytic operation OFF
	;***      178 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 178
	clr1 0xFFF0E.2
	;***      179 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
	clr1 0xFFF06.0
	ret
_overVoltage1Error:
	.STACK _overVoltage1Error = 4
	;***      180 : 
	;***      181 : }
	;***      182 : void overVoltage1Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 182
	ret
_overVoltage2Error:
	.STACK _overVoltage2Error = 4
	;***      183 : 
	;***      184 : }
	;***      185 : void overVoltage2Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	ret
_overVoltage3Error:
	.STACK _overVoltage3Error = 16
	;***      186 : 
	;***      187 : }
	;***      188 : void overVoltage3Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	subw sp, #0x08
	clrw ax
.BB@LABEL@12_1:	; entry
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
	;***      189 : 	uint16_t _time_count = 0;
	;***      190 : 
	;***      191 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	;***      192 : 	_time_count = 0;
	;***      193 : 	while((g_cvcc_voltge < 2.0)&(_time_count < 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 193
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
.BB@LABEL@12_2:	; bb9
	clrb a
.BB@LABEL@12_3:	; bb9
	cmp0 x
	oneb x
	sknz
.BB@LABEL@12_4:	; bb9
	clrb x
.BB@LABEL@12_5:	; bb9
	or x, a
	bnz $.BB@LABEL@12_8
.BB@LABEL@12_6:	; bb9
	movw ax, [sp+0x00]
	cmpw ax, #0x03E8
	bnc $.BB@LABEL@12_8
.BB@LABEL@12_7:	; bb
	;***      194 : 		_time_count++;
	;***      195 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      196 : 		g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	incw ax
	br $.BB@LABEL@12_1
.BB@LABEL@12_8:	; bb19
	movw ax, [sp+0x00]
	;***      197 : 	}
	;***      198 : 	if(_time_count == 1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	cmpw ax, #0x03E8
	bnz $.BB@LABEL@12_10
.BB@LABEL@12_9:	; if_then_bb
	onew ax
	;***      199 : 		//Alarm
	;***      200 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	movw !LOWW(_g_error), ax
	;***      201 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 201
	call $!_electrolyticOperationOFF
	;***      202 : 		waitReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	addw sp, #0x08
	br $!_waitReset
.BB@LABEL@12_10:	; return
	;***      203 : 	}
	;***      204 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	addw sp, #0x08
	ret
_lowVoltageError:
	.STACK _lowVoltageError = 16
	;***      205 : void lowVoltageError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 205
	subw sp, #0x08
	;***      206 : 	uint16_t _time_count;
	;***      207 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 207
	set1 0xFFF01.7
	;***      208 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 208
	set1 0xFFF0E.2
	;***      209 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 209
	set1 0xFFF06.0
	;***      210 : 	delay(60);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	mov a, #0x3C
	call !!_delay
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
	movw ax, #0x3E4C
	;***      211 : 
	;***      212 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	;***      213 : 	_time_count = 0;
	;***      214 : 	while((g_cvcc_voltge < 0.2)&(_time_count < 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
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
	;***      215 : 		_time_count++;
	;***      216 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      217 : 		g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 217
	incw ax
	br $.BB@LABEL@13_1
.BB@LABEL@13_8:	; bb19
	movw ax, [sp+0x00]
	;***      218 : 	}
	;***      219 : 	if(_time_count == 1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	cmpw ax, #0x03E8
	bnz $.BB@LABEL@13_10
.BB@LABEL@13_9:	; if_then_bb
	onew ax
	;***      220 : 		//Alarm
	;***      221 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 221
	movw !LOWW(_g_error), ax
	;***      222 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	addw sp, #0x08
	br $!_electrolyticOperationOFF
.BB@LABEL@13_10:	; return
	;***      223 : 	}
	;***      224 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 224
	addw sp, #0x08
	ret
_currentError:
	.STACK _currentError = 18
	;***      225 : void currentError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	subw sp, #0x0A
	;***      226 : 	uint16_t _time_count;
	;***      227 : 	g_cvcc_current = (float)g_adc_value[0]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
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
	;***      228 : 	if((g_cvcc_current<g_numberSetting.lowerCurrent)|(g_cvcc_current>g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	movw ax, !LOWW(_g_numberSetting+0x0000E)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0000C)
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fgt
	addw sp, #0x04
	cmp0 a
	movw bc, !LOWW(_g_numberSetting+0x00012)
	movw ax, !LOWW(_g_numberSetting+0x00010)
	bnz $.BB@LABEL@14_2
.BB@LABEL@14_1:	; entry
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_flt
	addw sp, #0x04
	cmp0 a
	skz
.BB@LABEL@14_2:	; if_then_bb
	;***      229 : 		//Alarm
	;***      230 : 		g_alarm = CURRENT_INVALID;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	mov !LOWW(_g_alarm), #0x06
.BB@LABEL@14_3:	; bb20
	;***      231 : 	}
	;***      232 : 	while((g_cvcc_current<g_numberSetting.lowerCurrent)|(g_cvcc_current>g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 232
	movw ax, !LOWW(_g_numberSetting+0x0000E)
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0000C)
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_fgt
	addw sp, #0x04
	cmp0 a
	movw bc, !LOWW(_g_numberSetting+0x00012)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_numberSetting+0x00010)
	movw [sp+0x06], ax
	bnz $.BB@LABEL@14_9
.BB@LABEL@14_4:	; bb20
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
.BB@LABEL@14_5:	; bb20
	clrb a
.BB@LABEL@14_6:	; bb20
	cmp0 x
	oneb x
	sknz
.BB@LABEL@14_7:	; bb20
	clrb x
.BB@LABEL@14_8:	; bb20
	or x, a
	bnz $.BB@LABEL@14_10
.BB@LABEL@14_9:	; bb
	;***      233 : 		_time_count++;
	;***      234 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 234
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      235 : 		g_cvcc_current = (float)g_adc_value[0]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 235
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
	br $.BB@LABEL@14_3
.BB@LABEL@14_10:	; bb33
	onew ax
	;***      236 : 	}
	;***      237 : 	if(_time_count == 6000){
	;***      238 : 		//Alarm
	;***      239 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 239
	movw !LOWW(_g_error), ax
	;***      240 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	call $!_electrolyticOperationOFF
	;***      241 : 		waitReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	addw sp, #0x0A
	br $!_waitReset
_solenoidValueError:
	.STACK _solenoidValueError = 4
	;***      242 : 	}
	;***      243 : }
	;***      244 : void solenoidValueError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	ret
_callAlarm:
	.STACK _callAlarm = 4
	;***      245 : 
	;***      246 : }
	;***      247 : void callAlarm(int _error){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	movw !LOWW(_g_error), ax
	;***      248 : 	g_error = _error;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 248
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 26
	;***      249 : }
	;***      250 : float measureFlowSensor(uint32_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 250
	push bc
	push ax
	subw sp, #0x0E
	;***      251 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
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
.BB@LABEL@17_1:	; bb28
	movw ax, [sp+0x0E]
	;***      252 : 	float flow_pluse = 0.0;
	;***      253 : 	uint8_t flow_pulse_state = 1;
	;***      254 : 	while(!ns_delay_ms(&stamp_flow_sensor, (s*1000))){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
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
	bnz $.BB@LABEL@17_7
.BB@LABEL@17_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      255 : 		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 255
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@17_6
.BB@LABEL@17_3:	; if_then_bb
	;***      256 : 			if(I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@17_5
.BB@LABEL@17_4:	; if_then_bb21
	movw ax, #0x3F80
	;***      257 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
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
.BB@LABEL@17_5:	; if_break_bb
	;***      258 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 258
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@17_6:	; if_break_bb27
	;***      259 : 		}
	;***      260 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 260
	call !!_R_WDT_Restart
	br $.BB@LABEL@17_1
.BB@LABEL@17_7:	; bb40
	movw ax, #0x3F33
	;***      261 : 	}
	;***      262 : 	float flow_value = (flow_pluse*0.7*60)/(1000*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
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
	;***      263 : 	return flow_value;
	;***      264 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	addw sp, #0x16
	ret
	;***      265 : 
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
	.DS (28)
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
