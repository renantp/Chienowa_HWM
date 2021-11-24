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
#@  compiled at Wed Nov 24 15:37:31 2021

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
_FlowSensorCheck:
	.STACK _FlowSensorCheck = 18
	;***      102 : uint8_t FlowSensorCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 102
	subw sp, #0x0A
	;***      103 : 	delay(15);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 103
	mov a, #0x0F
	call !!_delay
	;***      104 : 	g_flow_value = measureFlowSensor(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 104
	clrw bc
	movw ax, #0x0005
	call $!_measureFlowSensor
	movw [sp+0x02], ax
	movw !LOWW(_g_flow_value), ax
	movw ax, bc
	movw [sp+0x00], ax
	movw !LOWW(_g_flow_value+0x00002), ax
	;***      105 : 	if((g_flow_value < g_numberSetting.upperFlow)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 105
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
.BB@LABEL@4_1:	; entry
	clrb a
.BB@LABEL@4_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@4_3:	; entry
	clrb x
.BB@LABEL@4_4:	; entry
	or x, a
	movw bc, !LOWW(_g_numberSetting+0x0001A)
	movw ax, bc
	movw [sp+0x08], ax
	movw ax, !LOWW(_g_numberSetting+0x00018)
	movw [sp+0x06], ax
	bnz $.BB@LABEL@4_12
.BB@LABEL@4_5:	; entry
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
.BB@LABEL@4_6:	; entry
	clrb a
.BB@LABEL@4_7:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@4_8:	; entry
	clrb x
.BB@LABEL@4_9:	; entry
	or x, a
	bnz $.BB@LABEL@4_12
.BB@LABEL@4_10:	; bb14
	;***      106 : 			&(g_flow_value > g_numberSetting.lowerFlow)){
	;***      107 : 		return 1;
	;***      108 : 	}else{
	;***      109 : 		sendToRasPi(H_ALARM, FLOW_SENSOR_ERROR, 1);
	;***      110 : 		return 0;
	;***      111 : 	}
	;***      112 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 112
	oneb a
.BB@LABEL@4_11:	; bb14
	addw sp, #0x0A
	ret
.BB@LABEL@4_12:	; if_else_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 109
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4101
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 110
	clrb a
	br $.BB@LABEL@4_11
_WaterSupplyOperation:
	.STACK _WaterSupplyOperation = 4
	;***      113 : void WaterSupplyOperation(void){
	;***      114 : 	O_SPOUT_WATER_PIN = ON;		// SV2 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 114
	set1 0xFFF05.5
	;***      115 : 	delay(30);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 115
	mov a, #0x1E
	call !!_delay
	;***      116 : 	O_SUPPLY_WATER_PIN = ON;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 116
	set1 0xFFF01.7
	;***      117 : 	delay_ms(500);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 117
	clrw bc
	movw ax, #0x01F4
	call !!_delay_ms
	;***      118 : 	O_SPOUT_WATER_PIN = OFF;	// SV2 Off
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 118
	clr1 0xFFF05.5
.BB@LABEL@5_1:	; bb1
	;***      119 : 	while(FlowSensorCheck() != 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 119
	call $!_FlowSensorCheck
	dec a
	bnz $.BB@LABEL@5_1
.BB@LABEL@5_2:	; bb5
	;***      120 : 		//TODO: Adjust
	;***      121 : 
	;***      122 : 	}
	;***      123 : 	delay(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 123
	mov a, #0x0A
	br !!_delay
_Voltage1Check:
	.STACK _Voltage1Check = 18
	;***      124 : }
	;***      125 : void Voltage1Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 125
	subw sp, #0x0A
	;***      126 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 126
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
	;***      127 : 	if(g_cvcc_voltge>=g_numberSetting.upperVoltage1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 127
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
.BB@LABEL@6_1:	; entry
	clrb a
.BB@LABEL@6_2:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@6_3:	; entry
	clrb x
.BB@LABEL@6_4:	; entry
	or x, a
	bnz $.BB@LABEL@6_6
.BB@LABEL@6_5:	; if_then_bb
	;***      128 : 		//Alarm
	;***      129 : 		g_alarm = OVER_VOLTAGE_1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	mov !LOWW(_g_alarm), #0x02
	;***      130 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	call $!_electrolyticOperationOFF
	;***      131 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 131
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4102
	addw sp, #0x0A
	br $!_sendToRasPi
.BB@LABEL@6_6:	; return
	;***      132 : 		//TODO: Wait to reset
	;***      133 : 	}
	;***      134 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	addw sp, #0x0A
	ret
_Voltage2Check:
	.STACK _Voltage2Check = 20
	;***      135 : void Voltage2Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 135
	subw sp, #0x0C
	clrw ax
.BB@LABEL@7_1:	; entry
	movw [sp+0x00], ax
.BB@LABEL@7_2:	; bb4
	clrw ax
	;***      136 : 	uint16_t _time_count = 0;
	;***      137 : 	do{
	;***      138 : 		_time_count = 0;
	;***      139 : 		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 139
	cmpw ax, !LOWW(_g_timerSetting+0x00012)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@7_3:	; bb4
	cmpw ax, !LOWW(_g_timerSetting+0x00010)
.BB@LABEL@7_4:	; bb4
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
	movw [sp+0x04], ax
	bnc $.BB@LABEL@7_11
.BB@LABEL@7_5:	; bb4
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
.BB@LABEL@7_6:	; bb4
	clrb a
.BB@LABEL@7_7:	; bb4
	cmp0 x
	oneb x
	sknz
.BB@LABEL@7_8:	; bb4
	clrb x
.BB@LABEL@7_9:	; bb4
	or x, a
	bnz $.BB@LABEL@7_11
.BB@LABEL@7_10:	; bb2
	;***      140 : 			_time_count++;
	;***      141 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 140
	incw ax
	br $.BB@LABEL@7_1
.BB@LABEL@7_11:	; bb17
	movw ax, [sp+0x00]
	;***      142 : 		}
	;***      143 : 		if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 143
	cmpw ax, #0x2710
	bnz $.BB@LABEL@7_13
.BB@LABEL@7_12:	; if_then_bb
	clrw ax
	movw [sp+0x00], ax
	;***      144 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_2, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4103
	call $!_sendToRasPi
	br $.BB@LABEL@7_2
.BB@LABEL@7_13:	; return
	;***      145 : 		}
	;***      146 : 	}while(_time_count == 10000);
	;***      147 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	addw sp, #0x0C
	ret
