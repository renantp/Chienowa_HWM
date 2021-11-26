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
#@  compiled at Thu Nov 25 15:02:53 2021

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
	;***      129 : 		electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 129
	call $!_electrolyticOperationOFF
	;***      130 : 		sendToRasPi(H_ALARM, OVER_VOLTAGE_1, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 130
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4102
	addw sp, #0x0A
	br $!_sendToRasPi
.BB@LABEL@6_6:	; return
	;***      131 : 		//TODO: Wait to reset
	;***      132 : 	}
	;***      133 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 133
	addw sp, #0x0A
	ret
_Voltage2Check:
	.STACK _Voltage2Check = 24
	;***      134 : void Voltage2Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 134
	subw sp, #0x10
	br $!.BB@LABEL@7_18
.BB@LABEL@7_1:	; bb9
	;***      135 : 	uint16_t _time_count = 0;
	;***      136 : 	do{
	;***      137 : 		_time_count = 0;
	;***      138 : 		while((g_cvcc_voltge>=g_numberSetting.upperVoltage2)&(_time_count < g_timerSetting.t12_overVoltage2Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 138
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
.BB@LABEL@7_2:	; bb9
	cmpw ax, bc
.BB@LABEL@7_3:	; bb9
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
	bnc $.BB@LABEL@7_15
.BB@LABEL@7_4:	; bb9
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
.BB@LABEL@7_5:	; bb9
	clrb a
.BB@LABEL@7_6:	; bb9
	cmp0 x
	oneb x
	sknz
.BB@LABEL@7_7:	; bb9
	clrb x
.BB@LABEL@7_8:	; bb9
	or x, a
	bnz $.BB@LABEL@7_15
.BB@LABEL@7_9:	; bb2
	;***      139 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 139
	clrw bc
	onew ax
	call !!_delay_ms
	clrw ax
	;***      140 : 			_time_count++;
	;***      141 : 			if(_time_count == g_timerSetting.t12_overVoltage2Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
	cmpw ax, !LOWW(_g_timerSetting+0x00012)
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 140
	incw ax
	movw [sp+0x00], ax
	sknz
.BB@LABEL@7_10:	; bb2
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 141
	cmpw ax, !LOWW(_g_timerSetting+0x00010)
.BB@LABEL@7_11:	; bb2
	bnz $.BB@LABEL@7_13
.BB@LABEL@7_12:	; if_then_bb
	;***      142 : 				sendToRasPi(H_ALARM, OVER_VOLTAGE_2, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 142
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4103
	call $!_sendToRasPi
.BB@LABEL@7_13:	; if_break_bb
	;***      143 : 			}
	;***      144 : 			R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 144
	call !!_R_WDT_Restart
.BB@LABEL@7_14:	; if_break_bb
	br $.BB@LABEL@7_1
.BB@LABEL@7_15:	; bb23
	movw ax, [sp+0x0E]
	movw bc, ax
	clrw ax
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 136
	cmpw ax, bc
	movw ax, [sp+0x04]
	movw bc, ax
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@7_16:	; bb23
	cmpw ax, bc
.BB@LABEL@7_17:	; bb23
	bnz $.BB@LABEL@7_19
.BB@LABEL@7_18:	; bb23.bb9_crit_edge
	clrw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@7_14
.BB@LABEL@7_19:	; return
	;***      145 : 		}
	;***      146 : 	}while(_time_count == g_timerSetting.t12_overVoltage2Time);
	;***      147 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 147
	addw sp, #0x10
	ret
_Voltage3Check:
	.STACK _Voltage3Check = 20
	;***      148 : void Voltage3Check(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 148
	subw sp, #0x0C
	clrw ax
	movw [sp+0x00], ax
.BB@LABEL@8_1:	; bb8
	clrw ax
	;***      149 : 	uint16_t _time_count = 0;
	;***      150 : 	while((g_cvcc_voltge>=g_numberSetting.upperVoltage3)&(_time_count < g_timerSetting.t13_overVoltage3Time)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 150
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@8_2:	; bb8
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@8_3:	; bb8
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
	bnc $.BB@LABEL@8_14
.BB@LABEL@8_4:	; bb8
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
.BB@LABEL@8_5:	; bb8
	clrb a
.BB@LABEL@8_6:	; bb8
	cmp0 x
	oneb x
	sknz
.BB@LABEL@8_7:	; bb8
	clrb x
.BB@LABEL@8_8:	; bb8
	or x, a
	bnz $.BB@LABEL@8_14
.BB@LABEL@8_9:	; bb
	;***      151 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 151
	clrw bc
	onew ax
	call !!_delay_ms
	clrw ax
	;***      152 : 		_time_count++;
	;***      153 : 		if(_time_count == g_timerSetting.t13_overVoltage3Time){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	cmpw ax, !LOWW(_g_timerSetting+0x00016)
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 152
	incw ax
	movw [sp+0x00], ax
	sknz
.BB@LABEL@8_10:	; bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 153
	cmpw ax, !LOWW(_g_timerSetting+0x00014)
.BB@LABEL@8_11:	; bb
	bnz $.BB@LABEL@8_13
.BB@LABEL@8_12:	; if_then_bb
	;***      154 : 			sendToRasPi(H_ALARM, OVER_VOLTAGE_3, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 154
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4104
	call $!_sendToRasPi
	;***      155 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 155
	call $!_electrolyticOperationOFF
.BB@LABEL@8_13:	; if_break_bb
	;***      156 : 			//TODO: Wait to reset
	;***      157 : 		}
	;***      158 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 158
	call !!_R_WDT_Restart
	br $.BB@LABEL@8_1
.BB@LABEL@8_14:	; return
	;***      159 : 	}
	;***      160 : 
	;***      161 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 161
	addw sp, #0x0C
	ret
_LowVoltageCheck:
	.STACK _LowVoltageCheck = 20
	;***      162 : void LowVoltageCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 162
	subw sp, #0x0C
	;***      163 : 	electrolyticOperationON();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 163
	call $!_electrolyticOperationON
	;***      164 : //	while(g_neutralization_time > 60000);
	;***      165 : 	delay(60);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 165
	mov a, #0x3C
	call !!_delay
	clrw ax
	movw [sp+0x00], ax
.BB@LABEL@9_1:	; bb8
	clrw ax
	;***      166 : 	uint16_t _time_count = 0;
	;***      167 : 	while((g_cvcc_voltge <= g_numberSetting.lowerVoltage)&(_time_count < g_timerSetting.t15_lowVoltageDelayTime)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 167
	cmpw ax, !LOWW(_g_timerSetting+0x0001E)
	movw ax, [sp+0x00]
	sknz
.BB@LABEL@9_2:	; bb8
	cmpw ax, !LOWW(_g_timerSetting+0x0001C)
.BB@LABEL@9_3:	; bb8
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
	call !!__COM_fgt
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
	;***      168 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 168
	clrw bc
	onew ax
	call !!_delay_ms
	clrw ax
	;***      169 : 		_time_count++;
	;***      170 : 		if(_time_count == g_timerSetting.t15_lowVoltageDelayTime){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
	cmpw ax, !LOWW(_g_timerSetting+0x0001E)
	movw ax, [sp+0x00]
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 169
	incw ax
	movw [sp+0x00], ax
	sknz
.BB@LABEL@9_10:	; bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 170
	cmpw ax, !LOWW(_g_timerSetting+0x0001C)
.BB@LABEL@9_11:	; bb
	bnz $.BB@LABEL@9_13
.BB@LABEL@9_12:	; if_then_bb
	;***      171 : 			sendToRasPi(H_ALARM, UNDER_VOLTAGE, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 171
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4105
	call $!_sendToRasPi
	;***      172 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 172
	call $!_electrolyticOperationOFF
.BB@LABEL@9_13:	; if_break_bb
	;***      173 : 			//TODO: Wait to reset
	;***      174 : 		}
	;***      175 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 175
	call !!_R_WDT_Restart
	br $.BB@LABEL@9_1
.BB@LABEL@9_14:	; return
	;***      176 : 	}
	;***      177 : 
	;***      178 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 178
	addw sp, #0x0C
	ret
_LowCurrentCheck:
	.STACK _LowCurrentCheck = 20
	;***      179 : void LowCurrentCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 179
	subw sp, #0x0C
	;***      180 : 	if((g_cvcc_current<=g_numberSetting.lowerCurrent)|(g_cvcc_current>=g_numberSetting.upperCurrent)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 180
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
	;***      181 : 		sendToRasPi(H_ALARM, CURRENT_INVALID, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 181
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4106
	call $!_sendToRasPi
.BB@LABEL@10_7:	; bb14
	;***      182 : 		uint16_t _time_count = 0;
	;***      183 : 		while((g_cvcc_current >= g_numberSetting.upperCurrent)&(_time_count < 10000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 183
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
	;***      184 : 			delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 184
	clrw bc
	onew ax
	call !!_delay_ms
	movw ax, [sp+0x00]
	;***      185 : 			_time_count++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 185
	incw ax
	movw [sp+0x00], ax
	br $.BB@LABEL@10_7
.BB@LABEL@10_14:	; bb26
	movw ax, [sp+0x00]
	;***      186 : 		}
	;***      187 : 		if(_time_count == 10000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 187
	cmpw ax, #0x2710
.BB@LABEL@10_15:	; bb26
	bnz $.BB@LABEL@10_17
.BB@LABEL@10_16:	; if_then_bb31
	;***      188 : 			sendToRasPi(H_ALARM, OVER_CURRENT, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 188
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4107
	call $!_sendToRasPi
	;***      189 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 189
	addw sp, #0x0C
	br $!_electrolyticOperationOFF
.BB@LABEL@10_17:	; return
	;***      190 : 			//TODO: Wait to reset
	;***      191 : 		}
	;***      192 : 	}
	;***      193 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 193
	addw sp, #0x0C
	ret
_ElectrolyticOperation:
	.STACK _ElectrolyticOperation = 4
.BB@LABEL@11_1:	; bb
	;***      194 : void ElectrolyticOperation(void){
	;***      195 : 	do{
	;***      196 : 		O_SUPPLY_WATER_PIN = ON; //SV1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 196
	set1 0xFFF01.7
	;***      197 : 		O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 197
	set1 0xFFF0E.2
	;***      198 : 		O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 198
	set1 0xFFF06.0
	;***      199 : 		//-----------Voltage 1 check----------------
	;***      200 : 		Voltage1Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 200
	call $!_Voltage1Check
	;***      201 : 		//-----------Voltage 2 check----------------
	;***      202 : 		Voltage2Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 202
	call $!_Voltage2Check
	;***      203 : 		//-----------Voltage 3 check----------------
	;***      204 : 		Voltage3Check();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 204
	call $!_Voltage3Check
	;***      205 : 		//----------Low voltage error check--------------
	;***      206 : 		LowVoltageCheck();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 206
	call $!_LowVoltageCheck
	;***      207 : 		//----------Current Error check------------------
	;***      208 : 		LowCurrentCheck();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 208
	call $!_LowCurrentCheck
	;***      209 : 		//----------CVCC Alarm Input---------------------
	;***      210 : 		if(I_CVCC_ALARM_IN == 0U){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 210
	mov a, 0xFFF00
	bt a.4, $.BB@LABEL@11_3
.BB@LABEL@11_2:	; if_then_bb
	;***      211 : 			sendToRasPi(H_ALARM, CVCC_ALARM, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 211
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410F
	call $!_sendToRasPi
	;***      212 : 			electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 212
	call $!_electrolyticOperationOFF
.BB@LABEL@11_3:	; if_break_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 195
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
	bnz $.BB@LABEL@11_1
.BB@LABEL@11_4:	; bb22
	;***      213 : 			//TODO: Wait Reset
	;***      214 : 		}
	;***      215 : 	}while((I_ACID_H_PIN == 0)|(I_ALKALI_H_PIN == 0));
	;***      216 : 	O_CVCC_ON_PIN = GPIO_ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 216
	set1 0xFFF0E.2
	ret
_solenoidCheck:
	.STACK _solenoidCheck = 12
	;***      217 : }
	;***      218 : void solenoidCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 218
	subw sp, #0x04
	;***      219 : 	uint32_t _time_count = 0;
	;***      220 : 	if((g_flow_value <= 0.1f)&(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000)){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 220
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
	;***      221 : 		_time_count++;
	;***      222 : 		delay_ms(1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 222
	clrw bc
	incw ax
	call !!_delay_ms
.BB@LABEL@12_5:	; if_break_bb
	;***      223 : 	}
	;***      224 : 	if(_time_count == g_timerSetting.t17_solenoidLeakageStartTime*1000){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 224
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
	;***      225 : 		sendToRasPi(H_ALARM, SOLENOID_VALVE_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 225
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4108
	br $!_sendToRasPi
.BB@LABEL@12_9:	; return
	;***      226 : 	}
	;***      227 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 227
	ret
_saltWaterTankFullCheck:
	.STACK _saltWaterTankFullCheck = 4
	;***      228 : void saltWaterTankFullCheck(void){
	;***      229 : 	if(I_SALT_H_PIN == 1){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 229
	mov a, 0xFFF05
	bt a.3, $.BB@LABEL@13_2
.BB@LABEL@13_1:	; return
	;***      230 : 		sendToRasPi(H_ALARM, SALT_WATER_FULL_ERROR, 1);
	;***      231 : 		electrolyticOperationOFF();
	;***      232 : 		//TODO: Fault in the flowchart
	;***      233 : 	}
	;***      234 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 234
	ret
.BB@LABEL@13_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 230
	movw de, #0x3F80
	clrw bc
	movw ax, #0x4109
	call $!_sendToRasPi
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 231
	br $!_electrolyticOperationOFF
_saltWaterTankEmptyCheck:
	.STACK _saltWaterTankEmptyCheck = 4
	;***      235 : void saltWaterTankEmptyCheck(void){
	;***      236 : 	if(I_SALT_L_PIN == 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 236
	mov a, 0xFFF05
	bt a.4, $.BB@LABEL@14_2
.BB@LABEL@14_1:	; if_then_bb
	;***      237 : 		sendToRasPi(H_ALARM, SALT_WATER_EMPTY_ERROR, 1);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 237
	movw de, #0x3F80
	clrw bc
	movw ax, #0x410A
	br $!_sendToRasPi
.BB@LABEL@14_2:	; return
	;***      238 : 		//TODO: Control OFF
	;***      239 : 	}
	;***      240 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 240
	ret
_acidWaterTankSkipCheck:
	.STACK _acidWaterTankSkipCheck = 4
	;***      241 : void acidWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 241
	movw de, #0xFF07
	;***      242 : 	if(((I_ACID_L_PIN == 0)&((I_ACID_M_PIN == 1)|(I_ACID_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 242
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
.BB@LABEL@15_1:	; return
	;***      243 : 			((I_ACID_M_PIN == 0)&(I_ACID_H_PIN == 1))){
	;***      244 : 		sendToRasPi(H_ALARM, ACID_ERROR, 1);
	;***      245 : 		//TODO: Control OFF
	;***      246 : 	}
	;***      247 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 247
	ret
.BB@LABEL@15_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 244
	movw de, #0x3F80
	movw ax, #0x410B
	br $!_sendToRasPi
_alkalineWaterTankSkipCheck:
	.STACK _alkalineWaterTankSkipCheck = 6
	;***      248 : void alkalineWaterTankSkipCheck(void){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 248
	push hl
	;***      249 : 	if(((I_ALKALI_L_PIN == 0)&((I_ALKALI_M_PIN == 1)|(I_ALKALI_H_PIN == 1)))|
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 249
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
.BB@LABEL@16_1:	; return
	;***      250 : 			((I_ALKALI_M_PIN == 0)&(I_ALKALI_H_PIN == 1))){
	;***      251 : 		sendToRasPi(H_ALARM, ALKALINE_ERROR, 1);
	;***      252 : 		//TODO: Control OFF
	;***      253 : 	}
	;***      254 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 254
	ret
.BB@LABEL@16_2:	; if_then_bb
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 251
	movw de, #0x3F80
	movw ax, #0x410C
	br $!_sendToRasPi
_waterTankFullCheck:
	.STACK _waterTankFullCheck = 4
	;***      255 : void waterTankFullCheck(void){
	;***      256 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 256
	br $_electrolyticOperationOFF
_main_20211111:
	.STACK _main_20211111 = 4
	;***      257 : 	//TODO: Hand Sensor Off
	;***      258 : 
	;***      259 : }
	;***      260 : // Newest
	;***      261 : void main_20211111(void){
	;***      262 : 	InitialOperationModeStart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 262
	call $!_InitialOperationModeStart
	;***      263 : 	WaterSupplyOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 263
	call $!_WaterSupplyOperation
.BB@LABEL@18_1:	; bb
	;***      264 : 	do{
	;***      265 : 		ElectrolyticOperation();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 265
	call $!_ElectrolyticOperation
	oneb a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 264
	and a, 0xFFF07
	xor a, #0x01
	mov x, a
	mov a, 0xFFF07
	shr a, 0x03
	and a, #0x01
	xor a, #0x01
	or a, x
	bnz $.BB@LABEL@18_1
.BB@LABEL@18_2:	; bb15
	;***      266 : 	}while((I_ALKALI_H_PIN == 0U)|(I_ACID_H_PIN == 0U));
	;***      267 : 	electrolyticOperationOFF();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 267
	call $!_electrolyticOperationOFF
	;***      268 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 268
	set1 0xFFF0E.2
	;***      269 : 	O_PUMP_SALT_PIN = OFF; 		//SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 269
	clr1 0xFFF06.0
	;***      270 : 	delay(5);
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 270
	mov a, #0x05
	call !!_delay
	;***      271 : 	O_SUPPLY_WATER_PIN = OFF;	// SV1 On
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 271
	clr1 0xFFF01.7
	ret
_waitReset:
	.STACK _waitReset = 4
.BB@LABEL@19_1:	; bb1
	;***      272 : }
	;***      273 : 
	;***      274 : void waitReset(void){
	;***      275 : 	while(g_error != 0){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 275
	movw ax, !LOWW(_g_error)
	clrw bc
	cmpw ax, bc
	bz $.BB@LABEL@19_3
.BB@LABEL@19_2:	; bb
	;***      276 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 276
	call !!_R_WDT_Restart
	br $.BB@LABEL@19_1
.BB@LABEL@19_3:	; return
	;***      277 : 	}
	;***      278 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 278
	ret
_electrolyticOperationON:
	.STACK _electrolyticOperationON = 4
	;***      279 : void electrolyticOperationON(void){
	;***      280 : 	//Electrolytic operation ON
	;***      281 : 	O_CVCC_ON_PIN = ON;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 281
	set1 0xFFF0E.2
	;***      282 : 	O_PUMP_SALT_PIN = ON; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 282
	set1 0xFFF06.0
	;***      283 : 	g_electrolytic_flag = 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 283
	oneb !LOWW(_g_electrolytic_flag)
	ret
_electrolyticOperationOFF:
	.STACK _electrolyticOperationOFF = 4
	;***      284 : }
	;***      285 : void electrolyticOperationOFF(void){
	;***      286 : 	//Electrolytic operation OFF
	;***      287 : 	O_CVCC_ON_PIN = OFF;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 287
	clr1 0xFFF0E.2
	;***      288 : 	O_PUMP_SALT_PIN = OFF; //SP1
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 288
	clr1 0xFFF06.0
	;***      289 : 	g_electrolytic_flag = 0;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 289
	clrb !LOWW(_g_electrolytic_flag)
	ret
_measureFlowSensor:
	.STACK _measureFlowSensor = 26
	;***      290 : }
	;***      291 : float measureFlowSensor(uint32_t s){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 291
	push bc
	push ax
	subw sp, #0x0E
	;***      292 : 	uint32_t stamp_flow_sensor = g_systemTime;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 292
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
.BB@LABEL@22_1:	; bb28
	movw ax, [sp+0x0E]
	;***      293 : 	float flow_pluse = 0.0;
	;***      294 : 	uint8_t flow_pulse_state = 1;
	;***      295 : 	while(!ns_delay_ms(&stamp_flow_sensor, (s*1000))){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 295
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
	bnz $.BB@LABEL@22_7
.BB@LABEL@22_2:	; bb
	mov a, [sp+0x02]
	mov x, a
	;***      296 : 		if(I_FLOW_PLUSE_PIN != flow_pulse_state){
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 296
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	cmp a, x
	bz $.BB@LABEL@22_6
.BB@LABEL@22_3:	; if_then_bb
	;***      297 : 			if(I_FLOW_PLUSE_PIN == 0)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 297
	mov a, 0xFFF00
	bt a.1, $.BB@LABEL@22_5
.BB@LABEL@22_4:	; if_then_bb21
	movw ax, #0x3F80
	;***      298 : 				flow_pluse++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 298
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
.BB@LABEL@22_5:	; if_break_bb
	;***      299 : 			flow_pulse_state = I_FLOW_PLUSE_PIN;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 299
	mov a, 0xFFF00
	shr a, 0x01
	and a, #0x01
	mov [sp+0x02], a
.BB@LABEL@22_6:	; if_break_bb27
	;***      300 : 		}
	;***      301 : 		R_WDT_Restart();
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 301
	call !!_R_WDT_Restart
	br $.BB@LABEL@22_1
.BB@LABEL@22_7:	; bb40
	movw ax, #0x3F33
	;***      302 : 	}
	;***      303 : 	float flow_value = (flow_pluse*0.7*60)/(1000*s); // L/minutes
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 303
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
	;***      304 : 	return flow_value;
	;***      305 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 305
	addw sp, #0x16
	ret
_CRC8:
	.STACK _CRC8 = 10
	;***      306 : char CRC8(const char *data,int length)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 306
	push bc
	subw sp, #0x04
	movw hl, ax
	clrb b
	clrw ax
	movw de, ax
	movw [sp+0x02], ax
.BB@LABEL@23_1:	; bb46
	movw ax, [sp+0x04]
	;***      307 : {
	;***      308 :    char crc = 0x00;
	;***      309 :    char extract;
	;***      310 :    char sum;
	;***      311 :    for(int i=0;i<length;i++)
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 311
	xor a, #0x80
	movw [sp+0x00], ax
	movw ax, de
	xor a, #0x80
	movw de, ax
	movw ax, [sp+0x00]
	xchw ax, de
	cmpw ax, de
	bnc $.BB@LABEL@23_8
.BB@LABEL@23_2:	; bb
	;***      312 :    {
	;***      313 :       extract = *data;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 313
	mov a, [hl]
	mov c, a
	mov x, #0x08
.BB@LABEL@23_3:	; bb9
	;***      314 :       for (char tempI = 8; tempI; tempI--)
	;***      315 :       {
	;***      316 :          sum = (crc ^ extract) & 0x01;
	;***      317 :          crc >>= 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 317
	mov a, b
	shr a, 0x01
	mov [sp+0x00], a
	mov a, c
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 316
	xor b, a
	mov a, b
	bf a.0, $.BB@LABEL@23_5
.BB@LABEL@23_4:	; if_then_bb
	mov a, [sp+0x00]
	;***      318 :          if (sum)
	;***      319 :             crc ^= 0x8C;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 319
	xor a, #0x8C
	mov [sp+0x00], a
.BB@LABEL@23_5:	; if_break_bb
	mov a, c
	;***      320 :          extract >>= 1;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 320
	shr a, 0x01
	mov c, a
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 314
	dec x
	bz $.BB@LABEL@23_7
.BB@LABEL@23_6:	; if_break_bb.bb9_crit_edge
	mov a, [sp+0x00]
	mov b, a
	br $.BB@LABEL@23_3
.BB@LABEL@23_7:	; bb41
	movw ax, [sp+0x02]
	;***      321 :       }
	;***      322 :       data++;
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 322
	incw ax
	movw de, ax
	movw [sp+0x02], ax
	incw hl
	mov a, [sp+0x00]
	mov b, a
	br $.BB@LABEL@23_1
.BB@LABEL@23_8:	; bb52
	;***      323 :    }
	;***      324 :    return crc;
	;***      325 : }
	.LINE "D:/Chieniwa/E2_Studio/ControlPCB_HWM/src/main.c", 325
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