_Voltage3Check:
	.STACK _Voltage3Check = 20
	;***      148 : void Voltage3Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	subw sp, #0x0C
	clrw ax
.BB@LABEL@8_1:	; entry
	movw [sp+0x00], ax
	clrw ax
	;***      149 : 	uint16_t _time_count = 0;
	;***      150 : 	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 150
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@8_2:	; bb3
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@8_3:	; bb3
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
	bnc $.BB@LABEL@8_10
.BB@LABEL@8_4:	; bb3
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
.BB@LABEL@8_5:	; bb3
	clrb a
.BB@LABEL@8_6:	; bb3
	cmp0 x
	oneb x
	sknz
.BB@LABEL@8_7:	; bb3
	clrb x
.BB@LABEL@8_8:	; bb3
	or x, a
	bnz $.BB@LABEL@8_10
.BB@LABEL@8_9:	; bb
	;***      151 : 		_time_count++;
	;***      152 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@8_1
.BB@LABEL@8_10:	; bb16
	movw ax, [sp+0x00]
	;***      153 : 	}
	;***      154 : 	if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 154
	cmpw ax, #0x2710
	bnz $.BB@LABEL@8_12
.BB@LABEL@8_11:	; if_then_bb
	;***      155 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_3, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 155
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	;***      156 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 156
	addw sp, #0x0C
	br $!_electrolyticOperationOFF
.BB@LABEL@8_12:	; return
	;***      157 : 		//TODO: Wait to reset
	;***      158 : 	}
	;***      159 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 159
	addw sp, #0x0C
	ret
_LowVoltageCheck:
	.STACK _LowVoltageCheck = 20
	;***      160 : void LowVoltageCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 160
	subw sp, #0x0C
	;***      161 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 161
	call $!_electrolyticOperationON
.BB@LABEL@9_1:	; bb2
	;***      162 : 	while(g_neutralization_time > 60000);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	movw ax, !LOWW(_g_neutralization_time+0x00002)
	clrw bc
	cmpw ax, bc
	movw ax, !LOWW(_g_neutralization_time)
	sknz
.BB@LABEL@9_2:	; bb2
	cmpw ax, #0xEA61
.BB@LABEL@9_3:	; bb2
	bnc $.BB@LABEL@9_1
.BB@LABEL@9_4:	; bb2.bb9_crit_edge
	clrw ax
.BB@LABEL@9_5:	; bb2.bb9_crit_edge
	movw [sp+0x00], ax
	;***      163 : 	uint16_t _time_count = 0;
	;***      164 : 	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 164
	movw ax, !LOWW(_g_numberSetting+0x0000E)
	movw [sp+0x04], ax
	push ax
	movw ax, !LOWW(_g_numberSetting+0x0000C)
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
	call !!__COM_fgt
	addw sp, #0x04
	mov x, a
	mov a, [sp+0x02]
	cmp0 a
	oneb a
	sknz
.BB@LABEL@9_6:	; bb9
	clrb a
.BB@LABEL@9_7:	; bb9
	cmp0 x
	oneb x
	sknz
.BB@LABEL@9_8:	; bb9
	clrb x
.BB@LABEL@9_9:	; bb9
	or x, a
	bnz $.BB@LABEL@9_12
.BB@LABEL@9_10:	; bb9
	movw ax, [sp+0x00]
	cmpw ax, #0x2710
	bnc $.BB@LABEL@9_12
.BB@LABEL@9_11:	; bb6
	;***      165 : 		_time_count++;
	;***      166 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 166
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	incw ax
	br $.BB@LABEL@9_5
.BB@LABEL@9_12:	; bb21
	movw ax, [sp+0x00]
	;***      167 : 	}
	;***      168 : 	if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
	cmpw ax, #0x2710
	bnz $.BB@LABEL@9_14
.BB@LABEL@9_13:	; if_then_bb
	;***      169 : 		sendToRasPi(H_ALARM, UNDER_VOLTAGE, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 169
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      170 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
	addw sp, #0x0C
	br $!_electrolyticOperationOFF
.BB@LABEL@9_14:	; return
	;***      171 : 		//TODO: Wait to reset
	;***      172 : 	}
	;***      173 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 173
	addw sp, #0x0C
	ret
_LowCurrentCheck:
	.STACK _LowCurrentCheck = 20
	;***      174 : void LowCurrentCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 174
	subw sp, #0x0C
	;***      175 : 	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
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
	bnz $.BB@LABEL@10_6
.BB@LABEL@10_1:	; entry
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
.BB@LABEL@10_2:	; entry
	clrb a
.BB@LABEL@10_3:	; entry
	cmp0 x
	oneb x
	sknz
.BB@LABEL@10_4:	; entry
	clrb x
.BB@LABEL@10_5:	; entry
	or x, a
	bnz $.BB@LABEL@10_15
.BB@LABEL@10_6:	; if_then_bb
	clrw ax
	movw [sp+0x00], ax
	;***      176 : 		sendToRasPi(H_ALARM, CURRENT_INVALID, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 176
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4106
	call $!_sendToRasPi
.BB@LABEL@10_7:	; bb14
	;***      177 : 		uint16_t _time_count = 0;
	;***      178 : 		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 178
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
.BB@LABEL@10_8:	; bb14
	clrb a
.BB@LABEL@10_9:	; bb14
	cmp0 x
	oneb x
	sknz
.BB@LABEL@10_10:	; bb14
	clrb x
.BB@LABEL@10_11:	; bb14
	or x, a
	bnz $.BB@LABEL@10_14
.BB@LABEL@10_12:	; bb14
	movw ax, [sp+0x00]
	cmpw ax, #0x2710
	bnc $.BB@LABEL@10_14
.BB@LABEL@10_13:	; bb
	;***      179 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      180 : 			_time_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@10_7
.BB@LABEL@10_14:	; bb26
	movw ax, [sp+0x00]
	;***      181 : 		}
	;***      182 : 		if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 182
	cmpw ax, #0x2710
.BB@LABEL@10_15:	; bb26
	bnz $.BB@LABEL@10_17
.BB@LABEL@10_16:	; if_then_bb31
	;***      183 : 			sendToRasPi(H_ALARM, OVER_CURRENT, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 183
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      184 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	addw sp, #0x0C
	br $!_electrolyticOperationOFF
.BB@LABEL@10_17:	; return
	;***      185 : 			//TODO: Wait to reset
	;***      186 : 		}
	;***      187 : 	}
	;***      188 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	addw sp, #0x0C
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
	;***      189 : void ElectrolyticOperation(void){
	;***      190 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 190
	set1 0xFFF01.7
	;***      191 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 191
	set1 0xFFF0E.2
	;***      192 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 192
	set1 0xFFF06.0
	;***      193 : 	//-----------Voltage 1 check----------------
	;***      194 : 	Voltage1Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 194
	call $!_Voltage1Check
	;***      195 : 	//-----------Voltage 2 check----------------
	;***      196 : 	Voltage2Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	call $!_Voltage2Check
	;***      197 : 	//-----------Voltage 3 check----------------
	;***      198 : 	Voltage3Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	call $!_Voltage3Check
	;***      199 : 	//----------Low voltage error check--------------
	;***      200 : 	LowVoltageCheck();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	call $!_LowVoltageCheck
	;***      201 : 	//----------Current Error check------------------
	;***      202 : 	LowCurrentCheck();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	call $!_LowCurrentCheck
	;***      203 : 	//----------CVCC Alarm Input---------------------
	;***      204 : 	if(I_CVCC_ALARM_IN == 0U){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@11_2
.BB@LABEL@11_1:	; if_then_bb
	;***      205 : 		sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 205
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410F
	call $!_sendToRasPi
	;***      206 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 206
	br $!_electrolyticOperationOFF
.BB@LABEL@11_2:	; return
	;***      207 : 		//TODO: Wait Reset
	;***      208 : 	}
	;***      209 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 209
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      210 : void solenoidCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	subw sp, #0x04
	;***      211 : 	uint32_t _time_count = 0;
	;***      212 : 	if((g_flow_value <= 0.1f)&(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
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
	bnz $.BB@LABEL@12_3
.BB@LABEL@12_1:	; entry
	bc $.BB@LABEL@12_3
.BB@LABEL@12_2:	; entry
	movw ax, #0x3DCC
	push ax
	movw ax, #0xCCCD
	push ax
	movw ax, de
	call !!__COM_fle
	addw sp, #0x04
	cmp0 a
	bnz $.BB@LABEL@12_4
.BB@LABEL@12_3:	; entry.if_break_bb_crit_edge
	clrw ax
	movw [sp+0x02], ax
	movw [sp+0x00], ax
	br $.BB@LABEL@12_5
.BB@LABEL@12_4:	; if_then_bb
	onew ax
	movw [sp+0x02], ax
	decw ax
	movw [sp+0x00], ax
	;***      213 : 		_time_count++;
	;***      214 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 214
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@12_5:	; if_break_bb
	;***      215 : 	}
	;***      216 : 	if(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
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
.BB@LABEL@12_6:	; if_break_bb
	cmpw ax, de
.BB@LABEL@12_7:	; if_break_bb
	addw sp, #0x04
	bnz $.BB@LABEL@12_9
.BB@LABEL@12_8:	; if_then_bb20
	;***      217 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 217
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4108
	br $!_sendToRasPi
.BB@LABEL@12_9:	; return
	;***      218 : 	}
	;***      219 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 219
	ret
_main_20211111:
	.STACK _main_20211111 = 4
	;***      220 : // Newest
	;***      221 : void main_20211111(void){
	;***      222 : 	InitialOperationModeStart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	call $!_InitialOperationModeStart
	;***      223 : 	WaterSupplyOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 223
	call $!_WaterSupplyOperation
.BB@LABEL@13_1:	; bb
	;***      224 : 	do{
	;***      225 : 		ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	call $!_ElectrolyticOperation
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 224
	and a, 0xFFF07
	xor a, #0x01
	mov x, a
	mov a, 0xFFF07
	shr a, 0x03
	and a, #0x01
	xor a, #0x01
	or a, x
	bnz $.BB@LABEL@13_1
.BB@LABEL@13_2:	; bb15
	;***      226 : 	}while((I_ALKALI_H_PIN == 0U)|(I_ACID_H_PIN == 0U));
	;***      227 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	call $!_electrolyticOperationOFF
	;***      228 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 228
	set1 0xFFF0E.2
	;***      229 : 	O_PUMP_SALT_PIN = OFF; 		//SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	clr1 0xFFF06.0
	;***      230 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	mov a, #0x05
	call !!_delay
	;***      231 : 	O_SUPPLY_WATER_PIN = OFF;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	clr1 0xFFF01.7
	ret
_waitReset:
	.STACK _waitReset = 4
.BB@LABEL@14_1:	; bb1
	;***      232 : }
	;***      233 : 
	;***      234 : void waitReset(void){
	;***      235 : 	while(g_error != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 235
	movw ax, !LOWW(_g_error)
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@14_3
.BB@LABEL@14_2:	; bb
	;***      236 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
	call !!_R_WDT_Restart
	br $.BB@LABEL@14_1
.BB@LABEL@14_3:	; return
	;***      237 : 	}
	;***      238 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 238
	ret
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      239 : void electrolyticOperationON(void){
	;***      240 : 	//Electrolytic operation ON
	;***      241 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	set1 0xFFF0E.2
	;***      242 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 242
	set1 0xFFF06.0
	;***      243 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 243
	oneb !LOWW(_g_electrolytic_flag)
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      244 : }
	;***      245 : void electrolyticOperationOFF(void){
	;***      246 : 	//Electrolytic operation OFF
	;***      247 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	clr1 0xFFF0E.2
	;***      248 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 248
	clr1 0xFFF06.0
	;***      249 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
	clrb !LOWW(_g_electrolytic_flag)
	ret
_overVoltage1Error:
	.STACK _overVoltage1Error = 4
	;***      250 : }
	;***      251 : void overVoltage1Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	ret
_overVoltage2Error:
	.STACK _overVoltage2Error = 4
	;***      252 : 
	;***      253 : }
	;***      254 : void overVoltage2Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	ret
_overVoltage3Error:
	.STACK _overVoltage3Error = 16
	;***      255 : 
	;***      256 : }
	;***      257 : void overVoltage3Error(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 257
	subw sp, #0x08
	clrw ax
.BB@LABEL@19_1:	; entry
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
	;***      258 : 	uint16_t _time_count = 0;
	;***      259 : 
	;***      260 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	;***      261 : 	_time_count = 0;
	;***      262 : 	while((g_cvcc_voltge < 2.0)&(_time_count < 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
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
.BB@LABEL@19_2:	; bb9
	clrb a
.BB@LABEL@19_3:	; bb9
	cmp0 x
	oneb x
	sknz
.BB@LABEL@19_4:	; bb9
	clrb x
.BB@LABEL@19_5:	; bb9
	or x, a
	bnz $.BB@LABEL@19_8
.BB@LABEL@19_6:	; bb9
	movw ax, [sp+0x00]
	cmpw ax, #0x03E8
	bnc $.BB@LABEL@19_8
.BB@LABEL@19_7:	; bb
	;***      263 : 		_time_count++;
	;***      264 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      265 : 		g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	incw ax
	br $.BB@LABEL@19_1
.BB@LABEL@19_8:	; bb19
	movw ax, [sp+0x00]
	;***      266 : 	}
	;***      267 : 	if(_time_count == 1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 267
	cmpw ax, #0x03E8
	bnz $.BB@LABEL@19_10
.BB@LABEL@19_9:	; if_then_bb
	onew ax
	;***      268 : 		//Alarm
	;***      269 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 269
	movw !LOWW(_g_error), ax
	;***      270 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
	call $!_electrolyticOperationOFF
	;***      271 : 		waitReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 271
	addw sp, #0x08
	br $!_waitReset
.BB@LABEL@19_10:	; return
	;***      272 : 	}
	;***      273 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 273
	addw sp, #0x08
	ret
_lowVoltageError:
	.STACK _lowVoltageError = 16
	;***      274 : void lowVoltageError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 274
	subw sp, #0x08
	;***      275 : 	uint16_t _time_count;
	;***      276 : 	O_SUPPLY_WATER_PIN = ON; //SV1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	set1 0xFFF01.7
	;***      277 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 277
	set1 0xFFF0E.2
	;***      278 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 278
	set1 0xFFF06.0
	;***      279 : 	delay(60);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 279
	mov a, #0x3C
	call !!_delay
	clrw ax
.BB@LABEL@20_1:	; entry
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
	;***      280 : 
	;***      281 : 	g_cvcc_voltge = (float)g_adc_value[1]/512;
	;***      282 : 	_time_count = 0;
	;***      283 : 	while((g_cvcc_voltge < 0.2)&(_time_count < 1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
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
.BB@LABEL@20_2:	; bb9
	clrb a
.BB@LABEL@20_3:	; bb9
	cmp0 x
	oneb x
	sknz
.BB@LABEL@20_4:	; bb9
	clrb x
.BB@LABEL@20_5:	; bb9
	or x, a
	bnz $.BB@LABEL@20_8
.BB@LABEL@20_6:	; bb9
	movw ax, [sp+0x00]
	cmpw ax, #0x03E8
	bnc $.BB@LABEL@20_8
.BB@LABEL@20_7:	; bb
	;***      284 : 		_time_count++;
	;***      285 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 285
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      286 : 		g_cvcc_voltge = (float)g_adc_value[1]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 286
	incw ax
	br $.BB@LABEL@20_1
.BB@LABEL@20_8:	; bb19
	movw ax, [sp+0x00]
	;***      287 : 	}
	;***      288 : 	if(_time_count == 1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	cmpw ax, #0x03E8
	bnz $.BB@LABEL@20_10
.BB@LABEL@20_9:	; if_then_bb
	onew ax
	;***      289 : 		//Alarm
	;***      290 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 290
	movw !LOWW(_g_error), ax
	;***      291 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	addw sp, #0x08
	br $!_electrolyticOperationOFF
.BB@LABEL@20_10:	; return
	;***      292 : 	}
	;***      293 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 293
	addw sp, #0x08
	ret
_currentError:
	.STACK _currentError = 18
	;***      294 : void currentError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 294
	subw sp, #0x0A
	;***      295 : 	uint16_t _time_count;
	;***      296 : 	g_cvcc_current = (float)g_adc_value[0]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
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
	;***      297 : 	if((g_cvcc_current<g_numberSetting.lowerCurrent)|(g_cvcc_current>g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
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
	bnz $.BB@LABEL@21_2
.BB@LABEL@21_1:	; entry
	push bc
	push ax
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x06]
	call !!__COM_flt
	addw sp, #0x04
	cmp0 a
	skz
.BB@LABEL@21_2:	; if_then_bb
	;***      298 : 		//Alarm
	;***      299 : 		g_alarm = CURRENT_INVALID;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	mov !LOWW(_g_alarm), #0x06
.BB@LABEL@21_3:	; bb20
	;***      300 : 	}
	;***      301 : 	while((g_cvcc_current<g_numberSetting.lowerCurrent)|(g_cvcc_current>g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
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
	bnz $.BB@LABEL@21_9
.BB@LABEL@21_4:	; bb20
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
.BB@LABEL@21_5:	; bb20
	clrb a
.BB@LABEL@21_6:	; bb20
	cmp0 x
	oneb x
	sknz
.BB@LABEL@21_7:	; bb20
	clrb x
.BB@LABEL@21_8:	; bb20
	or x, a
	bnz $.BB@LABEL@21_10
.BB@LABEL@21_9:	; bb
	;***      302 : 		_time_count++;
	;***      303 : 		delay_ms(10);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
	clrw bc
	movw ax, #0x000A
	call !!_delay_ms
	;***      304 : 		g_cvcc_current = (float)g_adc_value[0]/512;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 304
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
	br $.BB@LABEL@21_3
.BB@LABEL@21_10:	; bb33
	onew ax
	;***      305 : 	}
	;***      306 : 	if(_time_count == 6000){
	;***      307 : 		//Alarm
	;***      308 : 		g_error = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 308
	movw !LOWW(_g_error), ax
	;***      309 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 309
	call $!_electrolyticOperationOFF
	;***      310 : 		waitReset();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 310
	addw sp, #0x0A
	br $!_waitReset
_solenoidValueError:
	.STACK _solenoidValueError = 4
	;***      311 : 	}
	;***      312 : }
	;***      313 : void solenoidValueError(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	ret
_callAlarm:
	.STACK _callAlarm = 4
	;***      314 : 
	;***      315 : }
	;***      316 : void callAlarm(int _error){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 316
	movw !LOWW(_g_error), ax
	;***      317 : 	g_error = _error;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 317
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 26
	;***      318 : }
	;***      319 : float measureFlowSensor(uint32_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 319
	push bc
	push ax
	subw sp, #0x0E
	;***      320 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 320
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
.BB@LABEL@24_1:	; bb28
	movw ax, [sp+0x0E]
	;***      321 : 	float flow_pluse = 0.0;
	;***      322 : 	uint8_t flow_pulse_state = 1;
	;***      323 : 	while(!ns_delay_ms(&stamp_flow_sensor, (s*1000))){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 323
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
	bnz $.BB@LABEL@24_7
.BB@LABEL@24_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      324 : 		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 324
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@24_6
.BB@LABEL@24_3:	; if_then_bb
	;***      325 : 			if(I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@24_5
.BB@LABEL@24_4:	; if_then_bb21
	movw ax, #0x3F80
	;***      326 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 326
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
.BB@LABEL@24_5:	; if_break_bb
	;***      327 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 327
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@24_6:	; if_break_bb27
	;***      328 : 		}
	;***      329 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 329
	call !!_R_WDT_Restart
	br $.BB@LABEL@24_1
.BB@LABEL@24_7:	; bb40
	movw ax, #0x3F33
	;***      330 : 	}
	;***      331 : 	float flow_value = (flow_pluse*0.7*60)/(1000*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 331
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
	;***      332 : 	return flow_value;
	;***      333 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 333
	addw sp, #0x16
	ret
	;***      334 : 
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
